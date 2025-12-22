Return-Path: <linux-renesas-soc+bounces-25969-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A135ACD5459
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 10:14:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B9B73008FAA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 09:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A214C30DD07;
	Mon, 22 Dec 2025 09:14:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DDE252292
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 09:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766394871; cv=none; b=UTpi2bGVCQIKHTnoUXGRTjsa5WtxBpU8cqH1RK9cvfIQAlB5At6qSZAmmfiM6eGrqBcjZxuilqNJBgQl8q8pCgtYKSVLls+rCxyHm4xO3Gsa5kX4spGreFw5i5BeslDMSVoZmaiU+PW10ks5jSeUjN/OmCIkgoIMmaSYzPm0dqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766394871; c=relaxed/simple;
	bh=SPNfp9C4JetY2+wt+wRTvsNqsz37CzqLWxyV4L3aSF0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MXZx3ljT7x2O5aH5wU+vIgNAGhdcenp5QXdupi6HyF/MRmSSH+vJsOnrN0+Vb4BGXuf2tX9RyOKmtOfXt8ERGQtw27QEzjf4HFIwQcs7Kmows+TfeSwwOqbpAgsPoiQAB2fdwk9LfOQAoh1I6KyWkmRRNss/iIjsDrrih9ypOnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A4DFC4CEF1;
	Mon, 22 Dec 2025 09:14:29 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: defconfig: Refresh for v6.19-rc1
Date: Mon, 22 Dec 2025 10:14:27 +0100
Message-ID: <2dc339bee5bee0a425e2b00bbb784b0ec21a0a33.1766394793.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh the defconfig for Renesas ARM systems:
  - Enable Renesas RZ/N1 ADC support,
  - Drop CONFIG_RPCSEC_GSS_KRB5=n (no longer auto-enabled since now
    commit 324be6dcbf09133a ('Revert "SUNRPC: Make RPCSEC_GSS_KRB5
    select CRYPTO instead of depending on it"')).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.20.
---
 arch/arm/configs/shmobile_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 0085921833c3e832..ef487eab17cc70aa 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -202,6 +202,7 @@ CONFIG_RZ_DMAC=y
 CONFIG_ARM_GT_INITIAL_PRESCALER_VAL=1
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_IIO=y
+CONFIG_RZN1_ADC=y
 CONFIG_AK8975=y
 CONFIG_PWM=y
 CONFIG_PWM_RENESAS_RCAR=y
@@ -218,7 +219,6 @@ CONFIG_NFS_V3_ACL=y
 CONFIG_NFS_V4=y
 CONFIG_NFS_V4_1=y
 CONFIG_ROOT_NFS=y
-# CONFIG_RPCSEC_GSS_KRB5 is not set
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_DMA_CMA=y
-- 
2.43.0


