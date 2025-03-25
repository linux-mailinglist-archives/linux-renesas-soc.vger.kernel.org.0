Return-Path: <linux-renesas-soc+bounces-14807-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA0EA70626
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Mar 2025 17:10:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33A13166E42
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Mar 2025 16:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55C5F253B62;
	Tue, 25 Mar 2025 16:09:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5045C43169;
	Tue, 25 Mar 2025 16:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742918982; cv=none; b=bmcF9RIbN1nYm8bpxAZ6W8cLCbtsUV1W4/H5Ahbd/cI6Vf2O6iltX2XN9iXn37DxVDPgU8KUGQy4CBirMlUg0Hpr3IpP8zLX4R8teuSoKBg6j2CvAFi7WJStRFFwn51xnsJ/GWaTyjC79jybqPfPVRcfXEeGHD7wp9y/9FsOKM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742918982; c=relaxed/simple;
	bh=kIIhap8HHtdygduKnJD2Dzi2BD6wNxjYtj71BZqPEzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fSk5cvqFS/6MAHa/zK50+Ed0928irAkbkDZitk8T6nZJ8XbvE68U05GJEWnGDIaV4XhBkJhQJynk9DsS2f90g1TTd64EncHB4eXpiBdcVBlDZF0cfr76eNCNOljmggHCXgNwJCe/GkES6bT745jx14AsGa4kCW2EGt+O8geWvKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 0T9Ron3/TEKqeOlo8NHeVQ==
X-CSE-MsgGUID: dwyM3W7PQz+wHiW9uhfZVQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 26 Mar 2025 01:09:39 +0900
Received: from superbuilder.administration.lan (unknown [10.226.93.92])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 466334013742;
	Wed, 26 Mar 2025 01:09:36 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 04/13] soc: renesas: Add RZ/T2H (R9A09G077) config option
Date: Tue, 25 Mar 2025 17:08:52 +0100
Message-ID: <20250325160904.2688858-5-thierry.bultel.yh@bp.renesas.com>
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

Add a configuration option for the RZ/T2H SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
Changes v4->v5: none
Changes v3->v4:
  - Sets ARCH_R9A09G077 to Y by default.
---
 drivers/soc/renesas/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 6d2e135eed89..6522328e4d9a 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -356,6 +356,12 @@ config ARCH_R9A09G057
 	help
 	  This enables support for the Renesas RZ/V2H(P) SoC variants.
 
+config ARCH_R9A09G077
+	bool "ARM64 Platform support for RZ/T2H"
+	default y if ARCH_RENESAS
+	help
+	  This enables support for the Renesas RZ/T2H SoC variants.
+
 endif # ARM64
 
 if RISCV
-- 
2.43.0


