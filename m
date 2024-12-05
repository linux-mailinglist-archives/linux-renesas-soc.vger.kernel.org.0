Return-Path: <linux-renesas-soc+bounces-10964-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E11309E5850
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 15:18:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43E2A1881EB2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 14:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABCDC222568;
	Thu,  5 Dec 2024 14:16:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CE3221468;
	Thu,  5 Dec 2024 14:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733408205; cv=none; b=tvZkfXSlivm8StEddp5NmqqEXk651FB9piZgyIkSAh++wML8JtdfOBX1/pJcGYFZmXXyxIYH2FjAM1Y1QHj+ISiIJlOcKV30/qiWj3wIjMRBmBbYgj/oMhhqR37OcInR6jbczG46H3koQG5PgwnFZFOzkaqmifjX1+ezdSio89I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733408205; c=relaxed/simple;
	bh=fWBWHfaz4vVdOZwpk476wOe2QKl8UPtmAUzYo/LfazE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HgU8CCLrNDZ5HCY5EACqHzjvsP3UoRWjN1RcBIYiFcQVKK1rC/ITEyda26pQDqG4FCIQZmG0ZUjuSxuUqaZxaH8pn3laWguAS3d3UycfTMiJLEO3LIaAKNSmfJQVdD35Osg/09DqE8i20XtrNYpQm2G7RXEUFaXPsA5F9O/Sc4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6d885705595so8613356d6.0;
        Thu, 05 Dec 2024 06:16:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733408201; x=1734013001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Q/OzP/Z4WLc7iG78UWYpVnhUr2xqecuhc0Bj80WKvA=;
        b=e0qmOybquEeYXHqT2y37cgBgB69iRg+uYt8HS6hIg/l5+5YVYqOfMcYKxhWf4sHU4t
         p9cIy0d7HvcJYOSt5ul0ZkVX43jEGiGkmQB1xh1EmJi81pzmyvmzAbHofwpz/eTQNiYv
         rLn1/v/9vnOzGhhM4V76Whk5UIgk0RAwWjj50CHlMqM//U1oFA4MF/QnLnXs9pyvA/CJ
         biLEi5dUDSin2ij2J2M2nh+wHAjklEOCC4uH/mW5K5spamalxJMll6AzPNPMzoLZjX7d
         8eGLcFee+HYsQhqPgPV9qL1M6ITVBcAJjgYGOBeTTRHeFobhsUicDQ+kzBwb5VZnvuIz
         6UaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdn5iiKg1Wm7WEUfHFu/6w7EPC5osq2bNEVKO8Av534y4a4/D5oWgBB5qHqZlwZwxcVwgsPUpTUJPD9cwEbDWAAtI=@vger.kernel.org, AJvYcCV/ammf3BsjEjc7GKAZ7qh71qEwSIM3Tic6NB7AxtCeFiyvSGcKpMI1BtiILiAdRK4xlSxG3BSrfuq/@vger.kernel.org, AJvYcCXAn0moT0zIIM9MAH/ofP8P4eDewmUqivnr+76Y0CD4U6NXBYPHUSulkUuBJpCd0ce/LUi4CdeaHFP/@vger.kernel.org, AJvYcCXtV2UXlUHs3whoL5lGIkBSQtDo802lRw991jFCvL5lNqYG3EOzPapdjqOs26qKE+7YUOZuI60B3i0tV2TY@vger.kernel.org
X-Gm-Message-State: AOJu0YwFQe3yPTT5/TRy5SA137wTqjfYReOZxwfmv+E2Qzxx0Y3r8xqn
	aQ7tWJ5W2jPitF6AnCq3RMS+CH4Bqnfmd+3ivvAynRZNS4tX94I0A5Rg16Qh
X-Gm-Gg: ASbGncviA5x+MNHEdd0jcsg6hHuX9/hJzSZfaOS10IBnAtPfEPnvxs+zpSR3X6OA4FQ
	hQlHLQB9WNRFG/mGQ2BrG+a5/xbCDRynXLHI5GgXsD6RwCRX/RnwrmnQC5ZMldPHpsD0Dr6wLeH
	HQEloSubQKX5oj9qo+2SYYBvhnTwxce+VYEMe+vfuHNAPp7YxTaIoQrcE62pxGFmOUm1gsZF8Uz
	TONGiGH7oszv5KD6Vw2Ul/3OnlMbI7X6r8Lui2FamJ4wFRkqEwhtAgKxlN3CbEKSudXw/3fMhSN
	rzKtr8oNvBgW6JBE
