Return-Path: <linux-renesas-soc+bounces-23059-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFEBBDE6F1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 14:16:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCFB9483A47
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 12:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF70324B23;
	Wed, 15 Oct 2025 12:16:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777EB3233ED
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 12:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760530593; cv=none; b=K4XumMoUiATOSHkevKHX9fV0d4eL6qjwm63Ke1z/8EINZGmBTGrrCU7KJIW0sl+nygE1P247TyYVAjcNmkEn6mdIv7f0Pp1SXMIoXzJCAzh21CBOw9tM6n3deJEwaGqL8GixhKpLIoBSvsarBZwbl67eQMdkNVYliueQ529rj18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760530593; c=relaxed/simple;
	bh=IxZcznTI5iD/ogp8uefPQY6raRWStwXjYZ7eo3mRWjw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j5SQiHKhj9WgpKmR3lw/IC67gL/ooQMM85Y6DQLYU439Y/GfNpOD14tFnHXiPd/O0npHlqCZM9jXMPXdyOzr5Gg9IaNA/MNFdKbxVDN0OuHP+7BAKXG2kmrPjELeROzaxOsMR/RT+z6QwsiZ8gachRMRy+c5rvGYZHLuCGnDZAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40EFAC4CEF8;
	Wed, 15 Oct 2025 12:16:32 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v6.18-rc1
Date: Wed, 15 Oct 2025 14:16:29 +0200
Message-ID: <4458f6e978684ce5a298c55d8a95edf9e611ca9d.1760530547.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh the defconfig for Renesas ARM64 systems:
  - Drop CONFIG_SCHED_MC=y and CONFIG_SCHED_CLUSTER=y (auto-enabled
    since commit 7bd291abe2da09f5 ("sched: Unify the
    SCHED_{SMT,CLUSTER,MC} Kconfig")),
  - Disable CONFIG_SCHED_SMT (auto-enabled since commit 7bd291abe2da09f5
    ("sched: Unify the SCHED_{SMT,CLUSTER,MC} Kconfig")),
  - Enable Renesas RZ/G3E and RZ/G3S thermal support, as used on the
    RZ/G3E and RZ/G3S SMARC EVK boards,
  - Move CONFIG_SND_SIMPLE_CARD, CONFIG_SND_AUDIO_GRAPH_CARD, and
    CONFIG_SND_AUDIO_GRAPH_CARD2 (moved in commit f13ab498726bb6c6
    ("ASoC: generic: tidyup standardized ASoC menu for generic")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/arm64/configs/renesas_defconfig | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 9acaae96a5628184..8803b90c625885f3 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -56,8 +56,6 @@ CONFIG_ARCH_RENESAS=y
 # CONFIG_ROCKCHIP_ERRATUM_3588001 is not set
 # CONFIG_SOCIONEXT_SYNQUACER_PREITS is not set
 CONFIG_ARM64_VA_BITS_48=y
-CONFIG_SCHED_MC=y
-CONFIG_SCHED_CLUSTER=y
 CONFIG_NR_CPUS=8
 CONFIG_XEN=y
 CONFIG_COMPAT=y
@@ -80,6 +78,7 @@ CONFIG_CPU_FREQ=y
 CONFIG_CPUFREQ_DT=y
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM=y
+# CONFIG_SCHED_SMT is not set
 CONFIG_BLK_DEV_INTEGRITY=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_SLAB_FREELIST_HARDENED=y
@@ -212,6 +211,8 @@ CONFIG_THERMAL_EMULATION=y
 CONFIG_RCAR_THERMAL=y
 CONFIG_RCAR_GEN3_THERMAL=y
 CONFIG_RZG2L_THERMAL=y
+CONFIG_RZG3E_THERMAL=y
+CONFIG_RZG3S_THERMAL=y
 CONFIG_WATCHDOG=y
 CONFIG_RENESAS_WDT=y
 CONFIG_RENESAS_RZG2LWDT=y
@@ -313,9 +314,6 @@ CONFIG_SND=y
 # CONFIG_SND_SPI is not set
 # CONFIG_SND_USB is not set
 CONFIG_SND_SOC=y
-CONFIG_SND_SIMPLE_CARD=y
-CONFIG_SND_AUDIO_GRAPH_CARD=y
-CONFIG_SND_AUDIO_GRAPH_CARD2=y
 CONFIG_SND_SOC_RCAR=y
 CONFIG_SND_SOC_MSIOF=y
 CONFIG_SND_SOC_RZ=y
@@ -325,6 +323,9 @@ CONFIG_SND_SOC_DA7213=y
 CONFIG_SND_SOC_PCM3168A_I2C=y
 CONFIG_SND_SOC_SIMPLE_MUX=y
 CONFIG_SND_SOC_WM8978=y
+CONFIG_SND_SIMPLE_CARD=y
+CONFIG_SND_AUDIO_GRAPH_CARD=y
+CONFIG_SND_AUDIO_GRAPH_CARD2=y
 CONFIG_USB=y
 CONFIG_USB_OTG=y
 CONFIG_USB_XHCI_HCD=y
-- 
2.43.0


