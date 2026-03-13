Return-Path: <linux-renesas-soc+bounces-29365-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKGgMws+tGmKjgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29365-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 17:40:43 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 780BF2873C7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 17:40:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DDF493000B0C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 16:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E34BE3C73F8;
	Fri, 13 Mar 2026 16:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="BauD8D3R";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="r57eZVFS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECCD3C3BE8;
	Fri, 13 Mar 2026 16:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773420040; cv=none; b=hzu2khg3sCWXS/EuYt2YFMPukstbIj1sHvpxs94pP//kaFM7l8yyFoe/qO0iIceuJUZ6Dk92SKncChMa5ZheFQ7WAvzMTO36RgxRfGRt03L/F6GXhgkQqeBOpVV6YWwYCSnYN5PMQyXSVenJY50BuPElbst1Nl/NDeWA3W0SHB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773420040; c=relaxed/simple;
	bh=hTixtc9QwoELI8KUgt30bl3C8gXlaNXSEzdXPWhnEGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QqFZrqL3/zwF0TfUHd5MKW/Y4L4IHnpYQlSkxAYPzXLz6G0yFvjjetauGG0KStPkMYOWWI5SZ1ps2RTntb+s8sxVwXGnDRJYo8wFabYuhjv8LP8euvb+6C6TUyy/qeVr8L/r+TPqAiaXgIAkYvsEqbDEsjrxgzbmDLIRLaI2jyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=BauD8D3R; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=r57eZVFS; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fXVbL59npz9twv;
	Fri, 13 Mar 2026 17:40:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773420030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NiKj1Ae1Nq30oWJYukoJ9UQDHdKLGJRPFU6TG2WIN9k=;
	b=BauD8D3RH7U+Zvn5Bg3Kgot0+k9/2eZ7Y1YX0DLKx5Os5AZx0DTsM5WAj1ogzRwrvNfZEe
	NAJft0r6+drWeRGM6lFarE3KZI1mMcMI8ODskPVIliZ8KwW84fkAxZvFf+Ng4pPU0wahiN
	AyhD8/r3JCdJixI05572ZShuwa9+zP3rO+v0SbTBWDadByIK0cCYaZ4u2hiVmsVMIYb4QM
	LlJZUwOKrCRWOhf7SxzhLX434zirBxmcixsWQaKuNawPISN0FfgYet3Nz/++1SupnTgss+
	UEDZBipuRK2ijXmCge28ieySo2b7FjoqXQWHGarv6qSyJzqO82IgRqYHkDHZAQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=r57eZVFS;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773420028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NiKj1Ae1Nq30oWJYukoJ9UQDHdKLGJRPFU6TG2WIN9k=;
	b=r57eZVFSA8SyI9M2/6ocb0l12cqrywsHrjT4gKvRVUuPwhJsfflFCN6pdUH30wK7t0ZSPs
	5aOK0oP5fsR2HHLvYzoPGvBGB7f6ww9xVrJfP67WacNAc83HKfHNZLuYbXHn4+p/T2wxJ2
	e56v9CGAKfMLMjyN7cQCG9fI6tG+34slHrDPKrkCuz+yMENKfRNCB1ck2FKMcu3kbzidpi
	Jc/F2FJ7uFGbAW0Uu3jnMqzAjmlYTDJ7p/LLQ3W53DeQZoGCfwX+6CavwiQdH0vXozW9Z0
	VVE4AN9kx8bVflreD8gz/ag/3B9itLBz/EiHZZ/s4AI7kVRoSHRCoSwYTp94Aw==
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
Subject: [PATCH 2/4] arm64: dts: renesas: Drop RTL8211F PHY C22 compatible string
Date: Fri, 13 Mar 2026 17:39:04 +0100
Message-ID: <20260313164008.40933-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org>
References: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 20084bdbc68b0394571
X-MBO-RS-META: bwrdb1zj9q7o9fojgjnb8p4buuew8dq6
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29365-lists,linux-renesas-soc=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.0:email,mailbox.org:dkim,mailbox.org:email,mailbox.org:mid]
X-Rspamd-Queue-Id: 780BF2873C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Realtek RTL8211F PHY schema indicates that compatible string
"ethernet-phy-id001c.c916" must not be followed by any other
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
 arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts b/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
index 39fe3f94991e3..07147743de93f 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
@@ -100,8 +100,7 @@ &avb {
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
-		compatible = "ethernet-phy-id001c.c916",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id001c.c916";
 		reg = <0>;
 	};
 };
-- 
2.51.0


