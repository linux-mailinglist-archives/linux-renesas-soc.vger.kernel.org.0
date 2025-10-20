Return-Path: <linux-renesas-soc+bounces-23316-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A897CBF080C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 12:19:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 439451890B6D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 10:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10282F656C;
	Mon, 20 Oct 2025 10:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kfTNZBEt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6C42F7AC0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Oct 2025 10:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760955320; cv=none; b=KgX8J70lLw+QPPOgaqmYnrZL+wvD6fO7nHoOixUdIpe9K7/GKKb1tdmtVEIFtZLS5+EKo/EdOZB+W4zX7E952C+mS7rRtKL3y9+ham4Jdo3gMAS3rtRsYgHw9IPvDAnJXoA0E/ze0XXTjysQXXUMgagESXwqJmcpCj1iyInxDeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760955320; c=relaxed/simple;
	bh=U1mJLdjEkdtcBx3vzwnuN+uEB8knowtkv5zMc9x9If4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EdsJl7iM6tOlq5fmqmFVGoC5IZWr2BmxS8Yr1p0AkrjZj/tnSMmhc+SAkAkRBlh3sI+1srAsm/gsStrD0P/OjtFNXMoXyLlmOFMPcIrQb9HlI6Joxpmp6kQTkqKqJaEFEoRY+oqAGUGO/KbnNMfII0uTVSq/ttsX+bbsVZmKyBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kfTNZBEt; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <4d1e7b89-9316-4956-96fc-0ce306637e3b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760955315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OILrdAE77ZQ1bUEc7LwkAndIjFA96VMe7uVTLNtcsaY=;
	b=kfTNZBEt6+y2AF0rX5tmN1jpoVPeiAU9gWSH90vJkgrkYDIqUy+vQh6KElPwLTs4wgRvDP
	hZXY0EI9zSUvx4RUUwD/RZfQB57jnCdS6rj6PJ1DSmpAgFVrVvk8v2k2kHeyTy54m5t2QK
	kcL34qaX/DLMT9/UdZ510gaePRtZbdU=
Date: Mon, 20 Oct 2025 11:15:12 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 2/6] mlx4: convert to ndo_hwtstamp API
To: Tariq Toukan <ttoukan.linux@gmail.com>, Jian Shen
 <shenjian15@huawei.com>, Salil Mehta <salil.mehta@huawei.com>,
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
 <75c45f72-a0bf-4b72-8ba2-5b4c8073f21d@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <75c45f72-a0bf-4b72-8ba2-5b4c8073f21d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 20/10/2025 11:11, Tariq Toukan wrote:
> 
> 
> On 17/10/2025 21:21, Vadim Fedorenko wrote:
>> Convert driver to use .ndo_hwtstamp_get()/.ndo_hwtstamp_set() callbacks.
>> mlx4_en_ioctl() becomes empty, remove it.
>>
>> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
>> Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
>> ---
>>   .../net/ethernet/mellanox/mlx4/en_netdev.c    | 61 ++++++++-----------
>>   drivers/net/ethernet/mellanox/mlx4/mlx4_en.h  |  6 +-
>>   2 files changed, 28 insertions(+), 39 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/mellanox/mlx4/en_netdev.c b/drivers/ 
>> net/ethernet/mellanox/mlx4/en_netdev.c
>> index 308b4458e0d4..514f29f241c3 100644
>> --- a/drivers/net/ethernet/mellanox/mlx4/en_netdev.c
>> +++ b/drivers/net/ethernet/mellanox/mlx4/en_netdev.c
>> @@ -2420,21 +2420,21 @@ static int mlx4_en_change_mtu(struct 
>> net_device *dev, int new_mtu)
>>       return 0;
>>   }
>> -static int mlx4_en_hwtstamp_set(struct net_device *dev, struct ifreq 
>> *ifr)
>> +static int mlx4_en_hwtstamp_set(struct net_device *dev,
>> +                struct kernel_hwtstamp_config *config,
>> +                struct netlink_ext_ack *extack)
>>   {
>>       struct mlx4_en_priv *priv = netdev_priv(dev);
>>       struct mlx4_en_dev *mdev = priv->mdev;
>> -    struct hwtstamp_config config;
>> -
>> -    if (copy_from_user(&config, ifr->ifr_data, sizeof(config)))
>> -        return -EFAULT;
>>       /* device doesn't support time stamping */
>> -    if (!(mdev->dev->caps.flags2 & MLX4_DEV_CAP_FLAG2_TS))
>> +    if (!(mdev->dev->caps.flags2 & MLX4_DEV_CAP_FLAG2_TS)) {
>> +        NL_SET_ERR_MSG(extack, "device doesn't support time stamping");
> 
> Encouraged to add more extack messages, for error flows below.
> WDYT?
It may potentially be a follow up work, but I decided to keep -ERANGE as
is because it's kinda self explanatory and is consistent across all the
drivers, while EINVAL is bit outlier and needs a bit more explanation.

