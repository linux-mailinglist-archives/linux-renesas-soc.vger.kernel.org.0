Return-Path: <linux-renesas-soc+bounces-7636-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E34B0941495
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 16:44:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 210D41C2307D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 14:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E5211A2540;
	Tue, 30 Jul 2024 14:44:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5576D19DF41
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2024 14:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722350663; cv=none; b=iDaXhV6/p0ln8JL/KOrlex8Ejl9KYlOH4MjIxvEucWQSqip2fP4v8jJombRCdt5ICAWgqb6lQ7WaBDAu5ya58V/4SjN19witM88ZBEKZbFzZrNxzijNG7INYpssSs3CLJZTQWTdjaD+p4pkrOrjrfP9L3uoNTihblFO1BUP6UCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722350663; c=relaxed/simple;
	bh=YksJMT05if4SIT1IKjp5HZnuRZD9AKdjm3iapOgkOdQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fZUtmn4rrxEkyQ702amYuB/9FBgecam8VTxGtaajfUxEidjVqRRLrO0qdYHknpH05rOSsQOsQESTZzjX06aCKzrvvxP2WivaGqX/6q/iKnRalDorPke+zcWzEEojP1nTaZ3C8TTKaDEIRNdcV2eI0XrLfy0Tq+NrwhPE636HrzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4WYHqS4gyJz4wyWM
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2024 16:36:52 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:520d:93ad:ff6d:335e])
	by baptiste.telenet-ops.be with bizsmtp
	id tqck2C00F30Ayot01qcku2; Tue, 30 Jul 2024 16:36:45 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sYnxd-004B1m-Li;
	Tue, 30 Jul 2024 16:36:44 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sYny0-00E1Fg-Od;
	Tue, 30 Jul 2024 16:36:44 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL 3/3] arm64: renesas: defconfig: Refresh for v6.11-rc1
Date: Tue, 30 Jul 2024 16:36:42 +0200
Message-Id: <5872756cd74f7436fe9f822cfc172949fe612d25.1722349965.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722349965.git.geert+renesas@glider.be>
References: <cover.1722349965.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh the defconfig for Renesas ARM64 systems:
  - Drop CONFIG_ARM64_ERRATUM_3312417=n (removed in commit
    ec76876660809208 ("arm64: errata: Unify speculative SSBS errata
    logic")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/configs/renesas_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index f6231582a066365c..d3cfbc4315632d89 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -38,7 +38,6 @@ CONFIG_ARCH_RENESAS=y
 # CONFIG_ARM64_ERRATUM_2966298 is not set
 # CONFIG_ARM64_ERRATUM_3117295 is not set
 # CONFIG_ARM64_ERRATUM_3194386 is not set
-# CONFIG_ARM64_ERRATUM_3312417 is not set
 # CONFIG_CAVIUM_ERRATUM_22375 is not set
 # CONFIG_CAVIUM_ERRATUM_23154 is not set
 # CONFIG_CAVIUM_ERRATUM_27456 is not set
-- 
2.34.1


