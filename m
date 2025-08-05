Return-Path: <linux-renesas-soc+bounces-20015-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 949AAB1BAD5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Aug 2025 21:19:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6316D18A7079
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Aug 2025 19:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6235E21CA08;
	Tue,  5 Aug 2025 19:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ildi21gB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D3E1C861A
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Aug 2025 19:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754421536; cv=none; b=I/4IQoenbi0B7HvueKeoCxT8LYMJ23TKB7DHZ+31x91VzmXA/KXyYselPTKASdOxBLt67H1ZnunyR7ykc4EVU6kqoaNoyUIDg37szHSqXFxRqoMhcXhpjwmPm2JDNKVFwcDjuh4EIupUFVe3IGaWw7NfuyBF8apIXY08iExAsBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754421536; c=relaxed/simple;
	bh=khGjDmYoi+SVIixaAvFiERs00u6nBzroY7eGFW5roXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m4azCiruBG+XckwRWkio1gv8iu4a7VuHg2wdBnVRtVvouIZhpqC1xIYMEkZ0/xGjSLYaUrMUtwB6L8a8H9LF7IxnX/swGBWuJaZrGA8l6sRKoydjdo0a9AxOSPtMZ9qytxcJJWTJVStGe7+d+bADgVA4bMugNQ3WsA8+q+Dfvvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ildi21gB; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6157ed5dc51so10450587a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Aug 2025 12:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754421533; x=1755026333; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=140O1ncFTG+fzY5FppRujDaW5fNy7s7sdArHFrnvSdA=;
        b=ildi21gBaTCVHfyjhck7rIu82xWd/B92KfQss9RFmmMU8Otrqj0HHIxZ/6y61wudjM
         6im+StLavEfnjjWmOTDtmDYvdZANYMxMSkwGQ9ovlAfcU+mK/N4bNqcazL95ks9VIFjf
         hwW0G1AaokOmET+Uzc4IHglz8+S6CHUJXE64WP53fquMenKmQM2hrIpjZYCkv1co58rJ
         j+V/RaKdo5mO4DN28MBEb8K4hPnmXQ2MjyNfpsLI/h+RtgfE/hVx+eFa5EQTSRDMY+yu
         8SURZLIcMFS0x+P7MeYEt5TXjxWZVj+2ha03evTdWZPVXZqwOSdd+6fWFkSmQNqWkt5F
         aOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754421533; x=1755026333;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=140O1ncFTG+fzY5FppRujDaW5fNy7s7sdArHFrnvSdA=;
        b=V+VPxVXn2e4iv15hFgzTDcnL/4ihanzCwlq12lfD4rOb5n1pWxzuEWKkNSPZIIFDWC
         rrKUnu8w7Hbqmf76o1hWLj2nGQJ1O7XmN6OZ/kraHxQSGx9UzVBoN95DKP1+ju97JvUM
         4VaBlKhezEwf7vQU02AFslcCaRggBRKzUoyWjeaRbvu0ARIw343P3C991FicLGDyz3eM
         TQTWUcUR87i/NmODUYF6OqxwElJaQjxo+/8q6nxQyKjojp2US3zAFxjs5AAinnVS/koX
         SGlWRvm2aewR8LC9b8+vXKn9TE4TeQjamoj8ugb2KZyOou+Xg8EULoJxDGPhVM+pHYf7
         W+1w==
X-Forwarded-Encrypted: i=1; AJvYcCXGJKb09+V/fe/G+oX6lMNE62g0LpEKKieZ46tvnT34okjuNiP/VC1JlPJ5E0HocdnC3XYFZYhX8JHIWa1EH8xIFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Vj1vUVdoFlgfpiDqyNpmlEJeXP6CdHZ5skx9UeKFzHSQeN7g
	pU7y+0TzwhW2/jTQUOOYpbOhsFniBslI3TA4Y3y+oXsrCYxJjeRdX8PMD/Y3Cl5+ayyTHo1jlCs
	WsUiv
X-Gm-Gg: ASbGncv0RlQzwUEOoIuxD1IQBNhPNqaLLKW7X6JnUpXnbvtuTFJUjihuOOHo/2u/pud
	h5gbaqcW9blw1MMVekfDyY/uB/c20pn3gHoDxJ76o5xOyUJikXpM9ZBji151MPiIFZSYrgnLxb9
	PA/PXD1k23Shs71Ll/vG22wutbyv6leXJu/cX+ISTXR55srT4sfS5vnTXmgxuKTjsyXMDbM+Gf5
	HPK7lWInlHq+mg8BkseGtVYIXxvWNJaJAOWhYZHM2NG0Xvu8CkP3LiQCDSLIl3nXRQRlzIxWLs3
	zF5XbI0wavBUh5EC+MN7dl3AJBFVGlAL0GpudvIxg9GboWQ2W8D37MLnIYvLaKHjw+0qdvioWrs
	BUESx7c/dOXUnZ4JnpqrXAjzauqUBNUY=
X-Google-Smtp-Source: AGHT+IEzXYwKjDntoDBqUMYR9EV4V8wSDk+SRkS8ZRK9bW7nJsA/RiJNAmx7QhFIkvnw2H395/NCDA==
X-Received: by 2002:a17:907:1c84:b0:ae3:f3c1:a5dd with SMTP id a640c23a62f3a-af99050715dmr11853966b.61.1754421532805;
        Tue, 05 Aug 2025 12:18:52 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a078a11sm974656666b.7.2025.08.05.12.18.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 12:18:52 -0700 (PDT)
Message-ID: <0e718be7-32df-4fc1-af49-8dfd42143d55@tuxon.dev>
Date: Tue, 5 Aug 2025 22:18:51 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] clk: renesas: r9a07g043: Add MSTOP for RZ/G2UL
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250704134328.3614317-1-claudiu.beznea.uj@bp.renesas.com>
 <20250704134328.3614317-4-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdXfGg6KfKt4dGf8NrboEPXF7fnq+dcM=sppYcgcq3csvw@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdXfGg6KfKt4dGf8NrboEPXF7fnq+dcM=sppYcgcq3csvw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 04.08.2025 13:18, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Fri, 4 Jul 2025 at 15:43, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Add MSTOP configuration for all the module clocks on the RZ/G2UL
>> based SoCs (RZ/G2UL, RZ/V2L, RZ/Five).
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/clk/renesas/r9a07g043-cpg.c
>> +++ b/drivers/clk/renesas/r9a07g043-cpg.c
>>         DEF_MOD("canfd",        R9A07G043_CANFD_PCLK, R9A07G043_CLK_P0,
>> -                               0x594, 0, 0),
>> +                               0x594, 0, MSTOP(BUS_MCPU2, BIT(9))),
>>         DEF_MOD("gpio",         R9A07G043_GPIO_HCLK, R9A07G043_OSCCLK,
>>                                 0x598, 0, 0),
> 
> MSTOP(BUS_PERI_CPU, BIT(6))?

Yes, this should be here. I'll add it in the next version.

Thank you for your review,
Claudiu

> 
>>         DEF_MOD("adc_adclk",    R9A07G043_ADC_ADCLK, R9A07G043_CLK_TSU,
>> -                               0x5a8, 0, 0),
>> +                               0x5a8, 0, MSTOP(BUS_MCPU2, BIT(14))),
> 
> The rest LGTM.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 


