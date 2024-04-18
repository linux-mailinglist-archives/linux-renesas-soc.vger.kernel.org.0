Return-Path: <linux-renesas-soc+bounces-4719-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AAC8AA21B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Apr 2024 20:35:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DBDA1F217AE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Apr 2024 18:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8D3316C438;
	Thu, 18 Apr 2024 18:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h3ijDpKv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7133D62;
	Thu, 18 Apr 2024 18:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713465349; cv=none; b=bCV0SHw8RlAztifAAUPLhozCJOltmt8CKCKiWuzOWbFVQ36M/taOjGKGhw7KoFYpTsUrSL2HfKhEcGi6FIiSzrcepVdbSz9On1fjb45bNh7ygqVMb3fTT/veghrGgxGW5ljAfWNo284YGjzBZDHrmj7R8SpWZsVhbrJgv/ShVGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713465349; c=relaxed/simple;
	bh=KV8JSooMa4OX5xetB7ccSt0dadeQ9ph7gDSPTOEbIr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o3vwMK2av81E06kad6thoPQgJ9dJumW2P6daIu18aG1PRPRDsoeehww2Lkgy6f8Z9d3xyxS5/7pSCsZVEvG0b/C7h6hIru/T/FY6uQ7LxfTS6gnRGEFZvLure1YB+2SAOmFsYg4t58Dc8KEiy2GpBNJCmsyqx0CH0Dy75hC4znE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h3ijDpKv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C2FAC113CC;
	Thu, 18 Apr 2024 18:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713465349;
	bh=KV8JSooMa4OX5xetB7ccSt0dadeQ9ph7gDSPTOEbIr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h3ijDpKvaNZHUWrm63Hqtr+tleaf0dH/AKVB7YM8gMVIkLHlxUtwlGaTTosKy0CSE
	 Ugn89EnNrYV8eS6vpwy+AQQE9MEkcr2uUop6UeZ+qxAof+1Dj25QHfRToCzeGmGeMz
	 6eAB6bTguYXOxsKalXfJa8/xoKF88dr+DCQ5nNNQmtRqr2XVIfYCxufuDkefZQwhbS
	 essau1LCs7WVQe5XZaZknyA9eJMsFW9eCCUlBAW8WKTqqeRriz+9qstUF1q2rvT94d
	 vCebvmnrTd6Bq41ZytM6ZNTLsvfJqVCvLRWy6VHZKcL0F1kZvcjS4yeaJzSg1Wbthz
	 UvgLOHreTx2ig==
Date: Thu, 18 Apr 2024 19:35:45 +0100
From: Simon Horman <horms@kernel.org>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <20240418183545.GN3975545@kernel.org>
References: <20240414135937.1139611-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240414135937.1139611-1-niklas.soderlund+renesas@ragnatech.se>

On Sun, Apr 14, 2024 at 03:59:37PM +0200, Niklas Söderlund wrote:
> Add initial support for Renesas Ethernet-TSN End-station device of R-Car
> V4H. The Ethernet End-station can connect to an Ethernet network using a
> 10 Mbps, 100 Mbps, or 1 Gbps full-duplex link via MII/GMII/RMII/RGMII.
> Depending on the connected PHY.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

...

> +static int rtsn_mii_register(struct rtsn_private *priv)
> +{
> +	struct platform_device *pdev = priv->pdev;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *mdio_node;
> +	struct mii_bus *mii;
> +	int ret;
> +
> +	mii = mdiobus_alloc();
> +	if (!mii)
> +		return -ENOMEM;
> +
> +	mdio_node = of_get_child_by_name(dev->of_node, "mdio");
> +	if (!mdio_node) {
> +		ret = -ENODEV;
> +		goto out_free_bus;
> +	};

nit: the ';' is not needed on the line above.

Flagged by Coccinelle.

> +
> +	mii->name = "rtsn_mii";
> +	sprintf(mii->id, "%s-%x", pdev->name, pdev->id);
> +	mii->priv = priv;
> +	mii->read = rtsn_mii_read;
> +	mii->write = rtsn_mii_write;
> +	mii->read_c45 = rtsn_mii_read_c45;
> +	mii->write_c45 = rtsn_mii_write_c45;
> +	mii->parent = dev;
> +
> +	ret = of_mdiobus_register(mii, mdio_node);
> +	of_node_put(mdio_node);
> +	if (ret)
> +		goto out_free_bus;
> +
> +	priv->mii = mii;
> +
> +	return 0;
> +
> +out_free_bus:
> +	mdiobus_free(mii);
> +	return ret;
> +}

