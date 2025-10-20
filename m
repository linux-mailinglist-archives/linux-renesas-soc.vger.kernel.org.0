Return-Path: <linux-renesas-soc+bounces-23315-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46ABDBF0749
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 12:13:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FFD33A92BC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 10:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42F152F6566;
	Mon, 20 Oct 2025 10:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gerykyDj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EDF23D7D4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Oct 2025 10:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760955084; cv=none; b=a82lLR9tT5xxur2wS6BBze5dbC63MhzlNUdpv034nya42wYrjmoj/0BoWZ7ILq5AnLBthfYt5zr6TKqlEFasyc6SLDLuW56FrP13P+R4+frg03pJX0Ddib2PM5C6mjfxJ20ZB5n8yu5a/5KTKWd1aWhnk1JBuSmt/EaiFpIjdrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760955084; c=relaxed/simple;
	bh=7pfJkiGmSlPlLHcAFzE7f6VXx75QP4sZ3bCa7ZW9xlo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H3nS2iSq7Usx7LQtK8uU5Q2bG+E64gn/1gy8cUh3mIT51ko1ZKkl6EVc0c9+suxWzdhkBwMEESFIER4zVC31Yibqv4I7DWhqbrbdjpCuOiAEo36ydsmt/ddqCqmag3flGwjpxSR7XKcvfeJvxOHdDJ1Prgf/4G66qG7qQN6eHyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gerykyDj; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4283be7df63so973270f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Oct 2025 03:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760955080; x=1761559880; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d2hQt4FeUy+mdt79tWA4gsLiqmYK4ftLchdR+o5/D3U=;
        b=gerykyDj0m6qnQjLpPqkYn9aHm6JEh0wmm6NyuoN13qSrUloz1WHPNe7jC6yuYVnD8
         CjyVUmdW+7ysjKLskeyfIcr82a//t711ljp6rv9KKfCkpA4LCqAcult7XC/Sm+ShZ+CK
         U08LU4vdqTPN2RBSk6aZaPRiPoPbHznBqoPwV9UFDegrgaZHqPF7XGfcGfEziad361yQ
         b604xsDmQSVSb19hen6kXEufVG32lowH56/AfhKiykBJRKaM5Ncnx27yrd4rNB/AkYwn
         QqJkNXF4fYN9Tmf/aTRqWrG5gAIh09qyKUiWhy9/msruRdJnqxZFkrAc5vKUpjloBAmI
         z2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760955080; x=1761559880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d2hQt4FeUy+mdt79tWA4gsLiqmYK4ftLchdR+o5/D3U=;
        b=p4/Ew/aLUqsTWEv1hl/Qw+C8umag6wcQ5aPQVa3L+IyHbx6u7Rn2M287RlYHt1yD01
         lsQt7eGBVYFQsK/PhVlbMLd02Ed9xOiFHcGk8jWQHEk4pXFneezzui4s1RaMJ8TTPGnD
         aoPHogyrIxdTljquY9ZdUOyGx/rgOehKp/2u7bHm81m97iNgsvHi1yibiDzzKSWs1EXe
         BDIhecpIHz5e9320LL8MZv0VHeG+xgNoLmDCljmyRauPg7VKTx2F+dWD6gWvFue2KFfC
         xHWDhUdFPVyrSZeuOFyH8RWViDXmM+52JorVZHt4nB/djzs+bR/IMWMjoyXoU/j1r4yK
         +v1w==
X-Gm-Message-State: AOJu0YwQaa0LINVRrc41NVwYEYaLEXeOqnja0iKQZtFHmEwvctw9s5SC
	n/Rx2V8EHJDggPV7GxphGewC6PKwxUk4hMWa0l8fMFw83F4GmXyp1sBm
X-Gm-Gg: ASbGncshLBhV5Nn9kFaaXXNEzRCabHTkOckiRDvKybCqUE5+cLASw+EOJbqi4YETD07
	38fEzOi9Swop1MLFRNF3g9bwOU2OORQ4uQKeqbAE6IzUTlUD6ayZH7r+by9yqkuZye1aRxUpfmz
	XD06lrvlMfP8a7v/FIB74IoM2K9rtY8CfD+s1KFkivY/JxHeJ1/S12aLEgYEtZ/xZ2vO0Jg9Ay5
	XJvQvH5CaVttMGqtgtxuZggKWta5qVGXtn2Jq8ColzuaAhpgcdVa7wzD9B1DHW7wDPd/2bFoA+X
	cVUjIprrdHdL8AnRncyBYoHJ9bXLcYczI2UNOfLo5p93KxJk6HFukCQdDEv4tXf8I/loq2y44ps
	0mlAnOj3ZHqaYvPNZYt8QFyUUh3N0Txp7rmzGqcM7LAuMcDGt5jYRv0/GUH6hiyTD2kLAsg/JlI
	rpz4zeoZf0iruLP7JIJ1OADKpSWJM=
