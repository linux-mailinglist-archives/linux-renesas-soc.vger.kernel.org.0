Return-Path: <linux-renesas-soc+bounces-14027-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85453A50612
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 18:12:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE27B169FEF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 17:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695491A315B;
	Wed,  5 Mar 2025 17:12:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C039189919;
	Wed,  5 Mar 2025 17:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741194733; cv=none; b=bWfNV7xoBTJqivUlYNHFuSyiWxukPbvr0Wh8wqtvzD4IquxRh+rgQulxxrWWILWbS04naUPO1bxfrQaT7QcLfQvMcyumHujWI1Y4WBagxZjicOU3GWyvwdhq2bJcjQuKKLg12XowQHSkCeFYR7uuGXrnnc34i4uhcFQqThi9tfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741194733; c=relaxed/simple;
	bh=ymdjfPVj3Gx6VMSsnlo3NNdGoCg5MQjlKLzXkCVz3hk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kdk9aL8kL8s/0u9dH4DyYmhW+veBVG7WyuwSK+CRKhfvUrMGwPd48IUQ+jN1DaY8RevJkYXolWa5+sm/29XYctPPXUoSCGZa3piDQtF7sj8OjmkjP2sfKDEExH/HbWjamk4m8D3k+VSTScbkUO7VIuk4wTZ0YTXGxBsO3TUqa+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c3b4c4b409so605688285a.3;
        Wed, 05 Mar 2025 09:12:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741194729; x=1741799529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xwvfJ3zSM1ne0HhPozptDXxYsyU2cKa7T+hm9UKjZ2o=;
        b=D76UdXgt8XMbNoMg3jFnSy7hdhRpjgZ1GUQwQPdv3xmQzhBSF51yWui3tk5S3MbsWX
         RtPOrZWHs28qm+f15U2wNZIbUFEBIVFwn8RYgcvzbZqv3CESBKNPO+FZ6E2mI5SX3i3X
         dNnUc8NLRiYmyyxjvdW5gF9Syqsz2wgdzXa1VUmfNtQ7qoZ9WMGC7UM3VNW7LuPrB7WW
         vCBaXmuAtYJ+2pljQVzhJ3BRpEvA9VcRcKdf8R0hJBpiKN62R+60uqf5x9UvJOLF+ajt
         8ZmLI/Kxw1NcEiuRNn+CXcDx6cBKsNCdg3cHA+qSDVrG6OegLSv3Y6BTycoxTjOHXe5z
         XU3A==
X-Forwarded-Encrypted: i=1; AJvYcCUmuz5Lu/n44f6RkofkyNpbnyMKqg/pqyH6+cTRY/5DKbg4rtc3ALxWQoLcNql3vQUQLMhJXmsW2hHPfHw1@vger.kernel.org, AJvYcCVOYCkFDqjYfprgKifjGk6uJdKL6XpRjxwQdr1qnzrRpOTexhhT3UdBr6eKqz4iOOaKvk3NalkUdoFDTp7l4sFO0E8=@vger.kernel.org, AJvYcCWrtJjEv/sJeYjHSariV6Yho2lId96k/jF7ES5NGpzKCrRBXbU0zx5Ouyhrf7U4hJsRkcglMbfhT10=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3oYDiJlv+2KBVVMXOoUEpbPoffxZZp+X+SrKYfA8fienSrFvL
	2DQ+C2+qvXKnTS7hm7yvu/xJUIuNteao4/dml0uRT5RbALx9qxw3GI3NhKeM
X-Gm-Gg: ASbGncvLH8hTnVnPpsYKfcpoV5x5Emdq6xjqiBzcJv3oFNKEipZzMyMvVAh+K3NctMj
	oBzM0qyRAJfYTYjT3zTf/0NB8Ek3mHWQ2Plt8OgdRbgIQ3LDvKSqOGOZ5azgqDMjGvd8Hhi2igU
	Ug2HYVCKNwDkBCRhhXRLh9ekhlispFCjPrYo9SRdU4bRg7DBmgLmGtzKUUG+u76/jdQLhpKyafY
	zMKnyE8FtmkDxG6HphK4hyMR3vtedu6pdIWgbIyig6CbEMccVrYfMP2iMTFyiwtX+beuAFbOp/E
	yG60dgecal9a1m54YP+XIoTyd2aKrhIUezwmv3237s+8nq1Gr/S3Kk3QVtotCkPl9OWRd5ofIAz
	L+GGyEsRmHds=
