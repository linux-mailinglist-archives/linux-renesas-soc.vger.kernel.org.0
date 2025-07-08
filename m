Return-Path: <linux-renesas-soc+bounces-19393-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94530AFD069
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 18:17:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29DD51885A9D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 16:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 722E22E5412;
	Tue,  8 Jul 2025 16:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="rh4SVCth";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AYINIi3K"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1CF2E427B;
	Tue,  8 Jul 2025 16:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751991413; cv=none; b=AuVGin87yakCAZCjwFHUeHgUNCHAGt3moWy84zh3iNy5Vio5cTpGEexxgr00eCs9YNoJEcmjLyrgYh/Lg5dthCD6Qa/hwkNetJOSbyfZPBuqeUm8FfvhrzQJLk5ebkaM8YIgzMWh8YOOfJF9xAlCSTqRKjlAkTsgc15YJlob4rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751991413; c=relaxed/simple;
	bh=20H5LuZNgDbcrUwYu5SZ2GYXneJ5TTtVqONgj2IHgrg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fMK1pYKVx5i3XDIuMVku8q1Szow9IUSnOo2euxGraDmFblqUjueBlHkFa2WK+LTdJKVEs2TPBZzN5jckpaEFhsnLds+n9drZmwFLAodQr2I5ZnfGrn7BLZKY4whuyHKEOCsqioJ6MzvGktcm1Dq5BiAQqXX5quwvvfPz6l52/j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=rh4SVCth; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AYINIi3K; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id D89FC1D0013B;
	Tue,  8 Jul 2025 12:16:47 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 08 Jul 2025 12:16:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1751991407; x=1752077807; bh=ZG
	+ymZnLkvXORzQKoLZS4mUtpVfy/tQvk/yeS43XmGc=; b=rh4SVCthUdzXLV/rRm
	YpQm3GaMeYBvVuI6SFZ6BAMV6FL1Id4faesW1FFHCahE37dVimmTc17cRq2kTeHw
	pYpWGGDhWMb+62mY4Lx5tO9HmaqAaYhAavVGl/Dm8V9cxavZjIHSc9luJ7MPojO8
	NlMQlJHXtjkcrfFhaDCojUKyL095MnhL6y8uvVuA99Hlo5bbdAnfwkWVClAS5++c
	UBDp5a7xU1AWFXgv95GxHLYyBbrfHBneWjdFJja5136vfQzPJ2esDuTfghF7Fxjc
	vhFTncs9oWGRg3H8In5VI4VmxR7qmwJ9cyxKhNTrQ+DryRcMnsRDzZg0xUDiRTdW
	vhmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1751991407; x=1752077807; bh=ZG+ymZnLkvXORzQKoLZS4mUtpVfy
	/tQvk/yeS43XmGc=; b=AYINIi3KXvS+sG/0FU/BrzlOVxs9OsWptGLs8bbC6hzg
	K3Pwhp6K3WXn8fVY5sDHM7HHBQDw9YjekqsYdUfPu2MLwdNaaGph5otReyKdxUoO
	XWmExpqRaHhpreF2nzgzi1+O7Pqz3qJHXfqsNFBuHGR+iiE3JH2lAuK1wFWwvUsi
	X1HWQhpFyw5BZ/EpPEG5l7moXmsdnR5c5DxzFkM/W/CO8LQoLhUcWOat5ww5xdnw
	sqKvAmNXnybujty1gdRf7t0eMFlVQbrwgkXQpMwq6xEYI/03k9CYoXlBXZKJf3sH
	30MItMYJ6J3wbGHPM1aa453ERaD+jYFSfIUdzjjTIQ==
X-ME-Sender: <xms:b0RtaLrKVaJGkXgM3MBBmHn0_dxQBLxVFC3pAxBfd_vHnbnnc_uaIQ>
    <xme:b0RtaCkrr_XYBbnhxEWM09emE5kNiu7pRBdwbWnn3FrGzp7kbFRbnQVn4jj8tyVN4
    aRuHZOF-7ZT_6QwxUI>
X-ME-Received: <xmr:b0RtaD1UEcnAiFO2JtoFJ9atM_6QMHmaDoHK-Y_w2LoPJ8rfhUDdf88xTSuApAhpX2i3ZEAvAEBwcsFQdzFPyRXkow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefhedufecutefuodetggdotefrod
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
    hrtghpthhtohepuggvvhhitggvthhrvggvqdgtohhmphhilhgvrhesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrghsrdhsohguvghrlhhu
    nhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:b0RtaHQ6iuTEPcXcRsZJlCjz6e5KQHuv2RkJV66fij2cHOv03RxGSA>
    <xmx:b0RtaEwZB9uHQJnQDjGfcOzogfR-aIfDOH2_P4kC3Tc3uDSOdczCHg>
    <xmx:b0RtaPBdk1-SIK2oJppLS5QNm5D8gWNlNo-BeN54RBhSQfsojVbM3g>
    <xmx:b0RtaIF_GASaVW9nXq8v_V-Dln19b6uE8lENXEG8dDwWQ8_uzhWlhQ>
    <xmx:b0RtaNJlGPB9ne5gOCyQ-Q9m9h1101lz-QEpziJA6pmgo1UhNcWW60Qo>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Jul 2025 12:16:46 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Rob Herring <robh@kernel.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Saravana Kannan <saravanak@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree-compiler@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] checks: Remove check for graph child addresses
Date: Tue,  8 Jul 2025 18:15:47 +0200
Message-ID: <20250708161547.149599-1-niklas.soderlund+renesas@ragnatech.se>
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


