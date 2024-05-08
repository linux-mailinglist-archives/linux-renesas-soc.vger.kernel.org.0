Return-Path: <linux-renesas-soc+bounces-5230-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 753EA8BFD32
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2024 14:33:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5ED31C21EF5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2024 12:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BC352134B;
	Wed,  8 May 2024 12:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="NasOdDQq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9628F40;
	Wed,  8 May 2024 12:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715171618; cv=none; b=mxCasIpZMI+qvZ9qmuJ9pzZyfC6YANCcZiW+QIg0iydiK+SORCnN8aiORDGYsIgX4EW9rewa124Zdq2JvntfAdwkeK19lUFwclj3vAcN49R3PGn6Otwgz0AsuCaeyTALcKP+8Q6bh17rSycAOARZrME9zvv+AFijfHOU5E8mckY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715171618; c=relaxed/simple;
	bh=unCzmwIAXJuzarB1dUKVS2Mk2zk80BmK6TLKi/8ULKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yadisg276v0RUMwQGG/ATY89oKx2+id2nCk+xIwyp8nIWjor/4ObL2jgDJzIxRV6a9ZBpjTpGDWOylPR4Ff6DRsP5dZq78FXWxbcGfourVSE7+MCazsaGoqZw7ppgV5SnVKGsRiyP/8sjvjYptLUVAl4MqWd8+BynSHBq/GrnIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=NasOdDQq; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=AbktsuE00Nv54J5eeAEEVOvjOAM+ONHCQmdHysEiwS4=; b=Na
	sOdDQq/leff578Ht01EZbIK0VFfWNjwlu8ooJei56Yd16xhOCY2KJxOqPheVON7ZMLMRufRjP4POL
	zmvcpR9Oc9Bjhm1+Zqp2QQjFTM6Y5UL5mHFrhcP+sYDcXhlwDOTy4tzKoAVYdeUsH6bXW7zA1+yvl
	nv68ssueCYhZu7g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1s4gU8-00EwtV-AI; Wed, 08 May 2024 14:33:24 +0200
Date: Wed, 8 May 2024 14:33:24 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next,v2] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <ba35173c-eaba-4f13-a2ed-011f6f7a48d1@lunn.ch>
References: <20240507201839.1763338-1-niklas.soderlund+renesas@ragnatech.se>
 <4970fd77-504c-4fb3-9c47-e4185d03e74a@lunn.ch>
 <20240508105831.GB1385281@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240508105831.GB1385281@ragnatech.se>

On Wed, May 08, 2024 at 12:58:31PM +0200, Niklas Söderlund wrote:
> On 2024-05-08 02:55:44 +0200, Andrew Lunn wrote:
> > > +static int rtsn_probe(struct platform_device *pdev)
> > > +{
> > 
> > 
> > > +	pm_runtime_enable(&pdev->dev);
> > > +	pm_runtime_get_sync(&pdev->dev);
> > 
> > 
> > > +static int rtsn_remove(struct platform_device *pdev)
> > > +{
> > > +	struct rtsn_private *priv = platform_get_drvdata(pdev);
> > > +
> > > +	unregister_netdev(priv->ndev);
> > > +	rtsn_mdio_free(priv);
> > > +	rcar_gen4_ptp_unregister(priv->ptp_priv);
> > > +	rtsn_change_mode(priv, OCR_OPC_DISABLE);
> > > +	netif_napi_del(&priv->napi);
> > > +
> > > +	pm_runtime_put_sync(&pdev->dev);
> > > +	pm_runtime_disable(&pdev->dev);
> > 
> > These appear to be the only two places you do any pm_ stuff. So it
> > seems pointless. Maybe delete this for the moment, and come back later
> > to add proper runtime power management?
> 
> I agree enable more PM stuff is a good candidate to follow initial 
> entablement. But these pm_ calls are not pointless, I still need to deal 
> with power. If I remove the pm_ calls things starts to fail.

That is odd. Why does it fail? What is turning the power off? Did i
miss you registering some callbacks?

     Andrew

