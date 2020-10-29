Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2A6D29ED66
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Oct 2020 14:46:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727482AbgJ2Nqq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Oct 2020 09:46:46 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:43977 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727513AbgJ2Nqq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Oct 2020 09:46:46 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id D2C3A3C009C;
        Thu, 29 Oct 2020 14:38:13 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ESvXkGf_EOH8; Thu, 29 Oct 2020 14:38:08 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 7D51F3C057F;
        Thu, 29 Oct 2020 14:38:03 +0100 (CET)
Received: from lxhi-065.adit-jv.com (10.72.94.34) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 29 Oct
 2020 14:38:02 +0100
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        <linux-renesas-soc@vger.kernel.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Steffen Pengel <spengel@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: [PATCH 1/2] arm64: dts: renesas: r8a77961: Add CAN{0,1} placeholder nodes
Date:   Thu, 29 Oct 2020 14:37:40 +0100
Message-ID: <20201029133741.25721-1-erosca@de.adit-jv.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.72.94.34]
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

With the same background and purpose as described in v4.20-rc1
commit 92bc66bfce99cd ("arm64: dts: renesas: r8a77965: Add CAN{0,1}
placeholder nodes"), add can0 and can1 placeholder nodes.

Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 1ba30313c8b8..d2a5ea20378f 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -1017,6 +1017,16 @@ avb: ethernet@e6800000 {
 			status = "disabled";
 		};
 
+		can0: can@e6c30000 {
+			reg = <0 0xe6c30000 0 0x1000>;
+			/* placeholder */
+		};
+
+		can1: can@e6c38000 {
+			reg = <0 0xe6c38000 0 0x1000>;
+			/* placeholder */
+		};
+
 		pwm0: pwm@e6e30000 {
 			compatible = "renesas,pwm-r8a77961", "renesas,pwm-rcar";
 			reg = <0 0xe6e30000 0 8>;
-- 
2.29.0

