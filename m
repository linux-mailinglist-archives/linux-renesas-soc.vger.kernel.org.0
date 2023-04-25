Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 117376EE505
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Apr 2023 17:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234573AbjDYPwq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Apr 2023 11:52:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234383AbjDYPwp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Apr 2023 11:52:45 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 662C810EF;
        Tue, 25 Apr 2023 08:52:43 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,225,1677510000"; 
   d="scan'208";a="160702515"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 26 Apr 2023 00:52:42 +0900
Received: from localhost.localdomain (unknown [10.226.92.250])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0EA1C400EA80;
        Wed, 26 Apr 2023 00:52:39 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH 0/2] Add GPU cooling device support
Date:   Tue, 25 Apr 2023 16:52:35 +0100
Message-Id: <20230425155237.357592-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add GPU cooling device support for RZ/{G2L,G2LC,V2L} SMARC EVK.

This patch series is tested with [1],  [2] and [3]

Logs:
root@smarc-rzg2l:~# systemctl stop weston@root
root@smarc-rzg2l:~# kmscube
Using display 0xaaaacf0775e0 with EGL version 1.4
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
EGL information:
  version: "1.4"
  vendor: "Mesa Project"
  client extensions: "EGL_EXT_client_extensions EGL_EXT_device_base EGL_EXT=
_device_enumeration EGL_EXT_device_query EGL_EXT_platform_base EGL_KHR_clie=
nt_get_all_proc_addresses EGL_KHR_debug EGL_EXT_platform_device EGL_EXT_pla=
tform_wayland EGL_KHR_platform_wayland EGL_MESA_platform_gbm EGL_KHR_platfo=
rm_gbm EGL_MESA_platform_surfaceless"
  display extensions: "EGL_ANDROID_blob_cache EGL_EXT_buffer_age EGL_EXT_im=
age_dma_buf_import EGL_EXT_image_dma_buf_import_modifiers EGL_KHR_cl_event2=
 EGL_KHR_config_attribs EGL_KHR_create_context EGL_KHR_create_context_no_er=
ror EGL_KHR_fence_sync EGL_KHR_get_all_proc_addresses EGL_KHR_gl_colorspace=
 EGL_KHR_gl_renderbuffer_image EGL_KHR_gl_texture_2D_image EGL_KHR_gl_textu=
re_3D_image EGL_KHR_gl_texture_cubemap_image EGL_KHR_image EGL_KHR_image_ba=
se EGL_KHR_image_pixmap EGL_KHR_no_config_context EGL_KHR_partial_update EG=
L_KHR_reusable_sync EGL_KHR_surfaceless_context EGL_EXT_pixel_format_float =
EGL_KHR_wait_sync EGL_MESA_configless_context EGL_MESA_drm_image EGL_MESA_i=
mage_dma_buf_export EGL_MESA_query_driver EGL_WL_bind_wayland_display "
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
OpenGL ES 2.x information:
  version: "OpenGL ES 3.1 Mesa 21.3.0"
  shading language version: "OpenGL ES GLSL ES 3.10"
  vendor: "Panfrost"
  renderer: "Mali-G31 (Panfrost)"
  extensions: "GL_EXT_blend_minmax GL_EXT_multi_draw_arrays GL_EXT_texture_=
filter_anisotropic GL_EXT_texture_compression_rgtc GL_EXT_texture_format_BG=
RA8888 GL_OES_compressed_ETC1_RGB8_texture GL_OES_depth24 GL_OES_element_in=
dex_uint GL_OES_fbo_render_mipmap GL_OES_mapbuffer GL_OES_rgb8_rgba8 GL_OES=
_standard_derivatives GL_OES_stencil8 GL_OES_texture_3D GL_OES_texture_floa=
t GL_OES_texture_float_linear GL_OES_texture_half_float GL_OES_texture_half=
_float_linear GL_OES_texture_npot GL_OES_vertex_half_float GL_EXT_draw_inst=
anced GL_EXT_texture_sRGB_decode GL_OES_EGL_image GL_OES_depth_texture GL_O=
ES_packed_depth_stencil GL_EXT_texture_type_2_10_10_10_REV GL_NV_conditiona=
l_render GL_OES_get_program_binary GL_APPLE_texture_max_level GL_EXT_discar=
d_framebuffer GL_EXT_read_format_bgra GL_EXT_frag_depth GL_NV_fbo_color_att=
achments GL_OES_EGL_image_external GL_OES_EGL_sync GL_OES_vertex_array_obje=
ct GL_ANGLE_pack_reverse_row_order GL_EXT_occlusion_query_boolean GL_EXT_te=
xture_rg GL_EXT_unpack_subimage GL_NV_draw_buffers GL_NV_read_buffer GL_NV_=
read_depth GL_NV_read_depth_stencil GL_NV_read_stencil GL_EXT_draw_buffers =
GL_EXT_map_buffer_range GL_KHR_debug GL_KHR_texture_compression_astc_ldr GL=
_NV_pixel_buffer_object GL_OES_depth_texture_cube_map GL_OES_required_inter=
nalformat GL_OES_surfaceless_context GL_EXT_color_buffer_float GL_EXT_sRGB_=
write_control GL_EXT_separate_shader_objects GL_EXT_shader_framebuffer_fetc=
h GL_EXT_shader_implicit_conversions GL_EXT_shader_integer_mix GL_EXT_base_=
instance GL_EXT_compressed_ETC1_RGB8_sub_texture GL_EXT_draw_buffers_indexe=
d GL_EXT_draw_elements_base_vertex GL_EXT_gpu_shader5 GL_EXT_primitive_boun=
ding_box GL_EXT_shader_io_blocks GL_EXT_texture_border_clamp GL_EXT_texture=
_buffer GL_EXT_texture_view GL_KHR_blend_equation_advanced GL_KHR_blend_equ=
ation_advanced_coherent GL_KHR_context_flush_control GL_NV_image_formats GL=
_OES_draw_buffers_indexed GL_OES_draw_elements_base_vertex GL_OES_gpu_shade=
r5 GL_OES_primitive_bounding_box GL_OES_sample_shading GL_OES_sample_variab=
les GL_OES_shader_io_blocks GL_OES_shader_multisample_interpolation GL_OES_=
texture_border_clamp GL_OES_texture_buffer GL_OES_texture_stencil8 GL_OES_t=
exture_storage_multisample_2d_array GL_OES_texture_view GL_EXT_blend_func_e=
xtended GL_EXT_float_blend GL_EXT_texture_sRGB_R8 GL_EXT_texture_sRGB_RG8 G=
L_KHR_no_error GL_KHR_texture_compression_astc_sliced_3d GL_OES_EGL_image_e=
xternal_essl3 GL_OES_shader_image_atomic GL_EXT_multisampled_render_to_text=
ure GL_EXT_multisampled_render_to_texture2 GL_MESA_shader_integer_functions=
 GL_EXT_color_buffer_half_float GL_EXT_texture_mirror_clamp_to_edge GL_KHR_=
