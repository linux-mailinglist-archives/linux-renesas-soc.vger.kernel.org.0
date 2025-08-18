Return-Path: <linux-renesas-soc+bounces-20627-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73203B2A7D3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 15:57:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 593661BA2D7A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 13:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7C51D88D7;
	Mon, 18 Aug 2025 13:43:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1822A335BCB;
	Mon, 18 Aug 2025 13:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755524610; cv=none; b=YsEmkd6aau/9i3F4PyAjbrVpZg44EO54LBnsAZFfBd/B2rXOXqm8jTqFrxI/3DUETFFhaL1GaMyXCk5ZLDLQgqVE9rFPw4i0ZWV07+P5izITiKVdAhGNagbyFl/0e/sW5IV0oBw7xRzR+CKtcIVCuzQ6fb0nv5rsfK0XXDVvjgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755524610; c=relaxed/simple;
	bh=xd6byd9gl8D3GQltTrW+eqkNmCOmcacxF0r9OGp+yj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ROrIAzWhMVcWSBb8NMKuymlXWgBCeyGijt/gYnHU8lJx8IGRixYVsc+uHIXzfDviDPKMa60Hdo+emqmZKhSOeWwed1Ujxwy8FeQsKygfQZujF/EYiZHcrJmXFmTk54ul9t2SVzEU3dST6nTurfdR2m8ibYaqs0lUv3/mzJfXTnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-890190bee8bso2553456241.2;
        Mon, 18 Aug 2025 06:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755524607; x=1756129407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=34HFEWnAnGFYwqsI/6LLj6dpbgFrm7oIFiaBaO3B038=;
        b=iKYnq3nMMfck/wcc1oPXES1DdpicMdJYK1tT/DYdFRPuz2GP0LQSGjR2uUxwcsAgAD
         RoNHTLQUvusJv1f29UgRge+2WECbozgC2PnLPbvYDvaIfjMKtwUZTZH/nyJKFgEjl51D
         soIGg665jWrI/u3uQToDFK9OWqdvXZ3WJdle+8/VkYbgya/ycz6YIezXjSejlIBx2S2D
         5SbfvdqLtxLz6f6Onh02/pooFfh2e7LK4yGhOoWTvu9gaDH3QO9Jfw61k9r401TOOQaX
         Gco4ET8oiVZ9vL7R4kGw/pF5nM6cpQbMc/XcPoytCRhCsnE7WcYzzSS+KtRW9kHPeqde
         MXxg==
X-Forwarded-Encrypted: i=1; AJvYcCWckRqA9gUtbEYG89ZOW2XKTUL5QQR1wHAA+SpbDEmJf+eVsEha1ejY7THv0KFeJfZU0F8U4o3EhfnQTLQe@vger.kernel.org, AJvYcCWw0fDFJeQi9M3/C4z/DAGJMbpj5ADIJdl3IFqVtvfTnKoq2YhUzwzGZJZkl9zCeBAp3NDTg0ZTqUs2@vger.kernel.org, AJvYcCXWd0DdGE0tWo40Sol70HRlCrbwKqJuwteqIRCIeoK7bRBOlZCvaiBKsb9DbFNEIH//djhihjq5Cx9lc4M/yOGThO4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDPnDecHl4MYrCOgj69ovZ9uvVj426oumPxBHg0UPfdsVG+51q
	6p3XOIqXBeSxF9XBr8Bc1ntUBzWxFEyVNV2enlgUXkPdifwMr6ERqdiSwc9tU3jG
X-Gm-Gg: ASbGnctyRYSQrP4vxNiPyljTB9CLh5FDiuzzMddriek6yVCdANtDjivs8v6EZfUqU7X
	ymCrH5dON0brOKGA6srjrhvWAiDabhjTP5rGM/F4lhIkQ/ZX4RRL3L6FAjWUL6x7P+PfIfxGS9H
	0icm8x2wjJczSxDu4XR8OYVZBBcUPFao8zcDJBIJmnP2VAms5qP9ErbCN+i6I/RQXlcNrT75zw9
	5I2jybdoXQN5XuZM3cHRPKLYGsFh+SPJAvaHVPEEqb3bLcZYrZqI/+N9QG0sQNExRW89670oF0y
	Mxh/tkC0rwo2Z8m7OKOdMAlPQAKJBb0efoKMbwatYftUAHVS64wuAaeDa7jqOl7KUVrAt+eZS68
	gck36KUhfKEh9dWSwKBCDBw5JXkeZzEwVYxv0+m4CrCDc5yR6BdVDElo5aM2P
