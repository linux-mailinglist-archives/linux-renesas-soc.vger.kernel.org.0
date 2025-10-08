Return-Path: <linux-renesas-soc+bounces-22793-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36626BC46AB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Oct 2025 12:45:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E88973A756C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Oct 2025 10:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C351339A4;
	Wed,  8 Oct 2025 10:45:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B201FECCD
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Oct 2025 10:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759920346; cv=none; b=pzxpkiDemVgiat0sj+JawqTv4UQqIiqb5kaI5I5IxdCrgRR+IRozRJkgWJ5upP/EkL6f6NYJGTJJjz8vXOl11VvKc2Y0bIUyeB/KBM8CoxS4xZmymTmC0W8zdDPb+VCvaurTPZCyqBIsttToPCWPwSgmIauY2IepU9egfwCCSjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759920346; c=relaxed/simple;
	bh=f41S8yF7zMqNs+KlJnvdjpanaT/vvl8yVAE2KUrK5+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mjPy+lUV+HJKYpK6qge2BXzawVDP6jepgMeD+ENgX1RHl6cbVLKoR8ZCDrzhqSRmLXYWqhRMCDaeFyMPKkaf4eEnnIE33wm3b9klw4vV0cM2GBVmT5tj6A5t9I41zSR288JMOsuLRpNrg5lUiRX9xGcxYPW2jSPI+c/NjZuHFBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-54a880e2858so4606756e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Oct 2025 03:45:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759920343; x=1760525143;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kaqCENqEwBs1LWyCnXwMZfx/+9LYbf6WMr4p/7V1iIw=;
        b=C6793K7m5KSN5hMjP1hAeaJ994VzdUqNNxVUO9yr/fYB/uCRl7dECQytBYo3Xkdur3
         ZclLTpP8oMb0tBbaMouuAy9d/qjg5mZ6vN+DsGUVV0QtYkosdkDVqc6XarxI4m/BtduR
         lyle5Unn5lwsHQIo0hlhfwTFfN18GZvM6SWT5/oiyWqB4Z+qLkt+cozJRJMrwpVi2yO8
         Ubh59KUHqoS5ampMaAsQY0Y7Mee+YTklur84Gg701n6eNxI91VnzTSf5YvaUreY2Rt8Z
         Xd5L5DOGwWd3qWU8ZALTntNgN1OjlJP2lOzOxMZ/bB1kF1oCtPAGo2QP6sawbEn0cL/U
         mcmA==
X-Gm-Message-State: AOJu0YzEbzAmk7HuiQahv3cqQRNNEFcVax3DeoxrZKoemMyIyB7nN6e3
	7dYBb3fEXnROrlJEgPUmFexkZIuGj3rRRCDD9x7V8VO5IG9eD+JoYEEPOd6Mk5S8
X-Gm-Gg: ASbGncuunlThe9IAQD88EVOXQt+mRKnUY8VDmub2rYfnxzgfMFNMm2AwFIGrwhOq2GZ
	p5BeRqwx08viNjZj3/FNVyb4Cd7SqGRbAIfuSVaxnCQFNtRQcxc1MVE/Y2IGVQCFHmLhKXpBS0w
	9eJ7em0nqNv/foaDUZj8x+bgaxa49VS9ukNVF+k6OHsngLhCvU1aPuJz+d9JsanHUyCYQivxWUr
	UCoBVLj7ynJSjNrCDqs6T5Jf43j2f+I15rvXF3i4BftQKVHuGN00lKfVF/qIYjhGHQFTGhkOZK4
	H2vbOwnwdSpFBn8O8bJBapEWRMSJqLtVlu2VkeqQY2e3e5Kfwx2kl+4Qw+2N3Kgn0SrXBiw3lU0
	nOyc9eGLsSqRpWXIW4jaCks18+VD6k083BDxtQJaqk7fk/2+7aOSxBdrrQsJKT77dRPTC5wR8VE
	Iv8vnNd6iyncIcEKw8lu8fDoWSmuUvlQ==
X-Google-Smtp-Source: AGHT+IEsxSgNwBTTgdU0jYKl4DWXBzqXQcv4bj9rFFFpird/MKuZ1ekgMyxP6rKUPbwDNRChN5PNnQ==
X-Received: by 2002:a05:6122:d9d:b0:54a:a251:ad51 with SMTP id 71dfb90a1353d-554b8bfd917mr990627e0c.15.1759920343422;
        Wed, 08 Oct 2025 03:45:43 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-552ea335f07sm3340006e0c.15.2025.10.08.03.45.40
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 03:45:41 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5aa6b7c085aso7695047137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Oct 2025 03:45:40 -0700 (PDT)
X-Received: by 2002:a67:e706:0:b0:59d:6be4:5b97 with SMTP id
 ada2fe7eead31-5d5e2213da1mr1257706137.5.1759920340484; Wed, 08 Oct 2025
 03:45:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007152007.14508-7-wsa+renesas@sang-engineering.com> <20251007152007.14508-12-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251007152007.14508-12-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Oct 2025 12:45:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUf80xCgCZE_NTbBX15tK7f8==ZbP8zvVS21pRyDMEziQ@mail.gmail.com>
X-Gm-Features: AS18NWBQorvHKEIEsh9zX6_qgp1LEf-fkTDr89jGB0dEkJGrHD74K7XFHWjLduA
Message-ID: <CAMuHMdUf80xCgCZE_NTbBX15tK7f8==ZbP8zvVS21pRyDMEziQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] dt-bindings: watchdog: renesas,wdt: add SWDT
 exception for V3H
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Tue, 7 Oct 2025 at 17:20, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Normally, RWDT and SWDT can share the same binding. But on R-Car V3H,
> SWDT misses the reset bit. Add this exception.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> @@ -39,6 +39,7 @@ properties:
>                - renesas,r8a77965-wdt     # R-Car M3-N
>                - renesas,r8a77970-wdt     # R-Car V3M
>                - renesas,r8a77980-wdt     # R-Car V3H
> +              - renesas,r8a77980-swdt    # R-Car V3H SWDT (no reset)

The SWDT module on R-Car V3H is still identical to the RWDT module,
and the RWDT/SWDT modules on other R-Car Gen3 SoCs.  It is merely
the integration into the SoC that differs.  Hence I don't think a new
compatible value is warranted.

>                - renesas,r8a77990-wdt     # R-Car E3
>                - renesas,r8a77995-wdt     # R-Car D3
>            - const: renesas,rcar-gen3-wdt # R-Car Gen3 and RZ/G2
> @@ -74,11 +75,22 @@ required:
>    - clocks
>    - interrupts
>    - power-domains
> -  - resets
>
>  allOf:
>    - $ref: watchdog.yaml#
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r8a77980-swdt
> +    then:
> +      properties:
> +        resets: false
> +    else:
> +      required:
> +        - resets
> +

Instead, I would just make the resets property optional (i.e. not
required) for renesas,r8a77980-wdt.

Of course, I wouldn't be surprised if the MSSR does have a reset bit to
control SWDT on R-Car V3H.  But it may be a bit hard to flip the
suspected bit on a system with remote access, as it requires modifying
firmware permissions?

>  additionalProperties: false
>
>  examples:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

