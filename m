Return-Path: <linux-renesas-soc+bounces-11092-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 627F89E90BC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2024 11:45:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10D0C280C39
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2024 10:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE36216E3E;
	Mon,  9 Dec 2024 10:45:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68ACA216E31;
	Mon,  9 Dec 2024 10:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733741112; cv=none; b=klCGjMJAaHtJsWxYDI4HM/J+Qne+YU8RcFS/8T5dPZqbyRdeR7ZCb8Rn0HWow/3V9pekyauEE7HXfdvhUrNiFWcm5AeiMq3yCoQbDqLd5KVFmV8sO1tlLuh+A/cOw1NepQndNKpkXN5ykfjm19JiyFAVbjkJKYe12BWbmhMIobE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733741112; c=relaxed/simple;
	bh=KALGrvRceaj0Np1tlNKSV8kRzCWqGUY4Tz6c9Zqe0zg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tA4aCzlkOCSNbpO6u5JfMqGdVNCGgjZGMdBQr6GUbcjg7UnZiakO/DTFzT76YlOlLoWmRwQgVyeFOLid6GxALscDs6l8CskAO9LOae8Z3ARZZ1yEt8GSwSmlNl6GyULBWUk4xnu5aNS/+eMJCIvv3buDhmi0v4zlks31dYbiTYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-85b9f2de38eso791081241.2;
        Mon, 09 Dec 2024 02:45:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733741107; x=1734345907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JJIdX8rIt3byI39AjDmGrNg88Cw5YvVzSsI4ea5fZNY=;
        b=uRbugkCmc6aR1+Qvdkylr/1V2/Bg+Xs8sPOd9+aqMH/Z8mCasHEeJbAhCJnvO7mLIe
         p0qDnOmmXrW97TCCUldE3O/pB/P9OJeRyGU0JS0Qe9CSUs1IBecmRN9IsDedzr1OlRG1
         X3HyXxGznt8mwRg3Ag0i/JnkApeavaMIR3leAFKHSbc8mGxny21E3FYx/eK9z7969k3E
         R4M1UrkA/rN475+hm1fFq+KrDbCTX6b/RTsW9yIkVAdwMnW7LVJuFji7EnnFY4RHlXRm
         2Fh57lFhk823tUDCKQTAtIFVj08tH1vpIobw/o8TDYqhqa+1ZqeAYQCagTseHq5rrpfe
         6jLg==
X-Forwarded-Encrypted: i=1; AJvYcCUiRlzjlkdsmpR+nOhRkqvcpn/9puO2qwY3XNEFYUXXo+Li0InZAd9psIGxpsa7TJ847w8v8amlXx+2sD4f@vger.kernel.org, AJvYcCV0VJB9bo74uDJA7kkbsV15YJUZgqvDBifZo5Xn/KUnsv9ZTRJ9m+VgHGnlBKp5GKPYP6SBbKRNjG3m@vger.kernel.org, AJvYcCVmOvEa7wq+Odr/7e9J5uGNTnHcUcXs2zSdpv5ts6sPbiY2/nuCGsYjMap1x448wmJKs/jVVbF9Yki8@vger.kernel.org, AJvYcCWrAA/jTZs5Ly7hktXVtrFTYuumPw3L2oGfg8LPwKgfOSeYzV6mIPfhPWhsfjSpX4hk0qyNQfFiFroMi7Sz@vger.kernel.org, AJvYcCWzF5pfKoS/1snaxQrG81E3LT5Ql75EeD+e4GdH99RR3xGgqjiz6CbDmDUYt68JCvryK0vYW5DHonGKhLINo1utYRw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgw27r7Fe931eQQQQF8Qz6V+146n2DGTOpAbLwL7Ese6UidMxe
	tKK2UHMPugU9pWphHzy71Ze/heRSHOhO1V2tTPXSY//c6fkDoTXdN9waom6JkgI=
X-Gm-Gg: ASbGncs1++iT/N/Kh4SX0rvXu4EYouCnyLxpzC8WqtxEocdYhIGr9bIswJgW39RzpP9
	Cuna+obggDTpxG7+Ammyx/EK0t4+nuKI24peSkd00zylJcQP0c5bet0xA1FY2NROykfNlUmne3g
	a8qW/hWQJF+D9C9NYJ4hRAyOTqk4EPkSBGPtoxss+pkYNCiBvWhl5eVfo5JhCjEnURy+qudVDu/
	EiZEkWoZAUAdDiWfJFiUGZEXz78kuc6NbKmKrxL28LXKgJZK/vfRhBb4nexXjiyF0w43y2oHk9/
	Kwy91MfkSo9w
