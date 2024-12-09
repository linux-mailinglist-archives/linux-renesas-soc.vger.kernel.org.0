Return-Path: <linux-renesas-soc+bounces-11088-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4C69E8FBE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2024 11:10:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42FD81881B9C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2024 10:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB0E42165F4;
	Mon,  9 Dec 2024 10:10:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B557012CD8B;
	Mon,  9 Dec 2024 10:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733739002; cv=none; b=fvJ+quTlnyGtz7947nUQ/e9BuNLOift7GS3+Zw80h0V5BYJJ4e1/673/bWmJGlbmfifwu45jrnaUYLo4pcQFtXHu7bi25EgtqCbdJsgsu2A03YWvr2CWk56zwU1UHzQ4TIJKldqqA4ID5zuLb2j7zQnR2NGwv9gbc80ZY/uQI1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733739002; c=relaxed/simple;
	bh=GAkCU3aAd+gVqdVkBWvDsRMR34tLWZNm4N/eTTeZSR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rAmE1jskweTkzFRGtX9DaJWDBONsmBtiLf/gi4Ym89oPDwtUlEBabrl6ez/BP+s3qhAdsSBi8GAmN/acKG+qBq54m78iQWlsx/IYu79GZs9rI/Sw9VJC/oiUf+8grmk//IEJvCcXBj+/lTqLijz9ww2MVBQAhnA0DnBNkAodJ6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-85c48f5e2c1so455331241.3;
        Mon, 09 Dec 2024 02:10:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733738998; x=1734343798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jDkEbJbYYDDCIMS580AaIYM47c62x3jRf7aYK2lIXI8=;
        b=X+YvtCfmy1wRyDj5o7q3tVR0c+Snx19SiBe5/ime9AU+eb1T2iD+abKLOMQMrdxAj2
         ZOFazvaPm5+0exXl5gofbetdC7WrVNaui8h3Zb9B16haQl+wFOZVfTfGaloxMco5Fp6r
         8zOGe6imMxX77yyZ2Y2DY4oP0jFQa2UfdV/MBGNWtXue5I6Pb/E2m+ypqPUR0XFIv0S3
         cBcphNilz8Jb4BgWlS+SmXBXdhVkuuUQ/2gMjk4H6fhYd97t8cc/q8Q8E610G23yLpu4
         vUbWKWpxyETNUlRMv0Ne9H7ne92+eOWAXgQeuAsCxaEGQlzg9+L7wfxWCIxQ6pIka7yP
         jz3A==
X-Forwarded-Encrypted: i=1; AJvYcCU/F8A+a+/EEY8WcTgJhEvBZzPYD6kNyr3jx40QAM6HS0uMEmo14CojHruSBOLt4J/AwGqvzZkiQEDL@vger.kernel.org, AJvYcCUvaNTK3qAEGY9l/H6TyKsxryVDMcFYgWwwDQikQ5YWDkOy0cu+B/45G/gP4uwPWYyCN5E/TWbNjHEXsW8t9v6iIJ8=@vger.kernel.org, AJvYcCVD0enZkSXrWVTd6+kifFLzntpiayzI49nsUS5xLLqEvK1wlazDptVwm0ULz427hu6TLftES3cF7QyuBJCx@vger.kernel.org, AJvYcCVNkFDxE+UATbevX2rxZZKnQTc4z32/AfMYglaTFxH2afQEYuhxPUZmK79JYKxS8lgUoix3EkiQRxhC@vger.kernel.org, AJvYcCWMbn+qHzZ1BcDmhhAL5XJkOGi2v23EU4n+B1pqtMZt1V38qn5yNL3jY5/m9Q659S9Yw0CX47gJVGq19MZi@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+NuYMkgcTlnGSMsemIsTFPoa5Id39iByuUTwR0H14tON32aj6
	ARHBfykS6HRHVWn7ZF4x1UoRwIq1TcsJpHLw1bzSu3GdYm5e+6LjkQ5h4YmI8CY=
X-Gm-Gg: ASbGncttOhdJW0ninaEJOKKl0zifK0a1g5UKiHzjkKAHwnqo2DsxesVQfJ+B+wI9qig
	I1suPlR4uTMLre6eUUrvjFHacEGg0XDDkQ1hso5nB0huiOnysIS1tY84BbhvLv54vrqKIAXRZPd
	bK8x4cjmhXS8xesVb0mszEK8GaRpImakDammWsaN7ej/mQrUG92wseWTL+yz9Itx7XbvK+iL22Y
	DjRLL3Thg7bEfrJju/oLIDONwS3Bi0GL6PckDRotGoFZU3VUDU8J37yeujuXEaA0vVKsdyoM9w0
	/wcQWWXRGRmW
