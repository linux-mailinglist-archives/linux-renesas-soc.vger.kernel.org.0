Return-Path: <linux-renesas-soc+bounces-4143-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A98088F9DA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Mar 2024 09:14:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5026129A505
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Mar 2024 08:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C6857885;
	Thu, 28 Mar 2024 08:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="HeAihEza"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C7A42A8B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Mar 2024 08:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711613620; cv=none; b=HrsEaqZJt82Hucylxyjng+rtHZKSB4qqOT7pBTsShTVnYSKgMk6nChtoPgI0OXIMs5wN9w2KR/l76jZHAc5+AeFcBWdxSDxfBqhU6TElPj0+FUYCAxjAzO5aWJaowmVNCbMwC3ZSocgi3lktJdSilwh9IcR4xC2MpX2guxyjGGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711613620; c=relaxed/simple;
	bh=FIsjauAGW7cliVE71BcA/zerW8wcOHae6w70Q03hE4E=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=D0S7sOoYbQSnVm5nfm5Nkf39TWIPX9+wWKbKpqaRhcc6R88qX9j8AcK+Yyyw6K3t2/iJfOvYeVmxdpjMqMVOo/ZkoXteiTVogZPqOj0Tn/jw4b5eZuTpTPI6caf3AvkkF1LFPL3BzAu37Q8g9h2g+hMofFoQzgbKy5aqLF+4A1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=HeAihEza; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a4e1742d3a3so67478266b.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Mar 2024 01:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1711613616; x=1712218416; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0J2u/PeSGTbNqHUWrYyWUQE0q4T+iokgxOojZvQvOGM=;
        b=HeAihEzaZdqOGAP92h3Bw10neraHkhLqMvw4QaMHjJYwv1dnYrGpP2XFW/+K6hwreU
         juWyMxPPjkg6s8iqKC1VbA5r9OlyUIKr52qwqYzikrkYVfWJFpLUiww7mOcbqCiPNMm1
         XGCeA4q4q0ktZVJq2nHoppvkWuJlzQYyBCY8WRJOySwOK454tSlZ/H3Pfv/w9PbSLGLM
         si7IwkbRUkGRy39ocNXpawX7DapylQ6xkuiKB5hywpPbmw9jd3NmKvBAgm4/tBlgkR30
         PwCmjPRMB8AkbVhyHgGeY1ueuI4Qsw0Ca6inu9Mnup0DfBR6Gd7hHMfv63ETNpmkiFKe
         Ee4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711613616; x=1712218416;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0J2u/PeSGTbNqHUWrYyWUQE0q4T+iokgxOojZvQvOGM=;
        b=po91jkod9++aovcrHlu1aF7ywlGysFTNMA4WnzHyOEaf2DJK0jPbbIWRo6Z51HAwt/
         BQtIqqoGeXdl8BE8TpqWwQpeeUZYCLL6b2Mtn0Im0v7Cr/4kuWuT3x2l4guVAR8rHcqZ
         yqi6eXfIU7dy5Hc/TBv/X1oU2yNynu0mruB2/3JhOuZnAYUX0pgpRun+MhZ4n6teJ/bQ
         ea4WgmPOtvNeiMty9w4oOKGL7usmo+Q5359ZpDzm7KRsuit2wVh+g7SXMxHuGt4MuT5m
         I5+CIeNYTSnsNoEacDf/+l/uw8mgbKNUMSxNZ4iw6LAJg86XKi+0cM74o+ahBJe6bvQh
         9i5A==
X-Gm-Message-State: AOJu0YzHjU1E/+6Jtfq4em3zcdbUwaOGrgw8cWhlCMAVx7ikdBloxUPL
	cel4EyVDQCFdXfT9XxPG9knG0rDnjsTv7AddTf/Ge2z/KK8sT+yQn2iLIV7wldA=
X-Google-Smtp-Source: AGHT+IExOtwPjzyqqfM0LuMiuU1yntcqEig5+uve86nziRlRwPWJTOYkvWhJJ+0LmRyg+izP/ZvXUg==
X-Received: by 2002:a17:906:2b90:b0:a4e:def:f88b with SMTP id m16-20020a1709062b9000b00a4e0deff88bmr1088903ejg.31.1711613615940;
        Thu, 28 Mar 2024 01:13:35 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id d6-20020a1709063ec600b00a474c3c2f9dsm454585ejj.38.2024.03.28.01.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 01:13:35 -0700 (PDT)
Message-ID: <3d3a651e-2853-4b5b-bc8a-6f494250d9c7@tuxon.dev>
Date: Thu, 28 Mar 2024 10:13:29 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 08/13] pinctrl: renesas: pinctrl-rzg2l: Add function
 pointers for writing to PFC
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240326222844.1422948-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240326222844.1422948-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <4bd3b33d-564a-45e0-905c-d0deb52e6f38@tuxon.dev>
In-Reply-To: <4bd3b33d-564a-45e0-905c-d0deb52e6f38@tuxon.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 28.03.2024 10:02, claudiu beznea wrote:
> Hi, Prabhakar,
> 
> On 27.03.2024 00:28, Prabhakar wrote:
>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>
>> On the RZ/G2L SoC, the PFCWE bit controls writing to PFC registers.
>> However, on the RZ/V2H(P) SoC, the PFCWE (REGWE_A on RZ/V2H) bit controls
>> writing to both PFC and PMC registers. To accommodate these differences
>> across SoC variants, introduce set_pfc_mode() and pm_set_pfc() function
>> pointers.
> 
> I think the overall code can be simplified if you add  1 function that does
> the lock/unlock for PWPR. See patch 13.

