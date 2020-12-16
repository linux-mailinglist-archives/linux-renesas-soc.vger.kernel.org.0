Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 786E62DC4E7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Dec 2020 18:01:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726918AbgLPRBO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Dec 2020 12:01:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726908AbgLPRBO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Dec 2020 12:01:14 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0D5FC061794;
        Wed, 16 Dec 2020 09:00:33 -0800 (PST)
Received: from localhost.localdomain (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0FD1745E;
        Wed, 16 Dec 2020 18:00:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608138027;
        bh=1dSJi1nHNf9TWBQLV/Bvba0h9mII+TItxYupV57f4K0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NsFr2IQisF0qRRYRe3P8jEpBVXp4oebTqnaP1Yj58AsNcNqZOsU+CGhnbnhXI3dg2
         xsS5dP0oLsYLwGwhjDL7H5pWhuCkj1HflwpZqUsWESKJExK6yiM83m41Th6W2j0dcj
         S1QPBsoCE+b7tbeGIszaDlQWH51nQ2GXsPTPI5QA=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert@glider.be>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 1/3] arm64: dts: renesas: r8a779a0: Add FCPVD support
Date:   Wed, 16 Dec 2020 17:00:16 +0000
Message-Id: <20201216170018.861710-2-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201216170018.861710-1-kieran.bingham+renesas@ideasonboard.com>
References: <20201216170018.861710-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Provide FCPVD support for the V3U.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 6cf77ce9aa93..ba6fbbd8710e 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -117,6 +117,22 @@ gic: interrupt-controller@f1000000 {
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
 		};
 
+		fcpvd0: fcp@fea10000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfea10000 0 0x200>;
+			clocks = <&cpg CPG_MOD 508>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 508>;
+		};
+
+		fcpvd1: fcp@fea11000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfea2f000 0 0x200>;
+			clocks = <&cpg CPG_MOD 509>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 509>;
+		};
+
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
-- 
2.25.1

