Return-Path: <linux-renesas-soc+bounces-11841-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D458A0133F
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jan 2025 09:17:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 072571640BB
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jan 2025 08:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0DEF14D70E;
	Sat,  4 Jan 2025 08:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IibD1BQN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB6213DBB6;
	Sat,  4 Jan 2025 08:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735978634; cv=none; b=quUrsGmdn4cfcJUUR719bSsn3+VNR4H+zg0O4YxzTLiIm12D9eEuGoF3yPsxWwvJFTL8+yYvMFgEpybr6SSk0k2DTGKhSmql/MR3IPoBCrVeZf6G97GSToK4ih3rlyCgUpvXLIhPb7Z08QkflGqh3ZYumxBWRDmfGvwg1N/H7XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735978634; c=relaxed/simple;
	bh=qAY3yF2Yybr7YqskE6Sq4A609cigoJjbc542GvJbEcQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YCvGrwo6JhodMRPB5vNOHe5pqttSkoGbJgk9uz9r7Tw926BYC/5GfUT0dT37dSRfARW89MxnO4vMDt93AS5Mugqd7R3LYx/HGtl03l62tyRG6RzQoN8LobmcT2IZailkD1sQGHPTok6DiiojYE4ou2YkoHnIpvAA3nOoHKHwnks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IibD1BQN; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-51bb029fdd1so4902995e0c.0;
        Sat, 04 Jan 2025 00:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735978632; x=1736583432; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHRM6MzH9NWFaCm5EUSLrsiExBDL/PuwdUDxf/W5adA=;
        b=IibD1BQN53bW+EumXMQkN+OtmI3DgwBTj+p/maoJjMMrjqs/G07+2BCTcjQV6j3Q/P
         RqrSNC0EEv7G8wCMNt6pYoiLjfsMN9zfS2X6VeqTBXNJYhodrYnLWo9Z36qMoGIX0JzQ
         iqFgc5KUxpRX4vDG+g9Se8s6z2tZjl2j9Z5d/OvzGmvGgt16UkZFfjg/67U1pruXfufA
         bopa/WlLEspLOMw60DTOF7NLIzWrKZK+7aZ5NwAiZbBhaCFBD6KJVe7wUMa49VKx70lm
         7/GlsXx+sijzXpyejCaY8kyM6nIGUHUNkF6er81XW6kLGApv70vSoXPnjVUqgFfYvmC3
         Iq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735978632; x=1736583432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SHRM6MzH9NWFaCm5EUSLrsiExBDL/PuwdUDxf/W5adA=;
        b=u+lx00NgVEr3BSzZYgMkkpO2ifFezFlZ00sbvn7iSxQ0YM5B2k/TxtclBTo1qq7Y1S
         pNKlnhVf24pB8aEj8SzxxgHschGqPVopiAmUo7l4L/UPTtMvCaJJClyeXxaqsIElhwF1
         JHxhQS42YM1PwamLHqwL7W9WVOKSiaNPBTPoM+lFJdlfwSaXMys2n5c9+Ufgm7mVJAly
         Hb83UaIOhkeK/UNor15l2y0HYgLGLWDPTeCWP4L6KaI7cEB0lwUNIzYYxbICp8HIIevM
         hTvfc3PlcXXJJVnVyuPrXw3023OZO9J8NC7ieAIxXdWsMDPjTE4LafFKLI8isbYJH23R
         JNIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKzTIUwaOq86oYIVxUs/S/YSg7LgUMkwQj3Yf7bP9HnoiA8OBpMblshJyAvTlwyygB6rf+ctP+AzM=@vger.kernel.org, AJvYcCW3CkIIt1fubamqw6NHYDVL8Tz6tHAI+MScWBaL4wbxJD8egUOtT4TR2SU9LSaw4OiNEXqhYBc1X4EZzvvbLNibZdA=@vger.kernel.org, AJvYcCWxmFuYJrozPKnPwj+cZdPsEMHHSnZkgRWk3cDRDIT4uEj6QWLXujHUlqu2VVPxxspqlercY2ccaTDSxyQ/@vger.kernel.org
X-Gm-Message-State: AOJu0YyrDGZDInK5kKIPNM2HMjhELDAjdi2MPfXTa/deE36aOG1QGitr
	b4p31pE6IFNHjM7wHO3cteyMdOKgDwQ3+2JK7UnM1jlFuWYSoBJ94DbQ9N2JT6b3vfRqyhlDU1I
	t3zJJjeo3O5RhoHFwNM3rB6RT6fE=
X-Gm-Gg: ASbGncujBmejYZ4R8Qo/VT5SLSg5rGE0AznaQ9+qONrgiAcMMpyalh15mhzBObo84+j
	DTCFwnmdMhlhZw9CstD4bzJejsRlRZcriXZRb2Rw=
X-Google-Smtp-Source: AGHT+IEmkAmVxT6uYHyzbxdwnFAmDecchDyOdskigVO+jLWNzWOyth+kyv7h1NuFZGM72XIsxpfCmRfjoPPFKPblJx0=
X-Received: by 2002:a05:6122:4302:b0:518:859e:87b5 with SMTP id
 71dfb90a1353d-51b75c6a74cmr37022647e0c.4.1735978632102; Sat, 04 Jan 2025
 00:17:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102181839.352599-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250102181839.352599-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdW7z5ui5KTnisRS6NNqUazxH-JCmzOWRCozCkVO5xxC_g@mail.gmail.com>
In-Reply-To: <CAMuHMdW7z5ui5KTnisRS6NNqUazxH-JCmzOWRCozCkVO5xxC_g@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sat, 4 Jan 2025 08:16:46 +0000
Message-ID: <CA+V-a8ucSHBEX+P5XDkOxEQTGv2SR-_74TH8PQDoXLyX8jx0LA@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] clk: renesas: rzv2h: Simplify BUS_MSTOP macros and
 field extraction
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Fri, Jan 3, 2025 at 5:08=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> On Thu, Jan 2, 2025 at 7:18=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Replace manual bit manipulation in `BUS_MSTOP` with `FIELD_PREP_CONST` =
and
> > `FIELD_GET` macros for better clarity and maintainability. Introduce
> > explicit masks (`BUS_MSTOP_IDX_MASK`, `BUS_MSTOP_BITS_MASK`) to improve
> > readability.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v2->v3
> > - Dropped unnecessary parentheses
> > - Included RB tag from Geert
>
> Thanks, will queue in renesas-clk for v6.14, with
>
> --- a/drivers/clk/renesas/rzv2h-cpg.h
> +++ b/drivers/clk/renesas/rzv2h-cpg.h
> @@ -8,6 +8,8 @@
>  #ifndef __RENESAS_RZV2H_CPG_H__
>  #define __RENESAS_RZV2H_CPG_H__
>
> +#include <linux/bitfield.h>
> +
>  /**
>   * struct ddiv - Structure for dynamic switching divider
>   *
>
Thanks for taking care of this.

Cheers,
Prabhakar

