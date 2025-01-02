Return-Path: <linux-renesas-soc+bounces-11768-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6195A9FF761
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2025 10:28:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88CE07A01B1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2025 09:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A67F190067;
	Thu,  2 Jan 2025 09:28:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986E717996;
	Thu,  2 Jan 2025 09:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735810117; cv=none; b=leGL6cRWpg1NmG1vBFclMXNk9PzvUCz7/IK77ZTIBHM/EqLW/ydscCCc4bbA1YYUhNDtyK8l2EOAgX8qYWN3A/TfwubB/Iew+EXmGi3Yp/Lrz8E6O5nIpZ+H3UpigykogTpPHsWNNKAAUBq0a4+CZE7H4qjq/VjfPEw7Uqw/Vw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735810117; c=relaxed/simple;
	bh=e/9IkOVOwkblv19UJI7o/yWtEFBb1YnJ0LzcZiHBw2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ed8lwgAinm2L/Xx4IkgwFtDGyrnonAEC9fO1xiXHbtD2Qt5i695jXLtS5ORD2CLQl3FBJkmHGbOdgDcwDfRCH8ynZAFD/FDhFtKZbZ7i/tAh0N7tJap6l/+OcLZjJWyjFjAzdruRciq/UB7PwzT1pfGv0bL4D3JB0UH0z+0Xopg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-860f0e91121so6285313241.0;
        Thu, 02 Jan 2025 01:28:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735810114; x=1736414914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fy4MplfV+og+W/GGufNnlxz4RMQ0TqsPXU7LAAw3hCo=;
        b=CP66PXRuuQGzUxfcVHQWYaBrXpTzFC7RqN9DEgsryucQuTjbkSQKFMeIkBaJQWBZlc
         DzjPmBy66lcuBNdPTRkWZmSrVs+lx+Z2qAx3l5EF6It64FZq/irvIKCSjsoRHYRMGFGX
         MthJuq68M/wFrlZe8HrxX0oIwAnBsDKz2LDMBgFWBFvPyj7mUw5P9hjBrZQOSfD++zfN
         cYfB8aTx6is12dM6TKof+WVxMEYIGLIokUPyMFmVaoC2/2BAS5LsVs2/GGZVbmgYPgks
         OfcPWBDFltwlW9DgmDnBAAClgaY3lZ1dsWQ7z2iuCFV2MZPFJvjvDzN5TGpbxxIOqr44
         QJRw==
X-Forwarded-Encrypted: i=1; AJvYcCV3xcO09yjsnk6A3FA3FBTQHCfCtrLVvsZHCNF8bepLooYsNOszI5R8OK4WXBNcbbjL89+QL50vOBhPpRDSO+KJHC0=@vger.kernel.org, AJvYcCW0IWvNe8DTmM3u5mL01jhYwDQOUPAbHWrJ/UMMBGIo3ko8ZAhzal4JLDXy+ayftumVz8Y4DvmjLXr0vO8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIBczLyPJEBqvgJmfP1Qt65Pe3/3mkRh3lAZslgZbMXr+0fooU
	KYFQqtO4p+AAbAyFmVdbYbc/fLEsgypUiDwT4A0/YTx2s8BFal7MLgDl3rJu
X-Gm-Gg: ASbGncshqi8EF3p5mPl/0rLrfkfh9SL9h26cPLxW3blbEpTQEODHjoUZGkGrvhT/Vli
	UXm3e8piG6GSEvJkjNDdH1TFjSmdGLqzF4FtAxTf8/ybw5S5/2BkdMITdc7BfJnxrVs/q07k93a
	qiOH43tuKQGcLwJQvjwN8K71vK0kVxvCkSHm5tzRf5wvOUpZOUQZPqDpNvWATTj151fwKofev73
	9dv6WIgGifuBws1wQF/lVVhgwBeXqduGEpMYjziqA7Hy11ANuCM2ybN/NIMmarA98WGB1at+Eoq
	MCi6KAhYy5wiFom6C3U=
X-Google-Smtp-Source: AGHT+IHTwNLnoNQ67WWzOmRYG1MtRyHs0R4PDdJ3YShj+FeUGHdxttBrS0wS/Lm4fuLYnrnmZLcM1g==
X-Received: by 2002:a05:6102:498:b0:4b2:bcae:a721 with SMTP id ada2fe7eead31-4b2bcaea8b3mr34642413137.11.1735810114228;
        Thu, 02 Jan 2025 01:28:34 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ac4baa9sm5138599241.9.2025.01.02.01.28.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 01:28:33 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4afe6a8d2e1so5916303137.1;
        Thu, 02 Jan 2025 01:28:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV0pwoGVqmKWMNAlzoOlt4viE5NvFrvkEipjRfOcTNkAjxXFe2zn/AdMNK914o12YyB6Q+ob60Q3LwS+/2wNx+NPc4=@vger.kernel.org, AJvYcCVCG+d6TqbvzuTit8qun+bIYZmtJ8R7qmQ744H2rsF4LD5vQzNd/uGqwFnjTiJr4cyKTPDe383eP31e5fQ=@vger.kernel.org
X-Received: by 2002:a67:ebd5:0:b0:4b2:bc6b:c73c with SMTP id
 ada2fe7eead31-4b2bc6bc807mr30504193137.6.1735810113772; Thu, 02 Jan 2025
 01:28:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
 <20241229101234.2896-6-wsa+renesas@sang-engineering.com> <CAMuHMdWSQvyLwHyci+WVtTj4rGeR-hkjw1ap52=5X29ZzVchSA@mail.gmail.com>
 <Z3ZWt0Whyppr6GKX@shikoro>
In-Reply-To: <Z3ZWt0Whyppr6GKX@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Jan 2025 10:28:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWTUwtVFV0o-Hsxp+eTscHHuzOmnBjv7BPoK8moQ7i9Qg@mail.gmail.com>
Message-ID: <CAMuHMdWTUwtVFV0o-Hsxp+eTscHHuzOmnBjv7BPoK8moQ7i9Qg@mail.gmail.com>
Subject: Re: [PATCH RFT v2 5/5] i3c: cdns: use get_parity8 helper instead of
 open coding it
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, =?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Thu, Jan 2, 2025 at 10:04=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > >         /* RR0[0] =3D ~XOR(addr[6:0]) */
> > > -       if (!(hweight8(addr & 0x7f) & 1))
> > > -               ret |=3D 1;
> > > +       ret |=3D parity8(addr & 0x7f) ? 0 : BIT(0);
> >
> > Perhaps keep the if()-construct, to better match the example in the
> > documentation in 1/5?
>
> Can do, don't care super much. I chose this construct because the other
> drivers in I3C use the above pattern. You still like the if() better?

Let's add more bike-shedding in 2025 ;-)

There's also a general dislike for the ternary operator (BTW, I do
agree it has its uses), especially if one of the paths is a no-op,
like ORing with zero.

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

