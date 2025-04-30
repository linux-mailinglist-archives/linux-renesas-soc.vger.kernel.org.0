Return-Path: <linux-renesas-soc+bounces-16524-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4435DAA519A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 18:26:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E3AF1C0852D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 16:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33406262FDB;
	Wed, 30 Apr 2025 16:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="fESSCScl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43D5264FA9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Apr 2025 16:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746030340; cv=none; b=jL/pqyZRgFDzO6vXEi4fpITUdpk3tq8Ew6bvSIOX+V0+Bxj/mQMnb62g7+BP989aZ5WQkN2k+0uHtEAWv9BQw02idpVOqgYX645Lg4LrzZswil2R8qKvkPR8bNYA3wsrmo72YMJUS+jhubKCOa3kFRWLu+KLE2F5BVxEakUxrLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746030340; c=relaxed/simple;
	bh=1PVzdxRp/+kFJAIg/6hMZbJV5KT/kYbP/MLkM4mgXFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EXk1JIpHg0xpm7TmRe7djdAMdAuJLYrt+8jGeyEAzwzgv0UK2fIiXNfmYiFeGNDfMl8Bry6nw/AxJiY85slIfIexoE+5Nj+f6U0Y2a/Xq9pi6WRlUgUahzRrENBy8db/+UBOpqhm402c3uY1A3wUwwg3xYd6a1TzpOL8mjK8kH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=fESSCScl; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7082e46880eso722637b3.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Apr 2025 09:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1746030337; x=1746635137; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYuvroTINkfC6xAaXcm4PuIm1ax6xcO4Y50Rb3BmvI0=;
        b=fESSCSclF5O2b9sup4quDgOBRJ/roLJb19FtfUewz+S9+SUFpeClDRQZ1O3k793Xm0
         +tqiHTxRusOrnAYEXL+t/sCYknagaJxgMgpEXXJA4nO4U3ypFjB7SKKo4RypcAYRjUrF
         RqyA4C5A8TdSHdmgvDLNev4LScAFNAcgIcCAvBMOOsVuMF0nxtCtBKLBjXw22wrPTD08
         kpt8SfNd2rZ8vdqaLM7KfLbPSqe/RpzP69k2kpecbq3F1ZZp6TLaq5XvXcvRhD+IH8CH
         /jLQ85lnw5+0JGT9Ruw64YHxT9Xk2XeN/nhRMx+iqhilCq7YD6yAVIIRGreG9q3wqrkd
         ftaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746030337; x=1746635137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pYuvroTINkfC6xAaXcm4PuIm1ax6xcO4Y50Rb3BmvI0=;
        b=ZC6HDWgBBgd1NMQfpY6rHiIVM/h7M7lkOLXmZp7RTO6wYTnnIjTvxfcH3tJ9aWprMj
         jHWfFuTD5hNDBLcn+05lDDtUoUhU82/6qJqXANTfHgSjAWtQ0hfsDMyb8+hNSaKxl+nz
         FmmzYFqAFlVcYbEwk0Qlivua5XeH8hE2/j5xLsa0i2QH/ZBGzYUBD/LInzsKCQRF3WR0
         A8KzUf9G2aB6sZrKeB1MXX8HlusmXVfZHYPpw/+xZFJr1TNSA6BoJEf9e+mENfnsfh0G
         /oMNg/SdEwSF5Ss0v397nR8vN0J06a46DzcwbUHFBYbbHkOONJLSsFMVFB6zzW/rh9NZ
         32Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVv2kj4gMhy9G0iOlCEfp15NEbLh2gz6th99fPudIC+piTyV0BTf3wGnFfxVEc/SYR47o8sT+4M/ShOgCXenXWncA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwD1U/of020e/psCifKjNTgdRjGtg9roRaWzyY3rsQ5SYV+3i1y
	kBy2cZuZZRcIH4wRT4P9YNuIWH/Uj9XZFlzJPafeKROdVu1l33InZ4ks446jFohkR6GNgETM5He
	jVgm6KLNbGvphqKJbMIzogA9VUCRi6TTRRtRXdg==
X-Gm-Gg: ASbGncsT5EIbys1GZIVOMKdkWhu4OMRGOGnPB6uYABopWXZv106P3Atild01DBSCWqV
	5lO6KerSUWSjBuHXZLC9LM7JuQADuJVFJaH7jLlh4EFHjU4CNEjWDHufx+fDZE1GBCrd0RontxK
	ksPiHhcCyXmxlukIn60if3rQQBVPGe2Vm887W6eCOuMn+5zw4v3hnBhg==
