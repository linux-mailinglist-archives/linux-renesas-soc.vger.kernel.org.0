Return-Path: <linux-renesas-soc+bounces-16153-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F329A9396A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 17:16:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C47734A02D4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 15:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5279D21128A;
	Fri, 18 Apr 2025 15:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKsHw/XS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E98220C023;
	Fri, 18 Apr 2025 15:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744989369; cv=none; b=dM903AjtAuafql3RWWdNt5oqgiQ9AqWDWdDTFWMNdyXKOftah+fyx8/zQ2i+4qQatXOo1nlJFYrauAaLF7DsHWKon58yL5DqOvMy+Oe8C+kw3QDjziStJbpdQhjMrcq7PYuDBcGNoImTaloROgn5qIj+0L6IiyWlZtM/1vv8y00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744989369; c=relaxed/simple;
	bh=XBdQwhHSS5Z6yVsPCdwDT0uzpGax7CTlgyETPqZUKFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ea+CgVHMdosyN1UiXtfdtKh/rSTGx18mN+G6vk5qXDTfahlVwC4GP79IlJYFruKGPPX2TkkSZbSUS4eoObgD8anxNoBNV620yJEdldDVVd55z50bxtPWnVY6byC5TEMQr6aqNUGj8R2ur4ptj3zQYsz9qZ2wS/yxWnhU7Qk064U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AKsHw/XS; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso9963665e9.3;
        Fri, 18 Apr 2025 08:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744989366; x=1745594166; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDQCZN7XtccKekE6ix7EFyl/aNyMmVJtvGUO/HQEWB4=;
        b=AKsHw/XSwu6oQGVRnyYQ+5fLcN0VxEMeqKximLu5mWWt69pdtsLo0xp/HqZ5nB2DL4
         aEVqhnf5kdvv/j5obdpa1b/x+ZVpZf6i7ic140NDIR4RBOFNrZczEkzFVl1m6bUm7owg
         OhKzcxSz03uO7TR7mS6VvrJHhSZs10dmyQNyhdqx/k/LX1hH3AMDhBT8wFkhdZRmKcIZ
         F4tP+CGkUd7VDRWZsQ5rvbUl5GcrwfgSyfVcQUb8aORTl5WThN7VE68chKPZfsAanSKf
         W4iof2fLT4bqQ9UrrsV9lfKzDfLE+GLlJmSZMbdp5UgR3Mpgp8wbuLgTXI7+FyvL93q5
         V8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744989366; x=1745594166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NDQCZN7XtccKekE6ix7EFyl/aNyMmVJtvGUO/HQEWB4=;
        b=iHV93pkn6pslpz/4gOllKDNItTWZKXTy4KqKQlAyhMJQ9EmRbR6tMcFLklVGtR79S0
         GoRXx7EZnbt3yeI7PdOXE40Oe7PQb7SUecktbxaXC/udjzCKoe20v37bTOpnf/0eL2Uu
         B/U9LNR2mv9EU7DPBVaLZ4J2eJOgD5am0V19XBCAodKDCm82S5yeTbJc56PbS1Yjx+1W
         o07Hrak4T1r7y7Dc65kOa6iKMwkGGjkmnQ8pI2UL+/bAXtnJ0YYgR3x3dk/9MoBN6jRl
         aVZGvuql4LjyNEM/8Snvx9WF5Kq+jC03hacCejyr2YzhwtDr2fz2WZXiZFkwkTVGwDtt
         HvNw==
