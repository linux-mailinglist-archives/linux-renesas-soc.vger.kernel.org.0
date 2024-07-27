Return-Path: <linux-renesas-soc+bounces-7578-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5159993DEE0
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 27 Jul 2024 12:53:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0671A283A7B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 27 Jul 2024 10:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9AD57CB1;
	Sat, 27 Jul 2024 10:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="blrabuzL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B4E4A05;
	Sat, 27 Jul 2024 10:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722077595; cv=none; b=gXcL4bD/xemuJ6/QwlfOo1VKHuNSaOz/pG9uVmNeT/L/F/wD43oJ0nKZg/5T/orFXkwLcBkd7EmHgb7qRKPajyxaN3Aa0jPTxK8/3e+YjkCwP0WEtALvnwKSIn5nzzt8P+Zq4gWY3KYChbgD1xtOISAGVl5mXlDWW71wFJ9xtKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722077595; c=relaxed/simple;
	bh=mt9teUkSSadCUW95ZR3FdzgKORi5H9YAVkcz1CbjRYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CvqUYe2zO0pxQg8un8abBf04EvxkVgupLFXwDfJnLgCth0Tn8KRlXkLo0PCMcu210fosGAcHW8n0wJsnagjSwVUbcr6Oj+M0mXzx8OtrngPrf2Byigoy3vUhReASZhU+WyOpTMTz1qP4VYmhfcQKF+6iB/ocJe5NcDtip5s7vQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=blrabuzL; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-4f6bc491759so587341e0c.0;
        Sat, 27 Jul 2024 03:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722077593; x=1722682393; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a8SGxKnwYxSq0GTxPBtTdMk5xYXpNjKezkYGzXPmgmY=;
        b=blrabuzLTnQ4w9HMqf8617c4k4RP0wk82H62NUEaH/toaQkUCSvfsFFxlKevuHpqa4
         hfNXTTVHlMBLrsbXCcG0ELgQVdkNknkKTPUbNZUIzvDUbow/NeyCesV1DJz2FICN5URV
         ia9q1oo5bIW8PivTAovrjdDbvuR2SVn6G+NDL5TVrX6v8Lgf/nfZDU8uJsyO6QacOGGT
         EBQ7JkiQ94cDEy/wNipxGm0He4q9HMTJ5yCnLTCblKl92KHhdmxwI8rNOdBG2LE19HqH
         YCwvjuW06AXSoMHJRSmnzwz046NIwLqmsUmP51Db7QnaTHxJQZrhNCoKE1cgnbw+f7Xt
         aBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722077593; x=1722682393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a8SGxKnwYxSq0GTxPBtTdMk5xYXpNjKezkYGzXPmgmY=;
        b=hHZvohWQd+MgNF8FS3/POswoKrc4rnUcz0Cb9pSaXYu9pdHH5JChqxsoIjh9zV5BKg
         RWnqE/Rfvc0fsjRNkW8iFs+Dt1PiGtwi7/5NZuqLqkyChaNogFse8GiZo/dZq9Vxdk1E
         CnZW2UCwO+mjFz4+P3QMe0cOjHCbXGtNx4iufiCfGKOtky9phg+fPzl1mNBnb6FGlgKR
         F9CfAM5OrN7X8E0L07ZSi+3Nc1mrHbl1hY8cpnI50swPjxsw7+Tf8k1RWq8BilVAaneu
         5ew6o/IV6IXZMaVKVVwD/8+FICZdjKs1RHUeBKnYVe0djBcv/NefkKTGi5Q0vG7RelKS
         a19Q==
X-Forwarded-Encrypted: i=1; AJvYcCX30Czf0nmQl66HwWiH7x2SfCTXaVgNAJbLyvSMe2vtQ3S9s036H9xhSLPENYXAJ5PBfOdjix3GJgZgeRMczL3I4NIUaNyTrdolrjMSe+2+eZqAMxOsCSd7sP4cIsBFBUcbETBDiJL8DJxDX+a3QTGB57WTr8aj1KRf5KK42nInaqg8qR5Du+1u5Lo=
X-Gm-Message-State: AOJu0YzJZlrd7Vl6rSToFAM9TtFbQNICz4bPinDtq/HZRsEhBjR45diW
	tVlTc7VuOUeK23uyVIUhBFfdG41u81/6MumxqYsbDTdJd10sOtUEEdYjM6aHupAZIV/QZWtjp5m
	Og27n89dtx0F202neGr6vY/NlteH3iEpT
X-Google-Smtp-Source: AGHT+IErhDC4BKijKK96ddadHllvLGFsWKkj71jtWDSYNqFPoYl0y27F2ygW06ecDoILmX/nuTMLG3XXaM5P2zz5QlU=
X-Received: by 2002:a05:6122:4693:b0:4f5:2276:1366 with SMTP id
 71dfb90a1353d-4f6e68b1738mr1495431e0c.3.1722077593228; Sat, 27 Jul 2024
 03:53:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240715103555.507767-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240715103555.507767-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdV+pk5RgLZV5BdjJ2TR0GkjTni2-ZcL1zA0yrJv3-vtYQ@mail.gmail.com>
In-Reply-To: <CAMuHMdV+pk5RgLZV5BdjJ2TR0GkjTni2-ZcL1zA0yrJv3-vtYQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sat, 27 Jul 2024 11:51:19 +0100
Message-ID: <CA+V-a8v8ZsdnD1GgUds_zYUy-_+KNKubB9tUQhfnXwe7s=uV7g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: renesas: rzg2l-cpg: Use devres API to
 register clocks
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

On Fri, Jul 26, 2024 at 4:09=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, Jul 15, 2024 at 12:37=E2=80=AFPM Prabhakar <prabhakar.csengg@gmai=
l.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > We are using devres APIs for divider, mux and pll5 clocks so for
> > consistency use the devres APIs for module, fixed factor and PLL clocks=
.
> >
> > While at it switched to clk_hw_register() instead of clk_register()
> > as this has been marked as deprecated interface.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2
> > - Propagate error code from rzg2l_cpg_pll_clk_register() if
> >   devm_clk_hw_register() fails
> > - Used devm_clk_hw_register_fixed_factor() for fixed factor clock
> > - Set error pointer in rzg2l_cpg_register_mod_clk() if
> >   devm_clk_hw_register() failed
>
> Thanks for the update!
>
> > --- a/drivers/clk/renesas/rzg2l-cpg.c
> > +++ b/drivers/clk/renesas/rzg2l-cpg.c
> > @@ -1116,6 +1121,8 @@ rzg2l_cpg_register_core_clk(const struct cpg_core=
_clk *core,
> >                 clk =3D of_clk_get_by_name(priv->dev->of_node, core->na=
me);
> >                 break;
> >         case CLK_TYPE_FF:
> > +               struct clk_hw *clk_hw;
>
> I will move this up while applying, to match the style of the rest of
> the file.
>
Good point, thanks for taking care of it.

Cheers,
Prabhakar

