Return-Path: <linux-renesas-soc+bounces-24283-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B47C3D763
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 22:16:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1C3CB4E33DB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 21:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0A27305E09;
	Thu,  6 Nov 2025 21:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="dAYfLUon";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="D9T3wDN5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3DD145FE0;
	Thu,  6 Nov 2025 21:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762463797; cv=none; b=tsHtdGVyXSlgAcOvcd/ZqXP6Dgg56QGv8yBedQDYD5MdVhNCKVtWMWjVqreJF0IEAgSRhUoxabVEkfmNtPOy+k1W/l/LggVkeYhm5gvkveTA4nyo7wWd4GO+fUo9rx+UUQHiktHJGLv0zh6Fz/ShmQox1L54jyFk7AFAUhu3r/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762463797; c=relaxed/simple;
	bh=DZiu17oCYiJTw8VBNpZgj8eoWGRcYLbxZby5Ml3/3s8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dtnc3bl5c8Xp2XSrj+bXw29wDQgMin+Ixyfoc28AFqmasQrJa5QGCiy06eqJeNWz86s/3CM2sT2f0B6OzuwlRmXYIkMV0lKoGo9t/fwH7A7fSIIR/8qnn9SCyQbSM1c2IU1D2WwGr0FPp0ajjMrFrzape4MMSCEsqJbHPNFScoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=dAYfLUon; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=D9T3wDN5; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 044FA140011C;
	Thu,  6 Nov 2025 16:16:35 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 06 Nov 2025 16:16:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762463795;
	 x=1762550195; bh=ua5UV2k5+/H1c/ldqx0iYM0aT7bMejY3sXUNhbsN3wY=; b=
	dAYfLUon4RTqbnN5o2tF6uPiwt27xMcuqBDI1ogBy5eTc2kOYqgzh+nwQFVfPu+r
	RCnLx2slFVR/qyJnU4dbY0fHg0hFpoc7HFs59LkBaVvmp/F0cP7sKM0gZLY6dCIF
	ql0TGG6KDRD92S6tepE5jo4tGNcT1NAtvByNDC2i1PPRipkgWp5+AXWQsVVo2hEY
	0LbHphY+Sv3z61Kf6c1CjkGIzYWOF8Q7RzCS4PrVbGgI/IOUYqK2SsYdu2SASYQO
	77dBX6Ps95GShEaM98psoMZRZ5k3zpyJtsDm9IKCpeGkvCChI4GqXYZsurupHpzV
	nHshEpZ9JXbu59wOs/YvMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762463795; x=
	1762550195; bh=ua5UV2k5+/H1c/ldqx0iYM0aT7bMejY3sXUNhbsN3wY=; b=D
	9T3wDN5EXGVCQPidlN1YIkddXpF9JlBdwczGE2ksp6do/Ir7yiJHXV7QbXOSp47M
	M/KtaygJltrWdf3t+fY7QKIiVfrprlmfw0SwEU8p3GFTIBb+m2r5PhsZ1rN256c9
	qKkvLECZRcvJX6lCW0bqIy3FGhtGRpVTT91CrFkGeQGdz3QY+6XuBFVJhuaO534v
	tgSESAGET1U2O4kBtkYMI2Ns2wkJ2K11hRcNN5tQk/ORzulWcyYwbALIxRsOL9Jf
	6OMapeeutNCcRhQQNeuj3qAsX8t2FO5OIb8Lxku5t7uw/oB357m6KH2Uf0DAo93f
	A02BoTBXkOf1NpPPbMSPw==
X-ME-Sender: <xms:MhANaeLhn5AuruFlTC6OGCyhEI12mF6JFU0jrhvJaRtF_hRivbOaqA>
    <xme:MhANacKwXkrWLHux0lV2x62jLgwsH76FrxrkB1m0rW8kKw_QITWzZhwyVxZ4L5K8v
    JdAG1rzMrB82laCSiyGCoqtdP1WK7xoolKPsELDKYJ794iX6jxBVEOq>
X-ME-Received: <xmr:MhANaZj3t388-u-Yl0IVSxuGILxj7XUO__EGm1crAC60e8DJHK5btmM1VeG9U6Kt-uxZrPas50L-JhrhO7qBp7M9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeejkeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopedutddpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghr
    rdgsvgdprhgtphhtthhopehmthhurhhquhgvthhtvgessggrhihlihgsrhgvrdgtohhmpd
    hrtghpthhtohepshgsohihugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghh
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdgtlhhksehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:MhANaWMMWXzY9rl5y7G_UVTizAIkwKkBF9hG4ak52peP2urQ39cFYQ>
    <xmx:MhANaUr6ycHRltM0EzQcFVUJBTPmMqH5IQYuM895tDm7T3qZQ_aQVg>
    <xmx:MhANaY6TjkSYtbvLPaXv78eRBa1ctUdrI8DIH26sN31nlaHemIeWqA>
    <xmx:MhANaSirfGti3g_qdyGaX8eyxC9yV1EBCWjdILMGzplZwPCoKUX9bQ>
    <xmx:MhANaTmttY65XlgMU1COHA0eCC6g9iP_EkRlKOSqqersRxGxaW2Uw0tm>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Nov 2025 16:16:34 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 2/4] clk: renesas: rcar-gen4: Add support for clocks dividers in FRQCRB
Date: Thu,  6 Nov 2025 22:16:02 +0100
Message-ID: <20251106211604.2766465-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251106211604.2766465-1-niklas.soderlund+renesas@ragnatech.se>
References: <20251106211604.2766465-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The FRQCRB register on R-Car V3U, V4H and V4M do in addition to the
already supported KICK bit contain settings for the frequency division
ratios for the clocks ZTR, ZT, ZS and ZG. It is however not possible to
use the later when registering a Z clock with the DEF_GEN4_Z() macro.

This change adds support for that by extending the existing practice of
treating the bit field offsets at multiples of 32 to map to a different
register. With this new mapping in palace

    bit offset  0 - 31 maps to FRQCRC0
    bit offset 32 - 63 maps to FRQCRC1
    bit offset 64 - 95 maps to FRQCRB

The change also adds an error condition to return an error if an unknown
offset is used.

The KICK bit defined in FRQCRB and already supported covers all three
registers and no addition to how it is handled are needed.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/clk/renesas/rcar-gen4-cpg.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen4-cpg.c b/drivers/clk/renesas/rcar-gen4-cpg.c
index fb9a876aaba5..215ef8e1a115 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.c
+++ b/drivers/clk/renesas/rcar-gen4-cpg.c
@@ -257,7 +257,7 @@ static struct clk * __init cpg_pll_clk_register(const char *name,
 }
 
 /*
- * Z0 Clock & Z1 Clock
+ * Z0, Z1 and ZG Clock
  */
 #define CPG_FRQCRB			0x00000804
 #define CPG_FRQCRB_KICK			BIT(31)
@@ -389,9 +389,14 @@ static struct clk * __init cpg_z_clk_register(const char *name,
 
 	if (offset < 32) {
 		zclk->reg = reg + CPG_FRQCRC0;
-	} else {
+	} else if (offset < 64) {
 		zclk->reg = reg + CPG_FRQCRC1;
 		offset -= 32;
+	} else if (offset < 96) {
+		zclk->reg = reg + CPG_FRQCRB;
+		offset -= 64;
+	} else {
+		return ERR_PTR(-EINVAL);
 	}
 	zclk->kick_reg = reg + CPG_FRQCRB;
 	zclk->hw.init = &init;
-- 
2.51.1


