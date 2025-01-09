Return-Path: <linux-renesas-soc+bounces-11987-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAC6A0762C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 13:55:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B50EC188A4B9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 12:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C08E217F4E;
	Thu,  9 Jan 2025 12:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="I2yMmaSX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="o/YeVIaq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC72215074;
	Thu,  9 Jan 2025 12:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736427302; cv=none; b=DsIE5i4DQURZDXeGqWCFKfHp8lLdKCI/aXQZqt8CvGDsFG2ALchTPQhW37+RbcCRc7LWclMxKPsp/3W7tJpzyjuHPvzjoMPq06nHvZNF9ItmCN4W1/t62d3V7mJ4Ua0qVpCPbZAzMq17vD9+WkEPQdZrpaM0XGhuTipKNDGfvH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736427302; c=relaxed/simple;
	bh=nps2hoRl0pa/VeSfgD42qrozPiuXAg1MckvmVcKdX9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q727PqAKUGseskKsw299fVbaiwQlgS2+tBuhCbexcaPSzk78JMEx7808E4qj/oBvyONwpCKKoUr0T2EDe0ZhkqlNKK2IeYCk4HjuZzWYaphzpHR4VsBuvdzFcvxJBGlQwPb3gpGBEAxY5914HERYBsEdGYnO88CnC5Iklu4Hgg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=I2yMmaSX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=o/YeVIaq; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id 64043114012E;
	Thu,  9 Jan 2025 07:54:58 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Thu, 09 Jan 2025 07:54:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1736427298;
	 x=1736513698; bh=7STQIuSVqlL24UCoGKMYJMltwMQgdJU79RaF5eiUwpw=; b=
	I2yMmaSX8kiyIVHCp2olLRMr0I+apl2A/vcOrxgASqM3WyuC5plB2L0Q/OemMe7a
	bdmmYXak5JAht2VtQJ3Y5T/NJpcpWjM0OMOT+eG7mTrXK5yBfmrSjFg7zSrAJbFe
	meKLAqLOOZvtHcI4MjBrW9pxoznDWv2VTmF35XytzXBNsCibVDUvpUrLfChEhR7K
	hsdIZdmNPym3/GpxSofb0BP8O3WyhelYZXMW6VGJpWltpeMn4eSLHkI0ccr4HaC5
	bysdjL9u9rJXv5+gNNf5+3cwTmYBQY6bdH2gUWK0gnFotRt0zxyDcRkfUSZ1sJ90
	oHgpWg3EiuEqTbwU+mJ6Zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736427298; x=
	1736513698; bh=7STQIuSVqlL24UCoGKMYJMltwMQgdJU79RaF5eiUwpw=; b=o
	/YeVIaqUCj/akstczA6kJflLIBduTmnlF1XL0Gc7BcXlCbCmrRQRLD8ddJQTRCjU
	8Jm5Ygbtgve0EBvyF2aIdrNW+xcQZjdzfGUULFRdOZKotPpqBpI7Slu7tFuKLQ9O
	cYoQIY76FG0S1BsdalurV6Neg1bfCODXOJBaSrF57o4NUwJlxUrM+99ZB3BQ8Z/2
	vMLrJjYXqWVLrQaEsV3nMVAjLpct3bSI7Bh3g3CJTnbwIdB8cLrvGmXNj3PCF74X
	a/y+i86SQ0YKDX2laoC6jef29MMaSTiby1RppmCUKR23xV4QcnYE3w7tFNmjy5TP
	7zE4zImdJUu/dzk8vaZog==
X-ME-Sender: <xms:Isd_Z6mXdy8w_fFlN1JFh_0rJlfbwjfYOsptpCAs0agVKbbgAtGg8w>
    <xme:Isd_Zx2F700P2x2nJt01Coz2eINlr2jAtz-Mr_iQ9mOYF1g_3kPQTVTaKHrOwl_Go
    x_VhVV-5TkAI2Xujsw>
X-ME-Received: <xmr:Isd_Z4oTsDQSX55fuGIvkaYdCGkPcrcGr8OEoIHL6uiNHIHFHmOjqGQHTl5aG-bIkPJI_tQ2EWMZ3v27mNgjxtTa5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegiedggeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghsucfunpguvghr
    lhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnh
    grthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdefhfehgeekvedt
    leeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghg
    nhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphht
    thhopehjrggtohhpohdrmhhonhguihdorhgvnhgvshgrshesihguvggrshhonhgsohgrrh
    gurdgtohhmpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnugdo
    rhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:Isd_Z-m5oZRZ0kWyHQBFW6K3KZ_yqGNMxdxrXiBscbobR1P4h6baWw>
    <xmx:Isd_Z41C80Jd2WaKPcOni5hbGZbaH9gJAX_YyLOBNrL9XMn4-7ORiA>
    <xmx:Isd_Z1ugQDBFH3TgC50dvjcOe4qocLERxuzVKQo4HjgUnPb0LGAHKg>
    <xmx:Isd_Z0WaF8zQLBKuOs_pOYRY6tUegWMipKesclhCmp9l4IZ41yvdGA>
    <xmx:Isd_Z89WkXYjakN5jVA1Rsf7CtoMaZJ806MYcmi2Kp8wsArSBN3Kim1a>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Jan 2025 07:54:57 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] arm64: dts: renesas: r8a779a0: Add FCPVX instances
Date: Thu,  9 Jan 2025 13:54:32 +0100
Message-ID: <20250109125433.2402045-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250109125433.2402045-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250109125433.2402045-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add device nodes for the FCPVX instances on R-Car V3U.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 36 +++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index fe6d97859e4a..4ec14e4869e9 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -2890,6 +2890,42 @@ port@1 {
 			};
 		};
 
+		fcpvx0: fcp@fedb0000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfedb0000 0 0x200>;
+			clocks = <&cpg CPG_MOD 1100>;
+			power-domains = <&sysc R8A779A0_PD_A3ISP01>;
+			resets = <&cpg 1100>;
+			iommus = <&ipmmu_vi1 24>;
+		};
+
+		fcpvx1: fcp@fedb8000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfedb8000 0 0x200>;
+			clocks = <&cpg CPG_MOD 1101>;
+			power-domains = <&sysc R8A779A0_PD_A3ISP01>;
+			resets = <&cpg 1101>;
+			iommus = <&ipmmu_vi1 25>;
+		};
+
+		fcpvx2: fcp@fedc0000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfedc0000 0 0x200>;
+			clocks = <&cpg CPG_MOD 1102>;
+			power-domains = <&sysc R8A779A0_PD_A3ISP23>;
+			resets = <&cpg 1102>;
+			iommus = <&ipmmu_vi1 26>;
+		};
+
+		fcpvx3: fcp@fedc8000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfedc8000 0 0x200>;
+			clocks = <&cpg CPG_MOD 1103>;
+			power-domains = <&sysc R8A779A0_PD_A3ISP23>;
+			resets = <&cpg 1103>;
+			iommus = <&ipmmu_vi1 27>;
+		};
+
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
-- 
2.47.1


