Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E07C7A19B4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Sep 2023 10:55:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233585AbjIOIzz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Sep 2023 04:55:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233587AbjIOIzN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Sep 2023 04:55:13 -0400
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [IPv6:2a02:1800:120:4::f00:11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 257F630C3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Sep 2023 01:54:28 -0700 (PDT)
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by gauss.telenet-ops.be (Postfix) with ESMTPS id 4Rn7KY0PfTz4x9fd
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Sep 2023 10:54:25 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7135:da8b:ba1d:1a7c])
        by andre.telenet-ops.be with bizsmtp
        id m8uE2A0073q21w7018uEem; Fri, 15 Sep 2023 10:54:24 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qh4aJ-003lFs-3L;
        Fri, 15 Sep 2023 10:54:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qh4ac-00Gdag-2x;
        Fri, 15 Sep 2023 10:54:14 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-fbdev@vger.kernel.org,
        linux-sh@vger.kernel.org
Subject: [PATCH v4 00/41] drm: renesas: shmobile: Atomic conversion + DT support
Date:   Fri, 15 Sep 2023 10:53:15 +0200
Message-Id: <cover.1694767208.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

It has been 3 years since the last conversion of a DRM driver to atomic
modesetting, so I guess it's time for another one? ;-)

Currently, there are two drivers for the LCD controller on Renesas
SuperH-based and ARM-based SH-Mobile and R-Mobile SoCs:
  1. sh_mobile_lcdcfb, using the fbdev framework,
  2. shmob_drm, using the DRM framework.
However, only the former driver is used, as all platform support
integrates the former.  None of these drivers support DT-based systems.

This patch series converts the SH-Mobile DRM driver to atomic
modesetting, and adds DT support, complemented by the customary set of
fixes and improvements.

Overview:
  - Patch 1 adds a separate maintainer entry.
  - Patch 2 adds DT bindings for the SH-Mobile LCD controller,
  - Patch 3 adds definitions for RGB666 9:9 media bus formats,
  - Patches 4-35 contains miscellaneous fixes, improvements, and
    cleanups for the SH-Mobile DRM driver,
  - Patches 36-40 convert the SH-Mobile DRM driver to atomic
    modesetting,
  - Patch 41 adds DT support to the SH-Mobile DRM driver.

To reduce strain on the audience, I have CCed the DT and media people
only on the cover letter and the DT resp. media patches.  If interested,
the full series should be available through lore.kernel.org.

Some comments and questions can be found in the individual patches.

Changes compared to v3[1]:
  - Rebase on top of v6.6-rc1 and commit 775b0669e19f2e4a
    ("drm/shmobile: Convert to platform remove callback returning void")
    in drm-misc/for-linux-next.

Changes compared to v2[2]:
  - Add Reviewed-by.

Changes compared to v1[3]:
  - New patches:
      - "[PATCH v2 01/41] MAINTAINER: Create entry for Renesas SH-Mobile
	 DRM drivers",
      - "[PATCH v2 18/41] drm: renesas: shmobile: Remove custom plane
	 destroy callback",
  - Add myself as co-maintainer,
  - Make fck clock required,
  - Drop ports description referring to obsolete graph.txt,
  - Condition ports to compatible strings,
  - Drop label and status from example,
  - Add Reviewed-by,
  - Drop unused MEDIA_BUS_FMT_RGB666_2X9_LE, as requested by Laurent,
  - Move explicit clock handling to Runtime PM callbacks,
  - Move devm_pm_runtime_enable() after shmob_drm_setup_clocks(),
  - Depend on PM,
  - Split off removal of call to drm_plane_force_disable(),
  - Select VIDEOMODE_HELPERS,
  - Keep table instead of replacing it by a switch() statement,
  - Fix shmob_drm_interface_data.bus_fmt comment,
  - Drop superfluous blank lines,
  - Keep initialization of info fields together,
  - Use shmob_drm_bus_fmts[],
  - Keep bus format validation at probe time,
  - Pass plane type to shmob_drm_plane_create() to avoid having to shift
    all overlay plane indices by one,
  - Rename primary_plane_funcs to shmob_drm_primary_plane_funcs,
  - Rename shmob_drm_plane_funcs to shmob_drm_overlay_plane_funcs,
  - Move shmob_drm_crtc_finish_page_flip() further up,
  - Inline shmob_drm_crtc_st{art,op}(),
  - Use devm_drm_of_get_bridge(),
  - Don't print bridge->of_node on failure, as this field depends on
    CONFIG_OF.

