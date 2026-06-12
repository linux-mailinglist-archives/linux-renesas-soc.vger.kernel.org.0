Return-Path: <linux-renesas-soc+bounces-33910-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uDAVHJXSK2oBFwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33910-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 11:34:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 213E8678570
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 11:34:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b="qpVd/0/A";
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="JLmCR/aj";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33910-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33910-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2854931AB70A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 09:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F55E379C5D;
	Fri, 12 Jun 2026 09:29:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709FB30C37E;
	Fri, 12 Jun 2026 09:29:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256552; cv=none; b=p0XpZzU9FQb3vWI5KZve2xRNJuKqLfveZPnHO0M5vQcS0Ql382+T68bC7tic+2XOeVYjtyOCUtT1XC1OztgJV9Nawtvk0TaV1DsS96yfIOREgzmkcS+VsXSh1k8Bgn7RlawUBHZhbPGMlp0UD01dcGNn2gItKxulXLRtldeHVuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256552; c=relaxed/simple;
	bh=+64b1xkKPWAK2wGTqVMfh99WOftJjaCQAYpwclFZ95Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TNA9KyqduqLlVEqVcv7lbDZpcev9dPcoU9kfd2fk99WfQM87HcrXoHP2+ewW0u8BRzaL6s4ugDf3o+eNVWkXg9AnHHwQDaxWeXe0ux66SOJOVsXNLNQyIm5SqG3iUMKCnH7t9hfZ/rUuzYirup9oRbW4M0nCAM1P/95muhe/WJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=qpVd/0/A; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JLmCR/aj; arc=none smtp.client-ip=103.168.172.144
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 947C4EC01CF;
	Fri, 12 Jun 2026 05:29:09 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 12 Jun 2026 05:29:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1781256549; x=1781342949; bh=OU
	P+fuYeImDEZtjX+66E39B681jfCuygJRIplPq1bjI=; b=qpVd/0/AE3dgtsame0
	h+YRLYWxASmA1eV7n/v/kw65RH0NXymtW+N320n0r1sTgsaIdBd3lkQK3U4XUH6y
	TPOr/KWu+cXrBOK+FNQYLeH0ywRJ93L0KIHV39yOou6JXpR933lUGp0K+bhV7biJ
	Lns0P66+vrJjNjY3AiQiNSXWveuRIthiGPlXY3c3LQEGe/F7ruMrlCNQdA7wd9z5
	rmQ9KB0X2gbyxx1oeIJ7krEQ2s7N0l3msfO5T71w0hhW02rV0T78yZAOt8cTvvtf
	c0s8WDLxWTvcnNarIiF2tzgvornDODse9i2EGyoVJyaX/Pm2SzA1WEkrOBCQ/yfR
	ilAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1781256549; x=1781342949; bh=OUP+fuYeImDEZtjX+66E39B681jf
	CuygJRIplPq1bjI=; b=JLmCR/ajs5+IUWIvEKROt80ETn5fAi7RNyoZH1owCiXA
	h7Mp0s0IwGE8Edc2b2afEj0ghUVRNgtA+SAz4ZPYDWB4rRJPdtzAFkm9p5gX9tcP
	kbBW2vyfS8f2/OyrIx1V/21ZcBt86D8MCxUCKqXwxVA8LxH311jRwUeb8E2a6lW/
	ameDeyHc4Cu7+fnhZkKVY9++eHZ9jqu15H47aO2xwonMvGZTkW7Owzvg3/CdY112
	W7fa5GTcna6whAvZOfW10A2oasbn9L6Y4R3slIqJkj+pne1XM6+nbCRZMGFSIKy3
	HiDDTIUfq2IQkixTY1+bPcVpyYBewPcdYKr2pSSjJQ==
