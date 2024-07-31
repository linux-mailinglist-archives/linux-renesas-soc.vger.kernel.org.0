Return-Path: <linux-renesas-soc+bounces-7666-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E70CE943619
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2024 21:14:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FB4D1C21F55
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2024 19:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CCB814F9E7;
	Wed, 31 Jul 2024 19:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iIZEaUE7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FD061FEB;
	Wed, 31 Jul 2024 19:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722453220; cv=none; b=nVGB/Yebw0qgptk9i3WOkPniQKCQOvNG2mZ2TZA5/Dj2sV1zDAmjdCfS46PGPWUcJICCMHtjbxANWFKY8DwiS58Du/PAQU9gxlH2yfdakPao5rPA//xaTGe5i0rIIw7EY3ECyPReV87KdRgdweZQ8Xu5ArNzb/fkqcEtLe/Xl+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722453220; c=relaxed/simple;
	bh=/vCbSfFh+Teb1SyCZnsnZm+zGpfoIjaZBtt5r0JSCrU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cmdsS2Uzmd6HKA4mkXU+CpkBSVgYejREsPbOX59nVPVYBpSOrTS65cfA99IMdKg1YR+8C5dTrA3XizfnaNjhdnDle1voXiwRbdsr3OZpKBGfFZCHtDZLJ3PObVVu0whAkl6pCRBb1OOG6znIn2LG8PjhlP27e3gKwS1VoJYqgDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iIZEaUE7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E252C4AF09;
	Wed, 31 Jul 2024 19:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722453219;
	bh=/vCbSfFh+Teb1SyCZnsnZm+zGpfoIjaZBtt5r0JSCrU=;
	h=From:To:Cc:Subject:Date:From;
	b=iIZEaUE7CYfFDuICSbjuei0BwDlx9VRivB/9NykOaBEkhcRYStKmUMbDQqdSzH2O9
	 a6VM4ZwmJnLXbZHc7Q052iIAB7G7pXP85MpcQRLXWeYDKoypf/Obi2EuWbRX4OUkeS
	 4YFnYSTYUGxqNEaJ6Yf0A0qxmO7FLQs1v5S5bOO7Puixuq3qvIeGByAZm1MGsCyLy6
	 rc79PB8USLcrWgCAN34og4v4JEtW4b4/6N//eZF2Oxf51MyFdMC+OF9xZ1aAT/YEQx
	 xNIiAtyzbZh4Qa9aS2xI/j+U0+T+3DGe10iYPNiTUNPYIa9RfN76mAesn+rFyW4+dx
	 K1UsAr4sGNXdQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: Use of_property_present()
Date: Wed, 31 Jul 2024 13:12:42 -0600
Message-ID: <20240731191312.1710417-4-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use of_property_present() to test for property presence rather than
of_(find|get)_property(). This is part of a larger effort to remove
callers of of_find_property() and similar functions.
of_(find|get)_property() leak the DT struct property and data pointers
which is a problem for dynamically allocated nodes which may be freed.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/clk/clk.c                 | 2 +-
 drivers/clk/renesas/clk-mstp.c    | 2 +-
 drivers/clk/versatile/clk-sp810.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 285ed1ad8a37..7264cf6165ce 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -5232,7 +5232,7 @@ static int of_parse_clkspec(const struct device_node *np, int index,
 		 * clocks.
 		 */
 		np = np->parent;
-		if (np && !of_get_property(np, "clock-ranges", NULL))
+		if (np && !of_property_present(np, "clock-ranges"))
 			break;
 		index = 0;
 	}
diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-mstp.c
index 5304c977562f..5bc473c2adb3 100644
--- a/drivers/clk/renesas/clk-mstp.c
+++ b/drivers/clk/renesas/clk-mstp.c
@@ -207,7 +207,7 @@ static void __init cpg_mstp_clocks_init(struct device_node *np)
 	for (i = 0; i < MSTP_MAX_CLOCKS; ++i)
 		clks[i] = ERR_PTR(-ENOENT);
 
-	if (of_find_property(np, "clock-indices", &i))
+	if (of_property_present(np, "clock-indices"))
 		idxname = "clock-indices";
 	else
 		idxname = "renesas,clock-indices";
diff --git a/drivers/clk/versatile/clk-sp810.c b/drivers/clk/versatile/clk-sp810.c
index 45adac1b4630..033d4f78edc8 100644
--- a/drivers/clk/versatile/clk-sp810.c
+++ b/drivers/clk/versatile/clk-sp810.c
@@ -110,7 +110,7 @@ static void __init clk_sp810_of_setup(struct device_node *node)
 	init.parent_names = parent_names;
 	init.num_parents = num;
 
-	deprecated = !of_find_property(node, "assigned-clock-parents", NULL);
+	deprecated = !of_property_present(node, "assigned-clock-parents");
 
 	for (i = 0; i < ARRAY_SIZE(sp810->timerclken); i++) {
 		snprintf(name, sizeof(name), "sp810_%d_%d", instance, i);
-- 
2.43.0


