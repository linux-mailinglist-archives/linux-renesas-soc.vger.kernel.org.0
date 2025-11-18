Return-Path: <linux-renesas-soc+bounces-24750-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E6CC6BA20
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 21:34:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1E9964E33FD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 20:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87FCE1F463E;
	Tue, 18 Nov 2025 20:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="QkSyLD3A";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KRZZ4DiH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33A6370315;
	Tue, 18 Nov 2025 20:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763497777; cv=none; b=HCw8OkWVIUeS7w8DSUX8Igi7xvzRjbX1mzLrCfOei12gCaOF4tjKX718RN2u7iNBoKNMTecenpmqnaxWfEdZrGXudnTvEcRqZViW7H1Ku5QbwIx9j3idqmdjJbwemDQ7BrD/AjgKm/K3ZaZZIMK8uF3/x1WU1c6vMp9Jp3WXJdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763497777; c=relaxed/simple;
	bh=LHs5Wx4NLjVG9DOVGond4Oc1qE3s04AKvt7RaJJtt48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JSlt0xbcSy9XlJpcwkm+Mguu9s9By5U/qbhl4WkAlfGy9JCSfxeor6q7q3eQ3TWKTxM2Rb44yEC+nyDVXo8hiATAEkIHV1Y6A7UZC32y91Fk18YDwMnTzlr1CRB2H1hFkKMg/FwpieVJqPFv+vOEk4e6UgZeD2s43jid+YI5pvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=QkSyLD3A; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KRZZ4DiH; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id C4F441D0030F;
	Tue, 18 Nov 2025 15:29:34 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 18 Nov 2025 15:29:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1763497774;
	 x=1763584174; bh=1iV6wgb9WRDfloDjD6ruDjBW+27LqG5xyTRPJ65Uh/0=; b=
	QkSyLD3AU5twwW+jhMjlxkuuo0rlj3gxxIk+vngpyr0PH/RnPJE6y00JQSnW8bqE
	StLPk1E6YIkYXz4A1fPqdckE3vr3JZm8cQP4T6cs4lXyhv4OzknAL8G89sGKmCw9
	NVUZnvMW78gBYphBYikv80Det9APvY2YenbLij22JGsFhy+4kiorkwWmts9zmMIk
	bguxeig7qJ74yiioMWUZwFAB6eFFqZLHTY0DL4KevPGWjoWcArCqD111NfQStTc1
	Rr2jBE/qojze6ipi+Z8V84XQh35B96FkxTsSE/aJfAtdGtEkBBuVISBExtT9GF/S
	hhlAOYzHq5XMrY6a/ERu0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1763497774; x=
	1763584174; bh=1iV6wgb9WRDfloDjD6ruDjBW+27LqG5xyTRPJ65Uh/0=; b=K
	RZZ4DiHJDRxdQkyclzkPngYRk8C+WHwiZDig8JgMSGxxx20Y5HffWET4DuAFMfj3
	rNSsfdamW8bvW+Kb5B5ejZtjwO8zNRK3rU3648JfKYLMj76eDCWq7jBu2gwzj+Tt
	p1O/fGR7TZvf7pWcwzPN27pl4xM+ilekTObQM/lcDltdkSbD/7RPOWGjahHXsIpV
	9zXvq4KI5B4isF5xdSpGhe2VHnlmoum/ruG5Mu2Wgo6yfCVrSepLAMpO4lC9Uy5K
	XggNvJA8Kmte+PnL+OR0bxi0d5X9Nx7hH8WCxVdPuGfEU0GDnfpntnla7bzOadDq
	6i9O3+8Y5hWG/BJnwyXwA==
X-ME-Sender: <xms:LtccaTwcM9jCoyhBWetZL0gLVBq_Xh_z8YAFJ_YjQV1IWfuEglp57w>
    <xme:LtccaUldXux3vb3ILn56obKTz4aLikeoPyB9dhhCN8kAPgLfz2FNZFSnasO2uZda2
    Es4021sBzQpC2onmyDj7Nau-5dsk6A2yZZp5Cy8HIieXJuIhbeJfv8>
X-ME-Received: <xmr:LtccaUkdvx8EynHmBPrLNM0KQwmerj_-sjH7SLhBkR6xr1-aPm_3nbTvwlej3tV6F9Ke5c3MDcx0FxSX0A4uqT9XGwkYMl4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvvddvvdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeejveehuddtgfet
    uedtffefheehtdefleejgeffudettddtveffudevudelvddugeenucffohhmrghinheplh
    hinhgrrhhordhorhhgpdhfrggtvggsohhokhdrtghomhdpthifihhtthgvrhdrtghomhen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklh
    grshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvpdhn
    sggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegurghnih
    gvlhdrlhgviigtrghnoheslhhinhgrrhhordhorhhgpdhrtghpthhtohepthhglhigsehl
    ihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheike
    hkrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehg
    lhhiuggvrhdrsggv
X-ME-Proxy: <xmx:LtccaewsKxVgNvsdyEf_uxdk4UcHnXrJ_lHIO1KiovWp0_vHfRnZCA>
    <xmx:LtccaRqfVu1wRcRmidXeOunXJQXYaVDrxC7nmhScqDb04mlWsZbhmw>
    <xmx:LtccaV4emRehSojy82TJztVhHg3SF8N-1hTM_UoglqVxqbN47vieWw>
    <xmx:LtccaQc-Zgt3aq3oOf8f2UTS6Wsq44wtzR5xtuyb1eu2w6G7KQ67wA>
    <xmx:Ltccab35ZPCL4CELzWZ2z8CE3I-yDJrsuMYgjv-e2THKCLW_XIKkLgSG>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Nov 2025 15:29:33 -0500 (EST)
Date: Tue, 18 Nov 2025 21:29:32 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] clocksource/drivers/sh_cmt: Always leave device
 running after probe
Message-ID: <20251118202932.GE505486@fsdn.se>
References: <20251016182022.1837417-1-niklas.soderlund+renesas@ragnatech.se>
 <c07ae384-4042-43f4-b876-7207b72260f7@linaro.org>
 <20251105160627.GA3684509@ragnatech.se>
 <ae167c7f-c32f-422b-9eb2-72889cbafef0@linaro.org>
 <20251105183242.GB3684509@ragnatech.se>
 <c4377971-173a-4af9-8566-24e5860787ae@linaro.org>
 <20251109143708.GD4126953@ragnatech.se>
 <20251118201832.GD505486@fsdn.se>
 <b80861d1-023d-4b07-9af0-a42e32e6d9ee@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b80861d1-023d-4b07-9af0-a42e32e6d9ee@linaro.org>

On 2025-11-18 21:26:32 +0100, Daniel Lezcano wrote:
> On 11/18/25 21:18, Niklas Söderlund wrote:
> 
> [ ... ]
> 
> > Just wanted to check if you plan to take this patch in this cycle, no
> > rush. But I don't want to start trying similar fixes for TMU before we
> > have agreed on this one.
> 
> 
> Yes, I picked it up. It should be in linux-next

Yes, I see it now. Thanks and sorry for the noise.

> 
> 
> -- 
> <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs
> 
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog

-- 
Kind Regards,
Niklas Söderlund

