Return-Path: <linux-renesas-soc+bounces-19438-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DDDAFF0F1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 20:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B37407A453C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 18:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8D602367D7;
	Wed,  9 Jul 2025 18:34:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9034523507E
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Jul 2025 18:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752086068; cv=none; b=JqNeFEGSzdAvFpJlHlabKr5ALLb8rk9wT/4gse1CFXCjjxwUIz8Bwz2xVGFNywNJ0em+/05kKg809nD1oCPn4oXJp77ac79iGuFLq7W1HMTPJVzoI2Gf6+c4T05mbel3Sfd/nKtPjKM/izeSvy9dd5rPseuAi/oyq6KrAiXAW+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752086068; c=relaxed/simple;
	bh=TqHIgzjlj7HjGaNXTNUwHiuPbP8K5ufzcymJApGo4bU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QHLEoF/vufQWzd5gSpdTS4lLNg856BSeqN7JbTZ927MGGjMCtjs20nhaB2BcZr/aRFp5Wgkls0H3zCYYscH7RNQxlOogLDX1bUPHf4St/9D9dfJresL5qZeZOMhQ5SoOYtr2aIDRteZoiIovfE970Qb0TTGw8ySP4h8JNRuoLHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1101C4CEEF;
	Wed,  9 Jul 2025 18:34:26 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: rcar-gen2: Use SZ_256K definition
Date: Wed,  9 Jul 2025 20:34:22 +0200
Message-ID: <c6a876d6c3b94c8bcb25abcfb2fa5c58d97b50fd.1752085981.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use SZ_256K instead of calculating the same value.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/mach-shmobile/pm-rcar-gen2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-shmobile/pm-rcar-gen2.c b/arch/arm/mach-shmobile/pm-rcar-gen2.c
index 907a4f8c5aedeeae..46654d196f8dc691 100644
--- a/arch/arm/mach-shmobile/pm-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/pm-rcar-gen2.c
@@ -81,7 +81,7 @@ void __init rcar_gen2_pm_init(void)
 
 map:
 	/* RAM for jump stub, because BAR requires 256KB aligned address */
-	if (res.start & (256 * 1024 - 1) ||
+	if (res.start & (SZ_256K - 1) ||
 	    resource_size(&res) < shmobile_boot_size) {
 		pr_err("Invalid smp-sram region\n");
 		return;
-- 
2.43.0


