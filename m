Return-Path: <linux-renesas-soc+bounces-22978-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F166DBD5D66
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 21:02:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E5A354E3D7B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 19:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D069201017;
	Mon, 13 Oct 2025 19:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="BfjCAX4Z";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="d2jpN+HF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACE61EDA02;
	Mon, 13 Oct 2025 19:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760382164; cv=none; b=eDEiwvT9PR7ItloKrzfopkguVXlkv6q2xctgt8JlNF6Tw9nWhIbmpN1O74KqvyaszIh99e5T0KB0bUOE+G9pw21DYb4UOHg95X4dg5cCGnBXscZ0oJCnaT+1Ketfu1w9qBT9J8+qbxDxDtu9rfl7J8pX9iUBTJ/KbAdhUMpcK3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760382164; c=relaxed/simple;
	bh=iqumaJzjj3LhG35zeA+iOLnqqeKZyj1jxwGJGndVh3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eZ/9XbDRJzYL/u60y9iIhQihEA+H6pc2IepEtEMDXlnAgmUgHN0creZUmNvWk8P2OIcvNgcGZb0R2Ec34CfVYCn50SoTruqBdcDaZ6r/4Kh+yPZ2OtzkaSsG2fV5EbSvq6YbFQAE4UpD7dtJDk08JiJiw4A+OJYdzbx/H5nPUHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=BfjCAX4Z; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=d2jpN+HF; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4clmv40tFTz9v66;
	Mon, 13 Oct 2025 21:02:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760382160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lUtG4fYV8VOSGqWxFEwkf8RZ2UUyckF4MGl1rId8mkE=;
	b=BfjCAX4Z97POtyHHN0ws7NpKpAj3ydeg+FDr1G+do4tsnoGU96s8oASvF5Ex3kxIAWqSnE
	+8VlDFfMLma1cGQonNTu1n9jRDxGavF1YSX8UZrbKaWPgM1grrSU6UOEeU+G9AcqdMVpC7
	6xR1DsNvBQsKEOLtJT4/0nty4v7TYU+C0X7HqoU6ekpaDTneXferLTPHfjgHfq4Nc+1qZK
	2CSk1qEydtK0EEuswgvKrK8h/ffnxB+JV5LFiFUWJJ+HfMeWYOHLYWAr33ruqNGPD+TT9f
	O6Gw+/nKnv1N5XF2GwYoqca4WT+J84e/wFyqiJ8mCn1vfFEina6ldrH1mgXaMA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=d2jpN+HF;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760382158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lUtG4fYV8VOSGqWxFEwkf8RZ2UUyckF4MGl1rId8mkE=;
	b=d2jpN+HFFt1TcgyPFzjcLxHZewQqkPEBvQCtbPq3tuisJLc1VNZ4J1IwD57MLOuh9TVcZt
	LtK2U1W5FjtiDJli6ZrHwIbK8jSQe05oIB0eONyTDpyH4vhph7GBAQoKDu7+jGYbwbuM93
	efBfNdVQLJM6CDZat/famKSmGRHcbubvmk5yewVUgD4lzm4CQBeadn+Y6myk3M3/59k3PU
	CMmljowIegQU0IwCUmzrjYtcR9R4Ya1s0WsAykXh6HgY3CPST5lZb1FwPwAjrv0tgLGfLB
	WcD2R2v3qKKjCM7NLbzaI/HpViECdNuvXggzmabYA/6ux4tipAu6aPE9pR8G/Q==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Adam Ford <aford173@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: renesas: r8a77961: Add GX6250 GPU node
Date: Mon, 13 Oct 2025 21:01:19 +0200
Message-ID: <20251013190210.142436-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
References: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 5442c9876c26aeb1ea8
X-MBO-RS-META: 35wuxxwzwhqixksgcga4gmtrfh6d5yib
X-Rspamd-Queue-Id: 4clmv40tFTz9v66

Describe Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
present in Renesas R-Car R8A77961 M3-W+ SoC.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Adam Ford <aford173@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Frank Binns <frank.binns@imgtec.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Matt Coster <matt.coster@imgtec.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 1637b534fc68b..77ed99e8d7b9e 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -2445,6 +2445,18 @@ gic: interrupt-controller@f1010000 {
 			resets = <&cpg 408>;
 		};
 
+		gpu: gpu@fd000000 {
+			compatible = "renesas,r8a77961-gpu",
+				     "img,img-gx6250",
+				     "img,img-rogue";
+			reg = <0 0xfd000000 0 0x40000>;
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 112>;
+			clock-names = "core";
+			power-domains = <&sysc R8A7796_PD_3DG_B>;
+			resets = <&cpg 112>;
+		};
+
 		pciec0: pcie@fe000000 {
 			compatible = "renesas,pcie-r8a77961",
 				     "renesas,pcie-rcar-gen3";
-- 
2.51.0


