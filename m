Return-Path: <linux-renesas-soc+bounces-26406-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D1DD030BF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 14:32:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1160A301519A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 13:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B709644E038;
	Thu,  8 Jan 2026 10:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxnBbT8k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977663EF0D5
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 10:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767868479; cv=none; b=PqBd0eKzRIZfpQ4sQZy0NPmaqHjx16qbLTLiYzwUZQojBaKsdheRSPugwODSmQiKJGQPwFHgMUmNR7+QiuzbDroVE65r9XtehjG7qlei9TEgiwNXHCM377siM3KkB6UkodXMHFiOUY7WmRXZxXgaDwHe0fKOlblx+E1GJXJCw6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767868479; c=relaxed/simple;
	bh=8J95CUqGQzbNe9RQYZIjmFvxGxZyyAKIOnUoA40FzOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dbk7NXkskf7eIX2r5YC4ygP/oay5J0SEOHH9CTrpVeSL7BhN2GAwGpeCQqYi+xVNDPZtMssHooOPzlI4vJyYVgvHLELrssqfOO8oNFypKsmAx2mh55XhwF+DjsRQY1sG/2iClAbYmo46sTpUhRBuy+ETw3mPDu7ulMsWmdkdADA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kxnBbT8k; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-430f9ffd4e8so808573f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 02:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767868473; x=1768473273; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WAy6hcda2ByjMGo0ZNUpa3upflcaSQJbAAFWGQO0oJA=;
        b=kxnBbT8kAbFH7DMm/Lu6qn+KElqC5IMDTQ+sGAqkY60m1yFk05kzfZu/h+kNpgNAQR
         KAd0p/e6UlvOWfMi8J1K4HZZz2Pfp814/S6/8MM2YpXtQThCyAs8yZ540JYxzl3ttReg
         F09NrV8OVc7pF1/9Tat8JyIgw9/5c/zhb3DKLtHTcuJtW1GZmtM74XQ0EPINd7LlXcNz
         7Sp2EdOh5YVWVRfUy8I3KQYp2ijfifaR2EDXBgbJQ8DfBS7Qetexu2UPi4YSmXeVj6S3
         14arHjjewtMUIOnjvv1wU30temYpSPCRlNIUcVXWzb6Mw0WiBkyLLihUk1AH7xb8ZOqW
         d8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767868473; x=1768473273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WAy6hcda2ByjMGo0ZNUpa3upflcaSQJbAAFWGQO0oJA=;
        b=nkXSmlHTkXD215u/yrrtctDbHS+e0Oflys/wfR6+a60LIji72k/yiv9/ruaLKULAf9
         8lJg082Q32iDoBwKEnTubQJZe1bHq5cHLF/FvC5j8wvYPfv8GByZQusNHN7OrWB6Lpfy
         IfVXLcZqLhuJNCszR7DBX6Px7VjZOJ3mVJUpbBB1rhZwpAvyrwScMcIeFBmwpqbBvxx0
         qTlr7ks5/dslhToetvD/7wF2MI5dAmSHdw2ea0OoOi6IAOhFscwZYnC0JrWWNhezeMSl
         bwWLvt9wDeuKmbdquqUGv1fHsL+Re84eN84VzRq0TLKBpeQSQY03O/kF3KKyTyHx1U9E
         FsdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmmdQu7PxIJgGrMT3Z9YLSnAAiObqQPZoHaMDBUdXrr2UdcG1hZtlznnhyw16WXpNla6I7PFB91Uh1k+plaipIIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yybu1wITDmVheTe6OiOrmyYjikMa4DoiV4II1J/gAW6Jb2N6WlF
	n0OTlxRJfAh8JV/9YF58olrXldVkVjaMoG9MmLcYkiUKYJy89eOChm+Yo/6h29EySAwyVZgxKTE
	6OBFZNnWE/0Pic8D/HnfG9nzI+18G3IM=
