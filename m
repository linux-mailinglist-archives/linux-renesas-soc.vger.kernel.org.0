Return-Path: <linux-renesas-soc+bounces-19249-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B453FAF9A1A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 19:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11AD15A842C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 17:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B83F2DA769;
	Fri,  4 Jul 2025 17:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="4jiUg6cp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24052D8371;
	Fri,  4 Jul 2025 17:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751651408; cv=none; b=H2SqXxxR5RmsRxSqBIzLY5kUtzBPmlfGipwt5R6Uto9IGcmGF3Ah03xtQ/9H/1zp/sEp5yzG8FVz7EGsPeG2hzldTbtuot8jTOxrI9lDoMEh1qhWa2njiDIn9OxBp8ji7qh1lBj69X734ucvRV4MtHvb5nV22SwAzQs9NU/30ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751651408; c=relaxed/simple;
	bh=b6l9iIP7nJMscPckrZPN4pMD2z4gS76/uS9VHZsmiMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P1B20NOFHN1yFkV1+vbWM7GN3HR4Ww4WZ6XP/iHO905UcqzI2tvlskU4UaKjLZkEBVzKb90vUxIm0rlXxrvpyuLjOMgpGKaUuAQWFT6NX2mTkySiHwrmhBr/GVu1F6jpskuWt6Z1rHbJEsrLOJ3eSrVHka+uzuXwlwFri402la4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=4jiUg6cp; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=okx0DMr3QVLyZvzQ2fFZkUdAS7PR6z16rYKmkt7R2nI=; b=4jiUg6cpeWQRLLVJBgPp7+JB3b
	l2TUbhZ0NvoiRgWk+MK7VFTMqABygMzj/Ubbbkr0aMAcSFGQBv2Qrba66uEjBoP3jHsJHFhymPyNc
	5z+CC+flwlxtq0hWEy8o51qS/YsxTM26MIufkqi0iyAxhMTiE6kF/RFCz2VI7p0MfvLs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uXkXn-000H9G-Nk; Fri, 04 Jul 2025 19:49:51 +0200
Date: Fri, 4 Jul 2025 19:49:51 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: Michael Dege <michael.dege@renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] net: renesas: rswitch: add offloading for L2
 switching
Message-ID: <c601dc85-67c2-4fa0-bd92-64aa0a0f48df@lunn.ch>
References: <20250704-add_l2_switching-v1-0-ff882aacb258@renesas.com>
 <20250704-add_l2_switching-v1-2-ff882aacb258@renesas.com>
 <64e7de61-c4ed-4b42-83c6-5001a9d28ec0@lunn.ch>
 <8d17d946-07fb-4335-b8e8-9ee256f75c12@cogentembedded.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d17d946-07fb-4335-b8e8-9ee256f75c12@cogentembedded.com>

On Fri, Jul 04, 2025 at 11:02:55AM +0200, Nikita Yushchenko wrote:
> > >   	struct phy *serdes;
> > > +
> > > +	struct net_device *brdev;	/* master bridge device */
> > 
> > How many ports does this device have? If it is just two, this might
> > work. But for a multi-port device, you need to keep this in the port
> > structure.
> 
> Having per-device (not per port) brdev was designed by me.  Reasoning is
> that hw L2 forwarding support lacks any sort of source port based filtering,
> which makes it unusable to offload more than one bridge device. Either you
> allow hardware to forward destination MAC to a port, or you have to send it
> to CPU. You can't make it forward only if src and dst ports are in the same
> brdev.

This needs to be part of the commit message, since it is not
obvious. I think some comments in the code would also be good, where
it decides there is a bridge in use, and so it needs to reject the
offload for another bridge. This limitation is very unusual, pretty
much a design error, so it needs calling out.

	Andrew

