Return-Path: <linux-renesas-soc+bounces-15968-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D00A89498
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 09:14:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 201DB7A6825
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 07:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A20002798F7;
	Tue, 15 Apr 2025 07:14:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A23E10F2;
	Tue, 15 Apr 2025 07:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744701248; cv=none; b=PRJnMiWnhx4oKAup39lOY5VLdyxNPqKbO0qigHxcUuZmB3cBc1YYICJ6xoOEpXU0wk9oMjhD3AfwgFcATNOxqgdCSXTp0AzX4ziJTYEbSHL7BYwttgSQpd7qKFz3EwgBZ1d6tWMYZ+JzehqbyGpHVtTTm9TO8o1KLCRiqQmG35M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744701248; c=relaxed/simple;
	bh=yqZO535hOjWyUa69Tyy+LhL1ppCMeinnoAGpX0+fObU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Znf3ZJqiBqz/SDxbrAyzPTR55r7/5AR5opBUucG3PZCUNhCugIC7IIOvebCHkjUktu6ryBFizMs6ntJqevwKHLtMQrOvLQvz8ekKWeawAmDpqH6ecUzb7veEzgrO+lOJ82ReRETXUoM+dCkCXk0qbftsrSGNajJ+DrAxECuGlwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-523de538206so1878519e0c.2;
        Tue, 15 Apr 2025 00:14:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744701244; x=1745306044;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rJsKm8hKbwBiRjXx6dJrPQjMQaIXfkEtgyrpuoOCN4A=;
        b=GrLaJDNX0Irkd9YVaxp97Sy/1FhxRfZkvHbA0kowzmdqk025tY/GrUbiF7Wt8D8JNA
         KRrImb9N8k7zTJSNCN7YFWcv7BfmmUXssCdY4OShV9MuIJTu6/ltrho56RwK0sXVKOAN
         /SrjDSF73TTFHzrPL36HWIMutK6HAkcDmVRjbb8z/zyWnrOhRk2xTRace98rWnIS/F3z
         GrZ+jIm6bgCT/xu99mPbaStXNAJSTiclQ+1aGqGwVMZJYxgS8h8uQNxlQNJmj2z+j10w
         2ijG9ekb44WxwvObYZvperLHwBvhXDZccDKJ99N+CTFg+LRlsywbikPp9lh40ApDuDh1
         VKKg==
X-Forwarded-Encrypted: i=1; AJvYcCVL1m+ybae2TBuANfGUMQdgwyVEIgkg6lMRBjYQdnah/ywaFnXnfzEyZpLD4y0qpgQSrOBDiKOnp1Yp@vger.kernel.org, AJvYcCVL3oO+Ycmv5RnPn+lPeA9h0JYr6axLep7zB8w7vUVGZ0d2dIuMzDYmdyXyOyAkxHoE+SM3mKCcaMoa+xMbSaSsiz4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxehWSlebl2IlXURN7pEjLGH85kEjgVZ2PoPNrPK6Oiv9oKDja
	CC1VVnkVsAJQytcHVGgRq5koqMUPfOEaOJ4pyvuYjD7AGXvdLS7Q3W+xn7zI
X-Gm-Gg: ASbGnctahcfQpuC8H2+WFwJQULphPsTOA5zKRcMIFZJN1xuASdZX/pWEM39aZ5gXOzN
	0GEsydGYdY1Lnsz5gs5dLUDJmuo379nKHkWDgTEM+lKBZ9Es5LfUggP59IOhFR8NUVwbFVpSqFs
	PCan6ZwrXtmlhfj27O/c4vjzSRNza2s9ZuGiiyBHYx4WUOdfkG340o0wCbA9VtTkFWvTj6Z7oqa
	jQ5b8MFBVooKpxvlEhySQSNKi01ZeNKgEm86Sjgm4Vk014FZtkDeAJ0yIl9KuhxHK6sVv6DFwZy
	uR/hXJnKy2z7JOUlEMatRCupMHWqNSyMspUqySbhExk080ag7Q40zoDx+q7oRvJJefbTnlaOQeE
	8V+o=
X-Google-Smtp-Source: AGHT+IEA66ejj1XtOX/7OO1qQjl4aCrwKtcYF0NqcZDHl74ubHcL6edzuCBlgjbLQswqrPwdfSVGdA==
X-Received: by 2002:a05:6122:da7:b0:526:483:95fd with SMTP id 71dfb90a1353d-527c3604e12mr8936354e0c.10.1744701244359;
        Tue, 15 Apr 2025 00:14:04 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-527abeac8cfsm2571817e0c.39.2025.04.15.00.14.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 00:14:03 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-86fab198f8eso2181448241.1;
        Tue, 15 Apr 2025 00:14:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUKLD3bbiX5tEjofCk+c/ttmJz2U+++2jg8bgiC110sxHxLyL+9THNCjIvLuXeYD3fZLiX1dx4dl9G5@vger.kernel.org, AJvYcCX1DC8GVZgzVKuUWszNSjGnsxtnP5kyyvquG7b3wqb5fgsAd1gkqo3KaHbYBhn5y5mUWAYKmbLOJBPAhlS3qVEILsU=@vger.kernel.org
