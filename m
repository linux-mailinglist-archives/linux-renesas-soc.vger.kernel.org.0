Return-Path: <linux-renesas-soc+bounces-10727-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D559DA810
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 13:48:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 888FF16586F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 12:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE1101FCD18;
	Wed, 27 Nov 2024 12:47:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67631FCD04;
	Wed, 27 Nov 2024 12:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732711679; cv=none; b=d9tlNoyHW3SHFg3ts9arzqGapNVx7UG0j1FnIzikkJsc1KSNFy4GjCOOA0QxpZJ/IGGyjnk6rc+KDRkH44jLZ/p7KtCl3fczNw+0riMp1OPD5yV1Ww0Nx3uASO722Te5vNt5fhFcHk7Pf5Mia8VAjCjoUbGiWKOR54DQAJWhk7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732711679; c=relaxed/simple;
	bh=9O5RVWumy1hwvNOuX23gAluvd2ulxjOZ3lsnUM9vD0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qtn7iYKxU1PcJC2eU4Hye+VdX29IwoewX64redFc0KqYzjHAe7Qbn9kiLIhGaRr5L/YDVcoXqcQNU9rCZN25Y9KMHj3kPEPT//RbGKI93T7YCl2Mfu5KmrqUowsKJPnGF5NZ2L0vBeQUNZoRpOp7Zmc9n7NrNaUL2MZANGlI9Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4aef9cde3e8so1329732137.3;
        Wed, 27 Nov 2024 04:47:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732711676; x=1733316476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vue8GYzM9p/MYJhII06g/OWgMpfQgwOpuOhoeZX2Gvs=;
        b=lWMrxNL4KG0aNYv870BD4UZzdyJaAWpSVeqEycG35oKnMzoX8xm8FczJsk1d66EwfI
         oY1C/nsUBnNiHfDrchnqITY6QQ2DUMnl0zxFCnyJ0iLbnMmq8ByYTCl/AlfGYbcy8v+x
         +ESSHMM7Do+YIy1XGmF/pLCN/J0rBZBCzxthKkObxBCRpLrz3HOQY6+s8xCnz5ze/Ha/
         FOpo+ascjuXB5fz+ArDeA1I1Xu37sLJSO5iH0th58IOXW8Ih1m+rR++QRsIYbm6ElSGq
         KZK0dFerHRzNQg+LSVMw5FTUs7I6ydCYARARpXPphOt2i2VSU4LeS7wGbKQIFx9TOala
         Iyig==
X-Forwarded-Encrypted: i=1; AJvYcCWvfOrzS541Ublr3yTz9CHxbLxvY+2cLj5i/SZorQVIK4xgJkoQXEo961pOIQy44jNkcXlN57aU+MA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLQawmzeL7NSPf7iV0gmO3LsFawco/BUdSlbPa8DsJ73Crt+Pp
	Yv6fa6x5quECvb8ucM4fhcshweazYzAbK1fLZt4b7FLgIXYN7FdmH0qGK8kOfVg=
X-Gm-Gg: ASbGncuBkJRiCdoq3q/YvoDI3NsydNkuwF75MyV+P6YvctobFoaZbB89LA3Efl5jhgq
	uikBq8nrcjvWAljflyc2tXKnsTuDZCd3FfZafE2nNmFkhCLKjZ6idTKm3ywTcY1JNQuxRhJB7mt
	oD6j5CSuJbakMegpk2R59Q0W24CgKuDsCEvrvpDNsTo9ETb3KBpk/Q9JDWlsb3rCgKHhKwdzz+O
	b8dcSZ6UxNcEPIdWVD6g/BxpHtuZgsNNsDpaHXNBihe2Mug2q5005rWIlLtXX/tltzk5F9uzInh
	B3MzifGWVTAb
X-Google-Smtp-Source: AGHT+IHrBCGKE8lNwsX6MFA9PlZYQSMJO140htRmxl59+yjDFAKVSIDOLBl+EB6nyCiovch+qqLhEg==
X-Received: by 2002:a05:6102:26c5:b0:4ad:63e2:a138 with SMTP id ada2fe7eead31-4af44963502mr2692230137.19.1732711675903;
        Wed, 27 Nov 2024 04:47:55 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85b4e983a8csm690278241.29.2024.11.27.04.47.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 04:47:55 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4af32b09521so715882137.2;
        Wed, 27 Nov 2024 04:47:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXTRrbUxCUKPSpKmrBLu9iIiz1MVdzOJ1u7onxIovIFqj5RBj6kZLpFt2gRgAfOb1thqp8Ls+iKHKg=@vger.kernel.org
