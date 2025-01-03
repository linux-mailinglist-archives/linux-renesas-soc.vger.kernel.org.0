Return-Path: <linux-renesas-soc+bounces-11835-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CD7A01014
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 23:08:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EA5B3A4050
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 22:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58CEB1BEF86;
	Fri,  3 Jan 2025 22:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="l+b/DWj+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FCE1BD004;
	Fri,  3 Jan 2025 22:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735942104; cv=none; b=oerHmR1UVWB5wjFIz5VoIZZO5DZgEjMfsvFq3Gyw1NdETkMloKH6a9lVcH1Hp1WHxcjWN+VKhyIM9KCkOv9iQQQ6Tiu74LvuOl88wh1Jrk7nusxysRBXjEFkmoWysAFf9wXeGo02BuKQ45koitf4UYcWMdNtf9zq/f/IgEpPKCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735942104; c=relaxed/simple;
	bh=2qJWB0ac9pHyHt6mWmEb5N2RTQPDTtG6FtAsgyux5Sc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jgR7L73hhUdJ0D5MVaJoe7IpLRNusBIi/stvmhnKZhpNrgmUbKMk/bVlqmiP9Zs1QABfyF+PnSR2C38GAuSoUmEtUKdB1yzE3heZy6r3kbO5Au62D7xd+93JVVSyuDKsqY/4CS58KDuqy3DCG2wAwd80a5t3ja9KzOFu41iPnns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=l+b/DWj+; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9394D1BF204;
	Fri,  3 Jan 2025 22:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735942094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=irMDM0JUlpCpSS+0kb/gACrbTtN6P2IcjloSLLPs7Ps=;
	b=l+b/DWj+Q1rR8GiaCRUQ4ShDAtqTlQDN3CWSDhiu/8/Mzn8a5B9vDe8+YEVM+sYCS5fbMl
	zV4XUzeocDvpTM5pO7mwWP7c/Pty45SVFd7DyedcpDUekINduvxWvdw2DJgxEB70tl6UqN
	Cef2F6HHa1dmXT8Uwf4c8HVUHtf4IAElyvxffjviSbS/Onv1dbinbRL7Kma8L0KKqolfAG
	uWAopZbPcL5WpNso8zZX/HGYfMf+shuW5RhyI1rSNqguRToru+cIiVi7d1yAab4th0NS1m
	Qdty2Uw3c0Dp3LMyGLsTSgo+cVP5gvVzKWhZLN2nQl+TUHRRsdiWO06LGQCSsA==
Date: Fri, 3 Jan 2025 23:08:12 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>
Subject: Re: [PATCH RFT v2 5/5] i3c: cdns: use get_parity8 helper instead of
 open coding it
Message-ID: <20250103220812962589a9@mail.local>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
 <20241229101234.2896-6-wsa+renesas@sang-engineering.com>
 <CAMuHMdWSQvyLwHyci+WVtTj4rGeR-hkjw1ap52=5X29ZzVchSA@mail.gmail.com>
 <Z3ZWt0Whyppr6GKX@shikoro>
 <CAMuHMdWTUwtVFV0o-Hsxp+eTscHHuzOmnBjv7BPoK8moQ7i9Qg@mail.gmail.com>
 <Z3ZdjRQa0nF1IYaU@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3ZdjRQa0nF1IYaU@shikoro>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 02/01/2025 10:34:05+0100, Wolfram Sang wrote:
> 
> > Let's add more bike-shedding in 2025 ;-)
> 
> Yaaay... :/
> 
> > There's also a general dislike for the ternary operator (BTW, I do
> > agree it has its uses), especially if one of the paths is a no-op,
> > like ORing with zero.
> 
> Well, let's see what Alexandre's view is on this. I'll switch to that.
> 

I'm fine with the ternary operator.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

