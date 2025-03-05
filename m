Return-Path: <linux-renesas-soc+bounces-14021-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 668A7A5052F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 17:40:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA7A016C371
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 16:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B4C4250BFC;
	Wed,  5 Mar 2025 16:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ajS6v5Yu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1F719C542;
	Wed,  5 Mar 2025 16:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741192689; cv=none; b=J8HMZB32aFr3MunKFkSOKyful/Dt/MzgrEXYbsnodN7yXLKQJuXt6yEuCOq0E9mExWxvVEL/kZxU7vIfCG+Vw6rGnm6kQRT/0wIoaQx8WY11tf9oo9JEGGIf0BBUNM13xfCem7vaPXaWM+IIpxpQbv4HfdINF/4Ni4lcXDZ5RM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741192689; c=relaxed/simple;
	bh=OwvDDv+rB+cBd+3VHKU2o92ijTiJPiX8okF4jWElzEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gODYSQ3JcV0kpleOoeVJTGqliKPcJMzVMcHTwW75VEn5+QvUiTJLyyG1uCPsGcJVXazUvLrfJs+3pvWYuLNntCf3+1F/ql+K1+QGxhgLvJCP2C3KJKP8cwZVpD7orJhwQnVNQikKmYRr/NsW5IHT0DcxGl2E/uw1DVSMlBb9mZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ajS6v5Yu; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5235db99207so2664708e0c.2;
        Wed, 05 Mar 2025 08:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741192686; x=1741797486; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQlxiO/tzlizWCcvMOMLmTMjvNekxRADNnpIKuwzvg8=;
        b=ajS6v5YuU6m6gjGJJb9IryCAodLzr0pg0AUj8rGPYvY2WrOKNhQc3LCM9QhnTKVpy5
         FkYNIrm2OcPttE5fNQaoQ9DssnLfXgRrvTrEmuo4fOEIZO7MuLcy31wxzADXHS9Epb9f
         +Ps/GONqoF4ugFshIOjX1lZdTrVPrcQYkUuo6vRnrzR551ivNd7isVyE1cmq+rjqJtF8
         MfHZquHElV7SUxvWLHRrKR+aVN/la/xq/kzRxsgTazCAMgolu5OmZfRfcFzq5p5kToTF
         IeGORVqJVch2XUZLglTbHfYDg2aMnTIFk7ahFZrlfryOWceWlB/dLh+ZsFu/ugqtCkhv
         P0bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741192686; x=1741797486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQlxiO/tzlizWCcvMOMLmTMjvNekxRADNnpIKuwzvg8=;
        b=tOJSyh2r2yQ7A/qpix1hPis8shiRxmy3+eiaNYlGpDTOl5mtw6nZJxUBQKhUDhwPnX
         NPuoKfoFFFFdfdo0Fb3PLcZ+riueEzRkVGZ21uIdkHbpOP0TW8JNbrJ3KC41TY+bUkrd
         cyROWlWpSPpJ1a6xLafg9GtoxPxtJvIVFT2hhBU54l70UxttxDvkVxrz/3QIO6ul6syy
         Joh4lT1f/ax3JDwbiOxwRBYXndKONDCcvFY8GXhznzZsh5Zgaeg99x//ObAtSe4FRfIc
         pHHphBEk9IrircGzT3rcJq+Pc54eEJuxKc24lxhb6Lp55uogQ9RzVHMhjZ2QWS5L447E
         8ZNg==