This has been tested on the R-Mobile A1-based Atmark Techno
Armadillo-800-EVA development board, using both legacy[4] and
DT-based[5] instantiation, with the fbdev-emulated text console, fbset,
and modetest, a.o.

    modetest -M shmob-drm -s 43:800x480@RG16 -P 33@41:640x320+80+80@RG16
    modetest -M shmob-drm -s 43:800x480@RG16

The output of "modetest -M shmob-drm" can be found below[6].

Not much activity has happened since v2, how can we move this forward?
Thanks!

[1] "[PATCH v3 00/41] drm: renesas: shmobile: Atomic conversion + DT
     support"
    https://lore.kernel.org/r/cover.1692178020.git.geert+renesas@glider.be

[2] "[PATCH v2 00/41] drm: renesas: shmobile: Atomic conversion + DT
     support"
    https://lore.kernel.org/r/cover.1689698048.git.geert+renesas@glider.be

[3] "[PATCH 00/39] drm: renesas: shmobile: Atomic conversion + DT
     support"
    https://lore.kernel.org/r/cover.1687423204.git.geert+renesas@glider.be/

[4] "[PATCH/RFC] staging: board: armadillo800eva: Add DRM support"
    https://lore.kernel.org/r/f7874a9da4bcb20fbc9cd133147b67862ebcf0b9.1687418281.git.geert+renesas@glider.be

[5] "[PATCH 0/2] ARM: dts: r8a7740/armadillo800eva: Add LCD support"
    https://lore.kernel.org/r/cover.1687417585.git.geert+renesas@glider.be

