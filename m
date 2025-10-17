Return-Path: <linux-renesas-soc+bounces-23208-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 820A0BE7C65
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 11:34:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4181E1898612
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 09:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6C9322A3E;
	Fri, 17 Oct 2025 09:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P2G/drdh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F002040B6;
	Fri, 17 Oct 2025 09:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760692521; cv=none; b=u7oes2rsbMdLoWN4i4VoVGe5IY2NnMteWfRX70BEpwkRdrIoeS4sbeK5SSXWmUYoS6JOSZLscM+tbyS2SRLIEeu/uTUtTb9qIqq4PpPiXzc6T4OeEmCguPJdsZ6VjtliyDbsUPQ5NbEJ16srrVndKA80CsxVIMA27AEDYPFT5ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760692521; c=relaxed/simple;
	bh=Q5JTxNyJdR4mSqYaTrrvOC7Y1wr49c6ncBCKQKsLssM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YXGXmOZPkjTSKM6YEt0nqw/gLH+QL/JR+JtYXSS2V2yot60NNtogngBEIj8cizlP0NCq0CQYx9Rcsq14w9bD0NahidcZRPK8itcR1BihWSthO8idKXTd1xvrzgcsTc6xkL2mHQYvyCEdU6Z5gCVpJ6IG+neyYzj6SRKyKQSG6FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P2G/drdh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CB40C4CEFE;
	Fri, 17 Oct 2025 09:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760692521;
	bh=Q5JTxNyJdR4mSqYaTrrvOC7Y1wr49c6ncBCKQKsLssM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P2G/drdhwo80zFf04Y6OqVEhkcMPt8X81ww4Z/d0gSuDPDLgGCS+UyV/UTJK8DeoO
	 ydZSlKgHkbzV6zezwKRjwZJ/iFW4LmBwYCuOYNfMvbdXm1fbBhgyZATDZNgAW7Telu
	 M5Ch9bvw13xk7iD9iExX2L2ng3iSigVv0bfaaicudpJ7JH7ahccLtxPYxKXJlLBiQ9
	 rGIkJ75TGfojZe7reKbt8TNPPx6rXb6jGqP4RF96uVXUWyIVTjKzWOMsIcdOtSthHq
	 KTcEA11NQo0XJDvdhqctS0BxGTy0u3fVebgRYllK2tUkdM66xkCdLgdgRdoI6wdTD0
	 udLn1t0VRsWZw==
Date: Fri, 17 Oct 2025 10:15:14 +0100
From: Simon Horman <horms@kernel.org>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Jian Shen <shenjian15@huawei.com>, Salil Mehta <salil.mehta@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Brett Creeley <brett.creeley@amd.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	Richard Cochran <richardcochran@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Jacob Keller <jacob.e.keller@intel.com>, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 6/6] net: hns3: add hwtstamp_get/hwtstamp_set ops
Message-ID: <aPIJIhSXUPODqfZH@horms.kernel.org>
References: <20251016180727.3511399-1-vadim.fedorenko@linux.dev>
 <20251016180727.3511399-7-vadim.fedorenko@linux.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016180727.3511399-7-vadim.fedorenko@linux.dev>

On Thu, Oct 16, 2025 at 06:07:27PM +0000, Vadim Fedorenko wrote:

...

> diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c b/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
> index bfa5568baa92..1e9388f1115c 100644
> --- a/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
> +++ b/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
> @@ -2419,6 +2419,35 @@ static int hns3_nic_do_ioctl(struct net_device *netdev,
>  	return h->ae_algo->ops->do_ioctl(h, ifr, cmd);
>  }
>  
> +static int hns3_nic_hwtstamp_get(struct net_device *netdev,
> +				 struct kernel_hwtstamp_config *config)
> +{
> +	struct hnae3_handle *h = hns3_get_handle(netdev);
> +
> +	if (!netif_running(netdev))
> +		return -EINVAL;
> +
> +	if (!h->ae_algo->ops->hwtstamp_get)
> +		return -EOPNOTSUPP;
> +
> +	return h->ae_algo->ops->hwtstamp_get(h, config);
> +}
> +
> +static int hns3_nic_hwtstamp_set(struct net_device *netdev,
> +				 struct kernel_hwtstamp_config *config,
> +				 struct netlink_ext_ack *extack)
> +{
> +	struct hnae3_handle *h = hns3_get_handle(netdev);
> +
> +	if (!netif_running(netdev))
> +		return -EINVAL;
> +
> +	if (!h->ae_algo->ops->hwtstamp_set)
> +		return -EOPNOTSUPP;
> +
> +	return h->ae_algo->ops->hwtstamp_set(h, config, extack);
> +}
> +
>  static int hns3_nic_set_features(struct net_device *netdev,
>  				 netdev_features_t features)
>  {

Hi Vadim,

I'm sorry to raise this topic again.
But I see the functions above flagged as unused with
this patch applied (for allmodconfig builds).

...

