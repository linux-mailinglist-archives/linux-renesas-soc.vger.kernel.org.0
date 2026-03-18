Return-Path: <linux-renesas-soc+bounces-29812-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNtjG67lummdcwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29812-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 18:49:34 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 571A42C0A02
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 18:49:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 49EA8301DEE8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 17:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 666533570A4;
	Wed, 18 Mar 2026 17:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R2pRfzic"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D89C355F58
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 17:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773856154; cv=none; b=lg2uYbs/kZyouuAjAAjhWpvl4nXaDH9ey+sKSZyVtHBBRo2SpGST12SBxCNQF2Oll5eXqrs5FrD5WERbzyGZY1/v2Wm5oOmtEZ3SImiX5no3kf/fO/rrFcyZDohmdctVnF7UWkHneOgfAOS+ecoJDcFuIuXlL5rqZSQ1Wrc9ZVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773856154; c=relaxed/simple;
	bh=7foqOo4PO1+dY1J9snRPo3pULD+nFZ65/Jc53Tf6BUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nvCk2Skheg6TRYRoeiyZz9swu5jmlYaCiZhGJmUJykoghriXqPoyLI1ByvWQLvSvab6vUAWO87q0x+VceCWLYjMLMTCVfBTDTolMuimlg9ZCge/vkknuak7L2ZCcax9BmHkCNZb+xdVJlPDpgXZfbRpOqf+ZiCDtCoh4tOiNiJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R2pRfzic; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-356337f058aso166959a91.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 10:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773856152; x=1774460952; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=kweWB3MHB0sQFqv3t56LlX9dg8y07f5j3ZR4fhpqzGk=;
        b=R2pRfzicrEth/rmvQIt78s2xyxoRCQd63voZ+mMyEJnGU9WX7jxOySDIWfDcvm0JtZ
         wRgZ5vbDgCfLaw9MzbBTZWYMB+wBZvblhyZvsIl+OUFCBowxwp5I8A/lUphHO619vqfi
         S4Dnuk+2wTmhOiUsbmRDbppKWK7e6Vn61jpPNEJBnPd313pbyelMdPpv5MVpZr5V45DC
         QMbZNzwVohf/ehlo/yI8wcpqdUZH98eomckDA0+jkgMsECYAG9hXceZhQis2pgofskEz
         X776OXl+WZdaiZuLZVPiizbjnHuSh9SQTaVV4hv57DDhj2EkBj9mSFA0ELpJqLPNAyj6
         CIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773856152; x=1774460952;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kweWB3MHB0sQFqv3t56LlX9dg8y07f5j3ZR4fhpqzGk=;
        b=JklbzCQwox2aniMunjtL8+YbWrJ6uplQFwuaTTxjHHRSyV9937Y+J/RAGI4Fdc31E9
         QetmAPBM324Jk03PpXA0zIbbivg698M0Qm2tyVImcdjSl4282v4X4QecYW0rk/EeCtsB
         xdJWMa/PDHgH+5e+4Jh7ZueGj20O4Swz8KyzkxJEjgwfHXH00lmAocWLq+UuxtZLFvj/
         mlz0sfDQ70Hlg34vv1vBlnFjcUg3Ls/ZZcZIfi3ftqgcGj32wSifx2Ovj5NFVHZo/6aC
         2MyV7fc2OOVsmksFcSvuR5ORKSt5hOCAs0GokrzJnaRftLqWRNGc9kYTwrkg0Mn1ai6J
         MERw==
X-Forwarded-Encrypted: i=1; AJvYcCVaqJ6TQFi67ggDqDfTwkKN25RePXm03jkynvLGkXQ6WIxbZZeOuTy20emA1ShSttLB3RFuJs6QdaEizhdHZw+IMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuCpmQGvDpi/grRxwzY658QkYPvc9fgbDV7fuZlPmZz+Ld/pCt
	99Mb1mLKeJDXhjT7NBbr5G65R3IyRzFaNNZJUohAwb92wDTB9Ce1dbdpD5ilRA==
