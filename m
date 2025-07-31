Return-Path: <linux-renesas-soc+bounces-19801-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA22B16DA9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Jul 2025 10:37:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75AD51AA7D33
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Jul 2025 08:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 632B23597E;
	Thu, 31 Jul 2025 08:37:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4990CC13D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Jul 2025 08:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753951072; cv=none; b=gipRVLubXRkaWbt8kt3tvHDk9Z/4BbggQq7agihxuqSnOV1oV6ec/r+EMHEP+TB6y5NJX+nyhCyh0xD9XlhY9H88ISXy0H8PBDq8YWJjWezZ5MGu1aq1BT2F/V2SzUhqcvgRL7SLnTzXbw8LnvXNcSTXyvAD+R8u6ykvAG5RenM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753951072; c=relaxed/simple;
	bh=6Q7b1tmqedfp60LEfPZ5D9/uXnSFkyD+9Xdfyvu3G2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n59/zshs0CfwYAhLeRPhL5soRmmZmAF1kspjoAhhJL2jlZMpAsZVlJ8jHfcyhGy/uyzBPBEEr7nOkM3IE+/vGkBqToqjCGOCw/nZhVba5WOChRgmw9Kf5aUYqJk6/YTBO7ORK1pOzr1FF6j35BbTHJmysMIY1z3nFLb1BX8KDk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA1E7C4CEEF;
	Thu, 31 Jul 2025 08:37:50 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: rcar-gen2: Use SZ_256K definition
Date: Thu, 31 Jul 2025 10:37:45 +0200
Message-ID: <c54097a263eb3e451e5e223609a3630d4409dcdd.1753951039.git.geert+renesas@glider.be>
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
To be queued in renesas-devel for v6.18.

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


