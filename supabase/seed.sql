insert into auth.users (
  instance_id,
  id,
  aud,
  role,
  email,
  encrypted_password,
  raw_app_meta_data,
  raw_user_meta_data,
  created_at
) values (
  '00000000-0000-0000-0000-000000000000',
  '29f710b8-3d03-4ae9-961b-904093795f2b',
  'authenticated',
  'authenticated',
  'williamrsault@gmail.com',
  '$2a$10$sUunTZSEeya8RbmDYcqey.5a6BenpGnKbnXLUJLAx12zwey5iCsna',
  '{"provider":"email","providers":["email"]}',
  '{"sub":"29f710b8-3d03-4ae9-961b-904093795f2b","email":"williamrsault@gmail.com","username":"Will","email_verified":true,"phone_verified":false}',
  timezone('utc'::text, now())
);

insert into auth.identities (
  id,
  user_id,
  identity_data,
  provider,
  provider_id,
  created_at
) values (
  '29f710b8-3d03-4ae9-961b-904093795f2b',
  '29f710b8-3d03-4ae9-961b-904093795f2b',
  '{"sub":"29f710b8-3d03-4ae9-961b-904093795f2b","email":"williamrsault@gmail.com","username":"Will","email_verified":true,"phone_verified":false}',
  'email',
  '29f710b8-3d03-4ae9-961b-904093795f2b',
  timezone('utc'::text, now())
);

