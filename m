Return-Path: <linux-renesas-soc+bounces-20488-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAB7B25E0E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 09:54:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09088162A59
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 07:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E2F6274B35;
	Thu, 14 Aug 2025 07:53:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC19C205ABA;
	Thu, 14 Aug 2025 07:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755157980; cv=none; b=ZZS3vJA6am27lQb5+WHfOA9utkQev9/UfpR2pHXOyVf2ULPMD5dzjz+8KyN6J9mb+v45olVakCNhdLpvZi0alSzNdrvPrTG8KS2IGJoVr11R1zVE+gH9dj08ceOL8EalqhlOYfzI/BSuGY3l1uFZLQafA+X7CqzFO5EpA+U5pKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755157980; c=relaxed/simple;
	bh=Uzzj93Rq8ZnwcjdfSHcSIR8zGuEDTE4U/dOBn+K+4rE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o78Nn/GRx1pPk2Z6HEv0sFOczS96p/tJ/dX/rcZIhNdWXOLen6TF1RS6ZPDz3W2YAPm68YaCYei7jrWJ4XIK1vO+/nb+zFjOKrGGIegO0eSB2pKnOyIwLJmVxAHvfzzsYvQNa/IEEuXe4Yo2aM3JI1NLqn9sHUilUfi1Q4GkQVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-89018fa6f6dso174578241.1;
        Thu, 14 Aug 2025 00:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755157977; x=1755762777;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r1Ih+GxrJlx9WnOtqCehCJ3Lo5kUOBdBINzHA4pU3lA=;
        b=ojim77m7rhpNVuX24KI8KIDI/FAs4t3hYS2HEWs58X4+NVWW4DkBUjAqASVR6B3yH0
         6wKPWZ7ClXa539KOUOGSAe+WZB8aSNWrOPoKGdmNitO64g4hLE1PVibuN4b7EqNhL618
         Va4IZSCEMJJHSjjfrwt8zQU8h7Ij9ayh88pDxCDHVJYyu/iaMnL4psryDNnI7LsDqlE/
         e5HsJ1GZMRA8rro38R2sSaLBJH29zVnkoWK5loRFGFS/WlY9DNv4GzUOFkNNFUilMz6R
         uIJKlyyIpTLM1EGy6gZx58VAfXHGH04U+I9y8zhXQ5pm1A+FmA8lAI5vf/abLLN/YJFe
         Kbjw==
X-Forwarded-Encrypted: i=1; AJvYcCU/RwkyfwH8YuM7rALagnahzCXTBHh5gnU42GsnhwhZ1JwxFjFrHpf/gEG+Tg66mcXq+oBmq2gMQZ+NKb0krTisqW4=@vger.kernel.org, AJvYcCVic6EJII0aygq22tc3Fyh8p9/csAii6JG4lXuhz80PeqPjkAgxkjDbKLPbdUg9gDHTJIxc2vtaFs3XvuD39OAwig==@vger.kernel.org, AJvYcCVxRgNBkArILfFIddsTkQpgCQpipS7pvcF4RARGAC5jXcMaMIFtvLYG2MwosdLu2DYDknVE8RD6y6Zsxnz9@vger.kernel.org, AJvYcCXa8GC2MiwmwgEkpEbi6Y+53muyne9UmJYPwxoFxdt+USBroYPQYuroIeYia+yZ8pbSyBvOu66QjT+Qv2f/@vger.kernel.org
X-Gm-Message-State: AOJu0YwDoR9jEqyhGvkybdV32Ugyd+3QmMWEXXESjEysXy3hZVWxc6dU
	ponfNn0MVJ1/2U7mHypIvIZcp+gfBURZaDGqQe3KI0f8sSqpFJkQRWriuIexYLiI
X-Gm-Gg: ASbGnct/fq5506uRC+8BTjUo1WYhKPUxE9OilwMGNDR339x8hX3w50mLSDRTwoTA1dO
	MRohWR8WSmtIykerQCRf0mYNeQnKjz2Zmqkruf0XfmshZukL5nji4ns4dKdb7796/7Q/Kv609xI
	pLc8D3IsEZYGZo3MS8U+5xKR8iqZ8Fp1kDiHoW8mxbO9bIt8VwO7sirfUkbq1tynY6ge3XXvzth
	Ly4wOLD1g+fvcHEgJMMXrCsqNAnkX44mtdjw85m6spSSnE3i+cjss23NqYivPD7atsAlI7WU5zE
	GA99tAKI8J8aU3SkqPoy3p/9xeNhmJuEtG13N9RkNWN34ohGrKK1M6m5mzR71GX3Y6/RY9uXocU
	+6uE8asdqVo7hVspCE3f86qEvKxj+6rf6TtcAOKHBbVoZPEtmi+Pkx1tgB19c
