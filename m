Return-Path: <linux-renesas-soc+bounces-6018-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 802CF9028F2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 21:02:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04E382836E0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 19:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C11E78C64;
	Mon, 10 Jun 2024 19:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="iGcHg+nH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZXqEwEmL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E7D14E2EC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jun 2024 19:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718046149; cv=none; b=MMsL9MB9TQoSpNY9W3c54d+25JIdK/5gx8G3M8HQ/pF2/9NsjS52JsyIKj7psc9TkxMCd3aYKAp0LLhBuMuwF7XU46VqwAENIvJV905sfbayVo8OMGDgIU4Aupgxf2/gPtEHvduQ9+WAkBdbsTJCK6yrJNUdtvEcipo4J2kNX7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718046149; c=relaxed/simple;
	bh=wuVJuRvxSSbN0SdtnaPVQL5fD85ACA4F2O1rIYzCGxg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UWsm+hTwcjPGnl6CQKi4RLg7thNJlkNnPdhjf6z4o4SYpCy9AG4Ehqx4pPjDRQe7ZmYVJ22PHo0XxAPObprpd2bZA+qMv2X0/J/H1x4VMGQLamcEpYY2NaSJqW9yXtN17g9ITf4qAnIVrM2giEgovLjlpK1gBc6ihJ+T+8DUqNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=iGcHg+nH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZXqEwEmL; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 89A8413800FA;
	Mon, 10 Jun 2024 15:02:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 10 Jun 2024 15:02:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1718046143; x=1718132543; bh=m6
	M78t2ki6h7nfbSgMh4qJj8WNHgNNzzf7bRMtqwCx4=; b=iGcHg+nHOnAvPAlXjk
	tbv7CJvIzrcyKYEIedVxOFkY17NIr3p7tMRYhGM+nl5Ub+oh6KO7U00VvPUEJCTN
	cWcA/PMa17HXtPPU7ZZLIHPY1gcxh/p2ptkEpBVUQOhjelEVGfDk5FWfmJGR4caU
	6FzzWU2IId02ArarCrfPXfqYZ7rA/+NSwSbXu06oGzlGxmcIFluh1pp1Us5FdUNv
	anvFYWjFheF6NHZsZmlr5wuRo8yzNJ+nGa6KF1mSrKNzDUlj8AHzwIU9CF3egLL8
	4vitpHQ9XUunD+uOS+wON5reiMkbVUjqQKq4Zruy5WWP8ViKM+Fz5rSHFK8abotU
	WPDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1718046143; x=1718132543; bh=m6M78t2ki6h7n
	fbSgMh4qJj8WNHgNNzzf7bRMtqwCx4=; b=ZXqEwEmL6huNgd1A+HcIwbYyaUQJh
	/R1cyBuplxF1tU3A+DxlQPza40timg2QWUgKskF3l5x/hc0+3bMP0/SdYwF4hu3E
	bFMRi8MAKlSQvUrKRPxDr3NV+9H/aiBfrHioeDUH44SVd4iCmZYWAcJkQHvywwVR
	uJ9jZ5MAZo9LdFpnTOk2nk4dlA4r2u605yXwnoOn7IWXPRFdYPgNc8eGyIkwkkKT
	pWxq9TkEH2F4yEdmbF1+jb7YywAmCgA3LAJf/+WGMLJZzi0WHpIh7mihuNdyzyN2
	U7TECHk7v2iXm7+k9EDBoYxTW2BhvGSXMkUQGRHjbGVQVn9dT8S4S9hjA==
X-ME-Sender: <xms:vk1nZhdqBJi32kgWjHriFVM0zQCDxHxCrC1KwRGcFvZwo-NDWXbZUw>
    <xme:vk1nZvPxW7gmnoyV2y9Cz79lsnjrlCwr2Wbo7EZnvP8MUfE_UQNCf2sxhmIYNesaQ
    2TpLEPR0e59V2bieUY>
X-ME-Received: <xmr:vk1nZqiu6tdB_qBPH876u-SQuV2v9HcJ8UzbtOd-qbipdW4ghWFICIo6u8Dcf3HqBCcxTkWdM094ScakaI5XJx_sK2LkESO-9Tu->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedutddgudeftdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheppfhikhhl
    rghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvg
    hsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheduleetteek
    gffffedufeeuvdejiedvkefhveeifeegffehledtvdevhfefteegnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghr
    lhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:vk1nZq-5mr8_JA9iH9L5ItuKenQNJRRdc49tOW-4jjUTDUOC4nbrIg>
    <xmx:vk1nZtsNTMNz1y2KnaFxaQm1CT2XiZtKo5d3lQCnMj-x5eH0lFMnWw>
    <xmx:vk1nZpFEn6wcltEssLgPIqQM272jXRqFFEYQfT6d1AhgRnZiFY615A>
    <xmx:vk1nZkMJtP1edYV1C3IE3i5tELI_2s1u_S7a4mKaEefFUBioAWtopA>
    <xmx:v01nZnJdls5JmTGvtIwb8oba27dsasr7o_I77UjAH9dMRB9JaHG3_r3h>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Jun 2024 15:02:22 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [RFC] arm64: dts: renesas: r8a779g0: Fix graph_child_address warnings from capture pipeline
Date: Mon, 10 Jun 2024 21:02:14 +0200
Message-ID: <20240610190214.2743210-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.2
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
index 2ee306305d83..84fcd7c50f65 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -1207,6 +1207,18 @@ vin00isp0: endpoint@0 {
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
@@ -1235,6 +1247,18 @@ vin01isp0: endpoint@0 {
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
@@ -1263,6 +1287,18 @@ vin02isp0: endpoint@0 {
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
@@ -1291,6 +1327,18 @@ vin03isp0: endpoint@0 {
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
@@ -1319,6 +1367,18 @@ vin04isp0: endpoint@0 {
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
@@ -1347,6 +1407,18 @@ vin05isp0: endpoint@0 {
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
@@ -1375,6 +1447,18 @@ vin06isp0: endpoint@0 {
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
@@ -1403,6 +1487,18 @@ vin07isp0: endpoint@0 {
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
@@ -1427,10 +1523,22 @@ port@2 {
 
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
@@ -1455,10 +1563,22 @@ port@2 {
 
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
@@ -1483,10 +1603,22 @@ port@2 {
 
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
@@ -1511,10 +1643,22 @@ port@2 {
 
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
@@ -1539,10 +1683,22 @@ port@2 {
 
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
@@ -1567,10 +1723,22 @@ port@2 {
 
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
@@ -1595,10 +1763,22 @@ port@2 {
 
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
@@ -1623,10 +1803,22 @@ port@2 {
 
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
@@ -2083,6 +2275,10 @@ isp0csi40: endpoint@0 {
 						reg = <0>;
 						remote-endpoint = <&csi40isp0>;
 					};
+
+					isp0csi41: endpoint@1 {
+						reg = <1>;
+					};
 				};
 
 				port@1 {
@@ -2162,6 +2358,10 @@ port@0 {
 
 					reg = <0>;
 
+					isp1csi40: endpoint@0 {
+						reg = <0>;
+					};
+
 					isp1csi41: endpoint@1 {
 						reg = <1>;
 						remote-endpoint = <&csi41isp1>;
-- 
2.45.2


