Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D93437DE61C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Nov 2023 19:47:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344842AbjKAShT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Nov 2023 14:37:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344932AbjKAShS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Nov 2023 14:37:18 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2094.outbound.protection.outlook.com [40.107.113.94])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FAD6102;
        Wed,  1 Nov 2023 11:37:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UaXPn+DxZ9dngbxNzlf1HSuku6XHv0/2mLjnqZnEzNfWpDIfvMOf4EruSkyeMPm1H8jzfg1eDA+UHq994DULzliR+zmwJ3gopCMO931ldsA+F2Rf0sj1tKls+Kh39YS/tDjT5k46Q/nbV9CuJu+DTHGIIheZM72Y91XA/qaRnBN05uRQZh/Yi2edrowzpl1EMzcNBN28vkviOdRqNk9x4K7uJ7i28M6NHe0vHJUGd8BKkkAKn/FdeT+SoK80Szykl3bymFolF6qRQe926fU92hhrXCccxkEtEGcKbxwKf3afpGDsJZrqB438TrX5AoG+v5I4lqWVA/z75X9jX9rnYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/gJ4SU8hS6DttCT58l+4eCSXeEk3yiqm7QhJMtrD1Y=;
 b=JKm45DbUid8xFpuEGSZYHY/pUXgKPchGIpXLIpQ8xwuL77gsiq6yeMx3wn2fmADTxb6fQptuiivtV1GFPNk0bi1YtpSJ/uHCxLvfrllAMGP4CTAV2XW/dct07lCtM+2kGzQPDGe+1EeSTyAMDLqieLNWlvQfIJt+kZ8zm+xiAQXqHPimzSofSXO1Hi2aFU3ukp01GBX7kNSofhkGz2WXBesDyl1Nwbs53XeT7YARjaL2T7JSNjIm+Yzsex5GXd5Hj83Rq71pfwp5aOlXjDVTSGnmGUe4jHNjATYFfOpPxUY36J6hGiXy/nlj4+gbStIn3obtTcvF4++t0/NRriLbBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/gJ4SU8hS6DttCT58l+4eCSXeEk3yiqm7QhJMtrD1Y=;
 b=chUBpOAtaSBGesBmVpQXZrNZ+QNrDA9Ghf8Z6YMRgRQ/d5uYWqkOd8LuOqGCAt29a7u+VX2Sw8JGxsESxoOPFspg6YR1qj7+7H0r4yfVdldZ/7B50v4L91OTN+jYMJAETkSRpsgNJ7JLojIRAKIafdg73LfcCLe6+bKzzPeDLxw=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OS0PR01MB5859.jpnprd01.prod.outlook.com
 (2603:1096:604:b8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Wed, 1 Nov
 2023 18:37:05 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6cb:4ed9:b0be:36c0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6cb:4ed9:b0be:36c0%7]) with mapi id 15.20.6954.019; Wed, 1 Nov 2023
 18:37:02 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH 0/2] Add GPU cooling device support
