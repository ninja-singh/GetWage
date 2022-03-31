import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseCredentials {
  static const String APIKEY =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InN5bHFtYmZyeHJ0dGt6dnVhcnlwIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NDgxOTIwMzIsImV4cCI6MTk2Mzc2ODAzMn0.pWJgPyn4_4MLj2Gg2pzXsKSd9KZczDFbhAjxlpmbIe4";
  static const String APIURL = "https://sylqmbfrxrttkzvuaryp.supabase.co";

  static SupabaseClient supabaseClient = SupabaseClient(APIURL, APIKEY);
}
