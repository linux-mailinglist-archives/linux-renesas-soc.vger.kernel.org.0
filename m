Return-Path: <linux-renesas-soc+bounces-26197-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4526BCEA076
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 16:11:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 397D730026B9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 15:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AAE8318152;
	Tue, 30 Dec 2025 15:04:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B52131814A;
	Tue, 30 Dec 2025 15:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767107054; cv=none; b=knu6G4EWdZvIrKQjtJAAfp8GRwLvo1Fq4dkZyQ7Uk8c0i8txzai84b4nWFCNTk8u+nMUDCAbqu7R9nDTEJkfjFH/oGP5uBgdHbWrjhEjHBqf0Wq0T1eszXMXck8KqKOOl9ZtA/uTHmwgKtVI1aLcw+zbq5Z79Zni9Yx7pIXDBkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767107054; c=relaxed/simple;
	bh=4D9uMRlPRMBt9l3Ir9HJyLi0udpptEmD5Iy9LsOxw/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uipY81YpaBw3Mek0dFTaTaKhEXz7gAVWxszlddl1JjU0Db7kYXtfCWSa5ZOPpgIs+gBFA6U7bYfrrSGqtONi1QAQr6FLyq9DuxHHySsZDdLoCgSH0sRqxX7l+4YjVAdyewZpugv8OS9vzm7xlgEwC76p8rTgkDC66fRhWIzh3CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37FD7C2BC86;
	Tue, 30 Dec 2025 15:04:11 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] phy: core: Reinstate pm_runtime_enabled() check in phy_pm_runtime_put()
Date: Tue, 30 Dec 2025 16:04:05 +0100
Message-ID: <3ca9f8166d21685bfbf97535da30172f74822130.1767107014.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Koelsch (R-Car M2-W), during boot and s2ram:

    phy phy-e6590100.usb-phy-controller.0: Runtime PM usage count underflow!

While phy_pm_runtime_get{,_sync}() and phy_pm_runtime_put_sync() still
contain pm_runtime_enabled() checks, the same check in
phy_pm_runtime_put() was deemed redundant and removed, causing count
underflows with PHY drivers like drivers/phy/renesas/phy-rcar-gen2.c
that do not use Runtime PM yet,

Fix this by reinstating the check.

Fixes: caad07ae07e3fb17 ("phy: core: Discard pm_runtime_put() return values")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/phy/phy-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 160ecb757d1d62a0..e2a2a99d069789c7 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -195,6 +195,9 @@ void phy_pm_runtime_put(struct phy *phy)
 	if (!phy)
 		return;
 
+	if (!pm_runtime_enabled(&phy->dev))
+		return;
+
 	pm_runtime_put(&phy->dev);
 }
 EXPORT_SYMBOL_GPL(phy_pm_runtime_put);
-- 
2.43.0


