Return-Path: <linux-renesas-soc+bounces-22206-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45826B95620
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 12:05:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DBFB2E108B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 10:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EABBE2877E2;
	Tue, 23 Sep 2025 10:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eb098zEg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2553027815B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 10:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758621931; cv=none; b=piJ9+cDQ/fOtahDiHA4P69QBcw5UOcHxViZCTfryQgZb+EgwCnz7lPkylWtJKD5UTgCz5Q3pZNTNSmFTBqK59q7rIigzhtOi2smkwwJI3Ayw1i3bE1GeioELnojQTz/QunowuQghm38Cz5oyD4HcErH4F/ymoTN+yTWwyyVLOmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758621931; c=relaxed/simple;
	bh=seZKVt+CB+k7Mas/mFiiVxa4+/v/4YNrXuxIJTyDwm4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T1oVqV52C+ReXsE+PPy4uHiGj4aQBrsVjhH7fuef2qEZYV0uBiKFB9zqSGoxrLuc1hKEbiiNnBJb68TbjthOM3Kcsvs+CNf1HzY+oCA2kLaD3HfLD2u+JY4pqKQmiOS3bJ0KW6FislsR8uTU819VrDZU6HzaIw7R45BI7w6vRok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eb098zEg; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3ee13baf2e1so3906930f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 03:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758621928; x=1759226728; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7Xs+So4MvDnUaVFG+Q6oG/T6yZ5oFXdVTaeJcgoYjs=;
        b=eb098zEg9hMWFVDPenA2juV6hBsABv+UljqGJHn5D9dQNXpGJDor8E4pVnylwrz6At
         r0zCnvALrmTS7gPr7PgoZmtmz2mXawtExEkEGQGMpmdNSfwOdPI5pkLeC5qEoMid6vbg
         B4ljFdejXQVerRouWgydg6Mif9AjijfXpr1G802mfaaBzKq3iSTF0mQ6rNmenqC2R8lr
         bGFqS7NP/OW/4DXR8zMp4WEFDiQWqhIBCUtAZ8V834JrF4325nN4kKzLJIFf8AkCz/WO
         1lZR6clhj7w0Nu0/3DOUsk/TcWgv7ojk0jMbpeWab+cMe27Q42R2Pw9LfBWJodXnHSAb
         pv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758621928; x=1759226728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7Xs+So4MvDnUaVFG+Q6oG/T6yZ5oFXdVTaeJcgoYjs=;
        b=nPPbmwchoza9smnFkjMLrbuGMu2JeY2kzGmrWRUROu6TugHxtpx+wjcYTMKQr8Ftau
         3sWJLvxLDMx7MpJDrX+mlhz29A4wYy+IWFo0JLhHMINzP5P18cHspGmmSnvgz8+1uc+x
         YUAV4khMTkdRUDI4yuUF9M1JMTA/KowODrmxabpgVHDQTRnL+/Z9srAwP9nxyUiA0xPr
         71xSEgTcCSf44kbLeHEHEebrWgmsm3XIlijNE/cB0fGubMBFa7K+JsndSypmA3HAzjcK
         0JQ4WWRBeOOJXHTQNfT+JjbinOk9NjgDuLsATKoM6VQN5p/e4nVsiY0vkABw43FwB3bj
         tTZg==
X-Forwarded-Encrypted: i=1; AJvYcCWSoom+FhhLzEcWiXAyGn6cjur0lNVNAYu0gJ/ZWuUNirNmFfVtdfs05cSR4iaj5h+f/zXdUPI78WIwNQdPEiNz3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYCSk9nOFI7NS/DOzQ6pGaGpnXWWJQqevCRD56M9fxKqj1k9mT
	cPI5h/skg/qHWsTFie98LoJZhl+so7C2gfQHfNbD9IHpr37dDaxsI3aWF2czUZksBFusZXMcjAh
	xiXeobNElmNgsgDD8BNcSJh5xDd2Wa3jxKJGg
X-Gm-Gg: ASbGncvY/NletJE2N15JSZGfZjAZifhvTGSxEcCFAzBT05HoFRV+qUo4gkzRksaagxz
	9DIAtBaOlzT6bnHvqaFYp8fvfg5qbK3cF0QKwd1CVYVn5yY0Kay8VhCjafHafZ1Dkv+mTBZCidb
	zsNymtvltKL8XtBdC0moA++KZyOrW+x3d2ptNeOXVM8Fyt8RD94OyGwKs5hL6mrN69UR/Zg1cLj
	3ipUCOH
X-Google-Smtp-Source: AGHT+IEmfUOWv3qbc8Ohx4AaGaG7HewCyVbyN4002SXkqm3XHR6/YgMnu50wP/YGQJQxCgT0YYdAXH6LHlAhjgjNMsk=
X-Received: by 2002:a05:6000:1789:b0:3fe:34ec:2fab with SMTP id
 ffacd0b85a97d-405cb3e61a9mr1619335f8f.63.1758621928300; Tue, 23 Sep 2025
 03:05:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250923092846.74517-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <2025092311-espresso-collector-5f4d@gregkh> <CAMuHMdU_UXyAaeriz8R0MO5SpWE_z4s8Ci6CEMFgVJr_XxDZzA@mail.gmail.com>
In-Reply-To: <CAMuHMdU_UXyAaeriz8R0MO5SpWE_z4s8Ci6CEMFgVJr_XxDZzA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 23 Sep 2025 11:05:01 +0100
X-Gm-Features: AS18NWCi66XhZ5MUL-jzRAWBA37LuUHnLVXt5X9xQycFYilsn6M_AddZZJIo5qk
Message-ID: <CA+V-a8uhrOZSXih7ays+0nTJ_gPOAs7sn5=cUkpvwZR3c7EQHA@mail.gmail.com>
Subject: Re: [PATCH] serial: sh-sci: Add missing header guard
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Tue, Sep 23, 2025 at 10:59=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Greg,
>
> On Tue, 23 Sept 2025 at 11:51, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > On Tue, Sep 23, 2025 at 10:28:46AM +0100, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add header guard to sh-sci.h to prevent multiple inclusions of the
> > > header file.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> > > ---
> > >  drivers/tty/serial/sh-sci.h | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/drivers/tty/serial/sh-sci.h b/drivers/tty/serial/sh-sci.=
h
> > > index 951681aba586..22f877e2a17e 100644
> > > --- a/drivers/tty/serial/sh-sci.h
> >
> > Why is this a .h file at all?  It's so small, why not just put it all i=
n
> > the .c file and then there's no need for it anymore.
>
> Until commit e76fe57447e88916 ("sh: Remove old early serial console code
> V2") in v2.6.33, it was also included by arch/sh/kernel/early_printk.c.
> Those days are long gone, so the time has come for assimilation...
>
You beat me. I was about to ask if you are OK moving this to `sh-sci.c`.

I'll drop this patch and merge the sh-sci.h header into sh-sci.c.

Cheers,
Prabhakar

