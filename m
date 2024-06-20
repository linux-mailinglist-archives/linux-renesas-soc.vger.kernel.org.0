Return-Path: <linux-renesas-soc+bounces-6574-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B52910DC8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 18:57:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 179151F22985
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 16:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AF3C1B14FA;
	Thu, 20 Jun 2024 16:57:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041211B011C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Jun 2024 16:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718902638; cv=none; b=XOoDderyvJpMB0UHLi2pC32bSO6nEfX52dtZ/DFviIVl4uMWM3Uzu1qlR/4hls38MWFXfix3yqZycEIzjsO6vGhy98eB6YB66rHgBAxidZoFrZiVaFwO5pqrUzHldn4gcURpgOxM2nG2/Zz7stHNMxlo4w7uo/PKekEtDLlodAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718902638; c=relaxed/simple;
	bh=jS7+l0iF+hSXdqRT5eoEfWRi8eip9tGxoK7Nw0d70Vk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sBVy3k6qJnxLunV2kIv95Oq/k9WDurf7aSvOyE/5zBQMC0spnaCWqAIUhYnZF9IN5Yku3h8O+Akt18rORkNo0FSh0U6q1t/KhA+7L0ffo2DQbv+LtzMnTNuR1HxaJIaAG0lFCzO05lBby0SYzVXg5wLhjt1Z3vwxmm6ZmSMTjpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-630640c1e14so12284577b3.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Jun 2024 09:57:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718902634; x=1719507434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S5itu45x4aHLX6PVq+0Re8ZrEKkBuHZebf/C6/EpUMs=;
        b=jzp0MDk2JdMG+89y9bsCvQWuidgY5A6EBGb1r0JV8Cm+IxtxdgpA+6KafgosVlAaCD
         AB/GzyOmPkqBBpFNF7sHzlIfBsunWH0S5s95BOZj1XhfShmo8+yYA+2SLOKI0zJFy0F5
         eCREkqhps3tvNqG+slnZb/nxlfWa4SiXpC9UpcmFwisku7zNXGfutp9F3wzkxQ3ml62b
         N1X6KH4POESfHHUtkiiM0kpGvDJymWKmXL2byAqWvepIuqd6fWy+qs/icAn3PNmyudoy
         VS4P4H2seKLL1WWuLVphMwwmLCM2s1vbtJ48cdfuLihoijn080GaCGntqE4u+xSHxVat
         NYLA==
X-Forwarded-Encrypted: i=1; AJvYcCVR4aEb2DVrUYl1tPGweTAJ12OMBw1iqnk+0w1j1Q1XnMHiNJESTYEhpxtiQF7+HCAtWSrVVZQ1NkVqcRC6LKpwNR/yaovNhG8n176Fft0zuw0=
X-Gm-Message-State: AOJu0YwEWcMBevqwv4Lor6Q5AWvlJNOo4TCQZ9EDCUHxFbygf/Hk5kGw
	Fr6CWNvNt6OOC8ORu4g2fKnAwwuMgYQMu1YM9+zqg0dVD+0H912G6STx+TM0
X-Google-Smtp-Source: AGHT+IFXDS12p8djH2dbT4p8vyHAg1T+ywDaoPkuPT5zgWGntCFE++lErLBs/USdYxZvoD4d+2wJUg==
X-Received: by 2002:a05:690c:6188:b0:63b:f6c1:6068 with SMTP id 00721157ae682-63bf6c1612bmr38095457b3.32.1718902634115;
        Thu, 20 Jun 2024 09:57:14 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6311aa26f77sm31049447b3.122.2024.06.20.09.57.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 09:57:13 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dfb05bcc50dso987856276.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Jun 2024 09:57:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWm5GIxfT+pwrFWUDE+PqgsXQOo2dnQ19h1vE4pd2jnz0ExWEVJaLFi8tfsG7siVokff9rK/nNiXA8gi/tv4SwZgPCZwDKTXR01wkNuuKXwmRA=
