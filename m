Return-Path: <linux-renesas-soc+bounces-17264-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CECFCABDDE9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 16:55:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC12E188AA87
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 14:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA0924C076;
	Tue, 20 May 2025 14:55:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F291FF7B3;
	Tue, 20 May 2025 14:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747752917; cv=none; b=Rc18vmp+aMWiV6VzuY35puHprtV9p94k4Uv8t1bHUOxFZSts89pqOZYfdUEiRNE3/2rOQ4xuHw/+/2ruUXROtBPqba2LIVvYf4mBrXTh2F3LjxhLG2RZy0xtk374pIUkbliCosKrOPLcgOzjzis9EMTKYORluuCoJStuPeYiBxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747752917; c=relaxed/simple;
	bh=5t0gdhv8R1teNpgkE18HM4BYta0hXkyqjJazcPOR+ng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qQFeT9O++rnv/lJ8UoBSqotnwJbA9dj5UCf7su2vlaz5AEnQdX+MSCJ8Xq47vbBUo82ZiSjUtHLD8m/j4mqNz5dbtDPvx1wz8y6kKTw+Knl2DuhPJixz9QW3Uz2UKlVjzy3llY5XAg996EiKfmDJA4hNn+18XyQv9rCdVhEaJzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-528ce9730cfso1255329e0c.3;
        Tue, 20 May 2025 07:55:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747752912; x=1748357712;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ttxhK6Ti/XQOTqH6UODUStCIPGw0sZp98YSCtYewY44=;
        b=cL+3mS+4BqZ/mDap4LhnaV/I2C5lMzmxPYCi5HtzBWbsBW+Ep2D7+U/igZZRuL9G2T
         bhZKv3Ne2oLDga33fVyh9BRUzSoV6L+6hGHte1VI+OMg7cmY5H4yEtyPMHMFmnBFuDEk
         VLqGNJqzjmzv040f5QSIPzIgkmFiEny57uePyj9ZMLMZwZcRTd7I1aigAMnEe1wOcJVc
         RjbDfScsE2/IgmZLshD6nwc0gB2C/JicvYxGo0672GTTl1HMlIL9c5p2QkNNe7g+RnRK
         L/GjsPRLVF5ijQgJ78/UOmTitJzeyCjr29f6Cv7J1sP3C3R+VZx6Wwt4b6KzamndC9AO
         aE7A==
X-Forwarded-Encrypted: i=1; AJvYcCWlfWX2nL6EzePZ0NlTFVj0UB/hK2moT6jGrEFZGliTeV1ru1QMJLlbbyh4KJEzueh6R+/wP1wsGaZDPNcYiEiC3nc=@vger.kernel.org, AJvYcCWo39dssUrqSFHTi6hgqP1SCUclEeYutEL3bl2cnpZziuUDpYtWdD82s4BpeRDyHXFvjMCmry+hhQC5raat@vger.kernel.org, AJvYcCXRVjNuOwtZIhfbGCdaR4SbDrQHBnM8on3LdAg6UJzTlFZG3OQ2/czRfKsWzkSGlVv4Gn2OCOgsRoUl@vger.kernel.org
X-Gm-Message-State: AOJu0YwMk0qgXtv40WbR4i6AvHHdWVZ0RuUWyydECM5ajanF4sdcQ5r/
	cPkaHVfpfoZO9tRLhQYlhi/jbN3xmJ7RxJFbaxE+CvNBHvw06mf4k9DHWT7hihWT
X-Gm-Gg: ASbGnct37/EIdU51NMYNHcoWvSjIKQjtOZbNE6M9hR2O6n+tdNV41N6cfLEeLNqjpLj
	iKCacnerDNTF+DjmZVPdL3bvRg55xM28/lei9h2i9fVK+7xujclpyapzk/0WGLAYUI+u9l3ycKq
	boG1kOBqRXZAHHMXxJBvlbGhp2+9hyiVz2ZbK3dHS2o3Dpth0W1jShIVUNENW+FzhY4oGhl4brj
	DhZYWP1lOKzBSIqDFNlHK1Ui9nD1n7MsA0s42Zj6L8btDZmFwBvjeCr3N7C4L4H7ENo4Gi4GTZk
	55qRVCg/ay1j+5OtBfMaJ8uoeM+keTkJvscb03btEqfLfQdGi4n3y4rEy8kM+CH88tChzapFhSw
	Duz0OQeiVKLrGFHD9d+hoHfTx
