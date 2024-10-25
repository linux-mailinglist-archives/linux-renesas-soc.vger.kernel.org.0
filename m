Return-Path: <linux-renesas-soc+bounces-10135-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F029B00A2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 12:55:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4252F1C22A14
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 10:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 432A11F76B9;
	Fri, 25 Oct 2024 10:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSnTm1sq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDA71DAC96;
	Fri, 25 Oct 2024 10:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729853714; cv=none; b=OFoD7EUuUOadoy7Z4al5kK4ylPMw7aAG+aqz0FUu0N7rkEAl09ZaoyW3OrIMDtuKSnyyb1h16em1wYyLphLXtWbgHV/gADZ2pkTCDUhQh/lmEpdaq2mqJ4eO79AHk8bf8KwYCkKnuL29vQIqsqapLGNDfHjz8Vynlkf9pbS5Y9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729853714; c=relaxed/simple;
	bh=fteB5fd02DTrwVquMKLch1Bp7NZwLBbZXfo65lYzTfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H+kfUBQ3BUh79D4PdDzodm1gV8XfbfNBShkhYg1fYCuJoes8SsYajbTTOEfYxy5a15qJ76HUV2Wv6Jq9oMaxyvdFLgy4qx8CrdIH996HosXwmjf2HvEYe9Dw+KNuOiAOCtfk/Ssnh5xmTbzAdenCsCHNZTvTJih/1ClQ3hNL7cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSnTm1sq; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-50d3d2d0775so606814e0c.3;
        Fri, 25 Oct 2024 03:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729853711; x=1730458511; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fteB5fd02DTrwVquMKLch1Bp7NZwLBbZXfo65lYzTfI=;
        b=iSnTm1sq0mG3G/hbLAiUxoe2ElE1e01Ep0nVB2sdT62Br0njGm1wPM4Px6CvsB01eJ
         XNvxeu4Vloy9qunoyTLxIsX/Uc5ix9tlQud0YafQDeAYvuU5QNF34f97FkDoTHzDXZMe
         tg0dFs06WerjT/hCSwYbupikzxWPjQ0dRidt3OyMmOAXRgb1gdcLqFM/og1q3zVFPS6V
         R8/twbSpFg1wNXwavpoLq/WLWuuw9WCkk4pk602pEPg9ecAK7xgOctDD86i1PccMR/t1
         qD29tqce8/a0zjtAhG45o+TmhjDNNo3qCBKvpZOTwXgCuOmrS/yv9gbsH0tSieMvLAe2
         F2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729853711; x=1730458511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fteB5fd02DTrwVquMKLch1Bp7NZwLBbZXfo65lYzTfI=;
        b=ukC2UYkThpcWciKWaqHsvLK8OpdbrdZ9BzgDgpiYiUeIfQQVURQaLvG0WINqZLr/3J
         K2DmlOHnKXSg0XzVH1ylVEOsS7Eeh7ASVob4ZTN1+5wMwtH2+vCE7gdcJUBLuSV7NRfA
         xCAQAhUP2LPPQCI3SPbpoDmQfyeeXLsHyvdzna3P2k0QhkX3EVRmbFqG4xfqTRP3/s9N
         L6C1/t8kRdakt22FOmfmHjk2JwMmKqLENlzI5ajJJs6mOT6AOfFMKkFeLhmwE5pqNYfv
         9vFNUNlsUhXFhO7C0M0xS0Y1k+6ZAikG9KbVfYgO7HLnx8C3Z/+Hhsd+RkdIhSVKR7v9
         VckQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtJlmgaUTJjAKKvwN40tYq+awrSZQADLWRh7dUC6QzqIOI8x82uKyoWO9RYJwZYvx2AFKL8jV1zb6VxEyaM5OubWQ=@vger.kernel.org, AJvYcCVKivpC8ptqTJVd+kZohCSDsDm3o3lUpwVs/nw+kvBA+GwNds87ZsJdCF/OC0802koLSOxZNoGgv+zcVyE=@vger.kernel.org, AJvYcCXn30K3mrsC2yPEvK1TKy1xN4g2o88i6hcvdVrkOmLBtyFI0NZ9Wr/k1t4EQYoHC6fn1b5PdlaJ+zEmXCw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhWRrwDGxzpPSWtJFlzh5PoW1YgJNDTNKG9tlKnG/UPPC0gzhx
	divKXfcOvBh5l3J0VjOr0SawTEG7awH11GNcq1KQpzzNcLJjOsQu+OYXgGsZHS5cbZr2bpOWp2O
	SBjHuxJLG8wHrgTA1Nx20Rn4BQyw=
X-Google-Smtp-Source: AGHT+IGoKGgY4b0rukcVpFW9K/joa+2hDKDXrG/8Oi6I6HOnAZ7rva20VvYXS2swchtaX6IUVYqG08WKfFfrVQi7oVg=
X-Received: by 2002:a05:6122:902:b0:50d:4cb8:5b10 with SMTP id
 71dfb90a1353d-50fd020eb9fmr10566674e0c.4.1729853711069; Fri, 25 Oct 2024
 03:55:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241021201349.395022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241021201349.395022-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <877c9zybbc.wl-kuninori.morimoto.gx@renesas.com> <TY3PR01MB113461595CD0E51F2F0C9CA51864D2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113461595CD0E51F2F0C9CA51864D2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 25 Oct 2024 11:54:45 +0100
Message-ID: <CA+V-a8sqHeEtt-T8fH0qEp-BM8hZCSeUgVe_L67v-UdFPoCjsg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] MAINTAINERS: Add entry for Renesas ASoC drivers
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Wed, Oct 23, 2024 at 7:57=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
> > -----Original Message-----
> > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > Sent: Wednesday, October 23, 2024 12:20 AM
> > Subject: Re: [PATCH v2 4/4] MAINTAINERS: Add entry for Renesas ASoC dri=
vers
> >
> >
> > Hi Prabhakar
> >
> > Thank you for your patch
> >
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add a new entry to the MAINTAINERS file for Renesas ASoC drivers. Thi=
s
> > > entry covers the Renesas R-Car, SH7760 and Migo-R audio drivers,
> > > including the device tree bindings.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> > > ---
> > (snip)
> > > +RENESAS AUDIO (ASoC) DRIVERS
> > > +M: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > > +L: linux-sound@vger.kernel.org
> > > +L: linux-renesas-soc@vger.kernel.org
> > > +S: Supported
> > > +F: Documentation/devicetree/bindings/sound/renesas,rsnd.*
> > > +F: sound/soc/renesas/
> > > +X: sound/soc/renesas/rz-ssi.c
> >
> > Unfortunately, I can handle is "fsi" and "rcar"
>
> Prabhakar, Maybe create separate Maintainers entries for SSI driver,
> I don't mind you as a Maintainer or myself ?
>
> 1)Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
> 2)sound/soc/renesas/rz-ssi.c
>
Ok I'll create an additional patch for this and add yourself and me as
supporters.

Cheers,
Prabhakar

