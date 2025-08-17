Return-Path: <linux-renesas-soc+bounces-20589-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E2FB2934A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Aug 2025 15:37:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B074173C63
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Aug 2025 13:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9351C289E04;
	Sun, 17 Aug 2025 13:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="iqCljAEl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZWxs+Wt7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F8E22256C;
	Sun, 17 Aug 2025 13:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755437877; cv=none; b=Xh5uxAWvz+yXB+mG8K+P0E5kQRLyJcR2L7wLFn55Aq5kUHnVt2UWY8M1MvU3Dkvez8YOps/yWN1e/59YFCbFq7tSOlX/9HaW0EJJOdSga01v6B10VfGktmitkCpi9nag0VAWo+vXTpBvO0kHxwZ/ob6/NvZwNSat/LIUyi5dQ+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755437877; c=relaxed/simple;
	bh=WdL9XpX+i0GfOTkMihOCh9h/2rnqf1PQnSx46NuNFk8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ThWcCI/hArqKwubS++kNrN1BuM9Pk9RaApNu0NN6Hi0N5yR6b53BvkRRhNro1TxPr0qvUDA4PTqgX52/UVx8TFo74IIkr63QFb/YNU7u93nAxFesLFH7VW1pd17cQTkgTpHvuyMkZxwodGMyaPHsDsudw4EByIRfMOJrs9LsGHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=iqCljAEl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZWxs+Wt7; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 22CCEEC00D9;
	Sun, 17 Aug 2025 09:37:54 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sun, 17 Aug 2025 09:37:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1755437874; x=1755524274; bh=Ma
	Uy2lEpuGQlV4ndnd3PoIxprSZGypoElsvDwj0RVU0=; b=iqCljAElhz95iNXaUa
	a5Hj7b0uIRyFwUv20afll8EqwsHSxRFn9W/sGd2zWnLnpMGeunqkz370L0k9y35i
	3NHdD7YsEga2ajrsRnrgXnqYA26c6DWRJwW8cxPSeD0377+cEPHqyjVYSjEWfhEB
	ktj7t7ZoyOiSorewhHdmeJzhfFaCA3UANSKLJhhX8YXkXw/gs/mLdT90Bro/Wsso
	tk3s596whF8hvk2WiDzRtKQMqPmJvQHl30vwL6Pnbn/adwEP/Trh2bLP3VM70MlJ
	ALAKqkrkg8yO28GrM27TtviMdxYSzoxBj5PC88Bq6dL6tktN+bpU3a7p24ml/BCA
	tphQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1755437874; x=1755524274; bh=MaUy2lEpuGQlV4ndnd3PoIxprSZG
	ypoElsvDwj0RVU0=; b=ZWxs+Wt7OwV4dMomRWL1DJz67UohYwe6QvdVgWh7ntVT
	UmiXCYuVTJe0djbgW9ZIQi9sJlPNJ6WvaQ6FDdSy0ens8Qjdc/mZyibTDeVtnMhC
	AEZvyx7+C6LHCsO2V96VqTRc4ptWQmSwWaYuo0PhUBNhi/zjMFpCuAVzzrCV/1Dn
	LKwOAhdJFwbAQK0TO9FJ1SOjKtD0KdfWgK9Ibtas6ypvbEcDTydz0gGB7F/XtuQE
	MN7CobZVOowUaRFEen39YsdymIFy+VVhrl9YUM2o3WTbOFDSYdVLojwvXCB5efj5
	aWfZV7hsUQf/wGLPeGMqkD6XH3OgCDWRxZohyvnm3g==
X-ME-Sender: <xms:MduhaO4tnqcYauo9EmsD1jbBVZLBWXnG6W4AOwEQg_BA9Qu-P0vpSw>
    <xme:MduhaE0gksrun7QVITyg4EpBC3t19hEhbJ5PDLtLfEEcQYcmJhCEewUemTgdtjhr0
    h9aWSXxGaYYiYzweC0>
X-ME-Received: <xmr:MduhaJEMIovXJuz6l7Mu6QcosKHT8E6KlgiMV7mzz2Ca7afJlpsyrlguC1KJyY3LfFB3pl74mzT7Ir3_Ug2K1-AFAA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeelkeejucetufdoteggodetrf
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
X-ME-Proxy: <xmx:MduhaDgutFBcrorupIfIbA0xDaAWER3dUaR0km9R2rvlnEDwW60CBg>
    <xmx:MduhaMD7lUpby8LRUgtKCmOGZ-H78MPPYXGzsr7X7cu2EVq_X-UTCQ>
    <xmx:MduhaFQBzpm4ik5mNyAZFUrv-wjIxqEHR072MexIjgfEe_E8yw5cjw>
    <xmx:MduhaBXpC9bgYsEHynXd_M0wjbF1MNxImlSLc0vuDpJVr90Udv4XFQ>
    <xmx:MtuhaJY2iyL_iqN_XezIVpHz1lpOwf5rKfqPn287kQEuGDG1ZnLwbzKr>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 17 Aug 2025 09:37:53 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Rob Herring <robh@kernel.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Saravana Kannan <saravanak@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree-compiler@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3] checks: Remove check for graph child addresses
Date: Sun, 17 Aug 2025 15:37:33 +0200
Message-ID: <20250817133733.3483922-1-niklas.soderlund+renesas@ragnatech.se>
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes since v3
- Update test suite in tests/run_tests.sh.
- Add Rb from Rob.

Changes since v2
- Rebase after 6.17-rc1 merge window closed.
---
 checks.c           | 27 +--------------------------
 tests/run_tests.sh |  2 --
 2 files changed, 1 insertion(+), 28 deletions(-)

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
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 2e172d7a2fd0..6c604888791f 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -749,7 +749,6 @@ dtc_tests () {
     check_tests "$SRCDIR/bad-phandle-cells.dts" interrupts_extended_property
     check_tests "$SRCDIR/bad-gpio.dts" gpios_property
     check_tests "$SRCDIR/good-gpio.dts" -n gpios_property
-    check_tests "$SRCDIR/bad-graph.dts" graph_child_address
     check_tests "$SRCDIR/bad-graph.dts" graph_port
     check_tests "$SRCDIR/bad-graph.dts" graph_endpoint
     check_tests "$SRCDIR/bad-graph-root1.dts" graph_nodes
@@ -758,7 +757,6 @@ dtc_tests () {
     check_tests "$SRCDIR/bad-graph-root4.dts" graph_nodes
     check_tests "$SRCDIR/bad-graph-reg-cells.dts" graph_endpoint
     check_tests "$SRCDIR/bad-graph-reg-cells.dts" graph_port
-    check_tests "$SRCDIR/bad-graph-child-address.dts" graph_child_address
     run_sh_test "$SRCDIR/dtc-checkfails.sh" deprecated_gpio_property -- -Wdeprecated_gpio_property -I dts -O dtb "$SRCDIR/bad-gpio.dts"
     run_sh_test "$SRCDIR/dtc-checkfails.sh" -n deprecated_gpio_property -- -Wdeprecated_gpio_property -I dts -O dtb "$SRCDIR/good-gpio.dts"
     check_tests "$SRCDIR/bad-interrupt-cells.dts" interrupts_property
-- 
2.50.1