X-ME-Sender: <xms:ZdErajOsFgCaYGk4gBZHw5r15cdEY7gpRWK4ZK8WyYO4gDkKSkUl7Q>
    <xme:ZdErasdh50BimTB3ljL6vxeLqd8PymPMrjY7xdc_yvCc8e6LpVwMM7mfOFRxesLCK
    Q8LfBBA7dJNmoF7fI7hqNQWtXK9hHm6t_gti4XGqc7IdMcOXdwkrGB5>
X-ME-Received: <xmr:ZdErapGHza_U4vz0rtpry-PT8BRJspafTBsaCVXGJtKX6hOFKKWpXVLcTY7MrcifBwcb8g7NK5M9W1Urqdltg-YtI47H>
X-ME-Proxy-Cause: dmFkZTExWmTCGu6/QYF8p+rlXBBoEymTBWKT8utBsZoZ53cI0ZoH5hTR9yek0C+EKbegGF
    QfD1aCxmtNcO9g8zL5R55C8XwC/LS2ANksB/UOraGciHOIj8i8zIcYSY2W3X9ivZmkxuE4
    1r09Y7jzZvHEK3WCxzDES3nVW2/Bw0M8XRi4ser/1UGmVs8cF6LD1GyOB8r/DReD65cU3m
    tCWFXFGtWRa0+jEeut7eD2gLwdDwFYVZk2t5dkA6W1mBo+BJAnPqQVlHpsGtJ4ohvphDrA
    5pZSlnkv+AorvNQr6kNj+6TPJX2GnVARYypsJj9a0XVsZDg7QqFJR0+2G1gzhaQ0DjNaa0
    y5Ts5CMJRJ+51AQOemFUJOX6eHGHbWul68WpMzVyM98LqqsfO3R4qF0gOPNmLNAaeavW4B
    kwEDHPVmI8K3NcN9CrCAplGcLRJnKmEnyZJm+5JT6cYl/qVLue7D0eSHRJsoOFdCVpe9i6
    ExOTjnyDQONZJasWqi9pjdzYmZYusXhE3srJtDu4jmM7s9UT/xuOn3y6tkhT3V7v89E0ke
    4RSoftUcNc5oi6+iXae0E8IP/l9ohcctit6hHoIJsKOzdVjEkpbUw3vouvtd+eVHVQ00bQ
    yos7JA1s+crdtSD+vvAXCWZ4FFCdRR6657ohNfxGzzpStmrfYFmpJK1wKCdw
X-ME-Proxy: <xmx:ZdErantKYQsJvTIQ-QJlnYu0xQBh4l1zkPmoG9uxo_pJUygWpLYu6g>
    <xmx:ZdErajp2umSIkWfA1egdUU6ZpGTQFCUcWpBpdzTlCJbln_-hRMFWyA>
    <xmx:ZdEraunwTO8IlSR3jy386ByGSrDRK3PD43cbUaEAoPzI2GH_cq8tqg>
    <xmx:ZdEragjvrAc7vh5lIBbkJTmQMOfz_RukYMpfWplqB_ChT9RX0emLrw>
    <xmx:ZdEramrXhetWdcq19s7GfhEhEnD5C3dHrt2CvBj1CFmbyUStRnabY3eL>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Jun 2026 05:29:08 -0400 (EDT)
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
Subject: [PATCH net-next v2 0/3] ptp: Add driver for R-Car Gen4 gPTP timer
Date: Fri, 12 Jun 2026 11:28:48 +0200
Message-ID: <20260612092851.2141782-1-niklas.soderlund+renesas@ragnatech.se>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33910-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:richardcochran@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:andrew@lunn.ch,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ragnatech.se:dkim,ragnatech.se:mid,ragnatech.se:from_mime,messagingengine.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 213E8678570

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

Having both this and RTSN/RSWITCH described and enabled (!) in device 
tree will not work as they will try to use the same memory region. For 
this reason this new solution will only be enabled on platforms
after all user's of the gPTP clock have moved to only use the new
centralized timer. But in the interim both devices will be described 
(but not enabled) in the platforms base dtsi file.

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
  dt-bindings: ptp: renesas,rcar-gen4-gptp: Add R-Car Gen4
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


