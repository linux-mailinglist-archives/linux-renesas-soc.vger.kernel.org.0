Return-Path: <linux-renesas-soc+bounces-30166-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YD0CAXOBwmlneQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30166-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 13:20:03 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7608C308101
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 13:20:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62E31302E92D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 12:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D8C3E63A1;
	Tue, 24 Mar 2026 12:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DbtisNoh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF1634DB6B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 12:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774354406; cv=none; b=lq3xZrhQZoQc4UCbtnyxhA6A1Q5uWeQeGJsSFeAEm5rACxfkvaiTPnDMDkBq58LJgeyDAoEyAfnoM5l9W8t8ZG+OX69Prrx0voAEaozBSY8k3HErEseN8COWZryw9/sI9JL3irye4l0eQuKeTCFyKy5XoEsRvkuwKgg5x9BDZGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774354406; c=relaxed/simple;
	bh=6JL7si245mXkq5nnm78Qo+nx3gF/lncyNQ+73R1QH54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o/6EZLOh8rhe/dyPl0i4qTz3FwPDRBnPJ0rugSJY4Ebw2Od0oHMiLSmAzre0qsBjqMPS3m254gVJTNoWNceRAnSRyJ0V2tMHgqQDUAA5Y3Th9BFxlqp50GPIAv0RKwapJDBo6UZIZjU6z6ZzjNPUaQGXaCfvwT8vWx9Lo/4hO5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DbtisNoh; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12776bebe9fso368327c88.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 05:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774354405; x=1774959205; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=0szi+mILes8LVs2crfk+WLdxZPpH87uSZvRpbW20inE=;
        b=DbtisNohUG2jmBLXHBLvboVeWqhcyak9cm8PUfuoFgPLBZHYAKciQWifp8yZl1Y9W0
         t0kUvDUU+xcSk+FucDWQDYL9RVd9A5PQ/lvq/jYQeq1txSXZNyvCWNwAj3+zl6Y50Bro
         89yQ0bR85ppeBQlvm2E8fSERAJZKQkw2/hsMKX6gpiDCyw1Xs/WG7Rt32FS25pQYn0v9
         3hIhx+v5CWRJ3hjv8qRDCyhb2qYxNJDzvGWXq/bzaRjT52jFaVcVXrByVNqJCzETW5Dg
         oqinryUwLdR+CcF/eGJ+8HOZJliwyRDa/IXG0uh6Fa9VYI94LfUtfQGaLQX5NpFxqdmL
         DCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774354405; x=1774959205;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0szi+mILes8LVs2crfk+WLdxZPpH87uSZvRpbW20inE=;
        b=ZvUBcOvIIT9zSzGWN9QE1udj+pSnbWUa2iwwNekN63xd40suFS4uKMF+AQujw2tv+t
         Ufnw7owPYbu/k/iqzgIlEg2q4GGQ8vY9sGXK6vVuw76dnNe4gLRxsjyhytjUIG8QH/rh
         T0cRJY4X+CtDVDWUBEb+X1hTdHS3JWJIWjz5kPiyiOJaQJYb7plQkSepS7ESHX2lRiWS
         fClP8pveurdUkilYnSmjPTT+AY/Mi0GDWROnzMkccPORVitIh3ynrIAGJCMOUJ2D0mIg
         rGfdsyol9/4xR24q08nEraaSN3g95wGUv/HE3L9EIStMa28luOKHAv7q2LPjtUxlc+zE
         91tg==
X-Gm-Message-State: AOJu0Yy3l975jhm1ju7xb4+Da74uw4J5V6eC4PAAFgzTuC0ELd4sr6x2
	+OdbMrKvaZKiFL2SId5mIt9R0RujY4di+kmoicfnsCiwUPxiTaVGX5U0
X-Gm-Gg: ATEYQzzWRc5CSmHNdOqfOtp2AaTUodkXIK1Yc6VepObYAMwjCMV4cPLHofIFFAFPiSd
	iabZXkLtxBgxjtxhYnzPQ102JvPIG6g1DbXXBjauVcaVJn+u/1Zc0ttH9J5b0TOej3ZuPBis+o8
	ueF7J8IMQ+hMa1bOf0bfldqc74GTOa3ycgpZPRJE1G+bVnrn8c0OUBfnRpLpevntM642puvAYLd
	yZrflqAibXueqKdMv7lahyQ9cqAF36otBuyvmeJepJk2Bz4qpyNdir5qB6dzNTFVRALAzbaUxhl
	hUkQgAQWN1ko9jGsSFaMnxnWi/c7Jbhn6gXzWViOdLE78tV43bxbqSf/OdQjLGdNMqrm31EDjgn
	joQHtG/bzSgBKjLw6+bG0K6JTnn5/VJD021K2jyfSTOS3kyRE2YV5bb1JIQqACYChOOZWM4Khvb
	FDlZKpZ9c2q1a7zEPm39PJ6E+E6KFz25I8oca4Fd0uhCwf+whMU97MetIX1Pcc389KIxRUDdjz
X-Received: by 2002:a05:7022:6883:b0:128:dbbf:fd35 with SMTP id a92af1059eb24-12a726c2485mr8652405c88.28.1774354404508;
        Tue, 24 Mar 2026 05:13:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a733b4a99sm11162278c88.1.2026.03.24.05.13.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 05:13:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <bba20fb7-a244-4ec2-9860-f88353072691@roeck-us.net>
Date: Tue, 24 Mar 2026 05:13:21 -0700
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] watchdog: rzn1: Use dev_err_probe()
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260324114849.242755-1-herve.codina@bootlin.com>
 <20260324114849.242755-3-herve.codina@bootlin.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260324114849.242755-3-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-30166-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,roeck-us.net:email,roeck-us.net:mid,sang-engineering.com:email,bootlin.com:email]
X-Rspamd-Queue-Id: 7608C308101
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/26 04:48, Herve Codina (Schneider Electric) wrote:
> In the probe() function the following pattern is present several times:
> 	if (err) {
> 		dev_err(dev, ...);
> 		return err;
> 	}
> 
> Replace them by dev_err_probe() calls.
> 
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/rzn1_wdt.c | 18 ++++++------------
>   1 file changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/watchdog/rzn1_wdt.c b/drivers/watchdog/rzn1_wdt.c
> index b7034eac91d0..48d5afef62a5 100644
> --- a/drivers/watchdog/rzn1_wdt.c
> +++ b/drivers/watchdog/rzn1_wdt.c
> @@ -122,22 +122,16 @@ static int rzn1_wdt_probe(struct platform_device *pdev)
>   
>   	ret = devm_request_irq(dev, irq, rzn1_wdt_irq, 0,
>   			       np->name, wdt);
> -	if (ret) {
> -		dev_err(dev, "failed to request irq %d\n", irq);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to request irq %d\n", irq);
>   
>   	clk = devm_clk_get_enabled(dev, NULL);
> -	if (IS_ERR(clk)) {
> -		dev_err(dev, "failed to get the clock\n");
> -		return PTR_ERR(clk);
> -	}
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk), "failed to get the clock\n");
>   
>   	clk_rate = clk_get_rate(clk);
> -	if (!clk_rate) {
> -		dev_err(dev, "failed to get the clock rate\n");
> -		return -EINVAL;
> -	}
> +	if (!clk_rate)
> +		return dev_err_probe(dev, -EINVAL, "failed to get the clock rate\n");
>   
>   	wdt->clk_rate_khz = clk_rate / 1000;
>   	wdt->wdtdev.info = &rzn1_wdt_info;


