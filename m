Return-Path: <linux-renesas-soc+bounces-24294-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7E1C3E403
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 07 Nov 2025 03:32:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22AF6188A8BC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Nov 2025 02:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD4572D7DDB;
	Fri,  7 Nov 2025 02:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="GH3vDB/y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD8118DB1E;
	Fri,  7 Nov 2025 02:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762482751; cv=none; b=imppQYcaqp8TGrlpoeENHoXZKrC+UbgyZZMWMmFqJvSOI8JyLEgJhG+PgejWr4SquhN+WQrIAbrC/AtUzMJswWBtzQYcJW7xjFH2ZCVA0g1uCjX4jkaWK6UWI4WJpkYP8gttgW/owYu5I5ssNwVytcEpzUbx1GJqnH8rK59m0+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762482751; c=relaxed/simple;
	bh=8AZUtJSjZbIu0bdghP1eunb4IxNIfI0QWmogY0q3qP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NJmzlcqkqDd5+KbZp+cz6cpsqh9i+xyWxPuB20b63y//Rxqp7B+Qvl5AQfQ5ECEMIrzDBsTP0t6aIpB3ZLHpboreFLatncXHPEdbJzTDp2+wy9VDaUJkcbgpR2h06sMZTtw4rVW5KZI1WE7PIWHiOBtx2cfNKTlFdnwE/pXSU6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=GH3vDB/y; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=oqZYRwITV1tIClSNKZT4kQ9NDRETBwvBumZWmmbLSGo=; b=GH3vDB/yuN2m28NbUXVt3k3Fad
	MN5iO/zI4OfUmGuyudGhXiyYoL4uZtFJaA4Cus7/uEiVhlOikdWi41Se+SvzuXmruq/5g93CTh+4f
	jWpoYrw4ZUn4OpD6vq20GhbFyo5bwpQpqZnfeVgVqJ5VvC0e4K9iJRz/cRJPqqNO8Qzs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vHCGu-00DB5C-Fb; Fri, 07 Nov 2025 03:32:16 +0100
Date: Fri, 7 Nov 2025 03:32:16 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Michael Dege <michael.dege@renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH net-next 09/10] net: renesas: rswitch: add simple l3
 routing
Message-ID: <06213fb1-12dc-4045-803e-d2a65c7e9fc6@lunn.ch>
References: <20251106-add_l3_routing-v1-0-dcbb8368ca54@renesas.com>
 <20251106-add_l3_routing-v1-9-dcbb8368ca54@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-add_l3_routing-v1-9-dcbb8368ca54@renesas.com>

