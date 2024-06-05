Return-Path: <linux-renesas-soc+bounces-5851-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 113C38FC6FE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 10:54:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7E0DB210B9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 08:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54FF114B969;
	Wed,  5 Jun 2024 08:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jvwhm5t6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CD2171CD;
	Wed,  5 Jun 2024 08:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717577640; cv=none; b=uzqJJ0Vs0Q6xgIHj0hMWY8NDsn+eD9Uz7Oiv96Qy3m7k87vsr8VNo3Siz4q8XL3kYVRP8eN+yjLIqpHnHpxvcj5FMCwvmDffpwn/J+zAo/7BNOFZByJRE4VJ8VMHsJTSeUIVfsLiUVVBAPV+5cSmh7R/AlHTWDyyIUIKwoS7RoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717577640; c=relaxed/simple;
	bh=2OCBRkiPl9IsxIFe8x5DqkabKmv5PskzRQOzL0bHJYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cPmxvUSirZBvlvNttoYTO1d2tqlIXmuqVTqK0BwDNdFN1Xc6c/uXo3NaUO6EyY5dQXW1nC4jb/09E2i2OieTM1bHOxkRAmBYzZT5MCiYgbU4fN8u7qTwPl5q5nziimxlVf2qwG8kPkuJfkXjEQB5HjN2BLhuLXd2MphTikGCa88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jvwhm5t6; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-4e4efbc3218so3168138e0c.0;
        Wed, 05 Jun 2024 01:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717577637; x=1718182437; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r75izD5e305+5jm9FDw/8GWyo64PxCM/hkzm8mpzmgI=;
        b=Jvwhm5t6zRXggG5UQSthkwp+L3GHlArMA2NMg9YM35483UmAgUQ3WaQt0m4G9rz/y1
         CGUywoFw2bsPBiAm93yQLnIGXZ+l1mdFSdvEpBKCJ9pHbi7kKvLfR7MzOoD5D2n/tt2W
         S04wPic4mXYP+swseAEhvgrN/tNYYRwTjBe701PAfjMI/kkin+IAnZJpdwXSivZlDlLU
         37VhM+CfTyRb2Vsn51QIaqHpNk1Ovr5opi/ONMEryP4Xmu6GMuC6IPSbsYIgqCWmIIBZ
         Y787PhUopOtCd7LAZ1nunne1buBRvRVyr9j6eVU2P0soGIm3izoEq3nTWRmNv/rEA/2c
         hQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717577637; x=1718182437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r75izD5e305+5jm9FDw/8GWyo64PxCM/hkzm8mpzmgI=;
        b=b8hhuTR9nyRauuTopOM2AzATyeeVWtZAb3hbWb5CY9+mpv8rwrWPLdmM145mWV9kNt
         OZFKkHlv4Cj3dUIbg5D7ywYKye2s4grbpJOGg94gkceyuPQm0ICGXxdc9GO2VXJf7nTQ
         AmU5jKqOYrm94NpDbEoH0umtv1aQ7sb1ZmN1W1hp9Y5Mj0qKne7HYoLwh1ZTKIkZkCfR
         MAj33pG1aNPn+dhhZpq7q4VoBqEPk9VwZwSDDTEbZ4gtaoxllr+QlAkwPwb2iyzKIcXO
         qNlV2dVf4NiWU1uOa4p8P7F4KvK0EzoRAB5Yl4zwlUJU/cwEDER+5Tu8mqxLJ/zkOU0A
         /mKg==
