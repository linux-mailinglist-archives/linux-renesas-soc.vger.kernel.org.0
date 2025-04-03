Return-Path: <linux-renesas-soc+bounces-15337-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CFDA79FEC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Apr 2025 11:23:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFD181713D3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Apr 2025 09:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A238E1F236B;
	Thu,  3 Apr 2025 09:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lSQG6vIR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063C91F2BAE
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Apr 2025 09:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743672101; cv=none; b=AE0v6wWsk06kaMsZe00LAZXaHe26rgv3vfnC/b1xG0SLxz3KxpH4KLVWQrYuu9aMqLvZ/KzNs6G6RWypf61YFzuoCfGz7qHi3OOEojqERlVmx9gDl4eKfbIXgTaDZ6a6fUzsZfaNK1ve2CGI2F3jirxwKV+6y2xMe4SI/ug4Szk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743672101; c=relaxed/simple;
	bh=fx8e5TCq57JpioEX2uKOR3o+OiSpqk5ukc8/rTV7wvQ=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=ace++iN1Kim9/cIZ5QHLy0NF43VPKY2ttzWn3c+WvaLsAhnEbedDHEg0bH3ZImqsFufFYnQcTCVvSTftuYxifvwKyXFCus7pPFwIjiQj17T1alJtJawWtXpWoPNs+rlQOGTdd3wNm8UWKoWtfePi06FAVCgZtiQ6c0VNzsVPjFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lSQG6vIR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D68E8FA;
	Thu,  3 Apr 2025 11:19:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743671984;
	bh=fx8e5TCq57JpioEX2uKOR3o+OiSpqk5ukc8/rTV7wvQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=lSQG6vIRnz9bAV8suBHqPRavEbwhbp65wngQl4Oxr5uaEZtfdjLKAypWQwPBtZbfR
	 2aA9BxB+PtfMgYxJbi7MJ854ZnnM5d2x7Y2enUxQa7zolGOW1bgtInHITAny9qvG+M
	 w++G+QDusDLhjFiz8YPHCPz/Q9EDiAKOut2EKsSc=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250330102357.56010-2-biju.das.jz@bp.renesas.com>
References: <20250330102357.56010-1-biju.das.jz@bp.renesas.com> <20250330102357.56010-2-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 1/2] drm: renesas: rz-du: Drop bpp variable from struct rzg2l_du_format_info
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@gmail.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Date: Thu, 03 Apr 2025 10:21:34 +0100
Message-ID: <174367209464.2211561.6626065609601707141@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Biju Das (2025-03-30 11:23:52)
> Drop the unused variable bpp from struct rzg2l_du_format_info.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
> v2:
>  * New patch.
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c | 3 ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h | 1 -
>  2 files changed, 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c b/drivers/gpu/d=
rm/renesas/rz-du/rzg2l_du_kms.c
> index 90c6269ccd29..1a428ab3c424 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> @@ -38,19 +38,16 @@ static const struct rzg2l_du_format_info rzg2l_du_for=
mat_infos[] =3D {
>         {
>                 .fourcc =3D DRM_FORMAT_XRGB8888,
>                 .v4l2 =3D V4L2_PIX_FMT_XBGR32,
> -               .bpp =3D 32,
>                 .planes =3D 1,
>                 .hsub =3D 1,
>         }, {
>                 .fourcc =3D DRM_FORMAT_ARGB8888,
>                 .v4l2 =3D V4L2_PIX_FMT_ABGR32,
> -               .bpp =3D 32,
>                 .planes =3D 1,
>                 .hsub =3D 1,
>         }, {
>                 .fourcc =3D DRM_FORMAT_RGB888,
>                 .v4l2 =3D V4L2_PIX_FMT_BGR24,
> -               .bpp =3D 24,
>                 .planes =3D 1,
>                 .hsub =3D 1,
>         }
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h b/drivers/gpu/d=
rm/renesas/rz-du/rzg2l_du_kms.h
> index 876e97cfbf45..e2c599f115c6 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h
> @@ -23,7 +23,6 @@ struct sg_table;
>  struct rzg2l_du_format_info {
>         u32 fourcc;
>         u32 v4l2;
> -       unsigned int bpp;
>         unsigned int planes;
>         unsigned int hsub;
>  };
> --=20
> 2.43.0
>

