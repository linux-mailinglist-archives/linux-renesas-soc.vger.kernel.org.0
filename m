Return-Path: <linux-renesas-soc+bounces-19776-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA62B1615F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jul 2025 15:24:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA7327AF490
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jul 2025 13:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D5F299A85;
	Wed, 30 Jul 2025 13:24:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34843299923;
	Wed, 30 Jul 2025 13:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753881873; cv=none; b=X0LGwHS3joS7zwCHoVJZyKyczcgSJwfzKiur1OSa9wVo+F7kdMQEXueaQZQJATAmlr0wRxBKe5/myErBriwfbO41VaqXRpZV3hnH2cR8G11OGUYyjWoDyQFnzy2R9m6I9FjsxeLAMYRuPVUHJN44Jey1VYA9JJ8ErYTLLlOCVPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753881873; c=relaxed/simple;
	bh=sy6jXiSqVidlpaVs1LdfUuEtywccpWrnapz2UqWdnhI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iM+EKyGTDFKMVprHTiQSt7tdhKxdDu92n+bmMO8YvnwJXCeWeFaFOdCz7cL8B7NYeRhopDk3mmE4sEA+OnpgE2Sste6nEabGPPHkEg3XnU7suTWJTdWaQDKCUyOzo4TjsVHp3IaaUgoUSx7jAUIEH5DQc1IwugAXRxp27STTgz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5313ea766d8so3132826e0c.0;
        Wed, 30 Jul 2025 06:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753881870; x=1754486670;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6vlztp5H+NPIuavCVXzCzsul/fEjpvpAsQyc/El1tgg=;
        b=e1u2tvUdWJ6wgrT0qkG5GgO79j1l3HcVwYf3tCVcm4l7x25ntlFD1dJyvdeEehC2RN
         O+dPaEYesYi8sWn4jDIxXSaKyGDzdwwjKlIU5ec56Irsc46WhR8nKgKlVaOrRcUEo6x3
         GdmbJoXmsWL+XIbuweziwGSOamZqWsqBB26bdnE1gUrwdImYzIQ7LEWadC3kafKQdNr9
         GugZrVS+D5iJyGp3piz1g8OCBVEGjz26Y8ZoQs4eGsqyHz9fzCmppWLVQeedqN5tdjJX
         LSBjZBHirzxUheWxqb9LGDQQiOpqjs8WCL/KrKWgXR/1hFQL/x1ty+7ROa/IxRIYv7TB
         spBA==
X-Forwarded-Encrypted: i=1; AJvYcCUq9qTyObP9bylzgPYV/qNQ09P9XstuHeKXLP9PG195Ccn+QPtgE+GByfw5fHqEK6gudFN6kgk2M5Vr@vger.kernel.org, AJvYcCVhrS7I2taEqY6Kym1Ek51q2++EL55xUTY6nonI75QeX/tTCGEbDzCnirI13JRk6cA2Ht0FcvKFU7g74bWb@vger.kernel.org
X-Gm-Message-State: AOJu0YwEO/a6hTpInf0VYjOXZwV9KQnhwadWYpl7sHAXfJOO2xd0A9JW
	5NdvDkugf88THin1tKlUG+XrtnBYGkrNiYuSzHMCa5cU0TOFyqzbATjM153V8H9+
X-Gm-Gg: ASbGncsFV7Ht+pqPZoraPznX/k5If+ka9nEl2o3CvUzsv1q4SsBIfI54fT4k22Tn5oa
	ASZVCFCffyF4cULlJN5y89SCy7LARJzyLcT6w9Hps+RRAZ9kIeOXD5hx1jRmFr2SU4/yWJY+ewo
	yq6b3NeQQ+DBpbHIuxikhPXn7UWVej4odrPnwIFRZNK0r+e+x7lF0btu/6KMpYXbJ10P2XOO3v4
	M7XQ4QtwmCzQsGYHRBF3K88ZEpIMhLtuPOVBiUGqxdzVL0QIFoyh+JTEzugbfL+MX2eeQ+HuYgm
	AmY6hLido3Y+1WIy7VO0RbfA4EjW0nM0AkL/uR0HUwsW45vYpkSz1nuN7P212bJ9DVa17a0d1TC
	9IC4TGKtLmhATtn+KGbxu4r/S9USA1E78t/j16jUnrKlKlAJxWmZ6w+s5jGpkQEeL
