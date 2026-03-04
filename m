Return-Path: <linux-renesas-soc+bounces-28794-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uP8YET1pqGl3uQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28794-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 18:17:49 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AEB205097
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 18:17:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 69F3F302835A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 17:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F04376BDC;
	Wed,  4 Mar 2026 17:11:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB3D36492C;
	Wed,  4 Mar 2026 17:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772644289; cv=none; b=VEfIfDpnjBOhbk3czWcbr5OLbuy2pYg12Iu9gnqX62HOOkNOR3pArlvbixyPVMbkvO1G7xcjLwjtxK5T8m6mLn3+3w9vIxoALiY6m/l7V96Hx84XNvCBE2KDEoNeWJmZw25FiDh6cHzYidJQOgVOXohYvnLf/WllqiH5zaL9RsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772644289; c=relaxed/simple;
	bh=0flkI5uS6bxY1FmU/8NHW+sc//8LjR7RysTF5zqpdkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lusQvdJomPGEOUnvlA5Wt3oOc7kh9AZR2Ub4j1MmkdrTpv0cDXWowNGeZJCei/SU3clToz+Jlp2Si64uC0AJNoDMjKkQKIWobTlWApE7syy6hqG6cpE09/2cs/Dg+ZFUp35mXMRB+iXfB7OkxnSuxeiaOdbIGMM+nvHjedVP7nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46518C2BCB1;
	Wed,  4 Mar 2026 17:11:24 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Marc Zyngier <marc.zyngier@arm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <treding@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/7] arm64: dts: fsl-ls1028a: Drop CPU masks from GICv3 PPI interrupts
Date: Wed,  4 Mar 2026 18:11:00 +0100
Message-ID: <3931799d7337d63af505d563754ab784b217a85a.1772643434.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1772643434.git.geert+renesas@glider.be>
References: <cover.1772643434.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A4AEB205097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	TAGGED_FROM(0.00)[bounces-28794-lists,linux-renesas-soc=lfdr.de,renesas];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,baylibre.com,googlemail.com,samsung.com,nxp.com,pengutronix.de,gmail.com,kernel.org,nvidia.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_PROHIBIT(0.00)[0.91.219.160:email];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.916];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,glider.be:mid,glider.be:email,0.91.141.128:email]
X-Rspamd-Action: no action

Unlike older GIC variants, the GICv3 DT bindings do not support
specifying a CPU mask in PPI interrupt specifiers.  Drop the masks.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
index e7f9c9319319a69d..f4ba3d16ab86d660 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
@@ -114,14 +114,10 @@ optee: optee  {
 
 	timer {
 		compatible = "arm,armv8-timer";
-		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) |
-					  IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) |
-					  IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) |
-					  IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) |
-					  IRQ_TYPE_LEVEL_LOW)>;
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
 
 	pmu {
@@ -138,8 +134,7 @@ gic: interrupt-controller@6000000 {
 			<0x0 0x06040000 0 0x40000>; /* GIC Redistributor */
 		#interrupt-cells = <3>;
 		interrupt-controller;
-		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_RAW(0xf) |
-					 IRQ_TYPE_LEVEL_LOW)>;
+		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		its: msi-controller@6020000 {
 			compatible = "arm,gic-v3-its";
 			msi-controller;
-- 
2.43.0


