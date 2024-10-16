Return-Path: <linux-renesas-soc+bounces-9801-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A5C9A0BDB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2024 15:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A15F0B20D91
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2024 13:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE0B209F29;
	Wed, 16 Oct 2024 13:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="e9G81XbT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZHBP9zD9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6DF208D7D;
	Wed, 16 Oct 2024 13:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729086537; cv=none; b=JFPaMXkifjoYuyYBtYdrC2yGvQ5TdAme5sC9BIymvGcVbDQJL1FlDL8QBZiC0MHpvZh+DH91ts7MIo3eRnjIb5PBilvnH2pS4PrbIcL4DhTOg3+3XjyegHjoz3Ru8rMCz613QJPEklo6sQrsVaF4aZyNik4TI1kFRoalCJj3yM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729086537; c=relaxed/simple;
	bh=lXblGgsd7PdbQ2iWZoRo8vYzQCRoI43ZWPgAMMblFuI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QyW8OjkKyKuRlnvbAFMO3VFjtu1hw64fRm2tDB+2mKzHfJbaGGRn18RbJXlUMBvNJLXonMPWZCaVhzcaOFPmZ11wnQyjwXzn2u6GnJWQpP5MJ9d3S+8AbjGzzZaoyazMJwDZsD9HQYGxurzssaEw8dMMhQgHf0GWNdpL2DKGVFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=e9G81XbT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZHBP9zD9; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 32C441140140;
	Wed, 16 Oct 2024 09:48:52 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 16 Oct 2024 09:48:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1729086532; x=1729172932; bh=8G
	LykyZ/vEJH/zkcjy9DBAUQ8SAuHDjRmXtzRfkvVaA=; b=e9G81XbTcxcuiSCZTP
	fsZ3SycwEaX2aUmuZoJCFGixx9O67H5HgXoaUekp2gGa4yRWxakN3goMYyTahUZk
	8b7BueD2rKvrbTPZ9ysJ4pciYyieq6TJGTehggJSB5HlVmHLY84VwsEJnlUMSaN1
	v6/DhHSMgWiL74XCSqQECciETTrsNxmkX1uboajVvATNT3gn228tI/BN9ArtBfHf
	y5EGu4pE8pGkrrU4eTXfqvqWIwDfwctTE6tdcOYTRRCTdVKD6k/Vxt+HWbhDXaFV
	KRhxMfk8NwlbaQe0UyGWGHzXgWdqnjXynab+pZwON5kBic9DIzWYGgKGTjwHWJUu
	mcYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1729086532; x=1729172932; bh=8GLykyZ/vEJH/
	zkcjy9DBAUQ8SAuHDjRmXtzRfkvVaA=; b=ZHBP9zD92XS7OnPFY+L6OKB9gArgj
	hHS0sYzXCOWZwKtoXr2FW3PrvwXywiPB1734RryaP0Hlr6XFEZ/89qHzwcl/bG6X
	gID8fqVNmbB4UVane8oxXYeHFQXBbhQslR5SHi5ALj3dJpn0irTGfDNq62zxiPXt
	MjVe6kliOh9lePcfM/qqbILFldYx19bUXAAAHr/j6azXfvxlK6QpVjVqmDFD/hDE
	pHSJiuleAbAW3rjMft/lFTAeKzEwqtSs54ocuG7LGabHIdiJDBInmlxkEL0ZS4Et
	KRCNchczSQEGrLHC+6dQgf5aWPpmApBijWhoMF6pw5RZRQI+CJpfmbFXQ==
X-ME-Sender: <xms:Q8QPZ-AvcyhZQV7hmzGlhPmv9_27WkezkiZybQLHVNrEBcdk6vRycQ>
    <xme:Q8QPZ4i-hGC_RtApTaWsZsMPqHnXWTzYPnTbHyd3-GVLrD49yLtQtXPqVl3T2r1wv
    sGwBx08LTOiYRqjUcQ>
