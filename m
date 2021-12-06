Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27D7A4696F2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Dec 2021 14:24:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241389AbhLFN2W (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Dec 2021 08:28:22 -0500
Received: from mail-ua1-f48.google.com ([209.85.222.48]:41902 "EHLO
        mail-ua1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244430AbhLFN2W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Dec 2021 08:28:22 -0500
Received: by mail-ua1-f48.google.com with SMTP id p37so19434216uae.8;
        Mon, 06 Dec 2021 05:24:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hUTPaB3i0du6uvmwX41ota+aoFFQiaoFa1Jt/8inJiQ=;
        b=l/VRjWraZ9malqHdP2NTu7+uVLD3TY1EScJWPrTbZoFSBpSRdhsM2JVm8pQJ5sC0zf
         5vvL7b54VIqfRw1mb0trGqlp9tIywApUz9+FIGFFGqvIc+1S2wgonPowjdIBGSqLiYsv
         htqHgDL+QGu1NhFgBYKgK63xaysYE1z0P+EFueZQY3duWSwycVisGJkdESgYuXmKbsYu
         Kg0wsfyGZ96SuCP3KqQ6SxqoT6ZnwrmVHsddKk3pSb0EjmAjD8fdDVqeEF2gbP483DGE
         Ql7k/0ZeOEZova9seebHrDLfaUUt2Od4qCXlxXzlvG3KEfZ5QZ0VxrDEXZrSVjl0onDR
         I1fA==
X-Gm-Message-State: AOAM531hzinEKPvHEqXoSA55SkHDCvizn27zGu+Sng8qDeHn7pWxreLg
        ztqqMhYndrl4VIiR/NnE+pqGC2Q3fX/4/g==
X-Google-Smtp-Source: ABdhPJxcM5TZI8LDiWr6gGLk9T5SAnzo0tAGDJW0H6OqbgmpioodVrm4O2FFIICPScTfUvib2y62og==
X-Received: by 2002:a67:2683:: with SMTP id m125mr35250840vsm.80.1638797093100;
        Mon, 06 Dec 2021 05:24:53 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id o188sm4155262vko.48.2021.12.06.05.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 05:24:52 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id i6so19442066uae.6;
        Mon, 06 Dec 2021 05:24:52 -0800 (PST)
X-Received: by 2002:a9f:3e01:: with SMTP id o1mr39567596uai.89.1638797092369;
 Mon, 06 Dec 2021 05:24:52 -0800 (PST)
MIME-Version: 1.0
References: <20211203115154.31864-1-biju.das.jz@bp.renesas.com> <20211203115154.31864-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211203115154.31864-5-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Dec 2021 14:24:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU+eYymZBQv8xrLKFCzORxmGe==Vc4z5qjxq+2vNfgaAw@mail.gmail.com>
Message-ID: <CAMuHMdU+eYymZBQv8xrLKFCzORxmGe==Vc4z5qjxq+2vNfgaAw@mail.gmail.com>
Subject: Re: [PATCH 4/6] dt-bindings: gpu: mali-bifrost: Document RZ/G2L support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Fri, Dec 3, 2021 at 12:52 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The Renesas RZ/G2{L, LC} SoC (a.k.a R9A07G044) has a Bifrost Mali-G31 GPU,
> add a compatible string for it.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml

> @@ -52,7 +64,8 @@ properties:
>      maxItems: 3
>
>    resets:
> -    maxItems: 2
> +    minItems: 1

2, as before?

> +    maxItems: 3

Perhaps you should add reset-names?

>
>    "#cooling-cells":
>      const: 2
> @@ -113,6 +126,21 @@ allOf:
>          - sram-supply
>          - power-domains
>          - power-domain-names
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a07g044-mali
> +    then:
> +      properties:
> +        interrupt-names:
> +          minItems: 4
> +        clock-names:
> +          minItems: 3
> +      required:
> +        - clock-names
> +        - power-domains
> +        - resets

reset-names

>      else:
>        properties:
>          power-domains:

The rest looks good to me, but I'm no Mali expert.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
