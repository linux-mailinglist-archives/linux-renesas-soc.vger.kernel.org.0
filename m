Return-Path: <linux-renesas-soc+bounces-21478-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B111FB4572A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 14:02:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D7AD162A56
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 12:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F1F22F5307;
	Fri,  5 Sep 2025 12:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lr1TrZr9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C253319E7F8;
	Fri,  5 Sep 2025 12:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757073771; cv=none; b=sgKFQYEq8MwH13kGbU8YI5zlRx8r3gTp/O/MZQWVdcvH6k7yD2BN+PhQ3YIPf+sPWhVaJQIixonOPCJOxWAoth8dE7/SozGPrF8KCN5MmGCq1/sJ/425YFjKfT4iv1ORV1alxGRxoSV0T2J73BNVdpnHa+0HR5TuCNva6E++7+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757073771; c=relaxed/simple;
	bh=xnlQwHesXOP2dDDQ+aWTnF4TrrBacXBh9qTURWV7gwQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q4DbYBCiXcSi/onB7rNa0IY4Wlvvie6JzSPraPjnD388fnmAqyzJByX2hHUWjbdl+iFelbsx+5lEoMtKDzXVj8JQIxbnFCxFVs+NPG6AFU3+vdE3mvXLza9BN54BXLb/oETJofMhPyDh3RkU2x5JMaa1NEIE0KTvSGOxifj7ok4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lr1TrZr9; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45cb5e5e71eso11785295e9.2;
        Fri, 05 Sep 2025 05:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757073768; x=1757678568; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2p9jOJsI9vaYor/gi7quDFPvwuxPBD5F0qxTD9otNVs=;
        b=lr1TrZr9q5rxHfBoEGDh/LIL7xwuUJ87TdUpSTvJKD/Idzz4ixalH0rDKMfV9LQpUf
         teCMieTFbyz7SYMWN6oGMTTE8DTiwaUqE+Bf1uvR6gHAw69ifr51AfEzW4MPqZctydr/
         edTn2DROOxxhmMSvG21JYQuIn0viPyH9RqPtKToHZTM0+xd8dnmc1LlUzxNcNcUFdcJj
         hOLYsU4lAL//CH1/fA8UVUndsWK10DpjMnYwjyoAvQh7wSM+zx5opCRPsaPJ0ETe2o5N
         PSacupNmYSHlpH1nAp1c06WhxeKsv1TC8o12BmSIWCuGSRz5cwcgCEXJVTTDPr4nS2lB
         HKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757073768; x=1757678568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2p9jOJsI9vaYor/gi7quDFPvwuxPBD5F0qxTD9otNVs=;
        b=K6XWGe6QPp/wNAKmd0jlh4BBjJ8pQDzkBSll/dKsgoyZB/bv8SgAG/qVJsrYTbLcxF
         aEbtcWIE6TZDDZ7Sv5B2oUvEkEW0D95Bu3Mwz3sHYqxeT2MVTIiWv56gNg4DD4ZFciqQ
         Eqz9kZe8rMPxig+B54VZ2LP7eKhKkIUX+pEOksddYzThr18Gw9bUxrNSb9aAXwk/Fa1o
         oEouS9MT5IZrWmG2N+swjDeZqoe3v+/7fCsMI+5HUE8QN9FLxJk25YTwz3zdF2mdXkOM
         NsO88xyPzQWd70QjvYcTWhvtLw0mnXrJzotkLkFXUBCHPAzkpC7ckKS8M4mj53e9NR4K
         Te3w==
X-Forwarded-Encrypted: i=1; AJvYcCVULaNfNEXdwklhwRfzTJ6Ktn/jAo/2hVoyvmReMElOHwlPnNfsy7VMQUBoGTYG7T/WswSVUCKeia8n@vger.kernel.org, AJvYcCWDyUZIwZxp6MDguLjJnX3eWrVzOTzNQUE/46KiFesXLZoumT00A2GhzpPewODJIyRnDPlUrCsWpIM5kpK0@vger.kernel.org, AJvYcCWR3IMZm/nkdqAx5IsWPA3JJZfUP3lVs2oTa9UKpsIXJ8BBNlEtEL3isCupIGznlKo6xJt9nT59OK7m5+EwUEii5MM=@vger.kernel.org, AJvYcCWdzRK0gKkluXJaKL4dtgDr8uKQKiGL/oaaemlHBgkXzW059qNRPo2N0g6wiY2/ILL2DohBM45V@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/bQz5zhIV+hF0+WQBXTM9fMYV7OiCY5C9Cd5tuD2jxGHDScUG
	aaQbfrVZUiCv/dLIqbn+ONZ6lOJfPK06R9JusHf39fE6oVtnR6KSMC+0gFbODcS0nJLf56kRqnq
	RkyrNzVNUL62rJDVy9jRAfXmg7J2SLGQ=
