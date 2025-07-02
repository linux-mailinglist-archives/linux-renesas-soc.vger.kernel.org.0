Return-Path: <linux-renesas-soc+bounces-19049-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AABAF6383
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 22:44:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 502034E75B3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 20:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6055C2D641D;
	Wed,  2 Jul 2025 20:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kCJtVgHj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FA32D641A;
	Wed,  2 Jul 2025 20:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751489083; cv=none; b=M5UvI8rMZymkPhqaj8hxuYkDtV2sL9Ed4lZBwdE14cfhG7Xe4ku2cVBqdoNrwPFXDITHljG9O/pgVKUowvANsLwGqClWTDqxI/CKDqvXswCjGQKI5thRU4SEnCqKX5MuNMNE104jNtUXUuDqkPYNyMsw2HghHR0UNohwyG/xAXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751489083; c=relaxed/simple;
	bh=f146WfdMW2b3/QIMJRIK3U7Qv+mvDiiBz/b2i+oyyNA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SqH4KerN1tVDiJOq2g8Wz625UuSyxkaAh4qE56iTMBNAc5bSvZDGF+ZXTp9awt9nX+3QhfqYYmCpkZuWNyZ688CaRKPbWlIyyXWVP7f5Z/lo9jtQP7F011eaEi47raNJUhPtRi8JEeGfqYfhJ1+JEWUy0HQstiFWMnHSrOnqf88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kCJtVgHj; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a5123c1533so2777228f8f.2;
        Wed, 02 Jul 2025 13:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751489080; x=1752093880; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cG9+RrCIbHK4xHd7szyrgREu2XMni4v8D5BkTGE6NHA=;
        b=kCJtVgHjuYgfTfo2yXJdkP+Jpmx9IByUrqIAyBx7tqYHePetgxygBEpJyphm6Y8gZc
         uVAwHJzSxrGToZqJk8uleLT7ZC2KeY/RmbHc0bxlD748A+BQZtfGY/n+yygD8jqrn1Nd
         RhnqcaTWVtaBzdSIVktIXykRSBPQzvB4f+adwhbrdyD/3a7reTl1hz0oM6mi8JEaQkt9
         k1SjYF5Vx501C1vGUaMD6JwNfU5RMHcEBfRHY7TiiXBqX89LNSDmIHmW5sku9vV9FNnA
         YyUQfea34OqOOs2CLEubsCaJCl9oPtJUfXMOmWmIwIOezVH2s9vMM3tphYYbLGM9YtCK
         Mzkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751489080; x=1752093880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cG9+RrCIbHK4xHd7szyrgREu2XMni4v8D5BkTGE6NHA=;
        b=qHLWoPuUS/4TK9nIlyfVMj/Duq6sOwsI8302MomeTNB6Hxyk0heZgKubRPngQzt4s0
         e8AviBzyghlrxNSgNQ/57IbLZ2lhgAKYzrMo12I5VDPNqba3mib2cU5/YcOpYq1Jw25N
         /AdL0itPF6S7N2Rjl9Ckx5R6lyK2inl7vQYyyNhydgC+So9nDPxy8AM9dEa6RgANBudq
         zr6WExxojy+pP6Uh4gne6urQuWcY3s1gx9fVJ1SKws+MsEhnjO923JOy8aveRdLjSas2
         28RzyWd65rpspSa+DpcxqftSkcev43loguw+fBcAlYSX50Caa75I7Frx8KIOz4sMZYpC
         IF+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1N18hvaNqORJMkpdKYXlVOS4zk+XWjPtv04nn8qsrumItzilBTK/dPcnRAUjlH6HA4yFo1nOvcyk=@vger.kernel.org, AJvYcCVJjqTWT0WY5BZUTbAT4TOapVgKZhbeqKfno+MSr8kUmhGuNRTOCXVcUoZzqusj66XjClnoYOGto9k9IJjv@vger.kernel.org, AJvYcCX6UVl2RNc6wG2YHC4QwxJitj2y8YFIFEo3daHazjRNBRmFjL5c8mZrQfAXP0bFcCrId/65fOTG4HmX5V3eATSNsNQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcLrtCF4kS2pl3geC4Vj34zBXxRYZDKbEGx4i+LnOOdzDNHTCC
	N31zYRnYypZRPzkKJ5/Ep0Bt8tZtphw2ir2q9AhrSGQpG97aEKZwPx6WI5BOfGUdlPzhoY3bVpC
	u0VV72YiUqja1VwYaqrd+HVTwicPN+rY=
X-Gm-Gg: ASbGnctl2lyyA0sq2d03bQdKc3Gl5c3Gko/A0aLq8z3Bd3gxim2z3Z9l6uN1rArlPJ0
	L4Xqt73ws+y9TU+b3/sYH20py+feJfBdZopK4TWPVyitJAgaOeAPiHju81tD5JPAAUCAt104EmH
	WIpzoLQ6equbGFFqUG5eGQGuGgngaVqEr6nzsgv56WRu99PQ==
X-Google-Smtp-Source: AGHT+IHo6D8zUE1WNpm2LPXZ195CU7C+oAki5EzPxIFLjiz9eCGwfOi/3454dfPlwodhArxhpV3xeL4rigOKWppD3yE=
X-Received: by 2002:a05:6000:3cb:b0:3a4:ddde:13e4 with SMTP id
 ffacd0b85a97d-3b32eeb73d2mr463194f8f.58.1751489079666; Wed, 02 Jul 2025
 13:44:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624153049.462535-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdV46tME9zuC556XuxcxRt2FGLwuUmdudZvOKf9RLvQ1Lw@mail.gmail.com>
In-Reply-To: <CAMuHMdV46tME9zuC556XuxcxRt2FGLwuUmdudZvOKf9RLvQ1Lw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 2 Jul 2025 21:44:13 +0100
X-Gm-Features: Ac12FXyVEvorDrEUu3j6gm3AhJgKsW6-_uN6Z2FxPa7BksxrVSEnTOE6WcgPhgA
Message-ID: <CA+V-a8twesasY15qnRgtXSg2YFAEGr25N5pw0ApFML3MRyXP_g@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rzv2h-cpg: Drop redundant base pointer from pll_clk
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

On Tue, Jul 1, 2025 at 11:24=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 24 Jun 2025 at 17:30, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The base address can be accessed via the priv pointer already present i=
n
> > struct pll_clk, making the separate base field redundant. Remove the ba=
se
> > member and its assignment.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-clk for v6.17, with s/rzv2h-cpg/rzv2h/.
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
>
> > @@ -230,7 +229,6 @@ rzv2h_cpg_pll_clk_register(const struct cpg_core_cl=
k *core,
> >                            struct rzv2h_cpg_priv *priv,
> >                            const struct clk_ops *ops)
> >  {
> > -       void __iomem *base =3D priv->base;
> >         struct device *dev =3D priv->dev;
> >         struct clk_init_data init;
> >         const struct clk *parent;
>
> Don't forget to update "clk: renesas: rzv2h-cpg: Add support for DSI cloc=
ks" ;-)
>
Thanks for the reminder :-)

Cheers,
Prabhakar

