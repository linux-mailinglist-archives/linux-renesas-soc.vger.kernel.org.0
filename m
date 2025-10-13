Return-Path: <linux-renesas-soc+bounces-22958-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 937C1BD54FA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 19:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C61D484456
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 16:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CAF82727E2;
	Mon, 13 Oct 2025 16:20:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3400826F44C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 16:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760372419; cv=none; b=XLSYNi0o+zjlT1CCU1rNNCSrx5KvdyRt8FFmMSw5KcJ+FqUzFdJkjiek5+uppfKQVYj181PZTFmgw420R19lIcXueLR17GuziW7a0E392FcQD0RlYk4yOdsDUGxY9tFKwZGx+7yOHAPKMgVe3RenP8MljtHcwnora07GsnjU09Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760372419; c=relaxed/simple;
	bh=QZXGC+aNSm2VaxhXC6fK/8LfmGJE2quumpT2uKvw4qE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a3KLjuJIGF/0exAb68ELZKnZpfzzdoz4UfY7H1HZMuUX+nVHrjqSqcPpnRxuMPhjhTQjOocNUQODRGrvwi05PSbtTCAFE/+Q/wqNob+zyGpCp7kxIR1b9wnHHzm4DsA6BTn5FHSKJIHJQ8CLThr22doP5EfD+lh587N5eLz0KyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5d61f261ebfso560280137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 09:20:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760372415; x=1760977215;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BFpRqZmIQrKu+7ylr5t2VWlgMZSJphDIQU23QX0pR+8=;
        b=DoUsVsNP+dOPLWgBtRWAm/X4OkGIF+uIdG2mjzeOxKs7jczUQpazJhjoh/HiJDI4xy
         2yA7FlAohl/ivv7xDBMvkRE7IoOlvDxcoC3DxRmhc66lLrXQKon2uja2GF4gM/GC1i3W
         a6/47NVi6rn7E8r+Nqdf12WKijhuHOX5tNc4pBBLl8fMul0sjDjVhKGcFFqLx46nuyNS
         AL6EUmT3Smknin/M6eROrPf3hiiykX0z3nwDW0ZwGauHNV+H3/SQp0jQ05Ojd2ByMKSe
         7HHv/xGeDtba3C3dr+y9woPyjwgM/oRJpmzbanWtNdGh0ojopc2Ted46Lesv2Cz3i0V6
         gKTw==
X-Forwarded-Encrypted: i=1; AJvYcCVZGBkwGcEIVz4eLuWnHc4tTkFBspdPMFw9yAjwVCScy3/WqB8oKpB3TchbObhfPDDN7PBglSh0Va1Zeu0mjTdmsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfD3N3X9SI9qTlhGlyAx4MEoTCoPOsJdNKmAYlGJodHLe083KT
	FS5jU8X/Fo2Mg37zUZ9Ig3QdhaB7I8jdPrPpX/xGtci+7mPAZE+02pgRizEybobt
X-Gm-Gg: ASbGnctmQmi2m8Jv26xq45Gr8MJ583iFZRiRSPchU+1zURh7N6jAcYPJvbPdHRyP3Yc
	JsEnb2mWogHmhm2iAp1QAHddvvz8WPSbpw1NOt2uFzIdA2lhDCVzOwnrxBDsDqqUkDmPQp3c0W0
	V97cpdD7mSTGSw0Mmb663n2j+MmVtprcNx0s3f6S/+GCqprn98//QPEFuJkzLrwqPJnkJGB1mej
	/+XaKkhLwYGnxfv3E8sYB9A5RX5sqly8GNL5DARsx4a35KRFcgcMQ8MWJ8uWbw+1PiIkBIxSolI
	IcLd0WHvKiELjSbZXFpmyJMsfg9DHfKZzLQKPhbviuJWpa4S/j896xa7HJP3cf3WFu6NIRSi9R6
	0KG7S/Ywf7Q2SfJhbxHazPQEIoTNFAL7EFAw4w3zxUPjxpQGvDYgogIWmNA1pID+6rjeEPhermX
	HRHkm1f87sB8zfdJLnhIRk5EKm
X-Google-Smtp-Source: AGHT+IH+zs7EOkG6eg13IujyqAgU6NvWzG0Heu0vi0DG5M3zMpSbzmm2tVHv9UBqG8s3/F3SjD5JwQ==
X-Received: by 2002:a05:6102:5987:b0:52a:1ff2:da15 with SMTP id ada2fe7eead31-5d5e22a274cmr6547432137.15.1760372415555;
        Mon, 13 Oct 2025 09:20:15 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-930e7a118bbsm224162241.14.2025.10.13.09.20.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 09:20:15 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-8e401b11bfaso1124802241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 09:20:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU1oM4JpmZ6OpV7xo3IDgcNUD0CMDAqKfjFTcgmmuRrPPS3FCkOTQ/4TPv+LKuLzpQ4ivHb6KUNZ1csUB7zYHSXWA==@vger.kernel.org
