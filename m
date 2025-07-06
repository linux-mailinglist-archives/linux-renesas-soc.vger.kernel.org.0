Return-Path: <linux-renesas-soc+bounces-19286-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E64AFA519
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  6 Jul 2025 14:34:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C361E17A6BD
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  6 Jul 2025 12:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0764254652;
	Sun,  6 Jul 2025 12:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="EGl8P5OZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ONLNNjc3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54802153EA;
	Sun,  6 Jul 2025 12:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751805182; cv=none; b=WjIHO1XvlSgy+XZYrtCa23K2Hww2YlWqJzrHhS/0WVO4BAhb+B26SkseyLps3H3v2grMT02sPJq3kuccANLChW1+7MQ0kBotY/61L54MP3EKvgOo9qy3W592rTBn59gLNlc7uqBave12mOmge/xcZa3EHZi6z+iDpu7QM5bV838=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751805182; c=relaxed/simple;
	bh=TnTwhdfUs0035lf1PuzNbGz3UEKhLIoDjITur1nXOhc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=R9ZZXisDZa+d13xrf3RCCaACtoh9QlMp/T2w6W3swOb2/9dwvCq+L/s+QAuvZTgHxsWuXCjVrV5VdziHwTdB3RJycaLD+JJCeFq9YoGq/j7cWVWrsH+tKPDv5BNL/OfvmkImhhkb9mQIuqRbV5N3WNPhFMLn5Yj1eLGNzelxeOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=EGl8P5OZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ONLNNjc3; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 7CD701D0007B;
	Sun,  6 Jul 2025 08:32:59 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 06 Jul 2025 08:32:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1751805179; x=1751891579; bh=/6
	WwnkRzxkG1WlezZTOwYjW+6IG0f3NQF3cKmfUFfrA=; b=EGl8P5OZFUWE1rck2N
	sS/JWMx9bomqP/Pqx9pRcMsDAsZLSLQjoaRG25/Jkpm6HWzhwwAqwTxNqMhYr9IA
	tF2DlngXgY1CV7IiYvZccDT9LzrsiTgWGLfBrUEjqJww5SZ3Ba8cgc59ojftoZnJ
	4MbiP2GsEty6GE2GChijj5USsPWq4Ir//TNXed3b88m2sfA/cBLyA0WnAGRdkl+P
	5epqbAXvxhzb93d39S6GeEOk8kRlaD4KvU7sTlVcIcndaORL/dOp6md4RyzJNTKd
	fMexYE0eNfpmvf/vj02lv3pG4D6typ5DksBCGqKs5497eSmMbwm1MQ4EiyObe8Ju
	HPnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1751805179; x=1751891579; bh=/6WwnkRzxkG1WlezZTOwYjW+6IG0
	f3NQF3cKmfUFfrA=; b=ONLNNjc35f8eaYW6puwXX2CDyKglHTLjS+eHho/sc/r6
	27m1GTrVJjgTpyOgf64ezG3DCcc5cINtEzYRNoWTG0Cwd2DKr8bCY9up4gv3HWNe
	dFj82WG0ZoCX4PEZcMbUkDfoe5gJ8CoRNtOr5pESIzYfPRdaGPoTm963YFgXZHeI
	Zyoal6uAivm78PsOrSkrFQ9L3oMnNNG0gfuUy1BEcgqozzaE0+U58j4Er33l01zB
	1Jl2dj5IMVW3VLeIr0DNfIbX0f5bwEZcukA47EonjjY7qiXNfHGip9BbxEb77U4/
	g53NZMMs5a4xD9j+tK4AZ8bEC+eoi4iTv4k9qlyhYA==
X-ME-Sender: <xms:-2xqaFRWd5R6JkxRO0imRw9wWZV0_6MG8p7gDdeWE7D_SPLFgGUclw>
    <xme:-2xqaOxVxSM2v2-lEDPdI_FFplAatqrGFEtOB87xnoajN8yV-Phv4H90a2I7XVarY
    fBvmQ2oLmfZvd5_mTo>
X-ME-Received: <xmr:-2xqaK31J1tQ8tqn963S32tmBF549seOu7Kk5EoWzgQqCHDg8vhDd1A_PnvTc72rKrbLlkuycV-GVORbWpSonhZSCg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvkeelvdcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:-2xqaNB0HH0BB4P0K2bVEGNnChhpjhDF-Q0nDoCBWwJOT2UwCXTkYg>
    <xmx:-2xqaOhgFCI0Y62aeC_9sOjZ_RIaPFIaZe0ZNnLcFOYmjFgkqGOQVA>
    <xmx:-2xqaBpPhNg931FhY87ZIi85uYGWKA_hZsARyaN2PFfZkMkbfHvDmQ>
    <xmx:-2xqaJib_PmE5G35Y5U9uezp3zPoyo5wqMsV2ldk_PMd8CzzroVmtA>
    <xmx:-2xqaGXRagGXQkCQ1qmGCyZzSX0Tw5FKa-8sNvkUaBoqJQWSvWWsYXFv>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 6 Jul 2025 08:32:58 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2] dtc: Demote graph_child_address checks to W=2
Date: Sun,  6 Jul 2025 14:32:43 +0200
Message-ID: <20250706123243.1050718-1-niklas.soderlund+renesas@ragnatech.se>
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
demote the check to W=2.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Drop adding a comment to dtc/checks.c documenting the possibility for
  a false warning. This change have been posted separately to the
  devicetree-compiler list [1]

1.  https://lore.kernel.org/devicetree-compiler/20250706122638.1040347-1-niklas.soderlund+renesas@ragnatech.se/

---
Hi,

This solution was lightly hinted at [1] by Rob and I have ran with it
for a while locally and I'm happy with the result. Lets see what the
rest of you think.

1. https://lore.kernel.org/all/20250109150327.GA3352888-robh@kernel.org/
---
 scripts/Makefile.dtbs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

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
-- 
2.50.0