X-Gm-Gg: AY/fxX7xvBb6nhult00ckvV9zqBbp0xNGxpWrvdBUHA7bm60Liy8Pi85ugO/OxS02Ms
	vzsY31HRu8HoeRuZ102Qc0GvgLaNJHyv7dWNadQxVANs/S8EpQOrr4jr5H4cVDKqi1l3VkeFIpm
	/HCVEwCC2tSBaWLuKFAaoZ9MOrSD9w3lQPLiaQq0iwekQ66loJS4p3/plk2wt5muP+Z0ZPOXE9O
	J+77/P6ATaqYMZAtKLqIvc8LGqZ09xRwe1dCzpKkilugaaaoQ0HlVCZhAkDF1oP8cxH5db2PZn9
	MRihWbbi2O81FBayDz5tkIoVDyaublG1DHa6YD8FqRBgXy64xYL8DOIL/fejmJrNq6cjtYGwsZK
	p3WbehLppzkFlIg==
X-Google-Smtp-Source: AGHT+IG/lLLmJ7tqQ48LbhbdSS6ekHFjJMW9NFEvYoJ3mgIa0icSTmZLc9yjQbv317Rt2eLWoD8wp+yF3Smx93c39Uw=
X-Received: by 2002:a05:6000:430d:b0:430:fdbe:cc4f with SMTP id
 ffacd0b85a97d-432bcfad0e3mr12151914f8f.13.1767868473270; Thu, 08 Jan 2026
 02:34:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251230115814.53536-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251230115814.53536-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdX5_TkFmgqv29Nddo4bZzEWQrL87kwqTdiLwfq+qMtsXg@mail.gmail.com>
 <CA+V-a8to1W2xbA7LpzLa5RSy02hyUFG0AeDR4iSsj7jt36VKVQ@mail.gmail.com> <CAMuHMdUe6gkbgQj7cjeZ5w2Mn_HPDwiuh5yEp8nQEE-vQPLqQg@mail.gmail.com>
In-Reply-To: <CAMuHMdUe6gkbgQj7cjeZ5w2Mn_HPDwiuh5yEp8nQEE-vQPLqQg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 8 Jan 2026 10:34:07 +0000
X-Gm-Features: AQt7F2qYwu7k2jqryxnQQ1-oDkkg98jFJTRBpMxesBcsc9xHPBIinmS0EUGvnI8
Message-ID: <CA+V-a8t+R3bfMJ2JY7NsGcX9b-tgz-aBkHrt7bF2Lh7eiyeniA@mail.gmail.com>
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

On Thu, Jan 8, 2026 at 10:21=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 8 Jan 2026 at 11:13, Lad, Prabhakar <prabhakar.csengg@gmail.com> =
wrote:
> > On Wed, Jan 7, 2026 at 4:37=E2=80=AFPM Geert Uytterhoeven <geert@linux-=
m68k.org> wrote:
> > > On Tue, 30 Dec 2025 at 12:58, Prabhakar <prabhakar.csengg@gmail.com> =
wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > The CAN-FD IP on the RZ/T2H SoC is similar to R-Car Gen4, but diffe=
rs in
> > > > the AFLPN and CFTML bits and supports two channels with eight inter=
rupts.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > >
> > > Thanks for your patch!
> > >
> > > LGTM, so
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > However, compared to other SoCs, CFDCnNCFG.NSJW[6:0] has:
> > >
> > >     0x00: Setting prohibited
> > >
> > Sharp eye!
>
> I knew what I had to look for ;-)
>
;-)

> This one was indeed hard to compare with other SoCs, as the structure
> is completely different. For e.g. RZ/V2H and RZ/G3E, I could just use
> diffpdf, restricted to the pages I am interested in.
>
Yes, the T2H manual is different as compared to G3E/V2H.

> Still need to enhance diffpdf with shift up/down buttons, so I don't
> have to adjust the page numbers manually when a few lines are suddenly
> moved to a new page...
diffpdf was insightful, I wasn't aware such a tool existed this will
be quite handy. Thank you for the pointer.

Cheers,
Prabhakar

