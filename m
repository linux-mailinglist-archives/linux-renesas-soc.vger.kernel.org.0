Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45D7361C2A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2019 11:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727065AbfGHJNn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Jul 2019 05:13:43 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:3939 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729724AbfGHJNn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jul 2019 05:13:43 -0400
X-IronPort-AV: E=Sophos;i="5.62,466,1554735600"; 
   d="scan'208";a="20628208"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 08 Jul 2019 18:08:37 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1160A4219A7E;
        Mon,  8 Jul 2019 18:08:37 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     linus.walleij@linaro.org, geert+renesas@glider.be,
        thierry.reding@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH RFC 4/7] dt-bindings: pwm: rcar: Add specific gpios property to output duty zero
Date:   Mon,  8 Jul 2019 18:07:45 +0900
Message-Id: <1562576868-8124-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562576868-8124-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1562576868-8124-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The R-Car SoCs PWM Timer cannot output duty zero. So, this patch
adds a specific gpio property to output it.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.txt b/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.txt
index fbd6a4f..6acaaeb 100644
--- a/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.txt
+++ b/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.txt
@@ -26,6 +26,9 @@ Required Properties:
 - pinctrl-0: phandle, referring to a default pin configuration node.
 - pinctrl-names: Set to "default".
 
+Optional properties:
+- renesas,duty-zero-gpios: Specify GPIO for outputting duty zero.
+
 Example: R8A7743 (RZ/G1M) PWM Timer node
 
 	pwm0: pwm@e6e30000 {
-- 
2.7.4

