Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F86D12E71B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2020 15:12:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728288AbgABOMx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 Jan 2020 09:12:53 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:45176 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728469AbgABOMx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Jan 2020 09:12:53 -0500
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id lSCn2100L5USYZQ01SCnNQ; Thu, 02 Jan 2020 15:12:51 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1in1DT-0006OS-BB; Thu, 02 Jan 2020 15:12:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1in1DT-00006r-91; Thu, 02 Jan 2020 15:12:47 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
        David Lechner <david@lechnology.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] drm: Add support for Okaya RH128128T
Date:   Thu,  2 Jan 2020 15:12:43 +0100
Message-Id: <20200102141246.370-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series adds support for the Okaya RH128128T LCD to the
existing ST7735R driver.  This is a 128x128 1.4" TFT display driven by a
Sitronix ST7715R TFT Controller/Driver.  It is used on the "lcd-pmod"
display module that is shipped with Renesas RSK+RZA1 development boards,
and with several other Renesas starter kits, for RX, Synergy, and RZ/T1
MCUs and SoCs.

I'm not 100% sure about the actual Okaya part number, but this is the
only display listed on the Okaya website that matches the
specifications.

Patch 2 depends on "[PATCH] drm/mipi_dbi: Fix off-by-one bugs in
mipi_dbi_blank()"[1], which I sent earlier this week.

This has been tested using the r7s72100-rskrza1-pmod-spi.dtso and
r7s72100-rskrza1-pmod2-lcd.dtso DT overlays[2].
Note that for using this on RSK+RZA1, there is a dependency on RSPI
cs-gpios support[3].  With DT overlays, this also depends on DT
overlays[4] and gpio-hog overlay support[5].

Thanks for your comments!

[1] https://lore.kernel.org/lkml/20191230130604.31006-1-geert+renesas@glider.be/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/renesas-overlays
[3] "[PATCH 0/6] spi: rspi: Add support for multiple native and GPIO
    chip selects"
    https://lore.kernel.org/lkml/20200102133822.29346-1-geert+renesas@glider.be/
[4] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/overlays
[5] "[PATCH/RFC 0/2] gpio: of: Add DT overlay support for GPIO hogs"
    https://lore.kernel.org/lkml/20191230133852.5890-1-geert+renesas@glider.be/

Geert Uytterhoeven (3):
  dt-bindings: display: sitronix,st7735r: Add Okaya rh128128t
  drm/mipi_dbi: Add support for display offsets
  drm: tiny: st7735r: Add support for Okaya RH128128T

 .../bindings/display/sitronix,st7735r.txt     |  4 +-
 drivers/gpu/drm/drm_mipi_dbi.c                | 30 ++++++---
 drivers/gpu/drm/tiny/st7735r.c                | 65 ++++++++++++++++---
 include/drm/drm_mipi_dbi.h                    | 12 ++++
 4 files changed, 90 insertions(+), 21 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
