Return-Path: <linux-renesas-soc+bounces-3794-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 811A087C893
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Mar 2024 06:45:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2ED8B21DE4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Mar 2024 05:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F13F10798;
	Fri, 15 Mar 2024 05:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Rb9qGSYm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D252CDF51
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Mar 2024 05:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710481534; cv=none; b=AI6G6LFMdianMtUscmuAQTfc3xIt2aTY4UCE7ESvqtfCgZXrI35ZQTlOJaVAK2VxdChUuf5UaCF+cvpcqfkFpL59476o9vvfVoIP57083aBU6G9ZQP/lIpgplA2wEiRSC433KOlJyTH0CZoQ+tme/R8y9oHVnOTk17T1zOFdH1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710481534; c=relaxed/simple;
	bh=yX7VicevsNuvF9VXEJnE44eZDFitCUd+/l9FIxvXfkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WkHM7rNgmtyWyv1nFHBsLezLct/1Fi56794+86+GmN7C+yL6HXL5UA/LtJekxqbIDSsWT/pgxY3Mc8aiYDFTY6vr8d0j7PNdbj90eeMwIT5BR1OcXjuEdwLtQ/YhwM+AMesqOHhjBIO9n74xx9bXdeO1+IR5R3rTMooph9G7YYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Rb9qGSYm; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-413fea12b50so5664065e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Mar 2024 22:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1710481530; x=1711086330; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JpRnrAIn/rvD/vmAzL2Fo5N09hMac0TklJtSlC0gZ2I=;
        b=Rb9qGSYmUt/IjHSyU+lS0nXCqfswGGIro9ifG8KQK2QuKg2tvSD11rSHxnUTTEE8da
         ea/YUGTVX3xld1gfR0JiyCTYOoLgE1ZSFs/IFeT+XHY2HKj3vmcLadmlBO4I2xSsOTUH
         87KMo8V6W5ZhEfKtmHMdTB12BNVWLdu8xW0k5SoixttJcOr/bZYPbS2pw7NnuFMXflZV
         Z6m6FGZBFaV6yu1zoOMrDhwzIzAeJd9CIWJYoh67E66VZSjMzSUWGmi9JqeInuaYsuNE
         WHLN+GCZfrmuqcyafFzrM2Ke2JpKheuRnLYHhNZIxve7un3QN+80hrw1K0zDUh0CL1d6
         MNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710481530; x=1711086330;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JpRnrAIn/rvD/vmAzL2Fo5N09hMac0TklJtSlC0gZ2I=;
        b=Zkppj6G3PyNm6Nz21q8pFkoczTiZXqwdpGfPKCxu/YL3cC+EWbgZXkOrvFwsLidCtB
         f06n/HNYtLEgF1OgkUyYcvjTPqheQCd8cuCh1p5Qr3LPJwvvSKQwg1WZY+0CVGRPJH6V
         oqoblRIVVgFQPjeK1UODFKYCZi/YtNot5h5orcWNXI/unzO5i6aWoKz8VQKTfSLXlnCo
         v/xmxf/Hu40HFLkO6v0iQjUs40eQ5Sg5b66oUXSdN4YiWhu8m1RriVdPnXTPcgrywv4x
         u82ZxRJsVcgqAh8L5DM8GxOSH5A1Qjs1feUfe4hJxwvcG0hwLZTqcQyHG7mu4kaIVMfi
         ka/Q==
X-Forwarded-Encrypted: i=1; AJvYcCURrHYessyP2hEGGwcN6J+eIewHrE3B+DjGvHpS4xkN5okR9thvTEVWw/VhCekCBqS57I8xqqCnZbyHq3412BgI213D39RW4x2MtCzf+1arLrQ=
X-Gm-Message-State: AOJu0Yw8XTahXu9rWvF8YBwT1QyqwsOfj1Uvk8e9e7wtcYVrF9H68Lc6
	zDniB828QaZeK1SPf1ZPuhdTYxht0C9efJhX2GtmCQ7/FWcrF94jxGfXylXOohA=
X-Google-Smtp-Source: AGHT+IHFKsEUWmjj72ckU06dF/imbXrla5Tf7+YdQNvoAPjC+u+S7AdXYn+AbEERH8+s44vIJv5Plg==
X-Received: by 2002:a05:600c:8509:b0:412:beee:36b3 with SMTP id gw9-20020a05600c850900b00412beee36b3mr1986307wmb.7.1710481530057;
        Thu, 14 Mar 2024 22:45:30 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id bd7-20020a05600c1f0700b00413f3ca39easm3687567wmb.5.2024.03.14.22.45.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 22:45:29 -0700 (PDT)
Message-ID: <c27c5d58-9cab-4a76-ac70-e074ea0b43af@tuxon.dev>
Date: Fri, 15 Mar 2024 07:45:26 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/10] clk: renesas: r9a08g045: Add the
 RZG2L_PD_F_CONSOLE flag to scif0 PM domain
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240307140728.190184-1-claudiu.beznea.uj@bp.renesas.com>
 <20240307140728.190184-10-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdXJtBNBqitJ3-5zC9JAJSZvP+4-9wOK9p8OO-OR42dUqQ@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdXJtBNBqitJ3-5zC9JAJSZvP+4-9wOK9p8OO-OR42dUqQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 14.03.2024 18:06, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Thu, Mar 7, 2024 at 3:08 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The RZG2L_PD_F_CONSOLE is used by the rzg2l-cpg driver to check if the
>> SCIF domain need to be powered off in suspend. This is necessary when
>> no_console_suspend is available in bootargs as we want to still see
>> output on console, thus scif0 domain should remain powered on.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/clk/renesas/r9a08g045-cpg.c
>> +++ b/drivers/clk/renesas/r9a08g045-cpg.c
>> @@ -293,7 +293,7 @@ static const struct rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] = {
>>         DEF_PD("scif0",         R9A08G045_PD_SCIF0,
>>                                 DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(1)),
>>                                 DEF_REG_CONF(0, 0),
>> -                               RZG2L_PD_F_NONE),
>> +                               RZG2L_PD_F_CONSOLE),
> 
> This is not really correct: if SCIF0 is used as the console depends on the
> use case, i.e. on chosen/stdout-path.
> So this flag should be set at run-time. You can check the power-domains
> property of the node pointed to by of_stdout to find the PM Domain that
> holds the console, cfr. drivers/pmdomain/renesas/rmobile-sysc.c.

OK, I'll double check.

Thank you,
Claudiu Beznea

> 
>>  };
>>
>>  const struct rzg2l_cpg_info r9a08g045_cpg_info = {
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

