Return-Path: <linux-renesas-soc+bounces-27049-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E144BD3AE25
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 16:03:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C10B30215D5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 15:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C309837F75B;
	Mon, 19 Jan 2026 15:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="qg6fgEkk";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="DMjiVPmy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C12C1F4CBB;
	Mon, 19 Jan 2026 15:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768834977; cv=none; b=tmfGE4zI66xT8kbf3H1wMn4mi+ZCqmkByDAK0+NL3AGjbSnkIcH7+bUcuL1YGGS+w6RO96PFnTWSq8rjpOlRAdXQ5/00qCRkZ5HOhCAjI0DDkWrkWJtel4hbxjsdXUAHhk67JjXvUds7wXI/iSRj+HSd3z+7CkIJOIIGpQcgLaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768834977; c=relaxed/simple;
	bh=XFex8+nsfxe7p/tz4vrunbSihbsFCkJGQgHTo246bSg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JZRWBn/6kojk46kHBJfKIFJm6t3q37KR72WnZnzTmv/YsvK8YSXUZ3pMaBFdLs6ckn2wgD+ssSjdFv1kUMlscrAFnL3QndRgv2m18SlxcFmaCFPR2EeBZ2R7Ex3y0MtcgjpGVFIC52uW35FpNfAnEhx0+9q8kjxxvWYo93wO/EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=qg6fgEkk; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=DMjiVPmy; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dvtx35ByHz9tfv;
	Mon, 19 Jan 2026 16:02:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768834967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GfFz6r3zQlJSWMcpbIyPBFZDkNP4Kg4PwaTgozqldJ8=;
	b=qg6fgEkkGvvAya/RsJKdGc9KDLiTNzFXWtcDDPzhST8ZmrX37ngsnP+uxBQPfY33WE0t2E
	p/QU8XeigG9JVb392Kk7gKT7CUkPgfhmCZ5vPwM4hsmyFflbsXzQFG8rDpQNGydnf/RpLY
	n9O+en2Hx/EoWZYql42r3i2pFGKEuaR9VSQhY61csUfcdh6IVl3d4syHxAN5qJK/xoKf9Y
	G7MYyKQl9Jrn36zH35y7l0rgXStk2tFEBGeinXUF/GSC44A3ieqPS/wEKCR6J9K+mHcn4O
	XRAGOdlRLf03FoYV3B3e/0ryGkbnhml/NCe79y2GLsAdhyS+BKtWYYosGAAIkA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=DMjiVPmy;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768834965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GfFz6r3zQlJSWMcpbIyPBFZDkNP4Kg4PwaTgozqldJ8=;
	b=DMjiVPmyWD1QSdZ6UZ/hbrLf7xKPpB1Xxqsswgjb6DQolPwZjWRNhT4gDvmoky+niFuAzI
	9XGoHMjlzpaOD8qiP3j8txbOa2BjH1pKQVpH3MMNecdJ5fkg0RBWvOiD9PkYdvSygFnE74
	8DQRzrRTQ6f7RoUpCFyoRrCh4TbQKLsg2xth10GLz575v4J/YE9GFzxC/2I6lNGdZzrBC3
	6zogFNwfxB6IUcq+6xI6TCVKAAeRzT05M8gGKKQpLmaAVDsDms8kOQLINW8D29zz+h7y68
	AUqOQ4X3AijwkpN7QJJHMJAQsN6z/ohRejV58EuQHVtT9cuai6uoMkzYccIX4A==
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	stable@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] clk: rs9: Reserve 8 struct clk_hw slots for for 9FGV0841
Date: Mon, 19 Jan 2026 16:01:52 +0100
Message-ID: <20260119150242.29444-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ki9bnuwa9u48nbcmqfnmor6sphi63g7b
X-MBO-RS-ID: a31dfa1462f39022612
X-Rspamd-Queue-Id: 4dvtx35ByHz9tfv

The 9FGV0841 has 8 outputs and registers 8 struct clk_hw, make sure
there are 8 slots for those newly registered clk_hw pointers, else
there is going to be out of bounds write when pointers 4..7 are set
into struct rs9_driver_data .clk_dif[4..7] field.

Since there are other structure members past this struct clk_hw
pointer array, writing to .clk_dif[4..7] fields corrupts both
the struct rs9_driver_data content and data around it, sometimes
without crashing the kernel. However, the kernel does surely
crash when the driver is unbound or during suspend.

Fix this, increase the struct clk_hw pointer array size to the
maximum output count of 9FGV0841, which is the biggest chip that
is supported by this driver.

Cc: stable@vger.kernel.org
Fixes: f0e5e1800204 ("clk: rs9: Add support for 9FGV0841")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: - Update the commit message crash paragraph
    - Add RB/TB from Geert
---
 drivers/clk/clk-renesas-pcie.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index 4c3a5e4eb77ac..f94a9c4d0b670 100644
--- a/drivers/clk/clk-renesas-pcie.c
+++ b/drivers/clk/clk-renesas-pcie.c
@@ -64,7 +64,7 @@ struct rs9_driver_data {
 	struct i2c_client	*client;
 	struct regmap		*regmap;
 	const struct rs9_chip_info *chip_info;
-	struct clk_hw		*clk_dif[4];
+	struct clk_hw		*clk_dif[8];
 	u8			pll_amplitude;
 	u8			pll_ssc;
 	u8			clk_dif_sr;
-- 
2.51.0


