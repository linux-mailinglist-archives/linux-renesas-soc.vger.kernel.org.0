Return-Path: <linux-renesas-soc+bounces-30219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOBXADq/w2kRtwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 11:55:54 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F8B3235DE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 11:55:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 436FB302F6B3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 10:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5E13A6F09;
	Wed, 25 Mar 2026 10:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="e9cwSjtQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F73E3C3BF3
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 10:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774435729; cv=none; b=QwNtd2YpJDxfhSrbvZhSNHCvE58oPY4MLfMFQMQIJUUc6f8NOo50KfCwO4G/dpi3s7uUiLJCptyaVDbuS8GJtlijc02PxHMA0GCxQLDqiH20sVXz1F4lUEcK8yTr2FFmTvj7AGB43NeRjVCEqkOnEE9QN+Jufd2tuYPOMk2NGGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774435729; c=relaxed/simple;
	bh=SLFMpG+kF5e1ZEwrFLBt5/DADZ+cUVEGrPRuJlgkzy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XtpsKp/uDLTQrNmw+BFj4RqMDWTi7aLpMqUTvrMV83X4M0rquUTCVGbBvGSgoW0rj2JkX8OpzsVq95zRHoufgWpEIg4JbSd3VMro1ardoPlO6IA+hBFz9FDdgTVUtPCTprsQPsmL+psIDh4/W6f86X4fqzSzC55Lem4cP/8Q8nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=e9cwSjtQ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486fda2a389so40277135e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 03:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1774435725; x=1775040525; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Up66ZFHS6v9embmLSm3ojvUVAvpwxatf954s2VYHQ6s=;
        b=e9cwSjtQ4uHxZDKNXPegTw1A1Z2FhXuL8DZB/gAF62LfgpO0ewPshDj32ZHicK9RYu
         qOPpnfzYVuKoTq6BmocUp+RB7WNUXBEQZTNGQ+lOjC9GTHLmSaZCQYbuy13Kxbhemo5n
         6CP0TGxSQK7cknWQjyq/yYs54PgEB31Qqc2J/XbzjlnyIl5WMgcVbc7RiZTF52/TdEvL
         3irWxQNL5psY15dwLLI9799kHGODYqnmvvE8aB6RCprybdZbzLRyKOYhAdBjXlSHmx1R
         ucfUqjOVR/VAW146Kkl/tbVI1UXXS0d7KxH3Gohpw7+L82ZDXgzZz7KiMC4HrM7+sqV9
         ALhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774435725; x=1775040525;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Up66ZFHS6v9embmLSm3ojvUVAvpwxatf954s2VYHQ6s=;
        b=R4N4dmeUxuvQkOtx1RLqcWpuPu8YDCAmbXto3ItM6zLFeDFtYnRAvvOt6M2zROyQR3
         n3YfrJz73RHD6QFlXoeFe29d9MXzbDvk8a/edzWtz+rsG3cOvllfdaSo0e7Y+iONviUb
         x11RO7lDCb50J77P8Uuc/P1KWf1bpuzIw988Ab+Y3yAeI1rzCge4rfY7ocelefJPY3JS
         3rERdDupQU3TaRxW06/nP0e/8yRX6wegLNWP9nPBo+0K87a7l+j3DbiqznEldOa09J9q
         oA9rntsFgiw2V5PQcnO/fbNKS5LfVvjNdH/lv6Cf8UsacLFal+0MeaxdqyBJxy7Y5/9T
         CzfA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ8IVRtz543sQQJvcVBfjTnON6NCRbLwVGkW2o8YotS/xjsfT9curUj/PuIN7dn0UtolZY27J7/3oAfqjQye+iog==@vger.kernel.org
X-Gm-Message-State: AOJu0Yygh7/gIkKOQ+NqRyWo5iuKNfh4hMygLgYUQ93lTz+yrO2grACP
	bljMNWwTuPESGZgu4EkqOnG0gsjVcGaNoBQv4tG507wpIwjbhH3kRfObzaNlENDamFg=
