Return-Path: <linux-renesas-soc+bounces-15653-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7361A81F83
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 10:16:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8FBF4A755A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 08:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E09A525A2D9;
	Wed,  9 Apr 2025 08:16:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBA41D61AA;
	Wed,  9 Apr 2025 08:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744186566; cv=none; b=gbtDOWb+D8mLMFu/s5USs34rBxxvi8Aurc66rBFp2LBmTeAoYsxEx/gUPPi/zdQHqiaxwjVFJ5S8XF/6GWJlNhPo0Uty2ty6M4StYXQUmNRUYrFx0Quji+gfJgjge3XX/a1vObkJUHAsIMFEmsZ+TtblaAiHxlaEvhTp7qJUFGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744186566; c=relaxed/simple;
	bh=4+jfWnsULLYPjAiJ9BsWu1PAB8C8puLtn3FhdNTOHOw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oD0wlMhgG5jB7H0Z9ii7Cdy7jj3/GFuzcoKch2lBXFwWd5HroraDa5h+qtgjUAVsn73cWwHnhgZnNgJUlheWaze1snfZ5ZDZPJcHVv4kxVLI4iLqPANlGs0+buuP/vLZ3e0Mz+guOBWiElHoS37ish34RUBpamxBZVVf1nQdbHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac3b12e8518so1179470366b.0;
        Wed, 09 Apr 2025 01:16:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744186562; x=1744791362;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g8wlwAvEfKUmPWwXyFA3bJ/dUP5Ua3CH+QEIQ4JbmjA=;
        b=GgLlVFN1HAcNk+MESrTNkw36LRjNEvfML0h8sNKpJzHJxvvjAeiuVYBs7+Vy6Miymj
         mW0Qb2CnQToBV7erfPYDGSfj41q3KD1p+sdSFaq1b3yvz5XAmznfTBnbOYYLnyxtXmdb
         jMfArH3CnX6jnjFQJdXvIj7MCJl4QYEEqX34oj9T1YtT4E0gg/eAhouqnmU8+PioCkcn
         DhJ37A+O1X+BaED6lKY/qkExfRV+Fcwf3t5m7OXWhvDOvl8H4jxIC4xMPtSHZ2Rw/t2y
         j3d0gE1OcchgbW2shtVMmtyvkZLlC9DLyQyuWYkrDf/6ouOd0U0bg6mfdbzpUhVY0U2n
         Hmjw==
X-Forwarded-Encrypted: i=1; AJvYcCU6a+CRJM86/wI8xqbMercdoMzhdPRf+sQt+N57umpXGM4xy40ggKFZO+0gU1bhX1au/7/2W/3E89LX@vger.kernel.org, AJvYcCVO32k96ikAK70DQB/rWg9sDQhPDiKQEIeQNMVkhPBzMkMBq0bYaQP839Zu+gHypFSwFBmpq9ZmyM/iQUkkSR+mGJY=@vger.kernel.org, AJvYcCW3xbcNFy0mSwJtE0AKWJgStJyYAHPrJxuWXgS1+XpxDNPpRQD4qNC1I8lGCP3iUGuJIk+yXL0ZBG4A/vDc@vger.kernel.org, AJvYcCX/kpE4eI2VsBZw11oG1BuzKSwEmHp2brUzWOWt3b27Z/jxLPzU6HG5F3HukJGRdnIXBSc4IQJPB8YZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp1t4ToewxSJG2cevarTljSUJqX2O+Sb0o76Z1NDj8prrXUctr
	eXoVwh+g3MU6NWP3MeeA29jX1k1+VYaUdPiiYKYqMnantgCLk9CE7c8m9C6bqjE=
