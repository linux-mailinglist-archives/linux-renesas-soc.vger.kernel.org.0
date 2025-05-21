Return-Path: <linux-renesas-soc+bounces-17296-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19368ABF555
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 15:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C10331BC3CB5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 13:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B26AD26560D;
	Wed, 21 May 2025 13:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMad1plC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5EA2D613;
	Wed, 21 May 2025 13:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747832617; cv=none; b=p5DqPP6kfVRMaz+DglgW8KnBMEDPT3aFXhuUVzCdLgk3n0g9cs6KFTQoXNG/CrJu+8+FEyaRa4ONjIG6+ieh9B44VjnHprXcwGaz0BcRF8ZeqSJF/slQWJi01lHr+M5d0YFcVjnKodywT7gB7T3l3UoeJS4OLXyM6qhUXgzdVaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747832617; c=relaxed/simple;
	bh=vbrIPeAuJ804IDldj8BNXob9QvdNPd4/FN9fztDObZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LMN5VxIf1M6tIbjzTPFijThrG4MeQqQOwHrGZo0dK4YDAxftxTmVCKCMPF9UTdLdhGMnZdyBb+5QFxCbtPxP/ElJm3BZrtxVVEHGOUCwoiaHvRs3JphR7sYkgSL/GUTFB7JlQ7PZQyGoEInhRpUQKQ4XSvO8z9uzql5nBcjfRd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMad1plC; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a3673e12c4so2624783f8f.2;
        Wed, 21 May 2025 06:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747832613; x=1748437413; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxUCNKcIAtTYLrDekvN1ZxlXpxO8icS4vzE5Gw13lAc=;
        b=gMad1plCFvd4ZXYGkOSKrY16d0owZ8ts2MXbS3koDrru4m9p+o3RUj+pETZfQoNJJY
         fvUR5oH0M0agHHKHZ+wxgLQANt3NO62IDsYP/KmX+fOg8RJb/ufzObIQdnnIldBaMd51
         jll9CJHMbz9lAxz0eLyOj8XCsPaT4kvBka6DcqF56awAmZ9XeuSg4a2zpYCORofLSFzm
         uMKSYmoitIPauo574RuxGMPUG9tPmztPUQmoEdmKHO/Tir41bgfy4N4oq0UGqAW+0Bqs
         4V6yB3gsR4x8dH9wDhYcPzd1lL2oNi36LKxNsAM9aSindpYGLYjJ2VFv7MPJH6nvr6QL
         0jPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747832613; x=1748437413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wxUCNKcIAtTYLrDekvN1ZxlXpxO8icS4vzE5Gw13lAc=;
        b=tI4xR0vezrTXt5kDkKSw+eKJ+hav/OCht5li6V2v00pVT947CBt6WYw9j5pnanG83W
         AEjQljvRZZphZMzlU5lSBza8N5CJg5EVDwkSi1f8+kUJ7fPYMRd5OAduVWe2rVHigH7u
         KknjcTOBrbpEn87ZDFlT7bcAYm0+X7DLQ6AdBTKP1mzCH6530LpxGgoxJ/wDQgQvY4oC
         Vq4m6EsgreC6I1l80mBNpQa3daHDRcBC4RxQ6AXTGUtbZ73eqJ8iqSCCNbyKJx1XIPux
         zj//jzYoz2RHRf4DPqfLetgtF88l2oNG9uPDSiXF66NmVkLPp9O5OD5EjpDYFNVTAipE
         em5A==
