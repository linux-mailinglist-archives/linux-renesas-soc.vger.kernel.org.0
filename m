Return-Path: <linux-renesas-soc+bounces-6741-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 091049168D9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 15:31:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9AD428734C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 13:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1AF9156F32;
	Tue, 25 Jun 2024 13:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="T3bd8DUV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qKMrzx8+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from wfout6-smtp.messagingengine.com (wfout6-smtp.messagingengine.com [64.147.123.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6711E4BF;
	Tue, 25 Jun 2024 13:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719322274; cv=none; b=gVIrhaHIlUKFkgMu/34bjzEYpZAJok7XgcF/uiJp2/EytC/KEHM16OWUCWeBpj1H27LQCUbqONVYeiKzEs6wKMzcfolHUOC+rNRT/RZTZZ+Q0GhZ46Z8C1zVKXa01e8W6ASBm9nI0fB130ZgFTWSDLl3PSi2RASaaCbNKPPd9Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719322274; c=relaxed/simple;
	bh=JFX/aqaZCPcAC7dMvw8xetqdCbacrmbTTMLwTcRl0iQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Fu9m/pJ9wOf0VMCJI/UmQgqIQ0nyaOzhxaNrOtv/WFisMCzuaR/KROae5Od446Zxl6d3aVpPj1bLl+kCfjmwRQ/QEfOLBvSNFGksih4MCPg5lJi0IxDHlx/HhrxoBIGfrV7vb2QAd2HWVBEDJTkUvqfKDDoBWcrOSST6ynYnlgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=T3bd8DUV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qKMrzx8+; arc=none smtp.client-ip=64.147.123.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfout.west.internal (Postfix) with ESMTP id 8A4DB1C0025E;
	Tue, 25 Jun 2024 09:31:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Tue, 25 Jun 2024 09:31:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1719322268; x=1719408668; bh=zb
	F9W9f9/vgt+git3nGfwIsL/EBUtOi6MRCO8X3terY=; b=T3bd8DUVGFFtS4UwNV
	8sFznXZEF/unaYb95bxIntv3TtssCRWYs8eieSRkYeuGEg9embtplHZos2455EII
	M2ORNr6fpj/2fgB/uwaTQIcNRtv/5NJVNrhfJFVbOqmazTHmSadMXmYzSjqy4aLA
	RMKu85NNdlfhw8NcXi0HhWFq1Ha6fm9Egc9OQtNu4MuwKS2FwPsQ+Z+7F3UPllhb
	FflZ5fluTqdbL8C221QFtftSi1joHFeHBsmQYQ3VgrUdNxjsNGH/TblzmL9TQJwu
	YyDFmJneDv3nLtVoh3WfF1CB7zqkHMrCZTBoL5L77dEuws3YxaGmSIIibXQzdbim
	rC2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1719322268; x=1719408668; bh=zbF9W9f9/vgt+
	git3nGfwIsL/EBUtOi6MRCO8X3terY=; b=qKMrzx8+WVGS1nBgZ+IqU9/K95wyX
	T4czqZLSt02aYjVbW6lCpANwKbc57K1dsjO6sunYLRKbPtCwa5CMXTS6u5Pnf7XJ
	/XMoc07nqK3prjc2saaLAHng+6iNsuypvDLq4mYf4H0CJ8VSV/y6LLMgOVu/pMPN
	ym9x0NxPLJCChBhG5oV5CLq5nR/KNJvDeKWlFNCjt9W/bu+wFQ1sET9QODWIdloh
	2dLe/eEX+2VEfb6MWQjX4DesjpGxu/Y+WUtYJtzwLPP6Cq8J0ldNEKWyx2YkJcXg
	NSaU2kTa5EQg6Am2FwhrjAhSk9dPJI5MVFRCicXIenGmBgI0b+levSbYg==
X-ME-Sender: <xms:m8Z6ZpPdwniETBJ-O7o6uv-VTTbmMpsT8jF_b1qo1a1e5NQ6ViNUxw>
    <xme:m8Z6Zr-FhIOLM1OyIPc7WWBdmKmcNGNZ0WWplxkN4n0EKKoiKmtWYmZ91v5lWjWi6
    rmP89JQIvpxSwNao0A>
X-ME-Received: <xmr:m8Z6ZoTkCvV6KwXBsTWVxH47M0gZQ13vte-zPAJnUghMk5t875d3FwxyImGGD8KY7EDYC1RFlYsMcaFLFMhitr46pg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrtddtgdefvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheduleetteekgfff
    fedufeeuvdejiedvkefhveeifeegffehledtvdevhfefteegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:m8Z6ZltQhYX1dlpbb2cl3lb1raPQWr0q5zE6C41NooD5Ru5aP5sWIg>
    <xmx:m8Z6Zhe9HNrVAogye_8tmI0IO89HeiTMfUyGpORAyPDEAiAXjifauQ>
    <xmx:m8Z6Zh3JOXQ8c4sCFdVGWKDZmLhZqWDlJXFWGzzQwcQXNttCfgOklQ>
    <xmx:m8Z6Zt9ApGa4_SsvH17nGsu3ve5bY6nwijpnxPYxzDW0AtZbRMTlnQ>
    <xmx:nMZ6Zrv9ppp3qsleP-Zz741Y1FZbc-gL9yGTjGY0oxyL_2KW8LhBp_FY>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Jun 2024 09:31:06 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] arm64: dts: renesas: white-hawk: ethernet: Define AVB1 and AVB2 PHY
Date: Tue, 25 Jun 2024 15:30:08 +0200
Message-ID: <20240625133008.2638902-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Align with other Renesas SoCs and use the specific compatible for the
PHYs connected to AVB1 and AVB2, Marvell 88Q2110/QFN40. This allows
software to identify the PHY model at any time, regardless of the state
of the PHY reset line.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/white-hawk-ethernet.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/white-hawk-ethernet.dtsi b/arch/arm64/boot/dts/renesas/white-hawk-ethernet.dtsi
index 595ec4ff4cdd..40a08b57b479 100644
--- a/arch/arm64/boot/dts/renesas/white-hawk-ethernet.dtsi
+++ b/arch/arm64/boot/dts/renesas/white-hawk-ethernet.dtsi
@@ -27,7 +27,8 @@ mdio {
 		reset-post-delay-us = <4000>;
 
 		avb1_phy: ethernet-phy@0 {
-			compatible = "ethernet-phy-ieee802.3-c45";
+			compatible = "ethernet-phy-id002b.0980",
+				     "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
 			interrupt-parent = <&gpio6>;
 			interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
@@ -49,7 +50,8 @@ mdio {
 		reset-post-delay-us = <4000>;
 
 		avb2_phy: ethernet-phy@0 {
-			compatible = "ethernet-phy-ieee802.3-c45";
+			compatible = "ethernet-phy-id002b.0980",
+				     "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
 			interrupt-parent = <&gpio5>;
 			interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
-- 
2.45.2


