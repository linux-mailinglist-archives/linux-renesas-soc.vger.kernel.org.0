Return-Path: <linux-renesas-soc+bounces-11083-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A83F19E8CB5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2024 08:57:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90E28164B28
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2024 07:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DF9621506D;
	Mon,  9 Dec 2024 07:57:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD3521506F;
	Mon,  9 Dec 2024 07:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733731076; cv=none; b=kyfeeEMbepwSXuECJmuRKe6QEuIbe9dmJQc75UfOA3ejNQ7S12cp6ab12DoF2I2NawF0kXyWLFO6NmaKafLQruYvE8FKvMcFRahKm3YgNf0R8JKSSJ5VrzyOyryiCzsiGPRVcnBxe0c/48isQ080NWU9qIPBcNp8n/AtkFSIt4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733731076; c=relaxed/simple;
	bh=RIa2kOzACgFkRzY7fcBR76qUkQAYeIrmNbpzmK9NbQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iDkR7grrMXo70ZX0b9iP9cysBQrAVkUyDCjNvbZqIlUMnWhk+wx+1RcjAnkVVqe0BtJCO734kC/xOOMkyA9xovrHE9DJV0ndy7VGeo2eXDYPHvw8nR703EwSudBz0wFw70D3LmThECpk9AQTwRsk3PrRZM9aTeJkSaU0p/9OswI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b6d08cb7c2so63820285a.2;
        Sun, 08 Dec 2024 23:57:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733731072; x=1734335872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qk7zs9BOOihPQGUTMvGHn5Ym+4dxQx5CVpUjftA0HQQ=;
        b=DfaE6H+EIVEDn5aICzm3VT2nPEudRudn9K3358KK92Gx5vdp97TzJXjZHqi4yorKuC
         vHrc3rLUepeYGKVuZgpdgsDV3sSMpu0R4rYbbnw3WvMQwmF6YgOJMrbOT6snw4zBRrxu
         Uif71fp1vMGnUtW9UXzuLjnHJcxP1XqRrTG4eZK85PYAZeEoJb5FQn5szyPXVx/kVsG+
         lEha7R3sBLxKy/8qiBRJzdP6DxgRg+hRNTHWK3KnNmg/TaOqAZBe2KqOv427BlEEDyKk
         aetFTPC4WEgwQD4AqQYX0lV+hyEZLYCNRqm6uKf1SlP6W4sT0lccFca0Dx3f1OwYEiEG
         +zeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPLtQicr0nxM4FafVz2l0I4ozMqiBpSP7OTN0VebLoBP27DmmEP5C9UCQFN29cjoUabcphekHE9LRz@vger.kernel.org, AJvYcCVO/lgFUkHfxiazDeguEQxx0iH9FobSuqXkj7nj6LfRk7bk9jQiJ2+SeaEiY95+JQr2Pj+ZffCM3S6KCWpXbYTq5uM=@vger.kernel.org, AJvYcCXZrfggQd2L0WylnMGeZ2zBHQZf6brL6BRXkZvDYT3dX4cV4TrPlStp70vOcMRFWsPwlhhLkHq1LYAK@vger.kernel.org, AJvYcCXuRLsFIu6XiE1a03T451dvABVP1Yijcr31E59nZL3fhobyLy0PEAT8VuqFw/7d8WysV6qP3wyQMHZ20bxQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yztk4TRb0jojauNsfJLqA7iKfSteaYMngnBIpAc1R6cAEtI6VM8
	LFHGqT+CUe5GT9jRpMW4u6RYg+kcy9RY1Quy45ef7Qb9OmKNqXBJd4XZs84c
X-Gm-Gg: ASbGnctH4E7PC7cViQrFNpE0zl1jZ8mKq0zVLIGX6iT6pc7/9r3fWsAe7+DKRhYcYhY
	WkUv7WrKgitAAacyjPJHdzEMbqSIJWLkFI72ChqcjVNr+Q4zvZaaF51fK7p+vFykIi/dJUCyTEF
	Fcj6gVR9JQdWRR4yA1rCgDGHx5TQDljaNvzrF0y+rQklLbjIfDuKY96MxGfNqSKv6hiWSao9hUy
	+eBihXvug8rSSjrb7jeeE0S3F+vZDbggtMdcqcAHDprmhJvR3JvEWlE9CkHK5BypN/LlLJXB+6k
	7bWUpJM4O9Ta6Rkd
X-Google-Smtp-Source: AGHT+IGUnQ97y15elEkOy0iEyVN6f6wNoJWVGV7xDQz21NOXLb90IgiciAMUIzQASbbztlkrcZ3E6g==
X-Received: by 2002:a05:620a:4897:b0:7b6:c92e:2e6d with SMTP id af79cd13be357-7b6c92e2f11mr949687385a.52.1733731072282;
        Sun, 08 Dec 2024 23:57:52 -0800 (PST)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com. [209.85.160.173])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6d4e837a3sm83590585a.65.2024.12.08.23.57.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 23:57:51 -0800 (PST)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-46760d9e4daso5252871cf.0;
        Sun, 08 Dec 2024 23:57:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUIXbnVTtcGyi0l927ur3+fMUXE9ot88QfkeC6Sgj6Uwt4IQqqCfriaJMo7BkERmsC3HAnVVpoW9xd8WnKv@vger.kernel.org, AJvYcCVDNDHnuLQhy/CUJpH27ljuzJwtpKhayGeDVE+rdkC0AYYVW470qQSPi5S8UdsIvw7Vwx5hPWMTPpHV@vger.kernel.org, AJvYcCW0wNJNaBGXhDiv5VaXrCKabbGQMOa94Ke6pcyTK2CQQchUlDdpiyqJuRbkXgaOZY58Zgk3zK1wMo1V6cEw6nXwXB4=@vger.kernel.org, AJvYcCXyMoeCCBrSMt8FWhHL8oD7SWYMbbuUFN81JU3YNRFmQyo23LU2YHRn7T69IUBwiuujOz9v9ma8fNXG@vger.kernel.org
