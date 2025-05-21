-- Images table schema
-- This table stores recipe images

CREATE TABLE IF NOT EXISTS "public"."images" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "recipe_id" "uuid",
    "image_url" "text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "timezone"('utc'::"text", "now"()) NOT NULL,
    "order" integer NOT NULL,
    CONSTRAINT "images_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "images_recipe_id_fkey" FOREIGN KEY ("recipe_id") REFERENCES "public"."recipes"("id") ON DELETE CASCADE
);

-- Enable Row Level Security
ALTER TABLE "public"."images" ENABLE ROW LEVEL SECURITY;

-- Create policies
CREATE POLICY "Users can view their own recipe images" 
    ON "public"."images" 
    FOR SELECT 
    USING (EXISTS (
        SELECT 1 FROM "public"."recipes"
        WHERE "recipes"."id" = "images"."recipe_id" 
        AND "recipes"."user_id" = "auth"."uid"()
    ));

CREATE POLICY "Users can insert their own recipe images" 
    ON "public"."images" 
    FOR INSERT 
    WITH CHECK (EXISTS (
        SELECT 1 FROM "public"."recipes"
        WHERE "recipes"."id" = "images"."recipe_id" 
        AND "recipes"."user_id" = "auth"."uid"()
    ));

CREATE POLICY "Users can update their own recipe images" 
    ON "public"."images" 
    FOR UPDATE 
    USING (EXISTS (
        SELECT 1 FROM "public"."recipes"
        WHERE "recipes"."id" = "images"."recipe_id" 
        AND "recipes"."user_id" = "auth"."uid"()
    ));

CREATE POLICY "Users can delete their own recipe images" 
    ON "public"."images" 
    FOR DELETE 
    USING (EXISTS (
        SELECT 1 FROM "public"."recipes"
        WHERE "recipes"."id" = "images"."recipe_id" 
        AND "recipes"."user_id" = "auth"."uid"()
    ));

-- Grant permissions
GRANT ALL ON TABLE "public"."images" TO "anon";
GRANT ALL ON TABLE "public"."images" TO "authenticated";
GRANT ALL ON TABLE "public"."images" TO "service_role"; 