X-Google-Smtp-Source: AGHT+IHd+mzxsbQHzg2KdqaE0D0IMCI4DPD74nxHKEsYaPw4wosN4rVl4mhlvOGDdXpSNiN3p5emIlAjRcnS9XKmP/Y=
X-Received: by 2002:a05:690c:700b:b0:708:73bc:abdc with SMTP id
 00721157ae682-708abdac21fmr56602207b3.22.1746030336612; Wed, 30 Apr 2025
 09:25:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430125322.2808528-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdVXrHVugCMoWkCRVGotOEeTuuJJ6rC7CC7Kf_seo3J5og@mail.gmail.com>
 <20250430131856.GB25516@pendragon.ideasonboard.com> <CAPY8ntBPSC6KZcBVt35QWx_ZPYwkSJSVzhhaXokbjkWJDVJRqA@mail.gmail.com>
 <20250430160445.GB31516@pendragon.ideasonboard.com>
In-Reply-To: <20250430160445.GB31516@pendragon.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 30 Apr 2025 17:25:14 +0100
X-Gm-Features: ATxdqUFmSnHhLyB4xlaoBz0z3J5u5ayEJkVVl-qFWx18SUxO7BsGgktwlOcreUk
Message-ID: <CAPY8ntBb5x+F=xj=KVrkfq=JqdshgCS548YjRt4OuhhyVJNkVw@mail.gmail.com>
Subject: Re: [PATCH] media: dt-bindings: sony,imx290: Update usage example
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 30 Apr 2025 at 17:04, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Apr 30, 2025 at 02:52:01PM +0100, Dave Stevenson wrote:
> > On Wed, 30 Apr 2025 at 14:19, Laurent Pinchart wrote:
> > > On Wed, Apr 30, 2025 at 03:03:10PM +0200, Geert Uytterhoeven wrote:
> > > > On Wed, 30 Apr 2025 at 14:58, Niklas S=C3=B6derlund wrote:
> > > > > Since commit 98e0500eadb7 ("media: i2c: imx290: Add configurable =
link
> > > > > frequency and pixel rate") the driver expects two specific
> > > > > link-frequency settings 2-lane (445500000, 297000000) and 4-lane
> > > > > (222750000, 148500000) operation. The driver fails to probe witho=
ut
> > > > > these exact settings.
> > > > >
> > > > > Update the example in the bindings to match this to make it easie=
r for
> > > > > users to incorporate this sensor in their device tree description=
s
> > > > > without having to read the driver sources when the driver fails t=
o
> > > > > probe.
> > > > >
> > > > > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ra=
gnatech.se>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > --- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yam=
l
> > > > > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yam=
l
> > > > > @@ -136,7 +136,7 @@ examples:
> > > > >              port {
> > > > >                  imx290_ep: endpoint {
> > > > >                      data-lanes =3D <1 2 3 4>;
> > > > > -                    link-frequencies =3D /bits/ 64 <445500000>;
> > > > > +                    link-frequencies =3D /bits/ 64 <222750000 14=
8500000>;
> > > > >                      remote-endpoint =3D <&csiphy0_ep>;
> > > > >                  };
> > > > >              };
> > > >
> > > > I guess the link-frequencies property should gain a rule that it
> > > > needs two values, too?
> > >
> > > The driver doesn't require two frequencies (unless I'm mistaken), it
> > > could operate with a single one (albeit not in all resolutions), so I
> > > don't think we should require two frequencies in the bindings.
> >
> > The driver does require both due to 98e0500eadb7 ("media: i2c: imx290:
> > Add configurable link frequency and pixel rate") and
> > imx290_check_link_freqs()
>
> I realized after sending the previous e-mail that I was indeed mistaken.
> I thought the driver iterated over the DT link frequencies to check if
> they're supported, but it goes the other way around.
>
> > However I'd agree that it'd be better to make the driver accept just
> > the one and make any compensations, rather than amend the binding. I'm
> > happy to try and find a few minutes to make a patch for that.
>
> That would be nice, thanks.
>
> > My experience of this family of sensors says that we should be able to
> > run any resolution at any link frequency, but it needs changes to
> > HBLANK to ensure there is sufficient time per line.
> > Dropping to the lower link freq for the 720p mode is only because that
> > is what the datasheet describes for the precanned HD720p. The window
> > cropping mode lists no such requirement, and yet could produce exactly
> > that same 720p output.
>
> And with more information about the INCKSEL registers we could possibly
> even support other frequencies.

I have no extra information there.
The minimal changes that are made to INCKSEL 1 & 2 to switch between
the two link frequencies makes it look pretty fixed rather than
flexible PLLs, and I haven't got the time to go randomly poking to
reverse engineer it.

  Dave

