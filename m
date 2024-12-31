Return-Path: <linux-renesas-soc+bounces-11750-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 485069FEEF3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Dec 2024 11:46:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7369D3A2102
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Dec 2024 10:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E5AF18E368;
	Tue, 31 Dec 2024 10:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gyUKSSa/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1C517ADE8;
	Tue, 31 Dec 2024 10:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735642002; cv=none; b=HVoGgAadEP4mm7FK2/qM9IeZ63cOrMl2eWkJzXa8IZ9i599kDoaW1/YsyPWv9jkMy+UggCkhX95LyiX8vlYQJxGOR/GMXmoHyen5hi85tDyx544TR7sVw7gsprYl72QScUAwq9tcImydlJdTQr55X9hDyGojLg4BHd+9eZhs0Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735642002; c=relaxed/simple;
	bh=PeqzRnmwAi0xLgYzIk3NedBm/pACjMxFpJJVElERFiw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r1SprPwnv3jSj+xGeuNlljYJHBHfEtSUeZke4FYz04/WwpBNGCUKHjPr3bgzcLTzAL5oRiO1+ISYAFDI3ytKyKcDlyPHtgJTWnnRx3PSoxlc/qBa19geqSzvGGh5p+48FymCyK8kMSdAUaS5tEJ4qVVJZ9GEdWM3+wVwmeZ8T90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gyUKSSa/; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5189105c5f5so5157131e0c.0;
        Tue, 31 Dec 2024 02:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735642000; x=1736246800; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ECrxZWFteGbiA0AVoVEioe8ufF6tpnDyhkcPwnPNfZw=;
        b=gyUKSSa/wRpegtqtmXWjlT6X61LVT5ej49+RZUQz7Q/hGmdjb4B+XJ14Z6SmGcGr8U
         7ZQrkWcekTrC63aZyYGN0sJbb5TvTnE2RONIIH+tLyYgaFKDPftl+xwFYZVQK0LUxbkw
         euXMeZXFE+34o2tD5QaLyDuptw1xxV4Vq1KH3jJF8YQp4wp/86dOPhs3Pi6XzLZyr2db
         IbPgf0zo3YQrhqUrBkT3R9W1NpJU+4scVlXVO8SalsHI8ZtccX4ndLIKG1soy7I7t3mU
         rlBBqjSsM+YWd6EqV97aZtqew0H/vbV1Dk8X5O+d01SW2tUe9cMsapT+4QVxM3dRe7r2
         e7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735642000; x=1736246800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ECrxZWFteGbiA0AVoVEioe8ufF6tpnDyhkcPwnPNfZw=;
        b=O/OuTVfWHejX1UZd7vu89qm+clN5r//I6yb0wGNJ28pZRnSRaYQYYgaZY9j4+iY8Ze
         K//J02ehgrW1+xbm4v4LuqOMiksm1U8aGzKRDXiDW1xVBT899mPyxG3PP8EYRnhZDAoQ
         uAMjdW1NLTNt3pqreQstpip3zX3NUykn1hMY0BFH0Dvz9IwC99MK5BjLx09cGgpetgTw
         rpFu1+7I/DriCsuWVss2Rsw+hQzoH1tZm0Js6igUz/evFwMGmnGLqQwbnQcr7QRe5/cv
         q3hw2aiVlKrW8btCHz4V74VgmI6ZXjxXb1RnUE58uFS0kXiqxkJEA87UPFPy6eejuNWj
         J6sA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ2qEkZpXhhF/bITNaf8VutilRwhIEHzStJ9PchVpL9JG4kNUZgiyiw5jkI2M2qJhre5PWeFiWP9Y=@vger.kernel.org, AJvYcCUecTFoZEpVPIwP9YD7hVHBzl0Ewkr1P9g4dR04wHPdNx0gIjuFMaROllQ1nzfJ8ST37IM/5c1Xr3LVOLDgZ2pZ9Kg=@vger.kernel.org, AJvYcCVkrOer1SzkE7Y+RHSyIUB/Iyny1gJm4JtWOr1d+EqvXY1O31nlLG3wSMUARPBNqFhv/Tkpfqxbl7hngE5Y@vger.kernel.org
X-Gm-Message-State: AOJu0YwwV+ffQ6wI7en8QB6XPmsrxZHRtbl3peq4h2jd8rtXJ1DqSX63
	jD6Tt1Da9HFQVP8ufhMn1sK0gp5mWf8p/PHgDeLHnmf/A1VmLjDwSWtYJBJmF4suS+y3zGFAj+P
	UkhsFlAjhx6kNkVBr0oNdy6DuxSlPIgE+
X-Gm-Gg: ASbGncvBqMeF9jRaJvoziHjnCyLxtmZP18ZTlEhpVb1b2uEr5n3eU5iyoFKheHkN+9d
	ARhN1ZaM9AYeP81gaOiSWH6u9w/mla02s9wVgNFxJ93VGv14cIekh9ereqHC+q4cwXSBf
X-Google-Smtp-Source: AGHT+IFXSvINUea7k4y9Wy4P16DYUslqpiAlCW1qTkPOOoFRk93FuoXHVIQPc79OzjAvkZRDs4pzI7hkvC9e/kbPaQo=
X-Received: by 2002:a05:6122:660a:b0:518:9040:6700 with SMTP id
 71dfb90a1353d-51b75d6b195mr33000356e0c.11.1735642000368; Tue, 31 Dec 2024
 02:46:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241223173708.384108-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241223173708.384108-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVfcqHVkJ3ea=uN7zGAw=ho=gLGVJjFFB_O82C-RTU11Q@mail.gmail.com>
In-Reply-To: <CAMuHMdVfcqHVkJ3ea=uN7zGAw=ho=gLGVJjFFB_O82C-RTU11Q@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 31 Dec 2024 10:46:14 +0000
Message-ID: <CA+V-a8vm-NbJaV6Gu_9SJo=k9QJPYhMtk2-p2+JramfzqFDnjA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] clk: renesas: rzv2h: Simplify BUS_MSTOP macros and
 field extraction
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Fri, Dec 27, 2024 at 2:33=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, Dec 23, 2024 at 6:37=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Replace manual bit manipulation in `BUS_MSTOP` with `FIELD_PREP_CONST` =
and
> > `FIELD_GET` macros for better clarity and maintainability. Introduce
> > explicit masks (`BUS_MSTOP_IDX_MASK`, `BUS_MSTOP_BITS_MASK`) to improve
> > readability.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
> > @@ -582,8 +582,8 @@ static struct rzv2h_mstop
> >         if (!mstop)
> >                 return NULL;
> >
> > -       mstop->idx =3D (mstop_data >> 16) & 0xffff;
> > -       mstop->mask =3D mstop_data & 0xffff;
> > +       mstop->idx =3D FIELD_GET(BUS_MSTOP_IDX_MASK, (mstop_data));
> > +       mstop->mask =3D FIELD_GET(BUS_MSTOP_BITS_MASK, (mstop_data));
>
> Nit: no need for the parentheses around mstop_data.
>
Agreed, I'll get rid of it in the next version.

Cheers,
Prabhakar

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
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

