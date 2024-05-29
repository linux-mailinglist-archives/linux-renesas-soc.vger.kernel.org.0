Return-Path: <linux-renesas-soc+bounces-5663-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A35248D3B3D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 17:42:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2118AB26E79
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 15:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D568181B98;
	Wed, 29 May 2024 15:42:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAC7181B9D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 May 2024 15:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716997328; cv=none; b=I0vckCR1Z6hCrazvk2KG7ur9ezKxA05afYSlm6nu+H4FUDIYGAf1nHnQM3i/DtOi8vV3GoFZNCwfocUMZv33KJN0Xe4Ly2E4wRauIj4jG7rqjlR7pcd3JS/lFUnieyk1K16btMU3wTjWHCKPfUGK3LUzMqJ/530nYDyEiti/DMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716997328; c=relaxed/simple;
	bh=L6UeQDK9P6qHSAheZyFjKvwsh53IDzsQLZbLMmFAimY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TyO2lZtDjyiKWOWkR+VHCMWvPBDP8cuerbi6O9vGYAjq1nj7h3zv+RFBawc0zZQ7T7Cewuiz/qPA8F7/vV+gcaCpkdKqeep705MrDsEHHvPi+2GbTuO4BG3OGNHM5pHNZHHJdBDo8H4a9eiI2rREvfu9y2VgThvUopgW4moS978=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:1b01:1838:131c:4de4])
	by laurent.telenet-ops.be with bizsmtp
	id V3i22C00G3VPV9V013i2W0; Wed, 29 May 2024 17:42:03 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCLQG-00H2xo-C1;
	Wed, 29 May 2024 17:42:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCLRC-009nPi-P9;
	Wed, 29 May 2024 17:42:02 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL 3/3] arm64: renesas: defconfig: Refresh for v6.10-rc1
Date: Wed, 29 May 2024 17:41:59 +0200
Message-Id: <dcdaa7a1fab3160ad258ae7e91f6e152a16c16a4.1716997002.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716997002.git.geert+renesas@glider.be>
References: <cover.1716997002.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh the defconfig for Renesas ARM64 systems:
  - Disable CONFIG_ARM64_ERRATUM_3194386 (No Cortex-X4),
  - Disable CONFIG_ARM64_ERRATUM_3312417 (No Neoverse-V3),
  - Enable RZ/V2H (R9A09G057) SoC support.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/configs/renesas_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 2fc7752fbc433294..920eb423e8d16123 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -37,6 +37,8 @@ CONFIG_ARCH_RENESAS=y
 # CONFIG_ARM64_ERRATUM_2645198 is not set
 # CONFIG_ARM64_ERRATUM_2966298 is not set
 # CONFIG_ARM64_ERRATUM_3117295 is not set
+# CONFIG_ARM64_ERRATUM_3194386 is not set
+# CONFIG_ARM64_ERRATUM_3312417 is not set
 # CONFIG_CAVIUM_ERRATUM_22375 is not set
 # CONFIG_CAVIUM_ERRATUM_23154 is not set
 # CONFIG_CAVIUM_ERRATUM_27456 is not set
@@ -393,6 +395,7 @@ CONFIG_ARCH_R9A07G044=y
 CONFIG_ARCH_R9A07G054=y
 CONFIG_ARCH_R9A08G045=y
 CONFIG_ARCH_R9A09G011=y
+CONFIG_ARCH_R9A09G057=y
 CONFIG_EXTCON_USB_GPIO=y
 CONFIG_MEMORY=y
 CONFIG_RENESAS_RPCIF=y
-- 
2.34.1


