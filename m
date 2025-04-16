Return-Path: <linux-renesas-soc+bounces-16050-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE4AA8B58F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 11:36:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 379DA3BDC10
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 09:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B002B23371E;
	Wed, 16 Apr 2025 09:36:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8855226534;
	Wed, 16 Apr 2025 09:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744796216; cv=none; b=Ky1T5ANV3V1WiT0srNdarUtEQIr/TFuj1OzIpPWOyhNe9m7ex6CrqsVbFnZdHLH/9EZgfck18XbY9f4EKgClplnwrT4Ij9xIgCqZ087icQSfhe93/KdIQERF0x/AkAKLPqW480Lu3v/ylS8NASKPNKCaVXD38Pq0kYS6yQio7R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744796216; c=relaxed/simple;
	bh=uIA3K0MeOb1Bomfk5fOF6JnwI90dqqcVTNFxHua7Kaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FkWh2fX6y4m1RTq3wrdtlNOEL5ZwdfY2X20S5wxFci41NJhyZr8/wXBUTJG9sIpdN3Y70lKBt8q6MWLGNbBiru6pE7JHdwf7Q/yKh39whSZWFwtELxffWLxMIk6jCjZHlptVNhjrelahuRpNcloW87cm2Rv3ehwcE8ECDe4Q+BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-736ab1c43c4so6017275b3a.1;
        Wed, 16 Apr 2025 02:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744796214; x=1745401014;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g4vscTFMlRO2bqnOkEDCqxlIR5FOdxqQklMvAsU4H6Q=;
        b=QBJooOwN6pyjsSA6WWao+K7/0kXewNHI1PAC/VZ1Zu1ESmSPX2ej2XgqnveF2YRBgL
         NtrcZESOitddsXLoXyrWH1X8bEJuef1BKxZY4NQjCjZateFnJ9/6s7CNi+/1haozpBR4
         xxjUWo29j2BCB4RyzShJqyfczbfdWvMUxPtwFqt1DtPIUGYTP3s78iUe4+kfW2i4AKGx
         7TamIGPKeNK3BL5DH3nCC0S/3bb8gc6j2Srz3iTLidMvZxGbhUEy97/GbeSZw1Sp2nTh
         QG3TWffqR53rMqo1HwnLbBFLAcHaJmLnuY7Js73GvIYU4XjJx2h6cvWWTomMxueNL8te
         bOvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHP7KYc5qF/n9thy87kDratGsZBp49mfsZ/v0W4XxdB+kmoPbRkl3b8GpeNDwavKsSvaVLoVGusHeb@vger.kernel.org, AJvYcCULe2nEsYgWNFskRc3ktSey9riG1GYC0yMertg6uWd3uItwRn4ZytIi/3/v4SkDlyF13MhKszUa93oH@vger.kernel.org, AJvYcCWqftt379oiqGWGRqnsYFRq6h5hKGaBl2j2dNIwADL3+XqaDBCRUVz1rotgeQ8Qhp/LN4EkO41s1AxV/sQe78wHDA4=@vger.kernel.org, AJvYcCXuR2HYIrlylZun0hgccZKpamYSsiwUJn+HEUHnemwQ04rPvH1GmKDfYrQ0fX+EGto7InRFyMwiw1cei6ko@vger.kernel.org
X-Gm-Message-State: AOJu0YzxAqo/x6cpNDjVPqJt3uIBShnD4lOse4BQtBpuLPy8DDBQzUwi
	j3HrmT4cBXtk+ouAmN+XRTSq8asiuabmzkhbPx2Zf4gzLawmBgBX1yHTXNSw
X-Gm-Gg: ASbGncsG0LzLCvjPy3tCQ5ZiluUlp27xVzLyCQudDdYhiQ7KObVlkx/hTQy5Sdm4gPS
	YNgUSq46oDbtjgnZdb13aEKq0GqnsN5D8qsYhlmihi51eBI/QK09TZrHKYIbtsipegkiY0lrdjx
	HzmqHzPbzlBIl48PkI4milBf7bA07RI9SVQolnu+xGs1ewFkRfU3BOymWc2EX7Zk1X4My/IXHSe
	QYkinYaUGpFdJous8AFLsac4hi+pmIGd7HP6KFQ/c6Nx8vGP1PJSJsWUf4z6a821Al56VFUMHR6
	HAX/i6kO70JJyYuQjGvEYoEzStHQpXP6SyxdUJVV8MptyIiBk6XIXGvDNwy0FnRAgxR6DPDzTES
	hw5Woy1I=
