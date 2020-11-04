Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35D9F2A6286
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Nov 2020 11:51:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbgKDKvQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Nov 2020 05:51:16 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33994 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729089AbgKDKvP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Nov 2020 05:51:15 -0500
Received: by mail-ot1-f65.google.com with SMTP id j14so8706608ots.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Nov 2020 02:51:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uG75DnymUfd5x6d1kQiDOHCte/MatEjyR/KUrGdOBuk=;
        b=tDOI+WqykNKfilz9oK9epvtyB26a4X3lu+VepfG9KsvRbr0ezINblF99Dpm8VT9Kqb
         aPHEL9wi+ZteT4UHvOcRvWo1EqLC1O5lHgNgsbF7oTL8GoJ16d5M4RELaNn6I23hXIzz
         9qZ9Qen44gw8ABm4bt1DJrIWM9KCg+RsEoXpkwvTYEY37vjbjreKdGJ4/F1ChX+a4VzT
         guNAzMDQIiRd2CiZFD+WRTUtS2Rbk3n+oINF+JQq+TZZksj/sZ1xSEjW5dMP1Py180V3
         a40bsu8ClBas3kOGSpTIUq2mwNEP7Er43eRkp+maiAMfWVqtlYa4lvIzK4bU2+hYBctj
         uHQQ==
X-Gm-Message-State: AOAM532Z2Fy7/IxIUKOCUzeGqyTcVX3LnPmE/YS51HEaAQLi7u0zgsax
        99EBAf+SRU1Tss4511a6bzkJH6ukcTZUQUCrL1BbSg0IRgo=
X-Google-Smtp-Source: ABdhPJxPZU3h24Udk1iIupk9dRdHg/lLbYWK5wrejf5JPhGuJFIh7Z/LOeowieh1wlXfS/xTcId+/xYg4ez4R49eAPc=
X-Received: by 2002:a9d:3b76:: with SMTP id z109mr18634426otb.250.1604487074189;
 Wed, 04 Nov 2020 02:51:14 -0800 (PST)
MIME-Version: 1.0
References: <20201030081522.2297074-1-geert+renesas@glider.be>
 <20201030081522.2297074-2-geert+renesas@glider.be> <TY2PR01MB369216B8D5E8C954C33593BFD8EF0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB369216B8D5E8C954C33593BFD8EF0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 4 Nov 2020 11:51:03 +0100
Message-ID: <CAMuHMdVtYEvMVGb5+EgXt8uKrCd3ZYF0ADq4s2GOr2eFtN6L8w@mail.gmail.com>
Subject: Re: [PATCH/RFC v2 1/2] gpio: rcar: Optimize GPIO pin state read on
 R-Car Gen3
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Phong Hoang <phong.hoang.wz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Wed, Nov 4, 2020 at 6:23 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Friday, October 30, 2020 5:15 PM
> > Currently, the R-Car GPIO driver treats R-Car Gen2 and R-Car Gen3 GPIO
> > controllers the same.  However, there exist small differences, like the
> > behavior of the General Input Register (INDT):
> >   - On R-Car Gen1, R-Car Gen2, and RZ/G1, INDT only reflects the state
> >     of an input pin if the GPIO is configured for input,
> >   - On R-Car Gen3 and RZ/G2, INDT always reflects the state of the input
> >     pins.
> > Hence to accommodate all variants, the driver does not use the INDT
> > register to read the status of a GPIO line when configured for output,
> > at the expense of doing 2 or 3 register reads instead of 1.
> >
> > Given register accesses are slow, change the .get() and .get_multiple()
> > callbacks to always use INDT to read pin state on SoCs where this is
> > supported.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> <snip>
> > @@ -302,9 +303,9 @@ static int gpio_rcar_get(struct gpio_chip *chip, unsigned offset)
> >       struct gpio_rcar_priv *p = gpiochip_get_data(chip);
> >       u32 bit = BIT(offset);
> >
> > -     /* testing on r8a7790 shows that INDT does not show correct pin state
> > -      * when configured as output, so use OUTDT in case of output pins */
> > -     if (gpio_rcar_read(p, INOUTSEL) & bit)
> > +     /* Before R-Car Gen3, INDT does not show correct pin state when
> > +      * configured as output, so use OUTDT in case of output pins */
>
> nit: checkpatch.pl said warning as the following.
> ---
> WARNING: Block comments use a trailing */ on a separate line
> #46: FILE: drivers/gpio/gpio-rcar.c:307:
> +        * configured as output, so use OUTDT in case of output pins */
>
> total: 0 errors, 1 warnings, 72 lines checked

That's a pre-existing issue. But it might be the right time to fix that ;-)
Will do.

> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
