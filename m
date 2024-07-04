Return-Path: <linux-renesas-soc+bounces-7055-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 177C1927A01
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jul 2024 17:27:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4C031F259DA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jul 2024 15:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CFBA1B120C;
	Thu,  4 Jul 2024 15:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="elAgR08I";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bUhEWQmh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4386A1B140F;
	Thu,  4 Jul 2024 15:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720106814; cv=none; b=Thc8kTEEEl+ip6e8L2F5r0AzTH6CS9j8ECzwnMDnEXigaAnOERkl7zR411UMMZ08QERnHTcSbz53CGxyaFDYZAuXhTkcvZeuw8WiGCwiJTgEeLe9hRcAY3e2VTP6PgAek62L+sXtCZru51E62H2gyJpScQ3AD00Ff1xuOaSNSEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720106814; c=relaxed/simple;
	bh=ZhI+Z0tl78bePu22T7RJC5Roxvh6EkLXuVIji3AFZ88=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=McEsl0ew4ZGogluEwVrF23tZ/k7l6ViW1+KEW4oGF3yGWQabXKqivEhBWVplJgd+W/ioG50LkkHd0JYu3FncfjVHamkjCI0SAZkQE46TefGhnUY527bUsAVMtilX5ydq7XXZDoA9UkO1G9iO5M6NKFRMTSRTM8Z6xV2qPYaxQyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=elAgR08I; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bUhEWQmh; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id E4E8813801CD;
	Thu,  4 Jul 2024 11:26:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 04 Jul 2024 11:26:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1720106808; x=1720193208; bh=MK
	A4zZt8xiZ9ffKTIPx9Esc2HF1Qk6W896Fkk5r7czc=; b=elAgR08IZ9CLuYFbOC
	1wLieAqKLxZbrsCguWgXNJi2apuG0+Ubdus2/1Lc+pNtFwlLB7R1aK8xmEmUXzRt
	GdyyVnCwgIuQO60YhE4iVaVGewocLjxfL4CTnIfA+EXQikMtsAzFstkamB2nQ95Y
	tUf+LYZWTsFacan473udQtdpfIHy8uO7aqyK9GCy1B57vLqNcf+ntMQlYECYVumC
	VEUsawH1qS/+xcjIEuGhq9vtjEJ/S5UiA88iJvPtcRJAe2gCWM7IWo24HbMMYqEA
	umHpFQhhFInzWsbOWSv3Cj61vn+7N3Ke8VCoX8fGvktXDj1h8ZbjUlW5zwSM5Kz1
	vtXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1720106808; x=1720193208; bh=MKA4zZt8xiZ9f
	fKTIPx9Esc2HF1Qk6W896Fkk5r7czc=; b=bUhEWQmhgUoau/6CTLRWKWa/1pc9o
	Nqj+2nNNa1Jj/UQNCJnGHHa9wTog89BkqlDmEkXQ9EyOybEVwai9/fO13SDN+z4J
	BuaUaZKrK36M+HhXeElSbFZng9lQxrAi14lS85kGL9rAoW6k+yu2ipaEnH+V0O3G
	j6z5I26G92I26LTCpVO9oY/Egxgp5aJ7KaIJfq/pKI7dDGtQ8Gxm+0I2zaNkLSfR
	m2XFKiHIkAdxdLk4dqvm+xpTIN3DPT3lyRX7009nMbaO4e8+hB9atSHh5jRjw4k7
	i44XxE6oDsSAlKnRO+bkxcz9RJhx33MaRYImK8CQ0yd0odBQnPDxQ/6UA==
X-ME-Sender: <xms:OL-GZp-2fBEHfoSMHIC8w1UQq6FJmo1O3FJUtAN-6odYNzm5PS3RaA>
    <xme:OL-GZtu3tgJkJ6P3qlfyRhgJv0jk1x7BneuZXie6IhFC1fzqX1klnHCjM2sk4snxg
    OLJOyaCLg9Y58acXAY>
X-ME-Received: <xmr:OL-GZnBiP7ACsk879f8Hk_LO4QQH2r2y9eSfVOAEjauXXghf8q-sI_rpiYHqFa66k4tfQATjtChLOgcojxmI2DMIrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudelgdekiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheduleetteekgfff
    fedufeeuvdejiedvkefhveeifeegffehledtvdevhfefteegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:OL-GZtf1kCGiSteGzaac3trf1ROJWayaKpMMt_CQ3PW-uRyj-7C73A>
    <xmx:OL-GZuOaD9iiDUarB-XtEhwiMjSrwMEYN-6m4c6fcraPPID1kIyv5A>
    <xmx:OL-GZvmA9yc1lkdI8aaleavMMQsrLuSkvi389d_UnBsYy2rCM6CMAg>
    <xmx:OL-GZosxa6iUWELucEIWz7f8EZwfLANKbPwNIl-6_6InIKq4YQue0g>
    <xmx:OL-GZvjGSxFK7qPXe7aaCh267Qlku1jdPfmVOmQmMumpq65PY5f5Zjf0>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Jul 2024 11:26:47 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] arm64: dts: renesas: white-hawk-cpu: Move avb0 reset gpio to mdio node
Date: Thu,  4 Jul 2024 17:26:10 +0200
Message-ID: <20240704152610.1345709-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When creating a dedicated mdio node to describe the bus the gpio reset
property was erroneously left in the phy node. The reason for adding
mdio nodes on WhiteHawk was to ensure the PHYs where reset before they
were probed, keeping the property in the phy node prevented this.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Fixes: 54bf0c27380b ("arm64: dts: renesas: r8a779g0: Use MDIO node for all AVB devices")
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
index 80496fb3d476..4f0230327868 100644
--- a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
@@ -156,6 +156,8 @@ mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		reset-gpios = <&gpio7 10 GPIO_ACTIVE_LOW>;
+
 		avb0_phy: ethernet-phy@0 {
 			compatible = "ethernet-phy-id0022.1622",
 				     "ethernet-phy-ieee802.3-c22";
@@ -163,7 +165,6 @@ avb0_phy: ethernet-phy@0 {
 			reg = <0>;
 			interrupt-parent = <&gpio7>;
 			interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
-			reset-gpios = <&gpio7 10 GPIO_ACTIVE_LOW>;
 		};
 	};
 };
-- 
2.45.2