X-Received: by 2002:a05:6102:1152:b0:4af:e135:1ca9 with SMTP id
 ada2fe7eead31-4afe1356f47mr3950083137.13.1733730570269; Sun, 08 Dec 2024
 23:49:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com>
 <20241206-rcar-gh-dsi-v3-5-d74c2166fa15@ideasonboard.com> <CAMuHMdU+PPeCNb5y75A1YTf1EvvCQEgD1t-=6C_YyK0gDK3R8A@mail.gmail.com>
 <b0fffc87-a72e-4041-b3f6-7f2a4987916e@ideasonboard.com>
In-Reply-To: <b0fffc87-a72e-4041-b3f6-7f2a4987916e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Dec 2024 08:49:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUmAbnbJ-UouN+dnodVg7+Lw47to-O4rTAcDanQ=NCGpg@mail.gmail.com>
Message-ID: <CAMuHMdUmAbnbJ-UouN+dnodVg7+Lw47to-O4rTAcDanQ=NCGpg@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] clk: renesas: r8a779h0: Add display clocks
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	LUU HOAI <hoai.luu.ub@renesas.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Sam Ravnborg <sam@ravnborg.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-clk@vger.kernel.org, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tomi,

On Mon, Dec 9, 2024 at 6:26=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> On 06/12/2024 15:43, Geert Uytterhoeven wrote:
> > On Fri, Dec 6, 2024 at 10:33=E2=80=AFAM Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> >> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >>
> >> Add display related clocks for DU, DSI, FCPVD, and VSPD.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com=
>
> >> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.c=
om>
> >> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > i.e. will queue in renesas-clk for v6.14.
> >
> >> --- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> >> +++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> >> @@ -179,6 +179,9 @@ static const struct mssr_mod_clk r8a779h0_mod_clks=
[] __initconst =3D {
> >>          DEF_MOD("canfd0",       328,    R8A779H0_CLK_SASYNCPERD2),
> >>          DEF_MOD("csi40",        331,    R8A779H0_CLK_CSI),
> >>          DEF_MOD("csi41",        400,    R8A779H0_CLK_CSI),
> >> +       DEF_MOD("dis0",         411,    R8A779H0_CLK_S0D3),
> >> +       DEF_MOD("dsitxlink0",   415,    R8A779H0_CLK_DSIREF),
> >> +       DEF_MOD("fcpvd0",       508,    R8A779H0_CLK_S0D3),
> >>          DEF_MOD("hscif0",       514,    R8A779H0_CLK_SASYNCPERD1),
> >>          DEF_MOD("hscif1",       515,    R8A779H0_CLK_SASYNCPERD1),
> >>          DEF_MOD("hscif2",       516,    R8A779H0_CLK_SASYNCPERD1),
> >> @@ -227,6 +230,7 @@ static const struct mssr_mod_clk r8a779h0_mod_clks=
[] __initconst =3D {
> >>          DEF_MOD("vin15",        811,    R8A779H0_CLK_S0D4_VIO),
> >>          DEF_MOD("vin16",        812,    R8A779H0_CLK_S0D4_VIO),
> >>          DEF_MOD("vin17",        813,    R8A779H0_CLK_S0D4_VIO),
> >> +       DEF_MOD("vspd0",        830,    R8A779H0_CLK_S0D1_VIO),
> >>          DEF_MOD("wdt1:wdt0",    907,    R8A779H0_CLK_R),
> >>          DEF_MOD("cmt0",         910,    R8A779H0_CLK_R),
> >>          DEF_MOD("cmt1",         911,    R8A779H0_CLK_R),
> >
> > As mentioned by Laurent during his review on v1, all clock parents
> > should probably be some form of R8A779H0_CLK_S0Dx_VIO.
> > So I'm inclined to replace all of them by R8A779H0_CLK_VIOBUSD2 while
> > applying, which would match R-Car V4H.
>
> What do you mean with the above? First you say the clock parents should
> be some form of S0Dx_VIO, but then you say you'll use VIOBUSD2. Aren't
> those unrelated clocks, from different PLLs?

Oops, copy-'n-paste went wrong. I did mean R8A779H0_VIOBUSD*.

> > Are you OK with that?
>
> I'm fine with that. I can't really get much out of the docs wrt.
> clocking, and the clocks I used were from the BSP. Afaics, it looks
> similar to V4H, so it's probably best have the same clocks, as you sugges=
t.

Agreed.

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

