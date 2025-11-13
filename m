Return-Path: <linux-renesas-soc+bounces-24544-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBCBC5650F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 09:40:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D36FB4E72D3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 08:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D96612DC78F;
	Thu, 13 Nov 2025 08:33:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3DB330D27
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 08:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763022794; cv=none; b=RVMp9r/CywsxH8tONhXzlZgsksDmvHIKUMCWOAKCjh5IpmF5pLPxh4isT4IYOiKkj5PMIMxjzsl2H2PJZ1P+tMAxViHSNf5bza0RCmMR6DpKqv4MdO42XElqko5MCarqJnOzYbZe2q7knG5dIk4rhV/XsI69NANzbsOi4KbmNIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763022794; c=relaxed/simple;
	bh=WDZYAHbv5mBkU9poLMWuB4yiOD3mBOoF+sIIPyL8TvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=boLUJhNJnTtWH1ygX7SLXGPjlJs3kVI5ZgKa5RT1+m6aFfy1gQmqNP/jCoEHW9ORRRO8IaoXkVJa3O4OvgKvcY/yVR+Y7dE20pZLHzqlBNTNEFzdQUjCllddRF7nTLYYJsInTw88g8yNNkq0ktCStYx1xhCQYSZlSfFm74LdV7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-55ad466ad1eso160937e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 00:33:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763022791; x=1763627591;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xfvAxBKuBN5aIubnwQ1QO1UY6mKrYpvn3C7gF7sZv8=;
        b=UNi8rxFepXH0HV1ik5zBRfsHqpFwF51P9I9JQpHoyyEv/OVWGIxjICo3vcxdMqYZFw
         KIcpMnv/CiYZyYcgGalGk6wijb03f1y/DMZ5cer5nEgADa1Q05WhHm6O6eSe5XWGhAQp
         0lxS33EIo5J/P8AXZDEUTIUQ8OqVBYuwj69GTbYP3m2qQCq42HDiW3o16tCSlcngMAhp
         5eP0vXgR7qQXyzF4Q8VosBGaZ45YW0Pm395ykrxNoLaJe1kqh2SgN6yBlRxr7VPORvkn
         35A3w98a4SKFUMxMOeTjWEL/L2ZYSXPVzay1igmfFMy3zg4ugfahznWWeNmiWTxUQ6tD
         bCng==
X-Forwarded-Encrypted: i=1; AJvYcCV7wJHfBYh6JmQ/SQycqjMXsEhpTd5Fyp3sJtJE9SnIBUegAmVh95dIALsAqCxvNJU2ibb7bMwV3dWJhoLdhBjc5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAhK7hNb6Xh3X9qAID88m2pri1hGNYzX/09wofXPGA+wzmkdT5
	2yyLjR85vh7UN44/Xw/lXeH/jLNIDDtgrZFgnZDiiP8qSrxA0/nOvWwPMnx5vSf+QVA=
X-Gm-Gg: ASbGncuYVaCk33PmYes3qkOjl1RThs3jYnQ3zLX5AzABqoPpuT+birmJYlzbk2HdGZV
	LxRuMWkZn6JRpXNEgUS3cr3eP2IF7hF17ZcA0X7zCaioZ3w2Oqi+Esl/m42XLZWeZiGsmbQekzH
	i3im8bI7pDxe6WiM3+LQIwNDR4ihM2DM+hQziodpiKHH6Fq5OzQb9vzJVl7NxmzLdM5FTfl+zfG
	hQwal5EXSnYua/pcF35hMZO0EZGm7Gohn8gOMF4i8JTt4xEsVeU6q3SQv286hCVjgg5flVaSS97
	+HlGmG8Rag2x1gb5k6AN552jNkTQVEOD4ykyOUTBWcU7SRw9+rDuYxnGb40s+8gB0BN5rB4QHdR
	rkSBgbb45Lq2TPcAUAyFmwX/CG66mGn5U0bHAt6Gr5fumq1fqr4t5ncFeOT9nwWEhGY2EKrAUWH
	8eJ4Nb7qo2XycnQS9Dc9tDX+U+F04FfOXhSnu8Mg==
