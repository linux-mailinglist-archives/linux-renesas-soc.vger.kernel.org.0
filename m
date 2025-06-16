Return-Path: <linux-renesas-soc+bounces-18358-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFEEADAF11
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 13:50:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C96D73A6484
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 11:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C11D02D9EE1;
	Mon, 16 Jun 2025 11:50:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EE92737F4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jun 2025 11:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750074625; cv=none; b=tunbo41CjTYcD8sToANA0fhbV1ud2tyZnb0+W6/J//66mDkAB3MLdvKxWSrMgdrF0O2mSR4G7fNTYE8ZALEYDtRiSvITExvuJLpsMZPSaRphqJp/UtcU6CLiUk8WCaYGGFSTHrWjr2AFrASPOY57LVCOBFHFUgib7sT1YeXv06Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750074625; c=relaxed/simple;
	bh=d51ANhQW4AQEai30Tz9p5pDeU8/8s7l15AS/HMImais=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f7DI/nw4Q8vJb2X2M4zRI+HYspg9ijH9ozAOy1k3Ca0F8wYZfjLxV3WcM37BTH0qFs3UsU502CJhahkeNr0UkQ3tJOpS82IFpUbMRZ+f+9NGbQABbV7N1lqWpqm+Sw7bw82BAQkP0/jXu2xH4cGWL2Me3qZNLHnX+5SsE1uI414=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83BA9C4CEEA;
	Mon, 16 Jun 2025 11:50:24 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH LOCAL] riscv: rzfive: defconfig: Refresh for v6.16-rc2
Date: Mon, 16 Jun 2025 13:50:20 +0200
Message-ID: <09a124b503cb00fb45be844bc34d8ca29d78bc22.1750074549.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh the defconfig for Renesas RZ/Five systems:
  - Drop CONFIG_SYSFS_SYSCALL=n (disabled by default since commit
    c443279a87d54bf3 ("Kconfig: switch CONFIG_SYSFS_SYCALL default to
    n"),
  - Disable support for the Zicbop cache block prefetch and SiFive vendor
    extensions (not supported by RZ/Five),

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.

 arch/riscv/configs/rzfive_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/configs/rzfive_defconfig b/arch/riscv/configs/rzfive_defconfig
index e9998a22dee140cd..cad73b9e83eceac5 100644
--- a/arch/riscv/configs/rzfive_defconfig
+++ b/arch/riscv/configs/rzfive_defconfig
@@ -24,7 +24,6 @@ CONFIG_CHECKPOINT_RESTORE=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_EXPERT=y
-# CONFIG_SYSFS_SYSCALL is not set
 CONFIG_PROFILING=y
 CONFIG_ARCH_RENESAS=y
 CONFIG_ERRATA_SIFIVE=y
@@ -40,6 +39,8 @@ CONFIG_NONPORTABLE=y
 # CONFIG_RISCV_ISA_ZBKB is not set
 # CONFIG_RISCV_ISA_ZICBOM is not set
 # CONFIG_RISCV_ISA_ZICBOZ is not set
+# CONFIG_RISCV_ISA_ZICBOP is not set
+# CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE is not set
 # CONFIG_RISCV_ISA_VENDOR_EXT_THEAD is not set
 # CONFIG_EFI is not set
 CONFIG_PM_AUTOSLEEP=y
-- 
2.43.0


