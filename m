Return-Path: <linux-renesas-soc+bounces-20625-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5325AB2A69A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 15:45:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E693B61014
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 13:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6345321F36;
	Mon, 18 Aug 2025 13:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZCVaIk9j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC68B321F2D;
	Mon, 18 Aug 2025 13:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755524414; cv=none; b=jF0Nj/YaTQq95iarmkqLlxeMTh1paUVMVfuw/rUmHZn6WfJubBRvk4yl/JRikZrfblS7Z7pAjKEr3SR45lgo8QOF8LaJuV/3EOd57wy58eZ6oKAeP1NSIhNIOFKJls8Z64//XrCQcOtdthWjF3KQe2VKp8EI9LP3gmDU4x7k+9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755524414; c=relaxed/simple;
	bh=zv7tfdjyys1Wm7kBZysvL83vJ929ECTzF5BsVuza6ro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z6LtqEzjMvG5jFNFqUBB9n1ZHIvL8xz4E6KJRQMLIoY4sZrk9nX5D2TegyxKaBQvw9eQTa5fECD91JNNR2jZtgcnBY6N25g1wr1aCZHiydx5QehIM9iIjr0cV2eQzEgxJUICaBhrNqmaEAdw48IkjxPJALgtzLnAzR6mMmLK1mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZCVaIk9j; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45a1b0becf5so21468645e9.2;
        Mon, 18 Aug 2025 06:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755524411; x=1756129211; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dvqYhg6fD41LwbmHn6SL5UIdpJHv2h/Ycj5wTox7RVM=;
        b=ZCVaIk9j11r+zlB4qrpIwwM7typMBS6XkWbZj89cEBzRIqLjMKVO2YcBsaMuri2shC
         iG0Kyoxl2OzHa4ZKtOG+myr9k6Rqm+dpeALQlvD3zKPoO5ygxVGpTB/E9g5sXkAiAXcI
         fxcNrhb3ecQnoVntlcm/cRhAu5pNYRTBm7CKB29F3qVoBFGwZNVH11A23z+dbrKRfWTj
         89xhyiqoQrVcjOomXxISfVnAvbCvHrs636t5rv/SlO+xMacEnGXhUELCen2XIK9Az/jw
         F1tMJdb1S9A4Wq+UBEFmET17Wsc4ek702xcdX6Rp/Bpq66rRvPpGUwWV4EA0R3MjdIo8
         Di+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755524411; x=1756129211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dvqYhg6fD41LwbmHn6SL5UIdpJHv2h/Ycj5wTox7RVM=;
        b=BAE5i3P73kNtGorG//kyuKsYDePKI5A6vg2UTRnFXec0NlCRKz9FXOn0i9+OqLNAB0
         995pgqnJcva1j47IA1kNN6tPHmZoXFlAamaRFwX7lVi0B9pjA6Di8s8HyjRRm1PUB65+
         x7S1IEnEBF23BivLf5KvFIOw6AFxy6cJLfow0l6EN40ISZ1E+Bv0VgvZxMnJE72X/TYM
         KyEKob8eGKklPknOCdlv0/3JD0hRhAtESvv9GlgsvnZfcaAUpr5poPpD239v8tpY3Zs5
         BwjNFe68t3qv8VH7U+NzSn+hXwa7Z3fdYB6c25woExe15dZEjtBM2zQSQGNsWghO43vl
         YeBA==
X-Forwarded-Encrypted: i=1; AJvYcCU3YAgjmR53rZL1DKuAtg45naO/ewlvm9cZgIHTm4Df50nUaC9TDDHS/IOoMjnMn/gbsiGDYxlB6b/K@vger.kernel.org, AJvYcCVlYMzzVdm7nshYu0eCNr8fmL1Y/rkUV3gSsy62tDXr4BWgR1MjYcKrO2UxalFWTeqLiC1KETJHJBh8S/aZFImVdH4=@vger.kernel.org, AJvYcCX4V6qfy2DzRSYK0De3xlHuDfCAjlxrQRKjNSh56mUjLBXSlXHKvPC/F3Msj3oLXOBzMr8g9bJMymxpLKSE@vger.kernel.org
X-Gm-Message-State: AOJu0YxUa2GA95ap0SWDGaR+03qLk7DCB1ObjRl0MBx5ucnLrnla4OuO
	fHfSWGovyQ8VAaW9+MNWJRIzu/CPsgLb0+59CYXy6aEcA8jCys4Bk2nVbNJ5VMt7zcktvmPyO1f
	O0KZnFublLVCE7v4cEMVDRlL2FcIlk7c=
