Return-Path: <linux-renesas-soc+bounces-1650-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7969C836562
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 15:29:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD2EC1C2048D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 14:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74503D39B;
	Mon, 22 Jan 2024 14:29:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E433D392
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 14:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705933783; cv=none; b=IsZAA6CczdNm+I0h9Og7d01WeFSklKxmrV6mx1W5pN5FUjJXDmHLdSOm+s2mn2b8Iy+QN088lT3scV5AEau0CbJ1OHvk1SfjTYgHs54/rYWKMsDwXt1UgdVcKin1bmR75fMVBTHZ+x3Mk593zmsCsgLQjOHXgfGAl/xa7QcKsSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705933783; c=relaxed/simple;
	bh=aYnZkjkijNNjRt0vKMy2HwIcVeMRlJCMq0iqkrhFxaA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lUntOWPCTdVPqhB5aDGvO5W2YN63d1AeFlGJnEMXagQ4JcEK4Kj/ALTrGEU4v9ERnEuKUFv1Y3v/9wAKuwgpMmMiVyTM4lpbC+JqkpO9mgSjuMqBva4my24tR4xQplq8ENz4xl6nCwZBuAl2WtrggyqZBOkLV0iYlzl4zwaquc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:955e:bba5:7ff4:cfb6])
	by laurent.telenet-ops.be with bizsmtp
	id dqVf2B00J0ZxL6o01qVfSN; Mon, 22 Jan 2024 15:29:39 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rRvIA-00GGxV-Mw;
	Mon, 22 Jan 2024 15:29:39 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rRvIx-00CFIp-Lq;
	Mon, 22 Jan 2024 15:29:39 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v6.8-rc1
Date: Mon, 22 Jan 2024 15:29:39 +0100
Message-Id: <7de641cfea3f78c6ebb6f05e5f1475c0424f2abc.1705933751.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh the defconfig for Renesas ARM64 systems:
  - Disable CONFIG_ARM64_ERRATUM_3117295 (No Cortex-A510).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/arm64/configs/renesas_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index d4cc97d642cc5e04..3f5357923f256885 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -38,6 +38,7 @@ CONFIG_ARCH_RENESAS=y
 # CONFIG_ARM64_ERRATUM_2441009 is not set
 # CONFIG_ARM64_ERRATUM_2645198 is not set
 # CONFIG_ARM64_ERRATUM_2966298 is not set
+# CONFIG_ARM64_ERRATUM_3117295 is not set
 # CONFIG_CAVIUM_ERRATUM_22375 is not set
 # CONFIG_CAVIUM_ERRATUM_23154 is not set
 # CONFIG_CAVIUM_ERRATUM_27456 is not set
-- 
2.34.1


