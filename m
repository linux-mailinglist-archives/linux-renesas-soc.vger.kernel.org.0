Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E185344D4D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Mar 2021 18:30:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231186AbhCVR34 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Mar 2021 13:29:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231520AbhCVR3a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Mar 2021 13:29:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D8FBC061756;
        Mon, 22 Mar 2021 10:29:30 -0700 (PDT)
Received: from Q.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 76469FDE;
        Mon, 22 Mar 2021 18:29:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616434164;
        bh=2aHAHsed1JL/1YYWcDFybXP98BGBlvB9o+XjgIRFShg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SiUFYl2ECpEarUZO4Yje9JLFddrlIJ8ViBy2juubZde5+0hhqZdHN8tFo8hOqvBTG
         dpVqkJXV+nL6mwep9ZJh55zIeA/vvmViUI/hk16tp362wUQgUbLDgce4qNEYb1tCDb
         Jw5gIsl5fZKVP39gYsORfOVMeUeZmuBLNFhV+Qbw=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert@glider.be>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v2 2/2] arm64: dts: renesas: r8a779a0: Add VSPD support
Date:   Mon, 22 Mar 2021 17:29:19 +0000
Message-Id: <20210322172919.1154686-3-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210322172919.1154686-1-kieran.bingham+renesas@ideasonboard.com>
References: <20210322172919.1154686-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Provide VSPD support on the V3U.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 73036a5b8312..52a48e8d5814 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -1118,6 +1118,28 @@ fcpvd1: fcp@fea11000 {
 			resets = <&cpg 509>;
 		};
 
+		vspd0: vsp@fea20000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfea20000 0 0x5000>;
+			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 830>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 830>;
+
+			renesas,fcp = <&fcpvd0>;
+		};
+
+		vspd1: vsp@fea28000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfea28000 0 0x5000>;
+			interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 831>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 831>;
+
+			renesas,fcp = <&fcpvd1>;
+		};
+
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
-- 
2.25.1