X-Gm-Gg: ASbGncs9AxJ+PYhvzuagHwKf+qOxxaQ0s9ZDBfteEmBLCEnN73r/oqlFL9i9j0VPs2U
	sgU5Q4IsCQJGWemxevpqBGXx6vNAuLk+rqzlJtPQcweE1Byc+dSP/yplz0dO9IiejnCnnCeZ37F
	ODhZtNI92SgTO46ePr2VhvmpF4GJ1qZ9zrpRRLG8jJF49HkNqe3CPe6vWmMizlYfiogNHIGa2Fy
	FiG+urbcVvqtbhabyA=
X-Google-Smtp-Source: AGHT+IG7w1ezoBCI5KSeOkqI+wRCLf3YveovbqD2yzsWRGhi16yuX7+73BHDTOM0BpTFdgAFqxF6mKEJIzE8PiQemkU=
X-Received: by 2002:a05:600c:1d0e:b0:459:d5d1:d602 with SMTP id
 5b1f17b1804b1-45a2839f963mr69385055e9.3.1755524410711; Mon, 18 Aug 2025
 06:40:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250812200344.3253781-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVi26AXwQJDtxSp8hSsmZ1Lx4_GYFsbtmq_gxJyddkqTg@mail.gmail.com>
In-Reply-To: <CAMuHMdVi26AXwQJDtxSp8hSsmZ1Lx4_GYFsbtmq_gxJyddkqTg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 18 Aug 2025 14:39:44 +0100
X-Gm-Features: Ac12FXzHKZHweV-j9ZFc0MCM9sBqgIpk1bwF4UkrD_Mi6Syu5Z_mHcCV0d9cShY
Message-ID: <CA+V-a8vsQv4jJ4x1rVkeyfg28_RvVtAbnbHtm+RTTMHT_s-YzQ@mail.gmail.com>
Subject: Re: [PATCH 05/13] arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Add
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

On Mon, Aug 18, 2025 at 2:15=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> Thanks for your patch!
>
> On Tue, 12 Aug 2025 at 22:03, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add USER LED0-LED8, which are available on RZ/T2H EVK.
>
> According to the schematics, only the first four are user LEDs?
>
As per [0] user manual Table 7-4, LEDs4-8 can be used as USER LEDs or
for Ethercat Slave. Since ESC is not enabled I haven't added any
#ifdefs.

[0] https://www.renesas.com/en/document/mat/rzt2h-evaluation-board-kit-user=
s-manual?r=3D25567073

> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> > --- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> > @@ -7,10 +7,61 @@
> >
> >  /dts-v1/;
> >
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h>
> > +
> >  #include "r9a09g077m44.dtsi"
> >  #include "rzt2h-n2h-evk-common.dtsi"
> >
> >  / {
> >         model =3D "Renesas RZ/T2H EVK Board based on r9a09g077m44";
> >         compatible =3D "renesas,rzt2h-evk", "renesas,r9a09g077m44", "re=
nesas,r9a09g077";
> > +
> > +       leds {
> > +               compatible =3D "gpio-leds";
> > +
> > +               led0 {
>
> led-0
>
Ok.
> Cfr. Documentation/devicetree/bindings/leds/leds-gpio.yaml:
>
Thanks for the pointer.

>     # The first form is preferred, but fall back to just 'led' anywhere i=
n the
>     # node name to at least catch some child nodes.
>     "(^led-[0-9a-f]$|led)":
>
> > +                       /* SW8-9: ON, SW8-10: OFF */
> > +                       gpios =3D <&pinctrl RZT2H_GPIO(23, 1) GPIO_ACTI=
VE_LOW>;
>
> color =3D <LED_COLOR_ID_GREEN>;
> function =3D LED_FUNCTION_DEBUG;
> function-enumerator =3D <0>;
>
> > +               };
> > +
> > +               led1 {
> > +                       /* SW5-1: OFF, SW5-2: ON */
> > +                       gpios =3D <&pinctrl RZT2H_GPIO(32, 2) GPIO_ACTI=
VE_LOW>;
>
> color =3D <LED_COLOR_ID_GREEN>;
> function =3D LED_FUNCTION_DEBUG;
> function-enumerator =3D <1>;
>
> > +               };
> > +
> > +               led2 {
> > +                       gpios =3D <&pinctrl RZT2H_GPIO(6, 7) GPIO_ACTIV=
E_LOW>;
>
> color =3D <LED_COLOR_ID_YELLOW>;
> function =3D LED_FUNCTION_DEBUG;
> function-enumerator =3D <2>;
>
> > +               };
> > +
> > +               led3 {
> > +                       /* SW2-3: OFF */
> > +                       gpios =3D <&pinctrl RZT2H_GPIO(8, 5) GPIO_ACTIV=
E_LOW>;
>
> color =3D <LED_COLOR_ID_RED>;
> function =3D LED_FUNCTION_DEBUG;
> function-enumerator =3D <3>;
>
> > +               };
> > +
> > +               led4 {
> > +                       /* SW8-3: ON, SW8-4: OFF */
> > +                       gpios =3D <&pinctrl RZT2H_GPIO(18, 0) GPIO_ACTI=
VE_LOW>;
>
> Schematics say "run", so perhaps LED_FUNCTION_ACTIVITY?
>
>     color =3D <LED_COLOR_ID_GREEN>;
>     function =3D LED_FUNCTION_ACTIVITY;
>
Perhaps I'll have LED_FUNCTION_DEBUG for LEDs4-8 as currently they are
used as USER LEDs and  function-enumerator =3D 4/5/6/7?

Cheers,
Prabhakar

> > +               };
> > +
> > +               led5 {
> > +                       /* SW8-1: ON, SW8-2: OFF */
> > +                       gpios =3D <&pinctrl RZT2H_GPIO(18, 1) GPIO_ACTI=
VE_LOW>;
>
> Schematics say "error", so
>
>     color =3D <LED_COLOR_ID_RED>;
>     function =3D LED_FUNCTION_FAULT;
>
> > +               };
> > +
> > +               led6 {
> > +                       /* SW5-9: OFF, SW5-10: ON */
> > +                       gpios =3D <&pinctrl RZT2H_GPIO(22, 7) GPIO_ACTI=
VE_LOW>;
>
> Schematics says Ether-Cat link-activity, so LED_FUNCTION_LAN?
>
>     color =3D <LED_COLOR_ID_GREEN>;
>     function =3D LED_FUNCTION_LAN;
>     function-enumerator =3D <0>;
>
> > +               };
> > +
> > +               led7 {
> > +                       /* SW5-7: OFF, SW5-8: ON */
> > +                       gpios =3D <&pinctrl RZT2H_GPIO(23, 0) GPIO_ACTI=
VE_LOW>;
>
> color =3D <LED_COLOR_ID_GREEN>;
> function =3D LED_FUNCTION_LAN;
> function-enumerator =3D <1>;
>
> > +               };
> > +
> > +               led8 {
> > +                       /* SW7-5: OFF, SW7-6: ON */
> > +                       gpios =3D <&pinctrl RZT2H_GPIO(23, 5) GPIO_ACTI=
VE_LOW>;
>
> color =3D <LED_COLOR_ID_GREEN>;
> function =3D LED_FUNCTION_LAN;
> function-enumerator =3D <2>;
>
> > +               };
> > +       };
> >  };
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

