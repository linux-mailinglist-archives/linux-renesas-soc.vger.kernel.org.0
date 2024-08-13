Return-Path: <linux-renesas-soc+bounces-7818-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEE99506AC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Aug 2024 15:37:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 083AD289AE9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Aug 2024 13:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6AE19D069;
	Tue, 13 Aug 2024 13:37:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47E8019B59C;
	Tue, 13 Aug 2024 13:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723556248; cv=none; b=POWqfN9Q1nAYcKEAhrGQiXuhy7TDQ3dLVn3H3r4Co2LvIwJI9G2x3BiXtDnA+RUVZMCaaz4ItOWYlv1NdwuiGxYKV16FcHBATus3UaR8tikdyVz3bTbMnFpu1bhGew5TDw8iaNK9avudbw0uBsSIQ7ODqbUQWt0aVgzodE5zD24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723556248; c=relaxed/simple;
	bh=y4m0NGdxLvMzaZXv2Iq9+4JUPWPQslslsChnNMIA9QY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TrqsnWsGQ6VyGisSYPiPrKu1Ns2maDK9/wZZpvrNvODyn21FJoBqmsiVi+ZpLBsJFgXXWdjCSgQUUU5FNUQe1hmSYBGNZkq0bgBrphl9MlRm+A7OU1TxpKtJTeCkuIUHUUM30WhNeh3rK8eG4T34sfZKHzBJbYBFQGzSdVKSGRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.09,285,1716217200"; 
   d="scan'208";a="219472721"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 13 Aug 2024 22:37:18 +0900
Received: from [10.226.93.14] (unknown [10.226.93.14])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id E3B4240062D6;
	Tue, 13 Aug 2024 22:37:14 +0900 (JST)
Message-ID: <ce098866-4619-4570-9a82-5b2399d52d31@bp.renesas.com>
Date: Tue, 13 Aug 2024 14:37:13 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next PATCH 1/2] net: ravb: Fix maximum MTU for GbEth devices
Content-Language: en-GB
To: Sergey Shtylyov <s.shtylyov@omp.ru>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Mitsuhiro Kimura <mitsuhiro.kimura.kc@renesas.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240615103038.973-1-paul.barker.ct@bp.renesas.com>
 <20240615103038.973-2-paul.barker.ct@bp.renesas.com>
 <e61ce8b4-fb9a-8b4f-23e1-7cfd6dd1040d@omp.ru>
From: Paul Barker <paul.barker.ct@bp.renesas.com>
Organization: Renesas Electronics Corporation
In-Reply-To: <e61ce8b4-fb9a-8b4f-23e1-7cfd6dd1040d@omp.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/06/2024 20:38, Sergey Shtylyov wrote:
> On 6/15/24 1:30 PM, Paul Barker wrote:
> 
>> The datasheets for all SoCs using the GbEth IP specify a maximum
>> transmission frame size of 1.5 kByte. I've confirmed through internal
>> discussions that support for 1522 byte frames has been validated, which
>> allows us to support the default MTU of 1500 bytes after reserving space
>> for the Ethernet header, frame checksums and an optional VLAN tag.
>>
>> Fixes: 2e95e08ac009 ("ravb: Add rx_max_buf_size to struct ravb_hw_info")
>> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
> [...]
> 
> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
>> index c1546b916e4e..02cbf850bd85 100644
>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
>> @@ -2664,6 +2664,7 @@ static const struct ravb_hw_info ravb_gen3_hw_info = {
>>  	.net_features = NETIF_F_RXCSUM,
>>  	.stats_len = ARRAY_SIZE(ravb_gstrings_stats),
>>  	.tccr_mask = TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
>> +	.tx_max_frame_size = SZ_2K,
> 
>    The R-Car gen3 manual says 2047... Typo? :-)

Apologies for the late response.

The maximum MTU is currently based on rx_max_frame_size which is SZ_2K
for the R-Car gen3 devices. So this should be addressed in two commits:

* This commit to address the GbEth MTU, leaving the R-Car gen3 MTU
  incorrect.

* A second commit to address the R-Car gen3 MTU.

Unfortunately I have no test environment where I can properly
investigate jumbo packet behaviour with a R-Car gen3 boards so I
recommend the second commit is sent by someone who can test it fully.

Thanks,

-- 
Paul Barker

