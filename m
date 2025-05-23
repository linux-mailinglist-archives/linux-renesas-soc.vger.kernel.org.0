Return-Path: <linux-renesas-soc+bounces-17425-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C40AC208D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 12:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA28D7BE533
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 10:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 922AF225A20;
	Fri, 23 May 2025 10:00:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01BA223DD0;
	Fri, 23 May 2025 10:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747994455; cv=none; b=fadjZRZntYO2Q/asAZw9rEvYfaNnscB1J1ABOSS9t12h+Qeaj/g4KNPqRXuyz7FLN5YYkhUFA9h/p1Tg6HPhTS1Gdj73opKsI2g8+Iehftr0cbFk9P7l7nciuPYX5dMpsdsVofsPJ5/guJHbhjdiNPXo6XwGRFi75GhlFnHitsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747994455; c=relaxed/simple;
	bh=QWN9QTWpsuziH+HrVRdGgN3yI6W2etIemOWYs57/rNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H66aaEtKTpDXaLwKsIdJEyAOW9aRRDaVdJDhtM/4yJarDLlL/jckzCNWlH2ISPCU1Yfb8I3x8dM93zrbd1uY3IAk+btTqNDITwu2dL0Z7SABEqPP9beELs+TLsyVGOjA01aVxUqeWXlZqIA2jD25aQ6wHAByUZR42OK0Zt8u/ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5242f137a1eso2784052e0c.1;
        Fri, 23 May 2025 03:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747994452; x=1748599252;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=be71ceagNF+QtjuGSl+mrmGNCahExrQ6GiVnfl6YdcM=;
        b=hKcR/IAEPokudH9gsc5NzOn31PPe8Ezk6OiSfsorm5yaHAqfbYN/aiv2W5oYJaFUUB
         K8SEgCd4KWa6eLDs28vrjtEDy1KN63TG/9GCloL4C/KNdKq784WD6pnic/e3X1xTMIAs
         klfKBQmLkpAaqA5GdV02sC9C/N1oCd5FePt73TG0pwhsyiZZV25cOvxpKA+duapvefEQ
         yJ5cuQ7tWzEWD3ZLDNpxsj/7sZUgbDW0jwa+iCExPAzHjw3gsHatTzdpu+aV4Rgcjbmg
         A37HNLeydK1C4rz4NPx72tcmdVaYayZ7f31juZC9wL8ICXFJGNmJ4ohXkmc2r+YgtQjj
         dONA==
X-Forwarded-Encrypted: i=1; AJvYcCU7nXGRV+6JgX3wXomjpBbdijYWn0qnpI8u2HM7UInEnHLW+JtfAeMJkyQ0Vm1vvVJjpslbAGFAhyI5@vger.kernel.org, AJvYcCUWi7WwpwdMMaMP1vhfY8qevIuK9YDBBtKTng3eMK7RCsIRc5ToMkIgmV4uZJWRqB+kPpqoY5xeoaI+wLT3Htu/kjU=@vger.kernel.org, AJvYcCVYl3VBxzIO2Fl4sL0MwcVvBgFyZsnaG9K3y79iBW8uiQ2bSxAGRtzJl3Uc9E+hhyGNOy5uG5gFXfmFTDvZ@vger.kernel.org, AJvYcCVolEqYEf9Rn/38HtX8HHmEMUfbWls6RRKxq+5XBLx8eeKSpvSp86h4Wu3dZLKTiPuuOmLvnMHAP13W@vger.kernel.org
X-Gm-Message-State: AOJu0YxtMVW9M9l7N6CsOOzuxN6o+AFqBlrDw8YSYYg9ti5KjcREGHmz
	LOFy+8ATOD566OVBY/U+M6j+uDQKUr67uov0Y7337TWhh6HPXoYWGUxeRSVgBVlH
X-Gm-Gg: ASbGncv3VtdQhxv4E9pghV+iueXsKupvgyQIlu4gAhXktzaLL462gV1Zqyv5nMdPx7/
	vHrtBglWgGAql8u9AkofjD7gU+ZeUQrMo7s/AtVYyij8JYx82gqVXR9QH+lOdDLI06huDV28vnv
	KuPlbFwacHl9PYTknqEtDXgWV562ieF6LQsEP/6p89PUy7CxVbF56DRrJarcBNoSLp11taXDthx
	Kt+/4Oxv94KlNsid/g7/vH9G77HMpbnNnvtZIo2iXyZElhifbIOjhSCyFVgKFlHm3bisGz+932b
	0I+qveo/jUiV5HhgvVlBVGwLDMr2qzf34KViPDEQit9/6amU2uQqUgLX9jvWlLgUdgV0PVaWBwr
	PuHOb7sg7RJqXbg==
X-Google-Smtp-Source: AGHT+IGNN+NmOzeuLoaDTrcL4ZlBnopmw0Efjgusr9ZwAW3Z57vueE1Uj6+pUsMau5ggdIXh2nxrGg==
X-Received: by 2002:a05:6122:6170:b0:516:18cd:c1fc with SMTP id 71dfb90a1353d-52dbcddbca1mr20823983e0c.8.1747994452165;
        Fri, 23 May 2025 03:00:52 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dbab4e7b9sm13065021e0c.37.2025.05.23.03.00.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 03:00:51 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4dfa0f6127dso3013161137.1;
        Fri, 23 May 2025 03:00:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUlpXQS38Q2x5TQg4aWx9+8rminT6eqMzQH8/3GapYGzInCWv62eS+6hSpUS0MvnVnvRqc0YGNh3SGm26+@vger.kernel.org, AJvYcCXaJU6x6IBQ5iguuRnl4OwmbyyEBtJSv1iB/jQhYIuZcogmbb2wetTf07X8Q3vLDqMLN+uY50PhiohvfhqEp9A7Hm4=@vger.kernel.org, AJvYcCXcqoERp83fCzhT8vhvtYEaHjiZ0nJPieEVqjJWDl6ouw4b435UaqxfPJVpi251Dy3xu45XRHXEjns+@vger.kernel.org, AJvYcCXnbfVh3jGjtUg5Ex9fmgnDA90MjY38+cLjWbvMLLlKD69xbW+T59f3N5TTaaoZZZjbF3IFzC1VyoI+@vger.kernel.org
