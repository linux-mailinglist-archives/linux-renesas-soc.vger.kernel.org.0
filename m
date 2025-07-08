Return-Path: <linux-renesas-soc+bounces-19406-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C104AFDB13
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 00:25:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2D35189A591
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 22:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D40532638B2;
	Tue,  8 Jul 2025 22:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="5vUkb1eS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D73259C92;
	Tue,  8 Jul 2025 22:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752013409; cv=none; b=AfNJpAb4laHPpMA4j26O2yV8bCM0dUCZbmqwwgJ9yLHPGS2BauqcwHZVp4zlGbYwYYwdQ1Ynq/ohWTcut23/rctSgQzjecyGGbII348lnk1yZFDCxAEIVTWJvDOrObz4FWvMyhY/H2rLrVsbEQ8fBAM3XbnAU3Rjp4p6A9sJEVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752013409; c=relaxed/simple;
	bh=ZBNoeQyLyiY4yXuySNMA8rN+EHcqPY3lwpzVv06gCQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bTN4IOpk1VnK7RlfaaJoG1OdC2azCp3aCkVrZP0aTAAuy+8XdkX8eUScQF6rj+E62LBNhaGLHeFO/IqIhBAuZPBb9nOuhJtj7ibIwJPwLm/xZa0TBbjtVJG5P9th2mLwdZseBDiPoNVV9U81pLQeC9hb3TFP7sd3fs0Kt8NqC+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=5vUkb1eS; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=leAIKd/Cae2S6Coo0S346IXWPMqLG46ufx1tlunreB8=; b=5vUkb1eS7BGNjweOJRkPLeCWbz
	Qi38TTVGzjo5ov8KU+zvQQDGgozOAfPhHOKBOUbdeR4yWH+BE7q76P/VTgTKYJ0rKkpgogE5JVWdq
	wJQ/9jYKUKthRK2fbzN8jmJgRZztAluJ59isZ3ZqNfGGUbsYFWi4qZ0uRpltfKAinQoo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uZGia-000sPr-8a; Wed, 09 Jul 2025 00:23:16 +0200
Date: Wed, 9 Jul 2025 00:23:16 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Michael Dege <michael.dege@renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: Re: [PATCH v2 3/4] net: renesas: rswitch: add offloading for L2
 switching
Message-ID: <787197f2-c9d2-4ec9-8cac-99c8bbaecdcf@lunn.ch>
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

> +void rswitch_update_l2_offload(struct rswitch_private *priv)
> +{
> +	bool learning_needed, forwarding_needed;
> +	unsigned int all_ports_mask, fwd_mask;
> +	struct rswitch_device *rdev;
> +
> +	/* calculate fwd_mask with zeroes in bits corresponding to ports that
> +	 * shall participate in hardware forwarding
> +	 */
> +	all_ports_mask = GENMASK(RSWITCH_NUM_AGENTS - 1, 0);
> +	fwd_mask = all_ports_mask;
> +
> +	rswitch_for_all_ports(priv, rdev) {
> +		if (rdev_for_l2_offload(rdev) && rdev->forwarding_requested)
> +			fwd_mask &= ~BIT(rdev->port);
> +	}
> +
> +	rswitch_for_all_ports(priv, rdev) {
> +		if (rdev_for_l2_offload(rdev)) {
> +			learning_needed = rdev->learning_requested;
> +			forwarding_needed = rdev->forwarding_requested;
> +		} else {
> +			learning_needed = false;
> +			forwarding_needed = false;
> +		}
> +
> +		if (!rdev->learning_offloaded && learning_needed) {
> +			rswitch_modify(priv->addr, FWPC0(rdev->port),
> +				       0,
> +				       FWPC0_MACSSA | FWPC0_MACHLA | FWPC0_MACHMA);
> +
> +			rdev->learning_offloaded = true;
> +			netdev_info(rdev->ndev, "starting hw learning\n");
> +		}
> +
> +		if (rdev->learning_offloaded && !learning_needed) {
> +			rswitch_modify(priv->addr, FWPC0(rdev->port),
> +				       FWPC0_MACSSA | FWPC0_MACHLA | FWPC0_MACHMA,
> +				       0);
> +
> +			rdev->learning_offloaded = false;
> +			netdev_info(rdev->ndev, "stopping hw learning\n");
> +		}
> +
> +		if (forwarding_needed) {
> +			/* Update allowed offload destinations even for ports
> +			 * with L2 offload enabled earlier.
> +			 *
> +			 * Do not allow L2 forwarding to self for hw port.
> +			 */
> +			iowrite32(FIELD_PREP(FWCP2_LTWFW_MASK, fwd_mask | BIT(rdev->port)),
> +				  priv->addr + FWPC2(rdev->port));
> +
> +			if (!rdev->forwarding_offloaded) {
> +				rswitch_modify(priv->addr, FWPC0(rdev->port),
> +					       0,
> +					       FWPC0_MACDSA);
> +
> +				rdev->forwarding_offloaded = true;
> +				netdev_info(rdev->ndev,
> +					    "starting hw forwarding\n");
> +			}
> +		} else if (rdev->forwarding_offloaded) {
> +			iowrite32(FIELD_PREP(FWCP2_LTWFW_MASK, fwd_mask | BIT(rdev->port)),
> +				  priv->addr + FWPC2(rdev->port));
> +
> +			rswitch_modify(priv->addr, FWPC0(rdev->port),
> +				       FWPC0_MACDSA,
> +				       0);
> +
> +			rdev->forwarding_offloaded = false;
> +			netdev_info(rdev->ndev, "stopping hw forwarding\n");
> +		}
> +	}
> +}

This function seems overly complicated.

Normally you can change a ports STP state without needing to consider
other ports. Can you separate STP from joining ports to a bridge? That
might help simplify this function, break it up into two functions.

> +static int rswitch_port_obj_add(struct net_device *ndev, const void *ctx,
> +				const struct switchdev_obj *obj,
> +				struct netlink_ext_ack *extack)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static int rswitch_port_obj_del(struct net_device *ndev, const void *ctx,
> +				const struct switchdev_obj *obj)
> +{
> +	return -EOPNOTSUPP;
> +}

> +static int rswitch_switchdev_blocking_event(struct notifier_block *nb,
> +					    unsigned long event, void *ptr)
> +{
> +	struct net_device *ndev = switchdev_notifier_info_to_dev(ptr);
> +	int ret;
> +
> +	switch (event) {
> +	case SWITCHDEV_PORT_OBJ_ADD:
> +		ret = switchdev_handle_port_obj_add(ndev, ptr,
> +						    rswitch_port_check,
> +						    rswitch_port_obj_add);
> +		break;
> +	case SWITCHDEV_PORT_OBJ_DEL:
> +		ret = switchdev_handle_port_obj_del(ndev, ptr,
> +						    rswitch_port_check,
> +						    rswitch_port_obj_del);
> +		break;

Since these two are hard coded to return EOPNOTSUPP, it seems like you
could just return that here?

>  /* Forwarding engine block (MFWD) */
> -static void rswitch_fwd_init(struct rswitch_private *priv)
> +static int rswitch_fwd_init(struct rswitch_private *priv)
>  {
> +	/* Initialize MAC hash table */
> +	iowrite32(FWMACTIM_MACTIOG, priv->addr + FWMACTIM);
> +	ret = rswitch_reg_wait(priv->addr, FWMACTIM, FWMACTIM_MACTIOG, 0);
> +
> +	return ret;

Just

	return rswitch_reg_wait(priv->addr, FWMACTIM, FWMACTIM_MACTIOG, 0);

	Andrew