X-Gm-Gg: ATEYQzzqyQj4zvmANB/i8VQ77V0/xHlNJwNzrvC5xOt1SVJADnaKqtyFZmSLH8BwWrm
	aJaD1mKBp+cuVNjZdOqukWV+GCOfMo7R3KQj0jv3EyWpfLICwpys42XAUgvItsyn9aG0HZtoz9A
	pOt76Y+4WOIkJvhrazTL56ZZSgmIvXdAQl3UD0ET5qducudLIS2UQKErCMd3xpnV8UH+CIsCBzk
	Iatkrf8uGsBe3tc4M3n65aYNx5AEREQ/O1sccbK8vYLPlbTWrlmt/OLmvwi48afSC3UJjqeI0V4
	iNsHYtG0B6ZZFq/4aqzheYCHW9UKwJKhsbAbdqa/BIA3gXVxvSoFKhuRLrjfDmCaJTAV35U7Tl7
	RGp935bdk4JOno4zYmu2dcor1k33OB/RHZBaVfc0G/y5MpNmdulXFqHFtG6c5pwq7BSUqn28coB
	xFmRejKypgkSyVyOZ7jfeGXnmn4xVWM4NBXGe8ruop2aXHs2S2RNKm4shmruP6SOR4Kud4MgkUQ
	OiTBzMP4O4=
X-Received: by 2002:a17:903:1a67:b0:2b0:5a4c:726a with SMTP id d9443c01a7336-2b06e41afc9mr40969735ad.43.1773856152438;
        Wed, 18 Mar 2026 10:49:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e603937sm34123755ad.57.2026.03.18.10.49.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 10:49:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f6101afc-b1df-4f6d-9e32-09b09e17afa9@roeck-us.net>
Date: Wed, 18 Mar 2026 10:49:10 -0700
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] hwmon: (pmbus/isl68137) Add support for Renesas
 RAA228942 and RAA228943
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dawei Liu <dawei.liu.jy@renesas.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 grant.peltier.jg@renesas.com, linda.xin.jg@renesas.com, tabreztalks@gmail.com
References: <20260316053541.3903-1-dawei.liu.jy@renesas.com>
 <20260318021921.75-1-dawei.liu.jy@renesas.com>
 <20260318021921.75-3-dawei.liu.jy@renesas.com>
 <9ec35dce-5f6a-454a-9ab5-e61b22796325@roeck-us.net>
 <20260318-elite-archetypal-porcupine-a5d2a5@quoll>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260318-elite-archetypal-porcupine-a5d2a5@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-29812-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[renesas.com,vger.kernel.org,kernel.org,lwn.net,linuxfoundation.org,glider.be,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,roeck-us.net:email,roeck-us.net:mid]
X-Rspamd-Queue-Id: 571A42C0A02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 01:25, Krzysztof Kozlowski wrote:
> On Tue, Mar 17, 2026 at 10:23:57PM -0700, Guenter Roeck wrote:
>> On 3/17/26 19:19, Dawei Liu wrote:
>>> Both RAA228942 and RAA228943 are digital dual-output 16-Phase
>>> (X+Y <= 16) PWM controllers. They are PMBus command compatible
>>> with the RAA228228/RAA228244/RAA228246 family and use the same
>>> 2-rail non-TC driver configuration.
>>>
>>> Signed-off-by: Dawei Liu <dawei.liu.jy@renesas.com>
>>
>> For my reference:
>>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>
>> Note that technically the devicetree patch should come first,
>> and I can not apply this and the next patch because you dropped
>> Krzysztof's Acked-by: tag from that patch.
> 
> Was there an Ack? I see only one reply from me, but maybe something is
> lost because entire posting is completely mixed up (v2 being part of v1)
> so it all appears mixed in my inbox.
> 

My sincere apologies. No, there wasn't. Not a good excuse, but I got confused
with another submission.

Sorry for that.

Guenter


