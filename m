Return-Path: <linux-renesas-soc+bounces-15356-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C3249A7B14F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Apr 2025 23:35:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04F167A4856
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Apr 2025 21:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7524719D065;
	Thu,  3 Apr 2025 21:31:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 676F619AD48;
	Thu,  3 Apr 2025 21:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715875; cv=none; b=GvOz9gBkX7Jl5A6XUkqMW7TtSZw159OfvGEsNv00Hi0/CB1MSKmVE1XcgqEE5LypJhyKhrLkz7KUX6VZVtXeV0daz/LlU+g3J4e0B7UvEp5MimUdkTu1M/sCHFhCUmapsoVQVegVFfnEcUDMLfn/tEjKl7TiR5wrL2DjaHGdKPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715875; c=relaxed/simple;
	bh=2cIqA28aHKnzUlLbVSYwyBA4oSd8/gAxoKlzQer2LiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W5OQ4Ht1i44JxC061HKvdQ5xl/DGbb3qhL53X27fhoJQfPTq9sl3HADKHpgPgK4xRZQ/nZVuYKfZgn7i7gILX4hAaGGm/JJJrEFZdhcqoNv1QXWp/Wvc0RNnV5rnNUwI7lN1fXztQqbT9EX/4ylx/I3Gsd5wwzcSTD1SaqxKMJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 6BgU7RT8Qs6mvMmb/aNMhQ==
X-CSE-MsgGUID: WEPXP2IWRuizs4QHM0kemg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 04 Apr 2025 06:31:12 +0900
Received: from superbuilder.administration.lan (unknown [10.226.92.33])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6199840B55D9;
	Fri,  4 Apr 2025 06:31:09 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 13/13] arm64: defconfig: Enable Renesas RZ/T2H serial SCI
Date: Thu,  3 Apr 2025 23:29:15 +0200
Message-ID: <20250403212919.1137670-14-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250403212919.1137670-1-thierry.bultel.yh@bp.renesas.com>
References: <20250403212919.1137670-1-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Selects RZ/T2H (aka r9a09g077) SCI (serial) specific code.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
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
index 5bb8f09422a2..fcfc7b2e5819 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -494,6 +494,7 @@ CONFIG_SERIAL_TEGRA_TCU=y
 CONFIG_SERIAL_IMX=y
 CONFIG_SERIAL_IMX_CONSOLE=y
 CONFIG_SERIAL_SH_SCI=y
+CONFIG_SERIAL_RSCI=y
 CONFIG_SERIAL_MSM=y
 CONFIG_SERIAL_MSM_CONSOLE=y
 CONFIG_SERIAL_QCOM_GENI=y
-- 
2.43.0


