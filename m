Return-Path: <linux-renesas-soc+bounces-20414-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8006AB22E5D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 18:57:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9937188C2DB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 16:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FDDB2FA0F8;
	Tue, 12 Aug 2025 16:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="pMTx4oG3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZwjmUc04"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8579C20013A;
	Tue, 12 Aug 2025 16:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755017509; cv=none; b=esqGnRHb/s0vxC2covx8mnYPYMiKAZkJbuc1kuEiURt2Q3dOEUFrz0iDQROwAdGwKevJ0QAxiJbyqLQwDH8ZGlTEqnQHbAj/YMMZGK3dK9iyQzglAK08GQ1adiUAEJSnWBfhMnpy5VJhJ9WfI4BUS9LZmK32gbGppo09i2mkN90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755017509; c=relaxed/simple;
	bh=IyvYTt0JyJe2BVjVpKPeSg/mXaKyHrR1SHMK9hXj4/4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=vD4PLRfI47ZB/Yo1QuU7k0MCvxfM4Ujf9aTkcCFlP1yeMSsEPHKwVBtp8ehuFuqaSvr6K7exkFc7apmUljIqNwUw/7Ntyuc3lPP8lgudv+qYXa4TwFWR4KkkcOA/V23WqtbFjWarbpnrgMZk+VII3bk1CIWceC5CEWRABf8SFO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=pMTx4oG3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZwjmUc04; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 6F2707A00BF;
	Tue, 12 Aug 2025 12:51:45 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 12 Aug 2025 12:51:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1755017505; x=1755103905; bh=Gv
	96o/zVdTFb4A/NbNUV774NDLN9hXcGHpCYB/izmxs=; b=pMTx4oG3WVEAysFTAp
	1vFy1rImW71tNp0rK9U4trOS4hgawZPCyy0rqJX8vz/P5x54twQeGlTj89WOmEsQ
	/ELJ/bbuNljgU4wAOlAEFhDE9jcI/PzBw4a9Q112giYQW4QHA4QEMkgLm3T9cDaO
	1V5/hADzzwxrJOSl+U0KowgTGPWNJp5W/4qFgf6j4Qq8sBFJ/RKQNeOMNmGahxz8
	z3//nGeSgN4v6NBitGpnog5csWaE20IyaLvWeAmZPFvHsKJrYNHB+P8699jP6Yxu
	5cZuMLP1bbBpSFZDNCjOgzwiaWEUAN1w8iJU0hnVsYrE94dGFc1YIumcasMSnQyW
	y6JA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1755017505; x=1755103905; bh=Gv96o/zVdTFb4A/NbNUV774NDLN9
	hXcGHpCYB/izmxs=; b=ZwjmUc04nVLVZ58DxaSCkv3if02UhQkJvH7XuHZ8Nr3k
	GJurEOSNXAEzB/re3bSUmaQQ3N0wB9skYcNcSLTCx8roCmUkJhI7/BKHe7wb+ohD
	ErYRUKtO29aSodQpuJI/oOA8GFxh+/0HH97qiwWDq8DfdExFew3/Ke43xM0o9LFj
	QyptlKqGnQ9WjsZRWsqfBAaoh02BjeIW15jc2C2Qf5lr/vr62EqcMoVukham0Sp0
	KnI59itr/zLWyB27rtaKxDR7iZ+AWnNi32STc8WRa1kooZOTfyzkLqUu24vzwMzo
	+7zeictJ5Cy+pFRzqUOzsIuofaeQv+KIg7mu+oys3A==
X-ME-Sender: <xms:IHGbaDJ61zBKW1BMh4RQFd2S50wFq6IjjlhhvmbaiT8OLjXszUUrnw>
    <xme:IHGbaEGxLPkG-rRtLVelIRfmNPiAqfQXb8ua3dNk48Ntsx-DUKHAxJdUi64kDGGO3
    Cj023ywZAg3g_XZk5o>
