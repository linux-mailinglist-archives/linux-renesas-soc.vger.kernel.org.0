Return-Path: <linux-renesas-soc+bounces-17301-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 717E9ABF5A7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 15:11:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5668B8C63D8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 13:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E677B2777E4;
	Wed, 21 May 2025 13:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TEQicBG5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154DA277037;
	Wed, 21 May 2025 13:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747833053; cv=none; b=DlCawrv/pFgiIGQIpr6Djvu7R0wIGGpLc+eUCmYqIWT2mDD+cXvzFDqrLwRkY0h184FF8ysmWDPUH4JoBxHlNM3TRwrBnnHZAeiQoVKp0CCX/bXst8POXwTQfPQE5giCiThmyNyM+JL+c1d6yf3c8ciDnjMNy4sPDv43gQUn/3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747833053; c=relaxed/simple;
	bh=+N0EsOxMzlQuApqznQafbw5+jTAR+Iw6BzZ0VRGEI7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xk1qqWL6tA3AGJP1ElenuU1Hm2+H0qLqxngvZWOj6oPv/zCLWdATzTgrio3mNmVdbjqxxyUrJJ2eFTqlERsQaNmssguO+0jRs3yJ/rzg+9lPSzgzWZ5qYkV0LtxFabYvY/8CtsIBCKak8QOjoNkKtkmxobTZOm6/yFjBUgupti0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TEQicBG5; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a36ab95a13so2464009f8f.3;
        Wed, 21 May 2025 06:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747833050; x=1748437850; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/i/cOKT8js+VBc0E/AJo6vob3UrWTCSL5Lk/36I7Dw=;
        b=TEQicBG5EWHVaDZPU9s1o1kWEgdLhyDln/s2PRhxsyQZG9Nct+IDZy4BkTyeu+lNAG
         Xd9+81z9VS4JRx0q9beUSRQsLZo4elAK+U6OVSa22rfncY2yxK7EwBJdjzethIYa80h1
         3FYN3tdu5QabQ6cJZjf7zQR+wM2jM9Z15GrTQDOuIjEnWrpginAlhU+FgpJ+g0SRFkDX
         GA+LIlH8PUg6mvrKooup/nKVb1fg3WKonIXzqzNbf602LqTGFfjwop37d/Zx9N2wJQo2
         gh86LGdG0iHPFRaAFg7Bh26pwQ+3cbGpmufOP0PBKctd56ehbsDPXdZmv0Pzr0BhMVZE
         nIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747833050; x=1748437850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/i/cOKT8js+VBc0E/AJo6vob3UrWTCSL5Lk/36I7Dw=;
        b=JbYxy0rzrYbKwnAOyWHpACAK1F8k+XFpmM8xotIcnv9oxC4xCw76eTYmhN7ZpTTm01
         MiJbLTNaoAg9TsbP55tb/HtynlK4Qhb1tCrFYdmwF6KicKhCGvyztAqsribNxh17R4Od
         jFcNBNQJ6NYFcT//PqbCaF4PBcfOWctxADtwQT4P/OfX1nQCf36MoxC/DTyd8eXPPwUH
         HZGFfTAsTqS5T9i+NXoTeq9wLfYYn+qRb9+N7MDPmBaANazKITVtp/vZk7y5OxXl9txs
         8gYJ6qnRl0fbU+6ick91NKnb0v3chVZpqYyhHu3PopFv2I26cyDVe7XfO7XOAMd5mUVc
         Xb4g==
X-Forwarded-Encrypted: i=1; AJvYcCUqZJQm9YCosDODf9WjFYsmSXTehB8jVwSxt33mMJuVHf5x+bQQK4rTpf/hbDKGhTWQIhoCmBazn0gB@vger.kernel.org, AJvYcCVZ7IlX/kDYPGHdNUi3minqWHqjHmzErGWtHP1WrpZMY9zb1OPGxWAoTbylkJQf59k57Xiqr7cthWLsaO2O@vger.kernel.org, AJvYcCXs5RupSJU0h/RJ65UDWl5dyA5J0uqgBpPDL+59Icx+G4IUNf//SQzUb9dYdQZBCnJGaIt/ssVzVj2A3LXDvcETWxw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSgFHMDii3WjvEM9FvXbH2u5OHK/DHYozshZy7zwKuc+882ADO
	j9Hm9554WZ4jq1f9Rrhgp01FZtdNPFqrGSD5kJXBvMLPHFLiuIrTE20L5WhDzCWIdQxcv7IpNZu
	NmN0TIj8/2hZi6ghmozYgqEY8/E2mN28=
