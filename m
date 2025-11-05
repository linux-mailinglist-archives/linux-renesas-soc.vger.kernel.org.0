Return-Path: <linux-renesas-soc+bounces-24177-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CC5C368FD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 05 Nov 2025 17:06:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9C74A34F465
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 16:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49448320CC0;
	Wed,  5 Nov 2025 16:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Wqwoshp9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EQN0Vx60"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C012320CAF;
	Wed,  5 Nov 2025 16:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762358795; cv=none; b=sVwaxbOMj9+5D8rz9VvrRWFhA4SMBRvGsO9JRzffqJA6H5LDTrQYggXnTNPr7kZLLorUWEfKLj7frS0zrK016iHUqTzzWR7g72yNcTDZZzmZMyvaVL4FWAQOaXcSgjWbC/6HRmuwi3qS4QTDZwNZnIIFJvrryGvZ+SfPTOldAPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762358795; c=relaxed/simple;
	bh=rGfCv7vuiprcBNZEJ+MWt+heb9PV/93FqBq0TQgB/yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P+9GzppniQMbB0hzhTT74QvFX92eUMAqUOOwBvQezFUQSWi0rxZqTw81agFQYQdddw/fL4pC/AOT2g6AXT4FkNgpyYFiPSDuOutVWStYoK5PsYnff/+XO4xn2iPcBwZMbpHssMVdJ56UwFqOVksOIqrcFYCH/1agK8TCzc/jaE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Wqwoshp9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EQN0Vx60; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 55BF41D001EB;
	Wed,  5 Nov 2025 11:06:31 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 05 Nov 2025 11:06:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762358791;
	 x=1762445191; bh=8usdL0mgzayREHu+RaTh3ftu+QOtvSunzv+P6XmA1lk=; b=
	Wqwoshp95SextNFtlKVIjo1SlQjyumllgwLKpwfcsTVyA5jjLA/NacAbd8fTbyGN
	040NMFI0ukPhXXnfeiRDwXXCpnRRVGq3XqwLtFTsltEFKT+ZmR72Eu1ihZgg3OlB
	DeJqxG1L+V5uh2edP/kewbKagDNHvUpl4KXdr6kcvjuokaYV0uFKYGSXk36SjHva
	Pg14tbx6gLeECjF70n9L0fXUKfdyWJdXSIUV/fVsMjof641baCSV2LdMCwZWuFrI
	/wOAw75pcaPrJb/kRI8mRRxlH9JcJ6qR/QM20neT1UHepwoKqiCSHZj1JxJjE5L5
	l+HmrMrqIHdAMoE2gHtPyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762358791; x=
	1762445191; bh=8usdL0mgzayREHu+RaTh3ftu+QOtvSunzv+P6XmA1lk=; b=E
	QN0Vx60Rj28L3NTGqhbqvT7hkOpv3gOg7Q82IS2T0cevZJn1ZQi8fwFTY04p6Wnc
	w1KR50Pt85epnU3OUxqj34MucyYJb82aJKqgt03gaMYuVNDvfhpBmfZEGizNaVV7
	Ogroq6Vu+XMShFs46EZ11v3XxnG3NTFNZYfXX0ybOKbuDvwSNVY3IA/lWiIhpz9E
	jxzFImTltD9hWWBTetE5Kw21MeXJdu5LXjwpAoJEialdO5AqQ5wqOM5VuB0n3ePG
	T2obkq1/CLtBjuw2tv6GH5iu8t1sI0x63BjHnaIyU2U2QpUNHagHiUH8KV2NagQl
	95gC6dlFWn22fCf4G1ugA==
X-ME-Sender: <xms:BnYLaT73uRue_vXFLMNDdQE0Kzm4FTjC5amwwj_l_I5IwD63P9yruA>
    <xme:BnYLaSNpZXf3UrLfElLbHSX0EFj3JkULWTKcjmR8vFwoaoFlGtstIMIONzWaAXz5O
    57YctqTHA5x-ILdO1Ak0g1S-mOapPaMhOWPby_TDeiQrLycSSm555k>
X-ME-Received: <xmr:BnYLaRsFXZ_nJFbn8whBHW1hYVwh8HTMygm4licnGoTKwmAk6MxErquAVLx_y3dXCRvGH53KQfqGDs7BP0KCVkC12QqaqvI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeegfeegucetufdoteggodetrf
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
X-ME-Proxy: <xmx:BnYLaVaNRRv-o_U_J5sPHg3dd6VveL_TYUwcVAa09sId19WFpkFhLw>
    <xmx:BnYLaTzo6AbKTogRBqs3bPRnGHZku0WpmidhRjiNqGUkjjSLqWDMiA>
    <xmx:BnYLadjN7k8ZOsXLSIA8H4J5he_XJGzzTCvJZSjds-jA612get7i-Q>
    <xmx:BnYLafmQAZSRUJScIK9wXQK5_7XDm4xkRnbB0N54xrq1hHMGxuUBQA>
    <xmx:B3YLaY9UJ6V07SMb5_DrDjVFfROtAf1K7DpSCFjNdFYl0cXs_61QT-_p>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Nov 2025 11:06:30 -0500 (EST)
Date: Wed, 5 Nov 2025 17:06:27 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] clocksource/drivers/sh_cmt: Always leave device
 running after probe
Message-ID: <20251105160627.GA3684509@ragnatech.se>
References: <20251016182022.1837417-1-niklas.soderlund+renesas@ragnatech.se>
 <c07ae384-4042-43f4-b876-7207b72260f7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c07ae384-4042-43f4-b876-7207b72260f7@linaro.org>

On 2025-11-05 16:36:15 +0100, Daniel Lezcano wrote:
> On 10/16/25 20:20, Niklas Söderlund wrote:
> > The CMT device can be used as both a clocksource and a clockevent
> > provider. The driver tries to be smart and power itself on and off, as
> > well as enabling and disabling its clock when it's not in operation.
> > This behavior is slightly altered if the CMT is used as an early
> > platform device in which case the device is left powered on after probe,
> > but the clock is still enabled and disabled at runtime.
> > 
> > This has worked for a long time, but recent improvements in PREEMPT_RT
> > and PROVE_LOCKING have highlighted an issue. As the CMT registers itself
> > as a clockevent provider, clockevents_register_device(), it needs to use
> > raw spinlocks internally as this is the context of which the clockevent
> > framework interacts with the CMT driver. However in the context of
> > holding a raw spinlock the CMT driver can't really manage its power
> > state or clock with calls to pm_runtime_*() and clk_*() as these calls
> > end up in other platform drivers using regular spinlocks to control
> > power and clocks.
> 
> So the fix is to remove PM management in the driver ?

Yes. As I understand it we can't do runtime pm in these drivers as the 
core calls into the functions with the raw spinlock held. I hope we can 
improve this in future.

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

