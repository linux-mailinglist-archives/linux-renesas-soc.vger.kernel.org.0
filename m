Return-Path: <linux-renesas-soc+bounces-2298-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 19034847A30
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Feb 2024 21:03:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 444E91C251B1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Feb 2024 20:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8C9A81749;
	Fri,  2 Feb 2024 20:00:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C202581736;
	Fri,  2 Feb 2024 20:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706904010; cv=none; b=lEwpyrTypzfMe6Fo9RAUuQZuYUvrYNl2XbP3ILrGfydYkU3RwE3cjtwmcAitRfypfgP2+KlstzHFqghqwJkBjaTQsZ8BeLG9KROpSkvLMNm4VhBq8DhYrjVRHacfjUq8S+0pwgZit9VxSP/DQjRms5Lra06FVyuIbqrfmMoG0oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706904010; c=relaxed/simple;
	bh=TusnCNN3eCKZKTnXOtOSg6UQerEqvo15I3vwvjV9wYM=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=cMzKZ8yLKOsjwM1/cfJQbqLGaCK4n4/m3ovaOg4BHwnKOD7N85vgKs8G6uvvK6eu3YvdfH6uQnNRs8zFR79hULKbcTv1TUqVWuKh7PwDhZM1P8wTQWQZIvWLvK1gJWm4VS9OWq6wgaDfM6stDZ/1AKF3NtMGbCpoGR6AcagDsOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.105] (178.176.78.128) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Fri, 2 Feb
 2024 22:59:58 +0300
Subject: Re: [PATCH v3 net-next 2/2] ravb: Add Tx checksum offload support for
 GbEth
To: Biju Das <biju.das.au@gmail.com>
CC: Biju Das <biju.das.jz@bp.renesas.com>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Nikita Yushchenko
	<nikita.yoush@cogentembedded.com>, <netdev@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240201194521.139472-1-biju.das.jz@bp.renesas.com>
 <20240201194521.139472-3-biju.das.jz@bp.renesas.com>
 <d3a6657d-0a67-a826-24b1-17ec8f43ee81@omp.ru>
 <CADT+UeAeT0dC2AV1RP8H10V7LY2WLeET=6C-U_cXEDW95eYgYg@mail.gmail.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <2e17fe94-e398-ec91-e9bb-dead0c4c1219@omp.ru>
Date: Fri, 2 Feb 2024 22:59:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CADT+UeAeT0dC2AV1RP8H10V7LY2WLeET=6C-U_cXEDW95eYgYg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 02/02/2024 19:40:31
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 183168 [Feb 02 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.3
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.78.128 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info:
	patchwork.kernel.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;patches.linaro.org:7.1.1;omp.ru:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.78.128
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 02/02/2024 19:46:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 2/2/2024 4:50:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 2/2/24 12:13 AM, Biju Das wrote:
[...]

>>> TOE has hardware support for calculating IP header and TCP/UDP/ICMP
>>> checksum for both IPv4 and IPv6.
>>>
>>> Add Tx checksum offload supported by TOE for IPv4 and TCP/UDP.
>>>
>>> For Tx, the result of checksum calculation is set to the checksum field of
>>> each IPv4 Header/TCP/UDP/ICMP of ethernet frames. For the unsupported
>>> frames, those fields are not changed. If a transmission frame is an UDPv4
>>> frame and its checksum value in the UDP header field is 0x0000, TOE does
>>> not calculate checksum for UDP part of this frame as it is optional
>>> function as per standards.
>>>
>>> We can test this functionality by the below commands
>>>
>>> ethtool -K eth0 tx on --> to turn on Tx checksum offload
>>> ethtool -K eth0 tx off --> to turn off Tx checksum offload
>>>
>>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
[...]

>>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
>>> index c4dc6ec54287..042dc565d1a5 100644
>>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
[...]
>>> @@ -1986,6 +1999,35 @@ static void ravb_tx_timeout_work(struct work_struct *work)
[...]
>>> +     case IPPROTO_ICMP:
>>> +             fallthrough;
>>
>>    You don't even need fallthrough, actually...
> 
> Clang Compiler will complain.
> 
> [1] https://patchwork.kernel.org/project/xfs/patch/20210420230652.GA70650@embeddedor/#24129659
> 
> https://patches.linaro.org/project/netdev/patch/20210305094850.GA141221@embeddedor/#617482

   That's not like our case. If clang can't compile:

	case IPPROTO_ICMP:
	default:
		return false;

it's seriously broken!

>>    But why do you return false for ICMP? Isn't it supported by TOE?
> 
> It is supported by the hardware, but not the network subsystem.

   Then I don't think we should set CSR1.TICMP{4|6}, so TOE wouldn't
try to replace the checksum in the ICMP packets...

> Cheers,
> Biju

MBR, Sergey

