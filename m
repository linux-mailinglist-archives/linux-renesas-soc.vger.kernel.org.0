Return-Path: <linux-renesas-soc+bounces-23220-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C521BE80A1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 12:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 08AB835AF3C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 10:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE9326FA50;
	Fri, 17 Oct 2025 10:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wKH0rRrt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E19A2D595F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 10:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760696539; cv=none; b=IRPI/gO2lIDxKVFyu7q6YVWiX0KvPkciiZzRpTVZ4KMtF4cmlMNiUCHHt9HrNN+GrNv3gMlziAoHq0fLE2wZZ0oodFVqoaUxp5/BLiai0WFwdPaPjGkINips1vXQ27SVN4JjOKJzz66GEtVYrbj91BkyIL0OVf4YI1VLK6kFpXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760696539; c=relaxed/simple;
	bh=LTAr1hY9HCJyR9LS20fLPV2AY9+9mh+4PjZlB1H/b04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yb6yetWYxUIbimPkWzHtEE8Sm0CDIgO1a3sl/IrB7N3yoAd/QAHnyH9xFWEAOnZ9Fks80qN/ESxGFKpRusqjuX6tOGtoK7oAt+IV7PGRR4GUb3h3PTrNU7HxGTCpYLXg5UXMfXIxjqwzshcacRgXR/ULBl0R4b6C0KmcBVVLeuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wKH0rRrt; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <438f350d-df66-4d51-8827-c686ef0f8da9@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760696534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M7LSmPEchHZRoXeuYfgrqGXC5NdIshmVzOumLFM3Pgk=;
	b=wKH0rRrtB4vow9oxFnRDGJZ1EQNHsicS7o1uaefQBLONOA4+wLYvu5BTXxcrvyckvryCUk
	PBlT1wlw2UqJJEpgM3kr7HVw6zlpmqV9n1OE0dziJUNB/9X35S/t2WmWO2nGBCjMnazMAH
	UvqwuiiUW0PsGHeyBI0Ua8llyZl2yrg=
Date: Fri, 17 Oct 2025 11:22:06 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next 6/6] net: hns3: add hwtstamp_get/hwtstamp_set ops
To: Simon Horman <horms@kernel.org>
Cc: Jian Shen <shenjian15@huawei.com>, Salil Mehta <salil.mehta@huawei.com>,
 Jijie Shao <shaojijie@huawei.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Sunil Goutham <sgoutham@marvell.com>, Geetha sowjanya <gakula@marvell.com>,
 Subbaraya Sundeep <sbhatta@marvell.com>,
 Bharat Bhushan <bbhushan2@marvell.com>, Tariq Toukan <tariqt@nvidia.com>,
 Brett Creeley <brett.creeley@amd.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Paul Barker <paul@pbarker.dev>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-renesas-soc@vger.kernel.org, Richard Cochran
 <richardcochran@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Jacob Keller <jacob.e.keller@intel.com>, netdev@vger.kernel.org
References: <20251016180727.3511399-1-vadim.fedorenko@linux.dev>
 <20251016180727.3511399-7-vadim.fedorenko@linux.dev>
 <aPIJIhSXUPODqfZH@horms.kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <aPIJIhSXUPODqfZH@horms.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 17/10/2025 10:15, Simon Horman wrote:
> On Thu, Oct 16, 2025 at 06:07:27PM +0000, Vadim Fedorenko wrote:
> 
> ...
> 
>> diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c b/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
>> index bfa5568baa92..1e9388f1115c 100644
>> --- a/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
>> +++ b/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
>> @@ -2419,6 +2419,35 @@ static int hns3_nic_do_ioctl(struct net_device *netdev,
>>   	return h->ae_algo->ops->do_ioctl(h, ifr, cmd);
>>   }
>>   
>> +static int hns3_nic_hwtstamp_get(struct net_device *netdev,
>> +				 struct kernel_hwtstamp_config *config)
>> +{
>> +	struct hnae3_handle *h = hns3_get_handle(netdev);
>> +
>> +	if (!netif_running(netdev))
>> +		return -EINVAL;
>> +
>> +	if (!h->ae_algo->ops->hwtstamp_get)
>> +		return -EOPNOTSUPP;
>> +
>> +	return h->ae_algo->ops->hwtstamp_get(h, config);
>> +}
>> +
>> +static int hns3_nic_hwtstamp_set(struct net_device *netdev,
>> +				 struct kernel_hwtstamp_config *config,
>> +				 struct netlink_ext_ack *extack)
>> +{
>> +	struct hnae3_handle *h = hns3_get_handle(netdev);
>> +
>> +	if (!netif_running(netdev))
>> +		return -EINVAL;
>> +
>> +	if (!h->ae_algo->ops->hwtstamp_set)
>> +		return -EOPNOTSUPP;
>> +
>> +	return h->ae_algo->ops->hwtstamp_set(h, config, extack);
>> +}
>> +
>>   static int hns3_nic_set_features(struct net_device *netdev,
>>   				 netdev_features_t features)
>>   {
> 
> Hi Vadim,
> 
> I'm sorry to raise this topic again.
> But I see the functions above flagged as unused with
> this patch applied (for allmodconfig builds).
> 
> ...

Hi Simon,

looks like actual .ndo_hwtstamp_get/.ndo_hwtstamp_set initialization is
missing... dunno how that happened, but v2 will be on the list once 24h
wait period is passed.
Thanks for flagging the issue!

