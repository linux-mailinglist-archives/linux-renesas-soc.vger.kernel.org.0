Return-Path: <linux-renesas-soc+bounces-18916-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF5DAED6CF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 10:13:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAA5918998BF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 08:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF1DB239E78;
	Mon, 30 Jun 2025 08:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="OSl6IrPc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nqQArAVl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BB117C220;
	Mon, 30 Jun 2025 08:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751271213; cv=none; b=FOe1SeGowuz+gouAhyqYdPiapqGDd3doSX8a74KU+6eJGURr4RuwOZM1s/FrMgUb4Hvp+govuH3TS77GkR/GCwgmesN2qY9MWuM1mx8yZxoZ7HvI2bGSUJ7hrQ4aFVoptHokHV9zGUNp5c15jcl/92OktPwET/QkZt49ScC/GCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751271213; c=relaxed/simple;
	bh=G80l/NpfLbJVcIN/LA2KlmUhr4Pb56IUBD6Ecd8vCJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=USfUvmegPHmEd5Sze4qgxNJz4D3F3NWgppiUlrkNVJ83Wv0O1M1CYulCzv6Kdxd6IMQar1bvk4JKy9FzjH8zgv4KqypdAgHn5iXpOg7jduqk4Dl2DQP0ekMhnVHgZ+6BuqZeq3yYzAXgtWYUBYYylbvWXI/3H2UXClxDsIP6LII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=OSl6IrPc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nqQArAVl; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 0F3E67A017F;
	Mon, 30 Jun 2025 04:13:30 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Mon, 30 Jun 2025 04:13:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751271209;
	 x=1751357609; bh=ISC1jHbfiqurHfFKZgFEQDld2FTVesd2AslHB3FcMZQ=; b=
	OSl6IrPcYA0w8eyp05Istu06l8SNgs1aQOsGVZeUkOgVOqJ9EYM3OBKZSFNpD1ob
	YCIiY1Vj/sm0epsf3MwPy+zTXWrpHlH2HYMOVK2Fc1sjd84HcmIPM3OUPHpFa9pH
	N2MjY1TCOk9DzqFb2BqCKNkVdx4NKhlssT6bs/ORWFuYPlVkW/zBYYTtbeqP+HBD
	qPz6nvLVtShiuPsSmm/sfLvaOP1ZuV5HGfaaGI+ezbGR94ek3qlWEj9a/hzqZnHc
	/RZ0opCqv0PcZO9brPHFD84MfYyFmCP5Qyum1poGR/8V/9vSyPdNWkkKYpjvuYvU
	yjOD69w/R7iKdVyPRl7/Rg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751271209; x=
	1751357609; bh=ISC1jHbfiqurHfFKZgFEQDld2FTVesd2AslHB3FcMZQ=; b=n
	qQArAVlXef8VZ2XVViFWJXUjkrmDbe2uLKlzA3sULjpiV+0k4LZxuV9jKvtAQQcU
	NH2izK8YsnB/kdkLTfj06HbQPL//DkSj7hdr94Id9q/XIdeM2TyCbkB9n5zVbzDk
	zUkr0uN85KYGGF+q5qKSdPS5yXK5JLUfmv62KN1MR0muHN62gg/PSwfY/2QJtVEG
	U6s6ZTVS3hhBfQ73dK6VwLDLsemFduUjfmKhaUX94nriKmQLKxP2wF46xZfDFF02
	hsjw6abg8UsFZQPtgvwEDF+EUEI1AYdVTNg75hpFx0BDa+dRjgWwNcAeD79T5n3J
	h6AnpUSXlJcXOQleBwdow==
X-ME-Sender: <xms:KUdiaL6pr2Zesc4sfCg_jp2pBdt3HlM4K28BuZL8eMJzpEMNLmqiBw>
    <xme:KUdiaA4WahKURnpWF_DFQpeu7PPlvPhhv55oXQUeZ7A3oOIyR8OH7tkYc3agL9-o7
    L3FxZiit8bdYwMNCyc>
X-ME-Received: <xmr:KUdiaCdQRJcpW2ooaAV-RLw0I3tkZQldwkXbmtVKg9eYBjmBuyVpDLdJa3-FvWK18KKeJxHDzvlkYoM1gaZrI19W6XuxSCDsqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduuddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrth
    gvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepveetgedtvddvhfdtkeeghfeffeehteeh
    keekgeefjeduieduueelgedtheekkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgr
    thgvtghhrdhsvgdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehmrghrvghkrdhvrghsuhhtsehmrghilhgsohigrdhorhhgpdhrtghpthht
    ohepmhgrrhgvkhdrvhgrshhuthdorhgvnhgvshgrshesmhgrihhlsghogidrohhrghdprh
    gtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrggu
    vggrugdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphht
    thhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrghgnhhush
    druggrmhhmsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdroh
    hrgh
X-ME-Proxy: <xmx:KUdiaMKW8MI6Osjoq8CWKUAcG-I22IDqT__kkvOyfijzcowagpelHA>
    <xmx:KUdiaPJA_pqO_0OwhD0J6F9jCc4zffGlkCizb2hKgz2Uan6t0qvyUw>
    <xmx:KUdiaFyvmagPxv63wrZAB1K8NPwlufXf4EVMyDnKq1JRVuETL-Zy_A>
    <xmx:KUdiaLLjacCyICS0bMzey6SLOzdtvdXAAap--zgjgtbbeA_Srl4O_Q>
    <xmx:KUdiaN7zTOf65V6lb8DgBB9ngE1yNDjpOv8r0alDxlH-d_6X-4mhkkaF>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 Jun 2025 04:13:29 -0400 (EDT)