parallel_shader_compile GL_EXT_EGL_image_storage GL_EXT_shader_framebuffer_=
fetch_non_coherent GL_INTEL_blackhole_render GL_MESA_framebuffer_flip_y GL_=
EXT_depth_clamp GL_MESA_bgra "
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
^C
root@smarc-rzg2l:~# cat /proc/interrupts | grep panfrost
 82:         15          0     GICv3 185 Level     panfrost-gpu
 83:          2          0     GICv3 187 Level     panfrost-mmu
 84:      12667          0     GICv3 186 Level     panfrost-job
root@smarc-rzg2l:~# cat /sys/class/devfreq/11840000.gpu/trans_stat
     From  :   To
           :  50000000  62500000 100000000 125000000 200000000 250000000 40=
0000000 500000000   time(ms)
*  50000000:         0         0         0         0         0         0   =
      0         2       292
   62500000:         0         0         0         0         0         0   =
      0         0         0
  100000000:         0         0         0         0         0         0   =
      0         0         0
  125000000:         0         0         0         0         0         0   =
      0         1        56
  200000000:         0         0         0         0         0         0   =
      0       630     35624
  250000000:         0         0         0         1       540         0   =
      0         0     34484
  400000000:         0         0         0         0         0         0   =
      0         2       112
  500000000:         3         0         0         0        90       541   =
      2         0     36524
Total transition : 1812
root@smarc-rzg2l:~#

[1]
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=3D742810

[2]
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=3D742798

[3]=20
It is tested with below MESA patch, planning to mainline this after the=20
RZ/G2L DU driver[1] is mainlined.

 src/gallium/targets/dri/meson.build | 1 +
 src/gallium/targets/dri/target.c    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/src/gallium/targets/dri/meson.build b/src/gallium/targets/dri/=
meson.build
index f4d61f7b254..fbc85ca2fdd 100644
--- a/src/gallium/targets/dri/meson.build
+++ b/src/gallium/targets/dri/meson.build
@@ -84,6 +84,7 @@ foreach d : [[with_gallium_kmsro, [
                'mxsfb-drm_dri.so',
                'pl111_dri.so',
                'rcar-du_dri.so',
+               'rzg2l-du_dri.so',
                'repaper_dri.so',
                'rockchip_dri.so',
                'st7586_dri.so',
diff --git a/src/gallium/targets/dri/target.c b/src/gallium/targets/dri/tar=
get.c
index fb5798581db..41f45fd4ff4 100644
--- a/src/gallium/targets/dri/target.c
+++ b/src/gallium/targets/dri/target.c
@@ -113,6 +113,7 @@ DEFINE_LOADER_DRM_ENTRYPOINT(mi0283qt)
 DEFINE_LOADER_DRM_ENTRYPOINT(mxsfb_drm)
 DEFINE_LOADER_DRM_ENTRYPOINT(pl111)
 DEFINE_LOADER_DRM_ENTRYPOINT(rcar_du)
+DEFINE_LOADER_DRM_ENTRYPOINT(rzg2l_du)
 DEFINE_LOADER_DRM_ENTRYPOINT(repaper)
 DEFINE_LOADER_DRM_ENTRYPOINT(rockchip)
 DEFINE_LOADER_DRM_ENTRYPOINT(st7586)

Biju Das (2):
  arm64: dts: renesas: r9a07g044: Add gpu cooling device
  arm64: dts: renesas: r9a07g054: Add gpu cooling device

 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 6 ++++++
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi | 6 ++++++
 2 files changed, 12 insertions(+)

--=20
2.25.1

