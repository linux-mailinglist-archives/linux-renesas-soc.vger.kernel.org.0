Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A32CF2927
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2019 09:33:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727362AbfKGIdC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Nov 2019 03:33:02 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:43532 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726800AbfKGIdC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Nov 2019 03:33:02 -0500
Received: by mail-oi1-f196.google.com with SMTP id l20so1226123oie.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Nov 2019 00:33:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5+4dGsBime4kBHPrEo+N4zVG64ktutnfCuaoHu3A8g0=;
        b=jADt0MiLuHvhgavMYDLPEflyQDE+3oTg/ToG0lnT1GUx3gYNj9r6fs1LZX2tlyMkxj
         OiIQKAnZWlaRRiinLAP3IPRHCJM8J2lQQwKYmuY6ioWGdiOnXMu4s/AV6Y++quTbdHlu
         Tk3AkRYuWi+zczAWRfKVLY4KIdwmCVmf4FNUz0rWzntfnY3qQBmMukLX3XKH0Nzdepzn
         bxIXxBWfDytl2k02ruSN1Yg/y6V92tzkruVkPsoW1Qu9dZGxdn87tBZlX2ki3RSOFWBW
         J+ptqQhC6yEsr2kzNvq7fZUJ7hoc3+d6LGyEUrKII8tpFSj3VNDTNSUii5YO/g9CRCWN
         Iz/w==
X-Gm-Message-State: APjAAAXzC/jrWT6AOR6KysDerlyLVlcQUf/IgjgZfLETQes0wL8gQD0L
        FKhWostFx4QfXSOCwICpDvRlV8wq5aZZ0tE+4Ng=
X-Google-Smtp-Source: APXvYqyO8xT5jOgZzqcp7feeiRAw17hNVF02BW3icgBFrPEs3KuQWgXKnPbGQRwPrz9TjUPPorGfOaSZvWXpcnOK2QM=
X-Received: by 2002:aca:4ac5:: with SMTP id x188mr2233095oia.148.1573115581042;
 Thu, 07 Nov 2019 00:33:01 -0800 (PST)
MIME-Version: 1.0
References: <cover.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
 <20191106120846.5bunrqj3uz4khih5@earth.universe> <ddcd02cc6c709837a28cae2cbfa672c506927659.camel@fi.rohmeurope.com>
 <20191106142441.GC32742@smile.fi.intel.com> <CACRpkdZ2F3zR2bdHgUV9GJX8iSojiM34BTWizTV_z+j7sS4jtw@mail.gmail.com>
In-Reply-To: <CACRpkdZ2F3zR2bdHgUV9GJX8iSojiM34BTWizTV_z+j7sS4jtw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 7 Nov 2019 09:32:50 +0100
Message-ID: <CAMuHMdW4Dt=HdM-kdLegkF9Ujxy-CMh8ftmgZkv2KKUV0Gw1Ew@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add definition for GPIO direction
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "andrew@aj.id.au" <andrew@aj.id.au>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Linus,

On Thu, Nov 7, 2019 at 9:26 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Nov 6, 2019 at 3:25 PM andriy.shevchenko@linux.intel.com
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Wed, Nov 06, 2019 at 12:25:18PM +0000, Vaittinen, Matti wrote:
>
> > > If no one
> > > else will take the pinctrl part then I can probably do pinctrl patches
> > > for v5.6 cycle.
> >
> > For pin control Intel, since we send PR to Linus and it won't be different to
> > him, we would like to see patch per driver.
>
> It is generally good to bundle these changes because so many
> driver maintainers are passive. (Not Intel!)
>
> If you are concerned, what about we just make a separate patch
> for the drivers under drivers/pinctrl/intel and bundle the rest?
> Possibly Geert want the sh-pfc changes separately as well
> as he build his own pinctrl changes.

I guess the sh-pfc change would be small, and limited to a part of the code
that isn't touched regularly?
So that means it can go in with the rest, bypassing me (but please CC me).
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
