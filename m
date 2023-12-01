Return-Path: <linux-renesas-soc+bounces-520-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEE0800C57
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 14:40:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0FFD1C20AAB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 13:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ABE538F8C;
	Fri,  1 Dec 2023 13:40:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3376D170F;
	Fri,  1 Dec 2023 05:40:08 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5d3a7aa1ed5so15383487b3.2;
        Fri, 01 Dec 2023 05:40:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701438007; x=1702042807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CeONMnbnc9ooOiJhSyauRgrdy4vIJP3VYKHaPtaPM+s=;
        b=OiaX9DvTxwfbhIcE74Nj1XsxWLYxRtYD1rbaQp4LDq8s+8lPEo84ZemYxM/AWHimAb
         Ghlh2hv02e8fBPlbwaUb9twrl2KXWXtm8oC2co6CNFVeJ9PkDWv9ZGizb9xB87bTnQn0
         176uYpRODMlrVwuzCNI5V9LjQZsvcMzgfA6H8wRC89dqcoRakzvQvb2PbE/qeerP2fg0
         UMsZhnijLGAw2cAfwPTpEicvGedYKBKCSO5JGJsK05BLq3HqWikJYDBkGw3L6c6raB1T
         6QQjIwnovwNBdV18JlX2yOTxUHYOaH0BpHig8cMF6aYz63O2CQVYuikpkL+9xigSF1JQ
         0ErQ==
X-Gm-Message-State: AOJu0YwYiuR7B5nvDRwNmG3j9h9yli6JWg0+VzLaqw1VRw8dK7Skcr7W
	2HPYXwk2tBsXYHE72p/xHmrUDLtzH9rqgg==
X-Google-Smtp-Source: AGHT+IHK3hjJ6/enyV9lNxuDz0/yhF8tGLKuH7d/e0hOw09hna4IbeGA8VHGg4SQ6LltFxtXttBWTQ==
X-Received: by 2002:a05:690c:c1c:b0:5d0:960c:e2b4 with SMTP id cl28-20020a05690c0c1c00b005d0960ce2b4mr19674710ywb.19.1701438003887;
        Fri, 01 Dec 2023 05:40:03 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id j66-20020a0de045000000b005cb3510c8b2sm1083998ywe.96.2023.12.01.05.40.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 05:40:03 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-d9fe0a598d8so511367276.2;
        Fri, 01 Dec 2023 05:40:03 -0800 (PST)
X-Received: by 2002:a25:dcd2:0:b0:db5:4677:6e1f with SMTP id
 y201-20020a25dcd2000000b00db546776e1fmr3755738ybe.41.1701438003304; Fri, 01
 Dec 2023 05:40:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201110840.37408-1-biju.das.jz@bp.renesas.com> <20231201110840.37408-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20231201110840.37408-6-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 1 Dec 2023 14:39:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXH3VVg0KmC0rtjeb_A_Awj805Mirc4pZu=KDZO9pdZZQ@mail.gmail.com>
Message-ID: <CAMuHMdXH3VVg0KmC0rtjeb_A_Awj805Mirc4pZu=KDZO9pdZZQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: renesas: rzg2ul-smarc: Enable PMIC and
 built-in RTC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Fri, Dec 1, 2023 at 12:09=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Enable PMIC DA9062 and the built-in RTC on the RZ/{G2UL,Five} SMARC
> EVK.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
> @@ -23,6 +23,35 @@ &cpu_dai {
>  &i2c0 {
>         clock-frequency =3D <400000>;
>
> +       da9062: pmic@58 {
> +               compatible =3D "dlg,da9062";
> +               reg =3D <0x58>;
> +
> +               da9062_rtc: rtc {
> +                       compatible =3D "dlg,da9062-rtc";
> +               };
> +
> +               da9062_onkey: onkey {
> +                       compatible =3D "dlg,da9062-onkey";
> +                       status =3D "disabled";

Why is this disabled? This is connected to the power button.

> +               };
> +
> +               watchdog {
> +                       compatible =3D "dlg,da9062-watchdog";
> +                       status =3D "disabled";
> +               };
> +
> +               thermal {
> +                       compatible =3D "dlg,da9062-thermal";
> +                       status =3D "disabled";
> +               };
> +
> +               gpio {
> +                       compatible =3D "dlg,da9062-gpio";
> +                       status =3D "disabled";
> +               };

Why are these three disabled?
If they are truly unused, you can just drop the nodes instead.

> +       };
> +
>         versa3: clock-generator@68 {
>                 compatible =3D "renesas,5p35023";
>                 reg =3D <0x68>;

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