X-Received: by 2002:a25:aa4d:0:b0:e02:5186:a268 with SMTP id
 3f1490d57ef6-e02be1023e5mr6107160276.6.1718902632594; Thu, 20 Jun 2024
 09:57:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240619102219.138927-1-jacopo.mondi@ideasonboard.com>
 <20240619102219.138927-5-jacopo.mondi@ideasonboard.com> <20240619194414.GD31507@pendragon.ideasonboard.com>
 <CAMuHMdXxf4oePnyLvp84OhSa+wdehCNJBXnhjYO7-1VxpBJ7eQ@mail.gmail.com> <hs52ylzaes26kx3yj6eqfksvmoldsvdn3e4emo4q7ijkhdbe2r@wyxempul6cxm>
In-Reply-To: <hs52ylzaes26kx3yj6eqfksvmoldsvdn3e4emo4q7ijkhdbe2r@wyxempul6cxm>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Jun 2024 18:57:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWhp6mNintEM7Ys77=vGmCqBp6qSLzh+Joaf=2jtntN4A@mail.gmail.com>
Message-ID: <CAMuHMdWhp6mNintEM7Ys77=vGmCqBp6qSLzh+Joaf=2jtntN4A@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm: rcar-du: Add support for R8A779H0
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, 
	"open list:DRM DRIVERS FOR RENESAS R-CAR" <dri-devel@lists.freedesktop.org>, 
	"open list:DRM DRIVERS FOR RENESAS R-CAR" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jacopo,

On Thu, Jun 20, 2024 at 6:48=E2=80=AFPM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
> On Thu, Jun 20, 2024 at 02:48:49PM GMT, Geert Uytterhoeven wrote:
> > On Wed, Jun 19, 2024 at 9:46=E2=80=AFPM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > > On Wed, Jun 19, 2024 at 12:22:18PM +0200, Jacopo Mondi wrote:
> > > > Add support for R-Car R8A779H0 V4M which has similar characteristic=
s
> > > > as the already supported R-Car V4H R8A779G0, but with a single outp=
ut
> > > > channel.
> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >
> > > > --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> > > > +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> > > > @@ -185,11 +187,16 @@ static void rcar_du_group_setup(struct rcar_d=
u_group *rgrp)
> > > >               dorcr |=3D DORCR_PG1T | DORCR_DK1S | DORCR_PG1D_DS1;
> > > >       rcar_du_group_write(rgrp, DORCR, dorcr);
> > > >
> > > > -     /* Apply planes to CRTCs association. */
> > > > -     mutex_lock(&rgrp->lock);
> > > > -     rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
> > > > -                         rgrp->dptsr_planes);
> > > > -     mutex_unlock(&rgrp->lock);
> > > > +     /*
> > > > +      * Apply planes to CRTCs association, skip for V4M which has =
a single
> > > > +      * channel.
> > >
> > > " and doesn't implement the DPTSR register."
> > >
> > > I'm pretty sure writing it is still harmless, but...
> > >
> > > > +      */
> > > > +     if (rcdu->info->gen < 4 || rgrp->num_crtcs > 1) {
> >
> > Looking at the R-Car Gen3 docs, this check seems to be wrong, and the
> > lack of a check might have been an issue before?
>
> Not sure I got from your comment what part is wrong.
>
> Reading below it seems you're suggesting that writes to DPTSR should
> be skipped for some Gen3 boards as well ?

Indeed.

> > Seems like the register (per pair) is only present if the second CRTC
> > of a CRTC pair is present, so R-Car V3M and V3H (single CRTC) do not
> > have DPTSR at all, and M3-W (triple CRTC) does not have it on the
> > second pair.  M3-N does have both, as it lacks the first CRTC of
> > second pair, but does have the second CRTC of the second pair.
> >
>
> /o\
>
> So far however, all Gen3 SoCs you mentioned seem to work with DPTSR
> being written and the BSP [1] only actually skips it for V4M.

I don't doubt it works, I was just reading the documentation.
Many nonexistent registers can be written zero to without ill effects...

> What would you suggesting in this case ? Addressing gen3 as well ?
> That's something that would require testing on all the above boards
> thought.

Ah, what if we could do without all this pesky testing? ;-)

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