[6] Encoders:
    id	crtc	type	possible crtcs	possible clones	
    42	41	DPI	0x00000001	0x00000001

    Connectors:
    id	encoder	status		name		size (mm)	modes	encoders
    43	42	connected	DPI-1          	111x67		1	42
      modes:
	    index name refresh (Hz) hdisp hss hse htot vdisp vss vse vtot
      #0 800x480 59.99 800 840 968 1056 480 515 517 525 33260 flags: nhsync, nvsync; type: preferred, driver
      props:
	    1 EDID:
		    flags: immutable blob
		    blobs:

		    value:
	    2 DPMS:
		    flags: enum
		    enums: On=0 Standby=1 Suspend=2 Off=3
		    value: 0
	    5 link-status:
		    flags: enum
		    enums: Good=0 Bad=1
		    value: 0
	    6 non-desktop:
		    flags: immutable range
		    values: 0 1
		    value: 0
	    4 TILE:
		    flags: immutable blob
		    blobs:

		    value:

    CRTCs:
    id	fb	pos	size
    41	44	(0,0)	(800x480)
      #0 800x480 59.99 800 840 968 1056 480 515 517 525 33260 flags: nhsync, nvsync; type: preferred, driver
      props:
	    24 VRR_ENABLED:
		    flags: range
		    values: 0 1
		    value: 0

    Planes:
    id	crtc	fb	CRTC x,y	x,y	gamma size	possible crtcs
    31	41	44	0,0		0,0	0       	0x00000001
      formats: RG16 RG24 AR24 XR24 NV12 NV21 NV16 NV61 NV24 NV42
      props:
	    8 type:
		    flags: immutable enum
		    enums: Overlay=0 Primary=1 Cursor=2
		    value: 1
	    30 IN_FORMATS:
		    flags: immutable blob
		    blobs:

		    value:
			    01000000000000000a00000018000000
			    01000000400000005247313652473234
			    41523234585232344e5631324e563231
			    4e5631364e5636314e5632344e563432
			    ff030000000000000000000000000000
			    0000000000000000
		    in_formats blob decoded:
			     RG16:  LINEAR
			     RG24:  LINEAR
			     AR24:  LINEAR
			     XR24:  LINEAR
			     NV12:  LINEAR
			     NV21:  LINEAR
			     NV16:  LINEAR
			     NV61:  LINEAR
			     NV24:  LINEAR
			     NV42:  LINEAR
    33	0	0	0,0		0,0	0       	0x00000001
      formats: RG16 RG24 AR24 XR24 NV12 NV21 NV16 NV61 NV24 NV42
      props:
	    8 type:
		    flags: immutable enum
		    enums: Overlay=0 Primary=1 Cursor=2
		    value: 0
	    30 IN_FORMATS:
		    flags: immutable blob
		    blobs:

		    value:
			    01000000000000000a00000018000000
			    01000000400000005247313652473234
			    41523234585232344e5631324e563231
			    4e5631364e5636314e5632344e563432
			    ff030000000000000000000000000000
			    0000000000000000
		    in_formats blob decoded:
			     RG16:  LINEAR
			     RG24:  LINEAR
			     AR24:  LINEAR
			     XR24:  LINEAR
			     NV12:  LINEAR
			     NV21:  LINEAR
			     NV16:  LINEAR
			     NV61:  LINEAR
			     NV24:  LINEAR
			     NV42:  LINEAR
    35	0	0	0,0		0,0	0       	0x00000001
      formats: RG16 RG24 AR24 XR24 NV12 NV21 NV16 NV61 NV24 NV42
      props:
	    8 type:
		    flags: immutable enum
		    enums: Overlay=0 Primary=1 Cursor=2
		    value: 0
	    30 IN_FORMATS:
		    flags: immutable blob
		    blobs:

		    value:
			    01000000000000000a00000018000000
			    01000000400000005247313652473234
			    41523234585232344e5631324e563231
			    4e5631364e5636314e5632344e563432
			    ff030000000000000000000000000000
			    0000000000000000
		    in_formats blob decoded:
			     RG16:  LINEAR
			     RG24:  LINEAR
			     AR24:  LINEAR
			     XR24:  LINEAR
			     NV12:  LINEAR
			     NV21:  LINEAR
			     NV16:  LINEAR
			     NV61:  LINEAR
			     NV24:  LINEAR
			     NV42:  LINEAR
    37	0	0	0,0		0,0	0       	0x00000001
      formats: RG16 RG24 AR24 XR24 NV12 NV21 NV16 NV61 NV24 NV42
      props:
	    8 type:
		    flags: immutable enum
		    enums: Overlay=0 Primary=1 Cursor=2
		    value: 0
	    30 IN_FORMATS:
		    flags: immutable blob
		    blobs:

		    value:
			    01000000000000000a00000018000000
			    01000000400000005247313652473234
			    41523234585232344e5631324e563231
			    4e5631364e5636314e5632344e563432
			    ff030000000000000000000000000000
			    0000000000000000
		    in_formats blob decoded:
			     RG16:  LINEAR
			     RG24:  LINEAR
			     AR24:  LINEAR
			     XR24:  LINEAR
			     NV12:  LINEAR
			     NV21:  LINEAR
			     NV16:  LINEAR
			     NV61:  LINEAR
			     NV24:  LINEAR
			     NV42:  LINEAR
    39	0	0	0,0		0,0	0       	0x00000001
      formats: RG16 RG24 AR24 XR24 NV12 NV21 NV16 NV61 NV24 NV42
      props:
	    8 type:
		    flags: immutable enum
		    enums: Overlay=0 Primary=1 Cursor=2
		    value: 0
	    30 IN_FORMATS:
		    flags: immutable blob
		    blobs:

		    value:
			    01000000000000000a00000018000000
			    01000000400000005247313652473234
			    41523234585232344e5631324e563231
			    4e5631364e5636314e5632344e563432
			    ff030000000000000000000000000000
			    0000000000000000
		    in_formats blob decoded:
			     RG16:  LINEAR
			     RG24:  LINEAR
			     AR24:  LINEAR
			     XR24:  LINEAR
			     NV12:  LINEAR
			     NV21:  LINEAR
			     NV16:  LINEAR
			     NV61:  LINEAR
			     NV24:  LINEAR
			     NV42:  LINEAR

    Frame buffers:
    id	size	pitch