X-ME-Received: <xmr:Q8QPZxmoc-gLW_rNIkpxTWr7wrj-rBHHI5twjAgkm5Qht91lSJQodY2YfHKba9jhXteoMr0mAVki_RiM3B-mE0XSBA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdegledgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecu
    hfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrh
    hluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgv
    rhhnpeehudelteetkefgffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfeetge
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhk
    lhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtth
    hopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehgvggvrhhtodhrvghnvghs
    rghssehglhhiuggvrhdrsggvpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegt
    ohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnh
    gvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghv
    ihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklh
    grshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvpdhr
    tghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:Q8QPZ8x0NMxT9N-_gz1I4RKK-jovmrqRFtItjYjkEDUDXv8-13uOqA>
    <xmx:Q8QPZzTHmOPIDusvCBZU3cU_sL7RF7vqzYplZYjPzaorrkf4I6BmAw>
    <xmx:Q8QPZ3Yl3GfR4vShaHhGOE1PA2Y3iwe3XcYwi0QZ-eNaqyiXARnozw>
    <xmx:Q8QPZ8SIyVHBcg0Ja9GWrHPAHBptXBHw0oQa8YubZPphakv-DRGwMg>
    <xmx:RMQPZ-HIsK-6AM4Lh8AdgI7kWqo3IyUXMUx2EekPyBC2pfs5WCGaVC1f>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Oct 2024 09:48:51 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] arm64: dts: renesas: r8a779g0: Fix graph_child_address warnings from capture pipeline
Date: Wed, 16 Oct 2024 15:48:19 +0200
Message-ID: <20241016134819.1434340-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The bindings for the R-Car video capture pipeline uses ports and
endpoints to describe which IP is wired up and present on the different
SoCs. It is needed to describe both which instance of an IP is
connected, and to which port. The bindings try to be as reusable as
possible across the different R-Car generations.

For example R-Car VIN IP bindings have three ports, where two of them
can have multiple endpoints. Not all ports or endpoints are physically
present on each generation and/or model of R-Car SoCs.

The users of the VIN bindings needs to know not only that a port have
one, or more, endpoints but also which particular hardware instance it
is. The bindings defines endpoint indexes to correspond to particular
hardware instances that can be routed to a port to describe this.

This design leads to warnings when compiling the DTB if a port that can
describe more then one endpoint only describes a single endpoint. And
that endpoint corresponds to be the hardware the bindings defined to
index 0. For example compiling R-Car V4H which includes r8a779g0.dtsi,

   ../r8a779g0.dtsi:1200.12-1210.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   ../r8a779g0.dtsi:1228.12-1238.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   ../r8a779g0.dtsi:1256.12-1266.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   ../r8a779g0.dtsi:1284.12-1294.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   ../r8a779g0.dtsi:1312.12-1322.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   ../r8a779g0.dtsi:1340.12-1350.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   ../r8a779g0.dtsi:1368.12-1378.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   ../r8a779g0.dtsi:1396.12-1406.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   ../r8a779g0.dtsi:2076.12-2086.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are

To avoid these warnings define all possible endpoints for each port in
the video capture pipeline, but only set the remote-endpoint property if
there is hardware present. This takes care of the warnings, but it also
adds empty endpoints that are not connected to anything on that
particular SoC.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
Hi Geert,

This only addresses the warnings on V4H. More boards do trigger these
warnings but before I address them I thought it was a good idea we
agreed if this is a good way forward.

In this design I have defined every possible endpoint for the ports
involved. This might be a bit excessive as we define endpoints that are
not physically possible for V4H. For example V4H only have 2 CSISP
instances, while the bindings allow for up-to 4 CSISP as that is
possible on V3U which the CSISP bindings are shared with.

I'm not sure where to best draw the line. Only adding empty endpoints if
they are possible on the SoC sounds good, but what if we get a board
with only a single CSISP for example? That would be a single endpoint
with an index of 0, this triggering the warning.

Maybe do the minimum and only define an extra endpoint for ports that
trigger the warning? And if it nots pysically possible for that SoC add
a comment? This feels wrong however.

Let me know what you think. But it would be nice to get rid of these
warnings one way or another.

Kind Regards,
Niklas
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 200 ++++++++++++++++++++++
 1 file changed, 200 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 61c6b8022ffd..e3079562fe65 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -1364,6 +1364,18 @@ vin00isp0: endpoint@0 {
 						reg = <0>;
 						remote-endpoint = <&isp0vin00>;
 					};
