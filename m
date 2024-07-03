Return-Path: <linux-renesas-soc+bounces-7034-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1885E925771
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 11:53:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B54A81F26C48
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 09:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9340A1422D0;
	Wed,  3 Jul 2024 09:51:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FFE1422DD;
	Wed,  3 Jul 2024 09:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720000284; cv=none; b=LPfQhyJUaiTB2fRdNP1tX2Yg4GxTF1oKs/SuAZsPaAU8g2dCEq0ckBZmnEvWCGgCuptMiMl+6ReuztC59HCGvjBres5sAOnvEK2jplhIvgCXhzuVZwzYqWdjgk9jy2LZUd6q6XnUXDmeebtdQYrB8ljPjVhgA6eAGKIU5Frw98A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720000284; c=relaxed/simple;
	bh=Mtoyc3gGs0DgyITKAyTCUGaoBUNJO/Ez/v6YEPROUjw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=adFOzWjTBSrnvVB5YdMBzy20agS6nLH2JNzuH9HhUkeM+G9Do/EmQOzRiu8cImOBzakj9QGiljwsFODwGuFkYUmg2jbB+4Ub8K4xyvfgxXEgZbrTHs7+3pAuzv8h1WBYLV5ORF+WLGZ7jt7IKu3GCyJNbVEz5mcHn0v50l1dJQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-64b05fab14eso49371597b3.2;
        Wed, 03 Jul 2024 02:51:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000280; x=1720605080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ojKKZTj52h6Erb5/0PXhQtyS8JIAVZ4taUQH0cCCIKo=;
        b=V/Vyv9hEYbYfK07ks+44iM2GC2SI82QxuBepOITgLY5AO+yR9+biZyw0FG+nJR1Ir0
         GiHJxUXip0U2iFglT8MttdqdTx2OKaSuBJOikzFNNAo33WFRoX91m9+EHFhInWSffNZO
         Q5HVt+RzGawvbbwrWWMkqJULXLGnNU2EdgaJExH976BYkeBJIqtlCgH6bgfzMr4n4uMS
         G46oSq9lytgznXT0+5mx5fa42sTAjLSVE5xxNgYdSXYHklqPX1y5GX21JZB2ooVRwJQb
         a6n/BayLBe9Ev35hRIrp7O+2tXBX7IJ7/ljcXZon9Tq7jqBh798BvyJ8VrMLkddPxsYd
         9FaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWE+d1/Fcs2nl/pZ8Q35jvvl7HzE0CdmN/sXvZfQkh5VqKDqTameQNw231s7QCiK9Qi8uhbmISBc0RZ8Y6lpqNjnYm+/4//tE+mTu0wBTHghVXWAIkmE4Qc4nvFQU9JQeFRQFGcDvMuI2E0ivqx
X-Gm-Message-State: AOJu0YycHX4NL89YOKsbpM0M97DFDtvO/84WsUy4vsMWz7yxpZfPzwUn
	7kDVK40xWbwByNt/lUZ8C+TBjM/ZbP2WeKpIXwhFokFDxKrhwF4oLX8OXCIM
X-Google-Smtp-Source: AGHT+IFZaifBDjx4AHzqNtZG7ISqLR3VHSe/56fK583oPshQOH5Ee4YiFsZl7VNRBtSUPF/HQlg1PA==
X-Received: by 2002:a81:9256:0:b0:649:fa54:1f8c with SMTP id 00721157ae682-64c72d481bdmr102346827b3.48.1720000280646;
        Wed, 03 Jul 2024 02:51:20 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6511c6803f5sm2760807b3.95.2024.07.03.02.51.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 02:51:20 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-630640c1e14so51288017b3.1;
        Wed, 03 Jul 2024 02:51:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVIAh7hxTVwbBKLb68cqoKSKIgd2jRK8sOpGwG8fkEbT0s3Kq8nte0csKgYSIIYBCg12UV6IcXT7Y7RxQUE6qGjUFSg0eJ926boriaf9GXeGcckwNmCMwTnHJir/BvkG7AXTAnaxnxkCwt2gSHc
X-Received: by 2002:a81:a9c4:0:b0:63b:f6c1:6068 with SMTP id
 00721157ae682-64c7277c692mr114262177b3.32.1720000279894; Wed, 03 Jul 2024
 02:51:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240702180032.207275-1-biju.das.jz@bp.renesas.com>
 <20240702180032.207275-5-biju.das.jz@bp.renesas.com> <CAMuHMdUmvWPPBVqhtpu2dovwQg7YA7TVZBRnATUiY+1QRy0B1w@mail.gmail.com>
 <TY3PR01MB11346C77668002325FD916DBD86DD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346C77668002325FD916DBD86DD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Jul 2024 11:51:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUBV=qf11b2pb1rQnkYj6SrFJjm=iVpXu0GHky48Y0Pww@mail.gmail.com>
Message-ID: <CAMuHMdUBV=qf11b2pb1rQnkYj6SrFJjm=iVpXu0GHky48Y0Pww@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] arm64: dts: renesas: rz-smarc: Replace fixed
 regulator for USB VBUS
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Wed, Jul 3, 2024 at 10:56=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: Wednesday, July 3, 2024 9:36 AM
> > Subject: Re: [PATCH v5 4/4] arm64: dts: renesas: rz-smarc: Replace fixe=
d regulator for USB VBUS
> >
> > On Tue, Jul 2, 2024 at 8:01=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas=
.com> wrote:
> > > Replace the fixed regulator for USB VBUS and use the proper one that
> > > controls regulator based on VBUS detection.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > v4->v5:
> > >  * Updated commit description.
> >
> > Thanks for the update!
> >
> > > --- a/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
> > > @@ -54,14 +54,6 @@ codec_dai: simple-audio-card,codec {
> > >                 };
> > >         };
> > >
> > > -       usb0_vbus_otg: regulator-usb0-vbus-otg {
> > > -               compatible =3D "regulator-fixed";
> > > -
> > > -               regulator-name =3D "USB0_VBUS_OTG";
> > > -               regulator-min-microvolt =3D <5000000>;
> > > -               regulator-max-microvolt =3D <5000000>;
> > > -       };
> > > -
> > >         vccq_sdhi1: regulator-vccq-sdhi1 {
> > >                 compatible =3D "regulator-gpio";
> > >                 regulator-name =3D "SDHI1 VccQ"; @@ -139,6 +131,9 @@
> > > &ohci1 {
> > >
> > >  &phyrst {
> > >         status =3D "okay";
> > > +       usb0_vbus_otg: regulator-vbus {
> >
> > The label is not really needed, is it?
>
> The label is used in usb2_phy0 node.
>
> vbus-supply =3D <&usb0_vbus_otg>;

Oh right, that's a different node (too many USB-related nodes).
(my mind must have been mixing this up with the RZ/V2H SDHi regulator)

>
> >
> > > +               regulator-name =3D "vbus";
> > > +       };
> >
> > Also, as the regulator-vbus subnode is required, perhaps it should be m=
oved to the SoC-
> > specific .dtsi? Or do you keep it here for board-specific control of th=
e regulator name, i.e. to
> > avoid conflicts?
>
> Yes, just to avoid conflicts. Later I can move to individual SoC specific=
 dtsi's

OK. Good to go(ne)...


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

