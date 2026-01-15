Return-Path: <linux-renesas-soc+bounces-26849-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 843D8D241E5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 12:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1303830056E5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 11:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD483378D61;
	Thu, 15 Jan 2026 11:15:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA2A364E8E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jan 2026 11:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768475734; cv=none; b=s5akLeZIFRL9YrddMPSsbirdEaPBzzb/70j0scFqAdX2eRG8oqodA/KYvZJKRgNeT7D2iJiMIMmS+1zxc8wlRbaSzaYBAfCOMKsLU9YwpBaB20k/+rP6BkK77q4VVykb2t/ghf2QZ7pmiJD+Yw69wO8E1TxEWGf9ZJklMja9lCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768475734; c=relaxed/simple;
	bh=4Xv+kiu1PsewV9Qo5HqVVMC1TkAVawqiz071ud8smLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r61vBDgAiEpX6ZHLhwYskuCgVARIuVPewAyNP/5GEIp3stlsfl6tHfJE/+tyVjl3ipfFIXnd/Xav+NHRB+qJ6YMK5266UfbShnryHQD3gY3qXqv9d5NsWm5vDCyj6sHTNFFQB21IaX/G3g7YNuAG/TeUuT14V+nheOSCGkqvJFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8804f1bd6a7so6570986d6.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jan 2026 03:15:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768475732; x=1769080532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bt+YNNG27WZEvGUwZk4TYJG13mQxJAZnvV5f9yUtP/0=;
        b=eQnUPWRqPjlKI9AFpReXwOevIC7gIdXGN6N/ZR0K90zxVQvfCkyt2gx5VlwM00MJeg
         kGbNjuSStb/zLUFU7SB3hGcbsqUisE+1cox7yUkxqbNEgxjzlDWlzV4evF5zbV7hNEVf
         ap6zgrP/A5YLJcshEUwHQuAnZuBgIDQlw7CHON0tWFXO0PDrGpz3LJSHFNhOXjXbAFnb
         +ymKO97jYBy7EjVr2Fd1O3wQuTTp6M1iCU6Eyg9jz8iPEj2nI1K99LgOR/r1qh1w7zhb
         X16P5xCnVsZUr3ITD7HPJzkVRnZHJKE1MdWTBP2mJewZFXsHiekNQSb352WbCHy8cMOD
         MGnA==
X-Forwarded-Encrypted: i=1; AJvYcCXJ5SlsaWAiXR1Qommwqx9vp00Nlc/Odxp4J29YlwkxC9QOrSflpiBx/er1AQXItmufwLGpnU5e3eYHl7lIZA/mog==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJBsrqmIGSVotx7VsRJI9pxGigebrEsADSWoQRl+BbOzPWY5G5
	k0ocDoiXghPbFVeXPbq9q/k2hQv8Tg4qcwZKb4GZjIb3vrYgA3tdK57aR7FNEeTdWn0=
X-Gm-Gg: AY/fxX7q1HuktOl9dBS55kyHcMqBi78KalaQ3k7xGkmPCTfI1ceTIbSHH7mPZL2H+Tx
	TVRzwQ5fupAIJhltxneTKHlhV/aPyC3EubBTHn3pRACcGKkBoKnIAzSMGfLqVabm+5f7iGczQCQ
	grV+Pn9OyIVC12Ld+OtsojpRQrdpPdQRHRabyuEb2nIutH7GWblLkpHpMgcNGg9blFacl4D9R0l
	JmKjbNOuaucsxIwQwkTOxpgBGvG3f4IiSA0NXZnVKPS70RZHfM3yDioFgpex9NkK3tJXLvDMIgZ
	sYm1ySyae+41p152Ib3Ysx8mxwz/pg+/qgXh5N5f8MejVMeJtF3qWl+3xaEU+UVuKYtVp6XD1Fj
	ceOULfkkECRIrU0yAAcorhGh5Vb3toPLlHMvGWB9Rh/WqmY51N3qo6lZf4OzRygXOdI32DSE8Ct
	YC5ae7j8Bp9HrbNdi2dpLU5TgUqlFfpM33Cyad6uhKRjSvXPYrsed1