> +void rswitch_update_l3_offload(struct rswitch_private *priv)
> +{
> +	u32 all_ports_mask = GENMASK(RSWITCH_NUM_AGENTS - 1, 0);
> +	struct rswitch_device *rdev;
> +	bool l3_offload_enable_cond;
> +	u32 l3_rdev_count;
> +	u32 l3_ports_mask;
> +
> +	l3_ports_mask = all_ports_mask;
> +
> +	l3_rdev_count = 0;
> +	rswitch_for_all_ports(priv, rdev) {
> +		if (rdev_for_l3_offload(rdev)) {
> +			l3_rdev_count++;
> +			l3_ports_mask &= ~BIT(rdev->port);
> +		}
> +	}
> +
> +	l3_offload_enable_cond = (l3_rdev_count >= 2);
> +
> +#define FWPC0_L3_MASK (FWPC0_LTHTA | FWPC0_IP4UE | FWPC0_IP4TE | FWPC0_IP4OE)
> +	rswitch_for_all_ports(priv, rdev) {
> +		if (rdev_for_l3_offload(rdev) && l3_offload_enable_cond) {
> +			/* Update allowed offload destinations even for ports
> +			 * with l3 offload enabled earlier.
> +			 *
> +			 * Allow offload routing to self for hw port.
> +			 */
> +			rswitch_modify(priv->addr, FWPC1(rdev->port),
> +				       FWPC1_LTHFW_MASK,
> +				       FIELD_PREP(FWPC1_LTHFW_MASK, l3_ports_mask));
> +			if (!rdev->l3_offload_enabled) {
> +				rswitch_modify(priv->addr, FWPC0(rdev->port),
> +					       0,
> +					       FWPC0_L3_MASK);
> +				rdev->l3_offload_enabled = 1;
> +				netdev_info(rdev->ndev, "starting l3 offload\n");

This, and the other netdev_info calls should probably be debug.

> +static bool rswitch_l23update_hw_op(struct rswitch_private *priv,
> +				    struct rswitch_l23update *update,
> +				    bool install)
> +{
> +	u8 *dst_mac = update->spec.dst_mac;
> +	u32 val;
> +	int ret;
> +
> +	val = FIELD_PREP(FWL23URL0_RN, update->index) |
> +	      FIELD_PREP(FWL23URL0_PV,
> +			 install ? GENMASK(RSWITCH_NUM_AGENTS - 1, 0) : 0);
> +	iowrite32(val, priv->addr + FWL23URL0);
> +
> +	val = FWL23URL1_TTLU |
> +	      FWL23URL1_MSAU |
> +	      FWL23URL1_MDAU |
> +	      (dst_mac[0] << 8) | (dst_mac[1] << 0);
> +	iowrite32(val, priv->addr + FWL23URL1);
> +
> +	val = (dst_mac[2] << 24) | (dst_mac[3] << 16) |
> +	      (dst_mac[4] << 8)  | (dst_mac[5] << 0);
> +	iowrite32(val, priv->addr + FWL23URL2);
> +
> +	iowrite32(0, priv->addr + FWL23URL3);
> +
> +	/* Rule write starts after writing to FWL23URL3 */
> +
> +	ret = rswitch_reg_wait(priv->addr, FWL23URLR, FWL23URLR_L, 0);
> +	if (ret) {
> +		dev_err(&priv->pdev->dev, "timeout writing l23_update\n");
> +		return false;

Why not make this an int function and return -ETIMEDOUT?

> +static bool rmon_ipv4_dst_offload_hw_op(struct rswitch_route_monitor *rmon,
> +					struct rmon_ipv4_dst_offload *offload,
> +					u8 frame_type, bool install)

Why all this bool functions? Especially when you have calls returning
error codes you are throwing away.

> +static struct rswitch_l23update *rswitch_get_l23update(struct rswitch_private *priv,
> +						       struct rswitch_l23update_spec *spec)
> +{
> +	struct rswitch_l23update *update;
> +
> +	spin_lock(&priv->l3_lock);
> +
> +	list_for_each_entry(update, &priv->l23_update_list, list) {
> +		if (rswitch_l23update_matches_spec(update, spec)) {
> +			update->use_count++;
> +			goto out;
> +		}
> +	}
> +
> +	update = kzalloc(sizeof(*update), GFP_ATOMIC);
> +	if (!update)
> +		goto out;
> +
> +	update->use_count = 1;
> +	update->spec = *spec;
> +	update->index = find_first_zero_bit(priv->l23_update_bitmap,
> +					    RSWITCH_MAX_NUM_RRULE);
> +	if (update->index == RSWITCH_MAX_NUM_RRULE) {
> +		dev_err_ratelimited(&priv->pdev->dev,
> +				    "out of l23_update entries\n");
> +		/* FIXME: trigger expire? */
> +		goto no_free_bit;
> +	}
> +	set_bit(update->index, priv->l23_update_bitmap);
> +
> +	if (!rswitch_l23update_hw_op(priv, update, true))
> +		goto hw_op_failed;
> +
> +	list_add(&update->list, &priv->l23_update_list);
> +out:
> +	spin_unlock(&priv->l3_lock);
> +
> +	return update;
> +
> +hw_op_failed:
> +	clear_bit(update->index, priv->l23_update_bitmap);
> +no_free_bit:
> +	kfree(update);
> +	update = NULL;
> +	goto out;

It is pretty unusual to have a backwards goto, especially in error
handling. This is one case where a scoped_guard() might make sense.

	Andrew

