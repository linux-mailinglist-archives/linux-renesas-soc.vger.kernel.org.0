Return-Path: <linux-renesas-soc+bounces-19304-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E9CAFB020
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 11:48:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 533F53A2C9B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 09:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7251B29008E;
	Mon,  7 Jul 2025 09:48:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF04F290DAC;
	Mon,  7 Jul 2025 09:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751881693; cv=none; b=fZxFVSQjwiAuUIWSuiC/ZXHp1ErmF9KA6ZvCc8/7LaTpo3jEwZUh4dPqqqV5c2iQCJueGkyEa53wwnyenadoj/Sfhc8NTJWvv2YPlzpB57QZI6pMgsj0RW+He9AbUo+DS1WwyNpUhHbSyYTX6GBtZgpzI7j3OlQk06hHD/FhcJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751881693; c=relaxed/simple;
	bh=xPqjeLGrN84XU+Uf4j/F7qDEi3SEs6EqUp1K+CP05No=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zhjt7+CCW6WUx4BOp6+3fctqj4DnvgpVTYiAqKXF+rCXY8rs06NCSTi25wcAWrW6R1hJCHSfPcA7zENUZzisY1cj6Sd12CoVnm9WxSSchQE34DfbKL/8SeQEHPxP6f27hJBbxUHhnqXK/2qlmdMJzxBYgNR4dHMbkgx3bXVuOTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-87f74a28a86so2211054241.2;
        Mon, 07 Jul 2025 02:48:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751881689; x=1752486489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5+0wSppynSOvi12ZXXCldghKFMbBMT5s4dqf8/U7JI=;
        b=LJNGL0rtv0Q86ZoCnL0i7JA5/Oz1Ihto0TeCk0e+yTsT0LDs6pspylH+m7bIj0nfQk
         rIW8urr9KFKKh6P3vs/cDCQFof4WpyI4DcxDFeItwoEtCJ0IUoq5I9WuXCWp7KsY7lO0
         tDUe6+tTpyR+w6Z5P1ax0721MCwnl7asykWa2oX3El3N87aidvbkv40kbAMn55V7kiDG
         JJCrvdzBUxLg31WM2Ez+bu9YCgV+A/qGsC2+d9IK6xsE+2nHMK/mTytbtS3YdFsybBpG
         XCP9e5xoEJOKolgqGg8IGrJQn1eDMadIqdtsvrRk6+aLiedwnDRgnRYETIV184z9JTFe
         AYYw==
X-Forwarded-Encrypted: i=1; AJvYcCVJqmqKDdIv73YhTtXe2/KOuTNfkkZM5xMh3AQEG9udWWcGD6Qkho8xQUml25y7zaw+otNEe+E4FST1jZ4Q@vger.kernel.org, AJvYcCVjjKnKPO5+ViBuVcCto4yTleATwMDpEB6mpnM7LOt4gehEqZ5IxSdQQtbt0+CrOd1rWiVYBy9gRBh0@vger.kernel.org, AJvYcCWrM3eyF6GRxYw3ospOcCkPlkwMoRs4omrlEw13dxr5anukh7Hsndw6IRVtRq2mKP+zbxZtECO7nQAU9bWXz/zU/cM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Sn33MyNd83zI4ai9oiO8Id8+mvFdJwBHmNLEpXiZ25aQJJde
	yFh4Iwn4e1b6JyzsxAN2r+ArurEyqNf6TUNdG4f7G8X8rRrsdQoy0490U9I/zXAV
X-Gm-Gg: ASbGnct3H7pN6+K23K6Ifz13KK1z2Xe7ZcVWaaZXle3h0Huo83eU5UoecatJwRSLGvd
	QlA4lIiLRWhcBkCBYh3wLjoSneQwp84BOKgtL5koyO6Rukxz3ttBAzwxwpMLpU2B0rSeSB5n064
	ZQY/Iilwt9TSSxM+4mLKY3j05DwuxthHbHu75Nxzn7ok7y5OlC4bjIoGYHyH8ZKWCjKTE2dFqBa
	sNPuY6gs5NQxgfRorzb0DRpFjT+j4iVVUeP+I6Bpb3f36nRIBPPpBbcsEfag6RocO83CpMFSh++
	m7UGgIAM2usJrdc7eDE+RsV7+o8xSf0rUIFXAf1SXeah06Nu7HY3ehssfyL7bjbv38oxWFaQmgt
	VGiIFqj4gBJtKdx1IgjGsFM1B