X-Google-Smtp-Source: AGHT+IGVaf+fAM0cUhSVuQnBzC4rVA3fC4GtU67+mN4XifylXplYD5KoGzOBFHfPgxnuFVrl3er2Gg==
X-Received: by 2002:a05:6000:2f83:b0:3c7:df1d:3d9 with SMTP id ffacd0b85a97d-42704d99325mr9086975f8f.39.1760955079997;
        Mon, 20 Oct 2025 03:11:19 -0700 (PDT)
Received: from [10.80.3.86] ([72.25.96.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00b9fa8sm14713866f8f.38.2025.10.20.03.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 03:11:19 -0700 (PDT)
Message-ID: <75c45f72-a0bf-4b72-8ba2-5b4c8073f21d@gmail.com>
Date: Mon, 20 Oct 2025 13:11:17 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/6] mlx4: convert to ndo_hwtstamp API
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Jian Shen <shenjian15@huawei.com>, Salil Mehta <salil.mehta@huawei.com>,
 Jijie Shao <shaojijie@huawei.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Sunil Goutham <sgoutham@marvell.com>, Geetha sowjanya <gakula@marvell.com>,
 Subbaraya Sundeep <sbhatta@marvell.com>,
 Bharat Bhushan <bbhushan2@marvell.com>, Tariq Toukan <tariqt@nvidia.com>,
 Brett Creeley <brett.creeley@amd.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Paul Barker <paul@pbarker.dev>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Simon Horman <horms@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>, netdev@vger.kernel.org
References: <20251017182128.895687-1-vadim.fedorenko@linux.dev>
 <20251017182128.895687-3-vadim.fedorenko@linux.dev>
Content-Language: en-US
From: Tariq Toukan <ttoukan.linux@gmail.com>
In-Reply-To: <20251017182128.895687-3-vadim.fedorenko@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 17/10/2025 21:21, Vadim Fedorenko wrote:
> Convert driver to use .ndo_hwtstamp_get()/.ndo_hwtstamp_set() callbacks.
> mlx4_en_ioctl() becomes empty, remove it.
> 
> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
> Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
> ---
>   .../net/ethernet/mellanox/mlx4/en_netdev.c    | 61 ++++++++-----------
>   drivers/net/ethernet/mellanox/mlx4/mlx4_en.h  |  6 +-
>   2 files changed, 28 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mellanox/mlx4/en_netdev.c b/drivers/net/ethernet/mellanox/mlx4/en_netdev.c
> index 308b4458e0d4..514f29f241c3 100644
> --- a/drivers/net/ethernet/mellanox/mlx4/en_netdev.c
> +++ b/drivers/net/ethernet/mellanox/mlx4/en_netdev.c
> @@ -2420,21 +2420,21 @@ static int mlx4_en_change_mtu(struct net_device *dev, int new_mtu)
>   	return 0;
>   }
>   
> -static int mlx4_en_hwtstamp_set(struct net_device *dev, struct ifreq *ifr)
> +static int mlx4_en_hwtstamp_set(struct net_device *dev,
> +				struct kernel_hwtstamp_config *config,
> +				struct netlink_ext_ack *extack)
>   {
>   	struct mlx4_en_priv *priv = netdev_priv(dev);
>   	struct mlx4_en_dev *mdev = priv->mdev;
> -	struct hwtstamp_config config;
> -
> -	if (copy_from_user(&config, ifr->ifr_data, sizeof(config)))
> -		return -EFAULT;
>   
>   	/* device doesn't support time stamping */
> -	if (!(mdev->dev->caps.flags2 & MLX4_DEV_CAP_FLAG2_TS))
> +	if (!(mdev->dev->caps.flags2 & MLX4_DEV_CAP_FLAG2_TS)) {
> +		NL_SET_ERR_MSG(extack, "device doesn't support time stamping");

Encouraged to add more extack messages, for error flows below.
WDYT?

>   		return -EINVAL;
> +	}
>   
>   	/* TX HW timestamp */
> -	switch (config.tx_type) {
> +	switch (config->tx_type) {
>   	case HWTSTAMP_TX_OFF:
>   	case HWTSTAMP_TX_ON:
>   		break;
> @@ -2443,7 +2443,7 @@ static int mlx4_en_hwtstamp_set(struct net_device *dev, struct ifreq *ifr)
>   	}
>   
>   	/* RX HW timestamp */
> -	switch (config.rx_filter) {
> +	switch (config->rx_filter) {
>   	case HWTSTAMP_FILTER_NONE:
>   		break;
>   	case HWTSTAMP_FILTER_ALL:
> @@ -2461,39 +2461,27 @@ static int mlx4_en_hwtstamp_set(struct net_device *dev, struct ifreq *ifr)
>   	case HWTSTAMP_FILTER_PTP_V2_SYNC:
>   	case HWTSTAMP_FILTER_PTP_V2_DELAY_REQ:
>   	case HWTSTAMP_FILTER_NTP_ALL:
> -		config.rx_filter = HWTSTAMP_FILTER_ALL;
> +		config->rx_filter = HWTSTAMP_FILTER_ALL;
>   		break;
>   	default:
>   		return -ERANGE;
>   	}
>   
>   	if (mlx4_en_reset_config(dev, config, dev->features)) {
> -		config.tx_type = HWTSTAMP_TX_OFF;
> -		config.rx_filter = HWTSTAMP_FILTER_NONE;
> +		config->tx_type = HWTSTAMP_TX_OFF;
> +		config->rx_filter = HWTSTAMP_FILTER_NONE;
>   	}
>   
> -	return copy_to_user(ifr->ifr_data, &config,
> -			    sizeof(config)) ? -EFAULT : 0;
> +	return 0;
>   }
>   
> -static int mlx4_en_hwtstamp_get(struct net_device *dev, struct ifreq *ifr)
> +static int mlx4_en_hwtstamp_get(struct net_device *dev,
> +				struct kernel_hwtstamp_config *config)
>   {
>   	struct mlx4_en_priv *priv = netdev_priv(dev);
>   
> -	return copy_to_user(ifr->ifr_data, &priv->hwtstamp_config,
> -			    sizeof(priv->hwtstamp_config)) ? -EFAULT : 0;
> -}
> -
> -static int mlx4_en_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
> -{
> -	switch (cmd) {
> -	case SIOCSHWTSTAMP:
> -		return mlx4_en_hwtstamp_set(dev, ifr);
> -	case SIOCGHWTSTAMP:
> -		return mlx4_en_hwtstamp_get(dev, ifr);
> -	default:
> -		return -EOPNOTSUPP;
> -	}
> +	*config = priv->hwtstamp_config;
> +	return 0;
>   }
>   
>   static netdev_features_t mlx4_en_fix_features(struct net_device *netdev,
> @@ -2560,7 +2548,7 @@ static int mlx4_en_set_features(struct net_device *netdev,
>   	}
>   
>   	if (reset) {
> -		ret = mlx4_en_reset_config(netdev, priv->hwtstamp_config,
> +		ret = mlx4_en_reset_config(netdev, &priv->hwtstamp_config,
>   					   features);
>   		if (ret)
>   			return ret;
> @@ -2844,7 +2832,6 @@ static const struct net_device_ops mlx4_netdev_ops = {
>   	.ndo_set_mac_address	= mlx4_en_set_mac,
>   	.ndo_validate_addr	= eth_validate_addr,
>   	.ndo_change_mtu		= mlx4_en_change_mtu,
> -	.ndo_eth_ioctl		= mlx4_en_ioctl,
>   	.ndo_tx_timeout		= mlx4_en_tx_timeout,
>   	.ndo_vlan_rx_add_vid	= mlx4_en_vlan_rx_add_vid,
>   	.ndo_vlan_rx_kill_vid	= mlx4_en_vlan_rx_kill_vid,
> @@ -2858,6 +2845,8 @@ static const struct net_device_ops mlx4_netdev_ops = {
>   	.ndo_features_check	= mlx4_en_features_check,
>   	.ndo_set_tx_maxrate	= mlx4_en_set_tx_maxrate,
>   	.ndo_bpf		= mlx4_xdp,
> +	.ndo_hwtstamp_get	= mlx4_en_hwtstamp_get,
> +	.ndo_hwtstamp_set	= mlx4_en_hwtstamp_set,
>   };
>   
>   static const struct net_device_ops mlx4_netdev_ops_master = {
> @@ -3512,7 +3501,7 @@ int mlx4_en_init_netdev(struct mlx4_en_dev *mdev, int port,
>   }
>   
>   int mlx4_en_reset_config(struct net_device *dev,
> -			 struct hwtstamp_config ts_config,
> +			 struct kernel_hwtstamp_config *ts_config,
>   			 netdev_features_t features)
>   {
>   	struct mlx4_en_priv *priv = netdev_priv(dev);
> @@ -3522,8 +3511,8 @@ int mlx4_en_reset_config(struct net_device *dev,
>   	int port_up = 0;
>   	int err = 0;
>   
> -	if (priv->hwtstamp_config.tx_type == ts_config.tx_type &&
> -	    priv->hwtstamp_config.rx_filter == ts_config.rx_filter &&
> +	if (priv->hwtstamp_config.tx_type == ts_config->tx_type &&
> +	    priv->hwtstamp_config.rx_filter == ts_config->rx_filter &&
>   	    !DEV_FEATURE_CHANGED(dev, features, NETIF_F_HW_VLAN_CTAG_RX) &&
>   	    !DEV_FEATURE_CHANGED(dev, features, NETIF_F_RXFCS))
>   		return 0; /* Nothing to change */
> @@ -3542,7 +3531,7 @@ int mlx4_en_reset_config(struct net_device *dev,
>   	mutex_lock(&mdev->state_lock);
>   
>   	memcpy(&new_prof, priv->prof, sizeof(struct mlx4_en_port_profile));
> -	memcpy(&new_prof.hwtstamp_config, &ts_config, sizeof(ts_config));
> +	memcpy(&new_prof.hwtstamp_config, ts_config, sizeof(*ts_config));
>   
>   	err = mlx4_en_try_alloc_resources(priv, tmp, &new_prof, true);
>   	if (err)
> @@ -3560,7 +3549,7 @@ int mlx4_en_reset_config(struct net_device *dev,
>   			dev->features |= NETIF_F_HW_VLAN_CTAG_RX;
>   		else
>   			dev->features &= ~NETIF_F_HW_VLAN_CTAG_RX;
> -	} else if (ts_config.rx_filter == HWTSTAMP_FILTER_NONE) {
> +	} else if (ts_config->rx_filter == HWTSTAMP_FILTER_NONE) {
>   		/* RX time-stamping is OFF, update the RX vlan offload
>   		 * to the latest wanted state
>   		 */
> @@ -3581,7 +3570,7 @@ int mlx4_en_reset_config(struct net_device *dev,
>   	 * Regardless of the caller's choice,
>   	 * Turn Off RX vlan offload in case of time-stamping is ON
>   	 */
> -	if (ts_config.rx_filter != HWTSTAMP_FILTER_NONE) {
> +	if (ts_config->rx_filter != HWTSTAMP_FILTER_NONE) {
>   		if (dev->features & NETIF_F_HW_VLAN_CTAG_RX)
>   			en_warn(priv, "Turning off RX vlan offload since RX time-stamping is ON\n");
>   		dev->features &= ~NETIF_F_HW_VLAN_CTAG_RX;
> diff --git a/drivers/net/ethernet/mellanox/mlx4/mlx4_en.h b/drivers/net/ethernet/mellanox/mlx4/mlx4_en.h
> index ad0d91a75184..aab97694f86b 100644
> --- a/drivers/net/ethernet/mellanox/mlx4/mlx4_en.h
> +++ b/drivers/net/ethernet/mellanox/mlx4/mlx4_en.h
> @@ -388,7 +388,7 @@ struct mlx4_en_port_profile {
>   	u8 num_up;
>   	int rss_rings;
>   	int inline_thold;
> -	struct hwtstamp_config hwtstamp_config;
> +	struct kernel_hwtstamp_config hwtstamp_config;
>   };
>   
>   struct mlx4_en_profile {
> @@ -612,7 +612,7 @@ struct mlx4_en_priv {
>   	bool wol;
>   	struct device *ddev;
>   	struct hlist_head mac_hash[MLX4_EN_MAC_HASH_SIZE];
> -	struct hwtstamp_config hwtstamp_config;
> +	struct kernel_hwtstamp_config hwtstamp_config;
>   	u32 counter_index;
>   
>   #ifdef CONFIG_MLX4_EN_DCB
> @@ -780,7 +780,7 @@ void mlx4_en_ptp_overflow_check(struct mlx4_en_dev *mdev);
>   
>   int mlx4_en_moderation_update(struct mlx4_en_priv *priv);
>   int mlx4_en_reset_config(struct net_device *dev,
> -			 struct hwtstamp_config ts_config,
> +			 struct kernel_hwtstamp_config *ts_config,
>   			 netdev_features_t new_features);
>   void mlx4_en_update_pfc_stats_bitmap(struct mlx4_dev *dev,
>   				     struct mlx4_en_stats_bitmap *stats_bitmap,


