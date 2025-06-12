Return-Path: <linux-renesas-soc+bounces-18190-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C42AD72C7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 15:57:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7653218803FA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 13:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8275224337C;
	Thu, 12 Jun 2025 13:51:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E7C18FC91;
	Thu, 12 Jun 2025 13:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749736310; cv=none; b=hiQO59GOY5FbhM02PuA70MkizKIK0d5Ls2Ze2uwbkXaooxvAsBuoRkUxxqLqEZgFpJYzumFsYO8qhZZwagkkYTK1bhLTCxN6Oy28/6yo4CXoOrGUihi22+8D4eCyhvN5ZyhCuq/9kqSy/J7KXa84cN4QuTGPRdZeUE44jKPxR6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749736310; c=relaxed/simple;
	bh=Kyg7eb1AAplC4+EEmiu7P/7vwpj2UgJh+0WoDayuqFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kDLCKcpW8/ILO853GEOH1eBeqZk17k+P4FqijLzko1RD6R8Q7T6loUkuqm9RlGmdTQ//6sYy7C/q7jGWULRvSyl4g2ms28mEeubU0ocZdNcPe88llxuGRwhah0UX/DRnzsujdryWs5UiXt0jhCGv2pFd011C3mIaNfs76zwTBns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4e7b7b09887so596817137.1;
        Thu, 12 Jun 2025 06:51:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749736307; x=1750341107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sU+E14nHPWkzbgTxZjHrHqv/1thIS6lIF8oB6Qh0++4=;
        b=s5D1PEiq/LuH/pqAnMS+6DGYjYo1qcy6ddzeDDIp2CX6mQlPOqSggCc8AnQamJXSrg
         FCwka4MyZySqneK+6NgCdLg7uKm/GLR4Rb2k7iEiHhUH852cqIa1LqyeTlZxLzHwxmVV
         SbhxnlG3obthUDKJCqLtlgh9Pjuf9/27SbWHrBYfx8kSaradQ1ohI7QtXtVp7sNZI6WA
         Sqxc6JU9gFuAOHFbGN9YkeZeBILiwOELqXTrh1l2c8KjixHEC/gYPZbcjDYp4sBxsxBO
         7EsdK1/4GGVSh8fjgikKtSzCktQk8996rt56qWRN27Xzrr5yuKNQrXTXWnc4K0gBMFT/
         DfPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJHTW15742UbZJJEBi44n9ADVsAMjWUw4+ZZLB2peMgd6xQP30S4m5WbDAidbOCsSb2gHHviBxbVBd@vger.kernel.org, AJvYcCVHP1VHuIQlzHGZSsQGZkg1zPOU06voe3p0NGVCb8KqKsA6cBF0P7Huw8+s9CUGcUzaFlMOtnhAUeJrF7Uj@vger.kernel.org, AJvYcCWQeqI1R76kr8Igmhj7w/dnCgRDs1drIyWhaAJLFRblQN0EmW0guKrq98flZkrwkH97m1kmC0mTOYREK8dQSPdsODs=@vger.kernel.org
X-Gm-Message-State: AOJu0YywZdrN3V9St0B9rFzkEGHSEpJZYqPYGnpgBQ9Bt0vyZhlQLPbU
	xxJTzipE1XhuR8axPqj7tg9Rdj6hn/vq2Qi0+1/tKGn83aOTw5GekKQxgCUgzhEt
X-Gm-Gg: ASbGncu0+zMSGHaOWPeFDjq9Dw2M4MRl4sKMkW2bAubBanWgH75vpkdfbNbdoCTMrA+
	kJlQQnHWZJ2ImmYGpgj6w1ST3KuDMTE/UGeQ2qgaAxI7hsxxuWl5YTC7v9XrPgI7AmUB8JZSzS/
	vDDer4+vs3H4KCgvW0yTBLAQUPMn5QbfTiEhsQMYqcKnbYVx39SPkB2ib8sSAI8TMmBZwBaqSTG
	0F1GhCu/NHWV03TNIbfSx4zCSAUnjkN73AylaqzGa/lSrrzPzbYY5xNUeIXcYbOn1mkS73eDvZu
	JIBD77dC4mTbY9Zo5QmDjxbriXxkTyWco7Xogo/YoHUC15c3CpwAVDBRuBraffYDmwnV0xxSeXa
	izo1Ln5vahtM35wq+SvrA+5sJ