+
+					vin00isp1: endpoint@1 {
+						reg = <1>;
+					};
+
+					vin00isp2: endpoint@2 {
+						reg = <2>;
+					};
+
+					vin00isp3: endpoint@3 {
+						reg = <3>;
+					};
 				};
 			};
 		};
@@ -1393,6 +1405,18 @@ vin01isp0: endpoint@0 {
 						reg = <0>;
 						remote-endpoint = <&isp0vin01>;
 					};
+
+					vin01isp1: endpoint@1 {
+						reg = <1>;
+					};
+
+					vin01isp2: endpoint@2 {
+						reg = <2>;
+					};
+
+					vin01isp3: endpoint@3 {
+						reg = <3>;
+					};
 				};
 			};
 		};
@@ -1422,6 +1446,18 @@ vin02isp0: endpoint@0 {
 						reg = <0>;
 						remote-endpoint = <&isp0vin02>;
 					};
+
+					vin02isp1: endpoint@1 {
+						reg = <1>;
+					};
+
+					vin02isp2: endpoint@2 {
+						reg = <2>;
+					};
+
+					vin02isp3: endpoint@3 {
+						reg = <3>;
+					};
 				};
 			};
 		};
@@ -1451,6 +1487,18 @@ vin03isp0: endpoint@0 {
 						reg = <0>;
 						remote-endpoint = <&isp0vin03>;
 					};
+
+					vin03isp1: endpoint@1 {
+						reg = <1>;
+					};
+
+					vin03isp2: endpoint@2 {
+						reg = <2>;
+					};
+
+					vin03isp3: endpoint@3 {
+						reg = <3>;
+					};
 				};
 			};
 		};
@@ -1480,6 +1528,18 @@ vin04isp0: endpoint@0 {
 						reg = <0>;
 						remote-endpoint = <&isp0vin04>;
 					};
+
+					vin04isp1: endpoint@1 {
+						reg = <1>;
+					};
+
+					vin04isp2: endpoint@2 {
+						reg = <2>;
+					};
+
+					vin04isp3: endpoint@3 {
+						reg = <3>;
+					};
 				};
 			};
 		};
@@ -1509,6 +1569,18 @@ vin05isp0: endpoint@0 {
 						reg = <0>;
 						remote-endpoint = <&isp0vin05>;
 					};
+
+					vin05isp1: endpoint@1 {
+						reg = <1>;
+					};
+
+					vin05isp2: endpoint@2 {
+						reg = <2>;
+					};
+
+					vin05isp3: endpoint@3 {
+						reg = <3>;
+					};
 				};
 			};
 		};
@@ -1538,6 +1610,18 @@ vin06isp0: endpoint@0 {
 						reg = <0>;
 						remote-endpoint = <&isp0vin06>;
 					};
+
+					vin06isp1: endpoint@1 {
+						reg = <1>;
+					};
+
+					vin06isp2: endpoint@2 {
+						reg = <2>;
+					};
+
+					vin06isp3: endpoint@3 {
+						reg = <3>;
+					};
 				};
 			};
 		};
@@ -1567,6 +1651,18 @@ vin07isp0: endpoint@0 {
 						reg = <0>;
 						remote-endpoint = <&isp0vin07>;
 					};
+
+					vin07isp1: endpoint@1 {
+						reg = <1>;
+					};
+
+					vin07isp2: endpoint@2 {
+						reg = <2>;
+					};
+
+					vin07isp3: endpoint@3 {
+						reg = <3>;
+					};
 				};
 			};
 		};
@@ -1592,10 +1688,22 @@ port@2 {
 
 					reg = <2>;
 
+					vin08isp0: endpoint@0 {
+						reg = <0>;
+					};
+
 					vin08isp1: endpoint@1 {
 						reg = <1>;
 						remote-endpoint = <&isp1vin08>;
 					};
+
+					vin08isp2: endpoint@2 {
+						reg = <2>;
+					};
+
+					vin08isp3: endpoint@3 {
+						reg = <3>;
+					};
 				};
 			};
 		};
