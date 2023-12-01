Return-Path: <linux-renesas-soc+bounces-519-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB12F800C43
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 14:33:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96150281A60
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 13:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1306C38DD3;
	Fri,  1 Dec 2023 13:33:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74F56A6;
	Fri,  1 Dec 2023 05:33:43 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5c85e8fdd2dso23571827b3.2;
        Fri, 01 Dec 2023 05:33:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701437622; x=1702042422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pi5CLdTBD3o6A552c2yKlmz+TRIKCo5UoCCyICzwCGA=;
        b=RTr6A4c9iHeApMB5eH9NtZFLA6c3l1JgupkgHOXcT7o46sn52CtPybdXFx+OgV+Yk0
         S6lvb78R3pXAxgC8wm8oaIKptnpNUyRTL+P6Zc21cQnoUDImh6g+ttZVpl2dqu5b5SIM
         u9EpF+giH489hXIarTNaTMPOjLdLLGRY13dc+Bc3Tkcdz5C5GDszjOfnG5RqcvY5L/Rj
         L0CLRSAGgdxet9VNRYY0CKEpG0OdmioXp1ZC6gXjNm4l72i4XscA7bsTCTIKW6Yf5IBG
         LD8wulVSyvrq9xIXrApUCsd09Ja1f+6oocfw/vy578L3HMWrNqLY/KczT4WWY2aIKLnb
         3ITg==
X-Gm-Message-State: AOJu0YyNGit0Rm5ZFZsg/ssNTT58rUwN0Jm3R9wgNXVsjKCej0ro6eAP
	32TPyyNWT+FbShYQ9sLVxmEnvJwM2g5cMw==
X-Google-Smtp-Source: AGHT+IHOFcWoD4tNySYUF4If0O72uowXXFBBZUMPQPPyc2ssWiYBgtwCQoM74PcBYb0zxVVNKFuR1Q==
X-Received: by 2002:a05:690c:3348:b0:5ce:a72e:a30a with SMTP id fk8-20020a05690c334800b005cea72ea30amr25402000ywb.24.1701437622441;
        Fri, 01 Dec 2023 05:33:42 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id u204-20020a8160d5000000b005d29344e625sm1077058ywb.114.2023.12.01.05.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 05:33:41 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5c85e8fdd2dso23571357b3.2;
        Fri, 01 Dec 2023 05:33:40 -0800 (PST)
X-Received: by 2002:a81:9b46:0:b0:5d3:627c:7e11 with SMTP id
 s67-20020a819b46000000b005d3627c7e11mr4775995ywg.34.1701437620680; Fri, 01
 Dec 2023 05:33:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201110840.37408-1-biju.das.jz@bp.renesas.com> <20231201110840.37408-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20231201110840.37408-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 1 Dec 2023 14:33:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVGuEKOeXkK8wbUzjx3UMOOcpyW2yp=i2A6V4auGbqoEQ@mail.gmail.com>
Message-ID: <CAMuHMdVGuEKOeXkK8wbUzjx3UMOOcpyW2yp=i2A6V4auGbqoEQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] dt-bindings: mfd: Convert da9062 to json-schema
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Support Opensource <support.opensource@diasemi.com>, devicetree@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Fri, Dec 1, 2023 at 12:09=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Convert the da9062 PMIC device tree binding documentation to json-schema.
>
> Update the example to match reality.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/mfd/da9062.txt
> +++ /dev/null

This file is still referred to from other files:

    $ git grep Documentation/devicetree/bindings/mfd/da9062.txt
    Documentation/devicetree/bindings/input/da9062-onkey.txt:DA9062
and DA9061 chips see Documentation/devicetree/bindings/mfd/da9062.txt
    Documentation/devicetree/bindings/thermal/da9062-thermal.txt:DA9062
and DA9061 chips see Documentation/devicetree/bindings/mfd/da9062.txt

> -- onkey : See ../input/da9062-onkey.txt

Documentation/devicetree/bindings/input/da9062-onkey.txt still exists,
and covers more variants than your new dlg,da9062.yaml.

> -
> -- watchdog: See ../watchdog/da9062-wdt.txt

This was replaced by
Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml
a while ago, and covers more variants than your new dlg,da9062.yaml.

> -
> -- thermal : See ../thermal/da9062-thermal.txt

Documentation/devicetree/bindings/thermal/da9062-thermal.txt still exists,
and covers more variants than your new dlg,da9062.yaml.

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/dlg,da9062.yaml
> @@ -0,0 +1,220 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/dlg,da9062.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Dialog DA9062 Power Management Integrated Circuit (PMIC)
> +
> +maintainers:
> +  - Biju Das <biju.das.jz@bp.renesas.com>
> +
> +description: |
> +  Product information for the DA9062 and DA9061 devices can be found her=
e:
> +  - https://www.dialog-semiconductor.com/products/da9062
> +  - https://www.dialog-semiconductor.com/products/da9061
> +
> +  The DA9062 PMIC consists of:
> +
> +  Device                   Supply Names    Description
> +  ------                   ------------    -----------
> +  da9062-regulator        :               : LDOs & BUCKs
> +  da9062-rtc              :               : Real-Time Clock
> +  da9062-onkey            :               : On Key
> +  da9062-watchdog         :               : Watchdog Timer
> +  da9062-thermal          :               : Thermal
> +  da9062-gpio             :               : GPIOs
> +
> +  The DA9061 PMIC consists of:
> +
> +  Device                   Supply Names    Description
> +  ------                   ------------    -----------
> +  da9062-regulator        :               : LDOs & BUCKs
> +  da9062-onkey            :               : On Key
> +  da9062-watchdog         :               : Watchdog Timer
> +  da9062-thermal          :               : Thermal

da9061 (x4)

> +
> +properties:

> +  watchdog:

Please sort subnodes alphabetically.

> +    type: object
> +    $ref: /schemas/watchdog/watchdog.yaml#
> +    unevaluatedProperties: false
> +    properties:
> +      compatible:
> +        const: dlg,da9062-watchdog

What about dlg,da9061-watchdog? Probably this should refer to
Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml
instead?

This applies to the other subnodes, too.

Perhaps this binding should be merged with dlg,da9063.yaml?
Or should it be split in dlg,da9061.yaml and dlg,da9062.yaml?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

