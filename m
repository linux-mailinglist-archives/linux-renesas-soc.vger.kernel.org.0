Return-Path: <linux-renesas-soc+bounces-26399-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF3FD02182
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 11:21:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A16F3010A83
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 10:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D84883B95E7;
	Thu,  8 Jan 2026 10:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hdYgb6tY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF2E3AEF5B
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 10:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767867241; cv=none; b=aOgQIBFOYLuxM56sHhzp8SWlo8bPkwzlxIr6vScPNyjZ7ktOpKw8z0zgUUF8V/4W32f5BikXvB80Zo56FJEmw/mchapeI7lUXOTsa8W73X7mE1LnqRD04a8ZYFWXoTpQJyeULHmTMeaXDHgJ7S0lgmjGz/BmyszcuoD0v8RJvio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767867241; c=relaxed/simple;
	bh=sXoW4mVTyRQzIbKcvvJZzwtyNNh7crECPosOAqfEHSI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rxuG5qFryg5HlPgnN0hNyBMOwD9Mu6tmjnAVtQb7GVaBhGa+DRNg8HdgbfvbuO7aNUzCjwN3rl2UPeARkrVSE9t/ibFsWN8xLd223bDFw+IFEmz0Dhh36IAFpeZWTLfUYSlnFf4hWdX20YqnDISzwhxEb+KZclTD7PCJ6MMBOIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hdYgb6tY; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47d1d8a49f5so20042125e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 02:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767867237; x=1768472037; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhDPeXMLOmbhNZMmayEqn2Xyh0RUQfbS2x0SaXmYylI=;
        b=hdYgb6tYe8y13ML2C51MbA7pxqTImRwxAl3Jv+1dG009POEsUfy6fjaCiMdC3wpJ7k
         ABHjdEhOMxn41RQEnNsblqclCJGl6wtqDf+/kfWGZpwFIBhZPGmjnsA/gnu/IWlLhmK4
         SBas7yMPZaGbv1y1Gn49VPQNckLLkVELo2jKXGOUIecdhoMsxjyElDAoUH+44PwjmbWa
         W4YMUGCa0wPaTX7PRB182RCQQ2RTf5kXmT0lXRDbeXNV8I5w9wY20Oqdi1SFeleUWW7Y
         vyHjhg2rmkVwt7gd/SPShNZpWF5WJBoho3VmpCw3isJRKMO6ucEPjDovdQWocGEUB7d3
         oR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767867237; x=1768472037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qhDPeXMLOmbhNZMmayEqn2Xyh0RUQfbS2x0SaXmYylI=;
        b=SSq8mxPpcQiZHe4UkdA2bAMyffeei4N2Nfim1bS9GTd5Yy6IzuG+hptCj+bRFCbXi6
         L9hbi4nQFSbsE0VzPrd5k5Z8+pc2bigAR/bMdly/m0zIJTQRwP7I+MG8atz2QiDfGOaS
         ZniB6omZq63kcZG8a6f3b5PZMREn2dV/NFQHI4/J7hnDNuqt2TbN93mTdO9TFw/6mxZm
         kNufqDVcGG+Igsa8/0vXdjPBFKZAfrg+CgwOnTjImZS3masx4qlS2ign61+VKVOriJg9
         C1BfP+tJIl8dT34NolQ9Ee3NZw8WXqXkva9Flq/mOFOITonbdsbBgZnz8eE9QUlcmIEd
         ZQMw==
X-Forwarded-Encrypted: i=1; AJvYcCXB2s+VnyynqAzuSbCbcN/j5enLg7qNnh8vng017ohMXsI6LYGBmUjZPT2WYhOoqxnhKyWJUrbEKaUu1M0Cvjen5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiQQLVNneCnalykMuFUrK1AoPBYV0pgcSXIjc00LPtHHzzj+28
	jFY3SBnBeJKjOn7jsV/DobDaZ+VXGgET5z3X9xusidUE2i15UBArKJgue19Pg0WSyZi9uQAVBKI
	eHuhPJwIGRM+ERggBxDbD2Jxgt2GqK2Y=
X-Gm-Gg: AY/fxX7tZtghE7/jHNzKcGAZMtKLS+qHIfnKE5prbYSSoUUEsiOQRCctyWKkpngRrS+
	GxGY3kk0n8HaFmAzfup7XFIBgX8CTVIwjxKGd5U8OHGwwFf4qivRngho2ez0ZFtcGD0+T/b1FTE
	WhOpxifJWQ8Z7lODnUxaEHUXrITL2dqfsi2h0KPuQcTSg4OjEZV9fyzpb7PxGNrXENGLaAXWXUV
	96OUv7RfTGdHHH4J4pLkHmhChVFd1MQ0hT6jrDbIBlZqCLxtOOvr25IIt5tWMmosj4epMBbCWm9
	2GoMT+e4CQ30tPlxwnLJcBjFJK8a63jhFZ8AE97gqpo8tC4M8h615e+B4w==
X-Google-Smtp-Source: AGHT+IFP0dUQJo6LOh2kBlHH57wWlfc/4287ppA81OjmXtNFTh6Sm1IDnpOcmlyPE+R331Nvt9CzRNqdOsB9pumwoec=
X-Received: by 2002:a05:6000:40dc:b0:432:5bf9:cf2e with SMTP id
 ffacd0b85a97d-432c377298amr7420571f8f.13.1767867236499; Thu, 08 Jan 2026
 02:13:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251230115814.53536-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251230115814.53536-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdX5_TkFmgqv29Nddo4bZzEWQrL87kwqTdiLwfq+qMtsXg@mail.gmail.com>
In-Reply-To: <CAMuHMdX5_TkFmgqv29Nddo4bZzEWQrL87kwqTdiLwfq+qMtsXg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 8 Jan 2026 10:13:30 +0000
X-Gm-Features: AQt7F2pfXBaU0qS8scxlI8e3JZryt-q1cuaCgkd0suVDe9HGuILaVv9inKd0-_U
Message-ID: <CA+V-a8to1W2xbA7LpzLa5RSy02hyUFG0AeDR4iSsj7jt36VKVQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] can: rcar_canfd: Add RZ/T2H support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, Jan 7, 2026 at 4:37=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 30 Dec 2025 at 12:58, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The CAN-FD IP on the RZ/T2H SoC is similar to R-Car Gen4, but differs i=
n
> > the AFLPN and CFTML bits and supports two channels with eight interrupt=
s.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> LGTM, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> However, compared to other SoCs, CFDCnNCFG.NSJW[6:0] has:
>
>     0x00: Setting prohibited
>
Sharp eye!

> Perhaps this is a documentation issue, as the same limitation was
> dropped in RZ/V2H Hardware User Manual Rev.1.30?
> Linux also has no can_bittiming_const.sjw_min field.
>
I've notified the HW team to get it clarified.

Cheers,
Prabhakar

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