X-Received: by 2002:a05:6102:548b:b0:5d5:f6ae:38c0 with SMTP id
 ada2fe7eead31-5d5f6ae3b65mr5428961137.41.1760372414371; Mon, 13 Oct 2025
 09:20:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008042526.3312597-1-claudiu.beznea.uj@bp.renesas.com> <20251008042526.3312597-3-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20251008042526.3312597-3-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Oct 2025 18:20:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXUqsU6MKh8WSO4EmrxCfUg8FZkrJKb7OH-KwMY4+iC4Q@mail.gmail.com>
X-Gm-Features: AS18NWAZcmdiqSjfkUoPbuGPh-cNUsYtDKIlfc4ni5Js9vtMQnoS9mBsr70Q9Bc
Message-ID: <CAMuHMdXUqsU6MKh8WSO4EmrxCfUg8FZkrJKb7OH-KwMY4+iC4Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] mmc: renesas_sdhi: Switch to SYSTEM_SLEEP_PM_OPS()/RUNTIME_PM_OPS()
 and pm_ptr()
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: wsa+renesas@sang-engineering.com, ulf.hansson@linaro.org, 
	p.zabel@pengutronix.de, linux-mmc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Fri, 10 Oct 2025 at 22:16, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> SET_SYSTEM_SLEEP_PM_OPS() and SET_RUNTIME_PM_OPS() are deprecated now
> and require __maybe_unused protection against unused function warnings.
> The usage of pm_ptr() and SYSTEM_SLEEP_PM_OPS()/RUNTIME_PM_OPS() allows
> the compiler to see the functions, thus suppressing the warning. Thus
> drop the __maybe_unused markings.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -599,18 +599,17 @@ static int renesas_sdhi_internal_dmac_probe(struct platform_device *pdev)
>  }
>
>  static const struct dev_pm_ops renesas_sdhi_internal_dmac_dev_pm_ops = {
> -       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> -                               pm_runtime_force_resume)
> -       SET_RUNTIME_PM_OPS(tmio_mmc_host_runtime_suspend,
> -                          tmio_mmc_host_runtime_resume,
> -                          NULL)
> +       SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
> +       RUNTIME_PM_OPS(tmio_mmc_host_runtime_suspend,
> +                      tmio_mmc_host_runtime_resume,
> +                      NULL)
>  };
>
>  static struct platform_driver renesas_internal_dmac_sdhi_driver = {
>         .driver         = {
>                 .name   = "renesas_sdhi_internal_dmac",
>                 .probe_type = PROBE_PREFER_ASYNCHRONOUS,
> -               .pm     = &renesas_sdhi_internal_dmac_dev_pm_ops,
> +               .pm     = pm_ptr(&renesas_sdhi_internal_dmac_dev_pm_ops),
>                 .of_match_table = renesas_sdhi_internal_dmac_of_match,
>         },
>         .probe          = renesas_sdhi_internal_dmac_probe,
> diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
> index c8cdb1c0722e..b9de03325c58 100644
> --- a/drivers/mmc/host/tmio_mmc.h
> +++ b/drivers/mmc/host/tmio_mmc.h
> @@ -209,10 +209,8 @@ void tmio_mmc_enable_mmc_irqs(struct tmio_mmc_host *host, u32 i);
>  void tmio_mmc_disable_mmc_irqs(struct tmio_mmc_host *host, u32 i);
>  irqreturn_t tmio_mmc_irq(int irq, void *devid);
>
> -#ifdef CONFIG_PM
>  int tmio_mmc_host_runtime_suspend(struct device *dev);
>  int tmio_mmc_host_runtime_resume(struct device *dev);
> -#endif

This change is indeed needed, because RUNTIME_PM_OPS() now
references these two functions unconditionally...

>
>  static inline u16 sd_ctrl_read16(struct tmio_mmc_host *host, int addr)
>  {
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> index 775e0d9353d5..8be642f737c7 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -1286,7 +1286,6 @@ void tmio_mmc_host_remove(struct tmio_mmc_host *host)
>  }
>  EXPORT_SYMBOL_GPL(tmio_mmc_host_remove);
>
> -#ifdef CONFIG_PM
>  static int tmio_mmc_clk_enable(struct tmio_mmc_host *host)
>  {
>         if (!host->clk_enable)
> @@ -1331,7 +1330,6 @@ int tmio_mmc_host_runtime_resume(struct device *dev)
>         return 0;
>  }
>  EXPORT_SYMBOL_GPL(tmio_mmc_host_runtime_resume);
> -#endif

... however, no actual code referencing them is emitted in the
CONFIG_PM=n case, as renesas_sdhi_internal_dmac_dev_pm_ops is not used
due to the use of pm_ptr().  Hence the changes to this file are needed.
(verified with m68k allmodconfig/allyesconfig builds)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