X-Google-Smtp-Source: AGHT+IHz7I5x8Vn0GSCUXD2D/tHeBm/akguzfwh58wk5Yu3k+WwHNqs/JwD5ar//86dk0mQZvkn4cQ==
X-Received: by 2002:a05:6102:4bc1:b0:4e5:9380:9c20 with SMTP id ada2fe7eead31-4f3059d1057mr4537370137.2.1751881689232;
        Mon, 07 Jul 2025 02:48:09 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4f2ea73b275sm1129437137.28.2025.07.07.02.48.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 02:48:08 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-87f04817bf6so2373410241.0;
        Mon, 07 Jul 2025 02:48:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUjSeG4DR7o6XBfO1ND2jkLlOv3gJFoO0oIREnBn0254WSbpF3nU+cjOUN8TgEIbRod6cpVyo2CWAVFLFUmRlTqZqE=@vger.kernel.org, AJvYcCW1Eq8AFcVFGQKNIWnYntL55h4XwPnQKHCDhQZ1FlbjohypSR1B6MOl11H8ozfUG5BHYf+fALAPzq6v@vger.kernel.org, AJvYcCXqkS2qGE2+4kJ1wgBduZKmysXY04ioo7Lhmwux3OywhVBSLcuSUOs6+NnXxjEY4lXrotI3ay889KTwLQrr@vger.kernel.org
X-Received: by 2002:a05:6102:5813:b0:4e7:dbd2:4605 with SMTP id
 ada2fe7eead31-4f305bbfb6bmr4049680137.24.1751881688643; Mon, 07 Jul 2025
 02:48:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625153042.159690-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250625153042.159690-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVvxebkm9A4g9hADww=9zREXJqyW3eQ6tFVwVJvkUkEOw@mail.gmail.com>
 <CA+V-a8s9r9U91CqUdC5zDxZGuAA51upduJ1epgmMdKPeYPJQxQ@mail.gmail.com> <CA+V-a8uW00iMUFfSczBsFsC3JLSK8SbufMhYGd_1XgrZ29C1Cg@mail.gmail.com>
In-Reply-To: <CA+V-a8uW00iMUFfSczBsFsC3JLSK8SbufMhYGd_1XgrZ29C1Cg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Jul 2025 11:47:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX1zijwTD1SvY6XiURuiudBwssGGLD1PVGgDTVtqedCLw@mail.gmail.com>
X-Gm-Features: Ac12FXwVostGJK4bmk6-YLvJ5Eo2LTSPTjjWfX8r5k5Seon-rDbubPXDfeaBzR8
Message-ID: <CAMuHMdX1zijwTD1SvY6XiURuiudBwssGGLD1PVGgDTVtqedCLw@mail.gmail.com>
Subject: Re: [PATCH 3/6] arm64: dts: renesas: r9a09g077: Add SDHI nodes
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

On Fri, 4 Jul 2025 at 19:13, Lad, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> On Fri, Jul 4, 2025 at 12:52=E2=80=AFAM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Thu, Jul 3, 2025 at 10:56=E2=80=AFAM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Wed, 25 Jun 2025 at 17:31, Prabhakar <prabhakar.csengg@gmail.com> =
wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Add SDHI0-SDHI1 nodes to RZ/T2H ("R9A09G077") SoC DTSI.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> > > > +++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> > > > @@ -155,6 +155,46 @@ gic: interrupt-controller@83000000 {
> > > >                         interrupt-controller;
> > > >                         interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_LO=
W>;
> > > >                 };
> > > > +
> > > > +               sdhi0: mmc@92080000  {
> > > > +                       compatible =3D "renesas,sdhi-r9a09g077",
> > > > +                                    "renesas,sdhi-r9a09g057";
> > > > +                       reg =3D <0x0 0x92080000 0 0x10000>;
> > > > +                       interrupts =3D <GIC_SPI 782 IRQ_TYPE_LEVEL_=
HIGH>,
> > > > +                                    <GIC_SPI 783 IRQ_TYPE_LEVEL_HI=
GH>;
> > > > +                       clocks =3D <&cpg CPG_MOD 1212>,
> > >
> > > 1112?
> > >
> > Agreed (and below).
> >
> Sorry, it is indeed 1212/1213 as the bits belong to MSTPCRM register.

Oops, you're right. Sorry for the noise.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

