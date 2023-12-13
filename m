Return-Path: <linux-renesas-soc+bounces-970-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFA9810D71
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Dec 2023 10:30:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE7B3B208D6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Dec 2023 09:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2BD200D9;
	Wed, 13 Dec 2023 09:30:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC3F3A4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Dec 2023 01:30:22 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5e2b8f480b3so3060927b3.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Dec 2023 01:30:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702459822; x=1703064622;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QVSejphNBHhfFCu8VwDHlybiyGvLYfKl3c0xzDvIRGk=;
        b=WrmYQL7EgNDCe2cktTTy4o5YHpWulk1flN/+SMliuBOCk5Pq9X3ipG+G55DJYWjMv9
         /JzI+ViWpDfJSskCD6+s1X5TSV57ytB8yjYDFdHTiyEBVrNbSOjMGS4bxBRtXRsMVzyI
         G+Wh4hlrlCFEoUDUKHQs/8oljAsklRZgjw033v47wxbjukXneqIhcTox4f3CFfN3d5l8
         n3njVT4lY4Zg5u6NERfSVv7H/ZlB+sJXUwo/E9TcOd0jmBORSp9c5gq/maHdMI6/Qxd6
         LZhGJpLjO81PcDX/Y2ThRvWq4n4CopXm7do5+2f84f4RrOjlZbLjCH3xikaIJBynadPn
         k7Yw==
X-Gm-Message-State: AOJu0YwZzj+A7GjEsAg7zuOeKG+G09/U6mXSA0HyUt5h3SliKqrAyuuQ
	zT1gOfni3wV5MgnGKtNcWxzIE1rtArI4wg==
X-Google-Smtp-Source: AGHT+IGeO3JyzJiXMIAAFf1XE5ShYBk6S6z5bW3ljfkaDdZ4hGBVdnfeO9kk0+l6j8G8OpLFbxGmFQ==
X-Received: by 2002:a81:6c45:0:b0:5e2:26eb:969d with SMTP id h66-20020a816c45000000b005e226eb969dmr1435427ywc.42.1702459821807;
        Wed, 13 Dec 2023 01:30:21 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id i16-20020a0ddf10000000b005e28951e3a4sm609475ywe.51.2023.12.13.01.30.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 01:30:21 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5e2eccf46ddso1502337b3.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Dec 2023 01:30:21 -0800 (PST)
X-Received: by 2002:a81:d50e:0:b0:5cd:ef57:ce3a with SMTP id
 i14-20020a81d50e000000b005cdef57ce3amr5919852ywj.0.1702459821096; Wed, 13 Dec
 2023 01:30:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1702309604.git.geert+renesas@glider.be> <7f9c840ed44dfd57da545e87b5937b58f35cb9c9.1702309604.git.geert+renesas@glider.be>
In-Reply-To: <7f9c840ed44dfd57da545e87b5937b58f35cb9c9.1702309604.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Dec 2023 10:30:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWX9NBwXTaor7CW5Q9VMTDCVT4F7gEYxGZmHcQeJBCd4w@mail.gmail.com>
Message-ID: <CAMuHMdWX9NBwXTaor7CW5Q9VMTDCVT4F7gEYxGZmHcQeJBCd4w@mail.gmail.com>
Subject: Re: [PATCH/RFC 7/7] arm64: dts: renesas: r8a779g0: Add White Hawk
 Single support
To: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 5:01=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> The White Hawk Single board is a single-board integration of the Renesas
> White Hawk CPU and Breakout board stack, based on the R-Car V4H ES2.0
> (R8A779G2) SoC.
>
> For now, the only visible differences compared to the board stack are:
>   - The SoC is an updated version of R-Car V4H (R8A779G0),
>   - The serial console uses an FT2232H instead of a CP2102 USB-UART
>     bridge, with CTS/RTS wired.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts

> +
> +&pfc {
> +       hscif0_pins: hscif0 {

&hscif0_pins {

> +               groups =3D "hscif0_data", "hscif0_ctrl";
> +               function =3D "hscif0";
> +       };
> +};

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

