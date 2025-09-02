Return-Path: <linux-renesas-soc+bounces-21182-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C62FB4006F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 14:27:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 648BE5423F9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 12:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E5563009D8;
	Tue,  2 Sep 2025 12:18:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA988285CA3;
	Tue,  2 Sep 2025 12:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756815512; cv=none; b=ITTDm3RNKVge99fYOAJqRkNshGDtTvV88gdSFhDoFe8YLIaxJeeVitFqsdpObkGDvkAALR5nCXPcywJmXaBwLVIkHR20h4eFuNooNnNCJ6bUuIXl+kk0DIF03CUc1fod2pJUnsKBBjkyLVul6IYCNJ2J5P5s08+rMQUyuZnBx08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756815512; c=relaxed/simple;
	bh=8yb0QwvZWhrmWpeBUjsYnZS0PIV2RPL/27K3Kcf5Dnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pnQc6FWUOP4UolRKVdFkRlonOTU2FZHqglhRv6sd+fKv6gbNw9sXAUI0ORAaqrkPmlkjY7t+YyrpuK9kGLtEUbNmvRROZ0DFqpjyp+4rsQiN0iL8TDbhIOdXEf5IyYkIuWO2vi9w7xHmPUE8kX9kCjhDji0J9NvXDz0V2f3lORY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-544a1485979so956279e0c.3;
        Tue, 02 Sep 2025 05:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756815510; x=1757420310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NzOWDwUf99hQ6uEzEY7PPEe93JThVL9qbHCe5bHjhTI=;
        b=wtWDnLMNRKFF0eseXk0bC4RKY/ZJPSO9WZqUZ3s4Z6WuZ3uXTgkWhHFK89bhhNp9Tm
         sgPdZsSJFlYcNzYdz9k4OJm2dloBgbc7SEwDtaBuf5/lv2Pv614v0eFZmXmXvYG/f2tE
         TbLDl4EsDp2iRDFPaIyBvn/yAOl0eD7dvcYYBkoecvepXQGyuxvAo4hNurA/ffBfx/EF
         ZskYBhkugdQ8sEoAntjyJse0y7ZbqD+jELLWMnLkyOl/d6kObTJsOJgkcdzfjUnfWv5h
         ZwWpvxXxIe4nL119E8Sjd/bVHvY2D+qTLiiluzzYGvwj5YOzLMYTIHmShmBfGrlfoOd0
         b4cw==
X-Forwarded-Encrypted: i=1; AJvYcCWEVedqYmsN3H/TxbdFYsxYA8oDKdauPx31cckrSHaSDA+qxIHfidE/jdPGAr2R5F+7FapMARp++IQ=@vger.kernel.org, AJvYcCWmB8HK6JdoRsn3pZbgksdeHRtIQEZEyA+0Elhk5xAw+UzH3HR4u/lqEyoU+uD+ig9+xaBe6j1zrFZFUkIE@vger.kernel.org, AJvYcCXRFMfjUGQZr75JUJwtLvluApDqCUdXhzry108j92UI54LWF8TWRD00vSw8MXl3CV75L3KGkNnWcZL54s6lpFc50wo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW5UDWvMkMxUBvG3ydl3kFiQ/tDuBR/M5lG5+bEo2BHg54KLYn
	MkdtdP1uYXq1u1m8NT/UfrB6RAaG7UGvDFjfU++VJ5jKRXxquhFbA+JCUExbQWUu
