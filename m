Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE92910ABF9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2019 09:43:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbfK0InM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Nov 2019 03:43:12 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:52852 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726975AbfK0InK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Nov 2019 03:43:10 -0500
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id Wwiu2100b5USYZQ01wiua4; Wed, 27 Nov 2019 09:43:09 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iZsuU-0000xw-RV; Wed, 27 Nov 2019 09:42:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iZsuU-0004PA-P7; Wed, 27 Nov 2019 09:42:54 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, qemu-devel@nongnu.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 7/7] MAINTAINERS: Add GPIO Aggregator/Repeater section
Date:   Wed, 27 Nov 2019 09:42:53 +0100
Message-Id: <20191127084253.16356-8-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191127084253.16356-1-geert+renesas@glider.be>
References: <20191127084253.16356-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a maintainership section for the GPIO Aggregator/Repeater, covering
documentation, Device Tree bindings, and driver source code.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Harish: Do you want to be listed as maintainer, too?

v3:
  - New.
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e5949b6827b72f2b..0f12ebdaa8faa76b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7043,6 +7043,14 @@ S:	Maintained
 F:	Documentation/firmware-guide/acpi/gpio-properties.rst
 F:	drivers/gpio/gpiolib-acpi.c
 
+GPIO AGGREGATOR/REPEATER
+M:	Geert Uytterhoeven <geert+renesas@glider.be>
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+F:	Documentation/admin-guide/gpio/gpio-aggregator.rst
+F:	Documentation/devicetree/bindings/gpio/gpio-repeater.yaml
+F:	drivers/gpio/gpio-aggregator.c
+
 GPIO IR Transmitter
 M:	Sean Young <sean@mess.org>
 L:	linux-media@vger.kernel.org
-- 
2.17.1

