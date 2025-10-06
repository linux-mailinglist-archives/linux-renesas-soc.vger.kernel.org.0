Return-Path: <linux-renesas-soc+bounces-22681-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E20BBBD514
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Oct 2025 10:16:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 381C94E3158
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Oct 2025 08:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6994C1C3BE0;
	Mon,  6 Oct 2025 08:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="cRXE+qfS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Owd47VP2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355361E5205;
	Mon,  6 Oct 2025 08:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759738584; cv=none; b=mq9skgxYSaY6j3tVhZoh8hw5LB1M60LMK3P6hpUHFzDZ8oFsNC+XNiyj4/UPZ414mL4DhnUegIG4vevxWbjHl6SxVSuU6lKAQ/YsxaUfLO5bPVw8oT4IpOJZMum8t4pRj3yVHx/EyIzFRdkGrfFh19kZK5wmFEJKBHGz0WZa1hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759738584; c=relaxed/simple;
	bh=aU/AkKh6cHB1YKAxjl1qYdPyn6VUitmFNS5MdoyPgZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VErMAqlBeQOsk8E2JrLUF9e6yDoRtsY4gb6XnsKoot6kIEq2OGIH1zmy8vNPH3DIj8hJfWC5Iwa+o715c+6umDtFGKDkGDA6jQd/F32e/VOa71l9Y3WPKk+iXxr/d+wU+flFnuRxmp31r8JdiBuhqT2p6QL2mnwvfOzz34Ufa9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=cRXE+qfS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Owd47VP2; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 3AFF9EC0067;
	Mon,  6 Oct 2025 04:16:20 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 06 Oct 2025 04:16:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1759738580;
	 x=1759824980; bh=Xv7bIzSvavlTq8K9r7KxROHxvemSDepUR8eWdNq3pYE=; b=
	cRXE+qfSXTr47tmW2DvyUmdf0+BaxaAcbRB/jb0je86gglnXdtvr0rN4Ic1TLCms
	WVdzCZbwpBwvMB0wBFMM/W1jsGQONX7LTmqsYrzBHsuaWz3ClaeGRS32hqRfjtHq
	7+jCmoYuGNgXj0/3dSNz11ZWURL325Kq7MYoyx6dhOdvj6dTaHFFNiqiuV6oiY0f
	VD9gFlM613X2lSeUEFdF6ukqEf7iuQSbgciDz6hVIRwU2c30NAPLTWZszwfBDrqQ
	m8/t/GCKcjM9Jrbu6raw3Hfe9qBbs95n8gn2WY1qt/U5Z+rDP6qlTw4VtLGFQueE
	/Q8gdDPPczwiuoOFQr315A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1759738580; x=
	1759824980; bh=Xv7bIzSvavlTq8K9r7KxROHxvemSDepUR8eWdNq3pYE=; b=O
	wd47VP2PzyoRKJFzTmioNwQaZYRy3B/gKmUtKKglKcrvomLJL9Aa32855UA9l2G7
	FwRQ4rtl2XfplEQ1mlafTQ6LOK3PJ5gq/A8y+JPAo1uTDn+/xSFJIc8aKoumH+PA
	qlx3oz2E8u0uAx0zXx91w1tTa+zaG6/0PZe83b9sPL9Mcq6Ro+ySg2KFtK+2K4IF
	+0GVWQkT0evt7EDMyj8Oxo5j30nEAamB/QBx3TmqkqrdQfSx8u0PNUCsybDsGF8g
	3EcBN4QjuQAxMibjMl+ODD/2xBeznwgnAvsFhNJgGXkRd5E9dPqEiwDKgdCliaVJ
	jxiAJctrfoPYRmdwdg0fA==
X-ME-Sender: <xms:03rjaHXpGEJk_wcYCpJQGnyJ49v1j1tzix-I2N-BKYmqQjEOT73RKw>
    <xme:03rjaJmiH6kP1DU8IdvskqmG4DZfPhJ42_xUWEYP1YeMn8bfveBwSOziVBR5uJmDF
    kJLIIXt-hwY-hOsYPXj4SlWkH787h4Z9aAIIiTVC1n3Qa6RttidZduc>
X-ME-Received: <xmr:03rjaKA_2CnVAKrkEK6dkVm370xNj1OSmLIWL9SBgySPm1q97I0R614oe9lR-nXvPpdI5XgH8RFimqShldE1fjWKD_qeC3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeljedtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepfefhleelhfffjefg
    fedugfegjeelhfevheeikefhueelgfdtfeeuhefftddvleeinecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepke
    dpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgr
    nhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohepghgvvghrthdorhgvnh
    gvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehmrghgnhhushdruggrmhhmsehg
    mhgrihhlrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhr
    odgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdq
    shhotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:03rjaAjVdGJyCQC4U5XtKPl77gRtOH7HfhbTrJWeEo3cILLyMUfniw>
    <xmx:03rjaPw0R7mzah1oj7FcHwH6c8a7gQONFF7wbelgGaX3Hulxl_0fUA>
    <xmx:03rjaJ3X72_MwMciCAPlKQo_fpgz-ndReZJzjNdezDYrqkQQkfEECQ>
    <xmx:03rjaM-wr5Y__oe6Ay3lQ-Xr9wFAnkwyrCMnFxg73LSxMXDKUmvmug>
    <xmx:1HrjaPRK4NiLa4mxjhbZ_bZUoksZwgEs1Ufo4E_e0syY7mDJJg6PkxbT>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Oct 2025 04:16:19 -0400 (EDT)
Date: Mon, 6 Oct 2025 10:16:17 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: renesas: koelsch: Update ADV7180 binding
Message-ID: <20251006081617.GA1353934@ragnatech.se>
References: <20251003215318.39757-1-niklas.soderlund+renesas@ragnatech.se>
 <aONmeDgUPCn8rphM@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aONmeDgUPCn8rphM@shikoro>

On 2025-10-06 08:49:28 +0200, Wolfram Sang wrote:
> On Fri, Oct 03, 2025 at 11:53:18PM +0200, Niklas Söderlund wrote:
> > Use the more modern adi,adv7180cp compatible for the CVBS input found on
> > R-Car Gen2 Koelsch boards. This aligns the bindings with the other Gen2
> > board with the same setup Gose.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> I think this could be added?
> 
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 

Good point, sorry for forgetting it.


-- 
Kind Regards,
Niklas Söderlund

