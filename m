Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B409E13C182
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2020 13:46:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729154AbgAOMqO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jan 2020 07:46:14 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:57754 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729073AbgAOMqB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jan 2020 07:46:01 -0500
Received: from ramsan ([84.195.182.253])
        by andre.telenet-ops.be with bizsmtp
        id qclr2100Q5USYZQ01clrg9; Wed, 15 Jan 2020 13:45:58 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iri3S-0003z0-3D; Wed, 15 Jan 2020 13:45:50 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iri3S-00012X-03; Wed, 15 Jan 2020 13:45:50 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
        David Lechner <david@lechnology.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/5] drm: Add support for Okaya RH128128T
Date:   Wed, 15 Jan 2020 13:45:43 +0100
Message-Id: <20200115124548.3951-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series adds support for the Okaya RH128128T LCD to the
existing ST7735R driver.  This is a 128x128 1.4" TFT display driven by a
Sitronix ST7715R TFT Controller/Driver.  It is used on e.g. the Renesas
YRSK-LCD-PMOD extension board, which is shipped with Renesas RSK+RZA1
development boards[1], and with several other Renesas starter kits, for
RX, Synergy, and RZ/T1 MCUs and SoCs.

Changes compared to v1[2]:
  - Convert DT bindings to DT schema,
  - Add YRSK-LCD-PMOD reference and links,
  - Add Reviewed-by,
  - Split driver preparation and adding actual support in two separate
    patches,
  - Replace st7735r_priv.rgb by a pointer to struct st7735r_cfg,
  - Change prefix of jd_t18003_t01_pipe_enable() and
    jd_t18003_t01_pipe_funcs(),
  - Update Kconfig help text,
  - Improve file comment header.

This has been tested using the r7s72100-rskrza1-pmod-spi.dtso and
r7s72100-rskrza1-pmod2-lcd.dtso DT overlays[3].
Note that for using this on RSK+RZA1, there is a dependency on RSPI
cs-gpios support (now in linux-next).
With DT overlays, this also depends on DT overlays[4] and gpio-hog
overlay support[5].

Thanks!

[1] https://renesasrulz.com/the_vault/f/archive-forum/4981/upgrading-to-the-renesas-rz-a1h
[1] https://lore.kernel.org/dri-devel/20200102141246.370-1-geert+renesas@glider.be/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/renesas-overlays
[4] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/overlays
[5] "[PATCH/RFC 0/2] gpio: of: Add DT overlay support for GPIO hogs"
    https://lore.kernel.org/lkml/20191230133852.5890-1-geert+renesas@glider.be/

Geert Uytterhoeven (5):
  dt-bindings: display: sitronix,st7735r: Convert to DT schema
  dt-bindings: display: sitronix,st7735r: Add Okaya RH128128T
  drm/mipi_dbi: Add support for display offsets
  drm: tiny: st7735r: Prepare for adding support for more displays
  drm: tiny: st7735r: Add support for Okaya RH128128T

 .../bindings/display/sitronix,st7735r.txt     | 35 ---------
 .../bindings/display/sitronix,st7735r.yaml    | 71 +++++++++++++++++
 MAINTAINERS                                   |  2 +-
 drivers/gpu/drm/drm_mipi_dbi.c                | 30 +++++---
 drivers/gpu/drm/tiny/Kconfig                  |  8 +-
 drivers/gpu/drm/tiny/st7735r.c                | 76 +++++++++++++++----
 include/drm/drm_mipi_dbi.h                    | 12 +++
 7 files changed, 170 insertions(+), 64 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/sitronix,st7735r.txt
 create mode 100644 Documentation/devicetree/bindings/display/sitronix,st7735r.yaml

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