X-Received: by 2002:a05:6102:b06:b0:4e2:aafe:1bb7 with SMTP id
 ada2fe7eead31-4e2aafe1e8dmr11622236137.15.1747994450845; Fri, 23 May 2025
 03:00:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515141828.43444-1-thierry.bultel.yh@bp.renesas.com> <20250515141828.43444-3-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250515141828.43444-3-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 May 2025 12:00:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXv_1nXmRkTfB9i95wjSXaN2XjQG2f55ZNV6axeNUmpzg@mail.gmail.com>
X-Gm-Features: AX0GCFvE2RVBXQ4rbV6YxeljOJyWA7MZNsF1UH9gKR8AoFSUJYEsR3Rcr8PYcws
Message-ID: <CAMuHMdXv_1nXmRkTfB9i95wjSXaN2XjQG2f55ZNV6axeNUmpzg@mail.gmail.com>
Subject: Re: [PATCH v9 02/10] dt-bindings: clock: Add cpg for the Renesas
 RZ/T2H SoC
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, Rob Herring <robh@kernel.org>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 May 2025 at 16:18, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> Document RZ/T2H (a.k.a r9a09g077) cpg-mssr (Clock Pulse Generator) binding.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
> Changes v8->v9:
>   - keep clock names in generic section because T2H is a subset
>   - removed R9A09G077_CLK_BSC, to only keep R9A09G077_CLK_CKIO
>   - removed R9A09G077_MSTP* macros and module clocks definitions

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in a branch shared by renesas-clk for v6.17 and
renesas-devel for v6.17.


> Changes v7->v8:
>   - extra parenthesis
>   - added loco
>   - renesas-cpg-mssr.h: removed unused clocks, added a macro for mstp
> Changes v6->v7:
>   - Add description for reg property
> Changes v5->v6:
>   - Set clock minItem constraint
>   - Moved additionalProperties after 'allOf' section
> Changes v4->v5:
>   - Set reg minItems and maxItems defaults at top level
> Changes v3->v4:
>   - Handle maxItems and clocks names properly in schema.
> ---
>  .../bindings/clock/renesas,cpg-mssr.yaml      | 46 ++++++++++++++-----
>  .../clock/renesas,r9a09g077-cpg-mssr.h        | 28 +++++++++++
>  2 files changed, 63 insertions(+), 11 deletions(-)
>  create mode 100644 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
>
> diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> index 77ce3615c65a..708ab6bd7d44 100644
> --- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> @@ -52,9 +52,15 @@ properties:
>        - renesas,r8a779f0-cpg-mssr # R-Car S4-8
>        - renesas,r8a779g0-cpg-mssr # R-Car V4H
>        - renesas,r8a779h0-cpg-mssr # R-Car V4M
> +      - renesas,r9a09g077-cpg-mssr # RZ/T2H
>
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: base address of register block 0
> +      - description: base address of register block 1
> +    description: base addresses of clock controller. Some controllers
> +      (like r9a09g077) use two blocks instead of a single one.
>
>    clocks:
>      minItems: 1
> @@ -92,16 +98,6 @@ properties:
>        the datasheet.
>      const: 1
>
> -if:
> -  not:
> -    properties:
> -      compatible:
> -        items:
> -          enum:
> -            - renesas,r7s9210-cpg-mssr
> -then:
> -  required:
> -    - '#reset-cells'
>
>  required:
>    - compatible
> @@ -111,6 +107,34 @@ required:
>    - '#clock-cells'
>    - '#power-domain-cells'
>
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g077-cpg-mssr
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +        clock-names:
> +          items:
> +            - const: extal
> +    else:
> +      properties:
> +        reg:
> +          maxItems: 1
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            items:
> +              enum:
> +                - renesas,r7s9210-cpg-mssr
> +    then:
> +      required:
> +        - '#reset-cells'
> +
>  additionalProperties: false
>
>  examples:
> diff --git a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
> new file mode 100644
> index 000000000000..29155fb0401e
> --- /dev/null
> +++ b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> + *
> + * Copyright (C) 2025 Renesas Electronics Corp.
> + */
> +
> +#ifndef __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__
> +#define __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__
> +
> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> +
> +/* R9A09G077 CPG Core Clocks */
> +#define R9A09G077_CLK_CA55C0           0
> +#define R9A09G077_CLK_CA55C1           1
> +#define R9A09G077_CLK_CA55C2           2
> +#define R9A09G077_CLK_CA55C3           3
> +#define R9A09G077_CLK_CA55S            4
> +#define R9A09G077_CLK_CR52_CPU0                5
> +#define R9A09G077_CLK_CR52_CPU1                6
> +#define R9A09G077_CLK_CKIO             7
> +#define R9A09G077_CLK_PCLKAH           8
> +#define R9A09G077_CLK_PCLKAM           9
> +#define R9A09G077_CLK_PCLKAL           10
> +#define R9A09G077_CLK_PCLKGPTL         11
> +#define R9A09G077_CLK_PCLKH            12
> +#define R9A09G077_CLK_PCLKM            13
> +
> +#endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__ */
> --
> 2.43.0
>


--
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

