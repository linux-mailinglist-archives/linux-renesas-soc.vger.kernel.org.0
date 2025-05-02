Return-Path: <linux-renesas-soc+bounces-16653-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27630AA76BF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 18:10:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B798998644E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 16:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F122A25D1F8;
	Fri,  2 May 2025 16:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQot7sXh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0062566E1;
	Fri,  2 May 2025 16:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746202221; cv=none; b=J12aHbf+XIQy88ucAM6ZFP+sY3T4rdX90NzY3KnA+HydYBon2hCU1LPJEdfYbLu49X8YmK2k6WAniQkcuioZN4zcBpNJTZ96zG924ruC6MQUdnGYHVxzEfHwV/NTdevSR2CW+3bh7GPOdtMBhxb67Xa6yyFKAvZxbVwv2Usyt24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746202221; c=relaxed/simple;
	bh=wuP92SHhRp+2NFqrXAOd351NmUnWl0oxAotOj66m/xY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kCmd3x8m+vQqMDcm6lw8xPMTqu2EMaZgPFlGoLfUY9JDTGN0OGrY5djf3XeC5Ip/i2IXTtZIEqgxdUQvUp0pjbm1Z6xmht6rwpBv7+MgJY7UyaaU4cg0ldypKPHBzW1Bw3gDWSYJVpdr6biUuKflkZ24bxvR9niQ/Xuz8jkSGgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQot7sXh; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso1372484f8f.2;
        Fri, 02 May 2025 09:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746202217; x=1746807017; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ggn4Te8iAQAPapgsDrGJ7UYxvxj7+JoOGyy8tQVU2ws=;
        b=fQot7sXhPsYVaP0UtfZVuF3v9TYPeszURhOV6PtbZBMdbatmKutKpnWB9VN8i/PE7G
         92aqDnF4guHf1jmvtteTu5fh7kPAsBEiQXg9TGtwII7+ELBkpqXFJs65VpDTUdQk8/k0
         WwqooBsteSLNlLUTT45sAbHR1Nku2iL5HHAWAQHe8cawMW85egOwSnGeJOdmVsly71WB
         XoehHwmdcuXjEUhVQRW9D1ityls5MYHwlvVtTd26tMaAN2/FpoAZZcRqGStBvY/z6l/8
         rEdg0MFrhwWyx/JxpSRPzUzOfnRYvW99l/dXZrsZiJ+4f0+Xjvz9HlRNTxgTCSbK9yBd
         wKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746202217; x=1746807017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ggn4Te8iAQAPapgsDrGJ7UYxvxj7+JoOGyy8tQVU2ws=;
        b=kp+c2o15NPTVfD5lt7HPMA/aI/nJnExFls5oOQM+M5wXJyK9ySBZGpUP55wEL4YWu2
         63p1QY7bviRJVc/wDh7oI7ExYO8rrbAHqdtYHgmC0HfiyeqkOnT8ct4j1FJPCDY06ekk
         fSC91WpWuOb4j6osTzBnf5HuCKphgyAJxavKzhJzFpJwmO77aREK98CadbbMzXwfWgsD
         UUvEpYm0ra966ZHOudbWEncCef5R9n2d6CAZnq7LBToZAxUHAntPOsZaI7GjriNMPTKJ
         P2ixpl6iW3jkMZCWIpOZquJ8X5CEBg/SOJHk6Ev828LJYCTx1bI3VckPA66hiegzAwZQ
         fpfw==
X-Forwarded-Encrypted: i=1; AJvYcCUX4qYeZvCQm113vAbirE9Pu+ZWWfvegUs1N/x/Sb0cfdBMJCC2oQCy6Rcbk+veNMy/ryshoVRMtHq8TzeRvZyjw3k=@vger.kernel.org, AJvYcCUXe13D5cXmNLmCVnkUHvMfAxfXCoxHmZu0RcEVZ3E92LAn2M6Ya6GnbOxluxnxRsVJwLEw/kzL4kbpXvkV@vger.kernel.org, AJvYcCUzCjNjgZCvSEfNI4OU8Yq69/Ka4D3yLIggEo7FfW6dHRVBUE7vJgBRg0KGv6oUfN+g60uyaZDZ5ZB8@vger.kernel.org
X-Gm-Message-State: AOJu0YzuQCEUxP/sJgSAxbRb8BWZwtDxCtlAeSgkBVCTPfNfy1Htm2Ts
	7K+RUbDuZBPjuoltRUzcTWQf14XxdBzbvb6b7xZ0m1lBrqSILcJ43975LXFOpPCR9crT1mLZM6s
	LVmqbVz8foMxVa/ZU5a2JdNKeLok=
