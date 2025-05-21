Return-Path: <linux-renesas-soc+bounces-17295-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 423B8ABF516
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 15:02:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C956D1881214
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 13:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA54C264A95;
	Wed, 21 May 2025 13:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQ+OohuU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10E1264627;
	Wed, 21 May 2025 13:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747832528; cv=none; b=TC606iyYZSMCFOCYnnFxnFUV6835M3CTAB45k4qrNm6+iLT/NkkaS1qTZ4vTJs1mZiPSyXrFgpR6BP5zNCRe8qJRE+jjwFbqOaxqYMn6GOn8CS1+BUMfj53wqfJHgTKpcgl0AnAxHRUmzg3Gm3hgnAqLy8f2KUZ5yZxm/JAGQRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747832528; c=relaxed/simple;
	bh=ZD3FvnIkp4Hy7XHvNTpGCTGWO5g+5SXyPjLloT8M85w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gUyyjB6UfHDec3ID30mezwDucB4jec5a2eFBPzFpjFGDGlkOBXEzMkmUR+viSrg5ZMYc8OV9ncJPQTFly7x425q4NpUD9SjrkuhN6KmHrofIdQ+qySgyjKvyZmaty+qVDHjEqU3C+tdBPP+aHAHAMhb830V5JiOaFbS/EDGSrpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQ+OohuU; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so76501895e9.2;
        Wed, 21 May 2025 06:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747832524; x=1748437324; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmXU8KBDB233JjIK1ODnuLy3coNih7UFHZ8VsOcgN+0=;
        b=NQ+OohuUXyAoGuKmyO2zM8jxV0dsndYuc5ZWv6wtYFH8B8o0R+QjduMJP5Ffd3o2Qm
         86VOY+IlSP1UDGw0E0D8EAvGbnhje7cosn5sr+0rHWD81UmehlxGB4Yr5FjFApF21Rhg
         +AJPAqfo2NttjN7WAL7w1F0SPeoKpx2CNsVqHzXEIPIIIohlia/gJh4+nvdv3Pk5S83Q
         IO+tNlCXFLCNpx16kag++TryElapMlS5zyApjqkDY8l0DL5Z1drLz6DhWYszr8A01MpY
         vei/+JiLrOAEduHK+llDLDj8nuRxpTZE531M28y5Cll9Xbm8h5u63St9utT0EYuY8EnK
         qGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747832524; x=1748437324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bmXU8KBDB233JjIK1ODnuLy3coNih7UFHZ8VsOcgN+0=;
        b=ZGvAgln+WJy2Y1A4PgXFyC7K8G3AhPTIzapNB23fTlaHJaooejMbgf8KoFgquilct1
         Kbw3YO12zUYlFU9xjp9lQpiWEmdgrjpjlDQzc5zGLmeV6RvRuO7da6qKS5ffyLN4JyNf
         WuawAogRzWcmvyZx2tJS2Avki+LgW2WhtzDWNtIttGlYU1q65Xs6iM6rLsD6rvnZ5arn
         fjI6mwblbcSVpiHjBQF7XjTpAbZAxSYNf/5H3GrSsnItb+WnVJb0dX00RDsmIyCMT5D3
         NzsEitSffoLWMtd4+5kD3RTgVcO6rajrugUi3ZfOus7Dnr/FSsIz/CnApvvZBJAV0tUY
         0Dkg==
X-Forwarded-Encrypted: i=1; AJvYcCUcloMViPh3nSDdwGMopi/P7H/+M/xFl/G5TPThlx3DBTJlkMuP2kHdq1ihcuKmlK7Q3SuLMgQj40GpHBBD@vger.kernel.org, AJvYcCWbMLqoqnlnwcqrotwgMKxcx4TKUdRijYBfx9jWNFZ6TtUZgP4gj4cZhW8o42wLzvYpLRY+MzP047iiZM5SSQ+/+Wo=@vger.kernel.org, AJvYcCX5fTzfePGz20AfnVW0kMpfpwQmHE8yfd3Va4UqI/fwylVhNW6NnGSrdrV+qh5xoFqZwRfrDEQdsIOQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxkJgboeyFAU0b3I4lLXPyUGLGOL6TyOzNbK0nFixtbQg8UKpW8
	qXuV0ImHzzpkr6Zk2DM0o7N9mQkvbQcSzdeoIfXQuiRX3AzGr+9V0RTg2RS6VkbqgRxonYiDYHG
	POqXMC8r9CSnflEvzjItZJ5/1Q+JUxVo=
X-Gm-Gg: ASbGncvMtbnwkKZI/5xra+zouzdqUxmpULMUOspRgG2ET2QM4t2QCbgbGhaccmQ8qTL
	ym4vAav5+bCLiD9G1OFsOM1lua5k56mOev/9gS9bdRMlRxEygwvmaNxq5z020Mk2HVAVAt7tvoB
	IeuIs23Bq5yDbftM3RskRUN11I560OJQPPqOpW8Q==
X-Google-Smtp-Source: AGHT+IFoWwKL0JlRqJiqoNHNvz66aPp7wIa51xRehBMoBO1ScvekUMbPVG/LKrbcj5M69N6ry5MNkYl3/sR/JqNxWuE=
X-Received: by 2002:a05:600c:6487:b0:43c:fe15:41c9 with SMTP id
 5b1f17b1804b1-442fd622e97mr179727585e9.9.1747832523172; Wed, 21 May 2025
 06:02:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512182330.238259-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250520135820.GC13321@pendragon.ideasonboard.com>
In-Reply-To: <20250520135820.GC13321@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 21 May 2025 14:01:35 +0100
X-Gm-Features: AX0GCFt7GSGvdoA8i47pvJvno_4NO5uT_BXI_Lak85lev8oBUTuihwtydPWscd8
Message-ID: <CA+V-a8swf=LeUxmEFkMCOK-rJ8w+yZK_ALG=GvFRq7VRF_NW+Q@mail.gmail.com>
Subject: Re: [PATCH v5 03/12] drm: renesas: rz-du: mipi_dsi: Add min check for
 VCLK range
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

On Tue, May 20, 2025 at 2:58=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> On Mon, May 12, 2025 at 07:23:21PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The VCLK range for Renesas RZ/G2L SoC is 148.5 MHz to 5.803 MHz. Add a
>
> I would write "5.803 MHz to 148.5 MHz" as ranges are usually expressed
> in increasing order.
>
Ok, I will update the commit message as above.

Cheers,
Prabhakar

> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> > minimum clock check in the mode_valid callback to ensure that the clock
> > value does not fall below the valid range.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
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
> > - Added reviewed tag from Biju
> > ---
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/g=
pu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > index 4550c6d84796..ec8baecb9ba5 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > @@ -584,6 +584,9 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge =
*bridge,
> >       if (mode->clock > 148500)
> >               return MODE_CLOCK_HIGH;
> >
> > +     if (mode->clock < 5803)
> > +             return MODE_CLOCK_LOW;
> > +
> >       return MODE_OK;
> >  }
> >
>
> --
> Regards,
>
> Laurent Pinchart

