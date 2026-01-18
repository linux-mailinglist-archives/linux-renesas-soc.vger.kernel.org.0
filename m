Return-Path: <linux-renesas-soc+bounces-26952-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA10D3924D
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Jan 2026 03:58:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 60E513011A84
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Jan 2026 02:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B051C84C0;
	Sun, 18 Jan 2026 02:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="P+vHeCKC";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="YLbU8e9v"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D4818027;
	Sun, 18 Jan 2026 02:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768705095; cv=none; b=BQZmF5X7XUAtSbBD4oU+Y4UDwGudQmzcovSlwrgpgeavP13kYPYTB0BbY/nDM+jXabeoD4CerTCjpwm1i7JbUwEczyvREZVF+JeT9Xya5cxihXCMxG9nDraN2g7uzVdJszCX3VibSUAgc6JQPOVUSUWFA0w9BlycU6Cy/tt2ooI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768705095; c=relaxed/simple;
	bh=0D84M2FZ/eP13c8Lq1jhipRzuscAO6I+R0S74SpNAfU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XZ1LwEq0g4+64Vtysp+fojMZTTzKLV5w+TD257QSV/vdFqBqBiDDf5rAvAvTTlIuhIvDeu4byq4kQ5v/ssfi7cmmPKOC07Mr7pMQAXkZ1+eaoTqfjM0x2PWorKi3smCbi3MnhX5VuZpys9hNmhbVEUBzkWke3orEPv+4rcsXZ6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=P+vHeCKC; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=YLbU8e9v; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dtyvJ2X2Yz9txg;
	Sun, 18 Jan 2026 03:58:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768705084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XBgeYyRcBFEHo3KdmapMBvk94SjyCGRmpPM8oaz9BZI=;
	b=P+vHeCKCmGHbPDYIhu403/AnioFT4xGZa2ewdcumkJGIRbMCgDD7tpjaDKZCPJDj7pacdM
	bLZ6/vyptVeTnlvfO3DHFeX2ldyz4Gp9TyqY6bz6XoAyN3RXY9pakeaVSJzNCPwYceKS5q
	wZiVcvIfJcl1VCfblKxH0q/R71u6HT7ripS3/gOKpUIlQ6zFYIT8ZUckR08bT0DUI/8Tf8
	4xFNlslhyoKCv34qkgkuVfuDUJFtjj85kaO1HyjOxvouFeuiypV2j+af4cDITTuwugaHt8
	fzVoVc10cuyvyFcFzcQ0enLV9GckM5b2iuzjTNzIBmJ1CgeoWZ2pDjJZhpdz1A==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768705082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XBgeYyRcBFEHo3KdmapMBvk94SjyCGRmpPM8oaz9BZI=;
	b=YLbU8e9v2oItVfNiTrSbYe0thiJ6BqRLA1fUryT8wFuJt17DNr9FdvutLAr4EUPI/JbyPS
	fWW8s+n7rhjGasJw3huhIWLQCbQkCpcMV7JvyrOw7CLg/W0MBxay/zf/sShLAXEslBrC8p
	TqMBjUxNIomhR1OvVpa76xhpEqCvcweBNspTfTs8G1/HajndqlyLAtLL2/CMqROyTO+Rej
	hNw2IbUtlzB5Oyl96m69exs+WWMYuK6ttCT4HsxKGtsXOe0IpvC7la+A4qGq/cbZG7Vtth
	RjSIdPbYXBRHOy8wx1HCYZTD5wSG2IWHqPbc/xI6AOLkjTfB6WlgLsmiX+0j/Q==
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	stable@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] clk: rs9: Reserve 8 struct clk_hw slots for for 9FGV0841
Date: Sun, 18 Jan 2026 03:56:58 +0100
Message-ID: <20260118025756.96377-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 5e041f4a3df51f53915
X-MBO-RS-META: a9agacgcgu59y9ahobcmmrs37mutbfmp

The 9FGV0841 has 8 outputs and registers 8 struct clk_hw, make sure
there are 8 slots for those newly registered clk_hw pointers, else
there is going to be out of bounds write when pointers 4..7 are set
into struct rs9_driver_data .clk_dif[4..7] field.

Since there are other structure members past this struct clk_hw
pointer array, writing to .clk_dif[4..7] fields only corrupts the
struct rs9_driver_data content, without crashing the kernel. However,
the kernel does crash when the driver is unbound or during suspend.

Fix this, increase the struct clk_hw pointer array size to the
maximum output count of 9FGV0841, which is the biggest chip that
is supported by this driver.

Cc: stable@vger.kernel.org
Fixes: f0e5e1800204 ("clk: rs9: Add support for 9FGV0841")
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


