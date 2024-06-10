Return-Path: <linux-renesas-soc+bounces-5990-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F0A901BF1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 09:35:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97DBC28300F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 07:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C09E426286;
	Mon, 10 Jun 2024 07:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="SZGdlocX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB86208B0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jun 2024 07:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718004904; cv=none; b=XK0mOBLf7ajG+bSFOvYLypxAjRp9USw2Wu+iT0VwPFxWUjl7rJBWRCv8exUs9rfB64VqztFxE6jX8SiUG+YdILLb27KMeOV0r426cOQGaOplXMM0UZemg6oWrjCXR5w9dnvLWGu4gaPDYAK2vMyV9efsW+1uU+3SdZLPcHm5eBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718004904; c=relaxed/simple;
	bh=VliUnf1LC3h4+sX0On9wlPW+jzs8kc5Ixi7qA1fxruE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HSQFNuaLUMoPhGwlVbJSZaGWyUa65jdIkis/ub1W5xKji/A/Rg4nWfj6Ahtdu2ADmb8MNFea4hPBJ93Qs3GjLj8/jkLP8FKzFT57FLUwT6zr6j9mBwdMcYIbfCSVHeFc6fA2p9A53XH4GMoQJdi4QANNFYKo2fNk/5CmsalcrHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=SZGdlocX; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42179dafd6bso9848435e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jun 2024 00:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718004900; x=1718609700; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nFHT2mQiPwOe9xw3h0sZO/aY5iVIcTCAjYd6ForW6is=;
        b=SZGdlocXOyAdK2HcpYRFrMYm4yYA9qWXRKeg9eV29kin8DLKdNRCUg2TbmtqTpgQWh
         MVviTjHtxNm4vLdMJMvBM6f8HpiNmnZaX3/FFZrTP1IuUbBolrWrPLiD0t+iaRpaT166
         9oVNMkA3aF0jqUb4sVV7PFDYvdKLZ+ZLZHdLmQ/o+Ae+YBobHagbNrZFEoNqHAGzfLmh
         MwPEInBzECR0opH+kHCU3Wp9Fyz1pJ8H/ocDjwW98FjUohkAylP2cEE6zgWXB9U0nLYR
         k1lR5uXDE6tA3UBtyihzs/mjhFDNMkTUcu3NKUp9KTJofZNT8aA1m4P9wFzDc/liC79p
         hyUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718004900; x=1718609700;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nFHT2mQiPwOe9xw3h0sZO/aY5iVIcTCAjYd6ForW6is=;
        b=cLlatNCKWbABCD0HyKCyjaTbhm+MJdFHy5oGOUjkCyzWKV7jJiUVgxLhRORTZpVKNM
         MEJrXlP/VhCyXR7h0kwJouM2eUCwycIHZV2/fHH9HwlZAY1aGsRT2xCV8LoYJnZ/Vwhc
         7fZthAhn8XMg+DBooyK0ookkNTAqkZhE4Lmpa1x6XTYFAOJfqPn94YTrt75BZ+XOPOvH
         OpEM50ksDVxNdaklpaFwrNGGh5XoGwTnBvQuTfAi5uCSoHVvRMggPvQeKLFWJw5D0KlO
         qJ9wRowWXZfuxg175BYV25x6gcZj2gTVM2XqVlTq6Xj1VufL/GCI5D729WNMyQQzc4OB
         96vw==
X-Forwarded-Encrypted: i=1; AJvYcCVvyT9VgBX3onq2ZffHjigXdbOY+VP92Nes/NaWWFIJuUg95S62zmO038VZ2KtkPO9XQwgZmzRxBf6721BfamqC1/dwA0t5ICJ9SrhHf02YlWE=
X-Gm-Message-State: AOJu0YyRHNvT6t6M3IoVr6/iak5PN8mQmBR77JoYOJvMPSQanOWGEMNg
	LhBa9kNxF/Z27l3JdpWhrSvOkxdIuIApG+Ercop15CGBM1ew3YHxdvxA2wGewbE=
X-Google-Smtp-Source: AGHT+IEo2JAEM8YQ5ACMdMdsTOq64tAsPg+t0zg39oLXt7yTkzc7WSJbbN+KIU+lY9quNUXLDIHq/g==
X-Received: by 2002:a05:6000:178f:b0:35f:27dc:4d53 with SMTP id ffacd0b85a97d-35f27dc4dd5mr678509f8f.30.1718004900021;
        Mon, 10 Jun 2024 00:35:00 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42158110dfesm168181575e9.19.2024.06.10.00.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 00:34:59 -0700 (PDT)
Message-ID: <acf4e381-86d6-4cb8-a672-fcb680147c23@tuxon.dev>
Date: Mon, 10 Jun 2024 10:34:58 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip: renesas-rzg2l: Reorder function calls in
 rzg2l_irqc_irq_disable()
Content-Language: en-US
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240606194813.676823-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240606194813.676823-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 06.06.2024 22:48, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The order of function calls in the disable operation should be the reverse
> of that in the enable operation. Thus, reorder the function calls to first
> disable the parent IRQ chip before disabling the TINT IRQ.
> 
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S

> ---
>  drivers/irqchip/irq-renesas-rzg2l.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
> index 861a0e5a3e97..693ff285ca2c 100644
> --- a/drivers/irqchip/irq-renesas-rzg2l.c
> +++ b/drivers/irqchip/irq-renesas-rzg2l.c
> @@ -271,8 +271,8 @@ static void rzg2l_tint_irq_endisable(struct irq_data *d, bool enable)
>  
>  static void rzg2l_irqc_irq_disable(struct irq_data *d)
>  {
> -	rzg2l_tint_irq_endisable(d, false);
>  	irq_chip_disable_parent(d);
> +	rzg2l_tint_irq_endisable(d, false);
>  }
>  
>  static void rzg2l_irqc_irq_enable(struct irq_data *d)

