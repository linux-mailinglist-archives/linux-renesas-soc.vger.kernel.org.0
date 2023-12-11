Return-Path: <linux-renesas-soc+bounces-921-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F0A80DDDC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 23:07:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9174C1F21A62
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 22:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09FC555776;
	Mon, 11 Dec 2023 22:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SjoP21Ct"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E045B55774
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Dec 2023 22:06:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E1BCC433C7;
	Mon, 11 Dec 2023 22:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702332415;
	bh=GJIc4lcmbnE1QNCXgfA52Krp47pye0PnIUxJw5mQkV0=;
	h=From:To:Cc:Subject:Date:From;
	b=SjoP21CtsyjRX/8L/C9NP2DGApb80nFM3iwiEe07Hd5Klq1nOOWjh4xrzXMbUK7b+
	 vrwfsu6sZ3PjzOBMug0mPszLIth6elZoHiPnAueSpvBBDx84+RczDfkzUktL28RVX6
	 DQocX8a3Wm+NX9jHFzNoBivFvtOEOIFABAXJrlKGipBKxLXKmKbkjWIqcvDrqxNYdm
	 H3ljXrIuRxfFqgUc/H17di/S+0yfi7DGWStIXYZ8cibdk6Jd0CyTG7wP8IUY3PiVbQ
	 RbZ5V/hHLmTrAXXv2CI+N0bTRFTSnuquLRs52r4uv/ecnjIEK3kBuGhSd9JRObgO5u
	 BOpT77Gj8zMNg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] soc: renesas: make ARCH_R9A07G043 depend on !DMA_DIRECT_REMAP
Date: Mon, 11 Dec 2023 22:06:36 +0000
Message-Id: <20231211-primate-arbitrate-fbcd307a0b00@spud>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1934; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=QZakA2jngPjyPv1mx6ddYU3DUAgBXMmCEkYM0tqgkJ0=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnl7a82avC45SVsOHSnMmD9kqi39+oOv/E4eGLKiSyF7 VN/TtBY21HKwiDGwSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJPNRk+KfM9DVladJpqQ75 m0teZL07tsT4/tX4e0/S9Rbr6P7c0VjI8D/TrVIzd+K13GU5e46oLdrQJREb+yKi8eFNtiuPHyq XpTMDAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Randy reported yet another build issue with randconfigs on rv32:
WARNING: unmet direct dependencies detected for DMA_GLOBAL_POOL
  Depends on [n]: !ARCH_HAS_DMA_SET_UNCACHED [=n] && !DMA_DIRECT_REMAP [=y]
  Selected by [y]:
  - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y] && NONPORTABLE [=y] && RISCV_ALTERNATIVE [=y] && !RISCV_ISA_ZICBOM [=n] && RISCV_SBI [=y]

This happens when DMA_DIRECT_REMAP is selected by the T-Head CMO erratum
option and DMA_GLOBAL_POOL is selected by the Andes CMO erratum. Block
selecting the RZ/Five config option, and by extension DMA_GLOBAL_POOL,
if DMA_DIRECT_REMAP has already been enabled.

Fixes: 484861e09f3e ("soc: renesas: Kconfig: Select the required configs for RZ/Five SoC")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
Closes: https://lore.kernel.org/all/24942b4d-d16a-463f-b39a-f9dfcb89d742@infradead.org/
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
I don't know what the exact fixes tag here is as I did not bisect with
the randconfig, so I blamed the one that added DMA_GLOBAL_POOL.

CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Magnus Damm <magnus.damm@gmail.com>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: linux-renesas-soc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 drivers/soc/renesas/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 0071864c2111..0986672f6375 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -340,6 +340,7 @@ if RISCV
 config ARCH_R9A07G043
 	bool "RISC-V Platform support for RZ/Five"
 	depends on NONPORTABLE
+	depends on !DMA_DIRECT_REMAP
 	depends on RISCV_ALTERNATIVE
 	depends on !RISCV_ISA_ZICBOM
 	depends on RISCV_SBI
-- 
2.39.2


