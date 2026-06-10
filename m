Return-Path: <linux-renesas-soc+bounces-33793-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yuI/JW4QKWojPwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33793-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 09:21:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D12D6666968
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 09:21:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=QjxNaaLP;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="H RMHN/r";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33793-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33793-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B77853206967
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 07:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B453387369;
	Wed, 10 Jun 2026 07:14:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EC2382368;
	Wed, 10 Jun 2026 07:14:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781075647; cv=none; b=VSgJzZtUoBdQ2Kp03EZ2rOosMyvxXmrXDyOzXTM/gGHdNUtV8HMmPIfQ9hcyBiN2TUIIVI488JXsbUzUrPfY5e+3uT9y/+hioxB9e0KpDSzohOBCPFfMyE+Izj1/jj2j8eUOG3W3Ol3/LfPofXWiRjBre/nbzhfUJXJPKqsSLc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781075647; c=relaxed/simple;
	bh=RTyG60JbaU5UmNQcJmiEj0udjRpliPB0Xq0hUoUBO4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sCFCGlXRHWnemd4wGdDN8zT9dmJIBfbKxHZ3Cgtnwr/py3gGSfNxp5LS/ACdCNZcWugf65mgTmkxeyAD6snSZoZnPiLvceYsLgz03MQmU6cTAyzW3mTDMiQ8u9auoYhqFtlrV39T61UbCUPqcDPYS7C678T6zwow5oUxkPGQC5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=QjxNaaLP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HRMHN/rk; arc=none smtp.client-ip=202.12.124.149
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 618A11D00094;
	Wed, 10 Jun 2026 03:14:04 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 10 Jun 2026 03:14:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781075644;
	 x=1781162044; bh=nTOIhlKnxzfxMWQeHDvlhNhJX1XcVKSydLuOfxYsR6Q=; b=
	QjxNaaLPhmGGeLJObnFNWBay+C6Zm/TSDamiP8xy5c4EqY1JvUjTroDmaqyhJozZ
	yC+W/KnGHMc6NU1u13A6HFBGbr5oC8T0VpTkTBemeFb9PsVd5hCVkiDRvm06WiOt
	28pgQ2wbz6iHlQSjwC1esQhiz8UBAOWgam9YyScWSdwDGVBVJU0YgsIAmSOPLZx7
	FXQOu3wSqilazWaca2NMnfZiJwyBpWVR2KoRJMu1XcWmBKnoXRLePU40LMsHI1wU
	3O4KT3aktJOxQ6wbFoP0cWLygVe7mKqsSa3GMBorpKmIRWDrUbQ84qAriiUlSJlc
	4fd+D6VZYHVM78tWsTBGTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781075644; x=
	1781162044; bh=nTOIhlKnxzfxMWQeHDvlhNhJX1XcVKSydLuOfxYsR6Q=; b=H
	RMHN/rkvd7yUG4au99N4dfaXpqLjofLP68WdBc/sFGaWJKSlvZaFUx5UeK80DSCc
	dmBseyIdlIfGevRNIY2hgcIWbZAw76t3f626DF8bRSRVpUkTOtS26JGGh12qHx1c
	MFwS5O0s1LgDYwThgLbOzLuhPELYJhuM2wdanQ7c+8c7tl7Bp7WOxukBuET+DX3Q
	VtoPdKohZFPM67iswld9x2wNaX9QtyhdY99wfEvqg84K3DcgUriqo0//7FIvPv4D
	OvZO6b3f9e4975unriYufkOu/Hz/hrtHRz4nHbc16whJnMpuVkWzeS8kwNEgzsdC
	g2Z1HZvgDg5VyedgocfQQ==
X-ME-Sender: <xms:uw4pajnFi_xsBJ4hp4x_4wTQYPrvRQft8fU54-Cdwa8Atf5tZS0baQ>
    <xme:uw4palVtxjgUDcM2O2Dy440B_Rd3wACvmX0KwdIvp-CH4pa_VCfMDv_GQh9hy6c56
    5fSc-sude6D_qJ9Iy83RspbqhAKjKfxHjkNCa_JeZ3wy6l_jMR5_RU>