X-Google-Smtp-Source: AGHT+IF/cZ6xexi4cBoI+iPsbFekdRi6B1+wN45Md/gNyIpnqfnYySR/niNmAKA+W+LKfrR49Y4kLQ==
X-Received: by 2002:a05:6122:d9e:b0:538:dd8b:666b with SMTP id 71dfb90a1353d-5391c9d0a70mr2067994e0c.0.1753881869651;
        Wed, 30 Jul 2025 06:24:29 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-538e28c3ae3sm2712986e0c.35.2025.07.30.06.24.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 06:24:28 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5392bf8b590so170708e0c.3;
        Wed, 30 Jul 2025 06:24:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUdO5yBUfHvMr4y6YuSV5HVYxL8r8pZVa+RJaDxExWzTqDX/+pgeOqacWv3qH6ffRiqJy+yl/Lx02Ft@vger.kernel.org, AJvYcCUmq4JXMpi8ub3l5Abypa5ltadH14OpPeU5aJKb5XpLhcQv7yEao90L66Rf/BAecUI9jXeC/z8vDL6wBQBM@vger.kernel.org
X-Received: by 2002:a05:6102:3e86:b0:4f7:c5ed:209c with SMTP id
 ada2fe7eead31-4fbe7f4e9ffmr2003997137.7.1753881867520; Wed, 30 Jul 2025
 06:24:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <175232755943.19062.8739774784256290646.sendpatchset@1.0.0.127.in-addr.arpa>
 <175232759314.19062.13901247607746044271.sendpatchset@1.0.0.127.in-addr.arpa>
In-Reply-To: <175232759314.19062.13901247607746044271.sendpatchset@1.0.0.127.in-addr.arpa>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Jul 2025 15:24:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUpKn8ByG_2+h+c=oSq_euCOdGvUaM2P1pa-VWDQrT7Kg@mail.gmail.com>
X-Gm-Features: Ac12FXxhzlq35FsMSZHQohBFv9YKQP681byzw4XyIBQRdWgBYvzlVwmuc0Zg5QE
Message-ID: <CAMuHMdUpKn8ByG_2+h+c=oSq_euCOdGvUaM2P1pa-VWDQrT7Kg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] memory: renesas-rpc-if: Add RZ/A1 and RZ/A2 support
To: Magnus Damm <damm@opensource.se>
Cc: linux-renesas-soc@vger.kernel.org, robh@kernel.org, 
	geert+renesas@glider.be, devicetree@vger.kernel.org, conor+dt@kernel.org, 
	krzk@kernel.org, linux-kernel@vger.kernel.org, 
	wsa+renesas@sang-engineering.com, sergei.shtylyov@gmail.com, 
	p.zabel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"

Hi Magnus,

On Sat, 12 Jul 2025 at 15:39, Magnus Damm <damm@opensource.se> wrote:
> From: Magnus Damm <damm@opensource.se>
>
> Add RZ/A1 and RZ/A2 compat strings to the rpc-if driver. Also make the
> reset controller optional. This is because RZ/A1 does not have any reset
> bits assigned to the device so there is no reset controller available.
>
> Signed-off-by: Magnus Damm <damm@opensource.se>

Thanks for your patch!

> --- 0001/drivers/memory/renesas-rpc-if.c
> +++ work/drivers/memory/renesas-rpc-if.c        2025-07-11 03:45:25.605098312 +0900
> @@ -234,7 +234,7 @@ static int rpcif_hw_init_impl(struct rpc
>         int ret;
>
>         if (rpc->info->type == RPCIF_RZ_G2L) {
> -               ret = reset_control_reset(rpc->rstc);
> +               ret = rpc->rstc ? reset_control_reset(rpc->rstc) : 0;

No need for this, as reset_control_reset() does nothing in case
an optional reset is not present.

>                 if (ret)
>                         return ret;
>                 usleep_range(200, 300);
> @@ -614,7 +614,7 @@ static int rpcif_manual_xfer_impl(struct
>         return ret;
>
>  err_out:
> -       if (reset_control_reset(rpc->rstc))
> +       if (rpc->rstc && reset_control_reset(rpc->rstc))

Likewise.

>                 dev_err(rpc->dev, "Failed to reset HW\n");
>         rpcif_hw_init_impl(rpc, rpc->bus_size == 2);
>         return ret;
> @@ -1017,7 +1017,7 @@ static int rpcif_probe(struct platform_d
>         rpc->size = resource_size(res);
>         rpc->rstc = devm_reset_control_array_get_exclusive(dev);
>         if (IS_ERR(rpc->rstc))
> -               return PTR_ERR(rpc->rstc);
> +               rpc->rstc = NULL;

Errors should be propagated correctly, also for probe deferral.
devm_reset_control_array_get_optional_exclusive() is what you are
looking for. You can enforce the presence of the resets where needed
through the DT bindings.

>
>         /*
>          * The enabling/disabling of spi/spix2 clocks at runtime leading to


Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

