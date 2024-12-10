Return-Path: <linux-renesas-soc+bounces-11170-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 296379EB687
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 17:34:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B5EB18867D7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 16:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 460652080C0;
	Tue, 10 Dec 2024 16:34:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074821BDABE;
	Tue, 10 Dec 2024 16:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733848479; cv=none; b=of+24aWYusTShIW34oSk+5OyrFcLmuqoiAXN802wJhfMl/ne3qh4vbefsMYyyDU78zVZANZexmYwavIa6o6W/0tPj/g0JZHkFPvaMITlVCJrSh9QaLv+2axCv3yUWgLjC25AccDH19BbUNp7LroPdSgZUJc9Tz9X42EHZ9Qa26M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733848479; c=relaxed/simple;
	bh=8oUMzl2noqWq2bIVEK+AvaPrz95JB6raIVV1Ny91o9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HsAQStkwE8o3vo8dpcuLokV0B2PjwXTODntOeVHFtM2sgWaI/g9Mdcxi8T3yFh4KzB4bPq5Nmwud1ha1az2yV4DhEbYqwmgE4TjpZZ8nIkkwrfmf6bzyPMTPd6/yhoHKIkHcyse1Id0G42PJZ6bxrqgUoUcm+lQKYHqb0QOXJPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6d89a727a19so59526026d6.0;
        Tue, 10 Dec 2024 08:34:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733848475; x=1734453275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2e3X6khm/ThbDpkGIJYPkvaVuIBT8ySpR+1a5iCbjI=;
        b=MYVB0K1ssYffAtyXHvRgxT/CvMWW6zsi2C9OoWvMZ9bm5tPrdfMzp+IagEEdeXJJZc
         kgAk59fgP/Pl12m2lha+YoJjQZdNPT9y8A3iPCRPethdtEJPVKKkSOpB3m4oPvt9i0Lm
         JAaaNmRqCS9kdn7mHwyUmKksD2MulSrkXdkpCANox2gZz10CTV4rddNr4AcAtx++QTFh
         T3UShPJr2+3mAL1xFkJ+KBTMDxyFubE3n0i9Zgbr/S2bGsfcQOL0JoKDdGnUzLKf5eI9
         Ry4Z5RJDvjL4rIZooIB6fV9fgZUy1EyoI7CiyCnv7kKh3SwV/J+l+Kkqxd6zugfj9dnE
         1KLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDBXrbAJpZhk10YKQPn1SMGOAdTR/yyORxWwjZAw4JMhvHWhTOoBok1JZh71fiEENxAoftzM37qZcc@vger.kernel.org, AJvYcCVjmKIXnqUboW5nbwjFuVUGp5KFYZn5HTlRTDWeakTe0qU8HHuXiqTCYs4vJpkDb1IFmqqwsuJ7DdC/@vger.kernel.org, AJvYcCWA9nWNYjRcGRhWMFwz/FvXXE/50O7gZ7DbbApGcsjjL9CRe2+oiK3SeQ88S6PLoL9rpOHllA3jHmQPF/0LOXgOVDM=@vger.kernel.org, AJvYcCWxx9lRwLzYV2VEwAkS4hJibIJ1v67IcgHtTz4jGdMS0jOkwk7/xVf7NDam9bye7B1BziDzvwQg1tOBZsiV@vger.kernel.org
X-Gm-Message-State: AOJu0YzqZa7LUBFdxaFTAgR0l4IhkjMlaa3XJw3MHZKfWRwstlIgkzyM
	PqqHeXtc+0OD0dce7z51lVksGF/EUrzYxbe3dLiwk6KXgWxMYm5sCg2XVPwf
X-Gm-Gg: ASbGncuVpmHEbo8qIMrOkUt1LGKCDN9hgCUOPBw6W2FsHxmk+13L2cfTc9yG9/LYW+x
	hRnlV8VixsEkiXytvTtDGuwbpNYIXmP5B/Q3z9pESiq1dUgduWbAzhzZ25/sdUNvpXn5vAeQ+W3
	cWFu/DZSb6l7JbXprDI71mKirsaUmU5C7jUG8HDdy2uSS1N3V9tkkhXb2+WMM9YRtpLm2o3XlYS
	wGBf0HlzZ0mxCazyvr6gdbFguooiKz4inNsBAhEyI5tMUSwQeGytmtutJU23QNnQe8aCQDQ+RFf
	WexpZnq4vzXA6Xn/5Ydj
