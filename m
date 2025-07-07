Return-Path: <linux-renesas-soc+bounces-19312-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 206AAAFB24A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 13:31:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A5C327A57BC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 11:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88E2F28BABF;
	Mon,  7 Jul 2025 11:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="ZVIvLZA2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F791B3925;
	Mon,  7 Jul 2025 11:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751887864; cv=none; b=eau4oAVDYsEp43hovvMO3y5PVYkI7qU3IsYmxeKfmPI6RYxW1B4eDxCFo2zCdPTa9KQoRoOZtgLIf7JvWyliUyMltQY2dI4YLQo+6UlK76Wbj1uUTRUi5Rx9zagrnibC8Bc7wdt9nwDmoIfVKkHFHuhBUkAeyutnlx/HixFgFxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751887864; c=relaxed/simple;
	bh=3NhngUo7YpjEDP25ass+UD/PIFA5tfm4J9rkcyACWMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AG3i8DnHC5R0Q50YQFhjrjxvv2Uxk8kUvpDat04lqoKAh2A1ALJG0zDkAGT4asveNxtaenrMPwWiMKxbPwUebDKF90V5mJGgGWObKA1wSpvRSJ23T7bm55NP1ZGOxHiwgcafqWTJRG+Ls2MqgZpH5c91zwJ5Pg7iCcf0zybJanU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=ZVIvLZA2; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=7G5NvsvCGJrT81fGiyn4Xe7PT1xV6YH/XYxyo3rr6Ts=; b=ZVIvLZA2EBZWQDi7/sJ8Euj23Y
	aZdjJfcTwW13/5vBFoYt0rvREg8iFgXMTBhl1J11o3G6x8i716SWNiyhHUVWtswvKKh/3BbKo/6kW
	ZJgItnAtd9VitxouEEXY9tn2LEHcsOCAbVGJJPeFinEvjZyFwmTbg5wS9XhK3UvLOXqk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uYk3Z-000hp9-P6; Mon, 07 Jul 2025 13:30:45 +0200
Date: Mon, 7 Jul 2025 13:30:45 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Michael Dege <michael.dege@renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: Re: [PATCH 2/3] net: renesas: rswitch: add offloading for L2
 switching
Message-ID: <0be928fc-0fa0-4a62-9819-87e751822fe4@lunn.ch>
References: <20250704-add_l2_switching-v1-0-ff882aacb258@renesas.com>
 <20250704-add_l2_switching-v1-2-ff882aacb258@renesas.com>
 <64e7de61-c4ed-4b42-83c6-5001a9d28ec0@lunn.ch>
 <TY4PR01MB14282FF28B33F6A0EAD5251F8824FA@TY4PR01MB14282.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY4PR01MB14282FF28B33F6A0EAD5251F8824FA@TY4PR01MB14282.jpnprd01.prod.outlook.com>

> > Are these actually needed? It seems like they could be local functions.
> 
> Currently is_rdev() is only used in rswitch_l2.c. I moved it to that file and made it static. In the
> future it will also be used in the L3 routing. The function rswitch_modify() is used in rswitch_main.c
> and rswitch_l2.c I believe in this case it does make sense to have a single implementation. Or should
> I use two local copies?

Have long do you think it will be before L3 is added? If you have the
code ready and waiting, then please keep it driver global. If it is
going to be a while before L3 is added, i would add it to
rswitch_l2.c, and move it to a common file when you add rswitch_l3.c

	Andrew