X-Gm-Gg: ASbGnctEV7viDZNGyCDEXG269awRB5PEBdCwZhXeMcCizKskP0E+QhUv+hg5ss30L54
	cNJ2AbPdV2Pp/ro8cozZv1uqs0S5crCj6jrPArhjaKJ9knVQ37WimNQDP7nLdU5FdOcHN4sLax8
	lOD6m0mYM77LZ8HUd/db0qz+cfoM8zhw2IgLZ3fHXK4JGEGBNhnLInQHHoJWOtlOQhysUwT0kRn
	QBIG77y4wH4ylYSTlkaRIQnyaGk54GkwQNR5V80mU9kx0rPeuUixzcuPOtFTCzbOO6CSZ/RllkV
	I75UnK43ry2LSvL7ccdg1Dh7R5psDCZF+AntB2Eh0OKBX0hlLfT9rn3DYHBAdbUvmO0ng4qUpcz
	LA6A=
X-Google-Smtp-Source: AGHT+IGt0R0EScqdOKJJjJcV0FS7JWTTJAiVN+6Vem403eidfIru3K8b51O21lhGygkiV9IMcMOWpw==
X-Received: by 2002:a17:906:184b:b0:aca:a162:8707 with SMTP id a640c23a62f3a-acaa1628733mr114702566b.7.1744186561496;
        Wed, 09 Apr 2025 01:16:01 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb4158sm54538066b.90.2025.04.09.01.15.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 01:15:55 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac3b12e8518so1179439466b.0;
        Wed, 09 Apr 2025 01:15:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGEJD0AheT1zSLMzYXNWFzciMWxkYQhAn0RARAdbjgGdRhINLON5pZ7qsJ2UKzasOnUWWXKCn1+HeV@vger.kernel.org, AJvYcCUIj/KKVoQ/4ODSEjWDVz2Ia0cyij06mhcJxIe9p21aoJ7SGtcBXzOUkDqaGHDApWThq5RuKBJyXwxjwD9R@vger.kernel.org, AJvYcCVbHgqjOUJKZru1T0tpx59/jwgQHXsphSQF+QnF/nzod5xx7LfWWoRRlW0Ya0t97xKUXIk+Xwjb2iO1@vger.kernel.org, AJvYcCWZlku7gblLWc9MpuN7k35dCr/KxDe7NIXd6r5hcxR8ijRaADnhtFML78LQLkOL7Vvmcg5OStHoqWk8Na2udJjdPiU=@vger.kernel.org
X-Received: by 2002:a17:907:2ce2:b0:ac3:878d:662 with SMTP id
 a640c23a62f3a-aca9d5d9738mr124075466b.9.1744186554430; Wed, 09 Apr 2025
 01:15:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250408200916.93793-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250408200916.93793-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Apr 2025 10:15:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVAxaLZJ4y0AWKrLobp55n5NPqQgEtHK_d1DDUM1LAkDw@mail.gmail.com>
X-Gm-Features: ATxdqUFduY_Nysj8xnNB1omwilrHwMeJqiWwK4ZmMj1fQC_W_1_6CC0mYuD3HIA
Message-ID: <CAMuHMdVAxaLZJ4y0AWKrLobp55n5NPqQgEtHK_d1DDUM1LAkDw@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] drm: renesas: rz-du: mipi_dsi: Use mHz for D-PHY
 frequency calculations
To: Prabhakar <prabhakar.csengg@gmail.com>
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

Hi Prabhakar,

On Tue, 8 Apr 2025 at 22:09, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Pass the HSFREQ in milli-Hz to the `dphy_init()` callback to improve
> precision, especially for the RZ/V2H(P) SoC, where PLL dividers require
> high accuracy.
>
> These changes prepare the driver for upcoming RZ/V2H(P) SoC support.
>
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -33,7 +33,7 @@
>  struct rzg2l_mipi_dsi;
>
>  struct rzg2l_mipi_dsi_hw_info {
> -       int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long hsfreq);
> +       int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long long hsfreq_mhz);

Due to the lack of capitalization of the "hz" part, it is not clear
that the "m" stands for "milli" instead of "mega".
Perhaps hsfreq_mHz or hsfreq_millihz?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

