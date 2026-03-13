Return-Path: <linux-renesas-soc+bounces-29364-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAP6NHQ+tGnZjgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29364-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 17:42:28 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D132874AE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 17:42:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA5E630D5444
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 16:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0AF3C8708;
	Fri, 13 Mar 2026 16:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="AgFDCy54";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="oN6uE6rp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5994F3C345B;
	Fri, 13 Mar 2026 16:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773420031; cv=none; b=Y+6/SHj6meSTB8A3Ww9ue5MJgKFS5O2O9G5fMjDVezj4E+gBiZowVoeOJrgZ+q+Hjl7lxkvVLGAy2ODtl4ir23pbbT7sGUiSn59F6tjnUJtU3ovIgV7M9qqjat2sA13cFrYjax3KNFgiHIdYljG8l5ilepll7as6Wkj1wU0MvRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773420031; c=relaxed/simple;
	bh=kwHR+/PCo0jYgmxjqz1g9U+iGYBH8RwBn9Yp4JfCsNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NX/l7ywdaLi4jjSznt4aFJjpEac/WHAWL46UJP3+4W3mFqVXgvUZlC5ipA5BnuTWNwGuBPbLBGWXQmtAfsb/rV3SATNPcyGelmdNztJO1ofeSM4ygbSMe4AMyGWvcykPjzvr7x+eBcXb0DZrifVRixTnGLayVDMctcX7Ra+nlQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=AgFDCy54; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=oN6uE6rp; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fXVbH2qZmz9v0n;
	Fri, 13 Mar 2026 17:40:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773420027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z453Tyol3L3VETEDAmcm0JWJt+RA5s/ri+ONurGIO58=;
	b=AgFDCy54oGUGzqZ8449HAYFL0KLu9wBNvp3uNlkcghl88zk3tAepZU6+w5gWnHx1cgBHtC
	g5KfF7HuQn5kBVEP7nXikx47jERKvpYL6JTA+HFub8mPaQPU3ux7izh0eAGVK9hYj9HHVT
	9m+E7go//kFhNi6g2Etb0j4rJfhUn0rEHbIGFMTt4hhuzfpDd/r3PW+3W6hUjpAJxM978P
	N7rwuAtUA1+wgPxBi4/BfN4ffVlZsC5SILhFqQsAcoUE9Bt0MJaNIWDFQsf4daFveMDZAz
	nDNwTizuVTi/6y9kDfuB+TJniBNZA79lIGZrIB+jLCLREQNO6WdvZrloeMhkVQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773420025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z453Tyol3L3VETEDAmcm0JWJt+RA5s/ri+ONurGIO58=;
	b=oN6uE6rpVwQSD3CXY9VPs9g1dXRZW+HYLEAAP8F/KrQcHXP3c6i7nqv7z/+IgzWvcDO9Li
	Nr8lTgEgLE6khKU6BCrS5cPEZ9/7nk9FqlU6jD7/8YO6Qzebd2S6rneP1j9hS2qSE0PUDt
	RfiDR80tCT947i9Y5gv4xojp4x9IDeYaGrZLTrmWqZecBgRCKpw+YW655mprn5KtKThr3W
	w9tI1U+FGlr/uBmoV0jgjLwtGyBv2LUHKktpl4d+h74/ufDTWiLYopATz5DLqwTMl4pn+R
	Ig/UyMCjqzxcI4VTp2AqneK8wzyb46B48LRMJbt/jCFz2U/o5aRoYb01udxjyg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/4] arm64: dts: renesas: Drop RTL8211E PHY C22 compatible string
Date: Fri, 13 Mar 2026 17:39:03 +0100
Message-ID: <20260313164008.40933-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org>
References: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 6yg744pxjru14qnneqync5m7ybf8qkxf
X-MBO-RS-ID: 3d426e35b99a79129b8
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29364-lists,linux-renesas-soc=lfdr.de,renesas];
	FREEMAIL_CC(0.00)[mailbox.org,bp.renesas.com,kernel.org,glider.be,gmail.com,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:dkim,mailbox.org:email,mailbox.org:mid,renesas.com:email,0.0.0.0:email,glider.be:email]
X-Rspamd-Queue-Id: 40D132874AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Realtek RTL8211E PHY schema indicates that compatible string
"ethernet-phy-id001c.c915" must not be followed by any other
compatible string. Drop trailing "ethernet-phy-ieee802.3-c22"
to match the schema.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/cat875.dtsi         | 3 +--
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/cat875.dtsi b/arch/arm64/boot/dts/renesas/cat875.dtsi
index 191b051ecfd45..5815e9d2d8a93 100644
--- a/arch/arm64/boot/dts/renesas/cat875.dtsi
+++ b/arch/arm64/boot/dts/renesas/cat875.dtsi
@@ -22,8 +22,7 @@ &avb {
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
-		compatible = "ethernet-phy-id001c.c915",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id001c.c915";
 		reg = <0>;
 		interrupts-extended = <&gpio2 21 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
index 4113710d55226..83b6c04274ac9 100644
--- a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
@@ -24,8 +24,7 @@ &avb {
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
-		compatible = "ethernet-phy-id001c.c915",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id001c.c915";
 		reg = <0>;
 		interrupts-extended = <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
-- 
2.51.0


