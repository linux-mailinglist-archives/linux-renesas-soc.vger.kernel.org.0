Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6095142965C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Oct 2021 20:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233535AbhJKSGT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Oct 2021 14:06:19 -0400
Received: from mail-ua1-f51.google.com ([209.85.222.51]:37729 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbhJKSGS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Oct 2021 14:06:18 -0400
Received: by mail-ua1-f51.google.com with SMTP id f4so8640820uad.4;
        Mon, 11 Oct 2021 11:04:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=66sTTJaLQnIxQdIIXoeNnR+Bw4rKpQbDof4Fd50YLGg=;
        b=rKZyGD8yFEn40rGi8YZ4jUkVtRVpCeNn9jdU6InQi1BGGxH8TcTFhZnjz1eXj6Umyr
         sLx8uvWwzjUQnn2Txf3d/ZTCw4uXJmLg+VX7yP1/QNtz6Ki5mFxywk048S3N989pPvnn
         1mPkBKpJA8PtkFDxrcktAYY0OnvTv2JOHsA7ZeQsJrc4mhOT2ad6sv3FAAetn4xgZffo
         lg872ryotJQ0ru6psY+Y9YNF85TsjODrfZlEEvMREbXFiNtbJs988XmYXGRI5EGLys7R
         JzB8HlI6qlccRzicuWpVdsc1f7QUY1YmRwx8ftmOIdAU+rmJ2dkxg/e8tAXmvopreVGt
         Se3g==
X-Gm-Message-State: AOAM532zHL5NZWcQ5p6A1rTf9szigaTdF+SYhbrFVQUFi6RW4chR4WBT
        HlGrU9HeVeUVigC+sb/ll9Cjzo07A2fXz1e+JLo=
X-Google-Smtp-Source: ABdhPJxyLB/xwDFsSRAsJrWbuyLIumUEBDWEmo/uXms38aWMvLReTqbx3rW5Mc9rZHYW3C70yc8b1T3tqveHimn06cg=
X-Received: by 2002:a67:d583:: with SMTP id m3mr24860090vsj.41.1633975457851;
 Mon, 11 Oct 2021 11:04:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210928200804.50922-1-wsa+renesas@sang-engineering.com> <20210928200804.50922-7-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210928200804.50922-7-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Oct 2021 20:04:06 +0200
Message-ID: <CAMuHMdVXJt5y2dk+2Zom6YzTnzCxvkpF+MNh52fVgLRo5MN=XQ@mail.gmail.com>
Subject: Re: [RFC PATCH 6/9] dt-bindings: mmc: renesas,sdhi: add optional SDnH clock
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Tue, Sep 28, 2021 at 10:08 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -132,12 +132,13 @@ allOf:
>        properties:
>          clocks:
>            minItems: 1
> -          maxItems: 2
> +          maxItems: 3
>          clock-names:
>            minItems: 1
>            items:
>              - const: core
>              - const: cd
> +            - const: clkh

This doesn't work, as the second clock is an optional clock, even if
clkh is present.

>
>    - if:
>        properties:

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
