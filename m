Return-Path: <linux-renesas-soc+bounces-15920-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A762A88560
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 16:41:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9747B3BF761
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 14:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B0127466C;
	Mon, 14 Apr 2025 14:07:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7B5274666;
	Mon, 14 Apr 2025 14:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744639660; cv=none; b=Xbn4b9OxCiOBQ8y4cOB+DTcpKPIhG21wSDqWYK0witF9sakgunLzhxHjGxHGNxJ/7ezHQ1KM73JItvcV2GlJsjo08WpFfejABNvOxnXWiTGupfbvy0OokyMMgwdG0F3IlQUvV5FfS9WSyK9hAKLBdoSeMzAkjWt1breHd3Y+uSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744639660; c=relaxed/simple;
	bh=KmtCqsAqrFxyBENnczCK2DeNWbsxfKKJtq2T1GWqenM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CSUv0I10Y6JZVGK4Gne6xkvnaTSGJOCao5m3Fd9RNxblT37xwT7a6ElA8pAmK+2o+cmCtxC43bT4zjL2sqXcHFsov5tHYHaCs6IHsKUmEl/1UHJxrD/dhD0VDvhvkM4FT4wjgwuo2S3+pJ7R1vQKCX0+qjcuXMQuvlPhqcivN8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4769b16d4fbso23719791cf.2;
        Mon, 14 Apr 2025 07:07:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744639657; x=1745244457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1g30+2GKpP3gY6tzv0+fFCd6VwBGCphyrVLIpRyaaTs=;
        b=easTaY+SB1FP9Y60VGI0emqnJZfyhbZzbmYdmQdMWWqmPgCthhjDldHC1pwmMxH6bi
         n/p6FoJtrHOTJa4WVQV4BX94e6xT+0a57jUm1OODfAW4mretTMwFgCdaVpVyuyPYdN3a
         Ex4d3baYCNnUMkmi4rkofcIj8Tahs65qxHOiqMSrlA0Q4Fp8iEktdMfFatPHX8b1IUbu
         TYyZ8RMyRxRj6Lquj1UFi2rMernaSVvTPn5Vwok0o7GKVdWnkwOnaZlTScU2LIM7HcUm
         45t+GBizeo1BRJpH1xVzXupQaXiCAqIbr4JoTnJtqH2bahuMEOVl+hW9a0Cilt/P2SbD
         kgpg==
X-Forwarded-Encrypted: i=1; AJvYcCU3Q0vMqbEiPP8Bh6bFpbniTzj9dM/O+30w8A54fBhPVymoj3rEqDh1M9FyVTQ6+obvPecdRjodLT+2dN0=@vger.kernel.org, AJvYcCW23mcw0Jm7u/W1QwjDNJwgxBkW8SP7BMZU6ysUNRVbMcDPzH4bVW0PVlJcmhzGJ6njh4nPyp0mF8en1Wr+@vger.kernel.org, AJvYcCXnCwpskcfELl1itfNPqnQNe5S1aVdiIFXQ2r+WOS8hOd7opHYZcPXjAWxfluJZY7ae05Pf7uPxT7mBEYRbn67lSzE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1usUykSSZ48TqHVWN94X5Qq0I+5Pn2ItmXEdxGPutPxFFgVNd
	NkGST6M88k8uYFfE4AGJmpL+sl6LTHwYpANf8fESNSdqYngUtow7AN9UZxFh
X-Gm-Gg: ASbGnctv9IjOc4AyQuQLeK0yy2ulNcG3x5PDJ73KY+b0MiXUrgYknWeDE8gv0rnp93Y
	YzXzd7F+IShtlg4sUy6NnGJvw3Yu0xC7qTZgi2MfE6/v96IimNbDoGMDekRex5p7hvo0mgqDCAO
	AmAk8/wSY4eKNHJDvRLHieN5ZyQHUzkTufCAJdah3TcrzmOiGJVimwB/s1PzhdtrR4SH4b9IAaH
	QGTmNwvZoSymEB1kqFVJXA1tm5aWHnLLm1Fcft/uQ5pI14LNLw+kI8YA/EcwC9RR+coEhdNzdVc
	yvSS6NjiFYqKQBj+59phPDqlwWVUXCfwyQKGJXrVf2cz7muA+hWl0SPLEOaXdEPGQMvT5AIXr32
	Cj0IXUBo=
