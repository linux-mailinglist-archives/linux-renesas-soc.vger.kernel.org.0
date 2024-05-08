Return-Path: <linux-renesas-soc+bounces-5233-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A0B8C00A8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2024 17:11:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BE27288008
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2024 15:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA80C84A23;
	Wed,  8 May 2024 15:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ZcbaaFQD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KOLoUG9g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from wfhigh6-smtp.messagingengine.com (wfhigh6-smtp.messagingengine.com [64.147.123.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3C3126F0A;
	Wed,  8 May 2024 15:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715181052; cv=none; b=D8kIFCqCfGEOBtVCBBbjqZnWTzdETSHlpUHgShCa+NLmmJSUGCI0KqtQfNk1M6lBNlaNo0o0DLB0ciPTwvhr/OVITqmrrLEyHgUt8gnLqC8ZPRAguq9Q5j8n9fElxz6WGJYMBMaRvOMh/f6SKum4z1wT+v9PW0jpWQNsmbbwaPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715181052; c=relaxed/simple;
	bh=Vs8GAO9iigl+ygg+Z5CG2OKYKySM7xoswoc4TDhUFTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ciEz4WO5qpm5c+Jd0S250G6vrhPFNUoz14sxIGFLpFkUJ4AigxbZ6ZZShWds07/mV5mmmhWff0R5ye1mPycRC8eLm812TF10+9ZC1ZvgSBiGTz2tkL5C/DFzQhw8jk+HFoj/KyUghYNQdpOi7WkRYz/0XdBnNdOEtRiTuuqeol0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ZcbaaFQD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KOLoUG9g; arc=none smtp.client-ip=64.147.123.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.west.internal (Postfix) with ESMTP id 8951C1800149;
	Wed,  8 May 2024 11:10:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 08 May 2024 11:10:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1715181047;
	 x=1715267447; bh=ga/IFGUplkQ3fLqK0kM6SyD+rwkxRCrsLdwEoOq+uqk=; b=
	ZcbaaFQDwryvUO4TMUvOP1cQHumfMlP0HKIvaw87sbEqoqu/YkJVPKdCcnIH2bP3
	ElRbGahVcmtH3ISEZ4wNIgAiZKWisgLsdTxUZCion2eGrNqiMoP0N3jVfCjAuMtN
	p08I0jogXg6pagHZkTAw12znoPyhsoZRVbY+8gUOpTTad98s5W/9OYBEC4aDa0WQ
	JBzFXsgVXRa+fw6Eushh5L3UnppycSVUl3gEOy4z5ft4prePrrSK+Nw2qdEubZol
	2xsD0VADXEFFJ4UC7oLTsj0WbR56F0+ZLPTrMkscyP+s+gWQgtc8NsGeIz9dhjHK
	/4OM3IYWvlk00aQaZdMcAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715181047; x=
	1715267447; bh=ga/IFGUplkQ3fLqK0kM6SyD+rwkxRCrsLdwEoOq+uqk=; b=K
	OLoUG9gsJBqe5z90vcRkqpokWOOoCnp+WTrWHtUKXWS5l1A2Cj1+SR8zMMgpHG/q
	YCjhx8sw0fp1LugxX5KNWARLwoB7LODoAd1YSY/mZtgG/kEq+7zD0/dWSrs5VTVH
	6FdY8m3OF3Hi6+I+pP124da3mM+DKojhbYMMOK1TxgNRA4A0P9AwC/4mzT9bD+j1
	/zxdYgFsbrqvQDIQnubt34NCHUX4s9Cu4XHRqMnbvMEIQGK0YQjNAHiiClurLLh2
	/DWqjlPrMDoW5XK2sSANxsDSfFj/y/HeZXB7uf0eKIrwyShLXiP7/etcC01mrH+w
	cRWtqJziSn/xAhn9GL5Rg==
X-ME-Sender: <xms:9pU7ZpnARIskaAGlZxScKimJ76QS7xrUAIT3_GYx5_c2DGhk1ig1Bg>
    <xme:9pU7Zk2TUZT8uwCffJaqeda8-_Kvv0tY-mXywR1YKF0Wb5yEXKz3FXFt4GyZwPAoN
    rjMEyAKFLmN2L7wVXo>
X-ME-Received: <xmr:9pU7Zvo9b_lquucacpOUSVU650hqv9UQB3Wm1LlvFvc1JudyfZWd-Xs3Dl3AY8cN1TxSQ5pHeEoTgETCaBd1vN-IIsfO6e8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeftddgkeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:9pU7ZplrZ1kp8J1oKhRA0swlWOnYQ9rLhIgfFfy0Dft1f6iD0bx69Q>
    <xmx:9pU7Zn0KBBf9-NXBr9iuoPw6semKxSIsq_Trat1MUmgHaulrTshk5Q>
    <xmx:9pU7ZothRwCW1C1INoZAdnIv4QKMm7sVe62dFDckNhuCfYVWsViljQ>
    <xmx:9pU7ZrX7yChAb4nZK2rNCQl-Yc9M7pdsh9DAYQCkktpDZbKdg2O0Gg>
    <xmx:95U7ZgKZsUCesaPaQbZ_3GfdJ3cp0fqIeVw4RzAaXcKNpj4tL-TwcJ8Y>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 May 2024 11:10:45 -0400 (EDT)
Date: Wed, 8 May 2024 17:10:43 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next,v2] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <20240508151043.GH1385281@ragnatech.se>
References: <20240507201839.1763338-1-niklas.soderlund+renesas@ragnatech.se>
 <4970fd77-504c-4fb3-9c47-e4185d03e74a@lunn.ch>
 <20240508105831.GB1385281@ragnatech.se>
 <ba35173c-eaba-4f13-a2ed-011f6f7a48d1@lunn.ch>
 <20240508125557.GG1385281@ragnatech.se>
 <51b6a4f8-ef48-400f-acb6-fd20e661802d@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <51b6a4f8-ef48-400f-acb6-fd20e661802d@lunn.ch>

Hello Andrew,

Thanks for your feedback, I really appreciate your effort reviewing this 
work.

On 2024-05-08 16:00:21 +0200, Andrew Lunn wrote:
> > I agree it's odd and I will try to find out.
> > 
> > If I remove all pm_ calls and the include of pm_runtime.h register reads 
> > from the device do no longer works, so operating the device fails. Even 
> > if I dig out the root cause for this, is there any harm in keeping the 
> > pm_ operations in the initial entablement?
> 
> It suggests something is broken. Do we want to merge broken code?

Of course I do not want broken code merged. I was curious if you knew of 
any harmful side effect of of using pm_ functions I was unaware of.

> 
> Once we understand the root cause maybe then we can decide it is O.K.

The root cause is that the module clock is not enabled without some 
action. If I remove all pm_ calls as well as the inclusion of 
linux/pm_runtime.h. The tsn module clock is left disabled after probe 
completes.

    # grep . /sys/kernel/debug/clk/tsn/*
    /sys/kernel/debug/clk/tsn/clk_accuracy:0
    /sys/kernel/debug/clk/tsn/clk_duty_cycle:1/2
    /sys/kernel/debug/clk/tsn/clk_enable_count:0
    /sys/kernel/debug/clk/tsn/clk_flags:CLK_SET_RATE_PARENT
    /sys/kernel/debug/clk/tsn/clk_max_rate:18446744073709551615
    /sys/kernel/debug/clk/tsn/clk_min_rate:0
    /sys/kernel/debug/clk/tsn/clk_notifier_count:0
    /sys/kernel/debug/clk/tsn/clk_parent:s0d4_hsc
    /sys/kernel/debug/clk/tsn/clk_phase:0
    /sys/kernel/debug/clk/tsn/clk_prepare_count:1
    /sys/kernel/debug/clk/tsn/clk_protect_count:0
    /sys/kernel/debug/clk/tsn/clk_rate:199999992

As the clock is disabled trying to operate the device is not possible.

The clock can either be enabled by the pm_ calls as show or be replaced 
by an explicit clk_enable(), like this (the other pm_ related 
calls/includes are of course also removed).

    -       pm_runtime_enable(&pdev->dev);
    -       pm_runtime_get_sync(&pdev->dev);
    +       clk_enable(priv->clk);

Either of the two methods leaves the module clock running and the driver 
can operate the device.

    # grep . /sys/kernel/debug/clk/tsn/*
    /sys/kernel/debug/clk/tsn/clk_accuracy:0
    /sys/kernel/debug/clk/tsn/clk_duty_cycle:1/2
    /sys/kernel/debug/clk/tsn/clk_enable_count:1
    /sys/kernel/debug/clk/tsn/clk_flags:CLK_SET_RATE_PARENT
    /sys/kernel/debug/clk/tsn/clk_max_rate:18446744073709551615
    /sys/kernel/debug/clk/tsn/clk_min_rate:0
    /sys/kernel/debug/clk/tsn/clk_notifier_count:0
    /sys/kernel/debug/clk/tsn/clk_parent:s0d4_hsc
    /sys/kernel/debug/clk/tsn/clk_phase:0
    /sys/kernel/debug/clk/tsn/clk_prepare_count:1
    /sys/kernel/debug/clk/tsn/clk_protect_count:0
    /sys/kernel/debug/clk/tsn/clk_rate:199999992

I would prefer to keep the pm_ operations, but if you prefer I can 
switch to using clk_enable().

-- 
Kind Regards,
Niklas Söderlund

