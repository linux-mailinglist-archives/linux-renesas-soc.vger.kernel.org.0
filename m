Return-Path: <linux-renesas-soc+bounces-34581-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9sLOBebYRGob2AoAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34581-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 11:07:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF0D6EB75A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 11:07:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm1 header.b="zb666/DC";
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="ZD/hwl9R";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34581-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34581-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A779302CB58
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jul 2026 09:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9173F3F0ABE;
	Wed,  1 Jul 2026 09:06:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375763EF0C9;
	Wed,  1 Jul 2026 09:06:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782896795; cv=none; b=pTbY8Xbd19aCclm3QZq3KGKNAORfVFqx1xuQiHD+2eV5OPR/DwCa1hIGVTzDo9h36+YobkN/iKb1cPW9R1+S+3VgFahswjkoBuTbHqHSX5IchqMGT7zmEbb3sG7WinNYZG6QPMeSCFFh0vxamHCu4WcClAEgpkbLkgDN7FZ+kNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782896795; c=relaxed/simple;
	bh=a+zCYslTwctUlC57LcXB9oxyfds+8RQag5BpzcB63UY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UmcNoSj7xsp7dFk4DKa8lQjtRzrV3rULanyALiGdy2plvSPNAWWa+BKMFyKP0vXW8CZpJFtvqe9qfn25Niypg2JudGyREsFlQQHzwazeNkInBnHOWCSvUQ8Z9GHE/4UWK86I0bLWqG2F5nTVDOOmAzmIa+VJx4FhYENgLlUGOrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=zb666/DC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZD/hwl9R; arc=none smtp.client-ip=202.12.124.154
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E38A47A0023;
	Wed,  1 Jul 2026 05:06:29 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 01 Jul 2026 05:06:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1782896789; x=1782983189; bh=xl
	Zj2IWS/yEA6l0YeXQHz6alZLDpsMjmTq7ALHs5DH4=; b=zb666/DCHWlohGfoHv
	kbTFenalCDnrm5i4G4uIleBfTT7NFDkJGhY+shX4oXdVvAr71Os50UuiwZrN3C4r
	alM0nQ3hChrjKb2qymyPnYD86MWWqB+nS5fnPswMWpkVORFHYi2iVf6f4gNhj+08
	CA2I4O9QLM84BXRlFdN8VaNF0iYelQa9vciiLkHWnOIcLziL2ccyAK6NSgs8Dqcu
	ByCPvY0mGSCPIhiTnkm9Wigxxh+zw+uY/w8hAHMVU9ja7Ms1Yy8ZkfpXnjM/dRAu
	RIFt4beqhRsJ4mNhkKJEaqR/RugOxWSMxd2BTFKR0oXz8ak2oHHZyBp+qR3e/8Sw
	wUZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1782896789; x=1782983189; bh=xlZj2IWS/yEA6l0YeXQHz6alZLDp
	sMjmTq7ALHs5DH4=; b=ZD/hwl9Rp73GrQld64ORoxQIruQzgekiJ82SvgvXfMDr
	bqkoEWJyqkPbCpbDillF6jRwZ1VNzaCAPlbU6AInnVCEK5cIVChQiS87TBjFCXa9
	MyOg4gtaxhO6FtcnMTfvo3IaNDTqMASWTMov7HWIqKm6G7AeUS3vGaDh2hvEuCdI
	kSNhyJcNKkIbL5rzZEEaQtm45+ABtStYDMoHbOUZtvnVzr2pO1on7XLnf9l6xEgy
	eJMYpiQ804fPy5PvPe3Bbi3zxotJBr678+IPRXXfCgiVdKm7FlTXKbckHikWwM6P
	7qOJJtfNPFYTPQ6x4FsG5nh1z5YvJXq8RtCEBzd9xA==
X-ME-Sender: <xms:ldhEahbKEOL3bP5wazLu1dqdWLIoynxkB9BIH7zc2YDj1q8Ixs7yFw>
    <xme:ldhEam4NhJbx96cs44q6FdOKBaYr_08rutrSOMy4TRdYNHlmsRCAHfsWvEIvcoqrN
    3D6xRBf4yLdY9E3xuo9SvfodZ4Wdbcg0V0fhMrZicUEK0TGCMzWb8E>
X-ME-Received: <xmr:ldhEaqynrvWD0eSoj2taQCCFeN2nVefWIzn0i1QDPugE2MYuG6zRvixEijaYUxPTZJRhrUfKBHktalHoyc91TKhdW64fIkQ>
X-ME-Proxy-Cause: dmFkZTEHujSBr1tDaokBlMPhjd6bwLitmOzJH4SPn38E53cEG/mtMfseyYzpcFUtwkBqlR
    246XuYVy3uWfXg1U/HJhaQgnhi+rCVaNEtGRTLBxdeikAQ6pDYFkLdbgBzunYATlvaw/BM
    prgy6iCYv5g/tuExxyE+3eMmfTLtQRNv51ssgN+lHoKT+t00YR0VmrABAFvOb2kzoGhqY+
    nWbiS42JRSONB12mGApxDlCuwfeTiCmXEI2AOCK8MBsPHMikxalIbnaH8XtO+Yi34liHiM
    X96kLJb/Tw0mVlXh1CoVbsj21e9gIrYmIf82uv9K/TlXv5aqM+o/OxCU70Mciqgloy1SDM
    C4ynpVi/wzlPp+4dmvhOt5SAK8TFxRoJkfTuihD/1c0vrpn2LzV3Zz6NeptosYGjMbYsow
    UTryaM+G6+zBsIlzhUhvDQSw9FtyAdHXLhb5BxNDDwvnOLvp0cPoSEtceZp/iUeN0daC9+
    wQnVcynQQOvXaO4IQ61vVoRZ0EexGZDmkZUMtpCfMHBmqV8NSveryRd5sj20Am1casL2q8
    m/r//bvg5hVLpcjQ6PBLAThrEJSYDzR+DhLdg5rf9Btv25YD+CTCPCOso+KJ9lsKDCbAan
    Mk0p9dPEVs3jRpUPTRfuBhQ52nqMdRvdurq2pjm2myeGqYcIk72EfO/A/Kkw
X-ME-Proxy: <xmx:ldhEavo3-BGUcKYegOVyYdZ7-_aQY45E1pAr4OX6ixdGBoakWffNcw>
    <xmx:ldhEak2vcd8t41cuNvQdRPmTAfJIKYP8sAr6MmsVC92Bk4UJSyvu1A>
    <xmx:ldhEagBQG-SzRjwNU1l8NS5N_6rYfy0iS-ubAuN-mSf82smCgPu2gw>
    <xmx:ldhEatMVLkiV0M1hjESSjafHJ3Sy9_kPjSFa3gvHZ8CULA1Xw4L03w>
    <xmx:ldhEaisqlq9X_etyLuzRp4Ldz8UoZ6MT7nC6Q-aKLiTCMQU9JNFmfPF2>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Jul 2026 05:06:28 -0400 (EDT)
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
Subject: [PATCH net-next v3 0/3] ptp: Add driver for R-Car Gen4 gPTP timer
Date: Wed,  1 Jul 2026 11:06:04 +0200
Message-ID: <20260701090607.1108208-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.55.0
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
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm1,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34581-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:richardcochran@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:andrew@lunn.ch,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,ragnatech.se:dkim,ragnatech.se:mid,ragnatech.se:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BFF0D6EB75A

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
2.55.0