X-ME-Received: <xmr:uw4pagcHD2ky0arZ6XVhpcnAxx0JUDel9dL80gWPeiBwAAvD78AOrrjOoBqxQ3eQijMq9V48IbfW8h4x4zBk3bVMHwsQqJZ6mTXU>
X-ME-Proxy-Cause: dmFkZTGxsj+rQBUtc7Ts5q0W8zlmKj3cdUvDeJdPFzsAC6RnoJ2PsmakMC2k6ey5Fa+k7x
    V4H5WbogIbKymiBVN9XCJzIZs/xg6jveYnVQ0TOhGNpJG30cQSKhY3HIke5zL/qV5yJ69H
    vW8gDh3BR3m3m2+71UaNSmxwryYrrbKscN+PxyFXrYS7hRdz3eYgrwsiVWeaTcgXOg4JXg
    Vgtw3BIN+Kd1ok+kMiU9iUe+Y5Rau+OE/LZYkdiJvzfeuGsIC8o6B+wnNlLQ/S3/EuT52U
    FffbYGCiL0cpY+8OPDQfELef3qoiDgxYsRfBy+/JbLr8KJrOn4Sa98xbuJZ6Il7tY5Fcql
    vonnDdc24Bt9ecrq+Rkr74fksdWF1TC9WJEj03vPrPtUmCFMpFiOFeRRbts8afbQ5J8liS
    MtEKO2UpVGJtoAuAM4CECSzhEcUdzkYJ7hhKyrSOdNs7FXNWkZEapd+eRmIPS8yTGh5fmn
    1uT1rauGzEUGUtJD9U3M9F8/E3Th+ym2bZNrrVASvz6sj1Lp2RwnsCFMzfu9XKGnBT0dxG
    /DW4befG9RYv797OXtSGBedBF8hhdqpcgj1YfymEQYrjLK5Xilvig2ksPUYTJJK46Id5v/
    pZHNY5okWcAki+qNdHk6Kby1YT/YFVZGKVjsaSBrZDC0DBlcRjmz7/nHXeEg
X-ME-Proxy: <xmx:uw4parmTkJn5Bz_fSHxYu7xr5QHgJPjHxRUEgHruv3hOaXwBWSLmuw>
    <xmx:uw4paqBZ0rP751xBSRgfPmPOIyTY3DSrU9fUnr7PghGptghRLWAiSQ>
    <xmx:uw4paldnzih120w7oFMBAbqxBcbmcqOOuwguUlsiM-jxVRY3Y3Mabg>
    <xmx:uw4pat4vm2WfElk5NVukoI6M8rCB1VajHAf-sp3IwbIkhYuNewhXfw>
    <xmx:vA4pavw9tmfvhexjkKX8tlc4wUxtLuZWaot83l-ela_QFgo1PXW-26YJ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Jun 2026 03:14:03 -0400 (EDT)
Date: Wed, 10 Jun 2026 09:14:00 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Michael Dege <michael.dege@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"magnus.damm" <magnus.damm@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"DavidS. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: [net-next 0/3] ptp: Add driver for R-Car Gen4 gPTP timer
Message-ID: <20260610071400.GB2465390@ragnatech.se>
References: <20260609215711.2960150-1-niklas.soderlund+renesas@ragnatech.se>
 <TY4PR01MB1428267DC1F642A7935EC302D821A2@TY4PR01MB14282.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TY4PR01MB1428267DC1F642A7935EC302D821A2@TY4PR01MB14282.jpnprd01.prod.outlook.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33793-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:michael.dege@renesas.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:richardcochran@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,messagingengine.com:dkim,davemloft.net:email,ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:from_mime,lunn.ch:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D12D6666968

Hi Michael,

Thanks for your feedback.

On 2026-06-10 05:02:48 +0000, Michael Dege wrote:
> Hello Niklas,
> 
> Thank you for your effort to clean this driver up.
> 
> > -----Original Message-----
> > From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Sent: Tuesday, June 9, 2026 11:57 PM
> > To: Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> > <conor+dt@kernel.org>; Geert Uytterhoeven <geert+renesas@glider.be>; magnus.damm
> > <magnus.damm@gmail.com>; Richard Cochran <richardcochran@gmail.com>; Andrew Lunn
> > <andrew+netdev@lunn.ch>; DavidS. Miller <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>;
> > Jakub Kicinski <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>; linux-renesas-soc@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; netdev@vger.kernel.org
> > Cc: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Subject: [net-next 0/3] ptp: Add driver for R-Car Gen4 gPTP timer
> > 
> > Hello,
> > 
> > This series is the first part cleaning up how PTP timer support is implemented on R-Car Gen4.
> > Currently there is partial support for it in some of the Ethernet devices that can use it, but not
> > all.
> > 
> > The partial support have been implemented by hacking the gPTP module directly into the first Ethernet
> > device driver that used it, RTSN for V4H and RSWITCH for S4. This is understandable as earlier R-Car
> > generations had a dedicated gPTP timer for each Ethernet device, but on
> > Gen4 there is a single system-wide PTP timer shared by all.
> > 
> > The current implementation makes it impossible for other Ethernet devices on the platform to use the
> > PTP timer without messing around with other Ethernet device drivers.
> > 
> > The effort to clean this up starts with this series which adds the system-wide gPTP timer as its own
> > driver and device tree node.
> > 
> > This series will then be followed by work to add proper PTP support to the R-Car RAVB Gen4 driver,
> > which currently advertises to user-space it supports PTP but which implementation is broken and does
> > not work.
> > 
> > This will in turn be followed by work to the RTSN and RSWITCH drivers will be be switched from its
> > current partial support by mapping the gPTP address space directly to instead use this driver.
> > 
> > While having both this driver and the "direct accessing of registers by the user driver" in operation
> > at the same time works, but it is not recommended. It works by chance due to how both the RTSN and
> > RSWITCH drivers internal workings.
> > 
> > For this reason this new solution will only be enabled on platforms after all user's of the gPTP clock
> > have moved to only use the new centralized timer.
> > 
> > For some platforms this is straight forward, such as V4H Sparrow Hawk, which only have the RAVB
> > Ethernet interface. This platform currently have no users of the PTP timer, but still advertise it
> > supports it. This and the soon to be posted RAVB patches solves that.
> > 
> > As the RAVB patches depends on this series the device tree node for the gPTP clock is added in this
> > series but will be enabled and linked to consumers in the RAVB gPTP series for platforms where it will
> > not conflict with RTSN and RSWITCH. And further enabled as more of this is cleaned up.
> > 
> > The gPTP driver itself is heavily influence by the existing partial support for gPTP in the RTSN and
> > RSWITCH drivers and the Renesas BSP.
> > 
> > Niklas Söderlund (3):
> >   dt-bindings: ptp: renesas,rcar-gen4-gptp: Add binding for R-Car Gen4
> >   ptp: Add driver for R-Car Gen4
> >   arm64: dts: renesas: r8a779g0: Add gPTP node
> > 
> >  .../bindings/ptp/renesas,rcar-gen4-gptp.yaml  |  64 +++++
> >  MAINTAINERS                                   |   7 +
> >  arch/arm64/boot/dts/renesas/r8a779g0.dtsi     |   9 +
> >  drivers/ptp/Kconfig                           |  12 +
> >  drivers/ptp/Makefile                          |   1 +
> >  drivers/ptp/ptp_rcar_gen4.c                   | 219 ++++++++++++++++++
> >  6 files changed, 312 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp.yaml
> >  create mode 100644 drivers/ptp/ptp_rcar_gen4.c
> > 
> > --
> > 2.54.0
> > 
> Are you aware, that Gen5 is on the horizon? The first patches for X5H have been up-streamed. X5H will
> be using the same gPTP driver. I think it would be a good idea to make this driver generic, meaning
> leave out the references to Gen4. What do you think?