X-Gm-Gg: ASbGncs48aITaWUmOhoUKwCVsZbzEdzFfHTS7u3JB97N7E2HxPnwf7OC38IzUJ0Xwiy
	nSP2X2Xvon/PsDxLANaJm5i4LsGOiwsWwIs7XrBqXnbBH7aCymqIzpxIhvjVjjsQiwdqSqkRNq5
	NcvfYOkbWbrcG2ESyqG0LFU9bUn3RFURpI2F1afrv/fbrXtCzsyfwZtzlCz8LVhRXg5K8zSJDHi
	BKW/UnzAR0cI+ocawzIESMSFD1qtRYqDVcIQ/4PnVpk5KzkPlg=
X-Google-Smtp-Source: AGHT+IFdNbes9YOJazZ/jkcC7CpYUmvjmyTzctIHw8JngzIufBAJDltcfI9aEkGQ17kqK8mcwsYN3FEysIuAXVo08Ec=
X-Received: by 2002:a05:6000:26c4:b0:3ca:4e3:6ea6 with SMTP id
 ffacd0b85a97d-3d1dee6d7e9mr19290849f8f.46.1757073767683; Fri, 05 Sep 2025
 05:02:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250904114204.4148520-7-prabhakar.mahadev-lad.rj@bp.renesas.com> <021e970a-f606-4702-9f0e-b4b0576bc5d6@lunn.ch>
In-Reply-To: <021e970a-f606-4702-9f0e-b4b0576bc5d6@lunn.ch>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 5 Sep 2025 13:02:21 +0100
X-Gm-Features: Ac12FXzxz3naqLRqdbTKPufgNXpGKRJOQO-Ub4jeyjydA7gw1aMStbQP7vFttuI
Message-ID: <CA+V-a8vudqkkdZDyvsBeuKCgGBYCeA4ydMgN5b-+1nkWcQe_0w@mail.gmail.com>
Subject: Re: [PATCH net-next v2 6/9] net: pcs: rzn1-miic: Make switch mode
 mask SoC-specific
To: Andrew Lunn <andrew@lunn.ch>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew and Geert,

Thank you for the review.

On Thu, Sep 4, 2025 at 9:37=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Thu, Sep 04, 2025 at 12:42:00PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Move the hardcoded switch mode mask definition into the SoC-specific
> > miic_of_data structure. This allows each SoC to define its own mask
> > value rather than relying on a single fixed constant. For RZ/N1 the
> > mask remains GENMASK(4, 0).
> >
> > This is in preparation for adding support for RZ/T2H, where the
> > switch mode mask is GENMASK(2, 0).
>
> > -#define MIIC_MODCTRL_SW_MODE         GENMASK(4, 0)
>
> >       miic_reg_writel(miic, MIIC_MODCTRL,
> > -                     FIELD_PREP(MIIC_MODCTRL_SW_MODE, cfg_mode));
> > +                     ((cfg_mode << __ffs(sw_mode_mask)) & sw_mode_mask=
));
>
> _ffs() should return 0 for both GENMASK(2,0) and GENMASK(4, 0). So
> this __ffs() is pointless.
>
Agreed.

> You might however want to add a comment that this assumption is being
> made.
>
I will add the below comment for this, so that once Geert's series [0]
hits in it can be easily searched and replaced.

/*
* TODO: Replace with FIELD_PREP() when compile-time
* constant restriction is lifted. Currently __ffs() returns 0 for sw_mode_m=
ask.
*/

[0] https://lore.kernel.org/all/cover.1739540679.git.geert+renesas@glider.b=
e

Cheers,
Prabhakar

