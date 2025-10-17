Return-Path: <linux-renesas-soc+bounces-23269-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B08BEBC6B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 23:00:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DED4E5E1D20
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 21:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3DAA2874E4;
	Fri, 17 Oct 2025 21:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b="kOaWTq8X"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx11lb.world4you.com (mx11lb.world4you.com [81.19.149.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4323C354AF6;
	Fri, 17 Oct 2025 21:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.149.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760734803; cv=none; b=K2OduMZEa/duQAJMfOHMukAmBB/1krBg2sXAXENOy1xx8Ohrx98QuoLXObm7hoBbqYRUTbviWXc6ZD7ud6fLxBnQXbgZH67FfIFNKayxyDZBXojdRWFNaJxGX9K0fygW7bdF2pvPOh/23Sd4xOEALUR65Id9b68gxroiThcCbqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760734803; c=relaxed/simple;
	bh=xwuSU2A6wlKvo4c7rfwXO802qe4eYuN3Bgd6zncP88Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mVYAVf6HUYMJf9GwF368iB8tjIPTZQ1kHvoFSzLRca3T/mtr4CJ+FLvoOLgzoWXJ5Zz0cOAOabAxl3CbyNQGsHwjW5C39jCUxzEmIlJLr229zX2+a5W5S1G9V91pQ2frDQO1yluLJpNNvht1ITqXDZ5LRs5kTNz9yicPEoC1sa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com; spf=pass smtp.mailfrom=engleder-embedded.com; dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b=kOaWTq8X; arc=none smtp.client-ip=81.19.149.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engleder-embedded.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=engleder-embedded.com; s=dkim11; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xipJYjCUlCpO7SjjKv8TXE7D7jjqc9qe1DrBG+DtwdU=; b=kOaWTq8XwWecC+TKRev0Onb+xX
	17h51bcZSxsK8Wi5WUU6DTc2QY50NFEGJCwRhgVXKWstGT6vsoYcSoOgGP3WEN7vEdvwpKCQ5wA/4
	9W66sLJDXuXVPAsmtnBPvEyEH16ZZMEzFtTQg/vbn6OWIoeZd8Ebenx6HVcIQRnTONdg=;
Received: from [93.82.65.102] (helo=[10.0.0.160])
	by mx11lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <gerhard@engleder-embedded.com>)
	id 1v9rYJ-000000002Qq-3w8W;
	Fri, 17 Oct 2025 22:59:56 +0200
Message-ID: <b7e23e7a-0b51-491c-af3b-66916dee487b@engleder-embedded.com>
Date: Fri, 17 Oct 2025 22:59:53 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 06/14] tsnep: convert to ndo_hwtstatmp API
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Roger Quadros <rogerq@kernel.org>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Igor Russkikh <irusskikh@marvell.com>, Egor Pomozov <epomozov@marvell.com>,
 Potnuri Bharat Teja <bharat@chelsio.com>,
 Dimitris Michailidis <dmichail@fungible.com>,
 Jian Shen <shenjian15@huawei.com>, Salil Mehta <salil.mehta@huawei.com>,
 Jijie Shao <shaojijie@huawei.com>, Sunil Goutham <sgoutham@marvell.com>,
 Geetha sowjanya <gakula@marvell.com>, Subbaraya Sundeep
 <sbhatta@marvell.com>, Bharat Bhushan <bbhushan2@marvell.com>,
 Tariq Toukan <tariqt@nvidia.com>, Brett Creeley <brett.creeley@amd.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Paul Barker <paul@pbarker.dev>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 MD Danish Anwar <danishanwar@ti.com>
References: <20251013163749.5047-1-vadim.fedorenko@linux.dev>
Content-Language: en-US
From: Gerhard Engleder <gerhard@engleder-embedded.com>
In-Reply-To: <20251013163749.5047-1-vadim.fedorenko@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AV-Do-Run: Yes

On 13.10.25 18:37, Vadim Fedorenko wrote:
> Convert to .ndo_hwtstamp_get()/.ndo_hwtstamp_set() callbacks.
> After conversions the rest of tsnep_netdev_ioctl() becomes pure
> phy_do_ioctl_running(), so remove tsnep_netdev_ioctl() and replace
> it with phy_do_ioctl_running() in .ndo_eth_ioctl.
> 
> Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
> ---
>   drivers/net/ethernet/engleder/tsnep.h      |  8 +-
>   drivers/net/ethernet/engleder/tsnep_main.c | 14 +---
>   drivers/net/ethernet/engleder/tsnep_ptp.c  | 88 +++++++++++-----------
>   3 files changed, 51 insertions(+), 59 deletions(-)

I got the same patch from Vladimir Oltean a few weeks ago and tested it.
I posted it today because I missed your patches. If you need to respin
the patches you could remove the tsnep changes as I will work on them

Gerhard

