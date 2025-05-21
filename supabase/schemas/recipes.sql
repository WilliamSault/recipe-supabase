-- Recipes table schema
-- This table stores recipe information

CREATE TABLE IF NOT EXISTS "public"."recipes" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "user_id" "uuid" NOT NULL,
    "title" "text" NOT NULL,
    "date" "text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "recipes_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "recipes_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE
);

-- Enable Row Level Security
ALTER TABLE "public"."recipes" ENABLE ROW LEVEL SECURITY;

-- Create policies
CREATE POLICY "Users can view their own recipes" 
    ON "public"."recipes" 
    FOR SELECT 
    USING ("auth"."uid"() = "user_id");

CREATE POLICY "Users can insert their own recipes" 
    ON "public"."recipes" 
    FOR INSERT 
    WITH CHECK ("auth"."uid"() = "user_id");

CREATE POLICY "Users can update their own recipes" 
    ON "public"."recipes" 
    FOR UPDATE 
    USING ("auth"."uid"() = "user_id");

CREATE POLICY "Users can delete their own recipes" 
    ON "public"."recipes" 
    FOR DELETE 
    USING ("auth"."uid"() = "user_id");

-- Grant permissions
GRANT ALL ON TABLE "public"."recipes" TO "anon";
GRANT ALL ON TABLE "public"."recipes" TO "authenticated";
GRANT ALL ON TABLE "public"."recipes" TO "service_role"; 