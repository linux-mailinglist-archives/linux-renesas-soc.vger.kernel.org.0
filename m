Return-Path: <linux-renesas-soc+bounces-22907-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A422BD1CFD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 09:32:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D432D348B31
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 07:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C4D92DFA26;
	Mon, 13 Oct 2025 07:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="mpYBB4xl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RFDAzx/c"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F88D274B42;
	Mon, 13 Oct 2025 07:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760340737; cv=none; b=ic952SIUfwvzuf0qcMEDDJR/M/GEooQiZ7DLLPVG8EE3lc2XLPnALUiIUjRlbiMSQseMFjRiBe+JSk6CXPTz1ne4kTey2gY9qV1aeI1sc/flMpl/rrY+an9bsAGf7vytN9AgLg2yy+p/Xvh82PUeCHNfSkFrwqF/IYWsfENRUDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760340737; c=relaxed/simple;
	bh=SksFRve0fVPrHL8vfdjDaBtQIZZ6uy7SQAe996kfWVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e8NInhAyWwbPXjQdBUEvCg4PHs6qNiA1MQBEMs/dqkUZIlJSThKrXy0BZqDqWudozvPEDAStw/WAHFoexOLpYpvKnx/8YgVDwAxE0Tg2xAdot/y0blufiod564LxORLnIhSk19tSk6IOOb+iuK150il1IrUz0dLLtdLGHuTkXg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=mpYBB4xl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RFDAzx/c; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 32A9AEC01AC;
	Mon, 13 Oct 2025 03:32:13 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 13 Oct 2025 03:32:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1760340733;
	 x=1760427133; bh=b38iTtyAnDRDNwTY3XgWB89qNmNPpTjYDUeTk6vBQTs=; b=
	mpYBB4xlb4JdM2rdVNiJdXc58FihQmzHkDDe5gjzg4Er1WKAADkyPCBcIcU1sW44
	NPKYjlJfreUb4B1zfCDo4bWMD6grEPcgfKTLffNb7vEQmP5LgbBDTclayWTXPSFc
	rubYkq0V6byGjeuMzV+I9EW0jFsGHA5qP+t2UKJyQHLBGdnicv7w3YiZukMk28Hi
	vl/mubGZuF/5OrMT9wzQlyhRpXMPk/3yeMNZffc/Izz9ze9gMlrBEt+dgQ3A1anq
	mfQBwHYaUHG35W0xT/jBg6XHGh12SNxbkjDT3SqcBhvRKxSTDsso6iOZRwSDn+D+
	xsCzaCZ2aGSjJfrRGYXu1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1760340733; x=
	1760427133; bh=b38iTtyAnDRDNwTY3XgWB89qNmNPpTjYDUeTk6vBQTs=; b=R
	FDAzx/c2bU6VhbgMKwhBWwo15TwUbWBzkr7vI0tUp5qfZw9CPNjRjJo7MjBKxH3D
	JzRw5/GheUlVBPvqkX9MBkv7LTlOK6JYC0+V45343ikOaoPHtkbkgMVRcUP3p+F7
	XjCNmt6LxG3nbwEIpomC7qqXHN8r34BAJA2Y0ue5/zkDr9TacE1kP8paFS1WEqZO
	CTmrLyW48rPt9k+juFeY85myMWdCSvULz5DebHPc3GTRqjnZ2Do3y5fsaxc5owVL
	5GHsspHs/2mKTUMKnPEbrPm026c09pa/1NVN74LK7Jsz2YXPRaHCqJbyIRDhhX6m
	82uxs/eS67mRvfMnULvoA==
X-ME-Sender: <xms:_KrsaOetL2kmiJt0MS-4e6unNlC4xxUGXkaMaiVQdSeeebfEDz6MYA>
    <xme:_KrsaBgFbCb3kqgg8eaTXC7RsB522Qlao7mYcr_GqEzSSnt1Fwv8OfsA8CqAXSK3a
    qMMYoHkM5kjEawOVP5y-0p2CjCKQpoDGVIToJxgryQl1PUVzQy-PgU>
X-ME-Received: <xmr:_KrsaGyKJ1EHXsHL4rg1EKcBCy6jkRnsStVl0kUVT8Ascj0sUdoiSb8pDrFrFO9KgD8WsbuaQZJsFQv2RQx0dpTJR9G74fU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduudejtdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefhffej
    gfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhope
    eipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeifshgrodhrvghnvghsrghssehs
    rghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopegurghnihgvlhdrlh
    gviigtrghnoheslhhinhgrrhhordhorhhgpdhrtghpthhtohepthhglhigsehlihhnuhht
    rhhonhhigidruggvpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvg
    hrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:_KrsaNMW8-YkH-B4dIxIP1ywsJhrdObgYuYEGmp5Db_aavp_Sfk0BQ>
    <xmx:_KrsaHXAjs6gbTl4BmS1wnDpaH3bi0HihJ1-whMR5xRz-lZC4YOMxQ>
    <xmx:_KrsaB0UWxQ0m8UzRkFybbpo0c2IfYNOX02IfGQTdXdDoT0ICp_fTA>
    <xmx:_KrsaFp62Rou5Mnu1-AcTI1ob9BMqL6FSlLYllo5M9cnEXs2JJkD5Q>
    <xmx:_arsaHkY5xvQIfRjgrgY5C4b9MRYEcMR7L1uvz50Rr3Dq0mmyOEgOlF6>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Oct 2025 03:32:12 -0400 (EDT)
Date: Mon, 13 Oct 2025 09:32:09 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC] clocksource/drivers/sh_cmt: Always leave device running
 after probe
Message-ID: <20251013073209.GA3585900@ragnatech.se>
References: <20251012091000.1160751-1-niklas.soderlund+renesas@ragnatech.se>
 <aOyoqfOQKRh81daL@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aOyoqfOQKRh81daL@shikoro>

Hi Wolfram,

On 2025-10-13 09:22:17 +0200, Wolfram Sang wrote:
> Hi Niklas,
> 
> thanks for your work on these timers!
> 
> > For non-PREEMPT_RT builds this is not really an issue, but for
> > PREEMPT_RT builds where normal spinlocks can sleep this might be an
> > issue. Be cautious and always leave the power and clock running after
> > probe.
> 
> I am not a super-duper PM expert but this sounds pretty reasonable to
> me. Only minor comments:
> 
> >  		ret = -ETIMEDOUT;
> > -		goto err1;
> > +		return ret;
> 
> return -ETIMEDOUT;

Wops, indeed. Thanks for spotting it. Will wait for feedback on the 
general idea and fix this in v2.

> 
> >  	if (!(ch->flags & (FLAG_CLOCKEVENT | FLAG_CLOCKSOURCE))) {
> > -		pm_runtime_get_sync(&ch->cmt->pdev->dev);
> >  		ret = sh_cmt_enable(ch);
> >  	}
> 
> Curly braces can go.
> 
> >  	if (f && !(ch->flags & (FLAG_CLOCKEVENT | FLAG_CLOCKSOURCE))) {
> >  		sh_cmt_disable(ch);
> > -		pm_runtime_put(&ch->cmt->pdev->dev);
> >  	}
> 
> ditto.
> 
> And I don't if this is a seperate patch or not, but we could simplify
> probe a little by using 'clk_prepare_enable()'...

This is a good idea, I would prefer to it in a separate patch. I'm 
always a bit scared touching this driver and making finding issues with 
bisect easier is always a good idea :-)

> 
> Happy hacking,
> 
>    Wolfram
> 



-- 
Kind Regards,
Niklas Söderlund