@@ -1621,10 +1729,22 @@ port@2 {
 
 					reg = <2>;
 
+					vin09isp0: endpoint@0 {
+						reg = <0>;
+					};
+
 					vin09isp1: endpoint@1 {
 						reg = <1>;
 						remote-endpoint = <&isp1vin09>;
 					};
+
+					vin09isp2: endpoint@2 {
+						reg = <2>;
+					};
+
+					vin09isp3: endpoint@3 {
+						reg = <3>;
+					};
 				};
 			};
 		};
@@ -1650,10 +1770,22 @@ port@2 {
 
 					reg = <2>;
 
+					vin10isp0: endpoint@0 {
+						reg = <0>;
+					};
+
 					vin10isp1: endpoint@1 {
 						reg = <1>;
 						remote-endpoint = <&isp1vin10>;
 					};
+
+					vin10isp2: endpoint@2 {
+						reg = <2>;
+					};
+
+					vin10isp3: endpoint@3 {
+						reg = <3>;
+					};
 				};
 			};
 		};
@@ -1679,10 +1811,22 @@ port@2 {
 
 					reg = <2>;
 
+					vin11isp0: endpoint@0 {
+						reg = <0>;
+					};
+
 					vin11isp1: endpoint@1 {
 						reg = <1>;
 						remote-endpoint = <&isp1vin11>;
 					};
+
+					vin11isp2: endpoint@2 {
+						reg = <2>;
+					};
+
+					vin11isp3: endpoint@3 {
+						reg = <3>;
+					};
 				};
 			};
 		};
@@ -1708,10 +1852,22 @@ port@2 {
 
 					reg = <2>;
 
+					vin12isp0: endpoint@0 {
+						reg = <0>;
+					};
+
 					vin12isp1: endpoint@1 {
 						reg = <1>;
 						remote-endpoint = <&isp1vin12>;
 					};
+
+					vin12isp2: endpoint@2 {
+						reg = <2>;
+					};
+
+					vin12isp3: endpoint@3 {
+						reg = <3>;
+					};
 				};
 			};
 		};
@@ -1737,10 +1893,22 @@ port@2 {
 
 					reg = <2>;
 
+					vin13isp0: endpoint@0 {
+						reg = <0>;
+					};
+
 					vin13isp1: endpoint@1 {
 						reg = <1>;
 						remote-endpoint = <&isp1vin13>;
 					};
+
+					vin13isp2: endpoint@2 {
+						reg = <2>;
+					};
+
+					vin13isp3: endpoint@3 {
+						reg = <3>;
+					};
 				};
 			};
 		};
@@ -1766,10 +1934,22 @@ port@2 {
 
 					reg = <2>;
 
+					vin14isp0: endpoint@0 {
+						reg = <0>;
+					};
+
 					vin14isp1: endpoint@1 {
 						reg = <1>;
 						remote-endpoint = <&isp1vin14>;
 					};
+
+					vin14isp2: endpoint@2 {
+						reg = <2>;
+					};
+
+					vin14isp3: endpoint@3 {
+						reg = <3>;
+					};
 				};
 			};
 		};
@@ -1795,10 +1975,22 @@ port@2 {
 
 					reg = <2>;
 
+					vin15isp0: endpoint@0 {
+						reg = <0>;
+					};
+
 					vin15isp1: endpoint@1 {
 						reg = <1>;
 						remote-endpoint = <&isp1vin15>;
 					};
+
+					vin15isp2: endpoint@2 {
+						reg = <2>;
+					};
+
+					vin15isp3: endpoint@3 {
+						reg = <3>;
+					};
 				};
 			};
 		};
@@ -2251,6 +2443,10 @@ isp0csi40: endpoint@0 {
 						reg = <0>;
 						remote-endpoint = <&csi40isp0>;
 					};
+
+					isp0csi41: endpoint@1 {
+						reg = <1>;
+					};
 				};
 
 				port@1 {
@@ -2331,6 +2527,10 @@ port@0 {
 
 					reg = <0>;
 
+					isp1csi40: endpoint@0 {
+						reg = <0>;
+					};
+
 					isp1csi41: endpoint@1 {
 						reg = <1>;
 						remote-endpoint = <&csi41isp1>;
-- 
2.46.2


