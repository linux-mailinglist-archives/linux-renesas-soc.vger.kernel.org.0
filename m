Return-Path: <linux-renesas-soc+bounces-21423-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C45B44F5A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 09:27:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E5F4587237
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 07:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B07CC2F49EE;
	Fri,  5 Sep 2025 07:20:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE582F3C30;
	Fri,  5 Sep 2025 07:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757056805; cv=none; b=KF3tviHxOWDRgMTZUW9A/VhTtHk8fBkwgTvztBAgWUADy5L9usbrna0E7JKYxQuRA1Es36+Ek+C5jHqUVt3lCw2QvMx86lPB4j/v0Vz/6BY2yc8Nbf2N9n3Z/Mwv9YyowffJywNsmfunecQm6jch3VpWR2O+66cW8dfzOk5b52w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757056805; c=relaxed/simple;
	bh=N++eadfkfJW2nzJArr59FTeDAtpppxwfAWjqFbYClSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pd8E2GiChgc6ny87XY1KX9Ovq8AJpo+sUQsqQI1Zw0z77BfNHxVXdpk+bdLm4n9CJ39u3L8cihgcMFF8CmD1LBAA7Ekt2fIRbF6MVGjZ+xCapAzizfe87bU7PE3ZW0Ht5H1Div3X3ZE5gnxIjWsp5ZeBxbkmnlASRf6jlBez5b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-52b2f964888so473498137.2;
        Fri, 05 Sep 2025 00:20:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757056802; x=1757661602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Byl6NC1iFQNQ5ldYE1dwWoAbz5NWngh+C4DCc8+uxP8=;
        b=VFFtEDQVL52Rbg1bAMwoGT8PgTSvYFo4AtAoPnTTY9OKVa2bapXfgimZ3ARAKOGgKM
         xTSzKCtSu0PHwuzg/EwJUz3jxUrs7IzYkpOkY6m3dbvq0+PUmvFqdwj2jr8WhGa7jIQy
         AEvfwpmPJMHYRQCbeZhqSOThqXVVW+qw19Ahr+HJiDs5qcfYYaFId70OnIOQMtj/avSj
         jdWQDaw0VV3jxKjKbCo+aEABTkD6pgs12FxkQM5vykePEPwayfVtev/H/4s4QMn9etw+
         8Ra+uiNbGYdD267hspt+fpZDQMhYQcZsi9dgokjRbqhEgIrVn7J8Rix/dvf3lz3SkO3R
         fPfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbEV1e+ui664Cfh2ApePS37RpCRn9z+fMFZsg2z8IFlx7BKH09OZ0E0YhlFexkQ10/y/x4LqqyyjfuEfv9RkB/4ZE=@vger.kernel.org, AJvYcCXyiXHl+SUtfYcXMPL+BIrKzm9/pHGCRl7n/q9iTcBzr0hEAfWIDqAuU4TJVHV1tpV5YG79hqTL1ryJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzQZZjDGxYfZ3bzzX7hiRS1NnaBZJDCh+MTEszLOklzmN5r1qvH
	IK1mewODWxUnRnjPySEtC7vU9jodIJ1M/mVJxOJ06MmlLVeKBm4YSWI6jhXp/1PI
X-Gm-Gg: ASbGnctPsJAlaKOc0SDklzifgwleFG4IkMArlVMdyr/Ec4+h05ljYpcYSNkXdSrcu/U
	dUUu/xNI2LSMRd03J4UG6gEmJzjZhc9ZPK8Q4n7K2dM13lt2xzAbdbXGugyoppuOFQTzAnP6AWq
	hjTZlbRSuZx9HiK0invDVl3Gp738U9Wg3Q8i4GfSXLYYF/g0q/II7+2wUYamTUNvNdEsZKuUZe9
	22Vx66kAztd0Un4B4gP7WPb1/3XN6jYUMiIaH1k+pIaMCMghAQKzI3EjuswbhiRDNon/xPRhYvX
	+rRs1VwApnmE28uvYM08QqbcqX0Tg7t5oZYZ/bMLIcHSP2NjuvsDAt2eMcTWZg2gZF2S5csTAQ1
	Xr1g3sPLH0erF/rz7AF11tCBQiudYu/PqJKSJ8nTJJdo99cCOMraeJqOvAudR
X-Google-Smtp-Source: AGHT+IGFoCOXKhQHE4a+5ec/4WYwX908tfmZ/DvKPAHazoPOBAk5FgtcmC1j8tqplkb3hN+7qlqYgQ==
X-Received: by 2002:a05:6102:510e:b0:521:f2f5:e444 with SMTP id ada2fe7eead31-52b1b2ea2bemr9390791137.17.1757056802415;
        Fri, 05 Sep 2025 00:20:02 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-52aef7890d2sm7673658137.7.2025.09.05.00.20.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 00:20:02 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-53410d0f4e7so1641859137.0;
        Fri, 05 Sep 2025 00:20:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVRz6T1ohd7hrJQaoJcLbs0jhq8HRQyt8XiXOS0HYd7SJvKn4MePrP22xHVy1vJU2OSj2qAWntFPriZ@vger.kernel.org, AJvYcCX9U6y3+BdQRHHlVyrCZU6oB3tCvtB8cnKNT9FsXxd+1rLu/hQM83GN0vwQXcCM1QoW7UznheOhIlB2y680/SpbYgs=@vger.kernel.org
