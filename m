Return-Path: <linux-renesas-soc+bounces-23058-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37837BDE6EB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 14:16:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3502480B2B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 12:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15FFF3277A7;
	Wed, 15 Oct 2025 12:15:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF93B32779D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 12:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760530539; cv=none; b=GPACVIrZT8ZVZpWKPJ2DLZIEiFfZIM/jKNpCUnVCv8+opkAnWNamcJ+e0dduZ/qimcSQJb4u3bZg4aToS/kBw9JzzeV2MeakGbur/y+plcaLRWRdIcOiotDk5g+X3MxV3xP5Ajr/QP0VzKN5sZZvO/sxSEAXD52g07bd92H+4N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760530539; c=relaxed/simple;
	bh=QVYB/eAqiADxJGVO+eHlJ6q70TG9qmfPdTp+w/auQWs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JSjfXqNuGO1ypiFH2keO5hSX3Ud6t96vCPtEGfJ6tHe24+DUjip1j+Z1Z8HgwM8pah1TzK8SXxQZSQ7+B1IgLN33+DcOORQAP00JF25qsYfBxFCV2vFld8j8yzEEkOPbphnxIsGMkJVO9esF/CYtfAYbpSdCmNA+FSOyxCgxB1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE9DFC4CEFE;
	Wed, 15 Oct 2025 12:15:38 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: defconfig: Refresh for v6.18-rc1
Date: Wed, 15 Oct 2025 14:15:34 +0200
Message-ID: <d0fcc82fb294021bf96f8a490234165e15aadb43.1760530468.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh the defconfig for Renesas ARM systems:
  - Drop CONFIG_SCHED_MC=y (auto-enabled since commit 7bd291abe2da09f5
    ("sched: Unify the SCHED_{SMT,CLUSTER,MC} Kconfig")),
  - Disable CONFIG_SCHED_SMT (auto-enabled since commit 7bd291abe2da09f5
    ("sched: Unify the SCHED_{SMT,CLUSTER,MC} Kconfig")),
  - Restore CONFIG_ARM_GT_INITIAL_PRESCALER_VAL=1 (default changed to
    zero (auto-detect) in commit 1c4b87c921fb158d
    ("clocksource/drivers/arm_global_timer: Add auto-detection for
    initial prescaler values")),
  - Disable CONFIG_RPCSEC_GSS_KRB5 (auto-enabled since commit
    d8e97cc476e33037 ("SUNRPC: Make RPCSEC_GSS_KRB5 select CRYPTO
    instead of depending on it")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.19.
---
 arch/arm/configs/shmobile_defconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index e4cb33b2bcee2215..c1fd469e20718120 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -10,7 +10,6 @@ CONFIG_KEXEC=y
 CONFIG_ARCH_RENESAS=y
 CONFIG_PL310_ERRATA_588369=y
 CONFIG_SMP=y
-CONFIG_SCHED_MC=y
 CONFIG_NR_CPUS=8
 CONFIG_HIGHMEM=y
 CONFIG_ARM_APPENDED_DTB=y
@@ -24,6 +23,7 @@ CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
 CONFIG_CPUFREQ_DT=y
 CONFIG_VFP=y
 CONFIG_NEON=y
+# CONFIG_SCHED_SMT is not set
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_SLAB_FREELIST_HARDENED=y
 CONFIG_CMA=y
@@ -200,6 +200,7 @@ CONFIG_RZN1_DMAMUX=y
 CONFIG_RCAR_DMAC=y
 CONFIG_RENESAS_USB_DMAC=y
 CONFIG_RZ_DMAC=y
+CONFIG_ARM_GT_INITIAL_PRESCALER_VAL=1
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_IIO=y
 CONFIG_AK8975=y
@@ -218,6 +219,7 @@ CONFIG_NFS_V3_ACL=y
 CONFIG_NFS_V4=y
 CONFIG_NFS_V4_1=y
 CONFIG_ROOT_NFS=y
+# CONFIG_RPCSEC_GSS_KRB5 is not set
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_DMA_CMA=y
-- 
2.43.0


