Return-Path: <linux-renesas-soc+bounces-1004-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 097348118CB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Dec 2023 17:11:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 996381F214F3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Dec 2023 16:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A9C30F89;
	Wed, 13 Dec 2023 16:11:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFD9BDC
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Dec 2023 08:11:38 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5e263e43ff2so14117237b3.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Dec 2023 08:11:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702483898; x=1703088698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ooc1eGxg6yQfZfP7GcslNnI0+HwUG+ZY14aw/Vso+Oc=;
        b=RsDQM/pFvZQzwTj2lsxA0alayylKV6qGYwPp00ta5ONLzVNLqeyJDR2nBxGE1Oitmh
         Ww7nbia/uBzcVH38LKB93w6bWwPSF72ASKIApG27shh5cu+e8R6tFHSER5Oidt1tFFjM
         IO5X7FAdtXQf3cKWd98ea/BkXELBDmSeFBxDQDN1RzUfBGUY8OJyhv6BPKvHz9Ydf4CY
         fJhXFnu5gsZwgFURJjc1l6P5ASGw1blLcdBPCtDZBh2yevMfP7tYtdTB9+oYeP3lwts8
         lTr19mtnhJwufqZmpU+VVyloMM87BO3KiMitU8PbG8FtH4zXUZ9oTjLaip5WXTveZjq1
         Lc7w==
X-Gm-Message-State: AOJu0YySbLMXWbEWHHRRQg8GHFzyPYsNZPJHm32dqSImdU2XqBJ88kME
	etYmAgzznEoZ45UHoTf+bB8L/qFeak5wwQ==
X-Google-Smtp-Source: AGHT+IE5qUopUkIm0cLOSU7hp2Eyv/HAHgtbDFxu2GIv/Jv9L1Y0NA7xlGFDXELuwBDX1sw5/z15Bw==
X-Received: by 2002:a81:7b05:0:b0:5d7:1940:53cd with SMTP id w5-20020a817b05000000b005d7194053cdmr6974926ywc.69.1702483897762;
        Wed, 13 Dec 2023 08:11:37 -0800 (PST)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id c126-20020a0dda84000000b005ccb2d17ba7sm4695903ywe.101.2023.12.13.08.11.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 08:11:37 -0800 (PST)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-db99bad7745so6532118276.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Dec 2023 08:11:36 -0800 (PST)
X-Received: by 2002:a25:ea4f:0:b0:db7:dacf:2f2a with SMTP id
 o15-20020a25ea4f000000b00db7dacf2f2amr5105926ybe.113.1702483895971; Wed, 13
 Dec 2023 08:11:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
 <20231128105129.161121-4-biju.das.jz@bp.renesas.com> <sechknyg33iucaku37vfhk7ie7xgcealfqbvaopm4rrnqbo5g5@s35peonkzzoz>
 <20231213155049.GH12450@pendragon.ideasonboard.com>
In-Reply-To: <20231213155049.GH12450@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Dec 2023 17:11:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVCRghimhRXo9D=NDqrnRKgCykkVUf9jQOJTHOTq8PPew@mail.gmail.com>
Message-ID: <CAMuHMdVCRghimhRXo9D=NDqrnRKgCykkVUf9jQOJTHOTq8PPew@mail.gmail.com>
Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Maxime Ripard <mripard@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 4:50=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Dec 13, 2023 at 04:47:09PM +0100, Maxime Ripard wrote:
> > On Tue, Nov 28, 2023 at 10:51:27AM +0000, Biju Das wrote:
> > > The LCD controller is composed of Frame Compression Processor (FCPVD)=
,
> > > Video Signal Processor (VSPD), and Display Unit (DU).
> > >
> > > It has DPI/DSI interfaces and supports a maximum resolution of 1080p
> > > along with 2 RPFs to support the blending of two picture layers and
> > > raster operations (ROPs).
> > >
> > > The DU module is connected to VSPD. Add RZ/G2L DU support for RZ/G2L
> > > alike SoCs.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > I'd still like a review from Geert or Laurent, I don't know the SoC.

I don't consider myself sufficiently familiar with DRM and the DU.
Kieran?

> I won't have time soon, and this driver has been blocked for way too
> long due to that :-S

Indeed...

[deleted 278 lines of needlessly quoted text]

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

