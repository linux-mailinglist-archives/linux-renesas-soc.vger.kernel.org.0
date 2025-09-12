Return-Path: <linux-renesas-soc+bounces-21794-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 216B9B54549
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 10:27:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B2E21CC2945
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 08:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 417DB2D7802;
	Fri, 12 Sep 2025 08:27:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E982D663F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Sep 2025 08:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757665638; cv=none; b=fKTdf6CYn8JqOBDGffM/H/T6lQ/WObwJzaOUF5iQjIjovnuPlF4krpH5q0ab7QFi2TCcY54xIX2fKNY2ukrPZ7LoENPpik58ldB7H0oh0UYD9oJDE6qhGiZNx0jHFrhYrTb0QrTym8HeHUgJ4gvh4lcZFhSiFGCue4c6iJAbMAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757665638; c=relaxed/simple;
	bh=rPlm91W0zx0lVppYs1CxSHj4tmUuYrI4z38Rx5YJFZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xq5ixdgjC5b918VtOmWSIxYnRd73GGVN93I/njFjJAfu9q2TD1nDLYCOFuf0Jy9vUsg7JlLHkQTRhF2lk+Uz2fxKo/QkrhVJpwVubmgoy1l5QAvXyNvyXqPyMNsItHZp3ZBohBIQpIoOiPAKauJ2pQUkwXdVlicWKNwgO0O5Xzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-89a079e029bso508154241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Sep 2025 01:27:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757665633; x=1758270433;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dw+rt+iyBk5pp2tm7bKOL8mJupu0qbCu/uLdjMNZyww=;
        b=YvDSS3B2piCW/7wg/ndWCMTQCYMYz/DUDzRSFiU/XGGDXtZJcNsQsfH86TQy4Y6GjM
         taV5DOprV/Xxvw1RTlvZu1qg40/E8JbLG6jZSwAg0q6mduZZxnur7upaCdGLCL5aJkO4
         qgX73yQSVW7akg2vZFODKkbwnvN5WaR08q8Uz6QFu+DJxopFDIJh/TROC9WZBtgAfk8r
         DPcfrsPkQaJUaxtzjxm/TyYSZbLA4SCE0UCU3udQXr7kgjB/1PkJ/CE9gWwDcKtTYtst
         im99YIcVjNkOeJm9JnZvQ5nbquMHs2A5GeX68Q0IM1MJJf67oHV2TOUiVpdJC59Z5BYt
         Khhg==
X-Forwarded-Encrypted: i=1; AJvYcCXtACPUy6/DwFAZmqTtqa7uhIqjImr+/zYo6fT5w1QrprPIN/eQg0XSUB6DerUSCvAnVGee2wnQdbfsFZflufLZTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzuTw+hjQO2brKuicyPJSeUpFjn0tnt40jIwsCgDDeF5oc8msc
	Lr16ZLoxZTpnj7UJolTybMlkT4/GL+lMSTgvfC9MlYf5Hh4gCQO751VTwxaISPXH
X-Gm-Gg: ASbGncuLt5IOOGz1X54ISkI7vBNDwAIODA2IHhk8vT/wSw08K90T5IWKk7JCB4nEyuP
	xfCp8nyHgeKyi78FkkViOZI2UhypFwiGrgAVjVPMtQ3tMBCCGEi+tTwTmYEXK/CYTiV9Lf0yNCT
	WFzps6r/ZcLtacQWdNji/XTC+emA3Dq5vDU/KVtK42fjTRolqQR3gEhBcF0K8CMsDLY8sc9Y9aA
	wZczwpYJ+0dv1f5hPgofjkLwKXIqp0poDbbRTBSbtV+/tPZJuVkHbWpil3nwMGBqME/ZO3JyblA
	zFSOg8lA48mIm+c7Csjpcj2aFkJ7q8EQ3rh6BGr6TZcRQBulSB6bnOsVHNSd1hMF1IMiHmKZ8px
	3nn0D/LxuehcqBjglCcQCKH8tZsYV64c0Fm6vY5cAYtu2tVM4OXRZ0hiH42NP
X-Google-Smtp-Source: AGHT+IGShNY7w+RTh12Pf/RcCfGAMex+HQ/xN9RqcIsWQwPIyQO0OlMvas7aGnLO+9+V+H8ydozrcw==
X-Received: by 2002:a05:6102:390c:b0:52d:a7d9:b5d2 with SMTP id ada2fe7eead31-5560a2fd0aamr782252137.10.1757665633508;
        Fri, 12 Sep 2025 01:27:13 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-55374ee8b4bsm857710137.11.2025.09.12.01.27.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 01:27:13 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-52dec008261so484142137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Sep 2025 01:27:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWNwnEDLWFRmVh1CRGMmCkHu7DeyBHAWAGCAoclag278f0JM45Udkn2O2yRyHil/3+6vfYnAt/DKO83omOZ1+hDuA==@vger.kernel.org
X-Received: by 2002:a05:6102:50a7:b0:524:bd1e:bcf2 with SMTP id
 ada2fe7eead31-5561119ee74mr779739137.35.1757665632776; Fri, 12 Sep 2025
 01:27:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1755855779.git.geert+renesas@glider.be> <f9198ea3be46f1eb2e27d046e51293df7fb67f46.1755855779.git.geert+renesas@glider.be>
 <TY3PR01MB1134652A3383410EB50783E3A8608A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB1134652A3383410EB50783E3A8608A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Sep 2025 10:27:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXSVtgGkv6_=ixdBOcTRFHtPxPGxKLGJtV59v4pHBBR0w@mail.gmail.com>
