Return-Path: <linux-renesas-soc+bounces-10283-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 662069BB643
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2024 14:36:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E054283B31
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2024 13:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E775433A4;
	Mon,  4 Nov 2024 13:34:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B881CD1F;
	Mon,  4 Nov 2024 13:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730727257; cv=none; b=Djh8KRKNfDNKAfrPj7kE6g/QhfV690J/j+iOWxQcpn8nic5oA6PaslztlDDc+zcOEbhbkK5xZ+9kH5J5jS+EU6NzagzGl9vvVlktd5zECsxVpGw6kBIujDuMJbY8k4AVEOPZQ6yeu/Sz/ZyJC20QmC/UnmqcUomWnJ/pdMA34sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730727257; c=relaxed/simple;
	bh=XmXYw6RrLQ3a3/X8FTlqFJFX68ul7wsZuBA7DQCuNvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HAcTJ2xzF0HvtvW9dh5YeqhzJGs6OiYfo30CnCzToW7t0pj0/a/GiaOtju4b7Nv4ZOpdGZTzVmcDQHI5OctrxD5RyWsD2fsEy8cWeAYz8GAxuEHn8F3b3nqXppRHJbg/FodU4PTi5Qn1VlM+JBcOxU+N+uebMSzwFqW5Jnd8GAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6ea0b25695dso32980947b3.2;
        Mon, 04 Nov 2024 05:34:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730727253; x=1731332053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ICXWnlOb8EHMCdZ7pVFvRDFwjWsJuSEHx1eFi7sR6n8=;
        b=GHusjSgIL2cz75AQ6NRgZQ2qA7ijrPQrrqR4V71c8emWQvvILDRCoBuIXVdL8xleD9
         vu1ji6Mecmjch0VDNjfEguW/DCfABroMW7Un1D9GG3mXu0JraePo8q64L5O5N2uU2Rj8
         rLlxQD6gIFNmdHng6/BFHa2ofKsBEpH4a1DJP1WFbCb2RoA2ejaT7JCZ6aAixGCG4TZG
         c1Q5v8gb592XEfqhJz6RuVDfNb5alTdlKPWvWdqoHR8nml2+Gxf0AjT2edbt9sOZtjVg
         MYWOM7wemtlJhS8RGH8y/Per685yEckq/y5lW58MdxZbvURtLU+4pmH8/OPx1kLn+zHG
         YLzA==
X-Forwarded-Encrypted: i=1; AJvYcCUjCsI+Nk2VLJGXe7B/X6YlQ037rmLg/6Evnd7hRZJlhw+kIirqwSV3iPulY0Gfo0PasVPWeZarUJ8=@vger.kernel.org, AJvYcCVxqxqhopfDhNWVVWgnUhujtcKy+GyX4HKEt6m44DZwOo/iuyu8zXkErntL+l9l8wNgesuGhGVfvyw=@vger.kernel.org, AJvYcCWYiiC5crjScJ8QNHyq4PeHBmmMUuZXARl4j6BWKeFo33SI/ffjOfWdyKiZAMG9YKAxTWjeHOZ/t9pbQjJgputzcQ8=@vger.kernel.org, AJvYcCWq5xGw7l7R0F6FPZQ9ItVbfYW2EkiXQbfX5vd0bmnT/mFy2rH7LKubSp1ei/0ZCj4D8gVRSRdXIbJi12+O@vger.kernel.org, AJvYcCXPvhfWWAShv7iZQEr+cY8ziaX52JZX06edz6Lb64zpRyBFpqQQCZPyj4E+YrKZ3cf9t6aYaTyz@vger.kernel.org
X-Gm-Message-State: AOJu0YwmkKSIZ1vl0+UqPwKjHYRw7LNnnkh3qIDpdOniJHbzGuZXpe1N
	rf5I4dBzDArRZYhE0VyQMzEhhKQkA/Ow4E5XxtxHIshqhBLlytv+KJwhG3KV