X-Gm-Gg: ATEYQzxpfv/rTBaQwe+1J24lxxX0hDzMrCegTcLpFTXCRZy4uysl6ZRoh8o1j0VgT3N
	QpbRKiJH9lq2hPkbhNaNR7HdU93TPn4oMTUXBXwkANJLzBKJOH7fNxI7Tcinvrw1qyWFrAr1Dw0
	wxQ4TlsIrqa6Bn+EEavJ5vADmxVwJVrrd6Ie9YgXYH8UXZsjaaqK+fV2nzOr0kCDs37davYKWQz
	XhCUOyKeYnD5E+RPl/Gnc5iPv9/rkcv32A6AVkzn7ZUvKtPjJVVXaN3o6QX33PquKOqnctXEJG/
	HJh0eDGutjwcm8eQmijD6vtukIa1q4SsTNGANiBnlCeu1XaWdjsgHWs7x3WutKJf/aZdYyAoMdW
	ZSWa6PmrmRKlomp36bTI8LLFnFwGDu8JYi/7wdN7Ldkl42uRZq+gIdNFQVDNDB9YEZce+UUR+KY
	BfW2uwRi/DtSUm5VYyyc2Kpd3xUnsW6E4=
X-Received: by 2002:a05:600c:19ca:b0:486:fdc6:1c0d with SMTP id 5b1f17b1804b1-48716056478mr45277325e9.22.1774435725262;
        Wed, 25 Mar 2026 03:48:45 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116c0c13sm256223695e9.7.2026.03.25.03.48.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 03:48:44 -0700 (PDT)
Message-ID: <3fc7c513-2f15-461b-b83c-29c3bccde609@tuxon.dev>
Date: Wed, 25 Mar 2026 12:48:43 +0200
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
 <2772d5e1-2127-4808-bd9d-aa40b4ad7104@tuxon.dev>
 <CAMuHMdUEjMs9TgGR=vMG4Sd_XtnaW+D5Vrb0VBCZdb35TtLXEw@mail.gmail.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdUEjMs9TgGR=vMG4Sd_XtnaW+D5Vrb0VBCZdb35TtLXEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	TAGGED_FROM(0.00)[bounces-30219-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,tuxon.dev:dkim,tuxon.dev:email,tuxon.dev:mid,renesas.com:email]
X-Rspamd-Queue-Id: 69F8B3235DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi, Geert,

