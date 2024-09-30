Return-Path: <linux-renesas-soc+bounces-9246-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C36C898AFD9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Oct 2024 00:32:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA08D1C21A24
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 22:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE8A71862BB;
	Mon, 30 Sep 2024 22:32:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5A321373;
	Mon, 30 Sep 2024 22:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727735573; cv=none; b=TAS0qKlKT5KAxBEH9ECrd+4r+HWhqT3x4EEtHW3U/0do6pDKURfgGWtb0ApNZSkB2mauMIL1MUopcS4E53yTQa7m3uyIptG07SRlWKqvh9oXPy6eQbPT4U2roJB7mMFxG4CGSBB2suD7WmvpkoxK1R5LwN/n1r9elhkcyezfoBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727735573; c=relaxed/simple;
	bh=yB8t28v0rVVG8l1ITb+2azCXJ2SY+9Yr+Bcj/YPUWsQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=TATI2wR6JkLMxXY1S07aVH5Ow/zvfbxPAxqJLeqkP71QvBb/QtgKieMjZnOdgyadoa6iDs43K+Bjov5Usj3zero6z7kP6vHrk4/fK/1Pj6XJvjvbuw3/x8syLAUFThOd8uOirzGDisKP8MiFOb8Y3ccy3rR5gHlAYuNodkZAMhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.2.100] (213.87.144.249) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Tue, 1 Oct
 2024 01:32:40 +0300
Message-ID: <2664c044-bb38-44f0-821e-28d813589d15@omp.ru>
Date: Tue, 1 Oct 2024 01:32:39 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next PATCH 11/11] net: ravb: Add VLAN checksum support
From: Sergey Shtylyov <s.shtylyov@omp.ru>
To: Paul Barker <paul@pbarker.dev>, "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>
CC: Paul Barker <paul.barker.ct@bp.renesas.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, =?UTF-8?Q?Niklas_S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>, Biju Das
	<biju.das.jz@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, <netdev@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240930160845.8520-1-paul@pbarker.dev>
 <20240930160845.8520-12-paul@pbarker.dev>
 <ab7482f9-6833-416f-8adf-5e1347628dec@omp.ru>
Content-Language: en-US
Organization: Open Mobile Platform
In-Reply-To: <ab7482f9-6833-416f-8adf-5e1347628dec@omp.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 09/30/2024 22:19:07
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 19
X-KSE-AntiSpam-Info: Lua profiles 188103 [Sep 30 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.4
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 35 0.3.35
 d90443ea3cdf6e421a9ef5a0a400f1251229ba23
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 213.87.144.249 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info:
	omp.ru:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.144.249
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 19
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 09/30/2024 22:22:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 9/30/2024 9:25:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 9/30/24 23:36, Sergey Shtylyov wrote:
[...]

>> From: Paul Barker <paul.barker.ct@bp.renesas.com>
>>
>> The GbEth IP supports offloading checksum calculation for VLAN-tagged
>> packets, provided that the EtherType is 0x8100 and only one VLAN tag is
>> present.
>>
>> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
> [...]
> 
>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
>> index 832132d44fb4..eb7499d42a9b 100644
>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
>> @@ -2063,11 +2063,30 @@ static void ravb_tx_timeout_work(struct work_struct *work)
[...]
>> -	switch (ntohs(skb->protocol)) {
>> +	if (net_protocol == ETH_P_8021Q) {
>> +		struct vlan_hdr vhdr, *vh;
>> +
>> +		vh = skb_header_pointer(skb, ETH_HLEN, sizeof(vhdr), &vhdr);
> 
>    Hm, I thought the VLAN header starts at ETH_HLEN - 2, not at ETH_HLEN...

    Wikipedia indeed says that the VLAN header begins with TPID word (0x8100)
and then the TCI word follows -- while in Linux, *struct* vlan_hgr starts with
the TCI word -- hence my confusion... :-)

> [...]

MBR, Sergey