X-Google-Smtp-Source: AGHT+IGP1gm5l/2/INlr0OCHoLcA6bNQ2oI/YWRqy39reh06MIrg7hoYqRuKjeov+bVs2lkTUsHpQA==
X-Received: by 2002:a05:6102:6441:b0:4e9:b0d4:1133 with SMTP id ada2fe7eead31-50fea4aa7c1mr723320137.20.1755157977185;
        Thu, 14 Aug 2025 00:52:57 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-507dcae5200sm2670979137.0.2025.08.14.00.52.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 00:52:57 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-50f8ac28305so220836137.2;
        Thu, 14 Aug 2025 00:52:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWDuYX40/PdvQZBsC+RXywG1GXXLnooTFx1HAotf/h4/JownkVZvb10eIyvu8FqEwYK2T39cNH3LtFGXk2QFlzkKYc=@vger.kernel.org, AJvYcCWJFG0Mfe9KXYFjgtOIvEUFyNw/lF/HCM99ogLl+0GTFSRFQtquQp5HC68c/eYgO/+mCv+eJljDfpUhvwZJL6VQIA==@vger.kernel.org, AJvYcCXcUba1oe9Cqwv/g52AMwUXWGaTeYaFW8Af8a9OPVQCmWvpn7l7WapCKdd+vQ4YA4ZqA/NwPvMEpfTUh2Me@vger.kernel.org, AJvYcCXosDcM/FJqAuCcQxijqJnDxe3SkSu+KB3Ja5UdFbH31u6Gmo1izqPZipNSRSoFASx++1nTAooBEuRLjwr2@vger.kernel.org
X-Received: by 2002:a05:6102:8011:b0:4fb:def3:d27c with SMTP id
 ada2fe7eead31-50fea4aa249mr676943137.22.1755157976795; Thu, 14 Aug 2025
 00:52:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250813214808.895654-1-robh@kernel.org>
In-Reply-To: <20250813214808.895654-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Aug 2025 09:52:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXk4rsv5YEj5kJ4+tu-n_11rXOHe1zJiy7KYnvBwJZ=eQ@mail.gmail.com>
X-Gm-Features: Ac12FXx9pwnYSd00OxlZFeC1ex7P8HZ3DAupd0C5lnYndVT3t4qqLZV8fVUeU-Q
Message-ID: <CAMuHMdXk4rsv5YEj5kJ4+tu-n_11rXOHe1zJiy7KYnvBwJZ=eQ@mail.gmail.com>
Subject: Re: [PATCH v4] remoteproc: Use of_reserved_mem_region_* functions for "memory-region"
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Wed, 13 Aug 2025 at 23:48, Rob Herring (Arm) <robh@kernel.org> wrote:
> Use the newly added of_reserved_mem_region_to_resource() and
> of_reserved_mem_region_count() functions to handle "memory-region"
> properties.
>
> The error handling is a bit different in some cases. Often
> "memory-region" is optional, so failed lookup is not an error. But then
> an error in of_reserved_mem_lookup() is treated as an error. However,
> that distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
>
> Acked-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Tested-by: Peng Fan <peng.fan@nxp.com> # i.MX93-11x11-EVK for imx_rproc.c
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # rcar

One nit below (which applies to most drivers).

> --- a/drivers/remoteproc/rcar_rproc.c
> +++ b/drivers/remoteproc/rcar_rproc.c
> @@ -52,41 +52,33 @@ static int rcar_rproc_prepare(struct rproc *rproc)
>  {
>         struct device *dev = rproc->dev.parent;
>         struct device_node *np = dev->of_node;
> -       struct of_phandle_iterator it;
>         struct rproc_mem_entry *mem;
> -       struct reserved_mem *rmem;
> +       int i = 0;
>         u32 da;
>
>         /* Register associated reserved memory regions */
> -       of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
> -       while (of_phandle_iterator_next(&it) == 0) {
> -
> -               rmem = of_reserved_mem_lookup(it.node);
> -               if (!rmem) {
> -                       of_node_put(it.node);
> -                       dev_err(&rproc->dev,
> -                               "unable to acquire memory-region\n");
> -                       return -EINVAL;
> -               }
> +       while (1) {
> +               struct resource res;
> +               int ret;
> +
> +               ret = of_reserved_mem_region_to_resource(np, i++, &res);
> +               if (ret)
> +                       return 0;
>
> -               if (rmem->base > U32_MAX) {
> -                       of_node_put(it.node);
> +               if (res.start > U32_MAX)
>                         return -EINVAL;
> -               }
>
>                 /* No need to translate pa to da, R-Car use same map */
> -               da = rmem->base;
> +               da = res.start;
>                 mem = rproc_mem_entry_init(dev, NULL,
> -                                          rmem->base,
> -                                          rmem->size, da,
> +                                          res.start,
> +                                          resource_size(&res), da,
>                                            rcar_rproc_mem_alloc,
>                                            rcar_rproc_mem_release,
> -                                          it.node->name);
> +                                          res.name);
>
> -               if (!mem) {
> -                       of_node_put(it.node);
> +               if (!mem)
>                         return -ENOMEM;
> -               }
>
>                 rproc_add_carveout(rproc, mem);
>         }

The "return 0;" below (out of context) is now unreachable.
It may be wise to remove it, so the compiler will complain when someone
ever adds a break statement, and people are forced to consider what
is the proper value to return.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

