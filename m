Return-Path: <linux-renesas-soc+bounces-16286-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDC5A9A096
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 07:41:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3DE0443E99
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 05:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 690241B392B;
	Thu, 24 Apr 2025 05:41:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A1B139B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Apr 2025 05:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745473276; cv=none; b=fH8Ba/uTdbuFd7ckFz/U1OMBQMRCi+22kzpLNljxPvYQ+uQzyURHSSXbRHENkBATxgsSdHWK6CIJbYT0ipotW3Yqf32oPA4eA4p9qyi1Q9xIh8j9Sj9RpArANiCU5NVHB8sT96dE4nFAOi0oI0WStGbofdhSni+pNcwvQer0qSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745473276; c=relaxed/simple;
	bh=N/GyYjANPef0b2EBuQ1zxecXFnExbeoaELQ1yjMxY0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B6o1C2ZxR6DtkW3FIn1GdD81C/15fIDFMVFNuDSqCATBtT5xKQxiYLpqbE/YVX+IeZSu5uklkwN/zTfowwEdivREkUYF4kGrsJMCZr/WlNA2/H2b+cnPKkmclxE8wAOazs0BYvAv6cg2eEHdaDyW0Pt2ZYnCvEreSlRCw4SyL80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: jWi4rU2fThuYd+JJCFFIow==
X-CSE-MsgGUID: djJrSqZaQwaoPOUoXN9yiw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 24 Apr 2025 14:41:14 +0900
Received: from localhost.localdomain (unknown [10.226.92.69])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1D7E54160629;
	Thu, 24 Apr 2025 14:41:09 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Taniya Das <quic_tdas@quicinc.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-arm-kernel@lists.infradead.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/4] arm64: defconfig: Enable Renesas RZ/G2L GPT config
Date: Thu, 24 Apr 2025 06:40:47 +0100
Message-ID: <20250424054050.28310-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424054050.28310-1-biju.das.jz@bp.renesas.com>
References: <20250424054050.28310-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable PWM config for Renesas RZ/G2L GPT as it is populated on
the RZ/G2L and RZ/V2L SMARC EVKs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 904c3f742ecc..ab08d2c2b722 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1534,6 +1534,7 @@ CONFIG_PWM_MEDIATEK=m
 CONFIG_PWM_RCAR=m
 CONFIG_PWM_RENESAS_TPU=m
 CONFIG_PWM_ROCKCHIP=y
+CONFIG_PWM_RZG2L_GPT=m
 CONFIG_PWM_RZ_MTU3=m
 CONFIG_PWM_SAMSUNG=y
 CONFIG_PWM_SL28CPLD=m
-- 
2.43.0