X-Google-Smtp-Source: AGHT+IFvdZ3Y3/uygfVJNNX/pu37Mb5hwxjrDaF2FDvU7vorala9rwqXhj/0PsU0+s0r7X1WQ0goqA==
X-Received: by 2002:a05:690c:620a:b0:6ea:85ee:b5e3 with SMTP id 00721157ae682-6ea85eec048mr49306017b3.5.1730727253213;
        Mon, 04 Nov 2024 05:34:13 -0800 (PST)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55b10748sm17910627b3.32.2024.11.04.05.34.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 05:34:12 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6ea0b25695dso32980387b3.2;
        Mon, 04 Nov 2024 05:34:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUDTkKpj6gyTzvDRRZFczmlQYAqC6z2kS84b9bJNrfXkI9uXZblWDXTQMTI1F5utJx9bpxNilgM@vger.kernel.org, AJvYcCUhVMvLQVou4TJhNstA1+zPeIrJ9NNtLhZbFG89mLVNd8rko9OFGc3iiYz1K9Xtsrex7G0bm8DKxLoT9+LINAIfBF8=@vger.kernel.org, AJvYcCVXRA/KbOp/i7fjysGRVIstXiLeJa9PpZ9+f5s4l4fB+elWb0plxQRoZFGWUh1BbECH4MG2ypZwe4N6kx1n@vger.kernel.org, AJvYcCVkmxUmITZNhSbn8V1V2zswUkAEpThPPpMpWhtL2r0AYqxo5MyxCgBaIj50r2O4ins6Ly59HPFWz/I=@vger.kernel.org, AJvYcCVwlKMV+yP2a+EK7bZPmHZ00EemAVrxwTvTA4CXtf7S/y/0F0rHMLAS45dB7Y/3wIMKLbAkoXI2eG4=@vger.kernel.org
X-Received: by 2002:a05:690c:dd3:b0:6e2:3f8c:8fe2 with SMTP id
 00721157ae682-6e9d88ea600mr193765787b3.4.1730727251574; Mon, 04 Nov 2024
 05:34:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <90447fa332b6f73bffcb486ccfe2515c59546253.1730717649.git.geert+renesas@glider.be>
 <20241104114007.GA1412590@ragnatech.se>
In-Reply-To: <20241104114007.GA1412590@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Nov 2024 14:33:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW49dFp=-HDC4w8peQA+8phbJOsJZLE1OJtJ6tpTmAuLA@mail.gmail.com>
Message-ID: <CAMuHMdW49dFp=-HDC4w8peQA+8phbJOsJZLE1OJtJ6tpTmAuLA@mail.gmail.com>
Subject: Re: [PATCH/RFC v2] MAINTAINERS: Re-add cancelled Renesas driver sections
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Paul Barker <paul.barker.ct@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Arnd Bergmann <arnd@arndb.de>, 
	Sergei Shtylyov <sergei.shtylyov@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-ide@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Mon, Nov 4, 2024 at 12:40=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2024-11-04 12:05:07 +0100, Geert Uytterhoeven wrote:
> > Removing full driver sections also removed mailing list entries, causin=
g
> > submitters of future patches to forget CCing these mailing lists.
> >
> > Hence re-add the sections for the Renesas Ethernet AVB, R-Car SATA, and
> > SuperH Ethernet drivers.  Add people who volunteered to maintain these
> > drivers (thanks a lot!).
> >
> > Fixes: 6e90b675cf942e50 ("MAINTAINERS: Remove some entries due to vario=
us compliance requirements.")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Reviewed-by: Simon Horman <horms@kernel.org>
> > Acked-by: Niklas Cassel <cassel@kernel.org>
> > ---
> > To be applied to renesas-fixes for v6.12 after v6.12-rc7, unless a
> > better solution is found.
> >
> > v2:
> >   - Add Acked-by, Reviewed-by,
> >   - Add M:-entries.
> > ---
> >  MAINTAINERS | 28 ++++++++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 13f4c23281f89332..b04d678240e80ec9 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -19578,6 +19578,16 @@ S:   Supported
> >  F:   Documentation/devicetree/bindings/i2c/renesas,iic-emev2.yaml
> >  F:   drivers/i2c/busses/i2c-emev2.c
> >
> > +RENESAS ETHERNET AVB DRIVER
> > +M:   Paul Barker <paul.barker.ct@bp.renesas.com>
> > +M:   Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
>
> I'm happy to look after the RAVB driver together with Paul. However
> please don't add my +renesas tag email for new entries in the
> MAINTAINERS file.
>
> With this fixed for RAVB and SUPERH ETHERNET,
>
> Acked-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

Thank you, I will make that change.
Are you OK with marking both entries "S: Supported"?

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

