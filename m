Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8751E44E562
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 12:10:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234864AbhKLLNf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 06:13:35 -0500
Received: from mail-ua1-f46.google.com ([209.85.222.46]:34486 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234940AbhKLLN1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 06:13:27 -0500
Received: by mail-ua1-f46.google.com with SMTP id n6so1428320uak.1;
        Fri, 12 Nov 2021 03:10:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AVBmMdKgsDBAxNzrbvJj6kMzaTUTUQW9uDTokYhWy2s=;
        b=OQKv3n6DvqIIIqp6NG4f6vLyz8sxFWB+Dhy3YMpv3At2/r+Mt9PI773dpkS9aH9NfX
         ucehTBTUwlERtC5KYLjYvhSVOPqb89Rwpt7bXexmXz+Z4vXgjEnWq1TREN+/P5/CouuW
         1xSo7nmiiO6fWXMKfARVSsM7m/DYg9ZAB3If7BJdBuKzXBRFcDr8Ub1ZBTzI1X38V0mA
         hWukHGRxh7u2t2y+Ac2fGzOYPv1OYOeOekut4E5vZWGv9Z0BLSoWu4PCpq2WRkuinBHu
         XC+fyD07b62DhSh/dl6588FE8nkaCbjVrRwv/8Hly5Yxoqt9NYUZ9FFdT6B8KQjcwoSJ
         3ytA==
X-Gm-Message-State: AOAM531H4jcAnWJwO15AUvhSi0F5O5kbENWWcFkIcU+4F8onm2XXZ1rC
        q+ecaWQIXpPxo9d7wGCH0aITr1C6IUSHmw==
X-Google-Smtp-Source: ABdhPJwDP3eE4WEBalNJQgILPEN0veGbmKJQajEEE9AiU65zHQgd4vgzD/sMiRGXYKPEYsUsUtWsdA==
X-Received: by 2002:a05:6102:3a11:: with SMTP id b17mr8860178vsu.28.1636715435445;
        Fri, 12 Nov 2021 03:10:35 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id i1sm3624796vkn.55.2021.11.12.03.10.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 03:10:34 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id y5so76553ual.7;
        Fri, 12 Nov 2021 03:10:34 -0800 (PST)
X-Received: by 2002:a05:6102:2910:: with SMTP id cz16mr9156566vsb.9.1636715434722;
 Fri, 12 Nov 2021 03:10:34 -0800 (PST)
MIME-Version: 1.0
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com> <20211110191610.5664-8-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211110191610.5664-8-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 12:10:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVTUTTPYHWfzD+CN+c9HH+iCyd3xTvLsWV1=1Bva45AfQ@mail.gmail.com>
Message-ID: <CAMuHMdVTUTTPYHWfzD+CN+c9HH+iCyd3xTvLsWV1=1Bva45AfQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 07/21] dt-bindings: mmc: renesas,sdhi: add optional
 SDnH clock
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

CC devicetree

On Wed, Nov 10, 2021 at 8:16 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> Changes since RFC v1:
> * use 'oneOf' for the clock-names

Thanks for the update!

> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -132,12 +132,20 @@ allOf:
>        properties:
>          clocks:
>            minItems: 1
> -          maxItems: 2
> +          maxItems: 3
>          clock-names:
> -          minItems: 1
> -          items:
> +          oneOf:
>              - const: core
> -            - const: cd
> +            - items:
> +                - const: core
> +                - const: cd
> +            - items:
> +                - const: core
> +                - const: clkh
> +            - items:
> +                - const: core
> +                - const: clkh
> +                - const: cd

That can be simplified to:

        clock-names:
          minItems: 1
          maxItems: 3
          uniqueItems: true
          items:
            - const: core
            - enum: [ clkh, cd ]
            - const: cd

But shouldn't the clkh case be restricted to "renesas,rcar-gen3-sdhi"?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