I meant to say one function for lock and one for unlock.

> 
>>
>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>> ---
>>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 14 ++++++++++++--
>>  1 file changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>> index 705372faaeff..4cdebdbd8a04 100644
>> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>> @@ -246,6 +246,8 @@ struct rzg2l_variable_pin_cfg {
>>  	u32 pin:3;
>>  };
>>  
>> +struct rzg2l_pinctrl;
>> +
>>  struct rzg2l_pinctrl_data {
>>  	const char * const *port_pins;
>>  	const u64 *port_pin_configs;
>> @@ -256,6 +258,8 @@ struct rzg2l_pinctrl_data {
>>  	const struct rzg2l_hwcfg *hwcfg;
>>  	const struct rzg2l_variable_pin_cfg *variable_pin_cfg;
>>  	unsigned int n_variable_pin_cfg;
>> +	void (*set_pfc_mode)(struct rzg2l_pinctrl *pctrl, u8 pin, u8 off, u8 func);
>> +	void (*pm_set_pfc)(struct rzg2l_pinctrl *pctrl);
>>  };
>>  
>>  /**
>> @@ -526,7 +530,7 @@ static int rzg2l_pinctrl_set_mux(struct pinctrl_dev *pctldev,
>>  		dev_dbg(pctrl->dev, "port:%u pin: %u off:%x PSEL:%u\n",
>>  			RZG2L_PIN_ID_TO_PORT(pins[i]), pin, off, psel_val[i] - hwcfg->func_base);
>>  
>> -		rzg2l_pinctrl_set_pfc_mode(pctrl, pin, off, psel_val[i] - hwcfg->func_base);
>> +		pctrl->data->set_pfc_mode(pctrl, pin, off, psel_val[i] - hwcfg->func_base);
>>  	}
>>  
>>  	return 0;
>> @@ -2607,7 +2611,7 @@ static int rzg2l_pinctrl_resume_noirq(struct device *dev)
>>  			writeb(cache->eth_poc[i], pctrl->base + ETH_POC(regs->eth_poc, i));
>>  	}
>>  
>> -	rzg2l_pinctrl_pm_setup_pfc(pctrl);
>> +	pctrl->data->pm_set_pfc(pctrl);
>>  	rzg2l_pinctrl_pm_setup_regs(pctrl, false);
>>  	rzg2l_pinctrl_pm_setup_dedicated_regs(pctrl, false);
>>  	rzg2l_gpio_irq_restore(pctrl);
>> @@ -2672,6 +2676,8 @@ static struct rzg2l_pinctrl_data r9a07g043_data = {
>>  	.variable_pin_cfg = r9a07g043f_variable_pin_cfg,
>>  	.n_variable_pin_cfg = ARRAY_SIZE(r9a07g043f_variable_pin_cfg),
>>  #endif
>> +	.set_pfc_mode = &rzg2l_pinctrl_set_pfc_mode,
>> +	.pm_set_pfc = &rzg2l_pinctrl_pm_setup_pfc,
>>  };
>>  
>>  static struct rzg2l_pinctrl_data r9a07g044_data = {
>> @@ -2683,6 +2689,8 @@ static struct rzg2l_pinctrl_data r9a07g044_data = {
>>  	.n_dedicated_pins = ARRAY_SIZE(rzg2l_dedicated_pins.common) +
>>  		ARRAY_SIZE(rzg2l_dedicated_pins.rzg2l_pins),
>>  	.hwcfg = &rzg2l_hwcfg,
>> +	.set_pfc_mode = &rzg2l_pinctrl_set_pfc_mode,
>> +	.pm_set_pfc = &rzg2l_pinctrl_pm_setup_pfc,
>>  };
>>  
>>  static struct rzg2l_pinctrl_data r9a08g045_data = {
>> @@ -2693,6 +2701,8 @@ static struct rzg2l_pinctrl_data r9a08g045_data = {
>>  	.n_port_pins = ARRAY_SIZE(r9a08g045_gpio_configs) * RZG2L_PINS_PER_PORT,
>>  	.n_dedicated_pins = ARRAY_SIZE(rzg3s_dedicated_pins),
>>  	.hwcfg = &rzg3s_hwcfg,
>> +	.set_pfc_mode = &rzg2l_pinctrl_set_pfc_mode,
>> +	.pm_set_pfc = &rzg2l_pinctrl_pm_setup_pfc,
>>  };
>>  
>>  static const struct of_device_id rzg2l_pinctrl_of_table[] = {

