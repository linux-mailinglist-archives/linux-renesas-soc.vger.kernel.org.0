Return-Path: <linux-renesas-soc+bounces-12462-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4501BA1B66A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 13:57:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7DF81889295
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 12:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C4D111AD;
	Fri, 24 Jan 2025 12:57:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C306524F;
	Fri, 24 Jan 2025 12:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737723428; cv=none; b=NQb/zLT6sjgYZGO8t7wWCKjX88cgGQ6Z1HHY+CY8vKP27z33YmXtop7oIj6/WsQwPiPUv0YwG+gBMTVa/n8SvrkkrEEDZ4ypYfUMixxwmP288rbY4Nt/sx6Z3tMvijAjlNi0cr6Q9ycyGCg4IN8I70bna+fyl96dZaufCQ2HOpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737723428; c=relaxed/simple;
	bh=j4oGJ6K0mb+RNYHi9CfElKjlw0p0gZ1h7KlznsCqyR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pM0qiF9PSKNW+14EKZge5rytHGucp4Hb/ARo9G2NjL+B7rZwpxF/i20gC+ox2m0/dXqJnrWLxvF91nreLzSNf2nJr3eF7hzD5qtc5Xt45eyAe8uHI6A0R0PkM8+aTzh7jGSaRvIw6iIBRGHbbj3DZ1gsQhZS/lJ1zeaYlYq6ZC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-85bad7be09dso1195668241.0;
        Fri, 24 Jan 2025 04:57:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737723424; x=1738328224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Whysl5RQ4Gz9zn7F5zfvElJC1wWKfMWPjRBrgv5mex0=;
        b=S2Le7m72JzuZRteeeSCVeBGaXZpOOKgL5EYM7QaOlZDueidMA2ZbvAEE0uQx6ISVuP
         XYoT/dDQOU8F7+piIzMki36E3smU/jK8lCQHInyRXn36d071gpe6eW7GiNpTkBoBjv7U
         fpXmp/VGvF6Ee4GJeWF2agSZD+ZRLqt2kl/BvIbbbxoo30JbLAilH0MFsvCCA96GsfrQ
         ISTJ7+nHL4LF0t9RthdaYTjMWTCHU/YaBDZ2ukl7+b1Jqefm0oBfJcW7WP29cNICx48n
         0nZrphDI0/2ILY/DseYQ6+Rhky8Xg8AanLURFYFp05FYcJWP2P/iSxi3DYBtvoJFv/mt
         B+VQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF8/bC0CY+vhO36/dw/4CghQr3vRbZ+GXhSx3mc0UG/nbzalBF9FKReObx0qjb0y0QG8pcqTSc3gNE@vger.kernel.org, AJvYcCUSd3RsCS1QkiqKQwMu84/QRzvlg5PBULCdBcEAHs5xVDwNuS7ZykUaVtqLUP7EjH+BZuCakR8mLUFGPKhXkTZy9ps=@vger.kernel.org, AJvYcCVXLl3WETH0pckE9af23Rs2JEQnQ/TO0lCoKXi8GczlyHDwFHbNyraqXEFtumACXw332POgoDU/IzG6tzgy@vger.kernel.org, AJvYcCXxkCPvKuWEqm/y+da+N9maZbBXaamOx1cgD4OCssU+te3fbaEwRa9yh3CoN1fR4llYlMra9ZXDMvvPLQE4@vger.kernel.org
X-Gm-Message-State: AOJu0YwUx1lJiWRI0oxPkCRSKou0nrfHTuJsivRU8N1q2YDyt+nKuH5p
	BhYnHUo0i4uHPf3e/irmEYdAsaqLY5jW8TJ+hOWOAnKOHXNmMRUOGBWpjOEw
X-Gm-Gg: ASbGncuKihHQUYMe9Du1vgInhicfvpn6taq4aTdxKe16FDhbmh/O+DqYapQ4+mXQnQU
	WOmOeBiwvgIyE95gG9hGQxgJ/Ic6CyPgiO+oNOA2zuG+qPJKwKwQYnrFnViyz0ZEC6csH+u8Ob2
	U5MdBmVJQihYl78UEkRQ/TEH1DYruTVn+udkZZlKrzImqsfBr6c4kefvrdBY2SXHFVSOKKu7A3F
	/FqJCmOQc4ByZF3VIOhwcgGF2D+kmVI2SmwkDd5uO3Ns5PiPvSEfxPKgWCQDHz8p5xBGX4gYPzb
	43VsEGjMVGkm+AyEQmtFH/f2IWfNghUy9ZjEVf0ADnA=
