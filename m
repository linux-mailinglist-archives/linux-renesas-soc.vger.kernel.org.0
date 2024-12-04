Return-Path: <linux-renesas-soc+bounces-10908-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 524239E3C1B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 15:06:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C877166C05
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 14:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E762A1F7589;
	Wed,  4 Dec 2024 14:05:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30A61F7063
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Dec 2024 14:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733321152; cv=none; b=aDgBT7B0PKcqdLxs3vNKwC5zWAe7VTFb83yoXUP/bNU2MlPLw0UtU3aoXW/72uvERleaEMKggTpiG05fKq/PQC0Uf6brDkooguPAtEUhvSpNHHDLvXtP5m1Ztf8R5Ok+MAsljGSrhhnk9E3gfvx6VB+YVG9e9nDCjZ92KDDF7mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733321152; c=relaxed/simple;
	bh=rzDkZhnNZDnr5nIpDSvDJlHH89L+/UoaIO9p5VdcsiE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WW2EYM7eNIvm8gvfvUF1fgkVlnPZuEviEItXCXpbzcv1NVYqrxoBiS4uiDxlalMzDpXFD3bWdTooKixUPhPI5b6FlHyO2V04uA5qFXi3KbW9AWz65PoJyNyXX6mELm0MuiGid79bhGZjDFoMLoP5wcsvLcVXb7Yx07VhWNZli9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:8249:563a:8153:89fa])
	by albert.telenet-ops.be with cmsmtp
	id ke5h2D00S1ljHKM06e5hos; Wed, 04 Dec 2024 15:05:41 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tIq0a-000HEa-Nl;
	Wed, 04 Dec 2024 15:05:41 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tIq0b-00DJfP-Dp;
	Wed, 04 Dec 2024 15:05:41 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL] riscv: rzfive: defconfig: Refresh for v6.13-rc1
Date: Wed,  4 Dec 2024 15:05:39 +0100
Message-Id: <907bc1b1ac5cc5840da47f6d8204fd1213164644.1733321043.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh the defconfig for Renesas RZ/Five systems:
  - Disable support for pointer masking in userspace (Supm) (RZ/Five
    does not support the Supm extension),
  - Disable RISC-V IOMMU Support (RZ/Five does not support the RISC-V
    IOMMU architecture),
  - Drop CONFIG_DEBUG_TIMEKEEPING=y (removed in commit d44d26987bb3df6d
    ("timekeeping: Remove CONFIG_DEBUG_TIMEKEEPING")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.

 arch/riscv/configs/rzfive_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/configs/rzfive_defconfig b/arch/riscv/configs/rzfive_defconfig
index 1757d97e65c8f1bc..fe44f9cdc724c2ba 100644
--- a/arch/riscv/configs/rzfive_defconfig
+++ b/arch/riscv/configs/rzfive_defconfig
@@ -29,6 +29,7 @@ CONFIG_PROFILING=y
 CONFIG_ARCH_RENESAS=y
 CONFIG_ERRATA_SIFIVE=y
 CONFIG_NONPORTABLE=y
+# CONFIG_RISCV_ISA_SUPM is not set
 # CONFIG_RISCV_ISA_ZICBOM is not set
 # CONFIG_EFI is not set
 CONFIG_PM_AUTOSLEEP=y
@@ -153,6 +154,7 @@ CONFIG_SYNC_FILE=y
 CONFIG_COMMON_CLK_VC3=y
 CONFIG_RENESAS_OSTM=y
 CONFIG_MAILBOX=y
+# CONFIG_RISCV_IOMMU is not set
 CONFIG_RPMSG_CHAR=y
 CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_VIRTIO=y
@@ -202,7 +204,6 @@ CONFIG_SOFTLOCKUP_DETECTOR=y
 CONFIG_WQ_WATCHDOG=y
 CONFIG_WQ_CPU_INTENSIVE_REPORT=y
 # CONFIG_SCHED_DEBUG is not set
-CONFIG_DEBUG_TIMEKEEPING=y
 CONFIG_DEBUG_RT_MUTEXES=y
 CONFIG_DEBUG_SPINLOCK=y
 CONFIG_DEBUG_MUTEXES=y
-- 
2.34.1


