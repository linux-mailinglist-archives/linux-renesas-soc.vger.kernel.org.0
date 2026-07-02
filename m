Return-Path: <linux-renesas-soc+bounces-34655-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MFZYCDRgRmpVSAsAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34655-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 14:57:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4926F800A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 14:57:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm1 header.b=sNQQcxCc;
	dkim=pass header.d=messagingengine.com header.s=fm2 header.b=dYXGlSoY;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34655-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34655-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 34D58301A407
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jul 2026 12:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A85748AE20;
	Thu,  2 Jul 2026 12:56:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6491480DFD;
	Thu,  2 Jul 2026 12:55:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782996961; cv=none; b=F73Lhl+LbUdLImUkgbLZfWy6yKS3YPbbBWMCpwEiH52//WQPyCnhC84+67k/yk6IykAmFc9CBKE6xSkUKWowIOnyHeBc6ESJalG57c+gmehxu0lxBWxXzLSf7NHhByAgzGHB6VwQkQHbwvMKuhH5sR6D+w8h/CCqY/9wqeaY+vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782996961; c=relaxed/simple;
	bh=VVkOx/pl0nqwcqU+UhdGCchizgtqM7Wp70kbPtz82V8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DjMD7WckwdNvDrqo7Zj6BCchJn9la1OyQ29W2i4HAg1ZnyfdNR4KS2u2FmD1XscxlhWW47U89wqzFMECW4bmB/HaNDoCoQiMaX+NB/H/uJKh5OOQp4Atp8opl3zyPkynDoQ+5SCFSk004ax0H4s2snn1NQrbE5apY1Gy56cjO0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=sNQQcxCc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dYXGlSoY; arc=none smtp.client-ip=103.168.172.153
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 10D0D1400112;
	Thu,  2 Jul 2026 08:55:58 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 02 Jul 2026 08:55:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1782996958; x=1783083358; bh=OI
	BoTG3m+ZLjVvWVyzuv1s+K0G5DoWBp2QWvVMwCqWE=; b=sNQQcxCc2pmtxX4AZr
	Qa5rEZJYl/1BdyJru5GdEAiUobApgaXWKF/s59wZt2RdUK8SicgyOPE0/i/3/kNL
	WDJGCXHnu7DipLXrMYvUMannWmethFDfZ5sTXdGXr30K1M+urSrYD0yWOBZ5Nozi
	9qzRFvLnasDdbr1AI8K+MqPXsxzPXaLYM5MgU9+Yg/J6TvetAj23JV93SMg4n1zk
	87XMskQKuTmtnOZy1vc7t598/SVQL6OQXVCfD6eakoFnRQ8rBGBsrfx1X1i7QpBR
	XYfxzeFyDxytx7D8s4JGkxjScYzpJaeOBggEfpvGHYF+mMRz8izI9c5iSxPalEJl
	eH2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1782996958; x=1783083358; bh=OIBoTG3m+ZLjVvWVyzuv1s+K0G5D
	oWBp2QWvVMwCqWE=; b=dYXGlSoYXf/2qwJ1Ixr3wassZ9PtjalVVl4WJux8kuz+
	IV7P+xS4UVCW2zu8I0+uFKgs4VuXW6/MKQefUbYTQ4hydsfyflQtXf7AecvsYzvj
	XbPed21s3EzASFmWlUUnUzMFIiO/kNb8YQ8Gkp0est8WrBeAH78HoCcY9m8j8kZ1
	sshf+wsB46cInPogdTtS/hCB3H/bahopq+9I/TmUoonOhMJ7Fj6hfroWMQPSEulg
	iRgknDLcpr0CZTzJImRPtYHjrgZvt39he1Uca8s7VgM2j6MTV4xOgYd1drqGuNn3
	ok5qtRB98TxSMMg/4+wohaRoilvxKicTNvaX3YeBvw==