X-Gm-Features: AS18NWABhW1LifViex4oQ6Jd3RNhJjWXAXEhORT-Lh_o6tOSVSNEKZQYYqXS88U
Message-ID: <CAMuHMdXSVtgGkv6_=ixdBOcTRFHtPxPGxKLGJtV59v4pHBBR0w@mail.gmail.com>
Subject: Re: [PATCH/RFC 6/6] can: rcar_canfd: Add suspend/resume support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	"linux-can@vger.kernel.org" <linux-can@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 12 Sept 2025 at 09:54, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert+renesas@glider.be>
> > Sent: 22 August 2025 10:51
> > Subject: [PATCH/RFC 6/6] can: rcar_canfd: Add suspend/resume support
> >
> > On R-Car Gen3 using PSCI, s2ram powers down the SoC.  After resume, the CAN-FD interface no longer
> > works.  Trying to bring it up again fails:
> >
> >     # ip link set can0 up
> >     RTNETLINK answers: Connection timed out
> >
> >     # dmesg
> >     ...
> >     channel 0 communication state failed
> >
> > Fix this by populating the (currently empty) suspend and resume callbacks, to stop/start the individual
> > CAN-FD channels, and (de)initialize the CAN-FD controller.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Tested-by: Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> With adaption to RZ/G3E for ram_clk [1]

Thanks!

> > --- a/drivers/net/can/rcar/rcar_canfd.c
> > +++ b/drivers/net/can/rcar/rcar_canfd.c

> >
> >  static int rcar_canfd_resume(struct device *dev)  {
> > +     struct rcar_canfd_global *gpriv = dev_get_drvdata(dev);
> > +     int err;
> > +     u32 ch;
> > +
> > +     err = rcar_canfd_global_init(gpriv);
> > +     if (err) {
> > +             dev_err(dev, "rcar_canfd_open() failed %pe\n", ERR_PTR(err));
>
> Typo: rcar_canfd_global_init

Oops...

> [1]
>
> biju@biju:~/linux-work/linux$ git diff
> diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rcar_canfd.c
> index 57ac90e57f11..cb358a4e49d0 100644
> --- a/drivers/net/can/rcar/rcar_canfd.c
> +++ b/drivers/net/can/rcar/rcar_canfd.c
> @@ -468,6 +468,7 @@ struct rcar_canfd_global {
>         struct platform_device *pdev;   /* Respective platform device */
>         struct clk *clkp;               /* Peripheral clock */
>         struct clk *can_clk;            /* fCAN clock */
> +       struct clk *clk_ram;            /* Clock RAM */
>         unsigned long channels_mask;    /* Enabled channels mask */
>         bool extclk;                    /* CANFD or Ext clock */
>         bool fdmode;                    /* CAN FD or Classical CAN only mode */
> @@ -1983,10 +1984,18 @@ static int rcar_canfd_global_init(struct rcar_canfd_global *gpriv)
>                 goto fail_reset2;
>         }
>
> +       /* Enable RAM clock */
> +       err = clk_prepare_enable(gpriv->clk_ram);
> +       if (err) {
> +               dev_err(dev,
> +                       "failed to enable ram clock, error %d\n", err);
> +               goto fail_clk;
> +       }
> +
>         err = rcar_canfd_reset_controller(gpriv);
>         if (err) {
>                 dev_err(dev, "reset controller failed: %pe\n", ERR_PTR(err));
> -               goto fail_clk;
> +               goto fail_ram_clk;
>         }
>
>         /* Controller in Global reset & Channel reset mode */
> @@ -2026,6 +2035,8 @@ static int rcar_canfd_global_init(struct rcar_canfd_global *gpriv)
>         rcar_canfd_disable_global_interrupts(gpriv);
>  fail_clk:
>         clk_disable_unprepare(gpriv->clkp);
> +fail_ram_clk:
> +       clk_disable_unprepare(gpriv->clk_ram);
>  fail_reset2:
>         reset_control_assert(gpriv->rstc2);
>  fail_reset1:
> @@ -2045,6 +2056,7 @@ static void rcar_canfd_global_deinit(struct rcar_canfd_global *gpriv, bool full)
>         }
>
>         clk_disable_unprepare(gpriv->clkp);
> +       clk_disable_unprepare(gpriv->clk_ram);
>         reset_control_assert(gpriv->rstc2);
>         reset_control_assert(gpriv->rstc1);
>  }
> @@ -2153,10 +2165,10 @@ static int rcar_canfd_probe(struct platform_device *pdev)
>                 gpriv->extclk = gpriv->info->external_clk;
>         }
>
> -       clk_ram = devm_clk_get_optional_enabled(dev, "ram_clk");
> +       gpriv->clk_ram = devm_clk_get_optional(dev, "ram_clk");
>         if (IS_ERR(clk_ram))
>                 return dev_err_probe(dev, PTR_ERR(clk_ram),
> -                                    "cannot get enabled ram clock\n");
> +                                    "cannot get ram clock\n");

I guess this should be folded into "[PATCH 3/6] can: rcar_canfd:
Extract rcar_canfd_global_{,de}init()", or even better, inserted as
a new patch before that?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

