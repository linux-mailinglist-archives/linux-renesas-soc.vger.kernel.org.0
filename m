Return-Path: <linux-renesas-soc+bounces-20532-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFF3B26B7C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 17:50:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C1E4564793
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 15:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 915E31EB5DD;
	Thu, 14 Aug 2025 15:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q4nWMfdS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC97332142D;
	Thu, 14 Aug 2025 15:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755186106; cv=none; b=YEtLtcXCqiiESgayM1QvXovEcpvKc+4rYDxEkpW0s/EG35lLL2x7yk2XqjFGaesop07mJ4wYzmZlwaWyQQLqE6hbdxDsFeGnRVhTcpIwgQ6rmjFmiPHIzFbdgGhIVPtOTCjkvRmP9N35vs0q/NzWsYsWkMIVfzafwLI3aXfVUF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755186106; c=relaxed/simple;
	bh=zl4nprwzlKIUy3Q1chqqvC05f1gTCgwe+zmNz+8kyuM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VAL+Y1KaLZYF2dleE9zDDB6n0xHjJLK2N7FP5k0HVkBPBLIGXRYAKRCnkaTlL3kNYJUxJLktlY7YgQhg9hLKacjMx2GstCE2VLYU7GpQPjVpdBzQj5mAgXbugVHwlf/Bg3zxGO6N/rVZFfSX1j8SjjXy94j8VwtyzJ/E4VrhfvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q4nWMfdS; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b9e4148134so571991f8f.2;
        Thu, 14 Aug 2025 08:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755186103; x=1755790903; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ktELRpls4QKsQ+KH2BZha8Abn8cFNHSmcdeY0FLg2aM=;
        b=Q4nWMfdScEAhNVZG1U9ZCYHV+JBFgkduiuwgBsIEaeZVF+Zg8ateA/v/f1ue8UaOu7
         v0KoSPcx7hMsA5kV51kV0+04IIUI5bSWKUv3k5ki0591k+5zkO+GDRt0Zn1a1UxZH4wy
         jYwK8tTsVgPhz6vpGhYsO5anq23qSX+ULeyeNPzOfksg+xPjzo3Ss4a8wsh37cLfE0ez
         4Cte1DJe/HdD+Twnz3WEZexpzl9MfUc4H6OFobAd1RUXY2spGqKO9kUmLP9q3cO2dsfw
         /jdVQi/hslhPnQ73xSubJb4h0f7YN6iT1SdpwJEXHD1sFYHOdA8YWvGpc/T2L5x9j1wZ
         CpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755186103; x=1755790903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ktELRpls4QKsQ+KH2BZha8Abn8cFNHSmcdeY0FLg2aM=;
        b=f3yr+Mn7qCysNYfH04jARnz3eszq4lw02AN1NtPuhZH2REUdYmSCn/xepaRAB2HKRA
         wfcnTLrhet4GiyE5dVB2LbZfoI7shK8BR8oaewryqVDfZU2gO4kuAv3khFLhjYqu6h8t
         idFpVh3d7L4tNA4gKiI+GPrm3yqdlDcKIci4mwEWzqXS4Pucv8l5rrlmIJS8QaznjMgT
         gyNPkLJBrcnI2CEDv26a4LMMfUOUEBykcdTNk7+XixWdqzTV8Y4yYAmr63Azg1iwPoHC
         ofGizgXtgYgh4/HmuWTdE0QxoaERjw4cmP6WFIhOJYNCGygcnnAfnqlDVzDSTOeSy1Kg
         tLcg==