X-Google-Smtp-Source: AGHT+IFDO4qJm0w0B/ZWzO2lS7gtwMz8tnDpl0kx2NkAgNk7xWUa8CIdjhHLPYgXMPvKl4s+pWjRFw==
X-Received: by 2002:a05:6102:41a1:b0:4fa:e005:cb20 with SMTP id ada2fe7eead31-514c8b6839amr3585987137.3.1755524607542;
        Mon, 18 Aug 2025 06:43:27 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-890277bf4c4sm1768928241.2.2025.08.18.06.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 06:43:27 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-50f8ba4d2f2so1570058137.3;
        Mon, 18 Aug 2025 06:43:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVAfspkhW991AIkkprU6SH0bpaM6ILkoVa/O8oSXlo1kM/Ta3hpPl3Iz1vgpDsLB3C+VExG8LSFJ5iNJN7Unz8gnGY=@vger.kernel.org, AJvYcCW3ZtjOob+Y0oNJfMynIL6/wpUZPUuZ28PfWUCYF91x+f+eBPDmkwmMy6Tok5bxx+X8LpUXvduX01l6KDt8@vger.kernel.org, AJvYcCXrb++v15cR5bB8QnGaPEk3yjlkTUVTti69sjjWuUCZeYnlx0vlpJreXkHIbejx9+Q8r7jML3r46buz@vger.kernel.org
X-Received: by 2002:a05:6102:508f:b0:4e6:a33d:9925 with SMTP id
 ada2fe7eead31-517a237b8c4mr1025399137.5.1755524606962; Mon, 18 Aug 2025
 06:43:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250812200344.3253781-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVi26AXwQJDtxSp8hSsmZ1Lx4_GYFsbtmq_gxJyddkqTg@mail.gmail.com> <CA+V-a8vsQv4jJ4x1rVkeyfg28_RvVtAbnbHtm+RTTMHT_s-YzQ@mail.gmail.com>
In-Reply-To: <CA+V-a8vsQv4jJ4x1rVkeyfg28_RvVtAbnbHtm+RTTMHT_s-YzQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Aug 2025 15:43:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXTrhOg9EQ+WPqHzQKssJ32BAV2GM0vO_1iKXDD63V5LQ@mail.gmail.com>
X-Gm-Features: Ac12FXzWy-rBfxhXM66qOzhr9jU8hweBN7mmn8pN6i5_HoyIbeBrPnpeYhFhjbM
Message-ID: <CAMuHMdXTrhOg9EQ+WPqHzQKssJ32BAV2GM0vO_1iKXDD63V5LQ@mail.gmail.com>
Subject: Re: [PATCH 05/13] arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Add
 user LEDs
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Mon, 18 Aug 2025 at 15:40, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Mon, Aug 18, 2025 at 2:15=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Tue, 12 Aug 2025 at 22:03, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add USER LED0-LED8, which are available on RZ/T2H EVK.
> >
> > According to the schematics, only the first four are user LEDs?
> >
> As per [0] user manual Table 7-4, LEDs4-8 can be used as USER LEDs or
> for Ethercat Slave. Since ESC is not enabled I haven't added any
> #ifdefs.

OK

> [0] https://www.renesas.com/en/document/mat/rzt2h-evaluation-board-kit-us=
ers-manual?r=3D25567073
>
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > > --- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> > > +++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts

> Perhaps I'll have LED_FUNCTION_DEBUG for LEDs4-8 as currently they are
> used as USER LEDs and  function-enumerator =3D 4/5/6/7?

That sounds fine, thanks!

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