X-Gm-Gg: ASbGncsO9cp9MpceQNnirmDXE6955BrM6oc0OPOtNrMYo/drVS06w86eaVWho3+ROMX
	GJ2bYpPDnaoahdHLJdTa3wPbEnz5K8R2nkxPyFEMbJq/sD3JIzux8rZTMyROIc+qlVfIjnwwX68
	L6iWCig4+IuBWNp2ZFsat4QqCSXvSKf+g3YJE=
X-Google-Smtp-Source: AGHT+IGVezP+3T30En3pYmcMFWwOdEcdSVzIy5+rzYKoypmb6ZyPfJHRenADSTshAQ6cPwOLymhczd+ONEyDbXDFLLw=
X-Received: by 2002:a05:6000:184e:b0:3a0:9050:cd03 with SMTP id
 ffacd0b85a97d-3a099ae91a2mr2919909f8f.47.1746202217130; Fri, 02 May 2025
 09:10:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502124627.69644-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250502124627.69644-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVXeBUah-r0YQsjhvxeja9oMZpLYZHTwxgdi=ezqY=iBw@mail.gmail.com>
In-Reply-To: <CAMuHMdVXeBUah-r0YQsjhvxeja9oMZpLYZHTwxgdi=ezqY=iBw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 2 May 2025 17:09:51 +0100
X-Gm-Features: ATxdqUGhCj9n_7XiK5shDvDJ2filmwcJeQUHGkzDLBKjTowp5A8Gn9P4TEI7_vQ
Message-ID: <CA+V-a8v5HHZUfhKhy-jasC5vKdL6MYBCnnVZ71rdtQOv5Tn-Sw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clocksource/drivers/renesas-ostm: Enable reprobe
 for all ARM64 SoCs
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Chris Brandt <chris.brandt@renesas.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Fri, May 2, 2025 at 3:37=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, 2 May 2025 at 14:47, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Change the OSTM driver's probe condition to `CONFIG_ARM64` so that the
> > platform driver will defer and reprobe on any ARM64 Renesas SoC once it=
s
> > reset controller is available. Previously, only RZ/G2L and RZ/V2H(P)
> > were covered.
> >
> > By matching on `CONFIG_ARM64`, this avoids adding a new config entry
> > for each future ARM64 Renesas SoC with OSTM IP. RZ/A1 and RZ/A2 (ARM32)
> > are unaffected-they still use OSTM but do not define a resets property,
> > so the deferred reprobe mechanism is unnecessary.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Hi Geert,
> > I've restored the Reviewed-by tag from v1 with your suggestions applied=
.
> > I hope you're okay with this.
> > Cheers, Prabhakar
> >
> > v1->v2:
> > - Instead of adding config for new SoC, changed the probe condition to
> >   `CONFIG_ARM64`.
> > - Updated commit message
> > - Added a Reviewed-by tag from Geert.
> > ---
> >  drivers/clocksource/renesas-ostm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/r=
enesas-ostm.c
> > index 3fcbd02b2483..6a5785f9c9c1 100644
> > --- a/drivers/clocksource/renesas-ostm.c
> > +++ b/drivers/clocksource/renesas-ostm.c
> > @@ -225,7 +225,7 @@ static int __init ostm_init(struct device_node *np)
> >
> >  TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
> >
> > -#if defined(CONFIG_ARCH_RZG2L) || defined(CONFIG_ARCH_R9A09G057)
> > +#if defined(CONFIG_ARM64)
>
> Sorry, I've just realized RZ/Five also wants this.
>
Ouch, I missed that too.

> "#ifndef CONFIG_ARM"?
>
Im wondering will it harm if we have it enabled for ARM too (I dont
have RZ/Ax to test it)?

Cheers,
Prabhakar