X-Forwarded-Encrypted: i=1; AJvYcCUcitugla5kTRncrgDRM3qQ8IqVtzUokuaMohSBdJ02Xos42EQLRAjSTlG2dfEuGI0eI6DsfSq42pfTDNUo1VIGMOg=@vger.kernel.org, AJvYcCUj4Le+y8AeeHiMQ1DqMx7wEpZ0Cre9q3RBbm6l70gEkNSsi4CJRO7JwQdSJu8Y9SqfnVsWrzcmiA8=@vger.kernel.org, AJvYcCUz3ZKXpHT+AKWRGl1DQLsbMH/4WLzkixiydQvteUlJ4P52DXQtupUxdGRxre5ukfFuSwtrns94t2rjob8w@vger.kernel.org
X-Gm-Message-State: AOJu0YzVqGOyHQ70NFoLiLkxgaR6x+Fq4I/Gx8rzq7y2bZDaaXEDPVaa
	df3BG4R7SnFM7mw1SntsmZZbG0+LTIY8VWxJWIeXKLFMRJGZR8bCGiqPNglN215eUdhugO5r1Jj
	oE2fpbHHq/HPfcozmK3i8DzHXgEfy/iw=
X-Gm-Gg: ASbGncszVZco4AZFI7Jc0Ns+2XxZ6BJvt1CF9W/m3dNxiNUV6wkg4bRz8syfS/iffAI
	ytfjYU+XGYRxIzRDa+MQlPeowctiakT8gkJz5P+f9axVvD8ZkPyRWUDSDhlbOELBFyY9zj23uPG
	YNbkUCzaJJig7tbfBW2pzQQ3ZCNkNbhBau20TF1sx4Oq0vJnYIYj+LcnWTPDExHDCerxLWw/IUG
	IBNb13KqekLIBnLOh6pnJ4AGphgog==
X-Google-Smtp-Source: AGHT+IGQgleFbs3fqH8e7omz0i7Nmtu61u6PAbtgtfqbSxLsswwUcW494BMucvo3CZ8wNBXE9dUepyV6QozxJXwGwGk=
X-Received: by 2002:a05:6000:2911:b0:3b8:eb7d:f82a with SMTP id
 ffacd0b85a97d-3b9edf8ffd8mr2692507f8f.3.1755186102745; Thu, 14 Aug 2025
 08:41:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812171720.3245851-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUFUTpA711xfGOyc7iEMnML1qesYv+ZTP=SEh09yLGXJA@mail.gmail.com>
In-Reply-To: <CAMuHMdUFUTpA711xfGOyc7iEMnML1qesYv+ZTP=SEh09yLGXJA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 14 Aug 2025 16:41:16 +0100
X-Gm-Features: Ac12FXwpnVSDGCBCyDNMKTSpRaNyFLKuvEwIe3vB0vFeD7XDuR4X6tcs-Yc227M
Message-ID: <CA+V-a8smWQaYvt+kbRb_tmhH+-2Zt+eag=unJECH=xSUzjRrRQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a09g077: Add module clocks for SCI1-SCI5
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

On Thu, Aug 14, 2025 at 4:23=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 12 Aug 2025 at 19:17, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add asynchronous core clocks and module clocks for SCI channels 1
> > through 5 on the RZ/T2H SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/clk/renesas/r9a09g077-cpg.c
> > +++ b/drivers/clk/renesas/r9a09g077-cpg.c
> > @@ -48,6 +48,11 @@
> >  #define DIVCA55S       CONF_PACK(SCKCR2, 12, 1)
> >
> >  #define DIVSCI0ASYNC   CONF_PACK(SCKCR3, 6, 2)
> > +#define DIVSCI1ASYNC   CONF_PACK(SCKCR3, 8, 2)
> > +#define DIVSCI2ASYNC   CONF_PACK(SCKCR3, 10, 2)
> > +#define DIVSCI3ASYNC   CONF_PACK(SCKCR3, 12, 2)
> > +#define DIVSCI4ASYNC   CONF_PACK(SCKCR3, 14, 2)
> > +#define DIVSCI5ASYNC   CONF_PACK(SCKCR2, 18, 2)
>
> Please move the last one to the previous block, next to the other
> SCKCR2 definitions.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-clk for v6.18, with the above fixed.
>
Thanks for taking care of it.

Cheers,
Prabhakar

