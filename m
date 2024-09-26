Return-Path: <linux-renesas-soc+bounces-9071-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3394398712E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 12:20:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 465F01F21438
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 10:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F5F1AC895;
	Thu, 26 Sep 2024 10:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="QCzwRobH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464481AC439
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Sep 2024 10:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727346024; cv=none; b=U4AOA9MLl0GrEAgMY/cTr/hVKi3AJ5GH9dS/7UtALRGRWXdZ4BIPDrzpz+HVfREc6fmvAfPb1ABpEi3xFWhiSdXLpykhrWrNaTtn3jBKaXxOxcvzdy66nQzukxFzLbZVDFCF6cvuyzmOh65+E26cVe1lmIvUQkbRaLuK5RtGlio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727346024; c=relaxed/simple;
	bh=orRNbU3tZidDdR0hgmg1qm2l7ek95p49PWhgax+fBPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m6E/o3KaGvtXHcaMk6rnkmZn2P4BuIO88N0g1EOf3vFTlxVYJCkmndkVxXtqiiUaq3w+8sgLNB0pDdeI61adaLZNWnDqMJdk6mHYaYmrl2/Agl0SM9zcHPnMditgG0JDLzfkPQeeP8k6RLZDrpmcTEWhEFQv13ZGlSWWJrSIcBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=QCzwRobH; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=hlQ8IlIEHSPyfsnSp3ZgppOpQO+bFoPji/T2HQBokNk=; b=QCzwRo
	bHozgmqjJFFBABN4sQzXpHKnp0Y/Um5LE7PY7iZKuCi6Xeg1ntOR+Y++hyw1XpzJ
	rszn/iyRUJL8qpN4XHJT6ZktN3Ut26BYYU/4rZKxwd6oikqhJ7l1HuMNp2QncJIl
	bw/81eEbfiI9gNDfmHWq5/3MFfAWd1oujtcMXZui3QLDJOvSgMehGe9FxtGJmt4p
	bJf2nb8xkwMWRLrAItJRkw1tYweJN2vjZWJdDAsUS6bJI3KyzTur9MAsbjef/cVo
	muc65dd6WV57E1ni0/4XKd1qGjuMD7CUaU5LuyshUcyGv+TG1A2BWIwlAVIwZesI
	sTj5gboOBk0f31Kg==
Received: (qmail 946889 invoked from network); 26 Sep 2024 12:20:19 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Sep 2024 12:20:19 +0200
X-UD-Smtp-Session: l3s3148p1@+fbcFQMjrtQgAwDPXzRXADDuo30Z+IZ9
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 2/3] ARM: dts: renesas: r7s72100: 'bus-width' is a board property
Date: Thu, 26 Sep 2024 12:20:07 +0200
Message-ID: <20240926102005.15475-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240926102005.15475-5-wsa+renesas@sang-engineering.com>
References: <20240926102005.15475-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not set 'bus-width' in the SoC-include DTSI. It must be set in the
board DTS file. No regressions because MMCIF was not enabled yet for
this SoC.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/renesas/r7s72100.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r7s72100.dtsi b/arch/arm/boot/dts/renesas/r7s72100.dtsi
index a460a9092c43..27a4121517a7 100644
--- a/arch/arm/boot/dts/renesas/r7s72100.dtsi
+++ b/arch/arm/boot/dts/renesas/r7s72100.dtsi
@@ -333,7 +333,6 @@ mmcif: mmc@e804c800 {
 				     <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&mstp8_clks R7S72100_CLK_MMCIF>;
 			power-domains = <&cpg_clocks>;
-			bus-width = <8>;
 			status = "disabled";
 		};
 
-- 
2.45.2


