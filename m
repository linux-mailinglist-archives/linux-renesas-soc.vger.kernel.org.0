Return-Path: <linux-renesas-soc+bounces-20680-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D85B2BB20
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 09:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36FDA3BBC65
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 07:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A67E226F443;
	Tue, 19 Aug 2025 07:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hD2syNpm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF6030FF30;
	Tue, 19 Aug 2025 07:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755589956; cv=none; b=jfu5luZJne1E4G7wEA1uYILQp9fuBRGExqZeYkcllX616whDxdSEfIHIrPugO6GuNhNM4weBbafTIv5Wi4IPlNa1MG3OwjnPu4orMKXecfQjQ26hhWrAZ5pjyfWYckee50+qBTXEtWbdu64T9paxcit2oNkN1ucdE6Q5dDeCstw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755589956; c=relaxed/simple;
	bh=DsfFtmt3wmuJ3j+r8NcfvrQdq0EFrTj3knyUIaHpdoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TcW9IIEG9lh65iLePXP+WbkTn8unSsyuOuLMns14gK+q+CelZvV4nXVQncHGtnwm6mLCBnihJrfmFXA/dtYf+vAP0bWRA8TSwG90bCKeIC5XaxuE6wZ05pGUS7scHEZ3CM54fVR9J6o5Svc5XafpC0wGOz6dFvufXTqE0taGSqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hD2syNpm; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b9e411c820so2662688f8f.1;
        Tue, 19 Aug 2025 00:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755589953; x=1756194753; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=exV62fJ4Rt1/zZkpZFJx2Rp5O65lafXRelUo82tE27s=;
        b=hD2syNpmGnSqmdmpyL7VhWwUzZoYxPhoM8fqF/tlJoCVCUfD5WQ2X7/sPOAk1sR7b2
         wYZQ6Aq6klMNi5Sx+QqpuPS7nlq9EPI8xTz6lYfkAXs/mFKkTNoZKAy4TkvwteWxW5CW
         /Dco2QNyW51SwhJyIxqJfkmoJ0s2EFnDNECpbAfUT7VP/BhjHK59ps6QLcAQ90Tb5/VE
         XCAxNLHuVsEQT1rJtGi/R2y7CBmHwjdDGcj/NgDw6/pSBogJubhHvjjT/SD0yEdReI/R
         WgbKXBzlk2uzI7pDmsKrhCaxlrf01dDrpTbh7D0X/Xs552Wm6MIwfmDJbe38lIeUtnCD
         EL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755589953; x=1756194753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=exV62fJ4Rt1/zZkpZFJx2Rp5O65lafXRelUo82tE27s=;
        b=Ew3mQCRVbFrad7RdBjxU50u2M2yjRkwwiTQe1OCZybtI755enxCdX/XfVrbAm6OEm/
         FBOt+3dy+A8sVNQKgi5yBXQ2v9d9RqYFB7qrtcTLf/mZl52pAFRsNivfeYq7GjoRBosI
         in6iyANZa6efRK4zWXZvPRcZiT4Ci1DP1SFErMQDtE1kD6se2QiAUXGMg3J8jb3VAJ3O
         ZFwjdp1yWUJ4msE2bp8yDMOSu6pnvvXEFfaQrzpVOXj/G19KOcQfrntvp/ZXRLxmAolw
         74r2SZkBIO5WYjdzY60D3FP8jSODbdby+ZMg41yiQde1Xyr1gx3WFVLZP2Em1hLsgOM7
         LXzw==
X-Forwarded-Encrypted: i=1; AJvYcCUGpVwg3bPkL5Aplj2lpbW3ipqNlotxEkNZTaKFT/qO+Z1zGD2IlAIcoz+swYzkGrmKM0D8EQs4jvgI@vger.kernel.org, AJvYcCUwSIZ6TTgiT75XSaEPpsIr5fR+ohTeyFKiXD/DB4l4qirIL3Ae7tZHf3zPpIC3fx0gqdOXUj1puao5yH+Yu5CvM4c=@vger.kernel.org, AJvYcCVNp2wgaSnXXtNtpmnoViwRi6g+hf/3e6u6tOMqKVUPCZPzK0t9VkL/56c+kke8TpJkvelfFpMcoiUfqVej@vger.kernel.org
X-Gm-Message-State: AOJu0YyQyeMdhZ7o7yDl2ofRfHeOYw7M7BgEbF/IKioCeaL1ZRIGvKAd
	hvavyngX1+FrOfxGeejYltQGxaLeJEvuC6E6OmrOlQrY8EIigtGKa9R7YxCd36EtTJJLCbNuIzR
	9VOUr593eYYzF/0iKFDSuH+lFPaW3UmU=
