Return-Path: <linux-renesas-soc+bounces-29468-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMQqHWjZt2mcWAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29468-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 11:20:24 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B7C297CF4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 11:20:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB8D5300EF91
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 10:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1156E38E132;
	Mon, 16 Mar 2026 10:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="rdMfKQKV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6292B38D006
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 10:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773656351; cv=none; b=V1wyKNf+UqieDDMURaYHjzm+nxf2g8zp59lk1Eqp7uEW045jjG/3VubHEtU/ocOPSTWjNcok9HD1Qf2EX3H/bwiEov9iaXj4wlGhzqDdUPjKmO5T51sg6V+j8S9BzbvTgHJDgHRLd+kJwyepkWprm28RLL0szfwinqwAvvM5kng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773656351; c=relaxed/simple;
	bh=Z3Pv2UF3x1mOPl70WNEH733HqOKkS4/KHiIUlvtl3AI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PQJHzxAjzcDtwE+Dt9iyceKE90fF8YCsnnoZuwBqRkYmGp+AM4TsWl4fXTsH/1ciQ4aLNV3OQrFznYkxqdP2beCV7fxzUYQovHUQuM+iHOk57FLfXPHBEjWY/TIwv4P0WI9Bz3ovboytBXjjWDrDPL3Prj2x2TxDz2TlqJOhtMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=rdMfKQKV; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso38400565e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 03:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1773656347; x=1774261147; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=guiztfKTm/HX0Pn7WIHNBacDDiPf6WW6XQg+TERbbf0=;
        b=rdMfKQKVYnxv860r2PUuB8YMItsTGqsxuyW6SNBtLRgV4XY9mKKkDE4M2mjXJYxr49
         M2gFlBrXDQXDm/OdxVaGIb8fmI5BimkfJrY8sMeRp0Te3eQFG26BlbxMnrGKfQw39BDs
         POYFNECAVbniVjbZ1YWC6BMaXq1nknq8Pu97aaJN4bqbKyEO+2Yz5SlsOqP48AoR3tOX
         2qSmLEeNvzP9O8xFEb85Hmd0ypICGrkj/b7MQUoow6em8+8FXoUtAx40Djce+G0Auh4T
         n9vHq1DDgB7B6/LW6nnB7XRejyWWhS9MKCUx0RnGzKLHQotkmu9roI/PD5iBxwJ0Oq9P
         Lqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773656347; x=1774261147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=guiztfKTm/HX0Pn7WIHNBacDDiPf6WW6XQg+TERbbf0=;
        b=G2BgRReX4ikIGIWKJLzlTTs4ZHffAxQkHkEBdCGZNr46l9aOso5kXfxyIcUWHU457a
         bCa9bkOxwZYMR8Q+8sPL7o2xSwB2lHyioacACPWXntcrjUS8DORyhcweHb0er4PY8dOq
         X0/0NIwZ7nXSZYBBiapnAncydNnSicKQsZYRVm4ZP3xpxWLMuQVNXumlwHVMG1WCt0+D
         VY70N3KASwrG67BDmbdcklN/RgVMmDaMXYRwxhj6Wp0MlpcmBGLA2Q6x2Gmt+TG/Lnnl
         FryDGKARrqW/R04/qikPe5kqPMzxWwR5X+OiPK2E7hHkR2UfcIlhT/3LihAdmdTlc3pF
         FSXA==
X-Forwarded-Encrypted: i=1; AJvYcCVeZNvRmMxP61CPjOXYzq2pRfh8ysx3cSdF1b7gJ4ldFgFYdWKjwnMoV5ciNmhCbnCHx1dVojz3nx2bSqtJU0SH0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvKa6QDJmYCkSq82jRk2ZWcAL15aY4mFz9ob1NKy3yxxd9zDQO
	pHtN323fZWL94kns87nCNog1hQRYMD/15pP9QRNAvKnOfW6UAfWkKtln0FMRqI+6H0I=