X-Forwarded-Encrypted: i=1; AJvYcCVhfr0+us1WJdanDX96f+jo1cm/hgadcSn9DXMqXI1Yea6LcJvZurTuwPm2Mapf6/xrx2kc5gbRRGEO@vger.kernel.org, AJvYcCVmk+jTjnOSmIiiJOy/hQ7q4v62PZWe1sd7o+3tJNfjIa7DfMVySmUYhPK8f/9tPLDDXRWlBPmxq1xexTpDFlou+bY=@vger.kernel.org, AJvYcCWJIo5UtXsubxdVrhVwA8W926pwR7diicJdWfyB7DqmHu0xhCYYtwRBjbqrMeYLjxZoNG2IqtqU9ME9@vger.kernel.org, AJvYcCX6uKG5yJHVMcDDkekAPMPMegPob2eIy508AN2wSxCKmHNz7zsYANve6WI/wxm5jPyncwBQZR/u5fI96x75@vger.kernel.org
X-Gm-Message-State: AOJu0YwNFmp9sHyqC4Gedz6Wcei0h+LefV/kgsVlLZOhRPrSaJ+Sojc+
	mTnTG3vQD7GrHuUNEEjO1G/twKUb6cXlsTVyqEqAXjeNoIgq2TchnqG0nNN5sLyg4RypLJJGCip
	+EByjrynfUSnGlHxl268CP/e2aEA=
X-Gm-Gg: ASbGncvzf+A4T9cUcgJphpTX/+2eyQ71nDowkUeyrWd+SbYYuhqLEswU3yh1BjF6bFg
	4s8wzylI9CJWPbxmgbGb/fn5CS4BustGzB/0Tvl03ao0fmmWUU6U9ynI5I+b20g5gaIz27aZzJx
	pLs6Bf035Er7b700HoLdbLRY6JjG4pf4uy3oQDpGdKsBtiUYhlerRV20g=
X-Google-Smtp-Source: AGHT+IFmXeJc3YDRQKSCZof7kxPeLkVbKbIzjnIGX2JOiqECYlzFhqayvmJDanc/5uMaQBQmGnlreIjKMnRprAPvMCA=
X-Received: by 2002:a05:600c:54c2:b0:43d:77c5:9c1a with SMTP id
 5b1f17b1804b1-4406b928b57mr19545275e9.4.1744989365491; Fri, 18 Apr 2025
 08:16:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250408200916.93793-16-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVbcOvfW6YqW6S77J7htaJqWkeoGEhjkAWXvG5Fo1FMhA@mail.gmail.com>
In-Reply-To: <CAMuHMdVbcOvfW6YqW6S77J7htaJqWkeoGEhjkAWXvG5Fo1FMhA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 18 Apr 2025 16:15:39 +0100
X-Gm-Features: ATxdqUFKG7b-9fi5GPMwEzMprDzBzoNhSBw2axhPGgXuBYZm8tjPIyPxCGRg-3w
Message-ID: <CA+V-a8uyj0myd=At83X+=MnQqTdkpo3tyADgOPuTL_FjzPZD8g@mail.gmail.com>
Subject: Re: [PATCH v2 15/15] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, Apr 16, 2025 at 10:35=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar, Fabrizio,
>
> On Tue, 8 Apr 2025 at 22:09, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add DSI support for Renesas RZ/V2H(P) SoC.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > @@ -70,6 +80,18 @@ struct rzg2l_mipi_dsi {
> >         unsigned int num_data_lanes;
> >         unsigned int lanes;
> >         unsigned long mode_flags;
> > +
> > +       struct rzv2h_dsi_mode_calc mode_calc;
> > +       struct rzv2h_plldsi_parameters dsi_parameters;
> > +};
> > +
> > +static const struct rzv2h_plldsi_div_limits rzv2h_plldsi_div_limits =
=3D {
> > +       .m =3D { .min =3D 64, .max =3D 1023 },
>
> .max =3D 533?
>
> > +       .p =3D { .min =3D 1, .max =3D 4 },
> > +       .s =3D { .min =3D 0, .max =3D 5 },
>
> .max =3D 6?
>
> > +       .k =3D { .min =3D -32768, .max =3D 32767 },
> > +       .csdiv =3D { .min =3D 1, .max =3D 1 },
> > +       .fvco =3D { .min =3D 1050 * MEGA, .max =3D 2100 * MEGA }
> >  };
>
> Summarized: why do these values differ from the ones in the declaration
> macro RZV2H_CPG_PLL_DSI_LIMITS(), i.e. why can't you use the latter?
>
There is a divider inside the DSI IP which is almost similar to PLL in
the CPG. The divider limits for the DSI IP vary as compared to one in
the CPG IP.

Cheers,
Prabhakar