X-Google-Smtp-Source: AGHT+IHUfJhCCoTJG6Eeb/WakjzcEOAa5ErJHIzEGIbZThlJF0qOdlm52yo1uFuFKq6JUQjDgZs41g==
X-Received: by 2002:a05:6214:f21:b0:6d8:871d:6fcb with SMTP id 6a1803df08f44-6d8b72e3327mr160554246d6.8.1733408200856;
        Thu, 05 Dec 2024 06:16:40 -0800 (PST)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com. [209.85.222.182])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8da673048sm6858606d6.8.2024.12.05.06.16.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 06:16:39 -0800 (PST)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7b67441cf32so58583385a.0;
        Thu, 05 Dec 2024 06:16:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUeSCcNp9GseCEU/c8WlirIjn+xm35gGFNcyNJwvr7mOB2n7mplM230bpWkEweFR7G73EMlj/ABRZ4w@vger.kernel.org, AJvYcCVm2c2L+TbDpYWjvIiQh6AgfQszYgdqxXXxfncOkN4tdl+g565jGTUq9Au3KGU8Uehp/FyxDJGJb1cMPRrSO9uhHaU=@vger.kernel.org, AJvYcCXN1ZDdyLjVctXNLGlzYJfW26B1Om8kEezLhrNeQLYXJvkSBzjHJbFJLDXdY2//I+8mMwCgNsx1WFiR@vger.kernel.org, AJvYcCXprbdEYwWkKOwI4XLDCbRWK3OZrzjkduXz7MP5z2eJmqcNi2LTNm3TI4c8W4Plcp5kA0QkDqN++URaoLep@vger.kernel.org
X-Received: by 2002:a05:620a:1a95:b0:7b1:4579:61fa with SMTP id
 af79cd13be357-7b6a6214d25mr1582127785a.55.1733408199068; Thu, 05 Dec 2024
 06:16:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241205-rcar-gh-dsi-v2-0-42471851df86@ideasonboard.com> <20241205-rcar-gh-dsi-v2-2-42471851df86@ideasonboard.com>
In-Reply-To: <20241205-rcar-gh-dsi-v2-2-42471851df86@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Dec 2024 15:16:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVHRWbeQ8UF-xsKuxUNwHc5_kVwSgrTfOkwFFG5vG7fwA@mail.gmail.com>
Message-ID: <CAMuHMdVHRWbeQ8UF-xsKuxUNwHc5_kVwSgrTfOkwFFG5vG7fwA@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] drm/rcar-du: Write DPTSR only if there are more
 than one crtc
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
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tomi,

CC Jacopo

On Thu, Dec 5, 2024 at 2:45=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>
> Currently the driver always writes DPTSR when setting up the hardware.
> However, the register is only meaningful when there are more than one
> crtc, and the only SoC with one crtc, V3M, does not have the register
> mentioned in its documentation.

R-Car V3H/V3H_2, too.

>
> So move the write behind a condition.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c b/drivers/gp=
u/drm/renesas/rcar-du/rcar_du_group.c
> index 2ccd2581f544..0fbf6abbde6e 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> @@ -185,11 +185,13 @@ static void rcar_du_group_setup(struct rcar_du_grou=
p *rgrp)
>                 dorcr |=3D DORCR_PG1T | DORCR_DK1S | DORCR_PG1D_DS1;
>         rcar_du_group_write(rgrp, DORCR, dorcr);
>
> -       /* Apply planes to CRTCs association. */
> -       mutex_lock(&rgrp->lock);
> -       rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
> -                           rgrp->dptsr_planes);
> -       mutex_unlock(&rgrp->lock);
> +       if (rgrp->num_crtcs > 1) {
> +               /* Apply planes to CRTCs association. */
> +               mutex_lock(&rgrp->lock);
> +               rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 1=
6) |
> +                                   rgrp->dptsr_planes);
> +               mutex_unlock(&rgrp->lock);
> +       }

This is per group, not per DU, right?
The second group on R-Car M3-W/M3-W+ has a single channel, hence no
DPTSR2 register.
The second group on R-Car M3-N has a single channel, but it's actually
the second physical channel in the group, and thus does have DPTSR2.

And apparently we had this discussion before...
https://lore.kernel.org/all/CAMuHMdXxf4oePnyLvp84OhSa+wdehCNJBXnhjYO7-1VxpB=
J7eQ@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

