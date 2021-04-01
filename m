Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC267351D8C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Apr 2021 20:49:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237724AbhDAS3F (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Apr 2021 14:29:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239889AbhDASRF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Apr 2021 14:17:05 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEC2BC0045D8
        for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Apr 2021 07:25:49 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id g38so1944474ybi.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Apr 2021 07:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WH+kAbagll9akxuUHqMFh3rNKMar4o3v6gTYdJcUIiE=;
        b=1ypL8Wa8sUdG73EO99/NVS2TpkfsaRCNg8yduWkR4ElYHj8J8Veicor1vdONTuA43n
         OJ2XHHopXV7W098Eo3dJsRU0SXAv2NMUywQSpWHPKw2RDZDGKUe707+8boGVlO8R4hTE
         OcSGw7v8oQOoyhB+GQcoRumTPvBLcJRAIHWcBlY8JN/AXaFjjGShd+3NBaSJ4/CQ2CmH
         HJoIl5WCTiDE7TglOXNvw5dmdGLa7oystpeEqIum56FPlPSwTVOkSAi59pE32FHVSc60
         IZu4xxJOo6ZEXUup1WASLcIybVdw4j8naIvtiX3dmlVW+mrFVeCQCevrRyou8PKwWnYn
         ynUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WH+kAbagll9akxuUHqMFh3rNKMar4o3v6gTYdJcUIiE=;
        b=eu2I9P/sgTZdURbYWmyDmzBeWZyntjNvlHTOpBWzeZtQqiXtezJXkWQU0qrF40Q2Dp
         q/mF63ecZxTdA6A+T4cmgY1yrRRGBdmccbDyCxhKCiOuFUOSgm/sZCojfgrSDKrD8epp
         FjGetjVht6p1hiCwpc0YdlHEFTssD/bX7h6NOFn3AjMlUKBZ08AH6W8z4L9iorwu5ndT
         6JPGgBaLhmp66Ej/lHcZdfYC1vl+WpkeR08E3m8Zn5XAS9ew3eU5nX+9e8xHfKwjsHZk
         vRRxMc/DDF7tAiCXwJkqJm/s8rTH8aBYzEPNWN1WPu1d2/0bZatq20hN9/uDOBHelK7A
         I0hw==
X-Gm-Message-State: AOAM530fRLMKH8Jlulia7NzKEOZomSk7uGEblEeq05dQLPP8GHxYimU6
        S3+9wqjiGXp00a8fMUIhVQtp//6mFU83MeF0XEQ8xg==
X-Google-Smtp-Source: ABdhPJxupg8K9QOvfQqfplXb9385y7HzeRg1j4Fbtc/ryhIPKrlK5XiQrBgMkwdJ6XBrJHjAp/YvxoFroo98g+XW918=
X-Received: by 2002:a25:c588:: with SMTP id v130mr12117757ybe.312.1617287149038;
 Thu, 01 Apr 2021 07:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210330085655.12615-1-wsa+renesas@sang-engineering.com>
 <20210330085655.12615-2-wsa+renesas@sang-engineering.com> <CACRpkdbABbvxRLGhzmiQ8kTmwHsRqevvmDpfLKv-dUhEHVpF6g@mail.gmail.com>
In-Reply-To: <CACRpkdbABbvxRLGhzmiQ8kTmwHsRqevvmDpfLKv-dUhEHVpF6g@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 1 Apr 2021 16:25:38 +0200
Message-ID: <CAMpxmJWihGgdThmisvqjpvK6NsORg1+SOE7+wz4HZVkM5Xj77A@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT 1/1] misc: add simple logic analyzer using polling
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Apr 1, 2021 at 3:08 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Mar 30, 2021 at 10:58 AM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
>
> > This is a simple logic analyzer using GPIO polling. It comes with a
> > script to isolate a CPU for polling. While this is definately not a
> > production level analyzer, it can be a helpful first view when remote
> > debugging. Read the documentation for details.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> I am a great supporter of this idea.
>
> When we created gpiod_get_array_value() and friends, the idea
> was exactly to be able to do things like this. It's a good way to
> utilize the fact that several GPIO lines can often be read from a single
> register read.
>
> > +    i2c-analyzer {
> > +            compatible = "gpio-logic-analyzer";
> > +            probe-gpios = <&gpio6 21 GPIO_OPEN_DRAIN>, <&gpio6 4 GPIO_OPEN_DRAIN>;
> > +            probe-names = "SCL", "SDA";
> > +    };
> > +
> > +The binding documentation is in the ``misc`` folder of the Kernel binding
> > +documentation.
> (...)
> > +++ b/Documentation/devicetree/bindings/misc/gpio-logic-analyzer.yaml
>
> When other debugging tools for GPIO got DT bindings it was concluded that
> it is possible to create bindings like this for debugging without even
> specifying
> any formal bindings. They are just for debugging after all.
>
> Personally I like the bindings anyway.
>
> > diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
>
> I would consider housing this tool under drivers/gpio actually.
> We have other funky things like gpio-sim and gpio-aggregator
> so why not.
>

We have actually created a sub-menu for "Virtual GPIO drivers".

> I would create a Kconfig menu with "GPIO hardware hacking tools".
>
> But Bartosz would need to agree on that idea.
>

It's perfect! If we ever get something like a generic bitbanging
driver or something, it could go in there too.

Bart

> > +config GPIO_LOGIC_ANALYZER
> > +       tristate "Simple GPIO logic analyzer"
> > +       depends on GPIOLIB || COMPILE_TEST
> > +       help
>
> depends on EXPERT
>
> I would say. Definitely not something for the average user.
>
> Yours,
> Linus Walleij
