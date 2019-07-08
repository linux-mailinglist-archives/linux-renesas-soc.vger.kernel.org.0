Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9D5B61C2C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2019 11:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729724AbfGHJNo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Jul 2019 05:13:44 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:44370 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729145AbfGHJNo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jul 2019 05:13:44 -0400
X-IronPort-AV: E=Sophos;i="5.62,466,1554735600"; 
   d="scan'208";a="20628212"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 08 Jul 2019 18:08:37 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7FF264219A82;
        Mon,  8 Jul 2019 18:08:37 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     linus.walleij@linaro.org, geert+renesas@glider.be,
        thierry.reding@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH RFC 7/7] arm64: dts: renesas: salvator-common: add gpio property into pwm1
Date:   Mon,  8 Jul 2019 18:07:48 +0900
Message-Id: <1562576868-8124-8-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562576868-8124-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1562576868-8124-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds a specific gpio property to output duty zero.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 5c2c847..5b68fb6 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -727,6 +727,7 @@
 &pwm1 {
 	pinctrl-0 = <&pwm1_pins>;
 	pinctrl-names = "default";
+	renesas,duty-zero-gpios = <&gpio2 7 GPIO_ACTIVE_HIGH>;
 
 	status = "okay";
 };
-- 
2.7.4

