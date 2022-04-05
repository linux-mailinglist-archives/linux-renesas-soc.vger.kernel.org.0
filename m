Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 189764F3F2E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Apr 2022 22:57:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233655AbiDEULm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Apr 2022 16:11:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355305AbiDEOmM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Apr 2022 10:42:12 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B9ED2250F
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Apr 2022 06:19:55 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a6so15734291ejk.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Apr 2022 06:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DX7l2sM9QqiFOKXhsLfPsQIRCmsC3YYcfigAqtbzngw=;
        b=MIIuNLWwZ8KZnliB5S7EokleWD/rLB9gDpC+rSIhM934CcyyANhIJZVpIts8INYuek
         43DojUsQl8/+1hmzew/jJYwNv8GRFitnp9+IE0TFrNQi4fHz3+SNNGBYRZFbuhM38tT4
         +sEeCg+J4oLLfaLMQkcSiF4bGHcFq//+pDz+lx1omRM4p0/lP+xCgOyzBqUvMguk2Al7
         SB2Savh02L/DSVDCdV1o5z0vgKttGVjH5G6g7bJQgZNH9xfrdeNU8914hipmWyEvqoDN
         87GaAGwit9a/glHMnbyJTwSw+pY+vsu8JlHJqcZKU+T97MidDgCvsfn2RRFbTXobbBDt
         OgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DX7l2sM9QqiFOKXhsLfPsQIRCmsC3YYcfigAqtbzngw=;
        b=AMFTlJRpSsf57oZHRdHrTJSGeGFiHkOslG50O5glfSYtsAWgfaTWQru0JaQtdsO5JX
         3FFeiGm0BkKrmuH/flB5sVzQ5Odq0LcK6/4N45m61cB1lilNbJy1+f7oVkqYAjzLpo6a
         ZMgb43cLrv4CsZ9JKO+Ffjf9IhIz3B/raBYRiAlYuNLb1UIh6SI+aFIekIYdi7hNl7Sz
         DjeItZLsQ0KylpgMOoX62aO9Wh10h0zM2TpSQBBsLwOvruuAG8BgngWC6ToNfP+HQHwi
         bjKWmzYN7sec8ua84xDb45I2l4dPAKxL2kst32SiG/NTZ+nd0bCmMxDwzQv7F/0mPo3W
         mEWw==
X-Gm-Message-State: AOAM5306o9HzCiPqab87Pj2Ww/3YB5vdRMMOVZJT5JrYYOh1DpN5yLlG
        qJA607LAkjpmidulR/WOuhpB/P/m/fFd1m/sKB7pvg==
X-Google-Smtp-Source: ABdhPJxdkpcqywi0Dnnv3TZA7cMfATjjPrQEcps7eS+U2c2eZK6FJLlYj9QgffOiSwol2BYhsCWYsZ1FW7SXEGnJj+g=
X-Received: by 2002:a17:907:968e:b0:6db:aed5:43c8 with SMTP id
 hd14-20020a170907968e00b006dbaed543c8mr3580349ejc.636.1649164793827; Tue, 05
 Apr 2022 06:19:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1649085875.git.geert+renesas@glider.be>
In-Reply-To: <cover.1649085875.git.geert+renesas@glider.be>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 5 Apr 2022 15:19:43 +0200
Message-ID: <CAMRc=MdapT5rWfijUDQYj-GDvJ8ZrrpnZ6dwScev0WirCsuAyQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] gpio: rcar: Add-R-Car S4-8 GPIO support
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 4, 2022 at 5:29 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
>         Hi Linus, Bartosz,
>
> This patch series adds support for the Renesas R-Car S4-8 Soc to the
> R-Car GPIO DT bindings and driver.  It has been tested with i2c-gpio,
> by reading the contents from the I2C EEPROMs on the Spider development
> board.
>
> Changes compared to v1:
>   - Drop RFC,
>   - Split series in DT bindings+driver and DTS series.
>
> Thanks!
>
> Geert Uytterhoeven (2):
>   dt-bindings: gpio: renesas,rcar-gpio: Add r8a779f0 support
>   gpio: rcar: Add R-Car Gen4 support
>
>  .../devicetree/bindings/gpio/renesas,rcar-gpio.yaml        | 5 +++++
>  drivers/gpio/gpio-rcar.c                                   | 7 +++++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
>
> --
> 2.25.1
>
> Gr{oetje,eeting}s,
>
>                                                 Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                                             -- Linus Torvalds

Applied, thanks!

Bart