X-ME-Sender: <xms:3V9Gai8JMvaeEu4OLVz7HzaWMCuGcQBZpvFU4O5sKA-y6MJertwQzQ>
    <xme:3V9GahNhaOBJm_uyIyXw0t4ae8ympgQ2JFKmf_C9iy3Lm7F2v1ZIttm52U1m_4dRR
    64WE8RkAp28WyskcAJMvuIc03PJ3awF8J81-zaLUs8kvnx4LkTwKKM>
X-ME-Received: <xmr:3V9Gau2CKMER4o5pY9ehXrgzTDq0Nh055f_T6aSuZAO3vhTw-kg28ib5Wl7Q8inKxP-XLQvkbbIH73sMEYXlyPe2UMm1p5g>
X-ME-Proxy-Cause: dmFkZTFbZziLa5In7Qp+RN8g7UI3r+GfJ6m4zcwZx7doSFwm/ggeGzJQkqb79Iejdux3G0
    cK790cskk70AYiKa0MV/ybtH4U5E6tAHR2U0pnhM2abrQXPbfm3YVaRcZ5JNQG6WtEVwoE
    xiQeQQR3cPsTkZ9kOxFefa0O3ofKJENPQ98cW8HIleMaLTuYLAy5QcNRIoEPcOUoA9FMjo
    RMk202jaBgb3OluGjMjNLocXq40i+EOAcI3fQGFb1fCro8BOp7Wjf58OI1/wFOJokAmTP9
    5gHYObiEPUyhdoymF1viytsalIGnB/8I0djTVSHS6DT2LdwH6dBkAcKzNV/hgCrdv6wuFJ
    z8Rw//5dn/HSQae2k6mu2ta05qSt6zR3NX8itMQwAceDGg7Dysgzr+M8fHY1O1ZtTlJ+m0
    Jf9ZO1UFCoY94xDdXNQvK2C4o2eAZFSkfwxfNJnzChjHPu2t02FxEJnmkosMQEIMiqcg/P
    4UedEg6IgWm/pRbBFGZq9PrbUrjThVd4Y/Hbus/WraOGTcpaetVaLoZOBE19QMuWqhow8I
    Os1vCeUWISuf1bDKgq+ZCR3M+K/n7/v264izMi9nMesJGrhJ3D7DGfQyAhNio2zIf7MRMw
    WkHSzqI+cxOKAGPQb1j6Ryf49PArJ6WU/S15cOvg3gR91544mbhVDsp19rvQ
X-ME-Proxy: <xmx:3V9Gaqf4wq3fU-uIPWDi1jO8fdDUkI2Y1yYefY_zSPwWRgQs86D3gg>
    <xmx:3V9GavYmXQNS99UKJ1gY4a6nvNXhw_pQKw3nfCtd8q-YTL-OwDSU3w>
    <xmx:3V9GavUYq5rBXqVfr36rsJ8uUavDvesjCAVinhR5ntth9Yenn-sqOA>
    <xmx:3V9GaiTEzumFa4mvi2BdqIZya24ZShCwFYoZX12WmPSEMg-mT06tdw>
    <xmx:3l9GaibOXQ3D6CMFRWTtkm-byGMMZK7KdQeP2SJBHOmbUpCXtyqPw8Py>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Jul 2026 08:55:57 -0400 (EDT)
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
Subject: [PATCH net-next v4 0/3] ptp: Add driver for R-Car Gen4 gPTP timer
Date: Thu,  2 Jul 2026 14:55:22 +0200
Message-ID: <20260702125525.2230427-1-niklas.soderlund+renesas@ragnatech.se>
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
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm1,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34655-lists,linux-renesas-soc=lfdr.de,renesas];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ragnatech.se:dkim,ragnatech.se:mid,ragnatech.se:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AA4926F800A

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
 drivers/ptp/ptp_rcar_gen4.c                   | 232 ++++++++++++++++++
 6 files changed, 325 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp.yaml
 create mode 100644 drivers/ptp/ptp_rcar_gen4.c

-- 
2.55.0