Geert Uytterhoeven (36):
  MAINTAINER: Create entry for Renesas SH-Mobile DRM drivers
  dt-bindings: display: Add Renesas SH-Mobile LCDC bindings
  media: uapi: Add MEDIA_BUS_FMT_RGB666_2X9_BE format
  drm: renesas: shmobile: Fix overlay plane disable
  drm: renesas: shmobile: Fix ARGB32 overlay format typo
  drm: renesas: shmobile: Correct encoder/connector types
  drm: renesas: shmobile: Add support for Runtime PM
  drm: renesas: shmobile: Restore indentation of
    shmob_drm_setup_clocks()
  drm: renesas: shmobile: Use %p4cc to print fourcc code
  drm: renesas: shmobile: Add missing YCbCr formats
  drm: renesas: shmobile: Improve shmob_drm_format_info table
  drm: renesas: shmobile: Improve error handling
  drm: renesas: shmobile: Convert to use devm_request_irq()
  drm: renesas: shmobile: Remove custom plane destroy callback
  drm: renesas: shmobile: Use drmm_universal_plane_alloc()
  drm: renesas: shmobile: Embed drm_device in shmob_drm_device
  drm: renesas: shmobile: Convert container helpers to static inline
    functions
  drm: renesas: shmobile: Replace .dev_private with container_of()
  drm: renesas: shmobile: Use media bus formats in platform data
  drm: renesas: shmobile: Move interface handling to connector setup
  drm: renesas: shmobile: Unify plane allocation
  drm: renesas: shmobile: Rename shmob_drm_crtc.crtc
  drm: renesas: shmobile: Rename shmob_drm_connector.connector
  drm: renesas: shmobile: Rename shmob_drm_plane.plane
  drm: renesas: shmobile: Use drm_crtc_handle_vblank()
  drm: renesas: shmobile: Move shmob_drm_crtc_finish_page_flip()
  drm: renesas: shmobile: Wait for page flip when turning CRTC off
  drm: renesas: shmobile: Turn vblank on/off when enabling/disabling
    CRTC
  drm: renesas: shmobile: Shutdown the display on remove
  drm: renesas: shmobile: Cleanup encoder
  drm: renesas: shmobile: Atomic conversion part 1
  drm: renesas: shmobile: Atomic conversion part 2
  drm: renesas: shmobile: Use suspend/resume helpers
  drm: renesas: shmobile: Remove internal CRTC state tracking
  drm: renesas: shmobile: Atomic conversion part 3
  drm: renesas: shmobile: Add DT support

Laurent Pinchart (5):
  drm: renesas: shmobile: Remove backlight support
  drm: renesas: shmobile: Don't set display info width and height twice
  drm: renesas: shmobile: Rename input clocks
  drm: renesas: shmobile: Remove support for SYS panels
  drm: renesas: shmobile: Use struct videomode in platform data

 .../display/renesas,shmobile-lcdc.yaml        | 130 ++++
 .../media/v4l/subdev-formats.rst              |  72 ++
 MAINTAINERS                                   |  13 +-
 drivers/gpu/drm/renesas/shmobile/Kconfig      |   3 +-
 drivers/gpu/drm/renesas/shmobile/Makefile     |   3 +-
 .../renesas/shmobile/shmob_drm_backlight.c    |  82 ---
 .../renesas/shmobile/shmob_drm_backlight.h    |  19 -
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 650 ++++++++----------
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.h |  27 +-
 .../gpu/drm/renesas/shmobile/shmob_drm_drv.c  | 179 +++--
 .../gpu/drm/renesas/shmobile/shmob_drm_drv.h  |  18 +-
 .../gpu/drm/renesas/shmobile/shmob_drm_kms.c  |  77 ++-
 .../gpu/drm/renesas/shmobile/shmob_drm_kms.h  |   9 +-
 .../drm/renesas/shmobile/shmob_drm_plane.c    | 326 +++++----
 .../drm/renesas/shmobile/shmob_drm_plane.h    |   5 +-
 include/linux/platform_data/shmob_drm.h       |  57 +-
 include/uapi/linux/media-bus-format.h         |   3 +-
 17 files changed, 860 insertions(+), 813 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/renesas,shmobile-lcdc.yaml
 delete mode 100644 drivers/gpu/drm/renesas/shmobile/shmob_drm_backlight.c
 delete mode 100644 drivers/gpu/drm/renesas/shmobile/shmob_drm_backlight.h

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Cc: devicetree@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org
Cc: linux-sh@vger.kernel.org
-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