Ideally we should have a module name or such from the gPTP module itself 
we could use as the kernel module name, unfortunately we don't. All we 
know is this is the gPTP module first used on Gen4.

I don't want to name the module ptp_rcar as that is too generic IMHO and 
risk confusion when Gen N will be released which will have a completely 
new PTP hardware module.

Having a name with gen4 do in no way make it impossible to also use on 
Gen5 devices. We just add more compatible values. There is some 
precedence to this behavior, see the R-Car thermal drivers for example.

  $ find drivers/thermal/renesas -name \*rcar\* -exec grep \.compatible {} +
  .../rcar_thermal.c:		.compatible = "renesas,rcar-thermal",
  .../rcar_thermal.c:		.compatible = "renesas,rcar-gen2-thermal",
  .../rcar_thermal.c:		.compatible = "renesas,thermal-r8a774c0",
  .../rcar_thermal.c:		.compatible = "renesas,thermal-r8a77970",
  .../rcar_thermal.c:		.compatible = "renesas,thermal-r8a77990",
  .../rcar_thermal.c:		.compatible = "renesas,thermal-r8a77995",
  .../rcar_gen3_thermal.c:		.compatible = "renesas,r8a774a1-thermal",
  .../rcar_gen3_thermal.c:		.compatible = "renesas,r8a774b1-thermal",
  .../rcar_gen3_thermal.c:		.compatible = "renesas,r8a774e1-thermal",
  .../rcar_gen3_thermal.c:		.compatible = "renesas,r8a7795-thermal",
  .../rcar_gen3_thermal.c:		.compatible = "renesas,r8a7796-thermal",
  .../rcar_gen3_thermal.c:		.compatible = "renesas,r8a77961-thermal",
  .../rcar_gen3_thermal.c:		.compatible = "renesas,r8a77965-thermal",
  .../rcar_gen3_thermal.c:		.compatible = "renesas,r8a77980-thermal",
  .../rcar_gen3_thermal.c:		.compatible = "renesas,r8a779a0-thermal",
  .../rcar_gen3_thermal.c:		.compatible = "renesas,r8a779f0-thermal",
  .../rcar_gen3_thermal.c:		.compatible = "renesas,r8a779g0-thermal",
  .../rcar_gen3_thermal.c:		.compatible = "renesas,r8a779h0-thermal",

Here rcar_thermal started as the first thermal driver covering Gen1 
(ish) and later Gen2 devices. When Gen3 was released with a completely 
new thermal hardware module a new rcar_gen3_thermal driver was created 
to support it.

The thermal module supported by the rcar_gen3_thermal driver was later 
extended to also support Gen4, as the thermal hardware was used on all 
Gen4 devices too.

tl;dr, I like to give the driver a "version" designation so in future if 
more R-Car PTP hardware emerges we can distinguish them. We don't have a 
version/name of the gPTP module itself so all we know and can use is
that it was first used on Gen4 devices. So I use that like we have done 
for other R-Car hardware modules.

> 
> Best regards,
> 
> Michael

-- 
Kind Regards,
Niklas Söderlund

