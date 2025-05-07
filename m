Return-Path: <linux-renesas-soc+bounces-16749-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C33AAADEC3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 14:16:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1794A3B5648
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 12:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E01259CAA;
	Wed,  7 May 2025 12:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="XzKgwmCr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05867221FB3
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 May 2025 12:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746620023; cv=none; b=bZnYuQp2PMGdhjNhT+QdO3jC/bVpbsFuRZdooVAi0Mr/cILJ7esU2I192RlMF5/ppAMjFw6C+4Y9N9oFF8zgCddKoeDmvvXKg2Z46nVvO19wi4FaN8sBggJRM9OdiKMcTbkZ4Vgwx1t0XWtQpsoQIGebv1xLC2aArKl4uoNcNoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746620023; c=relaxed/simple;
	bh=u3YGbEuFNryf6SNWwXAZAEVAEqJ9fVFoDM0PMM9rdH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ueWzyudFJSxAvDyeE68woGC+78PgRvpGipEkGtP+2idM2XFe8kS2/y1CS/2kTwChQnmHwWLYR6wFBZVIIjQV0iD/Ppq9qnGkyp2sthrLa+nLjgJoPu5lX7SKQqHsr92gPWlmS2wuNlHzKzkri2vRHNyDNs3wBcFboRYZ4qp72/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=XzKgwmCr; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5f6214f189bso12804972a12.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 May 2025 05:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746620020; x=1747224820; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sAeRVsznyaBFX32tf0NMNXsCTB91G1fsVj/Eu7YcKtM=;
        b=XzKgwmCr5eP4SnDRYbZ+ORSsN+XQDM5E7ofz2+1e/Nb872dQea2i812h3Y2qYYAX4u
         00Z+1iIXsua0+v54l4j2rMZrhQuJRQMzYjZZjl8q0hAMmK0n/poLRKvrVh1FDQErc0xa
         Rl3+/D7v6uZtXpDE4qoUCxtJyRuSF4EnlO/vU3NSGbIiku+zmqYq1xHtHuraiflHoNqu
         L3GrwvM2uGx5/cg0CuYRnGkXs+ndDIpVgk1tqKn65xt99kjnOFLEKJQ1A4Zs2Hmj8sMQ
         WmMLtSP3lGugkrqlCjdASWR97Ww3eqiQwBx9GMlhTigvVhFNWS4RJZHxEFjEKUNnLwWa
         1pEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746620020; x=1747224820;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sAeRVsznyaBFX32tf0NMNXsCTB91G1fsVj/Eu7YcKtM=;
        b=HdFKxmnVoK6NhL+hTY6Ea2CUouhBg8aKDYUZxYDtFxHrBjwmh/k6+UoexJa6vnK0i+
         sB33i0j55Tm8UF2n5SMj0dsZeWi+8w7k3//yib78a9x9Yozu7wPj84AJFdgL1vv9wI1Y
         lpC+Q9WV560HmtYYuNepkeaepnl7xHmkhmoQQnYQXUlrGdX6eFOQG6OC/kDDtnLXLNA/
         I0ht4v//lFhNtfIaxOTGfgxCA1I6cbz1O6Ig+m81OuQOO5Ve2LAOUJ79VgPS0NsNb0Tp
         4vcoQaUrAqbMOG8NIfW8dugno/jvHTJ2FUMA4tv8ijfZChUswrC+KBvURdv6J6jFh48s
         tgSA==
X-Forwarded-Encrypted: i=1; AJvYcCXJ+qLoypiVxShGmj8waCY3vYHc8o8axEsw7poHT6e7Z79WP8Hcg9G8/zqyFBGcFW6jfD3Yyy49HFmcAA+YtNQITg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc8yS6uYo4ugNZi4XuHy0CWFIObk9FmcD6UEfAGHNsvrV+o/fj
	g+DmDjEhs9mXmnwtBkn38r72GjO4+hG6nY5EpZ5pzduPr2s8f/ffIdF55RUeIEo=
X-Gm-Gg: ASbGnctfN+PqJcH69fJZOvNTDrm5g4KbjNzN2laB4Plee3N77Lvj93L5I922wxWTT5F
	oFGRzjnx3iZXev3yDAq0DSdDGN5jrzy/wpuhIwRb008dFEty/vD5LSakF3Dk/rZVNjTomLK9mPV
	V/BFCzSyogwhS0W49OJHKm2D3ocjTiZL9u2V7JWZ/GT196kolfa8vBVaLXy/kXWNVRdBsB2kW3Z
	GY+HSnaBLePHB2SPmmJva7suIYJn2gLUvIAiS+oDkcFcBwVDno/jUN7LeQR6SMzcHDahBPqlAws
	w+kD/4+s8z5t/ZlBXxbjdv3oBnUC2z5QY4o486qbjvBGlxt9Bg==
X-Google-Smtp-Source: AGHT+IFVO28GoFjiM4/MmBFYIj2KWMjVMmnj6kvNFljtWXD9DM7W466QdZ6gW2Hfuwox4fn3w5Zq6w==
X-Received: by 2002:a05:6402:2689:b0:5f8:afab:9e14 with SMTP id 4fb4d7f45d1cf-5fbe9fa810amr2639140a12.28.1746620020038;
        Wed, 07 May 2025 05:13:40 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.147])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fafa166aebsm6000541a12.17.2025.05.07.05.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 05:13:39 -0700 (PDT)
Message-ID: <410d8930-02d8-4c30-843b-7c964a5e08d7@tuxon.dev>
Date: Wed, 7 May 2025 15:13:38 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] clk: renesas: rzg2l-cpg: Move pointers at the
 beginning of struct
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com>
 <20250410140628.4124896-3-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdW0eKTfh6QsznWvCEeK5w9W-Zw4ORQ8yaevbYgh6+Ub3A@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdW0eKTfh6QsznWvCEeK5w9W-Zw4ORQ8yaevbYgh6+Ub3A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 05.05.2025 18:53, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Thu, 10 Apr 2025 at 16:06, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Move pointers at the beginning of structure definition to avoid padding,
>> if any.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/clk/renesas/rzg2l-cpg.c
>> +++ b/drivers/clk/renesas/rzg2l-cpg.c
>> @@ -1183,20 +1183,20 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
>>  /**
>>   * struct mstp_clock - MSTP gating clock
>>   *
>> + * @priv: CPG/MSTP private data
>> + * @sibling: pointer to the other coupled clock
>>   * @hw: handle between common and hardware-specific interfaces
>>   * @off: register offset
>>   * @bit: ON/MON bit
>>   * @enabled: soft state of the clock, if it is coupled with another clock
>> - * @priv: CPG/MSTP private data
>> - * @sibling: pointer to the other coupled clock
>>   */
>>  struct mstp_clock {
>> +       struct rzg2l_cpg_priv *priv;
>> +       struct mstp_clock *sibling;
> 
> I would move them below hw (which contains only pointers), so
> to_mod_clock() needs no calculations.

OK, I'll change it like this.

Thank you for your review,
Claudiu

