Return-Path: <linux-renesas-soc+bounces-16318-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35261A9AB92
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 13:19:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54D141B60029
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 11:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9611E00A0;
	Thu, 24 Apr 2025 11:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VslF9Twm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DB71F152C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Apr 2025 11:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745493573; cv=none; b=ocNs402cyRvhiww3KrxWpVPhZNWC8aT35KlxNtFbSerkGFW1R4JCAMyriRBIA1RlVeoSg1+2G+ww9zugsX0jyQO9r3AurD6nn9Dqg2aMRbnjmOpebThX/cEH48Iu6vHLebGpLE4X+/bgyUiktUIcfV22dKZy+CCEYaaCoyeYzyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745493573; c=relaxed/simple;
	bh=Lef3LJcLWvlPCx2dx3DqtnT6/y9ED1VY40Y8HLKJHLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YUpY1QBG02DuRT8BOPyo+Df7oBs5WA1Xr0GawoHoAYsWE6luA1cI6qkwg3K31QKGc+Ki1azo3spspAMYdzYb6MrnFBwLH6bX6HhblLQ7CqEurVTiJ2TUTtmgGymmgj1YHF5aMu0+w9SVrMuk5IFp3pfrTozAUxDa+SkSBKZBVjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VslF9Twm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745493570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bzx7KR46iIZIb+R4l7Ce1Sw/xRYo/0+s/bLe9DXjA+E=;
	b=VslF9TwmZxKcCdNT/FUsE8aPhTAR2bHRdfgJ1HPaGwUdmtMRD6mtKFWmUr9R8/LV8aZcGf
	dSCA0FesvAfguaaedU4NuObAPHD2jQJPxgPR5bZD3CRPCnsERlfm4u402PZcr6KyciUmRW
	b5pdfOmVuneNyvZLH+1Ke+FV6kuupcA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-HShRU06gMhy7bd9zCNk7Og-1; Thu, 24 Apr 2025 07:19:29 -0400
X-MC-Unique: HShRU06gMhy7bd9zCNk7Og-1
X-Mimecast-MFC-AGG-ID: HShRU06gMhy7bd9zCNk7Og_1745493568
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d4d15058dso6225545e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Apr 2025 04:19:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745493568; x=1746098368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bzx7KR46iIZIb+R4l7Ce1Sw/xRYo/0+s/bLe9DXjA+E=;
        b=qMZM6iBsii28ZOIj6xp6nkvKhWQa+duX9iiQqEPMU6mxvsXKTMtVIs5+TdL3wEvV9E
         MsI5cUJOWiyl+p96w+Q/f+mlBpFSw7rWPBtfI7JOjc9Gy37CYQsNzCkwep38LckT1bu1
         0wpSKVHquZ4qKiJIOb1nUeHmFTISvAZBCqoWSyxjyF2/Q73o2G+B2K/if0Gr0DdgwVAK
         mrQ7e4eKwbhmJRuRUiK549Ep5JfixT+oKhOUmZFG+4mQjm546itSiXxDe7whWyT+nuTe
         T+DahnZYem4BelACf+u+9xqzmYFNrjbx+LPGCHpor0eRDM5Ac1V71KPnnfAlOez92MFg
         EXvg==
X-Gm-Message-State: AOJu0YwhVc/jhAvN+PTLVf+mxLDw5rX1k02R89OS99OOO+a1zlpsDUq+
	z/e7qIBTroY/arz8aqEGwa2LppzsPfqf2p+FdpbwABKEDsecHflBQh881+fkXp0C9E7bbI8QjhS
	FncCluG41oeOkCVM3PWAORfW9ddI6OmExBreLbBbfBX48lbqbsYarR9zlzYesLD2XA7sQ
X-Gm-Gg: ASbGncu0wjiA+QlQZC1QjqRI7a0COrIaHqS3U0XiiHwejDs7HTRlF8uf6OFZVt7oOEB
	oqRb3z80XXlqffAI1pZtLuXoGmTxah7BzOY5Fu7HGmgXa3H9LpxXm1omIUovS05W4EOZoppDe2k
	oy7hCIUQFPeA9O09hougSTXPr5Gs4wphuO2rqiqS+MUn6HOubxF/gxxuZv9IaVp/0G4U9ML1bdP
	IoAw4I1x3WCPZnilkHHu4JbR7a/pQkbX/B3gylTynlJgM4JbpIVDjpg7HabrmkjBjn1ESPuuR2F
	s4J479jvgvoYnJli4+HlVfmF90LZIDwzPF6FUzk=
X-Received: by 2002:a05:600c:384b:b0:43d:160:cd9e with SMTP id 5b1f17b1804b1-4409bd2295dmr23783265e9.17.1745493567929;
        Thu, 24 Apr 2025 04:19:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvDVI9tm/E6+nrZZJjCTTjoDjwSuUR69Vl/dO0bCx9vn5aK6eO3ANAy9rSrpVBCz2N7xPXEw==
X-Received: by 2002:a05:600c:384b:b0:43d:160:cd9e with SMTP id 5b1f17b1804b1-4409bd2295dmr23782935e9.17.1745493567545;
        Thu, 24 Apr 2025 04:19:27 -0700 (PDT)
Received: from [192.168.88.253] (146-241-7-183.dyn.eolo.it. [146.241.7.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4c565esm1797641f8f.56.2025.04.24.04.19.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 04:19:27 -0700 (PDT)
Message-ID: <d9ccea14-04c1-4f5a-8b55-b6f9166289ab@redhat.com>
Date: Thu, 24 Apr 2025 13:19:25 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next,v2] net: phy: marvell-88q2xxx: Enable temperature
 sensor for mv88q211x
To: Heiner Kallweit <hkallweit1@gmail.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Andrew Lunn <andrew@lunn.ch>, Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>,
 netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20250418145800.2420751-1-niklas.soderlund+renesas@ragnatech.se>
 <5d416bce-9ad3-48cd-95bc-0436aefd4baf@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <5d416bce-9ad3-48cd-95bc-0436aefd4baf@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/18/25 6:10 PM, Heiner Kallweit wrote:
> On 18.04.2025 16:58, Niklas Söderlund wrote:
>> The temperature sensor enabled for mv88q222x devices also functions for
>> mv88q211x based devices. Unify the two devices probe functions to enable
>> the sensors for all devices supported by this driver.
>>
>> The same oddity as for mv88q222x devices exists, the PHY link must be up
>> for a correct temperature reading to be reported.
>>
>>     # cat /sys/class/hwmon/hwmon9/temp1_input
>>     -75000
>>
>>     # ifconfig end5 up
>>
>>     # cat /sys/class/hwmon/hwmon9/temp1_input
>>     59000
>>
>> Worth noting is that while the temperature register offsets and layout
>> are the same between mv88q211x and mv88q222x devices their names in the
>> datasheets are different. This change keeps the mv88q222x names for the
>> mv88q211x support.
>>
>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>> Reviewed-by: Dimitri Fedrau <dima.fedrau@gmail.com>
>> ---
>> * Changes since v1
>> - Clarify in commit message that it's the link that must be up for the
>>   reporting to work, not just power up. Hopefully this oddity can be
>>   solved in the future by patch [1].
>>
> Following this link I don't see anything which would deal with incorrect
> values being shown if link is down. What are you referring to in detail?
> I think you have to modify mv88q2xxx_hwmon_is_visible(), or return an
> appropriate error in mv88q2xxx_hwmon_read() if link is down.

@Heiner: my take is that the temp reading oddity should/will be handled
in a separate (net) patch, let's not block this patch due to that.

Thanks,

Paolo


