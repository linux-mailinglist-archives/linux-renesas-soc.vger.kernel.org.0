Return-Path: <linux-renesas-soc+bounces-33808-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oD09KDg9KWpNSwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33808-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 12:32:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E96886684C6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 12:32:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=hv9i8t5J;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="X/ft0gLo";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33808-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33808-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B9DC307373E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 10:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E523EEAD7;
	Wed, 10 Jun 2026 10:25:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2123DB30F;
	Wed, 10 Jun 2026 10:25:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781087148; cv=none; b=aL0HMbqiSe9udWZ5r3MXAsJyRpap7PsJbfj2aKVT81faUPFqjipU77JCLVMYgOuoGZhMZQfJi8zmx+d8m0r3w4V7183CHQL+cHgHj7lEanXpp4CkgwD0MUwi+/9JWUVCJr/2lM4V1emKVIxjYpIolmUTHpSbKmWus+NixxQvjHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781087148; c=relaxed/simple;
	bh=nnu5y6YvOIIbuYcYRqMgqjMRpGk0Lmy29mPmaH6wfh0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=A6vpCWqfTg7rdfj+7fYYOzasD9UOLTjx1ED0AkYeIvpWeGyiX35t2P4K1SzYV+97u1PMCXzMPrYrW/FKUV9k+Vqfs4Dfxq58Mbk8ZwT2a5AJu4RPjS1mAvhNy58sjkaLneJR8V/StK7ebi8jkxrKylzuxgHTxWEyeixVoNrPHcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=hv9i8t5J; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=X/ft0gLo; arc=none smtp.client-ip=202.12.124.145
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.stl.internal (Postfix) with ESMTP id 986921D0015E;
	Wed, 10 Jun 2026 06:25:44 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Wed, 10 Jun 2026 06:25:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1781087144; x=1781173544; bh=t7
	EgACiwMXPrgdnvARu9mX1mO8EGyge6ZpUp7AcO8QI=; b=hv9i8t5Jqx460Lz9hl
	Voyy9vCQ3BL2kY2RaC5yNInIzFhcxG7ZG5fjtvRhRNxnHXUlnxGLa2j2iw5XKj6k
	AHdwfuZcT9Ji2FJqewlUNN4nRrHgqLp8OsfgO1hdTa/irXvchhquq6j6QIvcWce1
	YKJno9fegfTr2Y3E/LLPOUpPyQXFYJWRZk6PZpKFyCzDz1Z1iOsTWmvRiI3E3Kh4
	nmMBEd44StUjyvmFd7yma4usPrtLlp5y0qe2j5lCiUHwQi4ClQv3CnROwmMvPi0O
	yynUGLCgoyel62ui9aDiHXSnfdVuZ0scoCs6an4wVGNGsALufDqOT7/ehZkfUPjy
	mVUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1781087144; x=1781173544; bh=t7EgACiwMXPrgdnvARu9mX1mO8EG
	yge6ZpUp7AcO8QI=; b=X/ft0gLo0qFqNFel1nBrWr2IRBogVSzLE1NMUVzc/Mie
	yjCacOt6BR2gosXglD1m0j36oD0TAMhoRl9Ep5IICDIiHTaDmWlHNloSpJz6DBsm
	/ts4Jri4U0lp7VA8RNIEECMc99qHmmvHbK65+EN5kPGZYrG7qgllQBozF7GW27tG
	8crCYhCgaE2Zv5N3YaNYFcpOnEomhvXQrW2kuZwGnU6LU9vPskUNDa4IzJ8kWUCX
	N3Fg38Ntnl4csoHla5w0h3T5pwL1H5jZcJPLE6Jo4qqbltyqUW72ccF30awlOQS6
	HgSAeS+BeypeFU9pn7uj0ntUxN+49APNiGAqHfWFPg==
X-ME-Sender: <xms:pzspammFYdVDAC6chwm2whQHNcfglere6tjBwFiHXUdpbGmeLOO_pw>
    <xme:pzspajVDzc1zTjCF9tNS2wwbbab3-Z-YWsm2i2ppDqRqe9sVzKHaplOLtSjkTsvhl
    1FBBsMv2AG-9Nu7XRZ2FDWSzqzmnzXNS5J2-LbEM_Y139uCN2fa1yc>
X-ME-Received: <xmr:pzspas_SvVc3-_-lGZ5X-7Jzq183gSbSprvpqFndu2VmuGu5xOrcDivk1Rqw7d_DRyNLDuw9f1Uot62gPGzG18XksMDSy2UsSJl1>
X-ME-Proxy-Cause: dmFkZTETd21Tfpz7nQSr4dvrlxw9MjshlnUPxHu7fmtPDLYd220IGmfOSbXblfSCiHDVHx
    FJgVztLtcbFM3jiU+38dOg0kJLYjrQUTWjXOnh4hjHloELkueSbKDe1/KLPKu8Tj1UE7M8
    hx17ShFKa4BYfxGONo3mK/iO0gaFbtEj4a2rDXJ3wzrcY19+4G2uwVDjoTqxtITb5E5Szg
    ZykOXjmQTEd5tzkvtctjnbO5GmF2fKQZJAP4H6YYODuJsigj2eGgjMa6Jdpze9SXu4+okJ
    eMWDw9cF7ASyzqmuS+jb8kKx6xvQFyw/DK60unsVqQbqAb7e6KnK70CceuEKGnz83991ch
    EtdmXFiGiK7bDEcuRv2dr/ltx5xKL7hugDHM+5aib0wCAhS3QJ+7faLQ8igGNdfoN81H3t
    7CaqUMDquREij25DYQ1z42ETPaoPQf7euKHIXPiQ86hjN27LYEFXcim+PLym0nl4J41JE5
    QEaT5rlvzjWx/+PUo6lTcQvXR0Ij4js+vIkz3eiL5PnuHulK2KIdcUt/jJY5jlnnD9dSD1
    2dPxbfs3Ofz5WXVi1/lkeYekTmxoKwtf0fDGG6Nrx0idy1Sn71EjkBvw1pmVJLTlEAN3IK
    1qx14ZrB6o858K1cr+B9gk4bsa2gAZrmR/7AX7khDyXaUbpi7M5p9vWxMerQ
