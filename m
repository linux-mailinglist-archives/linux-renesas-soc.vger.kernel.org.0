Return-Path: <linux-renesas-soc+bounces-11836-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 904EDA0101B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 23:11:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63DEC16448A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 22:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C56ED1BF7FC;
	Fri,  3 Jan 2025 22:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="m1hFBvpW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7601BFE0C;
	Fri,  3 Jan 2025 22:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735942291; cv=none; b=Uy41zaMpJ3zot00Y2s81CmoEEjA2xr5MBvsXp9WhIpm8cTu7mbJLpjj3xRluDhqXXxnSr7nX9GQrowKW9ALp5nivJRY23IgWvzr6Phnd9CO0iwJIxhqJFTNHdUgAMb9xH0G2R5KOnxuTN4usLmGr2Pp76gh2H6aoDNyVL9Yv6s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735942291; c=relaxed/simple;
	bh=zjxkpArFM+I4du0YJBNH+vxhDTULsiBL7tGjO5avlKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qm0F41crjdccnAIoPKCC+TPYmw2peYpkEj5tkBVIbFazuBm1VwlJLpbGp7d79Ns5JzcSwVgv7HFb9kwonxyrIGOzaHxK4G0kZiFXaz7WhiXmRR0Qfv2kVxLbDjwP44AYYhLpx3BfX8+4wylGVYOWnIRZAa4HmzmwXmwglF3/RwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=m1hFBvpW; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 99E77240003;
	Fri,  3 Jan 2025 22:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735942278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GaSREVRzVYthKaZE68U4n8LRcINBttytqwCKxG8ViTM=;
	b=m1hFBvpWXs73YbT5FbJt1hzxAPgE8ZVrKXtPs1bBzlFUsqZ+lZHRQX0zKPY6ShSBA33M94
	nCxVfxjM17TQIfeh8I0ZTsjdcoHWusCnifqQQkD7FNdDq+gY+MI7UPHAy4RuRC1/PLgbXW
	plqeNMtf/1nHQsr4wWynzN8RNOtlMhJntzpH6OdRLp/V7y+EhqL4meHpiyaT250GDJn3qS
	m2vRCXxR66jEw3eNN+mVFwAA+dp31daWFqYpfrJo8AC+IvXl5qzZoZ0B7ZMqujNpFwosFg
	U4LXIYARXZCr4y7LByWSLdz+GbsUUBSwIoBslGph0yVY2dkoV4n1gMMg50iE/w==
Date: Fri, 3 Jan 2025 23:11:17 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH RFT v2 0/5] i3c: introduce and use generic parity helper
Message-ID: <20250103221117bb066057@mail.local>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 29/12/2024 11:12:28+0100, Wolfram Sang wrote:
> Changes since v1:
> 
> * renamed from 'get_parity8' to 'parity8'
> * use XOR instead of OR in the kdoc example (Thanks, Rasmus, for both)
> * added tag from Guenter (thanks!)
> * rebased to 6.13-rc4
> 
> Old coverletter follows:
> 
> I am currently working on upstreaming another I3C controller driver. As
> many others, it needs to ensure odd parity for a dynamically assigned
> address. The BSP version of the driver implemented a custom parity
> algorithm. Wondering why we don't have a generic helper for this in the
> kernel, I found that many I3C controller drivers all implement their
> version of handling parity.
> 
> So, I sent out an RFC[1] moving the efficient implementation of the
> SPD5118 driver to a generic location. The series was well received, but
> the path for upstream was not clear. Because I need the implementation
> for my I3C controller driver and I3C is a prominent user of this new
> function, I got the idea of converting the existing I3C drivers and
> resend the series, suggesting this all goes upstream via I3C.
> 
> Is this acceptable? The non-I3C patches have all the tags they need,
> only the I3C patches would need testing on hardware.
> 
> A build-tested (incl. build-bots) branch is here:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/i3c/get_parity
> 
> Looking forward to comments...
> 
> [1] https://lore.kernel.org/all/20241214085833.8695-1-wsa+renesas@sang-engineering.com/
> 

I'll apply the series once you get some agreement on the function name.
I don't care to much but the _odd suggestion seems wise to me.

> 
> 
> Wolfram Sang (5):
>   bitops: add generic parity calculation for u8
>   hwmon: (spd5118) Use generic parity calculation
>   i3c: dw: use get_parity8 helper instead of open coding it
>   i3c: mipi-i3c-hci: use get_parity8 helper instead of open coding it
>   i3c: cdns: use get_parity8 helper instead of open coding it
> 
>  drivers/hwmon/spd5118.c                  |  8 +-----
>  drivers/i3c/master/dw-i3c-master.c       | 14 +++--------
>  drivers/i3c/master/i3c-master-cdns.c     |  3 +--
>  drivers/i3c/master/mipi-i3c-hci/dat_v1.c | 11 +--------
>  include/linux/bitops.h                   | 31 ++++++++++++++++++++++++
>  5 files changed, 37 insertions(+), 30 deletions(-)
> 
> -- 
> 2.39.2
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

