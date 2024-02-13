Return-Path: <linux-renesas-soc+bounces-2718-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FAB853BB7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Feb 2024 20:59:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C10751F24A60
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Feb 2024 19:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DA8D6089D;
	Tue, 13 Feb 2024 19:59:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE44760890;
	Tue, 13 Feb 2024 19:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707854343; cv=none; b=UYRotvz/yI0Fmgm0mPjklud/xJKVQdn+DvmUQ6RTQr267EzjSmqQ2YcZZtsoHUGa+jhE64r87GjsXQgAEZu/S7bHIQuYEj6W4lS66E2iYVCMnOIdVDbYXI87xHOPH+7lIjoG+k55O167Vq8xtJKQYvW0wg9RFi/xg9V4ZxyFqrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707854343; c=relaxed/simple;
	bh=DXB5ws2bRTjgd+sTIuDEdb5sEpVZEtZ1ZKLhzHacgKg=;
	h=Subject:From:To:CC:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=IKmvguIH4wvz2gdy3u+xyVxO/I8jOQpMJmOZS+jpULuGMVdjpJUPWqAz51J+1DnoZURd44smxBgB2Pt7prk1QlR2/IdOcphN2kSpPMOvgBnIiND7mmFqkuF8uhexYPRXzJilvcAO0LA4KUtndVr8UC8K6mzJGyCSvGqRvudadSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.105] (178.176.75.253) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Tue, 13 Feb
 2024 22:58:52 +0300
Subject: Re: [PATCH net-next v3 4/6] net: ravb: Move the update of
 ndev->features to ravb_set_features()
From: Sergey Shtylyov <s.shtylyov@omp.ru>
To: Claudiu <claudiu.beznea@tuxon.dev>, <davem@davemloft.net>,
	<edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<biju.das.jz@bp.renesas.com>
CC: <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>
References: <20240213094110.853155-1-claudiu.beznea.uj@bp.renesas.com>
 <20240213094110.853155-5-claudiu.beznea.uj@bp.renesas.com>
 <9fd3591a-99ba-7f40-551a-94648392c325@omp.ru>
Organization: Open Mobile Platform
Message-ID: <5a972c48-f156-1f7d-3a46-08c464104d19@omp.ru>
Date: Tue, 13 Feb 2024 22:58:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <9fd3591a-99ba-7f40-551a-94648392c325@omp.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 02/13/2024 19:45:49
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 183416 [Feb 13 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.3
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.75.253 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;omp.ru:7.1.1;178.176.75.253:7.1.2
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.75.253
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 02/13/2024 19:51:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 2/13/2024 4:21:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 2/13/24 10:36 PM, Sergey Shtylyov wrote:
[...]

>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Commit c2da9408579d ("ravb: Add Rx checksum offload support for GbEth")
>> introduced support for setting GbEth features. With this the IP-specific
>> features update functions update the ndev->features individually.
>>
>> Next commits add runtime PM support for the ravb driver. The runtime PM
>> implementation will enable/disable the IP clocks on
>> the ravb_open()/ravb_close() functions. Accessing the IP registers with
>> clocks disabled blocks the system.
>>
>> The ravb_set_features() function could be executed when the Ethernet
>> interface is closed so we need to ensure we don't access IP registers while
>> the interface is down when runtime PM support will be in place.
>>
>> For these, move the update of ndev->features to ravb_set_features() and
>> make the IP-specific features set function return int. In this way we
>> update the ndev->features only when the IP-specific features set function
>> returns success and we can avoid code duplication when introducing
>> runtime PM registers protection.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>

   Have to withdraw this... :-/

[...]

MBR, Sergey