X-Received: by 2002:a05:6122:3417:b0:528:bd71:8a8e with SMTP id
 71dfb90a1353d-528bd719200mr8077668e0c.5.1744701243473; Tue, 15 Apr 2025
 00:14:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320164121.193857-1-biju.das.jz@bp.renesas.com>
 <20250320164121.193857-3-biju.das.jz@bp.renesas.com> <CAMuHMdVVAqP30iK25tnOyy+pLBusKQn-agvSAw-Xuy9Vds1Nmg@mail.gmail.com>
 <TY3PR01MB11346958A838B887BB07FBC6786B32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB113460ED4CF3A66CBE22183E386B32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113460ED4CF3A66CBE22183E386B32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Apr 2025 09:13:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWCX84G=SRgMRB0jD3XE7viThmywtMX1+UXxSq20vWZrg@mail.gmail.com>
X-Gm-Features: ATxdqUFiTEcq3HMij60eWgqx3uQ_1UE2YiqGvL91_U7Rg5ZTAEZYfozsmAuZLU0
Message-ID: <CAMuHMdWCX84G=SRgMRB0jD3XE7viThmywtMX1+UXxSq20vWZrg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: r9a09g047e57-smarc: Enable CANFD
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 14 Apr 2025 at 17:53, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> > > -----Original Message-----
> > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > Sent: 14 April 2025 16:39
> > > Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: r9a09g047e57-smarc:
> > > Enable CANFD
> > >
> > > On Thu, 20 Mar 2025 at 17:41, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > Enable CANFD on the RZ/G3E SMARC EVK platform.
> > > >
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > ---
> > > > v1->v2:
> > > >  * Split the patch into two.
> > > >  * Enabling CANFD done in this patch and CAN Transceiver on next patch.
> > > >  * Defined the macros SW_LCD_EN and SW_PDM_EN  which routes signals to
> > > >    CAN0 and CAN1 based on SYS.5 and BOOT.6 switches.
> > >
> > > Thanks for the update!
> > >
> > > > --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> > > > +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> > > > @@ -8,6 +8,8 @@
> > > >  /dts-v1/;
> > > >
> > > >  /* Switch selection settings */
> > > > +#define SW_LCD_EN              0
> > > > +#define SW_PDM_EN              0
> > > >  #define SW_SD0_DEV_SEL         0
> > > >  #define SW_SDIO_M2E            0
> > > >
> > > > @@ -33,7 +35,36 @@ vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
> > > >         };
> > > >  };
> > > >
> > > > +&canfd {
> > > > +       pinctrl-0 = <&canfd_pins>;
> > > > +       pinctrl-names = "default";
> > > > +
> > > > +#if (!SW_PDM_EN)
> > > > +       channel1 {
> > > > +               status = "okay";
> > > > +       };
> > > > +#endif
> > > > +
> > > > +#if (!SW_LCD_EN)
> > > > +       channel4 {
> > > > +               status = "okay";
> > > > +       };
> > > > +#endif
> > > > +};
> > > > +
> > > >  &pinctrl {
> > > > +       canfd_pins: canfd {
> > > > +               can1_pins: can1 {
> > > > +                       pinmux = <RZG3E_PORT_PINMUX(L, 2, 3)>, /* RX */
> > > > +                                <RZG3E_PORT_PINMUX(L, 3, 3)>; /* TX */
> > > > +               };
> > > > +
> > > > +               can4_pins: can4 {
> > > > +                       pinmux = <RZG3E_PORT_PINMUX(5, 2, 3)>, /* RX */
> > > > +                                <RZG3E_PORT_PINMUX(5, 3, 3)>; /* TX */
> > > > +               };
> > > > +       };
> > > > +
> > > >         scif_pins: scif {
> > > >                 pins = "SCIF_TXD", "SCIF_RXD";
> > > >                 renesas,output-impedance = <1>; diff --git
> > > > a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
> > > > b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
> > > > index fd82df8adc1e..1d3a844174b3 100644
> > > > --- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
> > > > +++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
> > > > @@ -29,6 +29,10 @@ aliases {
> > > >         };
> > > >  };
> > > >
> > > > +&canfd {
> > > > +       status = "okay";
> > > > +};
> > >
> > > I am wondering why you split this in two patches?
> > > I believe CAN-FD does not work without adding the CAN transceivers,
> > > which is only done in the next patch?
> >
> > STB pin is active high. If you see the schematic GPIO8 and GPIO9 are controlled through a switch.
> >
> > By default, they are set to GPIO8_PMOD and GPIO9_PMOD, meaning STB pins are pulled Down.
> > So, with CAN transceiver driver still we can test CANFD.
>
> Typo with->without.

Thanks, the pull-downs on GPIO8_CAN0_STB and GPIO9_CAN1_STB will indeed
do the trick.
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

