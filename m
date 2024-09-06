Return-Path: <linux-renesas-soc+bounces-8835-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BADF096FD06
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 23:05:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 757A128B2FC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 21:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 630AB1D45F3;
	Fri,  6 Sep 2024 21:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Vyrfvmzh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580861D6788;
	Fri,  6 Sep 2024 21:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725656705; cv=none; b=iuIwvpSfGToGeE8w6T5XpcJjiYJubDyNIcLkpVSbwBcQb97IXqdhRRt8vgF3JbSjR+dq7tDnVIpx62XY4JTT1fxeXeUOs2HUyn/9xY5/8uW0XOWBBORfuqMwSCJLMhbHxTAhvLPo2pjyYISvs5fustdUavNVK5SKEl/MYy6VkKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725656705; c=relaxed/simple;
	bh=TLxopGzag25S+H1ZVnJQ5L1cxCnGpauQXsFNj+zUutY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VJspmfs4RcV9S4CU2Y1ZRsJaGxjeMhL24nKMksMeRs0fa9iZSao66XK3Vs5Nx8HFkKcZr3F6H5NzZR8HiTaGJSC18wE8JiFrDz168WR59TiFSPOsug7U+YSEHjyizvNf/bnYtlk/2Fe0170vFOWvddf/5WhcsV6oFw6j08l7WCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Vyrfvmzh; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=HtDcdOKMyujft1+Go8bBiIv0elw+4jRDPCcjcmy0tqE=; b=Vy
	rfvmzhZjVPnSvtUZJqhU2bwkwBUtjMpDw73d7NvGoc96vjQWhxOOhqn0Xr7wWTfYf2PAVarkzro0y
	/4DynEdHfdcip6ugcJ543YzKPT11ljkcVUHQrFfVi99LoTwRoE9mW/ux2ge2cxyAwn1C1IfNYM+Di
	ND4+x36f6AKU3xc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1smg8Q-006rLC-SH; Fri, 06 Sep 2024 23:04:50 +0200
Date: Fri, 6 Sep 2024 23:04:50 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next 2/2] net: phy: Fallback to C22 access if needed in
 phy_mii_ioctl()
Message-ID: <365313cb-c767-414a-8b4b-97882854e9b6@lunn.ch>
References: <20240906093955.3083245-1-niklas.soderlund+renesas@ragnatech.se>
 <20240906093955.3083245-3-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240906093955.3083245-3-niklas.soderlund+renesas@ragnatech.se>

On Fri, Sep 06, 2024 at 11:39:55AM +0200, Niklas Söderlund wrote:
> If a C45 only PHY is attached to a driver that only knows how to talk
> C22 phylib will fallback and use indirect access. This frees the driver
> from having to implement this themself.
> 
> The IOCTL implementation for SIOCGMIIREG and SIOCSMIIREG do not use
> these convenience functions and instead fail if a C45 PHY is used
> together with a driver that only knows how to speak C22.
> 
> Fix this by using the two convince functions that knows when to fallback
> to indirect access to read/write to the MDIO bus when needed.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/net/phy/phy.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
> index 4f3e742907cb..89f52bb123aa 100644
> --- a/drivers/net/phy/phy.c
> +++ b/drivers/net/phy/phy.c
> @@ -342,9 +342,12 @@ int phy_mii_ioctl(struct phy_device *phydev, struct ifreq *ifr, int cmd)
>  		if (mdio_phy_id_is_c45(mii_data->phy_id)) {
>  			prtad = mdio_phy_id_prtad(mii_data->phy_id);
>  			devad = mdio_phy_id_devad(mii_data->phy_id);
> -			ret = mdiobus_c45_read(phydev->mdio.bus, prtad, devad,
> -					       mii_data->reg_num);
>  
> +			mutex_lock(&phydev->mdio.bus->mdio_lock);
> +			ret = mmd_phy_read(phydev->mdio.bus, prtad,
> +					   phydev->is_c45, devad,

Using phydev->is_c45 is probably wrong.

mii_data->phy_id is the device on the bus you want to access. It does
not need to be the same device as the MAC is using. Just because the
device the MAC is using is a c45 device does not mean the device you
are trying to access is.

Maybe i gave you some bad advice. Sorry.

This API is reasonably well known to be a foot gun. You should only be
using it for debug, and actually using it, even only to read
registers, can mess up a PHY/phylib.

The API gives you the ability to perform a C22 bus transaction, or a
C45 bus transaction on any arbitrary device. That is all you need for
debug, you can do C45 over C22 in user space. Yes, there are race
conditions, but this API already has race conditions, which is part of
why it is a foot gun.

    Andrew