X-Received: by 2002:a05:6102:5e94:b0:529:bfd2:382a with SMTP id
 ada2fe7eead31-52b1bf3b89fmr8726031137.32.1757056802005; Fri, 05 Sep 2025
 00:20:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250827221424.640770-1-niklas.soderlund+renesas@ragnatech.se>
 <20250827221424.640770-2-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUOKJXjk78Bgmazd4prGX21SDk_h=37ewEOwgdf9iAfcA@mail.gmail.com>
 <20250901140657.GA481255@ragnatech.se> <20250904152452.GD6174@pendragon.ideasonboard.com>
In-Reply-To: <20250904152452.GD6174@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Sep 2025 09:19:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU3vO0bY41Kcna66W2Xwrjp5ZktR0-N7-N0qj8aFNG_QA@mail.gmail.com>
X-Gm-Features: Ac12FXx63yI1uuhBQ_zIQe_JTcSt34dJnT4raxbBi6-_H7GVHvbWOrJEz4lpnB4
Message-ID: <CAMuHMdU3vO0bY41Kcna66W2Xwrjp5ZktR0-N7-N0qj8aFNG_QA@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] arm64: dts: renesas: sparrow-hawk: Add overlay for
 IMX219 on J1
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Thu, 4 Sept 2025 at 17:25, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Sep 01, 2025 at 04:06:57PM +0200, Niklas S=C3=B6derlund wrote:
> > On 2025-09-01 16:03:49 +0200, Geert Uytterhoeven wrote:
> > > On Thu, 28 Aug 2025 at 00:15, Niklas S=C3=B6derlund wrote:
> > > > Add an overlay to connect an IMX219 camera sensor to the J1 connect=
or.
> > > > The IMX219 utilizes 2 CSI-2 D-PHY lanes. This enables the video cap=
ture
> > > > pipeline behind the CSI40 Rx to be enabled to process images from t=
he
> > > > sensor.
> > > >
> > > > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragn=
atech.se>
> > > > ---
> > > > * Changes since v3
> > > > - Use correct port@0 instead of port.
> > >
> > > Thanks for the update!
> > >
> > > > --- a/arch/arm64/boot/dts/renesas/Makefile
> > > > +++ b/arch/arm64/boot/dts/renesas/Makefile
> > > > @@ -96,7 +96,10 @@ dtb-$(CONFIG_ARCH_R8A779G0) +=3D r8a779g2-white-=
hawk-single-ard-audio-da7212.dtb
> > > >
> > > >  DTC_FLAGS_r8a779g3-sparrow-hawk +=3D -Wno-spi_bus_bridge
> > > >  dtb-$(CONFIG_ARCH_R8A779G0) +=3D r8a779g3-sparrow-hawk.dtb
> > > > +dtb-$(CONFIG_ARCH_R8A779G0) +=3D r8a779g3-sparrow-hawk-camera-j1-i=
mx219.dtbo
> > > >  dtb-$(CONFIG_ARCH_R8A779G0) +=3D r8a779g3-sparrow-hawk-fan-pwm.dtb=
o
> > > > +r8a779g3-sparrow-hawk-camera-j1-imx219-dtbs :=3D r8a779g3-sparrow-=
hawk.dtb r8a779g3-sparrow-hawk-camera-j1-imx219.dtbo
> > > > +dtb-$(CONFIG_ARCH_R8A779G0) +=3D r8a779g3-sparrow-hawk-camera-j1-i=
mx219.dtb
> > > >  r8a779g3-sparrow-hawk-fan-pwm-dtbs :=3D r8a779g3-sparrow-hawk.dtb =
r8a779g3-sparrow-hawk-fan-pwm.dtbo
> > > >  dtb-$(CONFIG_ARCH_R8A779G0) +=3D r8a779g3-sparrow-hawk-fan-pwm.dtb
> > >
> > > Usually we keep the related parts together, but we indeed already hav=
e
> > > one case of interleaving.  I am not sure which style is best...
> >
> > I have no real preference. The style here is only me trying to mimic
> > what I seen elsewhere in the file. Want me to switch to the other style=
?
>
> I don't mind much either way either. The patch series looks good to me,
> I think it can be merged once we decide on a style.

Let's settle on the prevalent existing style? Keeping things together
reduces conflicts when multiple patches adding overlays are in-flight.

And of course we have Marek's outstanding comments (no underscores in
node names, no need for "reg_"-prefixes in regulator names).

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

