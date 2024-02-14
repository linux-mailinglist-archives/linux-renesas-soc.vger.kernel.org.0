Return-Path: <linux-renesas-soc+bounces-2744-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD5A854281
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 06:46:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11EA828AB7F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 05:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF4C51118F;
	Wed, 14 Feb 2024 05:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="MvK2RfOR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F09711185
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Feb 2024 05:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707889560; cv=none; b=cFuDSGB/0M+WhxPVHpK4yMCoHsctMf5SSIoz8iQ70I+N/Q6k6hBX+wapPVeOsViv91OnoaZ5+Gmr7Yh//7GQrPmDW6iZo2RKnqoPmB4XA1vGs/9P2OfdykOVPjpU89GSESBR+eoersZMhY7gbDlqjU0bnq8Hn7n1V6z0FszV5Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707889560; c=relaxed/simple;
	bh=JmjxFOUh3LKPSsN8pCRC8VOF/s6zvo9bNDnyMFYthA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sEDrOdr/xRP1pqOVRaw6GmmHTTNV9s4mqKG9i2UrKQRv41IfmhwyaSBFFofQ1PeeVAGljvR9uqKI5Ag1oBgeZ7ObvEaPX1VEj31sdCCo2wotZrBEE4fmD/zt6bRc9n+U+iBRlaI14J9vioW7rcnieOpYTnCUgfqEjf/m/+FZY9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=MvK2RfOR; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33cdedb40c4so730478f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Feb 2024 21:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707889556; x=1708494356; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/AAhQjlryQad1Zs2AYpvY1IsmIDvrveMyNvF06IB4YQ=;
        b=MvK2RfORjhKN3vOgEeS8Ne6fil/SZ3NbMaxCodY2+09nEPj7c67OAyrZ83aAmBzID5
         5ZruIkx/uNHcXWub5wVaoh1N5QQ1KCJxUc6WiFgdSRh0Il9G+PKiteE87ifFG4fO4Ti2
         P69PUoLAiz6PhS2t0BvwLU55FhJr1n5LIATODjAzNy/2BsTxg3to1iD6Py0YZuW0HG1a
         Q8MvwzfiYRNdO0Ksd4kGQxX8Ex+mMsG3OB8bs20Kb5JR2OMBQWFJi01XknQKRl0w1lHd
         kxKjQsLUcdRPpGZTkpqfoJyN5LIe0rxzMppojYrsHy+01368BEzcpM5QKIxOUE9e1x1+
         oI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707889556; x=1708494356;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/AAhQjlryQad1Zs2AYpvY1IsmIDvrveMyNvF06IB4YQ=;
        b=QesscPYn6o1SSrLR5ygxTkW5EDNLhhPjdR/xbY0z67ILnosrs+sjuCcYmM8nA10wV7
         5u50hlbQjaMVWj5q4lwlGMxYJqAkeHfSB+DLWrg11Kjq5mUuNnJ1mitxOaTMNCYVuU+O
         lgvnSHjztGZmTtTPULZnMZklzduUVffEaIe0Ds2QhmIlTW2FzlxHhk98sB2dKEAWz+6V
         DmoKE0byuAyZiP5dm2AhSKsJObDzxHX14NV7q01ud5KWgHppue6fDlh1sqatE6zczKBI
         p2aEqutLrGhCttCuOwwAmHqtahqMRrXHc5TZL1qM23dGSVQfbhnLIVtQb3g5Il056Bxq
         K+FQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+NDIHHMfIyMba9uxjziXzeN6xanrPh9HnJOyvckmeEttOPOA8T+b/3oQ79DCDORV7MORqTmL50m/r8RJRGydn1PDUvTvQO2uHKNEzQ6j0fUs=
X-Gm-Message-State: AOJu0YwUYVBSg1drzXb00uGXFqxLl7CZ6Cgc5Lk9fobQJoLQAq8u3/HQ
	QJLDgZz3Z3wZ+719QrFtfWhtTxK0vFVBy3cP5EwT2bFnLBYUk1fVbVqaQBtlEo0=
X-Google-Smtp-Source: AGHT+IHWDtZFUv6VmzlW+aWnM9Z58t2KoCaFJW2zVad9uJzsaZq4Q5o9aGgaIajWJS0rO/ufHqUwGQ==
X-Received: by 2002:adf:eec5:0:b0:33b:fef:c094 with SMTP id a5-20020adfeec5000000b0033b0fefc094mr894627wrp.22.1707889556410;
        Tue, 13 Feb 2024 21:45:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXYZBf36twkWsapTUvPo4T5Syd6owZfabMh3dJCCV9obon6MgGwx2rXNdnzmw3RE/MXeL60agKXPMdT9H2Xzy4Xp+pbSwB4HGpFl3UyVTITqWoI9w5KF70vScuulmFxI0OBeWvCR00nTV1JISK3xp4lbRUkeu0Ij1qVgVJoqExPjT6OZqimk7cVaj7J8yslwrRAB2IrRlaPVVl8ihdgBPchTN0RPZDuEUPuDXlsPLt3Vqg/M6yD2MTJaC8OeAd+ePINtIyLoJ4+LMJyuU4TjpAsnLaJSC4LE8MVOAPs6KxUh8tWiUEfnHWRnKGx5ibfihba8JIJFqgNjjDIHYhTuCZSshojOyVupjf3Z7DYhadTD+QWL7d3
Received: from [192.168.50.4] ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id cl7-20020a5d5f07000000b0033b8881f31dsm5234037wrb.68.2024.02.13.21.45.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 21:45:55 -0800 (PST)
Message-ID: <f6d71cc1-0208-44a3-a977-e90a0978fbe8@tuxon.dev>
Date: Wed, 14 Feb 2024 07:45:54 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 4/6] net: ravb: Move the update of
 ndev->features to ravb_set_features()
To: Sergey Shtylyov <s.shtylyov@omp.ru>, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 biju.das.jz@bp.renesas.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240213094110.853155-1-claudiu.beznea.uj@bp.renesas.com>
 <20240213094110.853155-5-claudiu.beznea.uj@bp.renesas.com>
 <3747ad9a-217a-2f43-835a-7c23f6a710d2@omp.ru>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <3747ad9a-217a-2f43-835a-7c23f6a710d2@omp.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 13.02.2024 21:52, Sergey Shtylyov wrote:
> On 2/13/24 12:41 PM, Claudiu wrote:
> 
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
> [...]
> 
>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
>> index 7a7f743a1fef..b3b91783bb7a 100644
>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
>> @@ -2475,7 +2475,7 @@ static int ravb_change_mtu(struct net_device *ndev, int new_mtu)
>>  	return 0;
>>  }
>>  
>> -static void ravb_set_rx_csum(struct net_device *ndev, bool enable)
>> +static int ravb_set_rx_csum(struct net_device *ndev, bool enable)
>>  {
>>  	struct ravb_private *priv = netdev_priv(ndev);
>>  	unsigned long flags;
>> @@ -2492,6 +2492,8 @@ static void ravb_set_rx_csum(struct net_device *ndev, bool enable)
>>  	ravb_rcv_snd_enable(ndev);
>>  
>>  	spin_unlock_irqrestore(&priv->lock, flags);
>> +
>> +	return 0;
>>  }
>>  
>>  static int ravb_endisable_csum_gbeth(struct net_device *ndev, enum ravb_reg reg,
> 
>    Wait! You're not updating the call site of ravb_set_rx_csum(), are you?
> It looks like the above 2 hunks aren't needed...

A, you're right. I'll update it in the next version.

Thank you,
Claudiu Beznea

> 
> [...]
> 
> MBR, Sergey