X-Forwarded-Encrypted: i=1; AJvYcCUE5CN4jEZ3VN4LzsdfChT3/v+zczU6jri25CZrvGFYIWwFrygWbw6vYo8xIE3XCRFQiDyGe+Y3n43m@vger.kernel.org, AJvYcCUW+TPT9qvRFVqg8SmjukJvarjIM7sJJd2T317TLAPzis2Jd9eizrNNfQfUfkGd99XMtJ23au/Aww53qVXLEV1Ol8o=@vger.kernel.org, AJvYcCXSij07UWEUiVHXrmE8C6aepBD4MAf4Qa31VtxcLV3MTQpb850XWgHn40JVKp70FVNrWSTfFxFAQw8KoibH@vger.kernel.org
X-Gm-Message-State: AOJu0YxH5qriXMF3OWCGtW0ljf79lM7dIwegpZXJSpw2V/nxUmWY6dng
	MVvyWDlgk2LArd4qIDVjZ+x23Wpznv8EdOqk0XRoQBNtp63J11271YQRzDJLlvRYMUWaLPKJsNy
	vcbTpPcJHA6LkXQdkfmnfk7k1jEt2RUkB/Y/Cx9s=
X-Gm-Gg: ASbGnctSP9hjpAAksfwKNJNd+Mq05sPZeR1fbaa8T44u7aVht4wkw8o5grv9+h1rpXN
	j7hJFqNO7PXWwiz9xLQ/uw17e6+wtSLAbBOtXDzeI0Yrmu/VSkjSj5kDKxcMsGwdVXTMLZ6SeTp
	D4hfA1pyzyl18oeGJun7CFCS35Lr4=
X-Google-Smtp-Source: AGHT+IF/naWSKz9Iv0UJNgBSgjeRcEZZGj46F7Ju4nJrrYSa1meUmDtFjbIVglIeqEAVFZYHjaKdytI2+lWr5HTtIkE=
X-Received: by 2002:a05:6000:1a88:b0:3a3:63d3:36a7 with SMTP id
 ffacd0b85a97d-3a363d33916mr16104984f8f.33.1747832612802; Wed, 21 May 2025
 06:03:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512182330.238259-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250520140514.GD13321@pendragon.ideasonboard.com>
In-Reply-To: <20250520140514.GD13321@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 21 May 2025 14:03:05 +0100
X-Gm-Features: AX0GCFvSCItvyC7zSPBsFZ7h_B5ndgyUu6UlDl1R2XH7TowgSYTkizcIkSlL3n0
Message-ID: <CA+V-a8vn46BLWyn0DCp-6h3eZD8ef+r7vLCy6vkfkyehdM8d7g@mail.gmail.com>
Subject: Re: [PATCH v5 04/12] drm: renesas: rz-du: mipi_dsi: Simplify HSFREQ calculation
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Thank you for the review.

On Tue, May 20, 2025 at 3:05=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Mon, May 12, 2025 at 07:23:22PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Simplify the high-speed clock frequency (HSFREQ) calculation by removin=
g
> > the redundant multiplication and division by 8. The updated equation:
> >
> >     hsfreq =3D (mode->clock * bpp) / (dsi->lanes);
>
> You can drop the parentheses around the second factor. You can actuall
> drop all prentheses.
>
Agreed, I will drop the parentheses.

> >
> > produces the same result while improving readability and clarity.
> >
> > Additionally, update the comment to clarify the relationship between HS
> > clock bit frequency, HS byte clock frequency, and HSFREQ.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v4->v5:
> > - No changes
> >
> > v3->v4:
> > - No changes
> >
> > v2->v3:
> > - No changes
> >
> > v1->v2:
> > - Added Reviewed-by tag from Biju
> > ---
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/g=
pu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > index ec8baecb9ba5..c5f698cd74f1 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > @@ -277,10 +277,10 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mi=
pi_dsi *dsi,
> >        *       hsclk: DSI HS Byte clock frequency (Hz)
> >        *       lanes: number of data lanes
> >        *
> > -      * hsclk(bit) =3D hsclk(byte) * 8
> > +      * hsclk(bit) =3D hsclk(byte) * 8 =3D hsfreq
> >        */
> >       bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> > -     hsfreq =3D (mode->clock * bpp * 8) / (8 * dsi->lanes);
> > +     hsfreq =3D (mode->clock * bpp) / dsi->lanes;
>
> You can drop the parentheses here too.
>
OK, I'll drop the parentheses.

Cheers,
Prabhakar

