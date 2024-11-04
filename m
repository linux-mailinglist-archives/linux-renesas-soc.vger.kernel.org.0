Return-Path: <linux-renesas-soc+bounces-10277-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 727E09BB49E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2024 13:24:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 383A6281CE7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2024 12:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 676411B394F;
	Mon,  4 Nov 2024 12:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MAsqbXoj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D675F1B0F2B;
	Mon,  4 Nov 2024 12:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730723083; cv=none; b=FLk97VA1BZgipqpvLHdLcXcsDB5dGph6fsMYOc/xBJ4MY2/UnDkaAUEmFZzeXbVyRTqMZMJ20y97xh3ze1z1eCaVNrm0zmsm9cut8fp2saOVrjE8DeEBz3E75dHEETfED8x35kKXZrnVrGPWYX3n5nH04enh+Y/RXqpwF2ZUI3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730723083; c=relaxed/simple;
	bh=CuX881Htq2G9MyF7JVoCeQrvUEVRmKlh4ut54sjNC7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OSa0IYUmd/87+ovbiqwDbwvCu860ZlTyUAGsInaFcX5rSi+M17hSSZVtpi86PRjHpZW/lJVD9/HJLBEz+1Sn6FI4SM8pzMZo1y/E2GR5qbuzfClaQEe65s7pdGlSlzjo9sKI6dFCYHVy7IpoOwZKYUJ4biAL00SX0Mj47BQR7k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MAsqbXoj; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-50d3d4d2ad2so1718337e0c.0;
        Mon, 04 Nov 2024 04:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730723081; x=1731327881; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wo274/Jfmrl9jyJf2hcMW3bSE/BVnJ64CRAlMkPhKUg=;
        b=MAsqbXojs8dcmW9JDcI6yEuoXZigeVdAXQvSY9DQNw4ER9Qh+zm/LR1nck2Ji1fIgk
         hLAQ7rbwXda0OYkj3jA15ac44gBwZ/6urifB0K1TBmY7szqj4hS9BPMuTUtpQ516ByvV
         qalFN+07NCzUHuO5sDV4EDUwt328vetD9dmwdM2uLlnwwHEMCC2Ue1GIRnqgEgS0Jn7y
         5XekwCgBifHvAedldBmr+fpUJegFePdo0v5iDrv1kLiIYCIOOZYJ2RvYntCXEQr1EryY
         owdN+Anbz6AZ93wjOtbAd8onDseXgDuMtvjTQlqKdzcmSdV98x8o+7hQNPsjLSOyHlNe
         uKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730723081; x=1731327881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wo274/Jfmrl9jyJf2hcMW3bSE/BVnJ64CRAlMkPhKUg=;
        b=C4oRi/Yg+DGhbIejgWcEy2Mg6l1odG3H+F3/Ycyd7vqUma5grUHB7BK2rm9JJkqGkL
         qR6wZH1+3yTaQMrqwmjRl8S4rOcmQOQaDWxi87fpLjsoNMQ87Ix6oMqiEoLJwrE86/U3
         RozmGUjsMMfseVBnCrRS6nlMY8A4hdJXfJ7In9KlhwwucwGIXep3/xByLdMQ2aVrET4W
         rXz3a+fxmiI98Lr2LJPH9SlHA5OFcwXmK1bisMGvhbtGdxaLuCgmgW45JVq/mEYrav/R
         NA2EOmNefZSVLkICLALnphAQytH3GHpgk+rE1+SgPNWNR55FEsY31o/75jGyE9JLbatx
         9sbA==
X-Forwarded-Encrypted: i=1; AJvYcCURlSg1Bd1nI654lM1m9p7PXNe0VUptA4mpDWnk9AucH8XpgCs4qpuxdRSssAb6tlAFBnXgsHAOx/pdct8pXMliIak=@vger.kernel.org, AJvYcCVjWwgBpjZ3mun2t3E4L+kCE/gz7PGRGWZ+WHpEaHbMSMhCUmGVscNlqlqJMaq6853C/JVzC/L+bZY=@vger.kernel.org, AJvYcCWlmo7Bg398KP834A9vBNBIjBJTih+eW2nXlWzpJvEgHQtF8GfDuaS+eT2OLMm11MjgwC5/2pEcIyEPW+cF@vger.kernel.org
X-Gm-Message-State: AOJu0YyT4H7mZbOr+/Qnaqejj8+ieQUbYCDrcXT/ENcbiIAtutMVX3F2
	DM8Jmgytdnkinw3soMySHVsEHd4yF2aTns8yq88jFF83hN8615aAXv7Rl3Y61xsm1UMdZl3R0PC
	OCIhnBsy00k1fguwsYD8PdNj/teo=
X-Google-Smtp-Source: AGHT+IEFuIKEHUz2N0Td4TW4ap5UwUm7A4CtQG+0lfgO1HBunFwE3KhNTWiSxDOdOn6hE6z2q/i8kfbKH1pNha9OOME=
X-Received: by 2002:a05:6122:2a01:b0:508:4997:18c6 with SMTP id
 71dfb90a1353d-51226f993c1mr10034054e0c.0.1730723080698; Mon, 04 Nov 2024
 04:24:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241028212914.1057715-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241028212914.1057715-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdX5z5APK7JWtnqBBmtPpFYx_G1d_k9yxbv8vnvyuTsEWA@mail.gmail.com>
In-Reply-To: <CAMuHMdX5z5APK7JWtnqBBmtPpFYx_G1d_k9yxbv8vnvyuTsEWA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 4 Nov 2024 12:24:14 +0000
Message-ID: <CA+V-a8t6b6cbn+q7y9eUgoEx=y0uVrZytp88+dRmepipnwyyUA@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r9a09g057-cpg: Add support for PLLVDO,
 CRU clocks, and resets
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

On Wed, Oct 30, 2024 at 4:57=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> s/r9a09g057-cpg/r9a09g057/
>
I will fix this as part of v2.

Cheers,
Prabhakar

> On Mon, Oct 28, 2024 at 10:29=E2=80=AFPM Prabhakar <prabhakar.csengg@gmai=
l.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support for the PLLVDO clock and its related CRU clocks and reset
> > entries in the r9a09g057 CPG driver. Introduce `CLK_PLLVDO` and associa=
ted
> > clocks like `CLK_PLLVDO_CRU0`, `CLK_PLLVDO_CRU1`, `CLK_PLLVDO_CRU2`, an=
d
> > `CLK_PLLVDO_CRU3`, along with their corresponding dividers.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
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

