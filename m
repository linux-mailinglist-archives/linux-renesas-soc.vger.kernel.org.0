Return-Path: <linux-renesas-soc+bounces-22792-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBA5BC458F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Oct 2025 12:37:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A9BD74E3FF2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Oct 2025 10:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDD512F39BC;
	Wed,  8 Oct 2025 10:37:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4212E3D76
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Oct 2025 10:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759919828; cv=none; b=D/VCcZ9goy6lXtyM3QRdu1XqhzMC3zNfXkuMVYcUJ9ubj/j05yReJXc+N5JF725p5XM5xFjqUTmJLgQWLn+rEUo9MbUctm55E/k24ISSmmYZBYgOQOsMVMTra7ziTdEHipCu2D/n5xfNsuewjo90IosqIYt6ExHzyru1vBtipmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759919828; c=relaxed/simple;
	bh=dOAt+nuRo28aNDNvJxcRiwiD39zS4vrxmN4+5vmPi4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UThHiANTvqZcLiP+aPAkJPTQfPcy73BfsVF6lnCSYKsCNYW2Zhx303PbSBc1o8eie6susnzFs7lCxd5LrpCpXFaQeHtV0krZ3NTIyOwd+GlPjF2m94fyi5LLetpJc7FjSwbOJlxg3iE7ZyISrtsk37NAoIBiBIkRuvqxSPO1Vp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-890190a3579so1429924241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Oct 2025 03:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759919825; x=1760524625;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SpM5IF7an2KKoogtwZq+ATkkUPR65N1c7rRftHs9zKs=;
        b=G721o9iBG5KrewR10kRdxtdX+1/HO1ZRxePusYWOrsvewb1Zt31i+L2bT6ih/z2j74
         MuFkIx1YY1nfeRk29j0NAW76CNOHTN0vAf8erKQXZZDySeQXZqLtCAEQ7t3rZdpF6S82
         9sNogSVhH+LkVTaAlDE3ZwAdcO055rujNpF7K0uAy+QACGI2mQIajjywryzV4BBQvBch
         nyTQFowyZlMJN5gRaaPCzFkOecxdkwYN09gCHLhguD5o3JH+HX/gQjgmiqYvzfXYz4oy
         RgXDdSewe9u+FGWD5es0Gu+i1YgqbF/M4TXrgtrhp9k/VLp8Pmext1AcSixGfJWjDzZz
         i72A==
X-Gm-Message-State: AOJu0YwTyUOispm/zi1KkzBpVgDEzPOhwr1Vhv6OGIkTPwOD1Lgiub5w
	W7YU+wbI2AJc+AGAMKo/F0ga0ivQBBcx4GwKN++RE1EO9AlnVdr7Hpk757a7IvZT
X-Gm-Gg: ASbGncslsNbmvP/knP92BtFcR7ipFh9jZ5qRVYQbkHUda5abALG03fOGqLWkRrwTZoO
	uKV/Izc/UBoQCFcq0YZH2/TcphYYblusRKukj3uQxxxjO6skCzH8gTAg2gTrfHgS0l7Ql+fHgCg
	+MYhnfO727kzBFGgI5wGA4bKvuEH4fVEaW8aAlWl/N9LV+zXvGJZ0SXR2sld8mvComzjOuFXn1x
	MKLHb5rVAePAs2SNlrVtHcyrIemcx2UYV+UjQCdKrjQR/AjZZ0o/q+UEi3B9kdacE9ZiCUoCofb
	PFMdVmtrYsN5bxBXmWTDx+RhKuckG6ADmXXd7vpR3Xyo6ha6mGeRp3SYgmwGfXM6aYKlE60WYX8
	3DZYgRzHANcOXsh1KfqojwZgWRTWeXeeQtjp8T78XvGNH5Bx6wqZGq4g5+rEfczAjp6G/DIC6Yh
	64aSx4GBvk+P579QRSvgE=
X-Google-Smtp-Source: AGHT+IGC/p+vruBOmMX3CVUn5OlVbEqfMcbZJQkHsqvc5Ov5y9kPn9oNhb2ZHlH/33c2SsprnGh5Jg==
X-Received: by 2002:a05:6102:5a8c:b0:525:df9e:9365 with SMTP id ada2fe7eead31-5d5e236d032mr1012337137.16.1759919824684;
        Wed, 08 Oct 2025 03:37:04 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-92eb4d83c45sm4051903241.4.2025.10.08.03.37.04
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 03:37:04 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5a3511312d6so2877314137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Oct 2025 03:37:04 -0700 (PDT)
X-Received: by 2002:a05:6102:2925:b0:520:4054:6b9 with SMTP id
 ada2fe7eead31-5d5e226f3e6mr849411137.9.1759919823850; Wed, 08 Oct 2025
 03:37:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007152007.14508-7-wsa+renesas@sang-engineering.com> <20251007152007.14508-11-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251007152007.14508-11-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Oct 2025 12:36:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX29OUfM+RphgS3jk9Whw7kz+U-ysFYq1FymdU4GZLqFA@mail.gmail.com>
X-Gm-Features: AS18NWDuumoDujetCyC5cvBjrasbgP1Lj0erif8acEm21JO_mY5oVayc_GqwzjY
Message-ID: <CAMuHMdX29OUfM+RphgS3jk9Whw7kz+U-ysFYq1FymdU4GZLqFA@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] dt-bindings: watchdog: factor out RZ/V2H(P) watchdog
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Tue, 7 Oct 2025 at 17:20, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Renesas created different watchdog IPs but they are all handled in the
> same binding documentation. This leads to a lot of conditional handling
> which makes it unnecessarily hard to add new items. Factor out the
> RZ/V2H(P) watchdog to make handling easier.
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
> @@ -0,0 +1,109 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/renesas,r9a09g057-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/V2H(P) Watchdog Timer (WDT) Controller
> +
> +maintainers:
> +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,r9a09g047-wdt # RZ/G3E
> +              - renesas,r9a09g056-wdt # RZ/V2N
> +          - const: renesas,r9a09g057-wdt # RZ/V2H(P)
> +
> +      - items:
> +          - const: renesas,r9a09g087-wdt # RZ/N2H
> +          - const: renesas,r9a09g077-wdt # RZ/T2H
> +
> +      - enum:
> +          - renesas,r9a09g057-wdt    # RZ/V2H(P)
> +          - renesas,r9a09g077-wdt    # RZ/T2H

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g057-wdt
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +        clock-names:
> +          minItems: 2
> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g077-wdt
> +    then:
> +      properties:
> +        resets: false
> +        clock-names:
> +          maxItems: 1
> +        reg:
> +          minItems: 2
> +    else:
> +      properties:
> +        reg:
> +          maxItems: 1

Both if-statements can be merged, as the second test condition boils
down to the inverse of the first.

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