X-ME-Proxy: <xmx:pzspaop7w1vnjTsSBxa5TqFMqZmH3A3eLdu8a66bPVfssQyj7NzytA>
    <xmx:pzspamlMaEZXncH0WUrbMjSKir8Ml1MWWiqJ5Kn6EDAK3iDxeSNDXA>
    <xmx:pzspakbogEP6nWRSBfrx1pHl_5Yy6a2H9jO4L040BXt3fSrpE3a_Jg>
    <xmx:pzspamUn_XcptsdM1PBBC_Mc0L2zyBnrqBqlQwT8ThKY9xw5g3S5kQ>
    <xmx:qDspavLhU5lIkZLkdNA6u6nkOkJQh3RZwGXadnDswTth9tH1XYgylQIV>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Jun 2026 06:25:42 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Paul Barker <paul@pbarker.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next 0/9] ravb: Add gPTP support for Gen4
Date: Wed, 10 Jun 2026 12:24:23 +0200
Message-ID: <20260610102432.3538432-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33808-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[pbarker.dev,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,glider.be,vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:paul@pbarker.dev,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:sergei.shtylyov@gmail.com,m:netdev@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:sergeishtylyov@gmail.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,messagingengine.com:dkim,ragnatech.se:dkim,ragnatech.se:mid,ragnatech.se:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E96886684C6

Hello,

This series is the second part cleaning up how PTP timer support is
implemented on R-Car Gen4. Currently there is partial support for it in 
some of the Ethernet devices that can use it, but not all.

On Gen2 and Gen3 each RAVB instance have it's own private PTP clock as 
part of the RAVB register space. For this reason the PTP functionally 
was implemented directly in the RAVB driver. For Gen4 however there is a 
system-wide PTP clock shared by all RAVB instances, and on some Gen4 
platforms with other Ethernet devices.

The RAVB Gen4 driver currently advertise PTP support to user-space, but 
the support is in fact completely broken. It tries to use RAVB private 
PTP clock, which do not exist on Gen4.

Further more the PTP clock behaved slightly different on Gen2 and Gen3.  
These decencies have been handled by adding platform specific flags 
inside the driver.

The usage of these flags have grown organically and been extended all 
over the driver as it gained new features. Adding a new third set of 
flags for Gen4 would be messy and add to the confusion.

Therefore patches 1/9 thru 7/9 refactors the usage of the PTP flags into 
optional callbacks and untangles the usage. This allows adding Gen4 
support easy as it can just implement it's own set of Gen4 specific 
callbacks without altering the driver logic.

Patch 8/9 is a small DT binding addition adding an optional phandle to 
link a RAVB device to the external PTP clock. Ideally this property 
should be mandatory, but for backward comp ability is is made optional.  
If the phandle is not set, or the PTP clock not enabled, the RAVB driver 
will continue to faction as before, but no longer advertise PTP support 
to user space.

Finally patch 9/9 adds the Gen4 specific PTP callbacks which allows the 
driver to use the external PTP clock.

For part one of this work see [1]. The two series are independent of 
each other but both are needed before a third series liking the RAVB to 
the PTP clock in the platforms device tree. I will hold posting the 
third series until all dependencies are merged. For this reason there is 
no user of the new renesas,gptp device tree property added in this 
series.

The work is tested on both Gen3 and Gen4 R-Car devices (with [1] and 
appropriate DTS). I do however not have access to any Gen2 device where 
the RAVB IP is wired to a MAC, so the small rework of the flags for Gen2 
to callbacks have only been compiled tested. If anybody have a RZ device 
where RAVB is wired and uses the Gen2 method of starting/stopping the 
PTP timer together with the DMAC please test this.

1.  https://lore.kernel.org/all/20260609215711.2960150-1-niklas.soderlund+renesas@ragnatech.se/

Niklas Söderlund (9):
  net: ethernet: ravb: Remove gPTP control from WoL setup and restore
  net: ethernet: ravb: Move programming of gPTP timer interval
  net: ethernet: ravb: Simplify gPTP start and stop
  net: ethernet: ravb: Remove redundant argument to ravb_ptp_init()
  net: ethernet: ravb: Replace gPTP flags with callbacks
  net: ethernet: ravb: Add callback for gPTP probe
  net: ethernet: ravb: Add callback for gPTP clock index
  dt-bindings: net: renesas,etheravb: Add optional gPTP phandle for Gen4
  net: ethernet: ravb: Add gPTP support for Gen4

 .../bindings/net/renesas,etheravb.yaml        |  16 ++
 drivers/net/ethernet/renesas/ravb.h           |  34 ++-
 drivers/net/ethernet/renesas/ravb_main.c      | 246 ++++++++++++------
 drivers/net/ethernet/renesas/ravb_ptp.c       |  15 +-
 4 files changed, 219 insertions(+), 92 deletions(-)

-- 
2.54.0


