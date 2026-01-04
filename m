Return-Path: <linux-renesas-soc+bounces-26261-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8EBCF14CA
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 04 Jan 2026 21:56:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7B0F3009F8C
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  4 Jan 2026 20:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A249B2D7397;
	Sun,  4 Jan 2026 20:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Bblw5nT+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jve/oBlE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EA419A2A3;
	Sun,  4 Jan 2026 20:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767560171; cv=none; b=icwyoF/5ERKVl5R/Y7YL9/gEAZgq/H6NtXOJ32INywHuNkg7SQK1mRLrqn9iRGTu0BnKHJTsZ9VHbfd8ZIiC+OkRGAgeObDqGJquE+KG1Tw/RVwfa+R2BeLUA5Qo81XcEp7bH8qcueT7YvRdXaT/YwfERLzSY3XSngIqd3w2XhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767560171; c=relaxed/simple;
	bh=43XsIEvVY8IxIp1X8ePvKqA/sZQxe3whRcUqzFs4hQo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GUXpFMKBwPq+/vFys3pxqnKxG809bwXeF8WC0UKPhD7tX4G45cNiI0YlqLLzrmwZCc0jY9jMdjzDhpSx7PRvjlGIU987PEHpYoIiIKosNyeH7Q9AfaN+gfZ3s0lhQHYMWnss94eyH7R7joC1Y0KWhuAtIBsu+ALx/Hxzh4wZqfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Bblw5nT+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jve/oBlE; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 45DF51D000D2;
	Sun,  4 Jan 2026 15:56:07 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 04 Jan 2026 15:56:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1767560167; x=1767646567; bh=P2
	VkFqho94I+6wSqldw5zMGqgoysj5bINcPyRpedIK4=; b=Bblw5nT+WEyQ6XQJdE
	YIT1Av8H+xZ2h2ELlNhkDsJkEtB5uzxnlH3nDMSWIS560PjpvzlGZJV3yDeUiBT5
	v49TLmgOYM1WFNgLY/MEKStTZQkpaWj0bJfU7vrjOayjJaOtE92BcA0V76lRP2LG
	UJ47PnL6XO+1RghBiN/kFFzRPJlfvZmH/A08uRF9JERIGG2Q/L/7OnKRXPtLUKOJ
	b916hbyHRllZnhmIkIcIbTCQpilfkKnC4LvtJ2yyuRXGlA08mrIT1bTI9mbTyhPz
	pgEyWKAMsTqI3QvfL0jvck4wDIGCNgpI4JyM+h16+XL/zYtM2ZufHZPuJqIh2OLx
	BKgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1767560167; x=1767646567; bh=P2VkFqho94I+6wSqldw5zMGqgoys
	j5bINcPyRpedIK4=; b=jve/oBlEyNz1XvUQomMKBQxzLEJ5G+liE7m5px50moNj
	SnEIp7jcwT5u9QdQUjWqdwqQM4S5czBBanc16IJGQe8TlzMdZ2bUlTga/gZ6VtTI
	iUebmAE3QPQf/LorYDkPA4jAQlsW0+W4OiULPCtOESZsdQVArBojxdmq0eUgJFvo
	kzD8n5PFxfS9qB4RSdoiOQbAmJqeZ1vn2f5KKVzgbBs8eU6iq6JZFOXJYl5l/iCK
	TOU3noaZnPZJAxRlZYimAhwYcSnXQHR40y74t4xHmO9dtE+Qiakec7bAvzQNP29h
	YGgPr7pxxkUecNjW+Ws7Z3ftVDg33X8URvP8H0Zt7Q==
X-ME-Sender: <xms:5tNaaWTeB-K8WJ3oYKLikPbQFFp8WYzja0Nk8Xbi_tV2Bfp_O3Fr7g>
    <xme:5tNaaVH4RO8RN5DVk_MzNONKf6qknhsUvrYubCAIZiDuQDSNHQnDmNcTSo80y_mq5
    sX3dY3ManDaVz60rPYvpwLZtMHhfzt6eUqfUt9kIje9cDxX4cesxg>
X-ME-Received: <xmr:5tNaabFPmGb6ulZLF-OYL9_7fddOe7jIUmcVhCUc55Sro7ddQQ4jvYeiUWWsvPPrRwfDd7YqlmurEqxGwyfVu-Tm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdelheeggecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghsucfu
    npguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghsse
    hrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheduleetteekgffffedu
    feeuvdejiedvkefhveeifeegffehledtvdevhfefteegnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgu
    sehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdp
    rhgtphhtthhopehmthhurhhquhgvthhtvgessggrhihlihgsrhgvrdgtohhmpdhrtghpth
    htohepshgsohihugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgv
    nhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlih
    hnuhigqdgtlhhksehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhl
    rghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:5tNaaTQTzwqR_busw8Hcbo2efTR3yN-fkAtDs6rK2MTUIyUpie_Jxw>
    <xmx:5tNaacJbZH90Mm899GO3caimDldT76_U8rtrKn1dQOEkNlIpP9OaRw>
    <xmx:5tNaaeZh0TnqQ5-DuGdvnj97zP66WaFbtLH0Z3--i1thc2n7qnr5zg>
    <xmx:5tNaae8uZ1svyEL0kFs4b1T_e57PllbaJmte9RY67pAltRvcUlSA3g>
    <xmx:59NaaVqcIILjhBIapxsocub6N8X1sbhsO9QjvpQfFPFWwmE69B_SpSqf>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 4 Jan 2026 15:56:05 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] clk: renesas: r8a77995: Add ZG and 3DGE support
Date: Sun,  4 Jan 2026 21:56:01 +0100
Message-ID: <20260104205601.1587576-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Describe the ZG and 3DGE clocks needed to operate the PowerVR GPU.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/clk/renesas/r8a77995-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a77995-cpg-mssr.c b/drivers/clk/renesas/r8a77995-cpg-mssr.c
index 162fa86c81ff..677c107d8f21 100644
--- a/drivers/clk/renesas/r8a77995-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77995-cpg-mssr.c
@@ -80,6 +80,7 @@ static const struct cpg_core_clk r8a77995_core_clks[] __initconst = {
 	/* Core Clock Outputs */
 	DEF_FIXED("za2",       R8A77995_CLK_ZA2,   CLK_PLL0D3,     2, 1),
 	DEF_FIXED("z2",        R8A77995_CLK_Z2,    CLK_PLL0D3,     1, 1),
+	DEF_FIXED("zg",        R8A77995_CLK_ZG,    CLK_PLL0D3,     5, 1),
 	DEF_FIXED("ztr",       R8A77995_CLK_ZTR,   CLK_PLL1,       6, 1),
 	DEF_FIXED("zt",        R8A77995_CLK_ZT,    CLK_PLL1,       4, 1),
 	DEF_FIXED("zx",        R8A77995_CLK_ZX,    CLK_PLL1,       3, 1),
@@ -119,6 +120,7 @@ static const struct cpg_core_clk r8a77995_core_clks[] __initconst = {
 };
 
 static const struct mssr_mod_clk r8a77995_mod_clks[] __initconst = {
+	DEF_MOD("3dge",			 112,	R8A77995_CLK_ZG),
 	DEF_MOD("tmu4",			 121,	R8A77995_CLK_S1D4C),
 	DEF_MOD("tmu3",			 122,	R8A77995_CLK_S3D2C),
 	DEF_MOD("tmu2",			 123,	R8A77995_CLK_S3D2C),
-- 
2.52.0


