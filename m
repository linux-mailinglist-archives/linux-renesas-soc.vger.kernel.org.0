Return-Path: <linux-renesas-soc+bounces-5232-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97ADA8BFFA8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2024 16:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DAA628F463
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2024 14:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 937DB85283;
	Wed,  8 May 2024 14:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="f8hLebpi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D993784E07;
	Wed,  8 May 2024 14:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715176836; cv=none; b=sNK0lzkd9yohdjBniv+m5Ay8CkLKnsxP3ZD7fwllgzWnby+ZUuToRkIVUo71hRumsU3ezG/B2z7lR/aOmu6UEI30nmDF0I0IMvDItRPpAAHagxmCOMDnu0OL2aEuRtQx9RraKVSeTQEQPJFJJpazf6fAoT8EpznfwZATYxw6Rfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715176836; c=relaxed/simple;
	bh=M246gDOkovbm/rkXwU30GInsRjJOrUJiuDqcK41t7+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKcCvJQ8rMII68lkbl8JWOslEAtmpZdmSHGvl4lHcRUAHeNFEvVaUP2Fg2wipYZze0nfwiVQu089/N5Zf2gyo4tn1dSd0mOtlDXJGjRg+KkBsqzIslv7rKs2TOF+Wv0qYsVXHquobpomlKhO3J/anV2fiXX6aPNzdQNIdWAgwmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=f8hLebpi; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Icw/BGT9ZDB2Cz2BCCx7FOpnFmNDQ/zQWyh8Zb0/jE0=; b=f8hLebpifdmAiisHsPNBZVxWJj
	XQFlvIGwHc3emlNArqdHFyVheeoW2/e4RE9Lfj67oEqLWwKnVrl7D2nk+DYoIP9bDiDT3p9tL+XDn
	GHnXjlUQu5dl4jGPtdP+yLtO1rm317tu9X+xmP7HCyOL9uiaEUhWsd/NWgqYDmAzC23c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1s4hqH-00ExVO-Vk; Wed, 08 May 2024 16:00:21 +0200
Date: Wed, 8 May 2024 16:00:21 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next,v2] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <51b6a4f8-ef48-400f-acb6-fd20e661802d@lunn.ch>
References: <20240507201839.1763338-1-niklas.soderlund+renesas@ragnatech.se>
 <4970fd77-504c-4fb3-9c47-e4185d03e74a@lunn.ch>
 <20240508105831.GB1385281@ragnatech.se>
 <ba35173c-eaba-4f13-a2ed-011f6f7a48d1@lunn.ch>
 <20240508125557.GG1385281@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240508125557.GG1385281@ragnatech.se>

> I agree it's odd and I will try to find out.
> 
> If I remove all pm_ calls and the include of pm_runtime.h register reads 
> from the device do no longer works, so operating the device fails. Even 
> if I dig out the root cause for this, is there any harm in keeping the 
> pm_ operations in the initial entablement?

It suggests something is broken. Do we want to merge broken code?

Once we understand the root cause maybe then we can decide it is O.K.

     Andrew