Date: Mon, 30 Jun 2025 10:13:28 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g3: Update thermal trip
 points on V4H Sparrow Hawk
Message-ID: <20250630081328.GC2837343@ragnatech.se>
References: <20250625100330.7629-1-marek.vasut+renesas@mailbox.org>
 <20250626214152.GA1817595@ragnatech.se>
 <c0ec7600-158f-431e-8f99-a462d68b808e@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c0ec7600-158f-431e-8f99-a462d68b808e@mailbox.org>

Hello Marek,

On 2025-06-30 00:32:54 +0200, Marek Vasut wrote:
> On 6/26/25 11:41 PM, Niklas Söderlund wrote:
> 
> Hello Niklas,
> 
> > > +&a76_3 {
> > > +	a76_3_thermal_idle: thermal-idle {
> > > +		#cooling-cells = <2>;
> > > +		duration-us = <10000>;
> > > +		exit-latency-us = <500>;
> > > +	};
> > > +};
> > 
> > I did not know you could do this and use it as a cooling device, thanks
> > for teaching me something new!
> 
> You could, although the cooling effect may vary. Some cores enter e.g. clock
> stop during idle and then they really cool down, some do not.
> 
> > > +/* THS sensors in SoC, critical temperature trip point is 100C */
> > > +&sensor1_crit {
> > > +	temperature = <100000>;
> > > +};
> > > +
> > > +&sensor2_crit {
> > > +	temperature = <100000>;
> > > +};
> > > +
> > > +&sensor3_crit {
> > > +	temperature = <100000>;
> > > +};
> > > +
> > > +&sensor4_crit {
> > > +	temperature = <100000>;
> > > +};
> > > +
> > > +&sensor_thermal_cr52 {
> > > +	critical-action = "shutdown";
> > > +};
> > > +
> > > +&sensor_thermal_cnn {
> > > +	critical-action = "shutdown";
> > > +};
> > 
> > Is this not the default action for critical trip points? In my testing
> > in the past R-Car systems have always shutdown when the critical trip is
> > reached.
> 
> It isn't quite that clear cut.
> 
> drivers/thermal/thermal_of.c thermal_of_zone_register() contains this piece
> of code:
> 
> "
> 407         ret = of_property_read_string(np, "critical-action", &action);
> 408         if (!ret && !of_ops.critical) {
> 409                 if (!strcasecmp(action, "reboot"))
> 410                         of_ops.critical =
> thermal_zone_device_critical_reboot;
> 411                 else if (!strcasecmp(action, "shutdown"))
> 412                         of_ops.critical =
> thermal_zone_device_critical_shutdown;
> 413         }
> "
> 
> If "critical-action" DT property is not set, then of_ops.critical are not
> modified.
> 
> drivers/thermal/thermal_core.c thermal_zone_device_register_with_trips()
> contains this piece of code:
> 
> 1571         if (!tz->ops.critical)
> 1572                 tz->ops.critical = thermal_zone_device_critical;
> 
> If (in case of OF) of_ops.critical is not set, use
> thermal_zone_device_critical() handler.
> 
> There is a slight difference:
> - If critical-action = "shutdown" is set in DT, then handler
>   thermal_zone_device_critical_shutdown() is called, which is a wrapper
>   around thermal_zone_device_halt(tz, HWPROT_ACT_SHUTDOWN);
> - If critical-action = "shutdown" is NOT set in DT, then handler
>   thermal_zone_device_critical() is called, which is a wrapper
>   around thermal_zone_device_halt(tz, HWPROT_ACT_DEFAULT);
> 
> thermal_zone_device_halt() itself is a wrapper around
> __hw_protection_trigger(msg, poweroff_delay_ms, action); , where action is
> either HWPROT_ACT_SHUTDOWN or HWPROT_ACT_DEFAULT , which is handled in
> kernel/reboot.c __hw_protection_trigger() implementation :
> 
> 1028 void __hw_protection_trigger(const char *reason, int ms_until_forced,
> 1029                              enum hw_protection_action action)
> 1030 {
> 1031         static atomic_t allow_proceed = ATOMIC_INIT(1);
> 1032
> 1033         if (action == HWPROT_ACT_DEFAULT)
> 1034                 action = hw_protection_action;
> 
> In case of HWPROT_ACT_DEFAULT , the 'hw_protection_action' which is assigned
> into 'action' can be overridden, either via sysfs write, or hw_protection_
> kernel command line parameter . In case of HWPROT_ACT_SHUTDOWN , the action
> cannot be overridden .
> 
> In case this hardware starts to melt, we surely want HWPROT_ACT_SHUTDOWN
> with no override options ...
> 
> > If it's not I think we should move these to r8a779g0.dtsi. And
> > likely add them for all other SoCs too?
> 
> ... the other hardware has non-optional heatsink, where override-able
> HWPROT_ACT_DEFAULT is the right option I think .

Wow, thanks for the detailed rundown. With that I agree with you, we 
should only force the shutdown on this particular platform. Nice work.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

-- 
Kind Regards,
Niklas Söderlund