X-Google-Smtp-Source: AGHT+IG1Ue+1HIJRSBFHga3/ZRErZkvm2zSIAIxJ5GBXJiPGAkWaj7g2IqJd+OnPvJ78l5QnD+I1TA==
X-Received: by 2002:a05:6214:300c:b0:6d8:8f81:e2ec with SMTP id 6a1803df08f44-6d9212c7cdamr60484086d6.12.1733848475254;
        Tue, 10 Dec 2024 08:34:35 -0800 (PST)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com. [209.85.222.175])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8da6b7854sm61384336d6.68.2024.12.10.08.34.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 08:34:35 -0800 (PST)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7b6c6fb409eso250171685a.1;
        Tue, 10 Dec 2024 08:34:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUkfsFjERpgXEMIouHRPAYmSVyhROWvKoF9jRlUyu/bm+hQ21VPEVsevbPSoPgfQTWenq/AscCmJoAw@vger.kernel.org, AJvYcCV0SXGLa4iK5Ab+8QRcuRPcszYaKG09W/H5AH7y7jvSgG1y5Q/ebeqjQNopksv/FdTHMOZOM21jMBt5YOl1@vger.kernel.org, AJvYcCV7R1nAoAJSCdXR4dgMXGzb2aJfO00HSfzaNSN0uBO4NJ/VqJLE7jvWErRbG5IqkSJqSvk3Wt+Pt51r@vger.kernel.org, AJvYcCXFLLtc8qeTIB6bpkudKUC3WppjqAjCd8xXyS6NWlc3p3qLvqhfAZ0Hah4z071wmb4+iMJ6PV1CfT69ruGNu4fPd1M=@vger.kernel.org
X-Received: by 2002:a05:620a:1a85:b0:7b6:cef9:4f10 with SMTP id
 af79cd13be357-7b6de6bf952mr762749985a.3.1733848474648; Tue, 10 Dec 2024
 08:34:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com> <20241206-rcar-gh-dsi-v3-10-d74c2166fa15@ideasonboard.com>
In-Reply-To: <20241206-rcar-gh-dsi-v3-10-d74c2166fa15@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Dec 2024 17:34:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXMt74okJjqinLwrVmf5hZFm7YQkE5s3u2F9AOTWk+zXQ@mail.gmail.com>
Message-ID: <CAMuHMdXMt74okJjqinLwrVmf5hZFm7YQkE5s3u2F9AOTWk+zXQ@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] arm64: dts: renesas: gray-hawk-single: Add
 DisplayPort support
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	LUU HOAI <hoai.luu.ub@renesas.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Sam Ravnborg <sam@ravnborg.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-clk@vger.kernel.org, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tomi,

On Fri, Dec 6, 2024 at 10:33=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>
> Add support for the mini DP output on the Gray Hawk board.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> @@ -269,6 +314,51 @@ eeprom@53 {
>         };
>  };
>
> +&i2c1 {
> +       pinctrl-0 =3D <&i2c1_pins>;
> +       pinctrl-names =3D "default";
> +
> +       status =3D "okay";
> +       clock-frequency =3D <400000>;
> +
> +       bridge@2c {

Missing:

        pinctrl-0 =3D <&irq0_pins>;
        pinctrl-names =3D "default";

> +               compatible =3D "ti,sn65dsi86";
> +               reg =3D <0x2c>;
> +
> +               clocks =3D <&sn65dsi86_refclk>;
> +               clock-names =3D "refclk";
> +
> +               interrupt-parent =3D <&intc_ex>;
> +               interrupts =3D <0 IRQ_TYPE_LEVEL_HIGH>;

interrupts-extended =3D ...

> +
> +               enable-gpios =3D <&gpio1 26 GPIO_ACTIVE_HIGH>;
> +
> +               vccio-supply =3D <&reg_1p8v>;
> +               vpll-supply =3D <&reg_1p8v>;
> +               vcca-supply =3D <&reg_1p2v>;
> +               vcc-supply =3D <&reg_1p2v>;
> +
> +               ports {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       port@0 {
> +                               reg =3D <0>;
> +                               sn65dsi86_in0: endpoint {
> +                                       remote-endpoint =3D <&dsi0_out>;
> +                               };
> +                       };
> +
> +                       port@1 {
> +                               reg =3D <1>;
> +                               sn65dsi86_out0: endpoint {
> +                                       remote-endpoint =3D <&mini_dp_con=
_in>;
> +                               };
> +                       };
> +               };
> +       };
> +};
> +
>  &i2c3 {
>         pinctrl-0 =3D <&i2c3_pins>;
>         pinctrl-names =3D "default";
> @@ -361,6 +451,11 @@ i2c0_pins: i2c0 {
>                 function =3D "i2c0";
>         };
>
> +       i2c1_pins: i2c1 {
> +               groups =3D "i2c1";
> +               function =3D "i2c1";
> +       };
> +
>         i2c3_pins: i2c3 {
>                 groups =3D "i2c3";
>                 function =3D "i2c3";

Missing:

        irq0_pins: irq0 {
                groups =3D "intc_ex_irq0_a";
                function =3D "intc_ex";
        };

I'll fix that up while applying.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.14.

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

