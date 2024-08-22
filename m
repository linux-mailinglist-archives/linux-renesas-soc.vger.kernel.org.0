Return-Path: <linux-renesas-soc+bounces-8018-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B90F595B506
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 14:31:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCBBF1C20E80
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 12:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EB871DFF0;
	Thu, 22 Aug 2024 12:31:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64A21DFD1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2024 12:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724329877; cv=none; b=O7fZsKXYTnopzIOOmJmzNU2s1qPTVLJFtD59E1vUl71zxwEip7oEUWmE8bSpbfhsvIiwTYUA1oR/ag41J/4LvJopwA0DLUg5wSP3xNKHBz0d6UNgiQILUbxl4N/Y1tDyUt4tRP7uzJzcWN5lv+pEB1JP7g/LzXpgWcV524nNk+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724329877; c=relaxed/simple;
	bh=A9cfG+NQAd2odUpZI3IwN5LF9mFtvphpbeEwtBNfTvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fbIh4YM3EqZoDQI44aRclx17fAFFVCNgxSUjqd3wfWA5iTayCh5gBabsVZEAE/yz87teCvqGigeZunt113h5095jzhRuBVk1vHSMI0W9WS9HAW3h9pdale8rUXaN7QtOzI5FwFyllxCJb98RAASCkYc1kznbWrtfsCq58kPT0PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6b747f2e2b7so7671467b3.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2024 05:31:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724329865; x=1724934665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xhi4TYnPdvQPguVVKA7cZrtkvm032qNsnu8bBuK6hqU=;
        b=CvHhGq6lRy4Wir4xBl2DFsexqnMfzVeDjAkozxIDhNT/+ybnGAFyOkQ2qcqx3DK1yJ
         a5Dod6PpRBZok4aGLM3KUeiK+wnble/E954C5lNn1t7g67tkO8CyinV5KDA9pAGd78S3
         aea4UhnRjR1BKAiMPgFFsvCURHs8LNC0gGAj9crrhlEbge4f94aYpVk6Qgi3jlsZNwx2
         +GFYAB20BZMwHzluYIrEMnszJzTRyoX2xQE29Rfm/oQ7s4BTqvuL8icVL+PZHPNEM2d3
         F0M/4b8FHmWdWM/8tSZUj5QTibzT1qk7QJv7q/RVMAzcvCp7r5cJ7pfoZU59E7DfBio1
         249w==
X-Forwarded-Encrypted: i=1; AJvYcCX3cFPpNlJGCYTBjJd/BL3u7bwObw4TozsmIRJRu25Z8+ly28hiAlbGMT7XScJh+7pWqASPxwKXamcpMRw29RxKig==@vger.kernel.org
X-Gm-Message-State: AOJu0YxL3AnK28H7YG2lHT1QQo2rtF6xsHsJcnsjA4vEGUD9wk136UCF
	AU0xkjwqTKAFK4EkmUViin5NsJPFDU3oQVAUgxsmXu/SBga2VLxfdIkCuvyN
X-Google-Smtp-Source: AGHT+IG8FWWxBM1FJ2toBQNPIQEYoIEhXWRjVPGQaHJJ8ulRySzqhFZQ11SZvrHe5Yc3vfg5MyPUpw==
X-Received: by 2002:a05:690c:4490:b0:6b9:7fbc:b0f7 with SMTP id 00721157ae682-6c0fc1de1e3mr46232027b3.21.1724329865152;
        Thu, 22 Aug 2024 05:31:05 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c399cb5693sm1962697b3.25.2024.08.22.05.31.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2024 05:31:05 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6b747f2e2b7so7671227b3.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2024 05:31:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXGwooRAgG3ms4acDF/xy0PX01eUzwY9KR7muY6YqoXT9YU0mREXLbMkZ0jp2QZpCS+N8bPZrJposGcpTNRnpv2iw==@vger.kernel.org
X-Received: by 2002:a05:690c:6591:b0:6bd:c7e2:dff2 with SMTP id
 00721157ae682-6c0fb640ecdmr57229477b3.14.1724329864814; Thu, 22 Aug 2024
 05:31:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805155242.151661-1-biju.das.jz@bp.renesas.com> <20240805155242.151661-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240805155242.151661-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Aug 2024 14:30:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXAG=x0DeDtp8y792E6o5vnFsFPt72JXaRePO2rkSvwdQ@mail.gmail.com>
Message-ID: <CAMuHMdXAG=x0DeDtp8y792E6o5vnFsFPt72JXaRePO2rkSvwdQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] drm: renesas: rz-du: Add RZ/G2UL DU Support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Mon, Aug 5, 2024 at 6:22=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> The LCD controller is composed of Frame Compression Processor (FCPVD),
> Video Signal Processor (VSPD), and Display Unit (DU).
>
> It has DPI interface and supports a maximum resolution of WXGA along
> with 2 RPFs to support the blending of two picture layers and raster
> operations (ROPs).
>
> The DU module is connected to VSPD. Add RZ/G2UL DU support.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Avoided the line break in rzg2l_du_start_stop() for rstate.
>  * Replaced port->du_output in  struct rzg2l_du_output_routing and
>    dropped using the port number to indicate the output type in
>    rzg2l_du_encoders_init().
>  * Updated rzg2l_du_r9a07g043u_info and rzg2l_du_r9a07g044_info

Thanks for your patch!

> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> @@ -183,8 +183,8 @@ static int rzg2l_du_encoders_init(struct rzg2l_du_dev=
ice *rcdu)
>
>                 /* Find the output route corresponding to the port number=
. */
>                 for (i =3D 0; i < RZG2L_DU_OUTPUT_MAX; ++i) {
> -                       if (rcdu->info->routes[i].port =3D=3D ep.port) {
> -                               output =3D i;
> +                       if (i =3D=3D rcdu->info->routes[i].du_output) {
> +                               output =3D rcdu->info->routes[i].du_outpu=
t;

Notwithstanding Laurent's comment, the above replacement is equivalent
to the original "output =3D i;", so there is no need to change this line.

>                                 break;
>                         }
>                 }

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