X-ME-Received: <xmr:IHGbaHX8HHpPTEZ93hRe0wfcLCN45tFr_Seq7KI0jjiXhVOdo-gC6luyAVL1opn_AuXYGlYiMAbIla0Ar_r58vCesw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeehkeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgrshcu
    ufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrsh
    esrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefgffef
    udefuedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhn
    ugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    uggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruhdprhgtphhtthhope
    hsrghrrghvrghnrghksehgohhoghhlvgdrtghomhdprhgtphhtthhopehgvggvrhhtodhr
    vghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohepuggvvhhitggvthhrvggvqd
    gtohhmphhilhgvrhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
    uhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgv
    tghhrdhsvg
X-ME-Proxy: <xmx:IHGbaEwqQ2MNcH7XuLiybAeDreOOfDxM1cVIH0-4omI8EFD4bxD5Ig>
    <xmx:IHGbaERIYWJpGEFi94lr5KhZcGFOWI8DRcLCLafMfatTIkf13oKHmw>
    <xmx:IHGbaIgtzGMldLiaOoDLYofuLr0_hyz0NdcYu7MABKu3u7kE5iok7w>
    <xmx:IHGbaDlz6woTwVAtLl7FdinBu_a2mGex5OlJfOiGiVQVSEq1lygluw>
    <xmx:IXGbaKqTki56405zLqdhuf7mgXm8OV8CNT-imiM13JvujpaK473VoMow>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Aug 2025 12:51:44 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Rob Herring <robh@kernel.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Saravana Kannan <saravanak@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree-compiler@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2] checks: Remove check for graph child addresses
Date: Tue, 12 Aug 2025 18:51:22 +0200
Message-ID: <20250812165122.313382-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The dtc graph_child_address check can't distinguish between bindings
where there can only be a single endpoint, and cases where there can be
multiple endpoints.

In cases where the bindings allow for multiple endpoints but only one is
described false warnings about unnecessary #address-cells/#size-cells
can be generated, but only if the endpoint described have an address of
0 (A), for single endpoints with a non-zero address (B) no warnings are
generated.

A)
    ports {
	#address-cells = <1>;
	#size-cells = <0>;

	port@0 {
	    #address-cells = <1>;
	    #size-cells = <0>;

	    sourceA: endpoint@0 {
		reg = <0>
	    };
	};
    };

B)
    ports {
	#address-cells = <1>;
	#size-cells = <0>;

	port@0 {
	    #address-cells = <1>;
	    #size-cells = <0>;

	    sourceB: endpoint@1 {
		reg = <1>
	    };
	};
    };

Remove the check as it is somewhat redundant now that we can use schemas
to validate the full node.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
Changes since v2
- Rebase after 6.17-rc1 merge window closed.
---
 checks.c | 27 +--------------------------
 1 file changed, 1 insertion(+), 26 deletions(-)

diff --git a/checks.c b/checks.c
index 7e3fed5005b3..2072e1ea82dc 100644
--- a/checks.c
+++ b/checks.c
@@ -1894,31 +1894,6 @@ static void check_graph_endpoint(struct check *c, struct dt_info *dti,
 }
 WARNING(graph_endpoint, check_graph_endpoint, NULL, &graph_nodes);
 
-static void check_graph_child_address(struct check *c, struct dt_info *dti,
-				      struct node *node)
-{
-	int cnt = 0;
-	struct node *child;
-
-	if (node->bus != &graph_ports_bus && node->bus != &graph_port_bus)
-		return;
-
-	for_each_child(node, child) {
-		struct property *prop = get_property(child, "reg");
-
-		/* No error if we have any non-zero unit address */
-                if (prop && propval_cell(prop) != 0 )
-			return;
-
-		cnt++;
-	}
-
-	if (cnt == 1 && node->addr_cells != -1)
-		FAIL(c, dti, node, "graph node has single child node '%s', #address-cells/#size-cells are not necessary",
-		     node->children->name);
-}
-WARNING(graph_child_address, check_graph_child_address, NULL, &graph_nodes, &graph_port, &graph_endpoint);
-
 static struct check *check_table[] = {
 	&duplicate_node_names, &duplicate_property_names,
 	&node_name_chars, &node_name_format, &property_name_chars,
@@ -2005,7 +1980,7 @@ static struct check *check_table[] = {
 
 	&alias_paths,
 
-	&graph_nodes, &graph_child_address, &graph_port, &graph_endpoint,
+	&graph_nodes, &graph_port, &graph_endpoint,
 
 	&always_fail,
 };
-- 
2.50.1


