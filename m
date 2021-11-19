Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0043456D0D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Nov 2021 11:13:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234493AbhKSKQM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Nov 2021 05:16:12 -0500
Received: from mail-ua1-f46.google.com ([209.85.222.46]:36759 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234484AbhKSKQM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Nov 2021 05:16:12 -0500
Received: by mail-ua1-f46.google.com with SMTP id r15so20192188uao.3;
        Fri, 19 Nov 2021 02:13:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fS6d9y8Vy5SYPiYgWonLI58Ywvany20rJrIAPh73s/0=;
        b=IYOXJbcP7ASJm8bAbprLPykjWbr6PTNzbTuYdgwAdhyGKfjuUnU/SSj7plFGRmdn06
         +VRRXYMvZnjLiCZERjILEVuusB0V6iIeLaB3Cqa5UGw/y1mzVrGzIoEgx923kgRrGMCx
         nyeRCdhyr0+WMpgtORjPEhFXS8T3RWPeRXdDBch6ppJ7DJBvNK7D8nNlWHMNHh9/o1/f
         vgIZE6FClsCxbeECSyElvHrxUsfjc6mvNSB0QoZ/MkxnNCgYzAz5AYld6EGdJy6pBwn/
         5n7/36DAsjEDLHqZtO/ZJ1XxgECHsnkqksMwQj33jCXeNfV2+Kd6X152qbqu6fn590+z
         iz9w==
X-Gm-Message-State: AOAM532gtk6jYLS/eR8895p9cr1hv+RAnwmcuXRV6lmCAvHDk9U1EGF6
        O9aNZzhJ3EFd1HXpr6R046IRcc/ecJ0sCA==
X-Google-Smtp-Source: ABdhPJz20uFXjx9Mu1LflRcuPh8g4+O+72SP+DxNxKCk2EQBALtpnVUpF33FiqjRbivCCMjEBxwSkg==
X-Received: by 2002:ab0:4911:: with SMTP id z17mr46946002uac.91.1637316790219;
        Fri, 19 Nov 2021 02:13:10 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id j145sm1382498vke.47.2021.11.19.02.13.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Nov 2021 02:13:10 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id q21so5593100vkn.2;
        Fri, 19 Nov 2021 02:13:09 -0800 (PST)
X-Received: by 2002:a1f:f24f:: with SMTP id q76mr115866789vkh.11.1637316789632;
 Fri, 19 Nov 2021 02:13:09 -0800 (PST)
MIME-Version: 1.0
References: <20211115160600.4455-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211115160600.4455-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 19 Nov 2021 11:12:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVR=6KNY2bZcdDPGm7QA+7x=-0qNpa3Ev-2C3ut09KMHQ@mail.gmail.com>
Message-ID: <CAMuHMdVR=6KNY2bZcdDPGm7QA+7x=-0qNpa3Ev-2C3ut09KMHQ@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: mmc: renesas,sdhi: add optional SDnH clock
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Mon, Nov 15, 2021 at 5:08 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> This only applies to R-Car Gen2 and later generations, so we need to
> distinguish.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Thanks for your patch!

> ---
>
> v1 and v2 were part of a 21-patch-series which was accepted now except
> for this patch. Updated according to Geert's comments and finally also
> sent to Rob and the DT mailing list.
>
> Tested with:
> m dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
>
> I hope it really does what I intended to check.
>
> If so, the patch can be applied individually. I think, however, it is
> most convenient if Geert picks it up together with the 20 other patches.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.17, with the below fixed.

> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -129,15 +129,37 @@ allOf:
>          - clock-names
>          - resets
>      else:
> -      properties:
> -        clocks:
> -          minItems: 1
> -          maxItems: 2
> -        clock-names:
> -          minItems: 1
> -          items:
> -            - const: core
> -            - const: cd
> +      if:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - renesas,rcar-gen2-sdhi
> +                - renesas,rcar-gen3-sdhi
> +      then:
> +        properties:
> +          clocks:
> +            minItems: 1
> +            maxItems: 3
> +          clock-names:
> +            minItems: 1
> +            maxItems: 3

"maxItems" is not needed with an "items" list

"make dt_bindings_check" doesn't complain, presumably because this
is part of an if/else block.

> +            uniqueItems: true
> +            items:
> +              - const: core
> +              - enum: [ clkh, cd ]
> +              - const: cd
> +      else:
> +        properties:
> +          clocks:
> +            minItems: 1
> +            maxItems: 2
> +          clock-names:
> +            minItems: 1
> +            maxItems: 2

Likewise ("git show --color-words" shows it wasn't present before).

> +            items:
> +              - const: core
> +              - const: cd
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
