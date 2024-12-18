Return-Path: <linux-renesas-soc+bounces-11522-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A009F60F8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 10:08:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A437163DA8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 09:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB8F719F111;
	Wed, 18 Dec 2024 09:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wHxANcqg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E011991DA;
	Wed, 18 Dec 2024 09:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734512768; cv=none; b=e7SNhMsiae+mS7G+HX3LoscJrpzRGMEMMYx/AyO6eUJDMX/Vbymeggq9+94PnX2HJM7zg7jXW/n35ovg4uyBmo6OhHmrHbGnDVb0oTZbvtvnYcIvisYB9Gca86DV0AzwQNdc6KrZKhw1/5CJ5fwIQFqN9UJJRMu329yWtKYtg24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734512768; c=relaxed/simple;
	bh=5BbhOPRrDW7SqUts5g+/KtHAiF/OLk8XENF/z1CcFF0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jjhUA86JqSbp4X0iIJxM9hESWm3y1MjQ5lCCZQefxCSGoHD6bT9JIb31pn+fNziZJN5I63fOCpg/i/Gl/JuUxwounNHylJAKr0EdYyxsgUVUVgVKkXrr5XtziVo3M6qNNx7ftyke7Ta2QI0lc44Fh/BgKrTdnCwHmY/YE4NddHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wHxANcqg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.104] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B926E827;
	Wed, 18 Dec 2024 10:05:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734512721;
	bh=5BbhOPRrDW7SqUts5g+/KtHAiF/OLk8XENF/z1CcFF0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=wHxANcqgWmqPX00bMqTGojv52kwyf0V7uo+m/TSqoWbrlailBn+XkckB0sjv+js7p
	 Z39jdVTZfm794cyWhXOoN2VpuO3sbX893p200GxMK/wdXbL3eRWeaptTOxVX7YIPMN
	 E8njxspLPjaghGhq2xP6G1hnhsNfPwHnyCUPugTY=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Wed, 18 Dec 2024 10:05:35 +0100
Subject: [PATCH v2 2/4] arm64: dts: renesas: r8a779g0: Add FCPVX instances
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-rcar-v4h-vspx-v2-2-c673647d96e1@ideasonboard.com>
References: <20241218-rcar-v4h-vspx-v2-0-c673647d96e1@ideasonboard.com>
In-Reply-To: <20241218-rcar-v4h-vspx-v2-0-c673647d96e1@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1322;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=5BbhOPRrDW7SqUts5g+/KtHAiF/OLk8XENF/z1CcFF0=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnYpB0863Qxw5cFiry5k/hHwCSZJuvv3AlfrG4o
 SrmSC5lPDeJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ2KQdAAKCRByNAaPFqFW
 PP8ED/0YrzNxpEiccA2hct3xvsWhRFT5K2B90QuvhF4lOq9PeAgav6YEgRkNzsVib1JOPlvdERz
 d4AnVaqdgK57L07ncGUxEou6EQvEH9XcZ8X5BxxyNB0Lzn6a+VOXLFI62lTVpKuKgXfneMbl4vl
 2ocLx4ck4tNX07H/u6rWOZO4CJFttD9vmHHHlCwsHodZndGGnGXmHPwg9d3gCie2znFvnRDkmfF
 FN3wcYcZb/Gbow+Z+8rGdXE1EQlDfczclqSrljBlsDre1LQC8n97astmx2Q+jvITrNwynwbqLz8
 +d5TeQqL9X6S1cTnhIRdkGqQpQ9xyeAAasEbVIyhrKxYEJjfFUIPi0SCu3e2ABkdDLEJf4KxnpT
 fusz8z8d2TlDohqlRKqPiB0yauKE3pAYXZ4wyYTVa06Ow3hR8jzYV6HJMGlrdbJ+qdPuN5TNaFA
 mFNDNkJ4rho9YTUq3T+Zh4QB3YCghujHpWhD0uvv1ln0VSIWNYqhc/A2LwjK5jKQFe8Yovmhqi4
 Zb4o+TNCjEqHcsOob2fyaoF1UM07epZKvHVZ85RK+eH6EwFK8Hmekw96qRmbvfhwThBW+HD5oYb
 IFdYwe73Ig/nTXrSYa+goCo0gM+oFm9IY6xBqFBpTGI9Q3xlBFb8onJMBQ3r1nDCaGEyGsDC9IV
 cGf5rL3SdQS3Dog==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add device nodes for the FCPVX instances on R-Car V4H (R8A779G0) SoC.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

---
v1->v2:
- Re-sort nodes by unit address
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 61c6b8022ffdc3b22444fb13e748b4aaebe454a4..3eb53deecb63cf1aacf4a2ed663fe5402aa1199d 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -2453,6 +2453,24 @@ port@1 {
 			};
 		};
 
+		fcpvx0: fcp@fedb0000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfedb0000 0 0x200>;
+			clocks = <&cpg CPG_MOD 1100>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 1100>;
+			iommus = <&ipmmu_vi1 24>;
+		};
+
+		fcpvx1: fcp@fedb8000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfedb8000 0 0x200>;
+			clocks = <&cpg CPG_MOD 1101>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 1101>;
+			iommus = <&ipmmu_vi1 25>;
+		};
+
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;

-- 
2.47.1