X-Gm-Gg: ATEYQzwoJxwVuXqgOiwuzBGup63LXFk+lJ/ft1q15q5NbyvkvydohNtOqOULLxICkVA
	aqWBnTkgBcAy8OXtocCOTAd9VNwrZGVhl6GovxtbBHDPZ8KFWZ7eabGxq6anz5XUNHD5owj5tsS
	d8BT8j6P4aSGuLauzUh0SrEQrVcZpADJGJR+aEGX1J6iQIeuHEvLgfcQ96cmFa0nUakrArEenTt
	NOkcLd4LdTVo0gixDyM5rAh3XzKTBB6+fj9PmLW11Gh79RJs9OQGd19IivjMlUCqa+rewn4w5J4
	741Bx/1CQgSBZtFKoVHcpVWhaK4lTN2KYtjlBQNZ5sGUS/sbXTurZ7zL52ee1ARv1ZDGPj6TZPt
	s57WjmT8hNyeKzRQxVNKkB8Rb9dRIe7xrWyRuX3emvwd4AG9570L6wleMtsmeuEwn1De7O8uZlv
	U6YohFtJ5n+ZgWV97KHwElgI9LAr6+X2E31Sn0cY4gpW1VQ1Yjq74XjIN0CP1z/w/mGMKog/oMV
	RY5hJs=
X-Received: by 2002:a05:600c:49a1:b0:485:4bd1:4c74 with SMTP id 5b1f17b1804b1-4855670c0damr128725525e9.32.1773656347449;
        Mon, 16 Mar 2026 03:19:07 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:6208:0:c5e3:3624:ad1c:6b4? ([2a02:2f04:6208:0:c5e3:3624:ad1c:6b4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557c6c69fsm93983115e9.26.2026.03.16.03.19.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 03:19:07 -0700 (PDT)
Message-ID: <2772d5e1-2127-4808-bd9d-aa40b4ad7104@tuxon.dev>
Date: Mon, 16 Mar 2026 12:19:05 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Add GPIO set_config
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linusw@kernel.org, brgl@kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260218151925.1104098-1-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWv1dQ55NcwMga_X0G8K97RgMRXoDu_FV10fNQv7AadbA@mail.gmail.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdWv1dQ55NcwMga_X0G8K97RgMRXoDu_FV10fNQv7AadbA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	TAGGED_FROM(0.00)[bounces-29468-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C5B7C297CF4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi, Geert,

On 3/13/26 15:15, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Wed, 18 Feb 2026 at 16:19, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Add GPIO set_config to allow setting GPIO specific functionalities.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>> @@ -1848,6 +1848,25 @@ static void rzg2l_gpio_free(struct gpio_chip *chip, unsigned int offset)
>>          rzg2l_gpio_direction_input(chip, offset);
>>   }
>>
>> +static int rzg2l_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
>> +                                unsigned long config)
>> +{
>> +       switch (pinconf_to_config_param(config)) {
>> +       case PIN_CONFIG_BIAS_DISABLE:
>> +       case PIN_CONFIG_BIAS_PULL_UP:
>> +       case PIN_CONFIG_BIAS_PULL_DOWN:
>> +       case PIN_CONFIG_DRIVE_OPEN_DRAIN:
>> +       case PIN_CONFIG_DRIVE_PUSH_PULL:
>> +       case PIN_CONFIG_SLEW_RATE:
>> +       case PIN_CONFIG_DRIVE_STRENGTH:
>> +       case PIN_CONFIG_DRIVE_STRENGTH_UA:
>> +       case PIN_CONFIG_POWER_SOURCE:
> 
> Shouldn't you handle all types that are supported by
> rzg2l_pinctrl_pinconf_[gs]et()?
> 
> The following are missing:
> PIN_CONFIG_INPUT_ENABLE
> PIN_CONFIG_OUTPUT_ENABLE
> PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS
> PIN_CONFIG_INPUT_SCHMITT_ENABLE
> RENESAS_RZV2H_PIN_CONFIG_OUTPUT_IMPEDANCE

I'll add these as well.

Thank  you for your review,
Claudiu

