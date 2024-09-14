Return-Path: <linux-renesas-soc+bounces-8958-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBDC979199
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Sep 2024 16:50:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14D5F1C20D1F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Sep 2024 14:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 823AA1CFEAF;
	Sat, 14 Sep 2024 14:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="RPcQiQ1L"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E141FB4;
	Sat, 14 Sep 2024 14:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726325415; cv=none; b=UJdDVXRXWkcwfhYPcrqBvVjeY7bXlmyLgbCxIcEe57FvuHZ8YoSF6/FUhs91lQqUpACb1FBtSQN4bcwJL32+BMEpNIhW2oRO00CkLc4IQwML4UUrZelAWUwkAcQZU0gsBXQ1fpjJlt929hQBDMazTXQ2wBPzqBAtsbbLPsz/SSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726325415; c=relaxed/simple;
	bh=vVu8vcgjvCaUKFeiCEm2PCyOk/hk2f4ko4N9wCwsrYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ctyjSE4wFKY4rCeWO8/ME9TP9wPSVtaQ1GEU2SUvL23F51nWkhB+hbjiHV3FlgVO/EcmWt1eWfhPuyILVsqkB0CpYl1wLN0+EzZ0ysWp8Y9cwad34bWLMAK8hExVZiiCH0GA4VI/81n6VWaHHVNDK1rV9gaA6Rn2Qy2f6NLTfac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=RPcQiQ1L; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=UwTMuQMHcXY8BrRZh5scAikwpBr4RmKYpRhyAlLalZ4=; b=RPcQiQ1LcWkJDDSXg+KfD42m5K
	sJHastlqgeyGhPfqOn3Z4gjm/O/opSPwpZuAUA6gXaFVAJBeJemPbmS3aAPoVyZNsY6aL+llzoo8X
	xVqbhnwrahRQylwBdhKF6wFavVe7k19kiACLv2cYB9mT+VWfWkiKov1X4K2cDxEyDpVQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1spU66-007Soc-9P; Sat, 14 Sep 2024 16:50:02 +0200
Date: Sat, 14 Sep 2024 16:50:02 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
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
Message-ID: <cfb43b2c-79f3-48b7-8466-e7f52d20ee56@lunn.ch>
References: <20240906133951.3433788-1-niklas.soderlund+renesas@ragnatech.se>
 <20240906133951.3433788-4-niklas.soderlund+renesas@ragnatech.se>
 <70b86181-7bcf-42d7-b5a8-d26ac0c4c573@lunn.ch>
 <ZuWW4UOtOGI_KmSg@eichest-laptop>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZuWW4UOtOGI_KmSg@eichest-laptop>

> master, I can normally do: 
> ethtool -s end1 speed 1000 master-slave forced-slave

You might want to try adding 'autoneg off'

If the new default is to perform autoneg, speed 1000 tells it to try
to autoneg only advertising 1000. If the link partner is not actually
performing autoneg, it will never succeed.

This is the regression i was talking about. For this device, due to
its history, we might want to default to autoneg off.

	Andrew