X-Google-Smtp-Source: AGHT+IEBwVWbIXQ/xgbiO3Ai+oTFWUpJ8O6nu2UYjJyaymQtru8AIaeCIVhqBqus8TBFvqvJu41Scw==
X-Received: by 2002:a05:620a:8806:b0:7c3:cd38:9be8 with SMTP id af79cd13be357-7c3d8e5f40bmr693787585a.25.1741194728905;
        Wed, 05 Mar 2025 09:12:08 -0800 (PST)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com. [209.85.160.169])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c378d9fe2bsm901948085a.88.2025.03.05.09.12.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 09:12:08 -0800 (PST)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-474faf23fbeso28943101cf.2;
        Wed, 05 Mar 2025 09:12:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUVep2sMP7vEV6vFUgOi7MBDiu17DUn6bstsiIey9idXBuS9qQkp6VsQdXpP9J79zBeVxgk4izXJ9M=@vger.kernel.org, AJvYcCWK1Oiu2xho1W/NQiw9yKFjiNMZNLwEAKNl0dH/U5+9pGNqyoVDj6rBbSu/nMP3vXxNtq7srJvBa3YqZTuwu8xo8QE=@vger.kernel.org, AJvYcCX7/XuIXYlPCckEfQ8WJYIfPkFjZXwGb2DbtaB8Q3muJL4sOswVAll4xOCXqfiUAbxrhGvReHh7CbPYqScw@vger.kernel.org
X-Received: by 2002:ac8:7f83:0:b0:472:1f07:7a9 with SMTP id
 d75a77b69052e-4750b496c02mr55280851cf.31.1741194728486; Wed, 05 Mar 2025
 09:12:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218114353.406684-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250218114353.406684-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVwVemQfrDFH48n9Csp6=KtFs5MpZ6e+wLWSnEuh2gdvg@mail.gmail.com> <CA+V-a8sj-jEu8y_qPv-KvVCu_YQCQ1MDK9zrRB93LjfhmB_qfQ@mail.gmail.com>
In-Reply-To: <CA+V-a8sj-jEu8y_qPv-KvVCu_YQCQ1MDK9zrRB93LjfhmB_qfQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Mar 2025 18:11:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVfnGhaJwfK93_StWsUDWDfwNp_9uwZB6VvKLMMNga9tg@mail.gmail.com>
X-Gm-Features: AQ5f1Jp0YyLAxKgAuapwsJ9uQO_sQxnabNdrvwWGoyLAOSsLGNVRJc3_g6dsEy4
Message-ID: <CAMuHMdVfnGhaJwfK93_StWsUDWDfwNp_9uwZB6VvKLMMNga9tg@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: rzv2h-cpg: Move PLL access macros to
 source file
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Wed, 5 Mar 2025 at 17:38, Lad, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> On Wed, Mar 5, 2025 at 4:19=E2=80=AFPM Geert Uytterhoeven <geert@linux-m6=
8k.org> wrote:
> > On Tue, 18 Feb 2025 at 12:44, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Move the `PLL_CLK_ACCESS()`, `PLL_CLK1_OFFSET()`, and `PLL_CLK2_OFFSE=
T()`
> > > macros from `rzv2h-cpg.h` to `rzv2h-cpg.c`, as they are not intended =
for
> > > use by SoC-specific CPG drivers.
> > >
> > > Additionally, update `PLL_CLK1_OFFSET()` and `PLL_CLK2_OFFSET()` to u=
se
> > > the `FIELD_GET()` macro for better readability and simplify the
> > > `PLL_CLK_ACCESS()` macro.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > Thanks for your patch!
> >
> > The changes look correct to me, so
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > but I still have some comments...
> >
> > > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > > +++ b/drivers/clk/renesas/rzv2h-cpg.c
> > > @@ -56,6 +56,10 @@
> > >
> > >  #define CPG_CLKSTATUS0         (0x700)
> > >
> > > +#define PLL_CLK_ACCESS(n)      (!!((n) & BIT(31)))
> >
> > OK
> >
> > > +#define PLL_CLK1_OFFSET(n)     FIELD_GET(GENMASK(15, 0), (n))
> > > +#define PLL_CLK2_OFFSET(n)     (PLL_CLK1_OFFSET(n) + (0x4))
> >
> > IMO, the original versions are more readable, as they clearly show
> > the symmetry between encoding and decoding.
> >
> > Perhaps a good alternative would be a structure with bitfields and
> > a PACK() macro, like is used for DDIV and SMUX?
> >
> Sure, I'll do that. Is it OK if I make that change on top of this
> series or do you want me to rework and send a v2?

I think there will be a v2 ;-)

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