X-Google-Smtp-Source: AGHT+IGjjWvIiljlipDAq07sxFkPX2TvCRltpo+y8mn8XU/1ASX3KSFGCZ4qTSDLYwmnoLvehURdtA==
X-Received: by 2002:a05:6102:32ce:b0:4af:a990:d212 with SMTP id ada2fe7eead31-4b11607c10cmr24225137.9.1733741107269;
        Mon, 09 Dec 2024 02:45:07 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4afdeeedddbsm636560137.30.2024.12.09.02.45.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 02:45:06 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4afdfd3124dso537069137.2;
        Mon, 09 Dec 2024 02:45:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU57AHaLjHwZBE7J1UCYZ5PhX8yMbsPgU62LiPJYAq9YJNlEZ00npqQHQfVke/JPX3rQwD9S71GqmHyqMay@vger.kernel.org, AJvYcCUPHg4t9RU/5mjJVgNNYL99ieRt4US+VpEZmJRqUsPGTJ8MSVQdPQb0JkGFxTFdYZ0eujtnKSGIdMR+qB8v@vger.kernel.org, AJvYcCW9TrvTgJIRMscYmvS6E9JFUzzSafmpMM3WOJLdoAFP0BzV84rL6N4r28cpPzy9TioMp752sJADkgCUS19byczy5Jk=@vger.kernel.org, AJvYcCWae+i3YFg7ECP/A83tWGVCcyaZ4PsZdCk4HYtQoglOKu2scUJ7oWm2Guofxbx9iuyjDNJ3heGKO2Gs@vger.kernel.org, AJvYcCXnlQKKMBQ+PWmVP/BwkFLPX5/15HXP0iWq74QFQtOGONfzXMR9bUhLF4xxxHAqoxQQFNDxO5c4WOMd@vger.kernel.org
X-Received: by 2002:a05:6102:2ac6:b0:4af:ba38:d04a with SMTP id
 ada2fe7eead31-4b1161c2740mr15636137.21.1733741105957; Mon, 09 Dec 2024
 02:45:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241115134401.3893008-1-claudiu.beznea.uj@bp.renesas.com> <20241115134401.3893008-9-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241115134401.3893008-9-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Dec 2024 11:44:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUskZAY6sw-dqKGfWpqhqnM9E_Jh+44ceybCeyASTf7vQ@mail.gmail.com>
Message-ID: <CAMuHMdUskZAY6sw-dqKGfWpqhqnM9E_Jh+44ceybCeyASTf7vQ@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] arm64: dts: renesas: r9a08g045s33-smarc-pmod: Add
 overlay for SCIF1
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
> Add DT overlay for SCIF1 (of the Renesas RZ/G3S SoC) routed through the
> PMOD1_3A interface available on the Renesas RZ SMARC Carrier II board.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a08g045s33-smarc-pmod.dtso
> @@ -0,0 +1,48 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the RZ/G3S SMARC Carrier II EVK PMOD parts

So you plan to describe all 3 PMOD interfaces in a single overlay?
The board has:
  1. PMOD0 - Type-2A,
  2. PMOD1 - Tpye-3A,
  3. PMOD1 - Type 6A.
Wouldn't it be more convenient to have separate overlays for each port,
so you can more easily use them as e.g. Type-1(A) (GPIO only)?

BTW, naming both the second and third port "PMOD1" in the schematics,
and differentiating them by their type, was definitely a bad idea.
How can you distinguish between Type-1(A) on the second or third port?

> + *
> + * Copyright (C) 2024 Renesas Electronics Corp.
> + *
> + *
> + * [Connection]
> + *
> + * SMARC Carrier II EVK
> + * +--------------------------------------------+
> + * |PMOD1_3A (PMOD1 PIN HEADER)                        |
> + * |   SCIF1_CTS# (pin1)  (pin7)  PMOD1_GPIO10 |
> + * |   SCIF1_TXD  (pin2)  (pin8)  PMOD1_GPIO11 |
> + * |   SCIF1_RXD  (pin3)  (pin9)  PMOD1_GPIO12 |
> + * |   SCIF1_RTS# (pin4)  (pin10) PMOD1_GPIO13 |
> + * |   GND        (pin5)  (pin11) GND          |
> + * |   PWR_PMOD1  (pin6)  (pin12) GND          |
> + * +--------------------------------------------+

This depends not only on CONFIG_SW3 (for RXD only), but also on
SW_OPT_MUX4 (SW_SER0_PMOD=3DL gates all 4 SCIF1 signals).
While including "rzg3s-smarc-switches.h" for (out-of-tree) overlay
configfs is not really needed, please document the switches in the
comments.  As this is included in r9a08g045s33-smarc-pmod.dtb, you
may still want to include "rzg3s-smarc-switches.h".

> + *
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
> +
> +&{/} {
> +       aliases {
> +               serial0 =3D "/soc/serial@1004bc00";

Note that configuring aliases doesn't work in dynamic overlays
(but we don't care in upstream).
However, this is also wired on the Carrier board to the M2 slot when
SW_SER0_PMOD is low. so I think it makes sense to have the alias
unconditionally in rzg3s-smarc.dtsi instead.

> +       };

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