X-Gm-Gg: ASbGncsx0LjpuzO9trRJB6t+GO8XbqgAEaFF9UqltT0kD+pcxPIijg5EZl+rCFNn4yu
	qyz9EsDOBFRKsd5dAra5q8bWzuSI6Vm8Bygwk/pl7arJdVvzFfOBa5BBHQINASkn7+ul0bTNfjl
	I/AEbXkAzt6+4VOXpF4SFRiPeEX1fOHl7Ae/9lBJq2Fg9IdXkLxCGRttyfsAxGWbknROKJzRKmF
	M7T2QBt
X-Google-Smtp-Source: AGHT+IE1Q/HllAyYjBpXG0xtdDBFd6TYF/9JwtZbEk9GOnYIqZvZ66KlieA8QsAc2QV5FSqE2PXVWigdYaWLTnvwEZs=
X-Received: by 2002:a05:6000:250a:b0:3a4:d9fa:f1ed with SMTP id
 ffacd0b85a97d-3c0ea6ae52emr1162847f8f.13.1755589952838; Tue, 19 Aug 2025
 00:52:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250812200344.3253781-7-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXsQ7pne45+56f_nO0VA8LeUpZhxXFKPMqOKR4GSsdG4Q@mail.gmail.com>
In-Reply-To: <CAMuHMdXsQ7pne45+56f_nO0VA8LeUpZhxXFKPMqOKR4GSsdG4Q@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 19 Aug 2025 08:52:06 +0100
X-Gm-Features: Ac12FXwH-7ownFa6HdUwDbiGp09axXU1a6vPESMk_GzA_NAl1wbmmuK0NuYu5Ec
Message-ID: <CA+V-a8tT16aSiAdH6NUc7bfAb71_Bu3q-Ttp7Lw5A8z0y-3Avw@mail.gmail.com>
Subject: Re: [PATCH 06/13] arm64: dts: renesas: r9a09g087m44-rzn2h-evk: Add
 user LEDs
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Mon, Aug 18, 2025 at 3:15=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 12 Aug 2025 at 22:03, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add USER LED0-LED8, which are available on RZ/N2H EVK.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
> > @@ -7,10 +7,64 @@
> >
> >  /dts-v1/;
> >
> > +#include <dt-bindings/gpio/gpio.h>
> > +
> >  #include "r9a09g087m44.dtsi"
> >  #include "rzt2h-n2h-evk-common.dtsi"
> >
> >  / {
> >         model =3D "Renesas RZ/N2H EVK Board based on r9a09g087m44";
> >         compatible =3D "renesas,rzn2h-evk", "renesas,r9a09g087m44", "re=
nesas,r9a09g087";
> > +
> > +       leds {
> > +               compatible =3D "gpio-leds";
> > +
> > +               led3 {
> > +                       /* DSW18-7: ON, DSW18-8: OFF */
> > +                       gpios =3D <&pinctrl RZN2H_GPIO(31, 6) GPIO_ACTI=
VE_LOW>;
>
> Similar comments like for the RZ/T2H EVB, e.g.
>
>     led-3 {
>             /* DSW18-7: ON, DSW18-8: OFF */
>             gpios =3D <&pinctrl RZN2H_GPIO(31, 6) GPIO_ACTIVE_LOW>;
>             color =3D <LED_COLOR_ID_GREEN>;
>             function =3D LED_FUNCTION_DEBUG;
>             function-enumerator =3D <4>;
>     };
>
Agreed.

> > +               };
> > +
> > +               led4 {
> > +                       /* DSW18-9: ON, DSW18-10: OFF */
> > +                       gpios =3D <&pinctrl RZN2H_GPIO(18, 1) GPIO_ACTI=
VE_LOW>;
> > +               };
> > +
> > +               led5 {
> > +                       /* DSW18-1: ON, DSW18-2: OFF */
> > +                       gpios =3D <&pinctrl RZN2H_GPIO(22, 7) GPIO_ACTI=
VE_LOW>;
> > +               };
> > +
> > +               led6 {
> > +                       /* DSW18-3: ON, DSW18-4: OFF */
> > +                       gpios =3D <&pinctrl RZN2H_GPIO(23, 0) GPIO_ACTI=
VE_LOW>;
> > +               };
> > +
> > +               led7 {
> > +                       /*
> > +                        * DSW18-5: ON, DSW18-6: OFF
> > +                        * DSW19-3: ON, DSW19-4: OFF
>
> Shouldn't that be "DSW19-3: OFF, DSW19-4: ON"?
>
Agreed.

> > +                        */
> > +                       gpios =3D <&pinctrl RZN2H_GPIO(14, 3) GPIO_ACTI=
VE_LOW>;
> > +               };
> > +
> > +               led8 {
> > +                       /* DSW15-8: OFF, DSW15-9: OFF, DSW15-10: ON */
> > +                       gpios =3D <&pinctrl RZN2H_GPIO(14, 6) GPIO_ACTI=
VE_LOW>;
> > +               };
> > +
> > +               led9 {
> > +                       /* DSW15-5: OFF, DSW16-6: ON */
>
> s/DSW16/DSW15/
>
Agreed, (Ive also notified to update the user manual).


Cheers,
Prabhakar

