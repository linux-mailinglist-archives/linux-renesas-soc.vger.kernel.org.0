Return-Path: <linux-renesas-soc+bounces-33948-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vrsgBLpOLGqaPAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33948-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 20:23:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D3367BA6C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 20:23:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=BsJklsM9;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33948-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33948-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB2A5359EB43
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 18:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12CF337D13C;
	Fri, 12 Jun 2026 18:16:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734A2383980
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 18:16:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781288183; cv=none; b=rFxS0uXL3g1aOaGUGif9p3YwxoX8hTIsA4KADPczgMxUYrAzP19c2QiUMTHQMYqhru16CmEjgga8cUO/QPSrsdoaSub/Ya7kfiQJuDFqGrJ5pJK/dr07qJ08NOVnR15pAzYNoAevRk9w1wtak8QFk5gsEyMbzKaedLZjeWYE74A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781288183; c=relaxed/simple;
	bh=kJHBC7zOJdFr54Q1tOf/VVgkT3wW/KkqDJx6n438ZAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=q81nl/tEUWbi/9r9pwWT88ALYp+JZf7Jf9iLMHeIk1/YOX2Z4INInLqqpqO+vuUh1bIYNvkz/ReBeGKjohZPlz6VdSpaSK97/p/hv1ICPZ9XlkhwSfh7bUgfBy2JwK+pNlZejI0B3AKQrxoh6uLvR0zdKk9GdeY8JFSXyhut7mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BsJklsM9; arc=none smtp.client-ip=209.85.208.171
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39666ac91a2so20750321fa.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 11:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781288180; x=1781892980; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C79CBR33drE1u/8t77KlECapusXxwvj3erPrWmd11zE=;
        b=BsJklsM97uWb5/Yd/LKpJ53g5+L83kZNY2cQoltQA3/UI3ntneSswSqg20EEGvg26o
         sl1YBOxujamZ/frUn95glStwnHfJsGSATnWOb8PkGT5T1t3Ezo4PyC8A8HPChzQBafHB
         Nz0h7LSjO0PJ39HnxynYCqovKQA7PN8gFjY0Ul5/kJBVQQJZmJrCIXXqHk69Zin5b4hG
         zOsu0rYChmIYMLJMKx9d1P7z1uFO608krapDzpW+OihYZeAmq1XtwRWWTBUl6up+uIVg
         jkVXd58MtVxUtAKwok9fzwlE2ouQtrmOs3taJizVP0ZmzquGI1cfp1NfF8xcJ1gSjI1C
         iwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781288180; x=1781892980;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C79CBR33drE1u/8t77KlECapusXxwvj3erPrWmd11zE=;
        b=oO8IHtORuaYzrxTBsr4WYcBJcwZhha8VGZFJFYwoHEI52jFOtedEqF8qI57Edv8Hqq
         Yia4QY3x9NDQTr6faw8YCyvqVa1tKjyMJphj2CDjsNJz0afEb4KQy6g5Hj1SR4MFu9yE
         mqEvllxicWivPEiYN9k67UEFAw2G9DoyIBo5ln/LdCH+aUbFxR4sPjgwp0Pc052lXBqN
         /HbvvgWkgXYKEQK2mCaK2rDY04B4VFhvnnZRVBtLzH9DRKv7w9tmhISZoblrteZgiwJq
         9lmqlvKOtq9PExO1ZUdjzR1+1fLIg8AJ2ixrxfAqlqbD+O3PLo2Nj77tNvEYqdWHmw8V
         PRJA==
X-Forwarded-Encrypted: i=1; AFNElJ89LT0H1A+XIoS9wXFdQBkRzuQuU9cIAdtOuICORpS/6FmNkSIRyxyFqxN4529Hnb2iuIBpvmfhFOjTf3YHdUeOIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzElkx+WWjRAGtufhgFomZzM3WMJ9VkSJNIBkb1gGrlC65fGpnN
	FDOICDQw8b5xXSlFWPKUyCWExXhJeg2bgWVY4gxsQn59p4dCDC/qzwQy
X-Gm-Gg: Acq92OGl5PxlQHO58dvodPnI1rNF2p8smQQF+cxywAVZj+n9PURNSg/XWQELzfWetSR
	mZ395f+hWOSAszsP+SCsWaA/+SGtKc75t8eN+r07t0XIeAlbnEM4gN7uHH7AXaEfxpE+mjoqGG+
	jJncp9zIUZDzSMtlV7pYfFLtZ32GqQ0gWHPsNevanBFNzqWrkwF/KxjWDEJISDTWR3fDokhk3OU
	q9Hj+aGoKFpHR6EbmGOLqMjb8f8y4jNF4LV6dXD3hrVuCcFNnVEhaMS9QArAuITxYjr1mhjf+wT
	4wrf+BpgGaSr0Tmj5TZCs2eI2zJTbGyZ/fXOMu3RQUE93wpMzXt8OQ4OxYQtfywPsBIfQYq35dZ
	zaw75A89BMKC4LpTbhZl1bTpQ6UMQxKP3JRfR+aNtQpnCeI7AxU4p07k5Y9Fb9ehXf+2fVDHX+C
	zAvPcfGFYdEg99Df+4yxlC3awpWr6krSzVUYmrfNAIAOZoj7QNIfn6ubacCOI+/jqCyoKlkyEkr
	wJYX6nMws55VA==
X-Received: by 2002:a05:651c:3253:b0:396:a647:76f5 with SMTP id 38308e7fff4ca-39929b48892mr11943051fa.5.1781288179270;
        Fri, 12 Jun 2026 11:16:19 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:742:25a:e03e:6c9c:49d8:2fee? ([2a00:1fa0:742:25a:e03e:6c9c:49d8:2fee])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929c29687sm7844271fa.4.2026.06.12.11.16.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 11:16:18 -0700 (PDT)
Message-ID: <44f779a2-74dd-4488-8338-4cb9e2dcdc59@gmail.com>
Date: Fri, 12 Jun 2026 21:16:15 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next 2/9] net: ethernet: ravb: Move programming of gPTP
 timer interval
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Paul Barker <paul@pbarker.dev>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260610102432.3538432-1-niklas.soderlund+renesas@ragnatech.se>
 <20260610102432.3538432-3-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20260610102432.3538432-3-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33948-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund+renesas@ragnatech.se,m:paul@pbarker.dev,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:netdev@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund@ragnatech.se,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sergeishtylyov@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[ragnatech.se,pbarker.dev,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,glider.be,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sergeishtylyov@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,netdev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ragnatech.se:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 65D3367BA6C

On 6/10/26 1:24 PM, Niklas Söderlund wrote:

> Commit f384ab481cab ("net: ravb: Split GTI computation and set
> operations") broke apart the operations of computing the timer interval
> and programming of it. However it kept the programming of the interval
> in the RAVB main logic.
> 
> Having split the two apart this can be improved further by moving the
> programming to the gPTP initialization function, as the first action of
> the gPTP init function is to wait for the timer interval programming to
> be acknowledge by the hardware.
> 
> As an added bonus the interaction with the gPTP registers for the
> programming can then also be done while holding the gPTP registers lock.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Sergey Shtylyov <sergei.shtylyov@gmail.com>

[...]

MBR, Sergey