X-Google-Smtp-Source: AGHT+IEGVW/E7PItdj6j6PyngEd4PWncZ75nGwvVabTYj3nQpoeUYAhzbq6urPeYp8LbQNzhByddhg==
X-Received: by 2002:a05:6102:f97:b0:4b4:27dc:ffe3 with SMTP id ada2fe7eead31-4b69099e6f9mr29140215137.0.1737723423213;
        Fri, 24 Jan 2025 04:57:03 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b70999dcc9sm394748137.29.2025.01.24.04.57.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 04:57:02 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4afeccfeda2so1149793137.1;
        Fri, 24 Jan 2025 04:57:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU67Q8rIxlSLq+fT4JkqVX5nzi7RJcylCjYGwI+blcaezfaMn3KGtlHv+/zUdn+R7RX84sfqiX1oqBX6B1A@vger.kernel.org, AJvYcCVY4lGzv560IogPS+/3PEztwnrunYmv7/EnHnSBSX0KvIGshPCOW4I4RoOF4vbfvYnD66cvSOaE6HRi@vger.kernel.org, AJvYcCWglgsvYhR/jTrNlCHYQARYCVMVOWEbeYS9ecXTUnmRJszLpCxX7m+yel5AUu8jxtt2xLmW+BpZOKMy7Wv36BkYgRc=@vger.kernel.org, AJvYcCXqRXwU5QsGhF42jf50CawQ1Ds6Wxa3Y2x+qSWXih4EDscvuhuICZeVS5LjAIglXWaaO8Ie5QbS7Bv1JIxi@vger.kernel.org
X-Received: by 2002:a05:6102:3f41:b0:4b2:5ca3:f82a with SMTP id
 ada2fe7eead31-4b690bb6273mr26659681137.7.1737723422272; Fri, 24 Jan 2025
 04:57:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120130936.1080069-1-claudiu.beznea.uj@bp.renesas.com> <20250120130936.1080069-5-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250120130936.1080069-5-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Jan 2025 13:56:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUdq9XRpxAEmY3tG-cKHVrYfmbU4-YNRugSz5J5Qfkyzw@mail.gmail.com>
X-Gm-Features: AWEUYZkcbYrDILv1p8Gs3K0rRFhCUHJuK1KL-uhwRp64jIORrwdyE3DsCbPbTx4
Message-ID: <CAMuHMdUdq9XRpxAEmY3tG-cKHVrYfmbU4-YNRugSz5J5Qfkyzw@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] arm64: dts: renesas: r9a08g045s33-smarc-pmod: Add
 overlay for SCIF1
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	p.zabel@pengutronix.de, claudiu.beznea.uj@bp.renesas.com, 
	wsa+renesas@sang-engineering.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Mon, Jan 20, 2025 at 2:09=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add DT overlay for SCIF1 (of the Renesas RZ/G3S SoC) routed through the
> PMOD1_3A interface available on the Renesas RZ SMARC Carrier II board.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v4:
> - rename overlay name to r9a08g045s33-smarc-pmod1-type-3a
> - add note about the needed switches for SCIF1
> - guard the scif1 node with #if SW_CONFIG3 =3D=3D SW_ON && SW_OPT_MUX4 =
=3D=3D SW_ON
> - dropped the alias section from the overlay file and move it
>   the board file
> - document SW_OPT_MUX4 switch

Thanks for the update!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a08g045s33-smarc-pmod1-type-3a.dtso
> @@ -0,0 +1,48 @@
> +// SPDX-License-Identifier: GPL-2.0

Would you mind if I changed this to (GPL-2.0-only OR BSD-2-Clause) while
applying?

> +&pinctrl {
> +       scif1_pins: scif1-pins {
> +               pinmux =3D <RZG2L_PORT_PINMUX(14, 0, 1)>, /* TXD */
> +                        <RZG2L_PORT_PINMUX(14, 1, 1)>, /* RXD */
> +                        <RZG2L_PORT_PINMUX(16, 0, 1)>, /* CTS */
> +                        <RZG2L_PORT_PINMUX(16, 1, 1)>; /* RTS */

CTS# and RTS#

> +       };
> +};

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

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