Thread-Topic: [PATCH 0/2] Add GPU cooling device support
Thread-Index: AQHZd435cMaFRz1juUG0e0BEHszc17Bm898w
Date:   Wed, 1 Nov 2023 18:37:02 +0000
Message-ID: <TYCPR01MB11269BF61D52CD6C4C5EC915986A7A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20230425155237.357592-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230425155237.357592-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OS0PR01MB5859:EE_
x-ms-office365-filtering-correlation-id: d48ff482-0160-4189-5123-08dbdb098a23
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UePR6lynhrCWVv0xnE0bAPBdxRmsO89OtHoWsus3NP2EQWd4OOeeA/g1pOaSuBxP7YHDNezwGN/skh804PNEZ0vkLfEsHVn1PK7N8vM/yXyC1UZV9ErnGEG0NIEmaZ1NWAX/I1z9riGUclXW0ac8bGId6qDGEqOkzkH4gzbtKbIHHUuJYbgRDjpfhNWVUsF68piPb+R5IX/0r+zQAlvZywUYPZbMEPyxRkNp0zLao8FRjsZFiNWWGDxikCXZJsVtfHUr6AnI0l5AH5unppIeLkEBnXTcF1h+PQmdV4ES4sZRU3LwXEHpicmZZyyF2ecTw9NmvA0lTq3qqbVuBcmivoxSQfvurxYCizgoeY8Jz4g5ECenpmryGZN7fms2YWR77MJ816IqhUkwHRQxWeHww24nqppnVHq4613OkxA30csp1CuISdUJwj8Db/oh3qkRCAzsiz5py+2sU+Reu/aD6S97ygtgSdkSMEdW/shR4CQwpC5VBOa6HWyU80E6+5fngkmjSDbvedKTX/O4+TrRjWYkZhO3chRFxoluBFgqMpgT+0rBowa6FITXOmI2MIvPckPoo8yk1LIJ0Z1TYcPAKdu5AxtJC6veGvrq3ZWvghRG91G6onipvW5bFqV5cgOO2GCXcwivWGFtHzEKuPsVWhY1MFZq6/u1tnd3uZIEgdw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(136003)(39860400002)(396003)(230173577357003)(230922051799003)(230273577357003)(186009)(451199024)(64100799003)(1800799009)(26005)(9686003)(55016003)(38100700002)(38070700009)(33656002)(86362001)(122000001)(2906002)(5660300002)(83380400001)(7696005)(478600001)(107886003)(45080400002)(8676002)(6506007)(71200400001)(52536014)(8936002)(4326008)(966005)(66476007)(316002)(66446008)(66556008)(64756008)(54906003)(41300700001)(66946007)(76116006)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?M5gfWS4KaIKt7nVTkKuVnuQkDQSmKzdeOnxLV8GdgSPGQzcueUz9Z/4WJ49x?=
 =?us-ascii?Q?LY+YaHQKgm/usS8AoxyHvWqsJhS3+vms1nfNrIUAKpl7idkBVSaxctQczhIu?=
 =?us-ascii?Q?rtxO2JOaJggvpsLb4SZ3lEmkIIbfhRbJ/cVVNJaWMjjK6cnKC3xF6LjOEuFZ?=
 =?us-ascii?Q?tTVxqlsMT9NE97BmD9VB8h035zMlmfWUnslMVsiGbsXvoLQQ32jCRRltEsNM?=
 =?us-ascii?Q?NpVs6FtT5eHc7u8UebtSN/3Ff+T1so5PQignve9MmGT5ruukXXFyTv0UnxDL?=
 =?us-ascii?Q?L55JoLzsWXgRY0o0edY4dEbaG1EKu0tRZ7YyZziEfO7sxTke8mJBnNY7CpuW?=
 =?us-ascii?Q?TIHJlO/dKDOmJAQ/NOipyzf73tB2n0g6pU+LHi9aYrwzhixXGVxAue6BWOYH?=
 =?us-ascii?Q?uWrkZURvLjEanD43jP4hFEIM5IBOuihX1fqi4ORlVX9Tz1BVp8lxAfWv3DcB?=
 =?us-ascii?Q?cf+EcR9m4uRvz38HGalNf/iwZ9Ot1Mu7JP4rnEe4sHjLMDUbFC46/A0FvreC?=
 =?us-ascii?Q?aS+mQP2wDvsZ142rJC412OGKgVy0ZC19o0HBYmIxFCDBNByM2e/+naK51f/F?=
 =?us-ascii?Q?SlzgSgNWc8wLk6cRlnAvEmoyBkWxwHTeMQcp2/OdaxruHwCEEMffX4cthE/A?=
 =?us-ascii?Q?a9j91jBUugIyM3iKk/zmneEdp2pNkrZ+dP/RuD7vsdJuVJbYIDSt8P1yDFO7?=
 =?us-ascii?Q?/5GDgAx23tO6gqAc+Zu+abpefsCPId6mnYTwGE5pz4Fcr9Z1+fQhvqiJ0k1B?=
 =?us-ascii?Q?sp8xvNs+TfE4ZWY9h+0i2P4ngak6OanWtFnJYcVTtP1qWuEb2vvSVdiC6Rkb?=
 =?us-ascii?Q?gUiCKh+9ON6XXgunEkD37xD5I7yxYkJZYGaZEBpzIsFixxRmI19WbbM8xQbe?=
 =?us-ascii?Q?CW4ZJi4H7lcx2O/952J/s4U29eOUtyImmI1RbSXRfIu5e1LlWbD82SDwJtZa?=
 =?us-ascii?Q?d9C2Bb7MzMurnurnri4mzWhJwLqdG70j+xImmm3H7bgSy8Iuy9UGWk7KCbKk?=
 =?us-ascii?Q?sDxMUfu/qBIzswNhsaIR7kFeUrjihP5RUuFbPzPmCQ4gsv2Ek8PuY3ICvMJV?=
 =?us-ascii?Q?RxDR4l+2bCRUOKvhwS8ngD0sYNvqUlUzvamVgbCSJZCcPhoB5GslbbDwbpR+?=
 =?us-ascii?Q?XWkDdMh1tJGmFKTm/sQKQIdLaKR9ul+06BZlh2YWtGxbf8X9lj4ISmzQaxYu?=
 =?us-ascii?Q?ptZEtF/89xzo2Zwiap/Ag542Cs4WY4IadkcMqXiOA+Z01HQU3dlsYl9uE/SY?=
 =?us-ascii?Q?pjteczAYArGLGdFm72H2QBGPvYxiOo/uhBjkvvT8fzPmBhHD0rmVQkIApL3k?=
 =?us-ascii?Q?U/kRlkYwdLlbbkXfnHKFBXAXmhoxESQ5j9Xay6Zmma4tpr/qIDJNIpWu/KdN?=
 =?us-ascii?Q?6I3HXEzryyhO6EVCaOivDDrcAAFLBRnpIaXghRMQobK+xemSUjBnHMxiorWw?=
 =?us-ascii?Q?N2LjHhJbd6wQXd5GkSbGk+A/VWcRUBaQN/+apD1nWIkHUmU4x4o4TywwmZp1?=
 =?us-ascii?Q?Tgeo7Iar5FgKwLOgasDSnaR5PgSE0eZ4r8Mad3Cb8SqlZ3FB9NxA/A0oDJQp?=
 =?us-ascii?Q?Hq/paH0w0fkRl9QXxDCpKNwOy+ljfncR6vSQ8w5K?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d48ff482-0160-4189-5123-08dbdb098a23
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2023 18:37:02.1642
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: duqv+GoSy5PRY5tSYVcIEImSIAqNK83AVhf1cXSngtqojNykqpdS/NJLhiI2rbOFASZwTgf5jKPMA61KyWBvOI9P11otbyAhZmIXOlRNpF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5859
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

