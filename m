Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27FE570E0B7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 May 2023 17:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237607AbjEWPkE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 May 2023 11:40:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237617AbjEWPjz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 May 2023 11:39:55 -0400
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 355DC121
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 May 2023 08:39:54 -0700 (PDT)
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by gauss.telenet-ops.be (Postfix) with ESMTPS id 4QQdmT01VHz4x2B7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 May 2023 17:39:53 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:b0ac:7afd:272:4cff])
        by andre.telenet-ops.be with bizsmtp
        id 0Fen2A00H0Jkz7G01FenNV; Tue, 23 May 2023 17:38:52 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1q1U5o-002t4X-Th;
        Tue, 23 May 2023 17:38:47 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1q1U63-00CkgO-BR;
        Tue, 23 May 2023 17:38:47 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Lee Jones <lee@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: backlight: pwm: Make power-supply not required
Date:   Tue, 23 May 2023 17:38:37 +0200
Message-Id: <29943059c80c8db0db437f9548f084a67326647b.1684856131.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

make dtbs_check:

    arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7.dtb: backlight: 'power-supply' is a required property
	    From schema: Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml

As that backlight device node already has an "enable-gpios" property to
control the power supplied to the backlight, it sounds a bit silly to
have to add a "power-supply" property just to silence this warning.  In
addition, as of commit deaeeda2051fa280 ("backlight: pwm_bl: Don't rely
on a disabled PWM emiting inactive state"), the Linux driver considers
the power supply optional.

Fix this by synchronizing the bindings with actual driver behavior by
making the "power-supply" optional.

Fixes: deaeeda2051fa280 ("backlight: pwm_bl: Don't rely on a disabled PWM emiting inactive state")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
As commit deaeeda2051fa280 was only upstreamed in v6.3, I'm wondering if
the backlight on the iWave Systems RainboW-G20D/G21D Qseven and
RainboW-G22D-SODIMM boards worked before?  I don't have the hardware.

Thanks!
---
 .../devicetree/bindings/leds/backlight/pwm-backlight.yaml        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml
index 5ec47a8c6568b60e..53569028899020d6 100644
--- a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml
@@ -68,7 +68,6 @@ dependencies:
 required:
   - compatible
   - pwms
-  - power-supply
 
 additionalProperties: false
 
-- 
2.34.1