X-Google-Smtp-Source: AGHT+IHnZYItGCcG6UcyR7fy7zIYMSrTFgm1Iwd3F44ynXSoM3MPbf0xqsDz7sEDI7j2kWJ6UW+Q4w==
X-Received: by 2002:a05:622a:587:b0:476:b783:c94b with SMTP id d75a77b69052e-479775dd90emr196786661cf.40.1744639656965;
        Mon, 14 Apr 2025 07:07:36 -0700 (PDT)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com. [209.85.222.176])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796eb15e9asm75445521cf.30.2025.04.14.07.07.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 07:07:36 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c6a59a515aso265948485a.0;
        Mon, 14 Apr 2025 07:07:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUBwP8gZ33PwhQPKkV1RZVBpKwRT8fIxc3YF577xDBSdbljVyMulV+s+1nl+aNSNmnkMpQV5e0Qhubsr+pj4P3VLsw=@vger.kernel.org, AJvYcCVEI8sKprsaXN4RgmQKVc/hqpjcZrrxBIu08Er5W95XBFYPiKiFXpCMTuJKqkFW49TCNVNvSM6BDhANbFMp@vger.kernel.org, AJvYcCWy6Ig3ukufXO4/Ax/tZ1+d5P+UN8WPLncOnS8vvovmGcquoJR8DMDf5Ls4gnrqjL7vloUTi1hEEmtVGLc=@vger.kernel.org
X-Received: by 2002:a05:620a:240f:b0:7c5:592c:c27 with SMTP id
 af79cd13be357-7c7af0ca5f0mr1697492785a.21.1744639656203; Mon, 14 Apr 2025
 07:07:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403212919.1137670-1-thierry.bultel.yh@bp.renesas.com>
 <20250403212919.1137670-11-thierry.bultel.yh@bp.renesas.com>
 <2025041152-puzzling-clinking-e573@gregkh> <TYCPR01MB11492DDF2728C9D3B3F14DCA38AB32@TYCPR01MB11492.jpnprd01.prod.outlook.com>
 <2025041456-legacy-craftwork-2d8b@gregkh> <eba16d9a-9e07-498f-a7ab-0bb36076de40@linatsea.fr>
 <2025041458-squint-dean-9999@gregkh>
In-Reply-To: <2025041458-squint-dean-9999@gregkh>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Apr 2025 16:07:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV=1Hoo4b8jmKV2sE0VG2E4g=EUus_gfE8hdMvLag1pew@mail.gmail.com>
X-Gm-Features: ATxdqUEXwuB_h9ss3B7wAnA40txSs10_xFRwuEUWB9EYVDW80aQGAxh_nb_GlMs
Message-ID: <CAMuHMdV=1Hoo4b8jmKV2sE0VG2E4g=EUus_gfE8hdMvLag1pew@mail.gmail.com>
Subject: Re: [PATCH v7 10/13] serial: sh-sci: Add support for RZ/T2H SCI
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Thierry Bultel <thierry.bultel@linatsea.fr>, 
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Paul Barker <paul.barker.ct@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Mon, 14 Apr 2025 at 11:32, Greg KH <gregkh@linuxfoundation.org> wrote:
> On Mon, Apr 14, 2025 at 11:23:34AM +0200, Thierry Bultel wrote:
> > Le 14/04/2025 =C3=A0 10:58, Greg KH a =C3=A9crit :
> > > On Mon, Apr 14, 2025 at 07:54:12AM +0000, Thierry Bultel wrote:
> > > > > From: Greg KH <gregkh@linuxfoundation.org>
 > > > > On Thu, Apr 03, 2025 at 11:29:12PM +0200, Thierry Bultel wrote:
> > > > > > --- a/include/uapi/linux/serial_core.h
> > > > > > +++ b/include/uapi/linux/serial_core.h
> > > > > > @@ -231,6 +231,9 @@
> > > > > >   /* Sunplus UART */
> > > > > >   #define PORT_SUNPLUS        123
> > > > > >
> > > > > > +/* SH-SCI */
> > > > > > +#define PORT_RSCI    124
> > > > > Why do you need to tell userspace about this specific port?  Is t=
hat a
> > > > > hard requirement that your userspace tools require?  If not, plea=
se don't
> > > > > export this here.
> > > > This point has been discussed with Geert and Wolfram.
> > > > We cannot use PORT_GENERIC for this IP, and adding the new type
> > > > is just keeping consistent with the sh-sci driver.
> > > But, why does userspace need to know this number?  And why doesn't
> > > PORT_GENERIC work?
> >
> > The reason is that the sh-sci driver discriminates internally between p=
ort
> > types.
> > There are number of locations when it checks for PORT_SCI, PORT_SCIF,
> > PORT_SCIFA...
>
> That is internal to the kernel, not external, right?

Indeed.

> > T2H SCI needs special handling, too, that is the reason why PORT_GENERI=
C
> > cannot work. I just therefore added this new type.
>
> Again, why does userspace need to know this?

I guess userspace does not need to know about this (does userspace
actually care about any of these values, except for PORT_8250 and
friends?).

However, traditionally PORT_* has been used as the differentiator
for serial port types in most drivers in the kernel (incl. sh-sci.c)
as well.  Just two drivers use PORT_GENERIC, and these are the ones
that came with the introduction of PORT_GENERIC.  Since the rsci driver
is not a new driver, but a sub-driver of the existing sh-sci driver,
I think it warrants keeping on using the type field, like before. Else
it will have to become even more complex than it already is.

Note I am fine with using a non-uapi value. Is there a PORT_* number
range meant for internal (non-uapi) use?
Thanks!

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

