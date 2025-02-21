package game

import rand "core:math/rand"

CHUNK_SIZE :: 16
CHUNK_SIZE_SQ :: CHUNK_SIZE * CHUNK_SIZE

Chunk :: struct {
    position: IVec2,
    blocks: [CHUNK_SIZE_SQ]Block,
}

chunk_fill :: proc(chunk: ^Chunk) {
    for &block in chunk.blocks {
        block = rand.choice_enum(Block)
        // block = .DIRT
    }
}

chunk_render :: proc(chunk: Chunk) {
    for block, rbi in chunk.blocks {
        rbx, rby := lin_to_xy(rbi, CHUNK_SIZE)

        if block != .AIR {
            x := BLOCK_SIZE * (chunk.position.x * CHUNK_SIZE + i32(rbx))
            y := BLOCK_SIZE * (chunk.position.y * CHUNK_SIZE + i32(rby))
            color := block_to_color(block)
            draw_rect({f32(x), f32(y)}, {BLOCK_SIZE, BLOCK_SIZE}, color_v4(color))
        }
    }
}