X-Google-Smtp-Source: AGHT+IGT+Pt99Y+3HfVgDShKNL8vdrHQAAbHfwHQA+KKt72ephUI5sgsIyJmD/DCo1cPN4ZNSHXkHA==
X-Received: by 2002:a05:6122:d18:b0:529:995:5aec with SMTP id 71dfb90a1353d-52dbcc85543mr14651405e0c.4.1747752912368;
        Tue, 20 May 2025 07:55:12 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dba967b83sm8598811e0c.23.2025.05.20.07.55.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 07:55:11 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4e14dd8abdaso1419387137.3;
        Tue, 20 May 2025 07:55:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4RaSxuNppLtmO+MBcdr+g+j7uHeyYHEqsBeYc8hy239zJTmL+zzFC+gTQosAXoQ6w9WWn+ytdr2n0FMvy@vger.kernel.org, AJvYcCW16sqSmhkBbmgRkKc6CjougZ8RYRq/+OALGgiqpjLkIUt/zkxkmY/tZho9rhSPYkNGyqbiHa8Bi2HG@vger.kernel.org, AJvYcCWkx0jPofCStulT5Up2Zs9+edCBwEJ5SNEapORk4O9r/T4F7BdHEIL+na59dXO8uv0rbLm4+qzVjZS4HrqtCpgBG1s=@vger.kernel.org
X-Received: by 2002:a05:6102:1528:b0:4c1:76a4:aee4 with SMTP id
 ada2fe7eead31-4e05375dcb2mr14690410137.19.1747752910647; Tue, 20 May 2025
 07:55:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250512182330.238259-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250512182330.238259-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 May 2025 16:54:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVEgTo7V-gzzpVVNqxnDMSdTC1ew70gbJ=Sb5Qr4asryA@mail.gmail.com>
X-Gm-Features: AX0GCFv8LYK03_9WrEiJFFzvjW_0fJJk_EmmURtGv-joA1Jov8I_4pZ3KpumSj4
Message-ID: <CAMuHMdVEgTo7V-gzzpVVNqxnDMSdTC1ew70gbJ=Sb5Qr4asryA@mail.gmail.com>
Subject: Re: [PATCH v5 05/12] drm: renesas: rz-du: mipi_dsi: Use VCLK for
 HSFREQ calculation
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Mon, 12 May 2025 at 20:23, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Update the RZ/G2L MIPI DSI driver to calculate HSFREQ using the actual
> VCLK rate instead of the mode clock. The relationship between HSCLK and
> VCLK is:
>
>     vclk * bpp <= hsclk * 8 * lanes
>
> Retrieve the VCLK rate using `clk_get_rate(dsi->vclk)`, ensuring that
> HSFREQ accurately reflects the clock rate set in hardware, leading to
> better precision in data transmission.
>
> Additionally, use `DIV_ROUND_CLOSEST_ULL` for a more precise division
> when computing `hsfreq`. Also, update unit conversions to use correct
> scaling factors for better clarity and correctness.
>
> Since `clk_get_rate()` returns the clock rate in Hz, update the HSFREQ
> threshold comparisons to use Hz instead of kHz to ensure correct behavior.
>
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4->v5:
> - Added dev_info() to print the VCLK rate if it doesn't match the
>   requested rate.
> - Added Reviewed-by tag from Biju
>
> v3->v4:
> - Used MILLI instead of KILO

Thanks for the update!

> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c

> @@ -269,6 +271,12 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>         u32 golpbkt;
>         int ret;
>
> +       ret = pm_runtime_resume_and_get(dsi->dev);
> +       if (ret < 0)
> +               return ret;
> +
> +       clk_set_rate(dsi->vclk, mode->clock * MILLI);

drm_display_mode.clock is in kHz, so s/MILLI/KILO/

> +
>         /*
>          * Relationship between hsclk and vclk must follow
>          * vclk * bpp = hsclk * 8 * lanes
> @@ -280,13 +288,11 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>          * hsclk(bit) = hsclk(byte) * 8 = hsfreq
>          */
>         bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
> -       hsfreq = (mode->clock * bpp) / dsi->lanes;
> -
> -       ret = pm_runtime_resume_and_get(dsi->dev);
> -       if (ret < 0)
> -               return ret;
> -
> -       clk_set_rate(dsi->vclk, mode->clock * 1000);
> +       vclk_rate = clk_get_rate(dsi->vclk);
> +       if (vclk_rate != mode->clock * MILLI)
> +               dev_info(dsi->dev, "Requested vclk rate %lu, actual %lu mismatch\n",
> +                        mode->clock * MILLI, vclk_rate);

Likewise.

> +       hsfreq = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
>
>         ret = rzg2l_mipi_dsi_dphy_init(dsi, hsfreq);
>         if (ret < 0)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

