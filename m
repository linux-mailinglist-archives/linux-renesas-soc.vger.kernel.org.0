Return-Path: <linux-renesas-soc+bounces-20806-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F43B2E719
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 23:03:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF9551CC114D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 21:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C41CC2D23A4;
	Wed, 20 Aug 2025 21:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M2BohS8l"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01911E7C05;
	Wed, 20 Aug 2025 21:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755723819; cv=none; b=uCqefQIuAPEuyxN8mR7U0MKPdqoykUjSLH3DJla3e+Cqg21RwLvY9arQhUSJ9avBB/KuDSEw+GxoqhHexaIJn8Gec55uO0Ql7oRqaHqDr4qRfUBUzeCpO3AfGJ0LWNp2aMskDq+03t7roVOB797lO5PwlTh4MrSTBcdATjM2+6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755723819; c=relaxed/simple;
	bh=/Krm6oMI0v+oWZonyCK8RTpBMEwuoKybf+LKB2lZHqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t4OJrz+hKhTY97OeM0qtCTaf6MwSMpRKAFEvSGS+7MrMnjiYfYYo635WzI+zjKwKSVaT9X7f6VmbyyXcv28Dg4bjHayo1ncKDUgJXM5trx4PmEwGFtIEmEmftAgzQqrGjRiMSAcvwpgpFV32KkIPYHUgyl5iX2EEOaWYcygg4FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M2BohS8l; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b9e4148134so204767f8f.2;
        Wed, 20 Aug 2025 14:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755723815; x=1756328615; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vy010xYTys+UZoDQTPjjsGwPqUv0ncRF4YEufPj6XPc=;
        b=M2BohS8l6tu2t+uOOdKfTC9JtxFtudjDqDgRuc788fCf781UL2Xhw0RKVo3mj+wLxu
         H2tFgVdsRcnMe9CaeV06KzaTaOF8TPVWb1dkfYts+/6bYEDPeuATADqc0dRACsoLmxf8
         I/x7hoYq6+nafb/dkbedC5S4DtMPn+ojECW5Sx0cPkxaQP933lVB7E6FXYbMYtDx+If6
         q9qNtkwB9eWachA88Xu+OvBdt0mkhxohqFCqb2+SyoTS/g8NXUQbJgN2uN4K/jOVTlOY
         4h2YBX/sNnDisOjuliWE3RiznW7jYO9GrJJaNBgufg53/TYuk2xZbyP0I1cgcVDuSv4P
         vZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755723815; x=1756328615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vy010xYTys+UZoDQTPjjsGwPqUv0ncRF4YEufPj6XPc=;
        b=X5+O0LFBC2RAwOr8T3g2aGsuJhxEPSn5NEnrRHu4nbBggIQUJtg0mG8kNx9sLXV2EN
         Jixr3NejONwSnbxbpPtgphSf3nxavpiTMmEQyBTxV89zBOXtmFH+OOrz5iuJgB1bRd57
         5EgzYfXFsJ+s7bRRSLIPi0oGgfp2A5tan9Tl2SfRSCOFcg+APFVWcXkhN+Zm7MazrwKZ
         VCJpP/YIDAiDbshQugw4PA5snPTxyUDeMC+d+c59gs0xGO5e8clxZ3qJj5q4XkIHpliZ
         tNe5jGNnOPtiT3hPcM1+7iaAMJBSbjp6DZHUGOAkPGRbsHV5wYgiKGfxOBH+U+NmJk/N
         kXqg==
