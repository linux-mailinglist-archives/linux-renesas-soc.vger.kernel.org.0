Return-Path: <linux-renesas-soc+bounces-8896-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 05397973A77
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Sep 2024 16:48:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83CC4B253A3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Sep 2024 14:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3F41957F9;
	Tue, 10 Sep 2024 14:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="uyImq1Pg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BD6142E70;
	Tue, 10 Sep 2024 14:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725979522; cv=none; b=ByVCFyfME0ExQdTgwhWs8YIVM97VcHEy++4ECX1ctla2y6/YvHwMer9FqaqQRgKWpHhhyXojjO4ftBG9yLoHKKYe+WPdD8xYwO7yHZ/QeoWV5woGDL0ajFbNUQ8czBnBCaqKCf/etKKHBpuFW/PH2usmaUdSaQx5npjKs0tBToQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725979522; c=relaxed/simple;
	bh=SoHs5W4jG0QBsJpEf2UuyNkEsNYUVtdflTM9GeeY0No=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Or0AuXG+MVpBPEYjvPPeHmYLBrxNnaHnPCtinXH8PQjzFPZxYEJJhgQLuXdPaZNdVu7NXDVSAV9TP9oEjKpKZ5eOybnXyslVYRV9r9Di5b5W2C9X88mMsdxRevj5aVgveGtvScw+3KYiagP4t2LGnda34GBJnqlCcBE//gTr9IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=uyImq1Pg; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=0+0XKm74x/FnmbMOW0GDYbTw+dPuzExiHBKxi0oQE+o=; b=uyImq1PgKS+XW6+G1OFdZIUSaT
	b1htsbU4p/gljy5HGIs03JfccItGL8frXjjdlFtNUPvSKZRvB4Blwc3J9TNHTtMd21VqQ/lVbYr6H
	tpLnl1x/TR+ezICSe5nMgXnuRoILme9XnlG7xJaNgPVQwQ0uzu2t7fLZjuoU+Hm0khGw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1so26y-0077Gq-Ah; Tue, 10 Sep 2024 16:44:56 +0200
Date: Tue, 10 Sep 2024 16:44:56 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: yoshihiro.shimoda.uh@renesas.com, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, wojciech.drewek@intel.com,
	niklas.soderlund+renesas@ragnatech.se, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: rswitch: Fix a possible memory leak in
 rswitch_phy_device_init()
Message-ID: <b1f33b6e-1054-476d-8cd4-6a0d1e02d31b@lunn.ch>
References: <20240909092825.1117058-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909092825.1117058-1-ruanjinjie@huawei.com>

On Mon, Sep 09, 2024 at 05:28:25PM +0800, Jinjie Ruan wrote:
> of_phy_find_device() calls bus_find_device(), which calls get_device()
> on the returned struct device * to increment the refcount. The current
> implementation does not decrement the refcount, which causes memory leak.
> 
> So add the missing phy_device_free() call to decrement the
> refcount via put_device() to balance the refcount.
> 
> Fixes: 0df024d0f1d3 ("net: renesas: rswitch: Add host_interfaces setting")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/net/ethernet/renesas/rswitch.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
> index ff50e20856ec..69a67bd75f33 100644
> --- a/drivers/net/ethernet/renesas/rswitch.c
> +++ b/drivers/net/ethernet/renesas/rswitch.c
> @@ -1404,6 +1404,7 @@ static int rswitch_phy_device_init(struct rswitch_device *rdev)
>  		goto out;
>  	__set_bit(rdev->etha->phy_interface, phydev->host_interfaces);
>  	phydev->mac_managed_pm = true;
> +	phy_device_free(phydev);
>  
>  	phydev = of_phy_connect(rdev->ndev, phy, rswitch_adjust_link, 0,
>  				rdev->etha->phy_interface);

This has the same problem as discussed in

net: ethernet: nxp: Fix a possible memory leak in lpc_mii_probe()

I've not looked to see if there are more of these 'fixes'. If there
are, it would be good to self NACK them so they don't get accidentally
merged.

    Andrew

---
pw-bot: cr

