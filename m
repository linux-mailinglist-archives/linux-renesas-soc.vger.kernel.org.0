Return-Path: <linux-renesas-soc+bounces-594-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BC9802C2A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 08:38:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFBAD280DC1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 07:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50582C12D;
	Mon,  4 Dec 2023 07:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="SIE4G4sT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03CD5F2
	for <linux-renesas-soc@vger.kernel.org>; Sun,  3 Dec 2023 23:38:04 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3333a3a599fso723619f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 03 Dec 2023 23:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1701675482; x=1702280282; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+q9nPE5Jop3Q7yA3sdyMkSZevXSnAGPI5CdWYoOLt1w=;
        b=SIE4G4sTNF8TlSWw5vMo1KC5E/ZxATteRf52rmyD3mckx6zOGEPXXHBgNMoYR8iHjW
         1l21boETr0/iRtvEfCH43RtWWhMx0TFKV4Ow1tM3vrc3vAXxKca3eSj0iGL41oD4cuix
         7bGYeZJqZnYCq7G2m8iJvIg6gCs7cb4SVVIYUsuq/jFzbRybe6IJEShLGU1z0P4Zhf+l
         eduYFgTH12sFvGD5ydLEQVpe/WoVCcle1fMYQTdRwu20Tk40v/vJObeXRk/gi4Xtgb4S
         HV9YazPOUYIi4/d3S7Y781q1hirBj/xxIoq6aiZtrihLYQTRkqIRx7iwM6DT1anAcYGJ
         k7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701675482; x=1702280282;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+q9nPE5Jop3Q7yA3sdyMkSZevXSnAGPI5CdWYoOLt1w=;
        b=MS80UTgiEji/AnbrSlnvo9V4L5oUAndwDWxWrQ69lqV4fdikUiBpmyg3dLWlJBNzXm
         QLc4jMfNu1q4N1gPOA87dupegr/bJDY2MH2RQSrnEbtodWgLr6geD8RRF3hkU+FOU1Ek
         CRzKVpeeqVARjYsOpypdizavp3iRqg7D4k4I0aSrwcPuia66KiZrXB5GGlxVeNhzEUjp
         4Yrm2qHlYWEHZdXBRo3jl+iHZbU5pRvtV35UO59sv5YKUsVRoP1MgbZcji/uf2eBW6pq
         wrGEP5jYq5Dem6oZobVJ/kmFGeEm07mHEgMU/yTqvDlebxYxoj8eKIyFIJHb9iJmiXTx
         ZPWw==
X-Gm-Message-State: AOJu0YwZKe7wDDaRiF2NUPJh9TzXRU7Nvv2ipj4APs4vSm+u6cXdPWk3
	7dWB/qo3VnuDUUrH3/aXfmorLw==
X-Google-Smtp-Source: AGHT+IFBMeVqCxTwC/4y34OFZSyYkJTII5ztxhOtTpa0nilRN10tKpaXZIshwtW5tUYhKuhIG2WwBw==
X-Received: by 2002:a5d:6342:0:b0:333:2fd7:9604 with SMTP id b2-20020a5d6342000000b003332fd79604mr2512979wrw.63.1701675482341;
        Sun, 03 Dec 2023 23:38:02 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.22])
        by smtp.gmail.com with ESMTPSA id a4-20020a056000050400b003334675634bsm2946288wrf.29.2023.12.03.23.38.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Dec 2023 23:38:02 -0800 (PST)
Message-ID: <f2282f18-e789-4f1e-a321-4c744c952537@tuxon.dev>
Date: Mon, 4 Dec 2023 09:37:59 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/14] pinctrl: renesas: rzg2l: Move arg in the main
 function block
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 linux@armlinux.org.uk, magnus.damm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, linus.walleij@linaro.org, p.zabel@pengutronix.de,
 arnd@arndb.de, m.szyprowski@samsung.com, alexandre.torgue@foss.st.com,
 afd@ti.com, broonie@kernel.org, alexander.stein@ew.tq-group.com,
 eugen.hristev@collabora.com, sergei.shtylyov@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, biju.das.jz@bp.renesas.com,
 linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com>
 <20231120070024.4079344-6-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWJJ=pjY5YFG=UxL+rWhYtWKicjbGUj-7KC1tgaz4tB3Q@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdWJJ=pjY5YFG=UxL+rWhYtWKicjbGUj-7KC1tgaz4tB3Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 01.12.2023 18:15, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Mon, Nov 20, 2023 at 8:01 AM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Move arg in the main block of the function as this is used by 3 out of 4
>> case blocks of switch-case. In this way some lines of code are removed.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 11 ++++++-----
>>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> Unfortunately your claim is not really backed by the diffstat.
> What about moving index, too?

Sure, I can move it, too.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

