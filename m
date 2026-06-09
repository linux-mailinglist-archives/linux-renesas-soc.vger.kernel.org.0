Return-Path: <linux-renesas-soc+bounces-33783-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oxcgObKMKGpKGAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33783-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 23:59:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5B5664666
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 23:59:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b="G/IHyqwA";
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b=hV+1mOEi;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33783-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33783-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26B7130037CB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 21:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E953F8ED1;
	Tue,  9 Jun 2026 21:57:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3FC3E44F9;
	Tue,  9 Jun 2026 21:57:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781042252; cv=none; b=QvCs31CfgS3oWWA9VrIw0ORwvueWrHxAX1Wm0IpOShamTqc3PeM7JpNNVdKguiFfHOm45nkUIckqg0ijdynSoDXUPP9ouLlMYD3jJMc9CMwYjdK3NawfqfYvJA/MNgtNvNdU1xUmgqwLclkbRYejQibsTJNS5OM29Ubyz1dylpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781042252; c=relaxed/simple;
	bh=hwwSM6kJG6rkQLF62/ez+ELBtWsCX5X7i8uGiziLkCY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gzpD9LlsfEM7Z+KGMq++8dtFIJB4/K4lh6nno0GDSlMd94+m+EuJ5t8i+Zv437HQTdGHuxXtkU4eBIHdaYkJPheO0aazknIEnM253/A/zCvPy8KjSFjpHxgQcZt9ytsNDv8zCGSTQ90Oln3ug/zMlfrdlPErApPdyv7OVs/Su7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=G/IHyqwA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hV+1mOEi; arc=none smtp.client-ip=103.168.172.156
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1AE54140014A;
	Tue,  9 Jun 2026 17:57:29 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 09 Jun 2026 17:57:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1781042249; x=1781128649; bh=7N
	JcRYGynGNUsc+Srix+tXNQsbR++Uic8gw+V5sqDA8=; b=G/IHyqwAVujgbb1fle
	4iAMofXaRidmiZ2M+83IEDbaSvx20MV/EDRZKW+XpBgxqvPVqy6i5OiE7bykMs1h
	rCWl+nBpVFO/Y9E6kyIgOpdNJo45wdao8T8jROYWvCENSSKwbKYODX/UPxxPcg+4
	w+P0UhBhdJrSdn1VfKKTap5gk7jLwp4PP/E5aRdVHJfurGKtF5Hjs+p2QPDjOLtT
	p2ihqlK6JdqVge6V3/ZVIKeeo0PN9rfZDnnMpXywmnlXdk9ZyAXwenvF0EmL/Na+
	P7fgIXNOqbPU+8O1MX3D6+9r7GKcKTS8A1CbCNfByBR8rzmeL2J0du3idt9CeI6/
	ZPhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1781042249; x=1781128649; bh=7NJcRYGynGNUsc+Srix+tXNQsbR+
	+Uic8gw+V5sqDA8=; b=hV+1mOEief5/UY4sxWQvIIL9k1rDtmMQUyJ4HAr1BnYG
	pasMqzyCf4yYXvb8qu+rFBkLkzCl8nsd5zQhbq734xHd0RWwwGvg/tbBRUjbSGWr
	VLWfRHdvb51RgLyetBzw3a+bT+lXsmygi5M7IF86NmN0YbZCVTRXB19f1HDTTaBI
	1viaIpCee3tFk7SPJvV2k51D4byv5MqMGZwT0sfXhPRIluW+8nP6o37pEg/3VXDB
	PgvqJUsxh1crmrOPw1hYick91uQOtFGZRTz3Iu661wV69ofevEZZdAm2Qxuy///Z
	VBYBgZ4Rei6JzFrxYUH8q8qGKg9bnD7e1AIi71upCQ==
X-ME-Sender: <xms:SIwoah_ltPfOqmfC3FP3s5oLpyDYkgOYCA95RZCu6uDSlcTQc1-ziw>
    <xme:SIwoakOm-fcmeVtNwdqXbg6zd9iy6uC5B7VjmA0wppduAI1QEQDajNxcLHs9HxT1-
    znlWz0Nh9GVgnH7wDg3o3GVh9S8lVAfMSQIKTy2Ffc-SwSs6VuBoAk>
