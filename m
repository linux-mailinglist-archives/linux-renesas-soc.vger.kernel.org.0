Return-Path: <linux-renesas-soc+bounces-14922-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CE0A7357B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 16:20:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8827189AF34
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 15:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD965183CCA;
	Thu, 27 Mar 2025 15:19:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-gw01.astralinux.ru (mail-gw01.astralinux.ru [37.230.196.243])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C42154423;
	Thu, 27 Mar 2025 15:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.230.196.243
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743088789; cv=none; b=gx+JNs++r2G7nU4THI7KH5bXLm52blEQivWe8x0GYCrfN52NufoFVxZJjz0148A7H+9YB5dMfXuHgg3bqkJ1l8OHHSXqadMqlLc52vgbE61VASKQWASeLM5TY4LKNYO7IjWopUrFIz+q0TNvSltArlZMi2AvBhRlcuC+gOwG4uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743088789; c=relaxed/simple;
	bh=3rM1KS2GRjTxilLprollGDmQ/AJkW8LBlNp4xdN0E6M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a1l4ZrdBY1sDN/atLlCpnBfNoHjvjtMd6TUjz8eHjSnnubBxLhOCvEep0X5NparaZweUj4CuHDSJpe4newBwXlYNWhFr0lsESzkrj7H5iT2kfTazWEGDln/OC0GVouWhmgO3Pb+A9Vfd4rCRZ4nSYCXRK9vqNnb6/Y3ChlxgTAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=astralinux.ru; spf=pass smtp.mailfrom=astralinux.ru; arc=none smtp.client-ip=37.230.196.243
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=astralinux.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=astralinux.ru
Received: from gca-sc-a-srv-ksmg01.astralinux.ru (localhost [127.0.0.1])
	by mail-gw01.astralinux.ru (Postfix) with ESMTP id 20F3A24C9C;
	Thu, 27 Mar 2025 18:13:23 +0300 (MSK)
Received: from new-mail.astralinux.ru (gca-yc-ruca-srv-mail03.astralinux.ru [10.177.185.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-gw01.astralinux.ru (Postfix) with ESMTPS;
	Thu, 27 Mar 2025 18:13:21 +0300 (MSK)
Received: from localhost.localdomain (unknown [10.198.57.252])
	by new-mail.astralinux.ru (Postfix) with ESMTPA id 4ZNnGk69ZYz1h0PW;
	Thu, 27 Mar 2025 18:13:18 +0300 (MSK)
From: Tigran Sogomonian <tsogomonian@astralinux.ru>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Tigran Sogomonian <tsogomonian@astralinux.ru>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH RFC] renesas: add zero check for prate variable
Date: Thu, 27 Mar 2025 18:10:44 +0300
Message-ID: <20250327151109.9648-1-tsogomonian@astralinux.ru>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: tsogomonian@astralinux.ru
X-KSMG-AntiSpam-Info: LuaCore: 51 0.3.51 68896fb0083a027476849bf400a331a2d5d94398, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;astralinux.ru:7.1.1;new-mail.astralinux.ru:7.1.1;127.0.0.199:7.1.2, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 192165 [Mar 27 2025]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.11
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.0.7854, bases: 2025/03/27 06:17:00 #27830093
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 1

To avoid division by zero, a check was added to the prate
variable, since no guarantees were found that it could not
be equal to zero.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Tigran Sogomonian <tsogomonian@astralinux.ru>
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 2 ++
 drivers/clk/renesas/rcar-gen4-cpg.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 027100e84ee4..66da3b4398cd 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -205,6 +205,8 @@ static int cpg_z_clk_determine_rate(struct clk_hw *hw,
 						  prate * zclk->fixed_div);
 
 	prate = req->best_parent_rate / zclk->fixed_div;
+	if (prate == 0)
+		return -EINVAL;
 	min_mult = max(div64_ul(req->min_rate * 32ULL, prate), 1ULL);
 	max_mult = min(div64_ul(req->max_rate * 32ULL, prate), 32ULL);
 	if (max_mult < min_mult)
diff --git a/drivers/clk/renesas/rcar-gen4-cpg.c b/drivers/clk/renesas/rcar-gen4-cpg.c
index 31aa790fd003..4c9a7d699290 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.c
+++ b/drivers/clk/renesas/rcar-gen4-cpg.c
@@ -308,6 +308,8 @@ static int cpg_z_clk_determine_rate(struct clk_hw *hw,
 						  prate * zclk->fixed_div);
 
 	prate = req->best_parent_rate / zclk->fixed_div;
+	if (prate == 0)
+		return -EINVAL;
 	min_mult = max(div64_ul(req->min_rate * 32ULL, prate), 1ULL);
 	max_mult = min(div64_ul(req->max_rate * 32ULL, prate), 32ULL);
 	if (max_mult < min_mult)
-- 
2.47.1


