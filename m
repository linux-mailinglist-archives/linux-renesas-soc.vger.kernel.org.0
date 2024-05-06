Return-Path: <linux-renesas-soc+bounces-5145-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 110698BC59C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2024 03:52:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0ADF281FBA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2024 01:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B083C064;
	Mon,  6 May 2024 01:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="luFMec6S"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43F1381AA;
	Mon,  6 May 2024 01:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714960320; cv=none; b=oOCWs6tSRA5NFQmBJNwXqjsO+LtSRVU1oSPJgEBbBACV3hIq4kc+SphK+b3PLKitZ9dEo2RsYiWJlV0YEUDRgsGd5b9lj13vSJioLVAE2/YJx2sJnBIM1LjBGgCsc4wzTRyOcIK/E9DvJdP/lyd7AlEjn8b/n6ek7T0RVVfhmOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714960320; c=relaxed/simple;
	bh=cILhcHIG/J2JKRxDO3Mb/UsmQGpjMk53IAFVso++1V8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FeV8zuSijiDgDzXXVKq0Rgm/JtSRqYum12WWYtBgVmOixg4UmiUJbujSwF/+b4BekYs2LJt0AIVAPalIVi73uZwAjwD2SvyeYDQ0NdxfRS0C/C47X6UQ+uGu1To7fRHOH0eEzFbpb76Bjm7t947msO5E4W97WVgue2fv/aiRrig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=luFMec6S; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=x2OPa1nocMpgym3iJPCUcyhuWo1hecf2fZOdbWsW0gc=; b=luFMec6SrbIveNPNk7gRhiOo+b
	U9R8ZxrcNTIc8ASgzR5MKQR4HTTucDacunKshqEw+L08QjLJw+FyRNsRd18S5edVvHTgIDb9iiPTe
	DzK215vF8CCnmPm2u8jqSckkL1h1zKnG/ts0h+Rjij135Wn0zy3gq4CxlUa7FXAS+HG8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1s3nW5-00Ej0o-Bg; Mon, 06 May 2024 03:51:45 +0200
Date: Mon, 6 May 2024 03:51:45 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <d5f6f31a-6ecc-48a9-a2ca-9d22fc6acb21@lunn.ch>
References: <20240414135937.1139611-1-niklas.soderlund+renesas@ragnatech.se>
 <5fd25c58-b421-4ec0-8b4f-24f86f054a44@lunn.ch>
 <20240503102006.GI3927860@ragnatech.se>
 <e3ce12b0-fb5d-49d7-a529-9ea7392b80ca@lunn.ch>
 <20240503133033.GJ3927860@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503133033.GJ3927860@ragnatech.se>

> > phy_read_mmd():
> >   __phy_read_mmd():
> >       mmd_phy_read():
> > 
> > So is is_c45 is true?
> 
> Not sure, I never get that far. The function __mdiobus_c45_read() is 
> called directly from of_mdiobus_register() call-chain.
> 
> The call chain is:
> 
>   rtsn_open()
>     of_mdiobus_register() <- This fails and RTSN can't talk to the PHY
>       __of_mdiobus_register()
>         __of_mdiobus_parse_phys()
>           of_mdiobus_register_phy()
>             fwnode_mdiobus_register_phy() <- See [1]
>               get_phy_device()
>                 get_phy_c45_ids()
>                   mdiobus_c45_read()
>                     __mdiobus_c45_read() <- Returns -EOPNOTSUPP [2]
> 
> 1. Here is_c45 is set as it checks the compatible value is checked.
> 
>      is_c45 = fwnode_device_is_compatible(child, "ethernet-phy-ieee802.3-c45");

Ah, O.K.

What PHY is this? Does it have C22 registers? Can it be identified via
C22 registers 2 and 3?

I suspect we in falling into the cracks with what is_c45 means. And
what ethernet-phy-ieee802.3-c45 means.

is_c45 is a bad mis-mash of responds to C45 bus transfers and has C45
registers.

Your MDIO bus master appears to be unable to perform C45 bus
transfers. So you probably don't want is_c45 set, so that C45 over C22
is performed. However, you are using ethernet-phy-ieee802.3-c45 which
suggests to me the PHY has C45 registers.

A PHY driver itself mostly does not care about is_c45. It knows the
device has C45 registers and will use phy_read_mmd() to access
them. If that uses C45 bus transfers or C45 over C22 is left to the
core, based on is_c45.

Where it gets a little problematic is determining the correct driver
for the PHY. By default it will look at registers 2 and 3 of C22. If
it finds an usable ID, that will be used to load the driver. If there
is no ID in C22 registers, and the MDIO bus supports C45 bus
transfers, it will try the various places there can be IDs in the C45
register space.

What the core will not do is use C45 over C22 to look for ID
registers, because it has no idea what is actually there, and C45 over
C22 means performing an write, which could destroy the configuration
of something which is not a PHY, e.g. a switch, or a GPIO controller
etc.

However, by specifying "ethernet-phy-ieee802.3-c45", you have short
cut the default, it goes direct to C45 bus transfers which your
hardware cannot actually do.

So i would drop the compatible. See if C22 is sufficient to get the
correct driver loaded.

	Andrew