X-Gm-Gg: ASbGnctsXhbzs82FsZ2GzL9mUaKVQdH0uQ7XQfBdQNO7fSbVCu7bRZRo9ts6b1bIIK0
	Tkl7NnpvoUJzg39L22Q+0cjhHVz76PCLB/8GDbdg9effqHUlzfZXwQovHe02OtJvAjng0iYeifC
	wUJxyZ4BoKJAEuyiMsIUgUx8rRm+qPxNf/qB/iVg==
X-Google-Smtp-Source: AGHT+IH4oQ/KZkDKNtscP9U9jlsLlq7/1OVsl4bF4giaJPvt/bEthmSkeP9I6o3Q0H4C4/3CZLrskdHpBT1rmXrsgnM=
X-Received: by 2002:a05:6000:178c:b0:3a1:fe77:9e0b with SMTP id
 ffacd0b85a97d-3a35fe7962bmr16202099f8f.16.1747833050180; Wed, 21 May 2025
 06:10:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512182330.238259-11-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250520142815.GJ13321@pendragon.ideasonboard.com>
In-Reply-To: <20250520142815.GJ13321@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 21 May 2025 14:10:24 +0100
X-Gm-Features: AX0GCFvkUotq5lJN2WL25-xOX-EKusGynjFMjAQPIg56Hl9FpsKjDTJt3B7gMeI
Message-ID: <CA+V-a8sxHiddge_U7SLr6jBdjVvDFCzqsr6mgZBCoyVsjo9Uxg@mail.gmail.com>
Subject: Re: [PATCH v5 10/12] drm: renesas: rz-du: mipi_dsi: Add
 dphy_late_init() callback for RZ/V2H(P)
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

On Tue, May 20, 2025 at 3:28=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Mon, May 12, 2025 at 07:23:28PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Introduce the `dphy_late_init` callback in `rzg2l_mipi_dsi_hw_info` to
> > allow additional D-PHY register configurations after enabling data and
> > clock lanes. This is required for the RZ/V2H(P) SoC but not for the
> > RZ/G2L SoC.
> >
> > Modify `rzg2l_mipi_dsi_startup()` to invoke `dphy_late_init` if defined=
,
> > ensuring SoC-specific initialization is performed only when necessary.
> >
> > This change prepares for RZ/V2H(P) SoC support while maintaining
> > compatibility with existing platforms.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v4->v5:
> > - Added Reviewed tag from Biju
> >
> > v3->v4:
> > - No changes
> >
> > v2->v3:
> > - No changes
> >
> > v1->v2:
> > - No changes
> > ---
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/g=
pu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > index 55a1c1b043c8..e1ce21a9ddb3 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > @@ -34,6 +34,7 @@ struct rzg2l_mipi_dsi;
> >
> >  struct rzg2l_mipi_dsi_hw_info {
> >       int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, u64 hsfreq_millihz);
> > +     void (*dphy_late_init)(struct rzg2l_mipi_dsi *dsi);
>
> As this is called at startup time I would have called it dphy_startup.
> Up to you.
>
Agreed, I will rename this to dphy_startup_late_init().

Cheers,
Prabhakar

> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> >       void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
> >       u32 phy_reg_offset;
> >       u32 link_reg_offset;
> > @@ -320,6 +321,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi=
_dsi *dsi,
> >       txsetr =3D TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) | TXSE=
TR_CLEN;
> >       rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
> >
> > +     if (dsi->info->dphy_late_init)
> > +             dsi->info->dphy_late_init(dsi);
> > +
> >       hsfreq =3D DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
> >       /*
> >        * Global timings characteristic depends on high speed Clock Freq=
uency
>
> --
> Regards,
>
> Laurent Pinchart