X-Forwarded-Encrypted: i=1; AJvYcCU1auik6tsK4coreIltJpqwZ7Fm1XKLUN7UDYUhBUvnJ/c5BjQVsnYh+B8piV9Z1KFpkTyacl5XNKirU9j91Jtk8Vk=@vger.kernel.org, AJvYcCVhp7GKS92oCDO1Q3NSR4FstQJIiDxmMMpvuQsqfOpiIxqKWD+TttEpGtjk64Kpv7utnGndKwi884A=@vger.kernel.org, AJvYcCXayg1tzZFZpME2QqDL0Qa7OfGbgmp7zDQWrRrwb1eASB7bzXpPpUNafgjGOIwHtZdV2fC/I4nPNSWdQafZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yww3jreR1xk0VhEw/3iCrdPew/IWk9au1TTZDsWpLJnqWW8zqJe
	QPWzPkKMzi+q6GNHwNLFNxPAwJhHcHGXmPqkGbo7rtbuK+7KGjKXrHGtYAMgbvAgkb/janZh+dl
	n8v+TYQL//PqLCwgzY3Urb2HfCAdau+bw
X-Gm-Gg: ASbGnctVHvKLntfr/oOi5mT8MnQQVSMY1bdPo8BARGXwnVKUcWjQOrLjcO8eBV6CUAu
	MhQAT71Rz1pHtqcrMo+PJS3yxVnSDdZlNH1HyZTC00VX2by6Y3Hr+66U7b7N/OalGSYedzmQjyB
	Gx35TNWNgybVMz3SQBYHkM+40O6g==
X-Google-Smtp-Source: AGHT+IGgP6P7tbPAFmk1OoR674ND19doqpjBCUa83A+ACGXwxElzV5jy1FoNKcrR2VQhDnBQk89neEvY/Mh21OU2Byg=
X-Received: by 2002:a05:6122:3186:b0:50b:e9a5:cd7b with SMTP id
 71dfb90a1353d-523c628826bmr2411542e0c.9.1741192686457; Wed, 05 Mar 2025
 08:38:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218114353.406684-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250218114353.406684-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVwVemQfrDFH48n9Csp6=KtFs5MpZ6e+wLWSnEuh2gdvg@mail.gmail.com>
In-Reply-To: <CAMuHMdVwVemQfrDFH48n9Csp6=KtFs5MpZ6e+wLWSnEuh2gdvg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 5 Mar 2025 16:37:40 +0000
X-Gm-Features: AQ5f1Jq9xGloZE_BIWzi9jwUpv744jv1tl6VmpAdYxsk-Ac88E_TEIGJLuTaN6c
Message-ID: <CA+V-a8sj-jEu8y_qPv-KvVCu_YQCQ1MDK9zrRB93LjfhmB_qfQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: rzv2h-cpg: Move PLL access macros to
 source file
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

On Wed, Mar 5, 2025 at 4:19=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 18 Feb 2025 at 12:44, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Move the `PLL_CLK_ACCESS()`, `PLL_CLK1_OFFSET()`, and `PLL_CLK2_OFFSET(=
)`
> > macros from `rzv2h-cpg.h` to `rzv2h-cpg.c`, as they are not intended fo=
r
> > use by SoC-specific CPG drivers.
> >
> > Additionally, update `PLL_CLK1_OFFSET()` and `PLL_CLK2_OFFSET()` to use
> > the `FIELD_GET()` macro for better readability and simplify the
> > `PLL_CLK_ACCESS()` macro.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> The changes look correct to me, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> but I still have some comments...
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
> > @@ -56,6 +56,10 @@
> >
> >  #define CPG_CLKSTATUS0         (0x700)
> >
> > +#define PLL_CLK_ACCESS(n)      (!!((n) & BIT(31)))
>
> OK
>
> > +#define PLL_CLK1_OFFSET(n)     FIELD_GET(GENMASK(15, 0), (n))
> > +#define PLL_CLK2_OFFSET(n)     (PLL_CLK1_OFFSET(n) + (0x4))
>
> IMO, the original versions are more readable, as they clearly show
> the symmetry between encoding and decoding.
>
> Perhaps a good alternative would be a structure with bitfields and
> a PACK() macro, like is used for DDIV and SMUX?
>
Sure, I'll do that. Is it OK if I make that change on top of this
series or do you want me to rework and send a v2?

Cheers,
Prabhakar

