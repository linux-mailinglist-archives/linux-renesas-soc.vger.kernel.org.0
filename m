Return-Path: <linux-renesas-soc+bounces-7817-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ED695067F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Aug 2024 15:29:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FB64286217
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Aug 2024 13:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E6F19CD0A;
	Tue, 13 Aug 2024 13:29:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5325919CCEF;
	Tue, 13 Aug 2024 13:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723555767; cv=none; b=KzCBnCast7ebnM023EvHTIAzDjTZJ6MHMmwM1Lz2yHUSRDIrytfLRDkPWSVEZzqTLNhsSasEuLp9ku7+fvg9C44CXGy4zsGhHAl62ugd5zcW1lHMOpegAJwLI3MIR8wzryhBeqKG8qP23L6doJMGWRtujod59zksJlxBv4hr6MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723555767; c=relaxed/simple;
	bh=qJpxspnrWXoqQxoImgHoe5rKtDxy5tct/IFJXI+M+Yk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LQZ6t4NVO2T8Cmf0DJRKmARW3uyL0ftdFWWoME8jctuKVETlRDz6goRDAz2W8FkKTUu3nmaYnBj7C3ykSP0ypNREWp9z/OncMjfOjWq8aXu394qKv5dIq5nLQzM34d/dLQclDW/Z6MakVbNOfqOsKRa2V87Flj7R6r9WW/B4MNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.09,285,1716217200"; 
   d="scan'208";a="215500539"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 13 Aug 2024 22:29:22 +0900
Received: from [10.226.93.14] (unknown [10.226.93.14])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id E9BE041E20BE;
	Tue, 13 Aug 2024 22:29:18 +0900 (JST)
Message-ID: <524873e1-d770-4f29-a374-dab99fe87c14@bp.renesas.com>
Date: Tue, 13 Aug 2024 14:29:17 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next PATCH 2/2] net: ravb: Fix R-Car RX frame size limit
Content-Language: en-GB
To: Andrew Lunn <andrew@lunn.ch>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Mitsuhiro Kimura <mitsuhiro.kimura.kc@renesas.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240615103038.973-1-paul.barker.ct@bp.renesas.com>
 <20240615103038.973-3-paul.barker.ct@bp.renesas.com>
 <b1c10539-4d47-4752-8613-785b0ad83f5e@lunn.ch>
 <933ffa58-8092-4768-993d-cd62897d203d@bp.renesas.com>
 <ed455f3f-dcb3-4654-af78-6ff6c6c5c22e@lunn.ch>
From: Paul Barker <paul.barker.ct@bp.renesas.com>
Organization: Renesas Electronics Corporation
In-Reply-To: <ed455f3f-dcb3-4654-af78-6ff6c6c5c22e@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/06/2024 15:29, Andrew Lunn wrote:
> On Mon, Jun 17, 2024 at 03:03:21PM +0100, Paul Barker wrote:
>> On 16/06/2024 02:23, Andrew Lunn wrote:
>>> On Sat, Jun 15, 2024 at 11:30:38AM +0100, Paul Barker wrote:
>>>> The RX frame size limit should not be based on the current MTU setting.
>>>> Instead it should be based on the hardware capabilities.
>>>
>>> This is a bit odd. MTU is Maximum Transmission Unit, so clearly is
>>> about Tx. MRU does not really exist. Does TCP allow for asymmetric
>>> MTU/MRU? Does MTU discovery work correctly for this?
>>>
>>> In general, it seems like drivers implement min(MTU, MRU) and nothing
>>> more. Do you have a real use case for this asymmetry?
>>>
>>>       Andrew
>>
>> Hi Andrew,
>>
>> This change is based on my understanding of MTU/MRU, on the specs of the
>> RZ SoCs I'm working with (primarily RZ/G2L family, RZ/G3S and RZ/G2H)
>> and on some testing. My goal here is just to make the capabilities of
>> the hardware available to users.
>>
>> For the RZ/G2L family and RZ/G3S, we can only support an MTU of up to
>> 1500 bytes, but we can receive frames of up to (IIRC) 8192 bytes. I have
>> tested sending jumbo frames to an RZ/G2L device using both iperf3 and
>> ping and I see no errors.
>>
>> * For iperf3 RX testing, the RZ/G2L is only responding with acks. These
>>   are small regardless of the size of the received packets, so the
>>   mis-match in MTU between the two hosts causes no issue.
>>
>> * For ping testing, the RZ/G2L will give a fragmented response to the
>>   ping packet which the other host can reassemble.
>>
>> For the RZ/G2H, we support sending frames of up to 2047 bytes but we can
>> receive frames of up to 4092 bytes. The driver will need a few more
>> changes to handle reception of packets >2kB in size, but this is
>> something we can do in the near future.
>>
>> Is there any reason why we shouldn't support this? I am by no means an
>> expert in the Linux networking internals so there may be things I'm
>> missing.
> 
> I've no really experience what the Linux stack will do. I have seen a
> number of devices which do not limit received packets to the MTU,
> i.e. they are happy to receive bigger packets. And i don't think this
> has caused an issue. But is it ever actually used? Do users setup
> asymmetric jumbo systems? I've no idea.
> 
> One thing i suggest you test is you put this in the middle of two
> systems which do support jumbo.
> 
>      4K       1.5K       4K
> A <-----> B <-----> C <------> D.
> 
> Make your device B and C, setting the MTU as supported. But set A and
> D with a jumbo MTU which your systems should be able to receive. Do IP
> routing along the chain. And then do some iperf transfers. I would
> test both IPv4 and IPv6, since MTU path discovery in IPv6 is used a
> lot, and gateways are not supposed to fragment.
> 
> I'm assuming here your device does actually have two interfaces?  If
> it is only ever an end system, that simplifies it a lot, and these
> tests are not needed.
> 
>     Andrew

Apologies, my response here is abysmally late due to illness, other
priorities and then the loss of my main dev box.

As you've said, a number of devices do not limit received packet size to
the MTU. There are many applications, other than a gateway, where using
jumbo packets in even just one direction would be beneficial. For
example if an application needs to receive large amounts of data but
only needs to send back control and acknowledgement messages. I think we
should support this where possible. This is the thought behind the first
patch in this series as the GbEth IP present in the RZ/G2L and other
Renesas SoCs has a very asymmetric capability (it can receive 8000 byte
frames but only transmit 1522 byte frames).

If we explicitly do not wish to support this, that restriction should be
documented and then (maybe over time) handled uniformly for all network
drivers.

I'm planning to submit v2 of this series shortly.

Thanks,

-- 
Paul Barker

