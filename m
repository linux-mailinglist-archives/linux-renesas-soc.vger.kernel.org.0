Return-Path: <linux-renesas-soc+bounces-19378-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 442E4AFC8CE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 12:47:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2ED0318984AE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 10:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F364231839;
	Tue,  8 Jul 2025 10:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mWG37/zX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416ED27054B;
	Tue,  8 Jul 2025 10:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751971666; cv=none; b=XcQFyvHAhlHdNk7/LXTgRKkoP+ddwPOOmna2kZ2Nq6XO3DjqhkEXvpceZgpGBL770hTRql55pyZNCLcuYzXOfY1gdnwtU7LIqUSyTnkM1/RjuoDkAxibZQHV4TveS5Gy7pSroWGQYHmVb04Lw0jrr7mNJClP/wQTeCZhHFzEPfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751971666; c=relaxed/simple;
	bh=gNF5kIHsZITNZE/wVRzomd+2nIA/Rq2Srm2KIybh62I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r7SYsuouvqVZslcbBd0agw9KE5bYG2+eQrOrLPxUcMnCPVurezCzw+AI9/sxFYyP2VG++QljWlUlZZzVGgQVXbkjRcn6CqhsXZFeliG4OGCpsSof48v0NoC1L/OzesGsNRz3QcTyficVeDPo5kIqqOzEUP2wFUsOH+kglya6obA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mWG37/zX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E57EC4CEED;
	Tue,  8 Jul 2025 10:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751971665;
	bh=gNF5kIHsZITNZE/wVRzomd+2nIA/Rq2Srm2KIybh62I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mWG37/zXq8qflsPAZPW5mY2kWxxRKIzWGl+K7jvZFoBAI84nbX1aVYz0AZeVgrXki
	 Ln7zdoEDFlNTYTl+dzs+KAe7I6bqA0Z5QrW4yX8V9cANDEeFXPhkBcDFFMgjCKjjop
	 tMn4xt9n5mGQbGJ1uQIJoBvDnc1ARZDFH1NNP/HONRVvZcnYVrDbR+lpxrywhoO7jF
	 hujxHev+nNHFZa+ByzUCT5sTdWR4kDu5dIyXbG7PVc/Ds0WNl0F6vJQv1iLv1zER3v
	 TYlo9zzHyzv3K4NLKtVr3zAeDdEmRT9X6VDnszpNbr9NBFgx9X+NH+r77L9ZI2WMJt
	 broObH8AWFYIg==
Date: Tue, 8 Jul 2025 11:47:40 +0100
From: Simon Horman <horms@kernel.org>
To: Michael Dege <michael.dege@renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: Re: [PATCH v2 3/4] net: renesas: rswitch: add offloading for L2
 switching
Message-ID: <20250708104740.GF452973@horms.kernel.org>
References: <20250708-add_l2_switching-v2-0-f91f5556617a@renesas.com>
 <20250708-add_l2_switching-v2-3-f91f5556617a@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708-add_l2_switching-v2-3-f91f5556617a@renesas.com>

On Tue, Jul 08, 2025 at 11:27:39AM +0200, Michael Dege wrote:
> This commit adds hardware offloading for L2 switching on R-Car S4.
> 
> On S4 brdev is limited to one per-device (not per port). Reasoning
> is that hw L2 forwarding support lacks any sort of source port based
> filtering, which makes it unusable to offload more than one bridge
> device. Either you allow hardware to forward destination MAC to a
> port, or you have to send it to CPU. You can't make it forward only
> if src and dst ports are in the same brdev.
> 
> Signed-off-by: Michael Dege <michael.dege@renesas.com>
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>

...

> diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c b/drivers/net/ethernet/renesas/rswitch_l2.c

...

> +static void rswitch_update_offload_brdev(struct rswitch_private *priv,
> +					 bool force_update_l2_offload)
> +{
> +	struct net_device *offload_brdev = NULL;
> +	struct rswitch_device *rdev, *rdev2;
> +
> +	rswitch_for_all_ports(priv, rdev) {
> +		if (!rdev->brdev)
> +			continue;
> +		rswitch_for_all_ports(priv, rdev2) {
> +			if (rdev2 == rdev)
> +				break;
> +			if (rdev2->brdev == rdev->brdev) {
> +				offload_brdev = rdev->brdev;
> +				break;
> +			}
> +		}
> +		if (offload_brdev)
> +			break;
> +	}
> +
> +	if (offload_brdev == priv->offload_brdev) {
> +		if (offload_brdev && force_update_l2_offload)
> +			rswitch_update_l2_offload(priv);
> +		return;
> +	}
> +
> +	if (offload_brdev && !priv->offload_brdev)
> +		dev_dbg(&priv->pdev->dev, "starting l2 offload for %s\n",
> +			netdev_name(offload_brdev));
> +	else if (!offload_brdev && priv->offload_brdev)
> +		dev_dbg(&priv->pdev->dev, "stopping l2 offload for %s\n",
> +			netdev_name(priv->offload_brdev));
> +	else
> +		dev_dbg(&priv->pdev->dev,
> +			"changing l2 offload from %s to %s\n",
> +			netdev_name(priv->offload_brdev),
> +			netdev_name(offload_brdev));

Smatch flags a false-positive about possible NULL references by the
netdev_name() calls on the line above.

Due to the previous if statement it seems to me that cannot occur.
But it did take me a few moments to convince myself of that.

So while I don't think we should write our code to static analysis tooling.
I did play around a bit to see if I could come up with something that is
both easier on the eyes and keeps Smatch happy.

Perhaps it isn't easier on the eyes, but rather I'm just more familiar with
the code now. But in any case, I'm sharing what I came up with in case it
is useful. (Compile tested only!).


        if (!offload_brdev && !priv->offload_brdev)
                return;

        if (!priv->offload_brdev)
                dev_dbg(&priv->pdev->dev, "starting l2 offload for %s\n",
                        netdev_name(offload_brdev));
        else if (!offload_brdev)
                dev_dbg(&priv->pdev->dev, "stopping l2 offload for %s\n",
                        netdev_name(priv->offload_brdev));
        else if (offload_brdev != priv->offload_brdev)
                dev_dbg(&priv->pdev->dev,
                        "changing l2 offload from %s to %s\n",
                        netdev_name(priv->offload_brdev),
                        netdev_name(offload_brdev));
        else if (!force_update_l2_offload)
                return;

> +
> +	priv->offload_brdev = offload_brdev;
> +
> +	rswitch_update_l2_offload(priv);
> +}

...

