Return-Path: <linux-renesas-soc+bounces-15654-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F363FA8209B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 10:55:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45A4F3BECD9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 08:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E04EF25D1E4;
	Wed,  9 Apr 2025 08:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBuVltAO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BA525C70A;
	Wed,  9 Apr 2025 08:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744188948; cv=none; b=czuvhH/VTS2cTU0Fmh44y7QpAOieuJlg26s0yR5Vr1Nqvles1tVXth8vMUDG9wr8sdOE0ZHXjS/AjowAKtvKHP9J1l0L7ho22hcGtRXkuy72zIeQ7MI1kq+3AJ80u5MUt7DdZFoi6IdJHodCbmTj+GjEtrmIZjuHLow+jz3D0Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744188948; c=relaxed/simple;
	bh=FkYGG/blNPkE+YJlD1UdzBjF3QbM1eptOxdUmwF+Lag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UFKP+YSs0dOSve6F0kyt80F2rK/WBosBpwY1o5rHow5JtC4kC51TXgBiKG6ZC87Dx5hI8qBXQgST0ZsJ8xMa/siH8R8+Hnj7El29y3iv3XcKK4uw3QMRNlUOPZTx7iR4fnt8S3yS+cSuioXsDksTh9f6P4UipNFBthhKwWNk5QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GBuVltAO; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5240a432462so483359e0c.1;
        Wed, 09 Apr 2025 01:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744188946; x=1744793746; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKkhSratOE8FhNwto8msCYe3EaTscTslbqKejN9e03g=;
        b=GBuVltAOASHPZMHs0R//UippvcXFM+APF0GXC2G6z/71eAQlmcTeGBFqALFsXwsqEk
         FVxhKuEVaHHuGGlArpEbE1g94ZZ/LoSOWvO55NSHIlhx8S6iLEgQ6XtpXc2Xkm96Cc3k
         sAZmRPLixk6ie6T06fmPGyr6xkAaarMv1AXcktq2VgV+lrS8aak6ihjRHY2PDGENsNEY
         pnB4Q/lW61O/V37zxtgl11v7kt/l/Wh629k2/c35shB116T4XpnjzRI+AgZHjNQyHJs8
         k+2wAABErJ+SNfYGWvW0ELdPf1r6B1ye1IPCwo3Py0vdqqBqBrDAXSiofKJdosmmTo4l
         BWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744188946; x=1744793746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xKkhSratOE8FhNwto8msCYe3EaTscTslbqKejN9e03g=;
        b=rHSzgBRkHlV88sNiHPnMSsAfaAcRWOpNLUhocSdgp2AEjqZFVd3MMUiz1JUaalAxv5
         aldFUpXGXGbknr8dP5lZ7m+yFWZilq4ydtE5U4HNssPgK954w0Cnya1JbQNRHkgnm8jW
         O3ey483dYj6QFZJSKJpnJD3Qnn5fii4uHn1xdlboFhXtVS49VvxE2oD0O0yBYYTPdMDx
         pw+L6lWM20xeQwsBuAYrmhdRe5YVBurdB+KhZdbEsVUNCpwYKbsMfu/LckOU9UhxURO4
         l0MSEVeL/sIzIpPhcPxFkuqQah+tj64+xzuoeZntnXDzIggrHQPamZFaHfF7iZWpk+Ws
         Jvcw==
X-Forwarded-Encrypted: i=1; AJvYcCUGwVrh0c3PJiT5VesenV3dUCJuCSiP7A6QiEHTdeSaW54rNvEQ+gmzWSMNY8ndT5zkfGXNV7kh5up67cmW@vger.kernel.org, AJvYcCVTbtkd+KYV8hRYGnEn0XHYuXc826hqllwLaGdkYw6JPeF2K6WF7TSlA8ZB80zNezQ0FOFkvHPnOuK3@vger.kernel.org, AJvYcCVcmtoGYTeRVPMtfXm7YrV9vnbtaOs7SJeUZf8FTU6FZGfAKuu1Jf/IpaqFqAupcjTa3E9dFZIFlkt1BWeh4F3WxPQ=@vger.kernel.org, AJvYcCWaCQe0Bk6LlQQhEunenz6K1+qjEP94dLeK2ZPoxED8KWVWkW6JRoTQIQ8vxb86tpEczaUhMqCJqKZl@vger.kernel.org
X-Gm-Message-State: AOJu0YxQjTGFdTpUlr72ztZSxf0OwakpQIp8LOpnp8MOzkbBD+pxmB3f
	orhbl6K/rKBaYdWWGhMQap0EcYYgcyteCuIF19HyfGpkiS4FP3IA47EnLqaYnO++FgvdpYotD6e
	koBwDxrp1t3s4zWdzTNgRFOskOCw=
X-Gm-Gg: ASbGncsoeyrxDdRg7sLMeStvtir25exOQfhJ0Vhg7F05F8DMVNzSvFNvRSSkUZ0Re2Q
	cGLFlNMgM4UdpMABtiil4oBYQR/Vts2IYd3H7MjK48am+AuJadnUDiXo79s80+rAuFzfcy5zZuh
	+1dj5yBypJIpbVYK9yFDD5GZOo++EK96EA/0TteHy4aOk1TXzDbzaoDCA=
X-Google-Smtp-Source: AGHT+IFkvSJE5U/9fmVpXSs+iaoY5nuY5+IWwlLNMnF2gNZkr5kIoflvPEnL4H4NBK6FHRKQDcdNNrDvBUNiQdI3bio=
X-Received: by 2002:a05:6122:d89:b0:50d:39aa:7881 with SMTP id
 71dfb90a1353d-527a8beff21mr1371744e0c.0.1744188946056; Wed, 09 Apr 2025
 01:55:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250408200916.93793-11-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVAxaLZJ4y0AWKrLobp55n5NPqQgEtHK_d1DDUM1LAkDw@mail.gmail.com>
In-Reply-To: <CAMuHMdVAxaLZJ4y0AWKrLobp55n5NPqQgEtHK_d1DDUM1LAkDw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 9 Apr 2025 09:55:20 +0100
X-Gm-Features: ATxdqUF6pkX8g8cSssT4x6HUE0uVbLtqiF0Qca_2kkdcVwxXzZnsXvGx2QnlRqk
Message-ID: <CA+V-a8uc22sYFwfB7CJK9gSmT7ibv5MxTPyTBJtJMijKcgbW5g@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] drm: renesas: rz-du: mipi_dsi: Use mHz for D-PHY
 frequency calculations
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, Apr 9, 2025 at 9:16=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 8 Apr 2025 at 22:09, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Pass the HSFREQ in milli-Hz to the `dphy_init()` callback to improve
> > precision, especially for the RZ/V2H(P) SoC, where PLL dividers require
> > high accuracy.
> >
> > These changes prepare the driver for upcoming RZ/V2H(P) SoC support.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > @@ -33,7 +33,7 @@
> >  struct rzg2l_mipi_dsi;
> >
> >  struct rzg2l_mipi_dsi_hw_info {
> > -       int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long hsfr=
eq);
> > +       int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long long=
 hsfreq_mhz);
>
> Due to the lack of capitalization of the "hz" part, it is not clear
> that the "m" stands for "milli" instead of "mega".
> Perhaps hsfreq_mHz or hsfreq_millihz?
>
Agreed, I will use `hsfreq_millihz`. Shall I respin a new version as
the initial patches do the same (i.e. use mhz).

Cheers,
Prabhakar