X-Google-Smtp-Source: AGHT+IG6RE6wlzd5pP2RujtwVKtZNlcHSSb3K1A1E0uGmCaHz4gWrPEfEjshrNzKJeju3Tcwbtsm6Q==
X-Received: by 2002:a05:6102:30cf:10b0:5de:8933:9d2a with SMTP id ada2fe7eead31-5de8933accdmr1239248137.3.1763022791314;
        Thu, 13 Nov 2025 00:33:11 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93761102330sm438575241.4.2025.11.13.00.33.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 00:33:10 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5dde4444e0cso188916137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 00:33:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVGPbnYrEa6ub1/iUXBbRCrGtA6DBT/v2ifsZ03Bb8tN1AU1hZmGn1I1ffYnJ1HQK7QFf1ikWWVMm8tTDwMgj8kvQ==@vger.kernel.org
X-Received: by 2002:a05:6102:290b:b0:5df:b3ed:2c8b with SMTP id
 ada2fe7eead31-5dfb3ed30cdmr825635137.38.1763022790257; Thu, 13 Nov 2025
 00:33:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008042526.3312597-1-claudiu.beznea.uj@bp.renesas.com>
 <20251008042526.3312597-3-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdXUqsU6MKh8WSO4EmrxCfUg8FZkrJKb7OH-KwMY4+iC4Q@mail.gmail.com> <aRTRshYq2MznnCYc@shikoro>
In-Reply-To: <aRTRshYq2MznnCYc@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Nov 2025 09:32:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWkKCi848-jELO=XuNyyADRHJfVhUng4JWJ0CMhXRLYug@mail.gmail.com>
X-Gm-Features: AWmQ_blHht0AJ-x3GqfMcqWJKmRw1q0N88H_qFBWtcL7Np5xBSlxA2bfyasQ70I
Message-ID: <CAMuHMdWkKCi848-jELO=XuNyyADRHJfVhUng4JWJ0CMhXRLYug@mail.gmail.com>
Subject: Re: [PATCH 2/3] mmc: renesas_sdhi: Switch to SYSTEM_SLEEP_PM_OPS()/RUNTIME_PM_OPS()
 and pm_ptr()
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Claudiu <claudiu.beznea@tuxon.dev>, ulf.hansson@linaro.org, 
	p.zabel@pengutronix.de, linux-mmc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Wed, 12 Nov 2025 at 19:28, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > -#ifdef CONFIG_PM
> > >  int tmio_mmc_host_runtime_suspend(struct device *dev);
> > >  int tmio_mmc_host_runtime_resume(struct device *dev);
> > > -#endif
> >
> > This change is indeed needed, because RUNTIME_PM_OPS() now
> > references these two functions unconditionally...
> >
> > >
> > >  static inline u16 sd_ctrl_read16(struct tmio_mmc_host *host, int addr)
> > >  {
> > > diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> > > index 775e0d9353d5..8be642f737c7 100644
> > > --- a/drivers/mmc/host/tmio_mmc_core.c
> > > +++ b/drivers/mmc/host/tmio_mmc_core.c
> > > @@ -1286,7 +1286,6 @@ void tmio_mmc_host_remove(struct tmio_mmc_host *host)
> > >  }
> > >  EXPORT_SYMBOL_GPL(tmio_mmc_host_remove);
> > >
> > > -#ifdef CONFIG_PM
> > >  static int tmio_mmc_clk_enable(struct tmio_mmc_host *host)
> > >  {
> > >         if (!host->clk_enable)
> > > @@ -1331,7 +1330,6 @@ int tmio_mmc_host_runtime_resume(struct device *dev)
> > >         return 0;
> > >  }
> > >  EXPORT_SYMBOL_GPL(tmio_mmc_host_runtime_resume);
> > > -#endif
> >
> > ... however, no actual code referencing them is emitted in the
> > CONFIG_PM=n case, as renesas_sdhi_internal_dmac_dev_pm_ops is not used
> > due to the use of pm_ptr().  Hence the changes to this file are needed.

Oops, I intended to write "are not needed"!

> > (verified with m68k allmodconfig/allyesconfig builds)
>
> Since you confirmed all this, did you forget a Rev-by? Or do you
> actually describe an issue which I am overlooking?

Thank you for pushing me to rethink why I didn't provide an Rb-tag!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