X-Google-Smtp-Source: AGHT+IGW2+fiUrKZeiXbU56f0QPRPnabRsjJi9W1LwmCES7JgeQyUBtcxuQ6Gqsa/zk9mMxWOoFM4Q==
X-Received: by 2002:aa7:9308:0:b0:736:53f2:87bc with SMTP id d2e1a72fcca58-73c26736782mr1671623b3a.13.1744796213793;
        Wed, 16 Apr 2025 02:36:53 -0700 (PDT)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com. [209.85.210.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f1071sm9886294b3a.120.2025.04.16.02.36.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 02:36:53 -0700 (PDT)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso8644058b3a.2;
        Wed, 16 Apr 2025 02:36:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVByTlhdB8twfLnuaPHotjowaQeIic2srEfxxQyiHtEfyNkpBTQkF+T80PvXmNLdcPWaap8VOwDpZ7Q@vger.kernel.org, AJvYcCWAox92aQt40M0zZtFPvuXAbz5hZxhh0q03YoTrhg0FbAsySglXKbXVqNjGVTDeVpT/FYJQ7Xl2FTBIEgaarHfcAn4=@vger.kernel.org, AJvYcCWjs0FzVtHUt0/t67U5tbqi+gVQndrdZE6DLZ6py84srdhzdCyDBPFFgVEP5FkxD9YpCrVg9aA4FMTnGdAM@vger.kernel.org, AJvYcCXXgfFhs40FjVvUMeImdBqsqWZ4DksWgWM/VVm4yHOJCcxxfKjnOy4y1nYkwkS33aygrE96qW2/lN8x@vger.kernel.org
X-Received: by 2002:a05:6102:5e8:b0:4c1:c10d:cf65 with SMTP id
 ada2fe7eead31-4cb592f320amr282769137.25.1744795714375; Wed, 16 Apr 2025
 02:28:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250408200916.93793-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250408200916.93793-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Apr 2025 11:28:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVbcOvfW6YqW6S77J7htaJqWkeoGEhjkAWXvG5Fo1FMhA@mail.gmail.com>
X-Gm-Features: ATxdqUHCOHToO8zh97LKtpyDEutN_FL_Sxg_dBqYsVTr46pKfBBTHGJphFzPmgw
Message-ID: <CAMuHMdVbcOvfW6YqW6S77J7htaJqWkeoGEhjkAWXvG5Fo1FMhA@mail.gmail.com>
Subject: Re: [PATCH v2 15/15] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
To: Prabhakar <prabhakar.csengg@gmail.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
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

Hi Prabhakar, Fabrizio,

On Tue, 8 Apr 2025 at 22:09, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add DSI support for Renesas RZ/V2H(P) SoC.
>
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -70,6 +80,18 @@ struct rzg2l_mipi_dsi {
>         unsigned int num_data_lanes;
>         unsigned int lanes;
>         unsigned long mode_flags;
> +
> +       struct rzv2h_dsi_mode_calc mode_calc;
> +       struct rzv2h_plldsi_parameters dsi_parameters;
> +};
> +
> +static const struct rzv2h_plldsi_div_limits rzv2h_plldsi_div_limits = {
> +       .m = { .min = 64, .max = 1023 },

.max = 533?

> +       .p = { .min = 1, .max = 4 },
> +       .s = { .min = 0, .max = 5 },

.max = 6?

> +       .k = { .min = -32768, .max = 32767 },
> +       .csdiv = { .min = 1, .max = 1 },
> +       .fvco = { .min = 1050 * MEGA, .max = 2100 * MEGA }
>  };

Summarized: why do these values differ from the ones in the declaration
macro RZV2H_CPG_PLL_DSI_LIMITS(), i.e. why can't you use the latter?

>
>  static inline struct rzg2l_mipi_dsi *

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