X-Received: by 2002:a05:6102:e0a:b0:4af:3f28:77cc with SMTP id
 ada2fe7eead31-4af4487db32mr2999527137.10.1732711675033; Wed, 27 Nov 2024
 04:47:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241107193145.20175-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20241107193145.20175-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 Nov 2024 13:47:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW1KpmsHEFUpKYNe96cEzUEEzGUXC52o4Fand6R+o9Y=A@mail.gmail.com>
Message-ID: <CAMuHMdW1KpmsHEFUpKYNe96cEzUEEzGUXC52o4Fand6R+o9Y=A@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a06g032: add restart handler
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Thu, Nov 7, 2024 at 8:32=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The SYSCTRL module also does reset handling. Start supporting that by
> allowing software resets which can then be utilized by a restart
> handler. Finally 'reboot' will do something useful on RZ/N1D. Watchdog
> support to be added later. Use BIT() macro consistently while here.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> I got a RZ/N1D now. Before I start the real work, I need working
> 'reboot' for fluent hacking :)

Yes, we all do ;-)

> --- a/drivers/clk/renesas/r9a06g032-clocks.c
> +++ b/drivers/clk/renesas/r9a06g032-clocks.c
> @@ -20,15 +20,24 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_clock.h>
>  #include <linux/pm_domain.h>
> +#include <linux/reboot.h>
>  #include <linux/slab.h>
>  #include <linux/soc/renesas/r9a06g032-sysctrl.h>
>  #include <linux/spinlock.h>
>  #include <dt-bindings/clock/r9a06g032-sysctrl.h>
>
>  #define R9A06G032_SYSCTRL_USB    0x00
> -#define R9A06G032_SYSCTRL_USB_H2MODE  (1<<1)
> +#define R9A06G032_SYSCTRL_USB_H2MODE BIT(1)
>  #define R9A06G032_SYSCTRL_DMAMUX 0xA0
>
> +#define R9A06G032_SYSCTRL_RSTEN 0x120
> +#define R9A06G032_SYSCTRL_RSTEN_MRESET_EN BIT(0)
> +#define R9A06G032_SYSCTRL_RSTCTRL 0x198
> +/* These work for both reset registers */
> +#define R9A06G032_SYSCTRL_SWRST BIT(6)
> +#define R9A06G032_SYSCTRL_WDA7RST_1 BIT(2)
> +#define R9A06G032_SYSCTRL_WDA7RST_0 BIT(1)
> +
>  /**
>   * struct regbit - describe one bit in a register
>   * @reg: offset of register relative to base address,
> @@ -670,6 +679,7 @@ struct r9a06g032_priv {
>         struct clk_onecell_data data;
>         spinlock_t lock; /* protects concurrent access to gates */
>         void __iomem *reg;
> +       struct notifier_block restart_nb;
>  };
>
>  static struct r9a06g032_priv *sysctrl_priv;
> @@ -1270,6 +1280,13 @@ static void r9a06g032_clocks_del_clk_provider(void=
 *data)
>         of_clk_del_provider(data);
>  }
>
> +static int r9a06g032_restart_notifier(struct notifier_block *nb,
> +                                     unsigned long action, void *data)
> +{
> +       writel(R9A06G032_SYSCTRL_SWRST, sysctrl_priv->reg + R9A06G032_SYS=
CTRL_RSTCTRL);
> +       return NOTIFY_DONE;
> +}
> +
>  static void __init r9a06g032_init_h2mode(struct r9a06g032_priv *clocks)
>  {
>         struct device_node *usbf_np;
> @@ -1324,6 +1341,20 @@ static int __init r9a06g032_clocks_probe(struct pl=
atform_device *pdev)
>
>         r9a06g032_init_h2mode(clocks);
>
> +       /* Clear potentially pending resets */
> +       writel(R9A06G032_SYSCTRL_WDA7RST_0 | R9A06G032_SYSCTRL_WDA7RST_1,
> +              clocks->reg + R9A06G032_SYSCTRL_RSTCTRL);
> +       /* Allow software reset */
> +       writel(R9A06G032_SYSCTRL_SWRST | R9A06G032_SYSCTRL_RSTEN_MRESET_E=
N,
> +              clocks->reg + R9A06G032_SYSCTRL_RSTEN);
> +
> +       clocks->restart_nb.notifier_call =3D r9a06g032_restart_notifier;
> +       clocks->restart_nb.priority =3D 192;
> +
> +       error =3D register_restart_handler(&clocks->restart_nb);

You can simplify using devm_register_sys_off_handler(), cfr.
drivers/power/reset/rmobile-reset.c.

> +       if (error)
> +               dev_warn(dev, "couldn't register restart handler (%d)\n",=
 error);
> +
>         for (i =3D 0; i < ARRAY_SIZE(r9a06g032_clocks); ++i) {
>                 const struct r9a06g032_clkdesc *d =3D &r9a06g032_clocks[i=
];
>                 const char *parent_name =3D d->source ?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

