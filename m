Return-Path: <linux-renesas-soc+bounces-21367-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB86BB44592
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 20:37:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 766ADA00D97
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 18:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E99B2367D5;
	Thu,  4 Sep 2025 18:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Pqe7nnoW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9423E136988;
	Thu,  4 Sep 2025 18:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757011063; cv=none; b=IsRgYBN3sFhkFK5Sbu6lMBoedzS9jNAkzNzFpi1ElJti8hilJvxpc73uaMpHCeGm92nte00SSAnM/l7+MOlZEpj6IKy6BVT50ljhTfMtrBAxiySbTUvH0I4ZL0MOrbeEASm7a83KDM1VGvPQYTtbg+GL6fEqMkqHjZ5oegE8lnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757011063; c=relaxed/simple;
	bh=oDs7pvtI6djkw/tf6fkImzKkm/XJ5Se9YT+VZJuaUM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=re6r4Z0ITnIrtawiIwm2NT4nTysH5oXD3ignJdZqlvzAGD9joYuXQeA6bXsKaPKXOuG07c4+YbuZbXeHGbDO86a9Wc6xbZX+Pw+SvcXCkmHCov/jhCzW5DS6u9V252qnGWs+4cEkDVY1NvSX8UUue6iqcbBpJWw3DHB+KcwVR8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Pqe7nnoW; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=qzj9vbUXYsMS+AzRwZK0om0bzNtHoahJaAyJVJTIsbE=; b=Pqe7nnoW4qhSmyftdNbl0fzT20
	B5BhKMjKs126fQiNcPc+t8Jzok7+Bp3BhZzJuzX84Hu5k97El3LzX7w74uU6cc+3V+p80wViUg2DA
	dCPJtNnRHuTORBT5KiQ/bpey1elIQKk3F3Pinpjo/0SbqRTE5oG1TiT8w1OUdsAtHTxI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uuEpv-007Fs3-D9; Thu, 04 Sep 2025 20:37:31 +0200
Date: Thu, 4 Sep 2025 20:37:31 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-sh@vger.kernel.org
Subject: Re: [PATCH net-next 2/3] sh_eth: Convert to
 DEFINE_SIMPLE_DEV_PM_OPS()
Message-ID: <082d5554-7dae-4ff4-bbbe-853268865025@lunn.ch>
References: <cover.1756998732.git.geert+renesas@glider.be>
 <ee4def57eb68dd2c32969c678ea916d2233636ed.1756998732.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee4def57eb68dd2c32969c678ea916d2233636ed.1756998732.git.geert+renesas@glider.be>

On Thu, Sep 04, 2025 at 05:18:57PM +0200, Geert Uytterhoeven wrote:
> Convert the Renesas SuperH Ethernet driver from an open-coded dev_pm_ops
> structure to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().  This lets
> us drop the checks for CONFIG_PM and CONFIG_PM_SLEEP without impacting
> code size, while increasing build coverage.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/net/ethernet/renesas/sh_eth.c | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
> index 0516db9dc946fcdb..f16a350736e1aa04 100644
> --- a/drivers/net/ethernet/renesas/sh_eth.c
> +++ b/drivers/net/ethernet/renesas/sh_eth.c
> @@ -3443,8 +3443,6 @@ static void sh_eth_drv_remove(struct platform_device *pdev)
>  	free_netdev(ndev);
>  }
>  
> -#ifdef CONFIG_PM
> -#ifdef CONFIG_PM_SLEEP
>  static int sh_eth_wol_setup(struct net_device *ndev)

Humm, sh_eth_wol_setup() went from conditional to always available.

Can WoL work without PM? Is the current get_wol() and set_wol()
broken?

Maybe you can take a look at this, do some testing?

It is however not strictly related to this patch, so:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

