Return-Path: <linux-renesas-soc+bounces-15667-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51037A82596
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 15:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38AB6463BCB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 13:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F4E25F960;
	Wed,  9 Apr 2025 13:07:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E7825FA04
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Apr 2025 13:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744204077; cv=none; b=fTf+0HZqPInzpH43p6alvwXS49F1RBqIAFIhvnU+NmbiobCZsNtApYwdgdo/PYyBrHjIuLt0u8QNJvDIAyrc70ayf1/3CPtemcFjPONLx4/b4mO/S71aau3PfIrwt8l9AzgBLL4/lL4TLdz02Cvgo51cztWR9xWOMsam1/oJNoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744204077; c=relaxed/simple;
	bh=C1vraoQBObiyXpMp1P/YOGaFy8b8Y7VTt808Ey9/CZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K+KXvLablvfxMhZwmiBk4/i28RMB03hzvS+BfiJL2GP+eCsJIHV2kBUHjna6SRNakTirZP9hIMt9TBurVxL712UPZ281PY5wfCy10XWrhtW2m/dlaHkcOvtOSkAouWbTPk/QcS+FMQxEI8pCMKtkKHa3N6d6TwW+EF6QuYHqOgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4ZXjsw3lk7z4x1mD
	for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Apr 2025 15:07:48 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:d6c1:79b5:9acd:4fad])
	by laurent.telenet-ops.be with cmsmtp
	id b17g2E00D1LzlAN0117gWz; Wed, 09 Apr 2025 15:07:41 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u2V9X-00000000DQM-1XWg;
	Wed, 09 Apr 2025 15:07:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u2UvS-00000003JF3-2l6A;
	Wed, 09 Apr 2025 14:53:06 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL] riscv: rzfive: defconfig: Refresh for v6.15-rc1
Date: Wed,  9 Apr 2025 14:53:05 +0200
Message-ID: <8a76cfea356d60b15e1108e408ca09f3fff8c0f5.1744203111.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh the defconfig for Renesas RZ/Five systems:
  - Disable support for the Zbkb ISA extension for bit manipulation
    instructions, as it is not supported by RZ/Five,
  - Drop CONFIG_SCHED_DEBUG=n (removed in commit b52173065e0aad82
    ("sched/debug: Remove CONFIG_SCHED_DEBUG")).

---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/riscv/configs/rzfive_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/configs/rzfive_defconfig b/arch/riscv/configs/rzfive_defconfig
index b5462ae3163521d6..e9998a22dee140cd 100644
--- a/arch/riscv/configs/rzfive_defconfig
+++ b/arch/riscv/configs/rzfive_defconfig
@@ -37,6 +37,7 @@ CONFIG_NONPORTABLE=y
 # CONFIG_RISCV_ISA_ZBA is not set
 # CONFIG_RISCV_ISA_ZBB is not set
 # CONFIG_RISCV_ISA_ZBC is not set
+# CONFIG_RISCV_ISA_ZBKB is not set
 # CONFIG_RISCV_ISA_ZICBOM is not set
 # CONFIG_RISCV_ISA_ZICBOZ is not set
 # CONFIG_RISCV_ISA_VENDOR_EXT_THEAD is not set
@@ -212,7 +213,6 @@ CONFIG_DEBUG_MEMORY_INIT=y
 CONFIG_SOFTLOCKUP_DETECTOR=y
 CONFIG_WQ_WATCHDOG=y
 CONFIG_WQ_CPU_INTENSIVE_REPORT=y
-# CONFIG_SCHED_DEBUG is not set
 CONFIG_DEBUG_RT_MUTEXES=y
 CONFIG_DEBUG_SPINLOCK=y
 CONFIG_DEBUG_MUTEXES=y
-- 
2.43.0


