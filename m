Return-Path: <linux-renesas-soc+bounces-19391-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C78AFD001
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 18:03:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA6FD3B6B0A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 16:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDCD5253F13;
	Tue,  8 Jul 2025 16:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="B5rSjYFG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Z4Ki1NQM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4272E36E2;
	Tue,  8 Jul 2025 16:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751990587; cv=none; b=VZ8RVi/XBdvQpJIj69H+v4c9qdWTT2+PWc2F8bgkfjjHJJLr21psIgjw+/2h5W7mkgklnjfCo1hjGn+k8V/S5qUOo8JIGj8ZQqClhzIFWFn2mwTsnY4/Hnxo+BaGgp/sSsID0RFsb5EuPiM+SYtFOr7IpA4FQ4woe4zEJb9Ecvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751990587; c=relaxed/simple;
	bh=20H5LuZNgDbcrUwYu5SZ2GYXneJ5TTtVqONgj2IHgrg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kYnlY12e+Sj0GadoAw3JFZucYkC+BdTxVtGbiNYDA+5eAMmMTAeKhtwZkw9kUEM/ArmE9IOvW2KAacg7vvl6fU4vJpI5B002hhRASGshnw5J6d814HqbSVfR0K6b1FCTBDgXr44kWt327148pLK5zt194b/g4cmnKNk7wfa0vQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=B5rSjYFG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Z4Ki1NQM; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 972877A015A;
	Tue,  8 Jul 2025 12:03:04 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 08 Jul 2025 12:03:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1751990584; x=1752076984; bh=ZG
	+ymZnLkvXORzQKoLZS4mUtpVfy/tQvk/yeS43XmGc=; b=B5rSjYFGWYa87XyIu/
	wrdiej5STJV4WuANIylbw/+Zoqdc4EklmuA4Ogek2inMoN8pZ49ttNdHk4EMhwm9
	PbciilvCaVLjjVvB7T62KLAhkc9hZE9QlUM5nwDpamay/GtOz4MJNCRNBruhSizt
	R74U9rR8kOl22dOtaAiEDix9HWX7FJGgKG6J+95FJfQENZWakXjFhCpJhLVn7TQH
	X38vWCJG8uXBfC31NoZH/2vCTOU/pcudBRGwHQFUjWyr/Gc/RN+sJQwOjzifwZxi
	xXkFJ3o6m9NXgwqe/StOOhNXLQ0DSoZIHPD11iNIOYPb0/R9r0kRpXIgprPVlzpS
	a1dQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1751990584; x=1752076984; bh=ZG+ymZnLkvXORzQKoLZS4mUtpVfy
	/tQvk/yeS43XmGc=; b=Z4Ki1NQMTXWWaSXhb1C1+GZ0HMvrA1jdxcx1f++xrBxq
	o5kH3V8rRkqVfCFJoTOh9I0RDbMuKjWBld2++S2S/uwW2dPU0PXjKIW6UhgZv8ln
	f89MMrsVDCY5SbDODZfQ6LLvBWXSxx7L6THYxZhs22kI/f7ul76wlFzUb4LqWeVc
	JjjdnnNzln/eg+A9VdM+0wwlAEIGU6BEO1koD3NuAfLUR/om9SbYuQ6407UNu4Dd
	EoKT1busSr6QxLtYgsLjpH8muTNvYJdGm5C+Wd3Qa/ipWBJWTjJnnenhxgf2GYsv
	EEX482BW3QI9FAy2Ab7QhLq1JBQH+sMbjmNBIFI2tg==
X-ME-Sender: <xms:N0FtaKBHi4zFXPihn5s1QdBhMtiD_mc5NaPcKzKUVhTzbP_3aUZ6-A>
    <xme:N0FtaBf9s1RquF2yLysRbSY8m3K_Ok0dsZXJ0FLJKryfuFjiCsW8xeyAK-vN8J4ue
    6W4ayo67C3qAhL2hnY>
X-ME-Received: <xmr:N0FtaJOKIn4L0xsYherthjSlzBUDpfSJ3XjmRrMXWPS9T2sM3uVyV0gBxNSd8cR0BBboNIOKNMDmaQMDJorEkTTC0Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefheduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghsucfu
    npguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghsse
    hrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhephfeghfevgefhteduheff
    hfejieelheekvdevffdutdelgedugeejueeffeevffdtnecuffhomhgrihhnpehkvghrnh
    gvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsg
    gprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehrohgshhes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhoph
    gsvggrrhdrihgurdgruhdprhgtphhtthhopehsrghrrghvrghnrghksehgohhoghhlvgdr
    tghomhdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpd
    hrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgr
    shesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:N0FtaBKh9x6BGFt7coV1uygv5YEzNhUhQt0fK_IF7V4fNT_UOm4AAQ>
    <xmx:N0FtaJK-daM_tFmdrjwf0LUra_VEheCi3Kdtmid9cscR2qUgiElHJg>
    <xmx:N0FtaL6gtC8Vg4eDFaNBjj1zoQEusF1q7bnSxisKVN_yUDRDmi_RgA>
    <xmx:N0FtaDcFL74FT7dYiM2altshbv4JjyQ1eX0bwUxc1cJce4BCgK8mDw>
    <xmx:OEFtaF5ztlO1RdG3NyB5qn_Hssdup6LhK_0UZ8miRZKR26S8lwGl3qgi>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Jul 2025 12:03:03 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Rob Herring <robh@kernel.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Saravana Kannan <saravanak@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] checks: Remove check for graph child addresses
Date: Tue,  8 Jul 2025 18:02:01 +0200
Message-ID: <20250708160201.141428-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.50.0
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
Hello,

This started as an effort to demote this check to W=2 [1] and have then
moved on from there to completely remove the check in this patch per
David and Rob's suggestion.

This patch supersedes all other patches for my me in this area.

If this change is accepted in dtc and later checks.c synced to
linux/scripts/dtc/checks.c one must also drop "-Wno-graph_child_address"
from Documentation/devicetree/bindings/Makefile and
scripts/Makefile.dtbs.

1.  https://lore.kernel.org/all/20250702085008.689727-1-niklas.soderlund%2Brenesas@ragnatech.se/
---
 checks.c | 27 +--------------------------
 1 file changed, 1 insertion(+), 26 deletions(-)

diff --git a/checks.c b/checks.c
index 123f2eb425f4..0b1fd9f13cb4 100644
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
2.50.0


