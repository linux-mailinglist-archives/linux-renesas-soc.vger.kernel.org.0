Return-Path: <linux-renesas-soc+bounces-8957-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7A2979191
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Sep 2024 16:44:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CD38284402
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Sep 2024 14:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852B41CFEBD;
	Sat, 14 Sep 2024 14:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="xHyE4JUX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8711CDA13;
	Sat, 14 Sep 2024 14:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726325045; cv=none; b=WU7DCQOd02x9XkiA4KaqR2mSOWMJ9cCOJISUb4R4r4I1pN7wlrJNBGD2P2EICbGrFN8Sbs+yk/whL6ekICbibw9kS0MpHu+OUda+3IL26OK9JHzj2K+wwUJENjrqcIblKf96peeVbwBnhe6R+2qC86gIgl9El3bmBhUsVrukAE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726325045; c=relaxed/simple;
	bh=m7/vNDc6BrIdUxMl1jxXFI56CmFKYCzOe7GRPun8HfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DbWuwr/45ADRRQ5VRyDBiIFeEjhCDAxm0gKfwWs8Q+BYVHkbFwnRekL2Rri6N+IHN5bHBpSIducDEe/2oPPN/HtspOdqK8dSCHaLMO/x5r6b/ZG4IJWhMASh++WIPg8vW+l22Tub7rpChgowMMcGEeBO2GpZMYVdLRM+mLtFxhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=xHyE4JUX; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=XS0GztEDYymxun+Map2uQq9snP0hBhtV9K1Wn2Q+MnY=; b=xHyE4JUXlEWH5BSOscgQsl1ZYQ
	duRG1NBaSiRaOs0w7aoMdY65ZezTMZakHU75Ry1WtoyNnsPn/JnQIj2wffhSNTZ2W8mhI3oXEP125
	THtzJPJDzRFXpY9XjA60304KLm2AX8cyZc6SFR49sj2LhBFkd2m2nVncy4m0iy3JjeQ8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1spU06-007Snt-BD; Sat, 14 Sep 2024 16:43:50 +0200
Date: Sat, 14 Sep 2024 16:43:50 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Stefan Eichenberger <eichest@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Dimitri Fedrau <dima.fedrau@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next 3/3] net: phy: marvell-88q2xxx: Enable auto
 negotiation for mv88q2110
Message-ID: <2ffd7cb6-3936-49f5-a57f-8eb26308f72f@lunn.ch>
References: <20240906133951.3433788-1-niklas.soderlund+renesas@ragnatech.se>
 <20240906133951.3433788-4-niklas.soderlund+renesas@ragnatech.se>
 <70b86181-7bcf-42d7-b5a8-d26ac0c4c573@lunn.ch>
 <ZuWW4UOtOGI_KmSg@eichest-laptop>
 <20240914142136.GC64607@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240914142136.GC64607@ragnatech.se>

> > out
> > of office again next week, afterwards I should be able to do some more
> > testing again. I think being able to set fixed link speeds is a must for
> > this PHY.
> 
> I'm also at LPC next week but I will do some more testing on this and 
> see if I can reproduce your finding with a 100 speed link.

There is no real rush. netdev is not accepting patches at the moment,
due to the merge window opening, and lots of developers travelling to
LPC. So you have up to 8 weeks to sort this out.

	Andrew

