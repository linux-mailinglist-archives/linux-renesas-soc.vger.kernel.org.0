Return-Path: <linux-renesas-soc+bounces-14105-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3666A54F27
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 16:32:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BDBF3B5A3B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 15:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 216CB212B2F;
	Thu,  6 Mar 2025 15:27:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27545212B38;
	Thu,  6 Mar 2025 15:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741274827; cv=none; b=mRcG9ay9qEorH3MNJZahojdmSwBo3NIQjmM4hCb9CeKKjSsr1HlQ7GkePU+r5mre3mDQ/AUo4o1/2GX4s9WTL99MNMBJf1w1iSrZQZU6m2ROke2/Gs3iQo/X/tZVK68P2VZL/J0JLToo+1zG4ZmdghftYkMMyUreByB0MwzYZMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741274827; c=relaxed/simple;
	bh=0vAGNxEXvcMnWd9i3SSpwKgAZSLnib+IaDV8WQTKa/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XiK45fpLDK/mXBjforlBU/MtfdYN97vNNn46j6yLC+ZrmCojbX0h2ZYfM94qAxoQE7rae8WvKi57iDx+EwVfGgKkxqZLhuqfHk+7c8G/7C383vAYXxkHhoPo6h+O4ebw3D8C62jrEX3VtDoYxDSkpq56N0VjyOIRWfBDIk6AGyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: xxiKjAxeSTmGXV/kVDUV8A==
X-CSE-MsgGUID: k7Y5oJ7jT6Gpp2h/+8ehBQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 07 Mar 2025 00:27:04 +0900
Received: from superbuilder.administration.lan (unknown [10.226.93.123])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9225D400091F;
	Fri,  7 Mar 2025 00:27:01 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 13/13] arm64: defconfig: Enable Renesas RZ/T2H serial SCI
Date: Thu,  6 Mar 2025 16:24:47 +0100
Message-ID: <20250306152451.2356762-14-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com>
References: <20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com>
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
Changes v3->v4:
   - Remove CONFIG_ARCH_R9A09G077=y
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da4415599..1403848d659e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -492,6 +492,7 @@ CONFIG_SERIAL_TEGRA_TCU=y
 CONFIG_SERIAL_IMX=y
 CONFIG_SERIAL_IMX_CONSOLE=y
 CONFIG_SERIAL_SH_SCI=y
+CONFIG_SERIAL_RZ_SCI=y
 CONFIG_SERIAL_MSM=y
 CONFIG_SERIAL_MSM_CONSOLE=y
 CONFIG_SERIAL_QCOM_GENI=y
-- 
2.43.0