X-Forwarded-Encrypted: i=1; AJvYcCUoYSB11NltIIBwbb+qR8syWmN10mkM6TwJPYgQjsp/nXfilvOzzQaX3Icn58SLzhstpJ9OKaBepZf9WfOE@vger.kernel.org, AJvYcCWbq9i1EysBMMD3kU9YCB4aHtNZmxL0UIeswt5qQNnW4NfZJyHSIzVcIskka2rgaHPixIL9SF7acsCi@vger.kernel.org, AJvYcCXUlR6ESN+ovVU7bRJPK7h6mbWOdvuGFwskiY8XU65oWE7KjaRqqIcCcWeaIs5GZyXTDqE5DFDUiJxG@vger.kernel.org, AJvYcCXnt3cfwufhePPYdxfZiLNhWzvYyabl7OmjbYGE6GpuqhEamelSRNeWCPpjFqWSq/8L7/WYCMqEIrjZqxGkuxEz9bA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkX7UBftSMMsc8ar8BdHWWrc+QDpWtFrZXMWCLTdwAKRihXvkE
	jgDt65/QjSgXIWh29HyJ5stYnYXOBg3l8rXApWaooyh7cVtZmXUk9qr0g+L9rkgie007cWU5kRh
	UP0n3PPbJTCtlmAXuuDQXbnZpLhbSCMQ=
X-Gm-Gg: ASbGncuKcj3McBMZxuE7AvMF89rX1xgkHhkkJeu31ULDjqVhSG+3DSfpBsw9SvnOQV4
	qiQwFcSOiBDB9RD1HE10heOHBt9q1/AJ0adZTZZS/LbtstEXVov/YOwXZhQIc7nF8Dkn81+QcJe
	d3conCa0GW7uwPRG4yjbgla+HqQe8bk2GlhGMClB4AwM/gw+zt72JoJCdmkAA9StQBhq520MgxW
	V6qMpaVEKQbvA33M2yUCLQqU2IT/XGmYW9zWwQ=
X-Google-Smtp-Source: AGHT+IGT//JNStzo4AlhT/6OheyMDPgA/6lgp/LDJeHE9GSKv3SnvMDHwyZ3usfH9U7sFiP3cseTePwHmagievN+lhs=
X-Received: by 2002:a05:6000:2883:b0:3b7:75dd:f37d with SMTP id
 ffacd0b85a97d-3c4916baf57mr176679f8f.0.1755723815030; Wed, 20 Aug 2025
 14:03:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXSJO1MOoNS5M2M1Zs=iWmiBbmc8Xc9tMDsXd_kM6bj=Q@mail.gmail.com> <20250819145401.GW5862@pendragon.ideasonboard.com>
In-Reply-To: <20250819145401.GW5862@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 20 Aug 2025 22:03:08 +0100
X-Gm-Features: Ac12FXwsqvwmh8r7YOIa3bc7OmC72sWL4CV-OApkkov7Ybminzq3pg16uZOVgCk
Message-ID: <CA+V-a8unzKr_VhOsUihp8fNgmPxcOy1618qtY0xKXJ7qGCHb1Q@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] Add support for DU/DSI clocks and DSI driver
 support for the Renesas RZ/V2H(P) SoC
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

On Tue, Aug 19, 2025 at 3:54=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Aug 19, 2025 at 03:48:08PM +0200, Geert Uytterhoeven wrote:
> > On Mon, 28 Jul 2025 at 22:14, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > This patch series adds DU/DSI clocks and provides support for the
> > > MIPI DSI interface on the RZ/V2H(P) SoC. It was originally part of
> > > series [0], but has now been split into 6 patches due to dependencies
> > > on the clock driver, making it easier to review and merge.
> >
> > Thanks for your series!
> >
> > > Lad Prabhakar (6):
> > >   clk: renesas: rzv2h-cpg: Add instance field to struct pll
> > >   clk: renesas: rzv2h-cpg: Add support for DSI clocks
> > >   clk: renesas: r9a09g057: Add clock and reset entries for DSI and LC=
DC
> > >   dt-bindings: display: bridge: renesas,dsi: Document RZ/V2H(P) and
> > >     RZ/V2N
> > >   drm: renesas: rz-du: mipi_dsi: Add support for LPCLK clock handling
> > >   drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC
> >
> > On the renesas-clk side, I am (almost) totally happy with this.
> > Any feedback from the renesas-drm side?
>
> Tomi told me he added the patches on this review list.
>
Shall I send a v8 fixing review comments from Geert or wait for Tomi to rev=
iew?

> > The last patch depends on a header file introduced by the second patch,
> > so I will need to provide an immutable branch containing the first
> > two patches (probably/hopefully based on v8).
>
Cheers,
Prabhakar

