Return-Path: <linux-renesas-soc+bounces-17142-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FD2AB893D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 16:21:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 156BB3AE172
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 14:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C70F41E5B71;
	Thu, 15 May 2025 14:19:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B88B21A440;
	Thu, 15 May 2025 14:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747318757; cv=none; b=ZWBT4jgym8Vj6sv9BztC5RThWjFhE0YLg2VzYSDNg8sJPFiRuIREx9g6xw9RljXmva3mro8KQwa3m16NeacvNHsST39wB2fcpmG8h1WM5YOL2Q0BnkVsDKvcdSfoFDFbYDH5AePOT09gb+P3Z5zvZK59N9OaNa3LVAAjClLNOSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747318757; c=relaxed/simple;
	bh=Hia61omZ5Zv+4yjM0jKYxeiUzC34dbJkS7sfdLdcMFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T5CWKWuucQIq3gvuwBt+J1REVQAabu1JwLAXjI62CK1r3NUakoNoFLiJfgUcOA994p+f9yMWOxQuT9cfKCqZWaRbtgcfWotFV3MHwizyZYAvJo5Drnptn1WkOq82FqkAXbz3qlqutvoOK4dJyQDLFQR92gGByRA9Qs6/J3Lekqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: Eo48T7FFRY6gvj2zvSwEfw==
X-CSE-MsgGUID: MO1oW8DuRf6XOUjxuTif3g==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 15 May 2025 23:19:15 +0900
Received: from superbuilder.administration.lan (unknown [10.226.93.187])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 249D6401A460;
	Thu, 15 May 2025 23:19:11 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 10/10] arm64: defconfig: Enable Renesas RZ/T2H serial SCI
Date: Thu, 15 May 2025 16:18:25 +0200
Message-ID: <20250515141828.43444-11-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250515141828.43444-1-thierry.bultel.yh@bp.renesas.com>
References: <20250515141828.43444-1-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Selects RZ/T2H (aka r9a09g077) SCI (serial) specific code.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
Changes v8->v9: none
Changes v7->v8: none
Changes v6->v7: none
Changes v5->v6:
   - Renamed CONFIG_SERIAL_RZ_SCI_T2 to CONFIG_SERIAL_RSCI
Changes v4->v5:
   - Renamed CONFIG_SERIAL_RZ_SCI to CONFIG_SERIAL_RZ_SCI_T2
Changes v3->v4:
   - Remove CONFIG_ARCH_R9A09G077=y
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 04619fe7e22a..bd2aeb7c13a7 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -495,6 +495,7 @@ CONFIG_SERIAL_TEGRA_TCU=y
 CONFIG_SERIAL_IMX=y
 CONFIG_SERIAL_IMX_CONSOLE=y
 CONFIG_SERIAL_SH_SCI=y
+CONFIG_SERIAL_RSCI=y
 CONFIG_SERIAL_MSM=y
 CONFIG_SERIAL_MSM_CONSOLE=y
 CONFIG_SERIAL_QCOM_GENI=y
-- 
2.43.0