> Subject: [PATCH 0/2] Add GPU cooling device support
>=20
> Add GPU cooling device support for RZ/{G2L,G2LC,V2L} SMARC EVK.

I would like to drop this patch series as there is no thermal
Sensor unit available in mali gpu and there is no point in
Throttling GPU on high temp for the cases like GPU is on light load, but ot=
her loads on the system is very high.

Cheers,
Biju

>=20
> This patch series is tested with [1],  [2] and [3]
>=20
> Logs:
> root@smarc-rzg2l:~# systemctl stop weston@root root@smarc-rzg2l:~# kmscub=
e
> Using display 0xaaaacf0775e0 with EGL version 1.4
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> EGL information:
>   version: "1.4"
>   vendor: "Mesa Project"
>   client extensions: "EGL_EXT_client_extensions EGL_EXT_device_base
> EGL_EXT_device_enumeration EGL_EXT_device_query EGL_EXT_platform_base
> EGL_KHR_client_get_all_proc_addresses EGL_KHR_debug EGL_EXT_platform_devi=
ce
> EGL_EXT_platform_wayland EGL_KHR_platform_wayland EGL_MESA_platform_gbm
> EGL_KHR_platform_gbm EGL_MESA_platform_surfaceless"
>   display extensions: "EGL_ANDROID_blob_cache EGL_EXT_buffer_age
> EGL_EXT_image_dma_buf_import EGL_EXT_image_dma_buf_import_modifiers
> EGL_KHR_cl_event2 EGL_KHR_config_attribs EGL_KHR_create_context
> EGL_KHR_create_context_no_error EGL_KHR_fence_sync
> EGL_KHR_get_all_proc_addresses EGL_KHR_gl_colorspace
> EGL_KHR_gl_renderbuffer_image EGL_KHR_gl_texture_2D_image
> EGL_KHR_gl_texture_3D_image EGL_KHR_gl_texture_cubemap_image EGL_KHR_imag=
e
> EGL_KHR_image_base EGL_KHR_image_pixmap EGL_KHR_no_config_context
> EGL_KHR_partial_update EGL_KHR_reusable_sync EGL_KHR_surfaceless_context
> EGL_EXT_pixel_format_float EGL_KHR_wait_sync EGL_MESA_configless_context
> EGL_MESA_drm_image EGL_MESA_image_dma_buf_export EGL_MESA_query_driver
> EGL_WL_bind_wayland_display "
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> OpenGL ES 2.x information:
>   version: "OpenGL ES 3.1 Mesa 21.3.0"
>   shading language version: "OpenGL ES GLSL ES 3.10"
>   vendor: "Panfrost"
>   renderer: "Mali-G31 (Panfrost)"
>   extensions: "GL_EXT_blend_minmax GL_EXT_multi_draw_arrays
> GL_EXT_texture_filter_anisotropic GL_EXT_texture_compression_rgtc
> GL_EXT_texture_format_BGRA8888 GL_OES_compressed_ETC1_RGB8_texture
> GL_OES_depth24 GL_OES_element_index_uint GL_OES_fbo_render_mipmap
> GL_OES_mapbuffer GL_OES_rgb8_rgba8 GL_OES_standard_derivatives
> GL_OES_stencil8 GL_OES_texture_3D GL_OES_texture_float
> GL_OES_texture_float_linear GL_OES_texture_half_float
> GL_OES_texture_half_float_linear GL_OES_texture_npot
> GL_OES_vertex_half_float GL_EXT_draw_instanced GL_EXT_texture_sRGB_decode
> GL_OES_EGL_image GL_OES_depth_texture GL_OES_packed_depth_stencil
> GL_EXT_texture_type_2_10_10_10_REV GL_NV_conditional_render
> GL_OES_get_program_binary GL_APPLE_texture_max_level
> GL_EXT_discard_framebuffer GL_EXT_read_format_bgra GL_EXT_frag_depth
> GL_NV_fbo_color_attachments GL_OES_EGL_image_external GL_OES_EGL_sync
> GL_OES_vertex_array_object GL_ANGLE_pack_reverse_row_order
> GL_EXT_occlusion_query_boolean GL_EXT_texture_rg GL_EXT_unpack_subimage
> GL_NV_draw_buffers GL_NV_read_buffer GL_NV_read_depth
> GL_NV_read_depth_stencil GL_NV_read_stencil GL_EXT_draw_buffers
> GL_EXT_map_buffer_range GL_KHR_debug GL_KHR_texture_compression_astc_ldr
> GL_NV_pixel_buffer_object GL_OES_depth_texture_cube_map
> GL_OES_required_internalformat GL_OES_surfaceless_context
> GL_EXT_color_buffer_float GL_EXT_sRGB_write_control
> GL_EXT_separate_shader_objects GL_EXT_shader_framebuffer_fetch
> GL_EXT_shader_implicit_conversions GL_EXT_shader_integer_mix
> GL_EXT_base_instance GL_EXT_compressed_ETC1_RGB8_sub_texture
> GL_EXT_draw_buffers_indexed GL_EXT_draw_elements_base_vertex
> GL_EXT_gpu_shader5 GL_EXT_primitive_bounding_box GL_EXT_shader_io_blocks
> GL_EXT_texture_border_clamp GL_EXT_texture_buffer GL_EXT_texture_view
> GL_KHR_blend_equation_advanced GL_KHR_blend_equation_advanced_coherent
> GL_KHR_context_flush_control GL_NV_image_formats
> GL_OES_draw_buffers_indexed GL_OES_draw_elements_base_vertex
> GL_OES_gpu_shader5 GL_OES_primitive_bounding_box GL_OES_sample_shading
> GL_OES_sample_variables GL_OES_shader_io_blocks
> GL_OES_shader_multisample_interpolation GL_OES_texture_border_clamp
> GL_OES_texture_buffer GL_OES_texture_stencil8
> GL_OES_texture_storage_multisample_2d_array GL_OES_texture_view
> GL_EXT_blend_func_extended GL_EXT_float_blend GL_EXT_texture_sRGB_R8
> GL_EXT_texture_sRGB_RG8 GL_KHR_no_error
> GL_KHR_texture_compression_astc_sliced_3d GL_OES_EGL_image_external_essl3
> GL_OES_shader_image_atomic GL_EXT_multisampled_render_to_texture
> GL_EXT_multisampled_render_to_texture2 GL_MESA_shader_integer_functions
> GL_EXT_color_buffer_half_float GL_EXT_texture_mirror_clamp_to_edge
> GL_KHR_parallel_shader_compile GL_EXT_EGL_image_storage
> GL_EXT_shader_framebuffer_fetch_non_coherent GL_INTEL_blackhole_render
> GL_MESA_framebuffer_flip_y GL_EXT_depth_clamp GL_MESA_bgra "
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ^C
> root@smarc-rzg2l:~# cat /proc/interrupts | grep panfrost
>  82:         15          0     GICv3 185 Level     panfrost-gpu
>  83:          2          0     GICv3 187 Level     panfrost-mmu
>  84:      12667          0     GICv3 186 Level     panfrost-job
> root@smarc-rzg2l:~# cat /sys/class/devfreq/11840000.gpu/trans_stat
>      From  :   To
>            :  50000000  62500000 100000000 125000000 200000000 250000000
> 400000000 500000000   time(ms)
> *  50000000:         0         0         0         0         0         0
> 0         2       292
>    62500000:         0         0         0         0         0         0
> 0         0         0
>   100000000:         0         0         0         0         0         0
> 0         0         0
>   125000000:         0         0         0         0         0         0
> 0         1        56
>   200000000:         0         0         0         0         0         0
> 0       630     35624
>   250000000:         0         0         0         1       540         0
> 0         0     34484
>   400000000:         0         0         0         0         0         0
> 0         2       112
>   500000000:         3         0         0         0        90       541
> 2         0     36524
> Total transition : 1812
> root@smarc-rzg2l:~#
>=20
> [1]
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatch=
work
> .kernel.org%2Fproject%2Flinux-renesas-
> soc%2Flist%2F%3Fseries%3D742810&data=3D05%7C01%7Cbiju.das.jz%40bp.renesas=
.com
> %7C96654dd2de224f1721f408db45a51b15%7C53d82571da1947e49cb4625a166a4a2a%7C=
0%
> 7C0%7C638180347643845748%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQ=
Ij
> oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DMK9BBWar=
eYh%
> 2BnLpSAV%2Fjfmt7Gz8p%2FQ1yqVoHFMyqHsk%3D&reserved=3D0
>=20
> [2]
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatch=
work
> .kernel.org%2Fproject%2Flinux-renesas-
> soc%2Flist%2F%3Fseries%3D742798&data=3D05%7C01%7Cbiju.das.jz%40bp.renesas=
.com
> %7C96654dd2de224f1721f408db45a51b15%7C53d82571da1947e49cb4625a166a4a2a%7C=
0%
> 7C0%7C638180347643845748%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQ=
Ij
> oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DnkFiesy1=
lTKM
> bUn7x6CzDvPXOmXQAm9jEGk304cgOB8%3D&reserved=3D0
>=20
> [3]
> It is tested with below MESA patch, planning to mainline this after the
> RZ/G2L DU driver[1] is mainlined.
>=20
>  src/gallium/targets/dri/meson.build | 1 +
>  src/gallium/targets/dri/target.c    | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/src/gallium/targets/dri/meson.build
> b/src/gallium/targets/dri/meson.build
> index f4d61f7b254..fbc85ca2fdd 100644
> --- a/src/gallium/targets/dri/meson.build
> +++ b/src/gallium/targets/dri/meson.build
> @@ -84,6 +84,7 @@ foreach d : [[with_gallium_kmsro, [
>                 'mxsfb-drm_dri.so',
>                 'pl111_dri.so',
>                 'rcar-du_dri.so',
> +               'rzg2l-du_dri.so',
>                 'repaper_dri.so',
>                 'rockchip_dri.so',
>                 'st7586_dri.so',
> diff --git a/src/gallium/targets/dri/target.c
> b/src/gallium/targets/dri/target.c
> index fb5798581db..41f45fd4ff4 100644
> --- a/src/gallium/targets/dri/target.c
> +++ b/src/gallium/targets/dri/target.c
> @@ -113,6 +113,7 @@ DEFINE_LOADER_DRM_ENTRYPOINT(mi0283qt)
>  DEFINE_LOADER_DRM_ENTRYPOINT(mxsfb_drm)
>  DEFINE_LOADER_DRM_ENTRYPOINT(pl111)
>  DEFINE_LOADER_DRM_ENTRYPOINT(rcar_du)
> +DEFINE_LOADER_DRM_ENTRYPOINT(rzg2l_du)
>  DEFINE_LOADER_DRM_ENTRYPOINT(repaper)
>  DEFINE_LOADER_DRM_ENTRYPOINT(rockchip)
>  DEFINE_LOADER_DRM_ENTRYPOINT(st7586)
>=20
> Biju Das (2):
>   arm64: dts: renesas: r9a07g044: Add gpu cooling device
>   arm64: dts: renesas: r9a07g054: Add gpu cooling device
>=20
>  arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 6 ++++++
> arch/arm64/boot/dts/renesas/r9a07g054.dtsi | 6 ++++++
>  2 files changed, 12 insertions(+)
>=20
> --
> 2.25.1

