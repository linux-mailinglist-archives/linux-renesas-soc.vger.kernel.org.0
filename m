Return-Path: <linux-renesas-soc+bounces-12285-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F4EA1704E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 17:38:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EE613A5F3A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 16:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 581FC1E0DC0;
	Mon, 20 Jan 2025 16:37:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE795BE65
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jan 2025 16:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737391079; cv=none; b=K4emkumVtXfJXYijLTY+sujPcE9iVng6LYDxxbttwAwwVC04lCLgLPGfXfxCX3jInQ5y/iPaCYWPzSoCxO3FDBShTZjYVzx3Lp32e5olE14coDhb2CtKF8dvLYHu95/qmKm4QYUyS1cGAizshFnKcOMUseHg3oZBs3F6/c1lpWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737391079; c=relaxed/simple;
	bh=1CZWs+6wtPFKA6sP+MOoWPhsVHRcfnwEbHzbltriG6c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JVK8kxQnq3gZ1F/hJ1EVqqRCEqrPQZnWEUFMQujp9q1GCAE77Xol23/kBC61LZKxEDH7zdijz76NekDtbuE7M7l5VdvGBNfQg5p49ji3FPE2HgHtWAWbkoqSnwxB3lIHyXYjcffP4RRRIAdjU4xKX3oIAqkfB3/7m02CQhrs3lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:30c9:4dcf:fe21:4b10])
	by baptiste.telenet-ops.be with cmsmtp
	id 3Udu2E0020raqVW01Udu4v; Mon, 20 Jan 2025 17:37:54 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tZumZ-0000000Di7n-1wed;
	Mon, 20 Jan 2025 17:37:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tZumf-0000000Daek-3zZT;
	Mon, 20 Jan 2025 17:37:53 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL] arm64: renesas: defconfig: Disable CONFIG_PROVE_LOCKING
Date: Mon, 20 Jan 2025 17:37:52 +0100
Message-ID: <c8439b6b731cd44c0d2442f437d4ceef336125b0.1737390987.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Proving that all locking that occurs in the kernel runtime is
mathematically correct has an impact on performance.  Hence it is
disabled in most defconfigs.

Suggested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/arm64/configs/renesas_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 30a865507d6e5ad4..a3a324ae9e3867ad 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -455,5 +472,4 @@ CONFIG_DEBUG_KERNEL=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
 # CONFIG_SCHED_DEBUG is not set
-CONFIG_PROVE_LOCKING=y
 # CONFIG_FTRACE is not set
-- 
2.43.0


