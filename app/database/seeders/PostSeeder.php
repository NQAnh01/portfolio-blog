<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Post;
use Illuminate\Support\Str;

class PostSeeder extends Seeder
{
    public function run(): void
    {
        for ($i = 1; $i <= 20; $i++) {
            Post::create([
                'user_id' => 1,
                'title' => "Bài viết số $i",
                'content' => "Đây là nội dung bài viết số $i. Nội dung được Faker tạo ra để test Vue frontend.",
                'slug' => Str::slug("bai-viet-so-$i"),
                'published_at' => now()->subDays(rand(0, 30)),
            ]);
        }
    }
}
