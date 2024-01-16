Return-Path: <linux-renesas-soc+bounces-1592-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6F382F52B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jan 2024 20:17:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21C3E1F248F3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jan 2024 19:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2195B1CFB4;
	Tue, 16 Jan 2024 19:17:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DF41CF9A;
	Tue, 16 Jan 2024 19:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705432637; cv=none; b=ku3pstpP3UhE3kt02GkKcLBI2bl5Qr29CpL4RR2mt5L9bTrCTsg6AtTe62R0mEm1gTybXsE2DvreT7SAUwoHq6/wpPftTzsYTYXbfoVT+BbZisfkzSplIPMltCtxQE52w7HmFyifNZXaCIqLArpdghztsJCMei5B8pfb+49ohls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705432637; c=relaxed/simple;
	bh=9I7YyZPgpZUSOyaxMUI9VIR0QfiqbLybOfWU35SYZF4=;
	h=Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Google-Smtp-Source:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding; b=WbykxYsXpMtSnPpNBtZNR/4jbubxxqrOiCCWP/GBkJLQZXz0+W0tTI6tu3BMe0foFvnGUtdZw3ydLSlHusmheJTIFeQUb03Z7fndIUCtYfRpEuGwKOlQ254tjTFtSwr2hblUWoelG+OHCZMmAG4evkIDnx8b62FYfeMr2K811MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5ebca94cf74so97871567b3.0;
        Tue, 16 Jan 2024 11:17:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705432634; x=1706037434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CIvFeeK6Pq4WtOkZORdSST2d5hJuslQ8+bqOPyEGAQ4=;
        b=otkTmzOYhktmxwDZvdJTtZy74jVjn1Tos5DqCzujDDlMaVOKcWQn6zveKxesrYGKtZ
         Zh8f4HtaR3PbZFFxNzRW6ceLXXBLpfpRQBVLt9b8F6Ye9xgF3ExzxkjsDg9BTaIzu4aY
         7nSLdDhBXP1diePfsWl3Z9bYB00OnxJWWebyu6d5zbIhJGa+8Yrd4tFrPePRViL8Xuqg
         YpCKiBlX1Qquqtc2QZG7KrDF3RoN09qS/4mvLzjYEsI/EOQGE/GgcD4FjVFFobTfXHI/
         UrxjFrDU8mH76RVUn7fV2mATPt+f+JRLwzob3CykeruyatRzaJ7muLGre5ycGoi2dcLn
         BchQ==
X-Gm-Message-State: AOJu0YzmddcXqvMWNvjrbHTApP2nRbXNu/ta9pQZWDmAgm78XzaBPilb
	7Fj6NmO6yKlnkdaJR+7NiRI4RZ5LDij2uA==
X-Google-Smtp-Source: AGHT+IGc/36JJMqIYi9vRPfpY1Kl4SM54e9FLgfy5QLBYI1840qqPoL5Q0Bnq1jMKWxgFC+2sUYl6g==
X-Received: by 2002:a81:ac59:0:b0:5ff:5646:283d with SMTP id z25-20020a81ac59000000b005ff5646283dmr1007103ywj.76.1705432634629;
        Tue, 16 Jan 2024 11:17:14 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id fr3-20020a05690c358300b005ff4c76ceb3sm910917ywb.145.2024.01.16.11.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 11:17:14 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5ebca94cf74so97871407b3.0;
        Tue, 16 Jan 2024 11:17:14 -0800 (PST)
X-Received: by 2002:a25:c882:0:b0:db5:4c11:6278 with SMTP id
 y124-20020a25c882000000b00db54c116278mr3878445ybf.31.1705432634106; Tue, 16
 Jan 2024 11:17:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <fb1e38c93e62221f94304edd980a2fb79c1f2995.1705325608.git.geert+renesas@glider.be>
 <20240115-wages-secluded-b44f4eb13323@spud> <CAMuHMdWY3D45NGHvGXSZRLZz4TyCRgRCQLZV6CzYs=mSFcherw@mail.gmail.com>
 <20240115170807.GJ5869@pendragon.ideasonboard.com> <20240116-coasting-pastrami-1dda8d1025d0@spud>
In-Reply-To: <20240116-coasting-pastrami-1dda8d1025d0@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Jan 2024 20:17:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUfyqR8AisO7NcBqHK=Poty+dJYG=hqk=iaWYf7eQCZQQ@mail.gmail.com>
Message-ID: <CAMuHMdUfyqR8AisO7NcBqHK=Poty+dJYG=hqk=iaWYf7eQCZQQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: timer: renesas,tmu: Document input capture interrupt
To: Conor Dooley <conor@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor, Laurent,

On Tue, Jan 16, 2024 at 6:34=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
> On Mon, Jan 15, 2024 at 07:08:07PM +0200, Laurent Pinchart wrote:
> > On Mon, Jan 15, 2024 at 05:48:18PM +0100, Geert Uytterhoeven wrote:
> > > On Mon, Jan 15, 2024 at 5:13=E2=80=AFPM Conor Dooley <conor@kernel.or=
g> wrote:
> > > > On Mon, Jan 15, 2024 at 02:45:39PM +0100, Geert Uytterhoeven wrote:
> > > > > Some Timer Unit (TMU) instances with 3 channels support a fourth
> > > > > interrupt: an input capture interrupt for the third channel.
> > > > >
> > > > > While at it, document the meaning of the four interrupts, and add
> > > > > "interrupt-names" for clarity.
> > > > >
> > > > > Update the example to match reality.
> > > > >
> > > > > Inspired by a patch by Yoshinori Sato for SH.
> > > > >
> > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > > > --- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> > > > > +++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> > > > > @@ -46,7 +46,19 @@ properties:
> > > > >
> > > > >    interrupts:
> > > > >      minItems: 2
> > > > > -    maxItems: 3
> > > > > +    items:
> > > > > +      - description: Underflow interrupt 0
> > > > > +      - description: Underflow interrupt 1
> > > > > +      - description: Underflow interrupt 2
> > > > > +      - description: Input capture interrupt 2
> > > >
> > > > Seeing "input capture interrupt 2" makes me wonder, are there two (=
or
> > > > more!) other input capture interrupts that are still out there,
> > > > undocumented, and looking for a home?
> >
> > Maybe writing this as
> >
> >       - description: Underflow interrupt, channel 0
> >       - description: Underflow interrupt, channel 1
> >       - description: Underflow interrupt, channel 2
> >       - description: Input capture interrupt, channel 2
>
> I, for one, prefer this wording.

Fine for me.

> > I'm also wondering if we really need to add interrupt-names. Drivers
> > can't depend on the names due to backward compatibility, what benefit
> > does it bring to add them to the bindings ?

I like adding names if there are multiple items, especially if not all
of them have the same type.  Before, we just had a single interrupt
per channel.

I am also wary of another weird variant showing up eventually, with
e.g. 4 channels, or multiple input capture interrupts.

> Adding a -names property and not making it required has always seemed
> like a waste of time to me. Granted, making it required post-factum has
> other problems, so I am inclined to agree that it adds nothing.

I should have mentioned that I do have another local patch, to be
submitted after all DTS files have been updated ;-)

    [WIP] dt-bindings: timer: renesas,tmu: Make interrupt-names required

    Now all in-tree users have been updated, make interrupt-names required.

> > > SoCs can have multiple TMU instances.
> > > Each TMU instance has 2 or 3 timer channels.
> > > Each timer channel has an underflow interrupt.
> > > Only the third channel may have an optional input capture interrupt
> > > (which is not supported yet by the Linux driver).
> > > Hence each instance can have 2, 3, or 4 interrupts.

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

