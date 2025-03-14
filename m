Return-Path: <linux-renesas-soc+bounces-14375-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D72C1A6128D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 14:26:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26A9316E3F5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 13:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66DAA1FF1DA;
	Fri, 14 Mar 2025 13:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k2u5RcoG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACFA2E3398;
	Fri, 14 Mar 2025 13:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741958792; cv=none; b=nJ0NygE8ezvQ2z6YqsU3nBjXp32RMVD0iviHuyKJMYKzMNBkDssCo0+Y9GekRbAlD/xh04Vu9EW+jIt77qCn1aGPpjCMEKhtXpv/HEaMFHLaRk1xjedm/taLYX6l9ihuuauYjjTHiI6pBKMdsPygTJ61vrrO/+N/8LkfOeESdKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741958792; c=relaxed/simple;
	bh=a1ewCs15d7EUwAKtdHew2LfV3smx2PG4+Aap1SXq+x4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tLQyTb0grWJKgenhwwVzrH88t70vWH1OQytD8hIeZDiT4+8s6kw4Os9R09NRV5TZmMB2khjXuWSABs2K0k46xlK7yjsxAkGWk9ojU0/9CvDutP7M8b0MeYi4yegn8PqIXE8IuaolUoCTgFhbAMHcmFqLOBnm1AFnNBFmYGsYCxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k2u5RcoG; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-523fa0df55dso2637991e0c.1;
        Fri, 14 Mar 2025 06:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741958789; x=1742563589; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wyULV2YmhZdLQ8JK+SLrjPauKQSBOhz1Nvb61q64AGQ=;
        b=k2u5RcoGS/KgCfkeQ4IOqDCFOK1Cvx/UAz0EyQ1g3LbYbPdpVIRTeOTN8fn1TDdwRn
         w9LTImcCUNqPl8bGsNhsu2KURoyhmvwfPhBsBNNBdenfUeBSWMhQX0x8MrI1GbumiY3u
         6RAI54/4e2hFANo9aNuzHNm+l5IDvfXeLJqFyjpn83dtCHF39AnOcE+24/kIPc7ucpZp
         eRvPC1/U65nHEHGfnA6PH7Wlb+VJEmmmTJJ/r4eMR4Mu/rNjrpb6EpruYPTcRVzh0iMO
         pL1ZCTWVd1pf3F2203CYMG9v4HT0vAofxMDUt0hg+1BunFaWd2QkuaUCPVdSkrx6LLMV
         39Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741958789; x=1742563589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wyULV2YmhZdLQ8JK+SLrjPauKQSBOhz1Nvb61q64AGQ=;
        b=HpHjz496+nYQ1GeC813mCqxkj81x+00iUhuW0MrNtjK4ETKGdn2uhKr9xgQxbT3yzz
         jJD4FPDB6Ozli1MB2RTwolYpac+KyUwpHnWqA07QiOBODEqeO11tz77UiMsEb9a2a0eb
         JxkWByNbw2w9yOnVE16fGZLOzNdLghRA6FvKCzx5zLLE98/5Y3M/YCszd/McPpw635gd
         oBpK9SZbsDZlAopeh7if0dagskyG8aOpr7h7UcK9+koKTfu/qC8P4CB1OhmXt/4TpWHn
         2qvzhc5vXMA84+jOaqP2xPyaUVDS32QpTWNj1r+DRQQm9KBO/ZawnDjwXTxcjhTqx32I
         tw+g==
X-Forwarded-Encrypted: i=1; AJvYcCUanjnS9imvxFPAUJlRY/AUAuKUYOau/aiHdfYpyY4SLkdPYhWTQnCDGwk9LfODKRkXrDNBPG2aH94x0UPA@vger.kernel.org, AJvYcCVHkhR0Mwzeui0AejHHNPTRcj2oyd4KHSzkYpfvhEGMD6bYDhMD185PQA5k7B11Mz1XO+iQ8IMrWgo=@vger.kernel.org, AJvYcCX/zyo8WCnGAYPuS8HzTdFUyGkLuZre+UI2eRwKuY9NXXSpQItov6juZJ3AQdMwSTPLTtzZFmFjIgY3gad6SJ2Ol+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhtqUi4z6YsGQTPuXxsMvH/tR46NKzBLy6vPsEQJBrnHliUPUI
	nfWbkgj08A658+rX2lmv3Fp+VWkbjwUB5NthA3K/NOJC2hAYVdOQ93it1cL15WmiccKswCVvYxM
	2EkY5tp+FMGifqlkDPtpzsckZX/R/dBxk
X-Gm-Gg: ASbGnctbvETUgUv8wt+M8U/K4QFq8NQAJ3kDiJIKbF5KE5uk4BJYwPuoNOZicaXne2y
	3zh0BqQiedsHc/InV4nNvO+we3FfeYayqRRMchZt8/TqWyAWUEZAX2UjUu4nDnIv2tNtm8spJ1K
	2rqTJQs4xOOxL0+HkcsVyapoGh2A==
X-Google-Smtp-Source: AGHT+IHWtmEo1+EDvlsPdWDsjR/+rksCl4aBp8qnpq4JIJmYST5qgVAs+Cx6K79rRZ0Y9jaQodtaiC0jygkOLDDsgUc=
X-Received: by 2002:a05:6122:3782:b0:523:e4c6:dddb with SMTP id
 71dfb90a1353d-5243a15b6f4mr7059436e0c.0.1741958789562; Fri, 14 Mar 2025
 06:26:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250309211402.80886-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250309211402.80886-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdU5tr2sNZQtVkT922sJd_7Lbt=nYUujX0WtnrzkWOJqiQ@mail.gmail.com>
In-Reply-To: <CAMuHMdU5tr2sNZQtVkT922sJd_7Lbt=nYUujX0WtnrzkWOJqiQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 14 Mar 2025 13:26:03 +0000
X-Gm-Features: AQ5f1JrV4PHhFqtGVE7ctpK40g8AtfmAvdlUDemWvkd-J_FwgcQljHoue9rWgco
Message-ID: <CA+V-a8uhJPssjTsKPwfh7G7P26uuRj+xy_uZF6SQPPQOTx33-A@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] clk: renesas: rzv2h: Refactor PLL configuration handling
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Fri, Mar 14, 2025 at 1:04=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Sun, 9 Mar 2025 at 22:14, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Refactor PLL handling by introducing a `struct pll` to encapsulate PLL
> > configuration parameters, ensuring consistency with the existing dynami=
c
> > divider structure.
> >
> > Introduce the `PLL_PACK()` macro to simplify PLL structure initializati=
on
> > and update the `DEF_PLL()` macro to use the new `pll` structure. Modify
> > relevant clock register functions to utilize the structured PLL data
> > instead of raw configuration values.
> >
> > This refactoring improves code readability, maintainability, and
> > alignment with the existing clock configuration approach.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-clk for v6.16.
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.h
> > +++ b/drivers/clk/renesas/rzv2h-cpg.h
> > @@ -10,6 +10,25 @@
> >
> >  #include <linux/bitfield.h>
> >
> > +/**
> > + * struct pll - Structure for PLL configuration
> > + *
> > + * @offset: STBY register offset
> > + * @clk: Flag to indicate if CLK1/2 are accessible or not
>
> If you don't mind, I'll rename this to "has_clkn" while applying.
>
sounds good to me, thank you for taking care of it.

Cheers,
Prabhakar

