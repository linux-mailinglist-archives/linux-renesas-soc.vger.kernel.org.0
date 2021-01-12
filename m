Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A70232F367F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jan 2021 18:05:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390994AbhALRDA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Jan 2021 12:03:00 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([81.169.146.172]:17119 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390860AbhALRC7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Jan 2021 12:02:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610470798;
        s=strato-dkim-0002; d=fpond.eu;
        h=Message-Id:Date:Subject:Cc:To:From:From:Subject:Sender;
        bh=3Y6QvsWAWSE2LZaUsSvMEi5WOHirETlcfzXfSp2vINo=;
        b=iqqqhWREOgDn0RFn/EO6U1g1Tpz5Rp4mrY6+k9WpCYkDhYIyHKntS+lilBKqiIcXzz
        BfARMn8kqRGB74f5XW5b8g7TS2zOZq2597MqSOJm+yz7xjZcqFrMbIhNzsJsZzf6yHDb
        cUMKgfOVlQMAdWKJr9t6nENK+rqcRYNOjThyII7HbwsnwTqxFxP9PKQE0I7+ajxUiCkN
        YB5tHQPYsqcK88I+Q23eeBUDUTEXN4J+16eosSRQ/6JnZUZt9hvV9wPLqHEGHoB3XuSS
        dTS1DOcHJ7BeEKLwcxJAHvkU0Bley8Y/Dvz9+9KTK/DW+2twy+DWTrAByE6FhnD3zx3g
        M7rw==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8XxYaA36"
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
        with ESMTPSA id z08ea3x0CGxrNUk
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 12 Jan 2021 17:59:53 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, hoai.luu.ub@renesas.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH] arm64: dts: renesas: r8a779a0: Add pinctrl device node
Date:   Tue, 12 Jan 2021 17:59:48 +0100
Message-Id: <20210112165948.31162-1-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds the pinctrl device node for the R8A779A0 (V3U) SoC.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
Hi!

This enables the PFC on V3U SoCs as implemented and documented in the
series "[PATCH v3 0/6] pinctrl: renesas: basic R8A779A0 (V3U) support".

CU
Uli


 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index f951e6b6f696..6ac2c9d37acd 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -80,6 +80,15 @@
 			status = "disabled";
 		};
 
+		pfc: pin-controller@e6050000 {
+			compatible = "renesas,pfc-r8a779a0";
+			reg = <0 0xe6050000 0 0x16c>, <0 0xe6050800 0 0x16c>,
+			      <0 0xe6058000 0 0x16c>, <0 0xe6058800 0 0x16c>,
+			      <0 0xe6060000 0 0x16c>, <0 0xe6060800 0 0x16c>,
+			      <0 0xe6068000 0 0x16c>, <0 0xe6068800 0 0x16c>,
+			      <0 0xe6069000 0 0x16c>, <0 0xe6069800 0 0x16c>;
+		};
+
 		cpg: clock-controller@e6150000 {
 			compatible = "renesas,r8a779a0-cpg-mssr";
 			reg = <0 0xe6150000 0 0x4000>;
-- 
2.20.1