X-Received: by 2002:a05:6214:21a9:b0:888:6227:3e57 with SMTP id 6a1803df08f44-8927438ed58mr74253836d6.16.1768475732006;
        Thu, 15 Jan 2026 03:15:32 -0800 (PST)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com. [209.85.160.177])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890772341d0sm199866446d6.31.2026.01.15.03.15.31
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 03:15:31 -0800 (PST)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5014f383df6so5852541cf.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jan 2026 03:15:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUtGn1NlmOrV5MwfgBdqAnWa0pvCM//TiwYThVPR1cre7CGzD7+oWlu3ysV9vE2ErOpT8de1unlLbDXwgoqJcdwMQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3906:b0:5ef:b3da:1634 with SMTP id
 ada2fe7eead31-5f17f68f312mr2498241137.43.1768475230982; Thu, 15 Jan 2026
 03:07:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114093938.1089936-1-herve.codina@bootlin.com>
 <aWdp_jMVUBN04is3@ninjato> <CAMuHMdWkGevDsBuUs1k=r5yeKJZHvs93b2SDfPwKoF4fFr-3Ow@mail.gmail.com>
 <CAL_JsqJwGLXPCtSabkeD26Ct3MrzFBdU-3-gJbGEpRQcmL1LWw@mail.gmail.com>
In-Reply-To: <CAL_JsqJwGLXPCtSabkeD26Ct3MrzFBdU-3-gJbGEpRQcmL1LWw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Jan 2026 12:06:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUuQmMKyg2oc6jw9Tgsct9ZimjkL5PYw1OyHAgODL==Og@mail.gmail.com>
X-Gm-Features: AZwV_QgN5zpuxnXc64xxS7FKteaOjK3XvNGTF8daKF3483kVmVRKJhptLCCbWv4
Message-ID: <CAMuHMdUuQmMKyg2oc6jw9Tgsct9ZimjkL5PYw1OyHAgODL==Og@mail.gmail.com>
Subject: Re: [PATCH v8 0/8] gpio: renesas: Add support for GPIO and related
 interrupts in RZ/N1 SoC
To: Rob Herring <robh@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	"Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 14 Jan 2026 at 23:21, Rob Herring <robh@kernel.org> wrote:
> On Wed, Jan 14, 2026 at 4:47=E2=80=AFAM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Wed, 14 Jan 2026 at 11:03, Wolfram Sang
> > <wsa+renesas@sang-engineering.com> wrote:
> > > > Rob, Thomas, this series is blocked waiting for your feedback and y=
our
> > > > acks if you are okay.
> > >
> > > This was a little hidden between the other text, so let me emphasize
> > > that these acks are needed. The other option is to send the irq stuff
> > > and the SoC stuff seperately.
>
> Reviewed-by > Acked-by

It does have different semantics...

> And if it has either, I stop paying attention. So I was assuming this
> all was going in via not-my-tree...
>
> > The irq and SoC stuff depend on the of stuff, so doing so would
> > delay the former by one cycle.
> >
> > On IRC, Rob sort of agreed to option A from my proposal (see v7 cover
> > letter):
> >
> >   A. Rob takes the first two patches, and provides an immutable branch.
> >      Then Thomas takes the irqchip patches, and I take the rest.
>
> Until this...
>
> > Unfortunately that part hasn't happened yet...
>
> And then a new version came in... Why a new version only to add a
> Tested-by tag? That sends you to the back of the queue in my normal
> workflow (which this is turning into anything but).
>
> Thomas has now provided a Reviewed-by. I think it is easiest if you
> just take the whole series via Renesas tree.

OK doing so...
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