X-Google-Smtp-Source: AGHT+IFbb1t4T7FuJxbzRzr5OMuz1N/p+RH8WPh5kWXq1AugQkPRBB57PrwIAN1c0vJj10z37Pgt0A==
X-Received: by 2002:a05:6102:8028:b0:4e6:f86b:143c with SMTP id ada2fe7eead31-4e7ce7fd855mr2685077137.1.1749736306986;
        Thu, 12 Jun 2025 06:51:46 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e7d095851esm232106137.20.2025.06.12.06.51.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 06:51:46 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4e773c50385so567969137.0;
        Thu, 12 Jun 2025 06:51:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHOMcxC1eQNDW9ijh2LlciEopvd2JxA9FU/9ak7tW1PM/PD2FxIAG0UrFiTQSuV4Qn+l1cOaUvNkUS/X3Vimr8IM0=@vger.kernel.org, AJvYcCWFxeGyN8I7QCrABzu1ualR6zPP2+uRMq4e6uv3VwG1S7Zu4En23uqLoGy9caqQtbC1VUslZz5xrgHr@vger.kernel.org, AJvYcCXWPuggxZMsSoMiEsWUe/Dh0xlbNCvquILGmCvOZG9vT5WoCJvrTf0raMfJ7MBqMQa1EjQeruZOCMCCwHUj@vger.kernel.org
X-Received: by 2002:a05:6102:2909:b0:4e6:df73:f147 with SMTP id
 ada2fe7eead31-4e7ce872d4fmr2881027137.11.1749736306438; Thu, 12 Jun 2025
 06:51:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528140453.181851-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250528140453.181851-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVa4axB+aKhH18KxK4DVafeix6wn407PEhMxV_6xfpraA@mail.gmail.com> <CA+V-a8stpis6RuFZ8X+g=nnQhQQNJN8X8kpma6kf2Hmi+3hf4w@mail.gmail.com>
In-Reply-To: <CA+V-a8stpis6RuFZ8X+g=nnQhQQNJN8X8kpma6kf2Hmi+3hf4w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jun 2025 15:51:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVEA=agcGwLRvXRX9LCz48YaYT45HL2-nVN10KSjLs3Hw@mail.gmail.com>
X-Gm-Features: AX0GCFtajsvn3HK0qkSch9g_tEIAAi_atdi1vGvi0U17ZoPSqNBB7DzSH5TlpbM
Message-ID: <CAMuHMdVEA=agcGwLRvXRX9LCz48YaYT45HL2-nVN10KSjLs3Hw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable
 USB2.0 support
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Thu, 12 Jun 2025 at 15:25, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Thu, Jun 12, 2025 at 1:49=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Wed, 28 May 2025 at 16:05, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Enable USB2.0 support on the RZ/V2N EVK board, CN2 connector on the E=
VK
> > > supports host/function operation.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > Thanks for your patch!
> >
> > > --- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
> > > +++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
> > > @@ -302,6 +317,16 @@ sd1-dat-cmd {
> > >                         slew-rate =3D <0>;
> > >                 };
> > >         };
> > > +
> > > +       usb20_pins: usb20 {
> > > +               ovc {
> > > +                       pinmux =3D  <RZV2N_PORT_PINMUX(9, 6, 14)>; /*=
 OVC */
> >
> > Any specific reason why OVC needs "bias-pull-up" on RZ/V2H EVK, but
> > not on RZ/V2N EVK?
> >
> On the RZ/V2N EVK for the USB20_OVRCUR pin we have R13110K0603 pullup
> resistor, this was missing on the earlier version of the RZ/V2H EVK
> due to which we saw false OC condition (as seen below). Said that the

Thanks, I missed following one branch on the schematics :-(

> actual EVKs for RZ/V2H for which support is being added do have this
> pullup resistor. After testing I will post a patch to drop the
> `bias-pull-up` property from the RZ/V2H DTS (thanks for reminding me
> :-)).

Great, thanks!

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

