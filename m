Return-Path: <linux-renesas-soc+bounces-7816-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98921950594
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Aug 2024 14:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C72191C227B6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Aug 2024 12:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B83019AD85;
	Tue, 13 Aug 2024 12:53:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 390001993BA;
	Tue, 13 Aug 2024 12:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723553602; cv=none; b=JklLBDjHT49WqyVHvQY3uFgq6xW1WFUVBZSV8P8Lss34io/oCSO//zIQ2Dol64++1xcY2iIyC5RBfCov5G7BtIwlxWPoIcVxajJ85RKy18bLXsbUW4c1JKaNTCjlMDl8Jpwk2LabIcwQgxVYydReGtFcqIEcu1I2tea7B0ijb4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723553602; c=relaxed/simple;
	bh=euRZty7+jz+1Gx1SNSqjy8oGMoxrs/iXSvKUUcdMh8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uRhpUr/AJkfYBJTjdqrLIgVwkQ9/i3k28eVA/su/SG/RI7ytrr6nG1C9bK/vv+jkSVE844IgZl6NbONwrNiYhAhQNtQwJhLkNwbOckoURo69jvt4IKNgiEtgzRQxOqNsgptnsnsiJBULtRfU7cl9SMhT0A3EwXqf0WKP4fk+i3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.09,285,1716217200"; 
   d="scan'208";a="215499107"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 13 Aug 2024 21:53:11 +0900
Received: from [10.226.93.14] (unknown [10.226.93.14])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1A24441D8594;
	Tue, 13 Aug 2024 21:53:07 +0900 (JST)
Message-ID: <1d159325-3b64-4f50-8f95-b88f6638e19d@bp.renesas.com>
Date: Tue, 13 Aug 2024 13:53:06 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next PATCH 1/2] net: ravb: Fix maximum MTU for GbEth devices
To: Jakub Kicinski <kuba@kernel.org>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Mitsuhiro Kimura <mitsuhiro.kimura.kc@renesas.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240615103038.973-1-paul.barker.ct@bp.renesas.com>
 <20240615103038.973-2-paul.barker.ct@bp.renesas.com>
 <20240617170759.270f79f0@kernel.org>
Content-Language: en-GB
From: Paul Barker <paul.barker.ct@bp.renesas.com>
Organization: Renesas Electronics Corporation
In-Reply-To: <20240617170759.270f79f0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/06/2024 01:07, Jakub Kicinski wrote:
> On Sat, 15 Jun 2024 11:30:37 +0100 Paul Barker wrote:
>> The datasheets for all SoCs using the GbEth IP specify a maximum
>> transmission frame size of 1.5 kByte. I've confirmed through internal
>> discussions that support for 1522 byte frames has been validated, which
>> allows us to support the default MTU of 1500 bytes after reserving space
>> for the Ethernet header, frame checksums and an optional VLAN tag.
> 
> 
> But what's the user impact? If we send a bigger frame the IP will hang?
> Drop the packet? Something else?
> "Validated" can also mean "officially supported" sometimes vendors just
> say that to narrow down the test matrix :(

Apologies for the late response.

I was able to hang the GbEth IP by attempting to transmit a 2kB frame,
no error condition was raised by the hardware but no further packets
could be sent or received. I was able to successfully send a 1.8kB
frame, but there is no guarantee that this will always work. The RZ/G2L
datasheet states that frames of up to 1.5kB can be transmitted so I
clarified with the HW team that 1522 bytes was ok to allow for the
default MTU plus headers.

I'm going to submit v2 of this series as bugfixes against net (instead
of net-next) shortly.

Thanks,

-- 
Paul Barker

