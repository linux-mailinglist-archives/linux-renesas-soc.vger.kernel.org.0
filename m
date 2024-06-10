Return-Path: <linux-renesas-soc+bounces-5983-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B505901A88
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 07:55:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 932581C227EB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 05:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1269383A5;
	Mon, 10 Jun 2024 05:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="lVpmfPeY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC5122EE5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jun 2024 05:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717998799; cv=none; b=DwhX482a6QkmyeU/H4z6Bfe808tnOfhg1ptOVT8arZUWJX1IHtqKgVDyEGrwLG97OJDJn0F+tP1aDC0LiJ+Tc+7d/hHCQuVlekksOi5xpykocUJz4E91eCWyzvE5T1xd1IGbwEY254fZ/ED+RQzQg0Udz+GGtJ5rXoVgqraTNNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717998799; c=relaxed/simple;
	bh=irF8ph+PrFtqkoPopgFU4I8t5Afbf3NJWtvx9cvnnNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n36rHpjw6tCvzi+obnHXQTB/FqshxApTvoU2it0AVKna+lhc5SdLBQkUi7snq0H/dEY0HyCwdXCU5kVkrc0lyVc2qAfkDDzLdhm9bp5YWtqvkFSamqIK9fwl9LfctxNzJ9XdNYEmeEeKGmFsoModUxIdgPfNr12GC4WdZkQmMZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=lVpmfPeY; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42189d3c7efso6593955e9.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 09 Jun 2024 22:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1717998796; x=1718603596; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1bnbZBagSaTn2JXJEWNJzTIrkukPRASk2JO9D05+bKc=;
        b=lVpmfPeYKugBdCI73C8xvFZN8+yWzNJWjZTdXNwtqGc0ynTdTXiPqK6USARFrMPUKC
         cSDz/PfjoWLgYYdrxLxPxr+Q+pyhshmBIlWSD/wjMbYbrVg0Gy5YsANPthcsl+DMB7Dd
         tgCM0rgz2/lABsnfT0P2d3bS1LB3RSZ0dy24Nzra+Uu1+w6Ks5X1ikjf1o81jrLPi4I0
         3olxMxVPm2J6LIGPzTV9V3HFppAqCUsr18CEUC24vIPxN2eZ1OBIgTQNjyOHuWG4pjFy
         q9+oudRypJnmxSd3mZhbac7D4ESUhG8gO5tnBkv8bgS9sXr1ZUc3T5QwLByQvYkQxP12
         lSMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717998796; x=1718603596;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1bnbZBagSaTn2JXJEWNJzTIrkukPRASk2JO9D05+bKc=;
        b=ZupPtoGrDL5PoYt4P+t2/YlXvzcmF2ez6EpL2kpMKkLVksBF0UAc9sbCZLpEnuyJeo
         AFTh5SFSySBfXznRqhtA5TClbAMqWq2vvFuCr8F4zSwwCursSncN9MTXVaQ84QYrLHu8
         Ljk+8R1pvRSwKXEDOz8unW9DhwIvMUK5RUI1kRHd4Dj7XTHUJJibjOKfqkQ8u6I+F8eU
         E+UqvfgCOkdXw7CZpejWkR8K5fNEa5coUvTe3y7BBtldoEtawbdoASPBYLxiMjNyC/Ri
         wlHfITrnYagAr14Eis6RTGpEblJHERpTJrqHprbmZ5BVYWQ9qKPQUDS/bDkeA3EtYXUl
         xJkg==
X-Gm-Message-State: AOJu0YxMW1uxDwJ4xXo2JmL1EhqLh2HTG7eStaPHxkd8qrvQH6YdFKVp
	xwb/9SWeAAEGxoBbXAazvgyBq6xWOpdksOtIa2EMWMyBPCzhngNxLywAv5UUQS8=
X-Google-Smtp-Source: AGHT+IHkqS3HnQXP1SM4LUXFiNo/Si5rJY65Z+dzTqZYGUmZoPX12HJYXMHMRVy8hlem/Uo5GeZbEw==
X-Received: by 2002:a05:6000:1e81:b0:35f:650:e8ff with SMTP id ffacd0b85a97d-35f0650ebb8mr5580030f8f.28.1717998796001;
        Sun, 09 Jun 2024 22:53:16 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421cc89e055sm25464975e9.13.2024.06.09.22.53.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Jun 2024 22:53:14 -0700 (PDT)
Message-ID: <48262d5c-4dde-40c5-991c-f373f24b2018@tuxon.dev>
Date: Mon, 10 Jun 2024 08:53:13 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/15] pinctrl: renesas: pinctrl-rzg2l: Validate power
 registers for SD and ETH
Content-Language: en-US
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240530173857.164073-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240530173857.164073-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 30.05.2024 20:38, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> On RZ/V2H(P) SoC, the power registers for SD and ETH do not exist,
> resulting in invalid register offsets. Ensure that the register offsets
> are valid before any read/write operations are performed. If the power
> registers are not available, both SD and ETH will be set to '0'.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S

> ---
> v2->v3
> - Included RB tag
> 
> RFC->v2
> - Update check to != 0 instead of -EINVAL
> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> index 89716e842c63..6e3b1adb95f6 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -2503,8 +2503,10 @@ static int rzg2l_pinctrl_suspend_noirq(struct device *dev)
>  	rzg2l_pinctrl_pm_setup_dedicated_regs(pctrl, true);
>  
>  	for (u8 i = 0; i < 2; i++) {
> -		cache->sd_ch[i] = readb(pctrl->base + SD_CH(regs->sd_ch, i));
> -		cache->eth_poc[i] = readb(pctrl->base + ETH_POC(regs->eth_poc, i));
> +		if (regs->sd_ch)
> +			cache->sd_ch[i] = readb(pctrl->base + SD_CH(regs->sd_ch, i));
> +		if (regs->eth_poc)
> +			cache->eth_poc[i] = readb(pctrl->base + ETH_POC(regs->eth_poc, i));
>  	}
>  
>  	cache->qspi = readb(pctrl->base + QSPI);
> @@ -2535,8 +2537,10 @@ static int rzg2l_pinctrl_resume_noirq(struct device *dev)
>  	writeb(cache->qspi, pctrl->base + QSPI);
>  	writeb(cache->eth_mode, pctrl->base + ETH_MODE);
>  	for (u8 i = 0; i < 2; i++) {
> -		writeb(cache->sd_ch[i], pctrl->base + SD_CH(regs->sd_ch, i));
> -		writeb(cache->eth_poc[i], pctrl->base + ETH_POC(regs->eth_poc, i));
> +		if (regs->sd_ch)
> +			writeb(cache->sd_ch[i], pctrl->base + SD_CH(regs->sd_ch, i));
> +		if (regs->eth_poc)
> +			writeb(cache->eth_poc[i], pctrl->base + ETH_POC(regs->eth_poc, i));
>  	}
>  
>  	rzg2l_pinctrl_pm_setup_pfc(pctrl);