X-Gm-Gg: ASbGncti/6YIFDnTLa2ey58C3q+W/kDU6yVIbDmfmCA75PPkoLfwvI2AFAgjxoQVbQh
	SP8elGwfLXPk6G6KHOMGAZeUnZIyiXNA8wYbIPmovilPytYpByAO6zPJ/tRhcwV0JdZ65Hjcv7F
	TyO8mQ0sAlX8qr/GfhT7Hts5lXnb62Qn19yAiCgQ9q/Y23+lDH+eq05HwFXs4HVPCpPdVnZBOMi
	tw9Rqh/UuVqxpCxZkDTTbrK/I4sy6/cK8VR/KY+I185iHbX6fNfbHhm9Md9hOQKtWwNXRaQWW67
	CNiCKHUybmvZ8BKwVJKX6t07/OITRPMdl/paWrkA3JhIQjjJFSUHp7Fdjhdh04/QEEA1s6/Y915
	9STMOGg2n6UOfniLuu23iyomY3KZD48lZpeLsIkIKBjYkmvBaIp4Gx6e/+V6oHUc92+Wbh54=
X-Google-Smtp-Source: AGHT+IHD6Dh/+3CAJT4zemTBuZHBfepKZSeHfLyxRviokJTsyA+IDk8vUUXyU00V43za+RoGutoWoQ==
X-Received: by 2002:a05:6122:4687:b0:542:1516:2701 with SMTP id 71dfb90a1353d-544a0206014mr2879599e0c.8.1756815509594;
        Tue, 02 Sep 2025 05:18:29 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54491467546sm5374832e0c.17.2025.09.02.05.18.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 05:18:29 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-52992b299feso976909137.0;
        Tue, 02 Sep 2025 05:18:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVYwRws7uQbtKGFrBYAqwAI3IiD0CliceZ73nQQUpDrZTJA6DE7uNYjDaoSrABi2iiK1U+aZGmtQxw=@vger.kernel.org, AJvYcCWpGnYrmkrw56hOEksfjzO4uBBjiiU1uDGIQraMS9Zh0b0IjmwDwI43du9KdCYgNSB9NAVRuE8daRThQdPO/vFht2E=@vger.kernel.org, AJvYcCXkqUWznYke1/Sfx0RGzKzOLHvtQXn7Q8H4s1TB2jwRxgTaO3AVwHjf9EasRGI86bGItGRHN8qHOctxS8PL@vger.kernel.org
X-Received: by 2002:a05:6102:4b84:b0:4fb:f6ea:cf88 with SMTP id
 ada2fe7eead31-52b19c70a02mr3648232137.10.1756815508508; Tue, 02 Sep 2025
 05:18:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820100428.233913-1-tommaso.merciai.xr@bp.renesas.com> <20250820100428.233913-3-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250820100428.233913-3-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Sep 2025 14:18:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_grYXJF_L77-6np9iiVGvo52Z7TXN=ft97BuPX2BGxQ@mail.gmail.com>
X-Gm-Features: Ac12FXwYabVKof05tDQY5PMEkI_og52dzgDW0fzTzAtj0OMk-t41ALz7aSu9OD8
Message-ID: <CAMuHMdU_grYXJF_L77-6np9iiVGvo52Z7TXN=ft97BuPX2BGxQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: renesas: rzg2l: Re-assert reset on deassert timeout
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Wed, 20 Aug 2025 at 12:05, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Prevent issues during reset deassertion by re-asserting the reset if a
> timeout occurs when trying to deassert. This ensures the reset line is in a
> known state and improves reliability for hardware that may not immediately
> clear the reset monitor bit.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -1667,9 +1667,16 @@ static int __rzg2l_cpg_assert(struct reset_controller_dev *rcdev,
>                 return 0;
>         }
>
> -       return readl_poll_timeout_atomic(priv->base + reg, value,
> -                                        assert ? (value & mask) : !(value & mask),
> -                                        10, 200);
> +       ret = readl_poll_timeout_atomic(priv->base + reg, value,
> +                                       assert ? (value & mask) : !(value & mask),
> +                                       10, 200);
> +       if (ret && !assert) {
> +               dev_warn(rcdev->dev, "deassert timeout, re-asserting reset id %ld\n", id);
> +               value = mask << 16;
> +               writel(value, priv->base + CLK_RST_R(info->resets[id].off));
> +       }

Is this an issue you've seen during actual use?
Would it make sense to print warnings on assertion timeouts, too?

> +
> +       return ret;
>  }

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