X-Forwarded-Encrypted: i=1; AJvYcCU6KsokBYcyUz5CH5YD5dzoS/ENB1zdlKJIyUpRv+gg+nrt0U8AsJaXAcc/aRk/UMY/BpPq2rQBrZloVH8Mvc2sQEs/QmOAs08JFrsDkmMqGAoc/TpZDNtcIwd7jc5/9hmCEAZ+shSWF37CpzX/OpEe5jE6xZjTHf9XGf0YRyhBsETo9kgcSoBwt5eCA1YBvMucthcWATE/jpkuTKWHwVfbxss2aFB7
X-Gm-Message-State: AOJu0YyRuUdvmtwnEAb098XzvvxdtRjOi32HFD6rAE0GA1uqekyYvCJq
	sxcIlha+LrV+96TUxExZN4ADoZi8Oe+fycPRcrTkW61c7+NgZrUTGbI6pH4nlzDxYKEQ41UFUWv
	W1B8NoMnh8VOsUFSGsevsis6eYzY=
X-Google-Smtp-Source: AGHT+IGsViEbnSwEE/wvKkUx//2BFBpdXj30JIkclbqXuOAfXLH2e+rOWSiqcQD1tRYdVcJiNlFPXrzX1F5GJgx3AUY=
X-Received: by 2002:a05:6122:991:b0:4e4:ef4a:252d with SMTP id
 71dfb90a1353d-4eb3a40cfc4mr2483049e0c.8.1717577637637; Wed, 05 Jun 2024
 01:53:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240524082800.333991-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240524082800.333991-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdU7+O-+v=2V83AjQmTWyGy_a-AHgU_nPMDHnVUtYt89iQ@mail.gmail.com> <CAMuHMdVs1SuVeWGWEbkO68pR-ZGjqAhwjLT7UoR85j7udVbb1A@mail.gmail.com>
In-Reply-To: <CAMuHMdVs1SuVeWGWEbkO68pR-ZGjqAhwjLT7UoR85j7udVbb1A@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 5 Jun 2024 09:53:31 +0100
Message-ID: <CA+V-a8tOV_4p0HZdb1xXgwv0m+op3OZxijLG-ydR0RxigKCRCg@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: clock: Add R9A09G057 CPG Clock and Reset Definitions
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Wed, Jun 5, 2024 at 9:29=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> CC Greg
>
> On Tue, Jun 4, 2024 at 5:46=E2=80=AFPM Geert Uytterhoeven <geert@linux-m6=
8k.org> wrote:
> > On Fri, May 24, 2024 at 10:29=E2=80=AFAM Prabhakar <prabhakar.csengg@gm=
ail.com> wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Define RZ/V2H(P) (R9A09G057) Clock Pulse Generator module clock outpu=
ts
> > > (CPG_CLK_ON* registers), and reset definitions (CPG_RST_* registers)
> > > in Section 4.4.2 and 4.4.3 ("List of Clock/Reset Signals") of the RZ/=
V2H(P)
> > > Hardware User's Manual (Rev.1.01, Feb. 2024).
> >
> > Hmm, I must have a slightly different Rev. 1.01 ;-)
> >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > > --- /dev/null
> > > +++ b/include/dt-bindings/clock/r9a09g057-cpg.h
>
> > > +/* Clock list */
> >
> > [...]
> >
> > > +#define R9A09G057_USB30_CLK_RESERVED0                  197
> > > +#define R9A09G057_USB30_CLK_RESERVED1                  198
> > > +#define R9A09G057_USB30_CLK_RESERVED2                  199
> > > +#define R9A09G057_USB30_CLK_RESERVED3                  200
>
> [...]
>
> It has been brought to my attention these had been named *RESERVED*
> deliberately, to avoid disclosing their meaning.
> As these definitions are part of the DT ABI, and the DTS writer has to
> relate the names to the actual clocks in the datasheet, and to the names
> used in the DT bindings for the consumer devices (if ever upstreamed),
> I find it hard to accept these for upstream inclusion as-is.
>
The other point I want to add is that the macros, which are designated
as reserved, have been included to prevent any breakage of ABI. In the
future, if we plan to add support for these IP blocks, these macros
will be renamed accordingly and utilized in the CPG driver.

Cheers,
Prabhakar

> What do other people think?
> Thanks!
>
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

