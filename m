Return-Path: <linux-renesas-soc+bounces-14816-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C13DA7065D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Mar 2025 17:13:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3FB67A75B3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Mar 2025 16:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3B9725743E;
	Tue, 25 Mar 2025 16:10:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E4F02571CD;
	Tue, 25 Mar 2025 16:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742919027; cv=none; b=E8PZYzFPXH89ZgvznhgZQOZ7i+Vep/HEs20pbtKk55meTVrxhwuRxIGLzixo4CSjYUhB9rm57Zu4pBkJuptKcUTXL+ucrUr6Hyo/HK+wFkTnRI1dV2A6vu4GhZk1pLveAyv3/QXEwccdT8mWNUTa+VR6t92ioozbrrxWSMGvCFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742919027; c=relaxed/simple;
	bh=7jpFlkZFIPn+CFD4GKO+3v8Kb/sOCF3+lpXcZxAyPdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cLCRew7wflvLZSKVoyQq00Wu+pbghh9AuhnXvGGpJocEkfuYqefPwkLsfm9RqrfAUlX05l85etW192dP5zLLh2UsLTHut9RKf/HXtxe8LI2HDyCsAIN1e4ZcrvpgQjznPlGbFHcMrhp0y3KC+muRGNxSd3ofiiqrifCBjnlRLsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: A/fQKbXvSr2TxMtcVS998A==
X-CSE-MsgGUID: qI/YtFrRQh2DEQq7gV2JAw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 26 Mar 2025 01:10:24 +0900
Received: from superbuilder.administration.lan (unknown [10.226.93.92])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5A6694013766;
	Wed, 26 Mar 2025 01:10:22 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 13/13] arm64: defconfig: Enable Renesas RZ/T2H serial SCI
Date: Tue, 25 Mar 2025 17:09:01 +0100
Message-ID: <20250325160904.2688858-14-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250325160904.2688858-1-thierry.bultel.yh@bp.renesas.com>
References: <20250325160904.2688858-1-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Selects RZ/T2H (aka r9a09g077) SCI (serial) specific code.

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
Changes v4->v5:
   - Renamed CONFIG_SERIAL_RZ_SCI to CONFIG_SERIAL_RZ_SCI_T2
Changes v3->v4:
   - Remove CONFIG_ARCH_R9A09G077=y
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da4415599..100f85ceeff5 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -492,6 +492,7 @@ CONFIG_SERIAL_TEGRA_TCU=y
 CONFIG_SERIAL_IMX=y
 CONFIG_SERIAL_IMX_CONSOLE=y
 CONFIG_SERIAL_SH_SCI=y
+CONFIG_SERIAL_RZ_SCI_T2=y
 CONFIG_SERIAL_MSM=y
 CONFIG_SERIAL_MSM_CONSOLE=y
 CONFIG_SERIAL_QCOM_GENI=y
-- 
2.43.0