On 3/24/26 19:28, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Mon, 16 Mar 2026 at 11:19, claudiu beznea <claudiu.beznea@tuxon.dev> wrote:
>> On 3/13/26 15:15, Geert Uytterhoeven wrote:
>>> On Wed, 18 Feb 2026 at 16:19, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> Add GPIO set_config to allow setting GPIO specific functionalities.
>>>>
>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>
>>> Thanks for your patch!
>>>
>>>> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>>>> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>>>> @@ -1848,6 +1848,25 @@ static void rzg2l_gpio_free(struct gpio_chip *chip, unsigned int offset)
>>>>           rzg2l_gpio_direction_input(chip, offset);
>>>>    }
>>>>
>>>> +static int rzg2l_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
>>>> +                                unsigned long config)
>>>> +{
>>>> +       switch (pinconf_to_config_param(config)) {
>>>> +       case PIN_CONFIG_BIAS_DISABLE:
>>>> +       case PIN_CONFIG_BIAS_PULL_UP:
>>>> +       case PIN_CONFIG_BIAS_PULL_DOWN:
>>>> +       case PIN_CONFIG_DRIVE_OPEN_DRAIN:
>>>> +       case PIN_CONFIG_DRIVE_PUSH_PULL:
>>>> +       case PIN_CONFIG_SLEW_RATE:
>>>> +       case PIN_CONFIG_DRIVE_STRENGTH:
>>>> +       case PIN_CONFIG_DRIVE_STRENGTH_UA:
>>>> +       case PIN_CONFIG_POWER_SOURCE:
>>>
>>> Shouldn't you handle all types that are supported by
>>> rzg2l_pinctrl_pinconf_[gs]et()?
>>>
>>> The following are missing:
>>> PIN_CONFIG_INPUT_ENABLE
>>> PIN_CONFIG_OUTPUT_ENABLE
>>> PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS
>>> PIN_CONFIG_INPUT_SCHMITT_ENABLE
>>> RENESAS_RZV2H_PIN_CONFIG_OUTPUT_IMPEDANCE
>>
>> I'll add these as well.
> 
> Apparently you can't just add RENESAS_RZV2H_PIN_CONFIG_OUTPUT_IMPEDANCE
> to the switch statement, as gcc requires all case statements to use values
> that are actually defined in the enum:
> 
>      drivers/pinctrl/renesas/pinctrl-rzg2l.c:2072:9: error: case value
> ‘128’ not in enumerated type ‘enum pin_config_param’ [-Werror=switch]
> 
> As the documentation states this range is meant for custom
> configurations:
> 
>       * @PIN_CONFIG_END: this is the last enumerator for pin configurations, if
>       *      you need to pass in custom configurations to the pin controller, use
>       *      PIN_CONFIG_END+1 as the base offset.
>       * @PIN_CONFIG_MAX: this is the maximum configuration value that can be
>       *      presented using the packed format.
> 
> I fixed that by replacing the enum by u8 in the conversion macros:
> 
>      --- a/include/linux/pinctrl/pinconf-generic.h
>      +++ b/include/linux/pinctrl/pinconf-generic.h
>      @@ -173,9 +173,9 @@ enum pin_config_param {
>        * upper 24 bits.
>        */
> 
>      -static inline enum pin_config_param
> pinconf_to_config_param(unsigned long config)
>      +static inline u8 pinconf_to_config_param(unsigned long config)
>       {
>      -       return (enum pin_config_param) (config & 0xffUL);
>      +       return config & 0xffUL;
>       }
> 
>       static inline u32 pinconf_to_config_argument(unsigned long config)
>      @@ -183,8 +183,7 @@ static inline u32
> pinconf_to_config_argument(unsigned long config)
>              return (u32) ((config >> 8) & 0xffffffUL);
>       }
> 
>      -static inline unsigned long pinconf_to_config_packed(enum
> pin_config_param param,
>      -                                                    u32 argument)
>      +static inline unsigned long pinconf_to_config_packed(u8 param,
> u32 argument)
>       {
>              return PIN_CONF_PACKED(param, argument);
>       }
> 
> Probably a few more should be updated, too?
> 
>>>> @@ -2819,6 +2838,7 @@ static int rzg2l_gpio_register(struct rzg2l_pinctrl *pctrl)
>>>>         chip->direction_output = rzg2l_gpio_direction_output;
>>>>         chip->get = rzg2l_gpio_get;
>>>>         chip->set = rzg2l_gpio_set;
>>>> +       chip->set_config = rzg2l_gpio_set_config;
>>>>         chip->label = name;
>>>>         chip->parent = pctrl->dev;
>>>>         chip->owner = THIS_MODULE;
> 
> This change breaks pin control and GPIO on RZ/Five:
> 
>      -pinctrl-rzg2l 11030000.pinctrl: pinctrl-rzg2l support registered
>      +gpio gpiochip0: (11030000.pinctrl): setup of own GPIO can0_stb failed
>      +requesting hog GPIO can0_stb (chip 11030000.pinctrl, offset 18) failed, -95
>      +gpiochip_add_data_with_key: GPIOs 512..743 (11030000.pinctrl)
> failed to register, -95
>      +pinctrl-rzg2l 11030000.pinctrl: error -EOPNOTSUPP: failed to add
> GPIO controller
>      +pinctrl-rzg2l 11030000.pinctrl: error -EOPNOTSUPP: failed to add GPIO chip
>      +pinctrl-rzg2l 11030000.pinctrl: probe with driver pinctrl-rzg2l
> failed with error -95

Thank you for looking to this. I haven't experimented this with my RZ/G2L desk 
board but looking on other RZ/G2L board that I have access to (not on my desk) I 
can see similar errors even on RZ/G2L. I'll look into it.

Thank you,
Claudiu

> 
> For the can0_stb hog, rzg2l_gpio_set_config() is called with offset 18 and
> config 0x115 (PIN_CONFIG_PERSIST_STATE = 1).
> 
> Just adding PIN_CONFIG_PERSIST_STATE to the switch doesn't help,
> as pinctrl_gpio_set_config() also returns -EOPNOTSUPP.
> Ignoring PIN_CONFIG_PERSIST_STATE helps a bit, but the next call
> uses config 0x8, and pinctrl_gpio_set_config() now returns -EINVAL,
> but the pin controller now gets registered?...
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 