X-ME-Received: <xmr:SIwoal0YbLYH6uZQnuxojKayn26ylWZp1v9mn6QuAF3hOx-0yAPSevfAU7zMWiHhdfGHupdl0XmvQbZ6jHJoecQi5chM1Y40jMe5>
X-ME-Proxy-Cause: dmFkZTFczGZ2fUAwLpkyIBBdTtvK2DUV1w3OFFhwuzbg5UQ4wrKIb78rrjtocURR5Fv3e2
    19Tx9Eaoz8QT4KZc36qXyWkAcYP4Hnhy26F20GXa3YhQsg6XVWjgxnIhwNYZV40bIWYmkF
    ysIawOx41i+1BlZZON/xrWTz70MsCO0SqJXMhLO6AiOqK40eCkJ8zpmMxtpRmT6Yh6VFTn
    li8mj9isqqCwOaf5hV+kCpucnv3C0U2EJy/uNmJjnwxrR6BxbzuUpyW9L6AI1xDvD6cLuN
    1psb/WErSEyl3pJn9ybJIS3BUdYpPMSWUbZMvmI4Q13oqaywppeMb//+PTX9G7/BmrlxEq
    MqUycY5G9ZMWk6pkmRx76TkmMJkNEcSKgfXklQ2NcvABheAZF6g8CvE/PRqtzcgTpYIln7
    ntwcCoiphkCop3DlfZs0pGQkFwkKXP+IbsW5NNpWpp3jXPauRQ7b2gXHtgfwylPhEQv6DH
    /jgntPpN4dw9xZ55pZfsYpJLyf5XrMm1wsO/HdER0kPn/khGhEsof/txbRfYuEcysocfoI
    Fi3hSvD4cU2f10q9iiqloliFCcFeJKPc8vN/uwCD0fdUinkEAdGhEodbJXNQWpPMr+9Qe+
    g575OU7zmbLMkoVAC1sj2XqMWic20ijJNV42HMBIBFP0QqT56gq3NSEIPeDw
X-ME-Proxy: <xmx:SIwoalc5DLdH_AUGuG8BsIyqgvRoyJLqyicbNyIOrjzH8_FIZjyEig>
    <xmx:SIwoaubR6wlKswFNN0bnDz0q3cRZtcNH_dzXJ4_bw8GM1dVHpcmpFw>
    <xmx:SIwoaiWBPUiOOqEMc9nhF-DZ6IA0hWGhEI_kqZcVfKPPn4OGC15E0g>
    <xmx:SIwoapRAAAeyOezs5ScxAskXFyu2KHoWdSzVGsO6CtYTlKidHaYUsQ>
    <xmx:SYwoahaRJZ2mJs2NgjcKh2lyVM5Xu-TffW41kk3xRvsWPSkwa-h5XQ-K>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Jun 2026 17:57:27 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"DavidS. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next 0/3] ptp: Add driver for R-Car Gen4 gPTP timer
Date: Tue,  9 Jun 2026 23:57:08 +0200
Message-ID: <20260609215711.2960150-1-niklas.soderlund+renesas@ragnatech.se>
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
	TAGGED_FROM(0.00)[bounces-33783-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:richardcochran@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:andrew@lunn.ch,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ragnatech.se:dkim,ragnatech.se:mid,ragnatech.se:from_mime,messagingengine.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8C5B5664666

Hello,

This series is the first part cleaning up how PTP timer support is 
implemented on R-Car Gen4. Currently there is partial support for it in 
some of the Ethernet devices that can use it, but not all.

The partial support have been implemented by hacking the gPTP module 
directly into the first Ethernet device driver that used it, RTSN for 
V4H and RSWITCH for S4. This is understandable as earlier R-Car 
generations had a dedicated gPTP timer for each Ethernet device, but on 
Gen4 there is a single system-wide PTP timer shared by all.

The current implementation makes it impossible for other Ethernet 
devices on the platform to use the PTP timer without messing around with 
other Ethernet device drivers.

The effort to clean this up starts with this series which adds the 
system-wide gPTP timer as its own driver and device tree node.

This series will then be followed by work to add proper PTP support to 
the R-Car RAVB Gen4 driver, which currently advertises to user-space it 
supports PTP but which implementation is broken and does not work.

This will in turn be followed by work to the RTSN and RSWITCH drivers 
will be be switched from its current partial support by mapping the gPTP 
address space directly to instead use this driver.

While having both this driver and the "direct accessing of registers by 
the user driver" in operation at the same time works, but it is not 
recommended. It works by chance due to how both the RTSN and RSWITCH 
drivers internal workings.

For this reason this new solution will only be enabled on platforms 
after all user's of the gPTP clock have moved to only use the new 
centralized timer.

For some platforms this is straight forward, such as V4H Sparrow Hawk, 
which only have the RAVB Ethernet interface. This platform currently 
have no users of the PTP timer, but still advertise it supports it. This 
and the soon to be posted RAVB patches solves that.

As the RAVB patches depends on this series the device tree node for the 
gPTP clock is added in this series but will be enabled and linked to 
consumers in the RAVB gPTP series for platforms where it will not 
conflict with RTSN and RSWITCH. And further enabled as more of this is 
cleaned up.

The gPTP driver itself is heavily influence by the existing partial 
support for gPTP in the RTSN and RSWITCH drivers and the Renesas BSP.

Niklas Söderlund (3):
  dt-bindings: ptp: renesas,rcar-gen4-gptp: Add binding for R-Car Gen4
  ptp: Add driver for R-Car Gen4
  arm64: dts: renesas: r8a779g0: Add gPTP node

 .../bindings/ptp/renesas,rcar-gen4-gptp.yaml  |  64 +++++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi     |   9 +
 drivers/ptp/Kconfig                           |  12 +
 drivers/ptp/Makefile                          |   1 +
 drivers/ptp/ptp_rcar_gen4.c                   | 219 ++++++++++++++++++
 6 files changed, 312 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp.yaml
 create mode 100644 drivers/ptp/ptp_rcar_gen4.c

-- 
2.54.0