X-Google-Smtp-Source: AGHT+IHNB/BbWrUA6atlQPgW+ghlPNbey5u62+HpcIgynXutov9AchbvlxBKCgPRZnAtv2iQkLiF6A==
X-Received: by 2002:a05:6102:3751:b0:4af:bb73:9987 with SMTP id ada2fe7eead31-4afcaaed226mr10279060137.18.1733738997756;
        Mon, 09 Dec 2024 02:09:57 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4affcf39d13sm231482137.8.2024.12.09.02.09.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 02:09:57 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-85c4b4cf73aso527546241.2;
        Mon, 09 Dec 2024 02:09:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCULs05cLhrZxHoX+dahkTUDmoZ9bcG32aM8ywD3j+dU/hTUJ8kaGqXbO+eWtWZGTetCkhbMEtmYvVlw@vger.kernel.org, AJvYcCUh3rjsMW1G+67OkJACAiQxv0eC+usI3vahDSsSbC4kMs5CHB+i4tKwaa+VAZW7cBu95FvjbRC9IJOTFkfu@vger.kernel.org, AJvYcCV4NIA92Q35mb56txyFI3vqHzVxQben3cQLRlNj7Lw41vAwUkid3I/KqcwwuxTcQI7SWaY/kk3e7eIkAj1u@vger.kernel.org, AJvYcCWFT7RIDUHzXQTSGnLHO0mmbZcDDOP4DZKGOYizp6zZKsHNirb232uROylMHoGFOLQv54vEUL1lb+DF@vger.kernel.org, AJvYcCWZVV0ztV4fPxiqUPo7L43GJGksIof9fXFc2DC0I5F7+gdn03U7cS4UVqju9snbImGV/lTNH3OomCxFp0VB6cJCXFo=@vger.kernel.org
X-Received: by 2002:a05:6102:162b:b0:4af:b45a:cd20 with SMTP id
 ada2fe7eead31-4afcab15bafmr11700791137.26.1733738996886; Mon, 09 Dec 2024
 02:09:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241115134401.3893008-1-claudiu.beznea.uj@bp.renesas.com> <20241115134401.3893008-7-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241115134401.3893008-7-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Dec 2024 11:09:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVgxKHw4PDbgOGAJf7xsRR1Uyzxu-br+=RK_1ouHoj41g@mail.gmail.com>
Message-ID: <CAMuHMdVgxKHw4PDbgOGAJf7xsRR1Uyzxu-br+=RK_1ouHoj41g@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] arm64: dts: renesas: rzg3s-smarc-switches: Add a
 header to describe different switches
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, p.zabel@pengutronix.de, 
	lethal@linux-sh.org, g.liakhovetski@gmx.de, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-serial@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Fri, Nov 15, 2024 at 2:50=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> There are different switches available on both the RZ/G3S SMARC Module an=
d
> RZ SMARC Carrier II boards. These switches are used to route different So=
C
> signals to different parts available on board.
>
> These switches are described in device trees through macros. These macros
> are set accordingly such that the resulted compiled dtb to describe the
> on-board switches states.
>
> Based on the SW_CONFIG3 switch state (populated on the module board), the
> SCIF3 SoC interface is routed or not to an U(S)ART pin header available o=
n
> the carrier board. As the SCIF3 is accessible through the carrier board,
> the device tree enables it in the carrier DTS. To be able to cope with
> these type of configurations, add a header file where all the on-board
> switches can be described and shared accordingly between module and carri=
er
> board.
>
> Commit prepares the code to enable SCIF3 on the RZ/G3S carrier device
> tree.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> @@ -9,25 +9,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
>
> -/*
> - * On-board switches' states:
> - * @SW_OFF: switch's state is OFF
> - * @SW_ON:  switch's state is ON
> - */
> -#define SW_OFF         0
> -#define SW_ON          1
> -
> -/*
> - * SW_CONFIG[x] switches' states:
> - * @SW_CONFIG2:
> - *     SW_OFF - SD0 is connected to eMMC
> - *     SW_ON  - SD0 is connected to uSD0 card
> - * @SW_CONFIG3:
> - *     SW_OFF - SD2 is connected to SoC
> - *     SW_ON  - SCIF1, SSI0, IRQ0, IRQ1 connected to SoC
> - */
> -#define SW_CONFIG2     SW_OFF
> -#define SW_CONFIG3     SW_ON
> +#include "rzg3s-smarc-switches.h"
>
>  / {
>         compatible =3D "renesas,rzg3s-smarcm", "renesas,r9a08g045s33", "r=
enesas,r9a08g045";
> diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-switches.h b/arch/ar=
m64/boot/dts/renesas/rzg3s-smarc-switches.h
> new file mode 100644
> index 000000000000..e2d9b953f627
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-switches.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

I agree with Rob about the license.

> +/*
> + * On-board switches for the Renesas RZ/G3S SMARC Module and RZ SMARC Ca=
rrier II
> + * boards.
> + *
> + * Copyright (C) 2024 Renesas Electronics Corp.
> + */
> +
> +#ifndef __RZG3S_SMARC_SWITCHES__
> +#define __RZG3S_SMARC_SWITCHES__
> +
> +/*
> + * On-board switches' states:
> + * @SW_OFF: switch's state is OFF
> + * @SW_ON:  switch's state is ON
> + */
> +#define SW_OFF         0
> +#define SW_ON          1
> +
> +/*
> + * SW_CONFIG[x] switches' states:
> + * @SW_CONFIG2:
> + *     SW_OFF - SD0 is connected to eMMC
> + *     SW_ON  - SD0 is connected to uSD0 card
> + * @SW_CONFIG3:
> + *     SW_OFF - SD2 is connected to SoC
> + *     SW_ON  - SCIF3, SSI3, IRQ0, IRQ1 connected to SoC

Note that the original comment above says "SCIF1, SSI0", and looking
at the schematics (IC7 and IC8 controlled by SW_SD2_EN#), that is
actually correct?

> + */
> +#define SW_CONFIG2     SW_OFF
> +#define SW_CONFIG3     SW_ON
> +
> +#endif /* __RZG3S_SMARC_SWITCHES__ */

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

