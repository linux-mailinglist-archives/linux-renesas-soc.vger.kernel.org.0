Return-Path: <linux-renesas-soc+bounces-19285-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B9DAFA515
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  6 Jul 2025 14:27:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E7D6189C052
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  6 Jul 2025 12:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C6661C84B8;
	Sun,  6 Jul 2025 12:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="FZ69Ajij";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iN9ghSfc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752032E36F4;
	Sun,  6 Jul 2025 12:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751804862; cv=none; b=tEVUy4v0rnTCoe+ojiigW1bYORIp2P0io7eE5MqfpW+Z1Eu5ENB3o9lx10WVlp8tg6OJZxc4yjxKow6BdqsnAL+bCrXYGAGA9W0PXAJIvYLnhzrvOFmCj5JzHD17x+qg0m0ls/2/bo1Duerilhn+ixbX79Azh6qH03mEtSUAl/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751804862; c=relaxed/simple;
	bh=6SMEijxHkT6ClOv4G6cF7zE4CN0cCGUcE+ogshme/6E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CVefFEkbKFPbP0ZuvQYdLngJt3Az9bQ9DbHBwkWAZXI0TcmL0e0m+9Q3zyhqOWNqI0rP2CVEu17KccgtBgvfKeESvG71XDZSU+d7GzF+NPLtXnP8ghuuajm1ONAzSDGbPAXmzjETTScOf0ma4mAsU+AuBNHGMeubBJluaGiZw6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=FZ69Ajij; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iN9ghSfc; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 421477A0150;
	Sun,  6 Jul 2025 08:27:39 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sun, 06 Jul 2025 08:27:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1751804859; x=1751891259; bh=yI
	5s3cTHY4jesZZtVQqqqexC/tO5kaCY1uCbjGw6B2A=; b=FZ69AjijX6nC3Las6m
	g9yU9TPxgq5IUCnVt1qULGPE+HiHOOWm4FooEfgHWxGIgKsBepXIea4yZn4BzG7p
	j59LnDEd3BJQNXqYJVogfFMl/VNlkIVQC3WXFKnkLO0QmIR9iLyYc/4wZiqFPY/m
	MlOhDuor3kgaQ2vkxRSQQymvysUusWMayuOrYn7UAOgzAE34ZwvPcH1LjJ3ltJN5
	VZvYoGCXnGc8AbM07LiIhpHg9royVn9IbdTLsEiYQw1YpQFSzO53jLrw4Rrph8xV
	Kcs/9Vp7FyuMtMooPFfv+jX+5nKvL5KONKlMuYo3ykK7418K6lRhIdMNFbmqZBiT
	fRmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1751804859; x=1751891259; bh=yI5s3cTHY4jesZZtVQqqqexC/tO5
	kaCY1uCbjGw6B2A=; b=iN9ghSfcGwb+pcDbeYtvQzw8kOQKf7QN+ttn/vEKOZp1
	wQDCLprTs9YinBrLGWEYWlR8KesWNhuq6Uew4IbnmSbEI7ANOUrm7knSh2mAa5UL
	1KixbM71sri4hgZfLLaPTuihMgbz67mLiLYThdW5UojW6gvlWjjrHVrripGQzxFG
	G6z+4cGKVxi4DCltMkwZB+mUX3/sTFG5BaK3oxzhEDzNEDMKjFUey2yJHdZ5FnBx
	x4Q0GDok6Z2qFNppnz0NzHVRAEHnsA/nBQNScoQNjInGY4yT74e6P+ig15O/F/n7
	Wqup2BgWYIIGyY9ApZqZ8cwvsMVInn/KVYu0LomnRQ==
X-ME-Sender: <xms:umtqaCZgHyV6D-T0Qnlf05_qBpMSP2ZxNu13PVJCSZ9KhQqkyZyi6A>
    <xme:umtqaFYwvN3np8mz9VBY5B5ilvcuv6ksuFyQHJGvZT7V0RDaGnog6asr1u5utHpvV
    yVDLabR-_g8P3ZxS_g>
X-ME-Received: <xmr:umtqaM8wNpebAR76cwcNfTG4q3UjIQU8xi_TgYyYtVSi6QM54ILuxaisoLIC_15NGBi-v8udxnArmnu5Vk9vKHlzLg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvkeeludcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghsucfu
    npguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghsse
    hrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhephfeghfevgefhteduheff
    hfejieelheekvdevffdutdelgedugeejueeffeevffdtnecuffhomhgrihhnpehkvghrnh
    gvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsg
    gprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehrohgshhes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepshgrrhgrvhgrnhgrkhesghhoohhglhgvrd
    gtohhmpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdp
    rhgtphhtthhopeguvghvihgtvghtrhgvvgdqtghomhhpihhlvghrsehvghgvrhdrkhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhouggvrhhluh
    hnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:umtqaEoupNeAYL61E9K_pP5z6XYlOECo0Sa3o_GPOIxkQmUx4gLkVw>
    <xmx:umtqaNr1-WYua1eFqWbqkpmiNmDPp5my6a8orYQ6SIa9HwaG5jsgjA>
    <xmx:umtqaCQmLp0ukZ46_YOsiH8lwc9PRpuo3TMuRAoMQy7cbx5bIo5uIg>
    <xmx:umtqaNomuDbBtOxAykanPR7WbW_E7e0aSvdFjY8lWJZuq8h_-BuFeg>
    <xmx:u2tqaJfUGKfJw1u6IXAICKCiV9lo3id_x5TePIXOSrxlrtnwVPLx2cYV>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 6 Jul 2025 08:27:37 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree-compiler@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] checks: Document possible false warning for graph child addresses
Date: Sun,  6 Jul 2025 14:26:38 +0200
Message-ID: <20250706122638.1040347-1-niklas.soderlund+renesas@ragnatech.se>
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

Add a comment in the check to document this.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
Hello,

This was previously part of a patch posted to devicetree@vger.kernel.org
[1], but as Rob's points out in that thread it should have been posted
separately to devicetree-compiler@vger.kernel.org. Sorry for not
realising that dtc changes go to thru a separate tree.

1.  https://lore.kernel.org/all/20250702085008.689727-1-niklas.soderlund%2Brenesas@ragnatech.se/
---
 checks.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/checks.c b/checks.c
index 123f2eb425f4..52d09fcf8d3a 100644
--- a/checks.c
+++ b/checks.c
@@ -1913,6 +1913,11 @@ static void check_graph_child_address(struct check *c, struct dt_info *dti,
 		cnt++;
 	}
 
+	/*
+	 * This check can produce false warnings if the bindings allow for more
+	 * then one endpoint in the node but only one is present and it has a
+	 * unit address of zero.
+	 */
 	if (cnt == 1 && node->addr_cells != -1)
 		FAIL(c, dti, node, "graph node has single child node '%s', #address-cells/#size-cells are not necessary",
 		     node->children->name);
-- 
2.50.0


