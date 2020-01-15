Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A3FB13C181
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2020 13:46:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729052AbgAOMqL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jan 2020 07:46:11 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:49952 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729162AbgAOMqB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jan 2020 07:46:01 -0500
Received: from ramsan ([84.195.182.253])
        by laurent.telenet-ops.be with bizsmtp
        id qclq2100K5USYZQ01clqWY; Wed, 15 Jan 2020 13:45:58 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iri3S-0003z3-3l; Wed, 15 Jan 2020 13:45:50 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iri3S-00012b-2R; Wed, 15 Jan 2020 13:45:50 +0100
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
Subject: [PATCH v2 2/5] dt-bindings: display: sitronix,st7735r: Add Okaya RH128128T
Date:   Wed, 15 Jan 2020 13:45:45 +0100
Message-Id: <20200115124548.3951-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200115124548.3951-1-geert+renesas@glider.be>
References: <20200115124548.3951-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document support for the Okaya RH128128T display, which is a 128x128
1.44" TFT display driven by a Sitronix ST7715R TFT Controller/Driver.
It can be found on e.g. the Renesas YRSK-LCD-PMOD extension board, which
comes with various Renesas development kits (e.g. Renesas Starter Kit+
for RZ/A1H[1]).

ST7715R and ST7735R are very similar.  Their major difference is that
the former is restricted to displays of up to 132x132 pixels, while the
latter supports displays up to 132x162 pixels.

[1] https://renesasrulz.com/the_vault/f/archive-forum/4981/upgrading-to-the-renesas-rz-a1h

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Rebase on top of DT schema conversion,
  - Add YRSK-LCD-PMOD reference and links.
---
 .../devicetree/bindings/display/sitronix,st7735r.yaml  | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml b/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
index 21bccc91f74255e1..8892d79e6e100b79 100644
--- a/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
+++ b/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
@@ -10,8 +10,8 @@ maintainers:
   - David Lechner <david@lechnology.com>
 
 description:
-  This binding is for display panels using a Sitronix ST7735R controller in
-  SPI mode.
+  This binding is for display panels using a Sitronix ST7715R or ST7735R
+  controller in SPI mode.
 
 allOf:
   - $ref: panel/panel-common.yaml#
@@ -25,6 +25,12 @@ properties:
           - enum:
               - jianda,jd-t18003-t01
           - const: sitronix,st7735r
+      - description:
+          Okaya 1.44" 128x128 Color TFT LCD (E.g. Renesas YRSK-LCD-PMOD)
+        items:
+          - enum:
+              - okaya,rh128128t
+          - const: sitronix,st7715r
 
   spi-max-frequency:
     maximum: 32000000
-- 
2.17.1

