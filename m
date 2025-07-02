Return-Path: <linux-renesas-soc+bounces-19014-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F4CAF0E73
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 10:50:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D39D1C22151
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 08:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AACF423C4E9;
	Wed,  2 Jul 2025 08:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="s3yDybNI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BOY6uKm9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E6523C4E5;
	Wed,  2 Jul 2025 08:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751446231; cv=none; b=cg9GoBziPHX+gQgtjgh92wFfRqbo0PJgeJAg0Xbb4dNd4YbccPUc7THhxtF3UGtOBTUx0wVbXmkNwTttWurnkHH357cqWbHRV4YsdML0XD07w3QPtvGwNDWGdmd9FHekgnZBjGIkWrrA+RHlMkEWFCze1wdwaWUJIc2xu6BAA6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751446231; c=relaxed/simple;
	bh=46xx6u2dNmm4f0Toz7A8BHCdm8ru9OTcfH+Ybs8yD5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KR4WLoU/oo/BshdzNa7Ce/L2ZIklhOdI25dsdV2f7r4NgT3pYPFimK2bkq3YcIiQTYvpz5vgwBv6OvtPAPajdIo089WJ/nHSsP/k2uC+H/lspFH6+Jo8ek8veQATRIRLBXafkIw/qZ3dlCfj3nIugcmBL2EAVTjQGKVI2FMXWl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=s3yDybNI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BOY6uKm9; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0BEAD1400314;
	Wed,  2 Jul 2025 04:50:28 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 02 Jul 2025 04:50:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1751446228; x=1751532628; bh=JY
	4zieiO1jdNYbkCAh7pc/apnGtG7gPxdVaQ09PsYAs=; b=s3yDybNIIAy+eCltd2
	qrzgwSXu8BLdnKgzA3r5V8H098Krk2XvykyNV3FGJJSBW7N3af9uMxV1BD11ogG5
	744GCBLTonBqPpJWkaA7yyKm6/AEMQEL0PsAMF95xPltqWfGS+cy0P6lewSclaM7
	iIFMxhNmm989AIpoqbW+U5b3EB/6hkhJou1JXPBZr7CUohhSXsinTzlptm/ifDKq
	65iEhSCoAWiGmcKBeEnqwudQ99RhuoH5tBqdTDVqD4Ix/ulRktO4Qgqi3HeUd3p/
	DwuAq+lUU/j+cnN6ivDA3t8Y0bMm+h4iVa2vhQWtAooYNjE3xXUg7cJDNkMUN93C
	LUEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1751446228; x=1751532628; bh=JY4zieiO1jdNYbkCAh7pc/apnGtG
	7gPxdVaQ09PsYAs=; b=BOY6uKm9ryvqpdfx5jjrax5yW7UxJTTdMJS3+G+HL/5Q
	Oi55sEur4wgWbQsFI5URmMl5oRTjS2mgZY9AOUbuVbrc0VWNEF5521tqZhyNZ2jg
	aD+lVDOHW2yMVPROjsu0le6KzfSDkRm7k5E30Eu1Kyai7tl9d9sdj1fh+CoJX4UP
	qTk+31VUaV9BospsoDHJ5V8WdCAkieJ6jkbpTbWwKBfVi6Nh/Wg9d/IMlyoIhJeL
	7LPUJxihYMLe4Ib/cZF1mSv2c6JbHOsML+dzMGY9w44TDtZXAHXpTIjzmTFggyTT
	N+oBvCqn3dFewnrhqTxn5sAvdBSUimjocU2vd5yt+Q==
X-ME-Sender: <xms:0_JkaHgLWSR6OVs7_6epFv4vPzMImTwDRXjWG-VVAOmZJxEUp167aA>
    <xme:0_JkaEDOzWS1WPjr8tD7DvStFmrD84uv4artc3IAh-e8oRj75x4_xVjSWW7G0pmrb
    1bC3Eb_PikaVo1Y2LI>
X-ME-Received: <xmr:0_JkaHGpTm2WT13oH9auoASUzgK4XhBhs3YH3xTFJIcJTLCJGi4ObnkCCFJnXQY8RxE59xD0TCQmS4-ZslwkCCuXfw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduieeliecutefuodetggdotefrod
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
    rhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:0_JkaEQXya38kM6LTAKi4fRpHMDV1mELtJsmeXMISgI_F0ygTNCrOA>
    <xmx:0_JkaEzEeVDdeFpUX6Jy5is4zyqSHJG1YeVmNaL4rpHkCeWQv5Cwgg>
    <xmx:0_JkaK54Kwlxq5sSENGWFe_7UI96ltEiYP1X2khf7PrCNNEWw6Sa4w>
    <xmx:0_JkaJxH9Iy17yxdMEprLRtzeIJy9GL8lHUlgJmgG8LDgAw9zuR5OQ>
    <xmx:1PJkaJX4bQEirC9td99keTzLLcq3wLiRwps-24ae0dB-bAFbNhAp7GFc>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Jul 2025 04:50:27 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] dtc: Demote graph_child_address checks to W=2
Date: Wed,  2 Jul 2025 10:50:08 +0200
Message-ID: <20250702085008.689727-1-niklas.soderlund+renesas@ragnatech.se>
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

The false warnings, and especially the confusion on why it only triggers
for single endpoints where the address is 0, leads to confused user and
reports of issues with DTS files. To try and mitigate this behavior by
demote the check to W=2 and document the possibility for false warnings
in the check itself.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
Hi,

This solution was lightly hinted at [1] by Rob and I have ran with it
for a while locally and I'm happy with the result. Lets see what the
rest of you think.

1. https://lore.kernel.org/all/20250109150327.GA3352888-robh@kernel.org/
---
 scripts/Makefile.dtbs | 6 +++---
 scripts/dtc/checks.c  | 5 +++++
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
index 8d56c0815f33..fd8316bcf6c9 100644
--- a/scripts/Makefile.dtbs
+++ b/scripts/Makefile.dtbs
@@ -89,21 +89,21 @@ $(call multi_depend, $(multi-dtb-y), .dtb, -dtbs)
 # ---------------------------------------------------------------------------
 
 DTC ?= $(objtree)/scripts/dtc/dtc
-DTC_FLAGS += -Wno-unique_unit_address
+DTC_FLAGS += -Wno-graph_child_address -Wno-unique_unit_address
 
 # Disable noisy checks by default
 ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
 DTC_FLAGS += -Wno-unit_address_vs_reg \
              -Wno-avoid_unnecessary_addr_size \
              -Wno-alias_paths \
-             -Wno-graph_child_address \
              -Wno-simple_bus_reg
 else
 DTC_FLAGS += -Wunique_unit_address_if_enabled
 endif
 
 ifneq ($(findstring 2,$(KBUILD_EXTRA_WARN)),)
-DTC_FLAGS += -Wnode_name_chars_strict \
+DTC_FLAGS += -Wgraph_child_address \
+             -Wnode_name_chars_strict \
              -Wproperty_name_chars_strict \
              -Wunique_unit_address
 endif
diff --git a/scripts/dtc/checks.c b/scripts/dtc/checks.c
index 6e06aeab5503..103bd4b40f0a 100644
--- a/scripts/dtc/checks.c
+++ b/scripts/dtc/checks.c
@@ -1906,6 +1906,11 @@ static void check_graph_child_address(struct check *c, struct dt_info *dti,
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


