Return-Path: <linux-renesas-soc+bounces-19193-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C9CAF8CA4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 10:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 307213B997A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 08:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6FA32877FB;
	Fri,  4 Jul 2025 08:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="YUaiGMTQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E9E2882B4;
	Fri,  4 Jul 2025 08:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751618648; cv=none; b=LmQBB9ljXOX2oNkxEGd/ZTfdA27Cp4YVjjR/rBx8CAZ2CFd09/gzHI9GPklIfws6YCBwSndly9cGD+GSGk7R6QiS8rYFDJthCEKGEgb7nvnuYidXFGSYbRsfNqyK/UYgHAefn1cRW6gHGtWfptq9MVeTIpmV2hg67gnnQAqJVbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751618648; c=relaxed/simple;
	bh=tcFwFWGqls2SdkurcsPPyPEgQkPDoePAIZQUq3F9gqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G4PFMMBGTDSTGdUKeqNdcceLZpJaqCHGmDgyqSV+LueP1gyl0vvzbQQRP3PfeVK4xUvRsWoMinS++gdG9c+vwwBF2XA1DYvXTfB1Amo0drbHjUcAGxEWn+nzz44VQH6UfngQk60HjDbcElBSZYXDyhSCcLOe4ED3DrxVPLdYpgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=YUaiGMTQ; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=IXf4ILRvH2Z89leQYBWzds67MgWGXLFVCkidfBxBrfM=; b=YUaiGMTQMIsC+Ql1awP9hWY9LA
	dYoyWDsbYWHRCdKJkucPqozGdhDrunqCOteqCdlscCsQWEgALUGdL4MACcKbzTmZJgI9FTHA8FBc7
	O3Ko4FWSA3hZTdopbni4GPlDWNURKY72hGDVdMd1QBBe6T4jb1gYkLxjphaweZJGMtp0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uXc1V-000Bhz-A1; Fri, 04 Jul 2025 10:43:57 +0200
Date: Fri, 4 Jul 2025 10:43:57 +0200
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
Subject: Re: [PATCH 2/3] net: renesas: rswitch: add offloading for L2
 switching
Message-ID: <64e7de61-c4ed-4b42-83c6-5001a9d28ec0@lunn.ch>
References: <20250704-add_l2_switching-v1-0-ff882aacb258@renesas.com>
 <20250704-add_l2_switching-v1-2-ff882aacb258@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-add_l2_switching-v1-2-ff882aacb258@renesas.com>

>  #include <linux/platform_device.h>
> +#include <linux/phy.h>
> +

It seems odd that a patch adding L2 support needs to touch PHYs?

> @@ -994,10 +1018,18 @@ struct rswitch_device {
>  	DECLARE_BITMAP(ts_skb_used, TS_TAGS_PER_PORT);
>  	bool disabled;
>  
> +	struct list_head list;
> +
>  	int port;
>  	struct rswitch_etha *etha;
>  	struct device_node *np_port;
>  	struct phy *serdes;
> +
> +	struct net_device *brdev;	/* master bridge device */

How many ports does this device have? If it is just two, this might
work. But for a multi-port device, you need to keep this in the port
structure.

> +bool is_rdev(const struct net_device *ndev);
> +void rswitch_modify(void __iomem *addr, enum rswitch_reg reg, u32 clear, u32 set);

Are these actually needed? It seems like they could be local
functions.

> +	if (offload_brdev && !priv->offload_brdev)
> +		dev_info(&priv->pdev->dev, "starting l2 offload for %s\n",
> +			 netdev_name(offload_brdev));
> +	else if (!offload_brdev && priv->offload_brdev)
> +		dev_info(&priv->pdev->dev, "stopping l2 offload for %s\n",
> +			 netdev_name(priv->offload_brdev));

Please don't spam the log like this dev_dbg() maybe.

> @@ -128,6 +134,14 @@ static void rswitch_fwd_init(struct rswitch_private *priv)
>  		iowrite32(0, priv->addr + FWPBFC(i));
>  	}
>  
> +	/* Configure MAC table aging */
> +	rswitch_modify(priv->addr, FWMACAGUSPC, FWMACAGUSPC_MACAGUSP,
> +		       FIELD_PREP(FWMACAGUSPC_MACAGUSP, 0x140));
> +
> +	reg_val = FIELD_PREP(FWMACAGC_MACAGT, RSW_AGEING_TIME);
> +	reg_val |= FWMACAGC_MACAGE | FWMACAGC_MACAGSL;
> +	iowrite32(reg_val, priv->addr + FWMACAGC);
> +

Please pull ageing out into a patch of its own.

    Andrew

---
pw-bot: cr

