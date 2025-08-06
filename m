Return-Path: <linux-renesas-soc+bounces-20061-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 695FAB1CC8C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 21:28:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43732188BE33
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 19:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C97C72BD588;
	Wed,  6 Aug 2025 19:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="tWYVcs2Z";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="kLnS8gYz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59302BD025;
	Wed,  6 Aug 2025 19:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754508524; cv=none; b=sOawJAH2N9W+pqWGkFWHINYucvXBELOdJ2FsuGTO7z4aeuSHNCSuBnOWgocsYXUO7I60OjpYcGmyxYthTE3+tfUiDKUAcRANSc6W+akodUu+P+q+I2GsGKdDTpWeEvWMRxv3Q0g68NAqKTQMdkGX7CJt/+8WmBrSdKcBxzwmggI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754508524; c=relaxed/simple;
	bh=9BHnF++kYa+XG6BaFLWvcpVxkEBg/rHpmekYrw9B3kg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jmjCiODTvYmRxF+bxkacom/n+dwrgFEuPwiVILIIM1pooR6sq7nPr39Y1iyuj0eo5Hs4h7RFqff/DbmjAiuEdEc2RdVWwoG8g3ESVL8IaPDWjLb+qm9jk0USp7XYK1m7KuhumIIw/nw8lrn0GCZpQqcGNATUWdmptgGof2TE9fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=tWYVcs2Z; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=kLnS8gYz; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4by0hS5KyRz9tFV;
	Wed,  6 Aug 2025 21:28:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1754508520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UKUlbuMXZtDdoyQopCc2zS0fKR8B7Ban5zcHHOI4cg0=;
	b=tWYVcs2ZxJ9M/O+SCCEw1KgkdmAT/w9ws32Sx8lgOC1kUi8F9l+AuvWd0Q9qkI1/RiKCO1
	3F5L3QR+Jfmy2TvhmdlAQ7LIoVg7RonoL89md4+K2qvH+5m0YTXv2kJdVln3lb6rdmcG6k
	wDqqXvwGZhyJ6AmsILIC4AQGf91lmCBNwditKW1y17CpMcMzwvEyy6n4sgr/srbtJH2aQR
	hToe6BCiG9uElIoRwJkCBNWOCfdOJvNzv2Xp+6AApHpUhhWOMrDITI5egzPrGyY2xCU65c
	0Zf+72wlbMVBBi6I3itoSR6Iq2he/KRSdsgLHw4n7sSsgZsZQ7ANNxFVsk5mfQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1754508518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UKUlbuMXZtDdoyQopCc2zS0fKR8B7Ban5zcHHOI4cg0=;
	b=kLnS8gYzAuzRiMLnRGF4qTmmQzDlr4Xy76yPhK50f/SVeJxtysVfzRdq1Wwz9FBnCvxARk
	sdVIChoe+WgYqoldp1Pjca4NcQKczDmOkIm1O20JXcbfUyQ2ZWdq0xE25eXyA/FWyzpUGP
	3pFNA66xd6vNriAj/jXTNhFg0uZ8lDaQU6yciid03uiVqanr84BNqmV93//Xf1Mt7UqPaJ
	x1g0l+kFJ+eK8TT+zKYrH5biBSF1JMLfSsbMCNe94R2r4pHYMy1gTN1T/Oy9jfEHnLDZP1
	3B7KsTrLrxAJUH8+4HJXWmXEqGjTjNI2aO3Kf0Tjdeqy6bTnq53+v+aY8BMGHg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: r8a779g3: Set VDDQ18_25_AVB voltage on Retronix R-Car V4H Sparrow Hawk EVTB1
Date: Wed,  6 Aug 2025 21:28:04 +0200
Message-ID: <20250806192821.133302-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 312b43adfc86edc3ab6
X-MBO-RS-META: yi6fh4jktfys8o3wk4e7todpkn5d79pd

The Retronix R-Car V4H Sparrow Hawk EVTB1 uses 1V8 IO voltage supply
for VDDQ18_25_AVB power rail. Update the AVB0 pinmux to reflect the
change in IO voltage. Since the VDDQ18_25_AVB power rail is shared,
all four AVB0, AVB1, AVB2, TSN0 PFC/GPIO POC[7..4] registers have to
be configured the same way. As the EVTA1 boards are from a limited run
and generally not available, update the DT to make it compatible with
EVTB1 IO voltage settings.

Fixes: a719915e76f2 ("arm64: dts: renesas: r8a779g3: Add Retronix R-Car V4H Sparrow Hawk board support")
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
index 89c61ba0e206..f4f845801ac9 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
@@ -608,6 +608,10 @@ pins-mii {
 			drive-strength = <21>;
 		};
 
+		pins-vddq18-25-avb {
+			pins = "PIN_VDDQ_AVB0", "PIN_VDDQ_AVB1", "PIN_VDDQ_AVB2", "PIN_VDDQ_TSN0";
+			power-source = <1800>;
+		};
 	};
 
 	/* Page 28 / CANFD_IF */
-- 
2.47.2


