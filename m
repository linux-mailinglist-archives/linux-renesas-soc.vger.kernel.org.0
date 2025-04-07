Return-Path: <linux-renesas-soc+bounces-15514-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C466A7E7D7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 19:10:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6275F3AA21F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 17:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F9A21423F;
	Mon,  7 Apr 2025 17:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nPmRb1CM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FB92144DE
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Apr 2025 17:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744045419; cv=none; b=a5Jjnp/3am/TYA4lLKBPMIpXs+dbFhc10ags2Oold5to10738AqlCbIK4tcuqlOxrfJnemRNbzuKDlzq6+bGxNnW1waaeblTMPR80t2Rd5q2Nak2sOtJS/deLP7XuZ9ZgXaj40pd5dDzdH+Jb3/iCWb71dEtmk2qiz5PwLeV29E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744045419; c=relaxed/simple;
	bh=JoK6+ebS5VEZMQmMaxrOnXwjNI7prm8JGacQPRJM+4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dc7Vvb4mDUSOrzkdgeeeYiu2gOeLFwDpJ5mQ17HRjqqz0ZpZXMiqzw0ptr4Pg+ggz+60FrM/95wG2Pd5fk2Pvcd/+rimhLZD1eHRe08tfKKg18O4Rt0Zqv7WLuHkBdYBVeByrWodP/Fq40nZJkcRHCg59YZ1FyJhRik+V/jugIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nPmRb1CM; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-86b9d1f729eso2066798241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Apr 2025 10:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744045417; x=1744650217; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fpseVAhEseWnTo61VbEwVPRmzrBf+CuzEXB31RDWwHE=;
        b=nPmRb1CMWyVYtPOnLpCqFu0ClEgPUHMc2xzQJI6cYYCVZZudWLCYAdpLk3p22K8wha
         /9s5RMxfgBccKBPJQMX93HxMI+Z6sdA14LYfCLIgQPGBTdzMwEJetlRuj4PpXEFciZn1
         jz2eUyfJs93pZHhdAdysx2vzS8guFF0YtIEr6CCCyBAoRgL7RUjtHB8dnJd2xVrA1+1C
         iyO/rV0ERy00r/3cTzRllhjD6jolK5loGpQxPOj7CB9PYbIcBAMiLkcZeRskMGLRmiol
         ddV+CTVq6aVtoHuo9iNqcydS6uF0X2DKQZBOOrGXW0CiVh3c/S1cqvC1xPSzA/MG0Whz
         fi/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744045417; x=1744650217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fpseVAhEseWnTo61VbEwVPRmzrBf+CuzEXB31RDWwHE=;
        b=sRFf8z/ae1LK7moYRrDrlGPNjvWuZJtHzzqWtAkwoLvNdGX4QrjH63HkZVNNm5mRN0
         mXf2VqzR32CVMOdi4bsW9s4/ZtE9LE/jgF75qGlynqLBnsS2wqTmv1DF+S5pI/TcBxls
         SOTiTjizjLzmG4CtU5RE2FjcM0V5/iaweqGpdHk18KOCi4LpOtfFEwSdydUVPh6Y/g24
         TjPNfrwzrL2nNtBUEaHmQe9faHCP6Pm17UpFyEWIfP1UFwl/BufudkHf2q8vsfrzfJnv
         cmlP3xMFuHD3KHOGCCDOGaJdRbR9XqnRoTFvXTCyJmINSrNJnd7RWEUGUN/i7bdSkH2f
         fQLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk8phQvGgHTV0QW0M0kDiL/vIrHJl9F4uGoBJirW9aDsdVMssiWtTHLCGC5Y609O1KxRgns1Odq6svMzYkA7aOMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDmEqg2FOVhIE0XXOvFdPNYGU3324+a3HuVJXigmvOwASQbr0L
	Y/MIwT3d7G5xPDa5uB8aYBS2O6gMf4Hz1mKkv5a9RvN1ZGg6FRKS5T54+snmW2yn5yyhNfMf9Ji
	gdwOvoVfPFAVlkmWBSlXbNKkTefg=
X-Gm-Gg: ASbGncv46ODRn3r0OpoaJzROQBEu797E8MxFxGVXHSR4oPgrssQYLHcOobEqMY9SpiW
	9Yk32UQpi2E+yTZRc7cafIFv2dcZa6tgre8BACtLsgPLOZdEnbhtzvbqdTrmlBscPd4yng62/gH
	vV5I2MzvbfCfIGu1C7EVdBE/Ybfg==
X-Google-Smtp-Source: AGHT+IGxbAVyVf2xA8LPwk7l2JB0DfGDrOCLCNVHquxc4ButTdJVyVMQctTheAzeOya9s0lUWHSHj8atxG1Q25XTjxA=
X-Received: by 2002:a05:6122:4f91:b0:527:67da:74ee with SMTP id
 71dfb90a1353d-52767da815amr9489566e0c.5.1744045416847; Mon, 07 Apr 2025
 10:03:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404133047.172080-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250404133047.172080-1-biju.das.jz@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Apr 2025 17:03:07 +0000
X-Gm-Features: ATxdqUGQhJZ4PWoV6QIPQdENxYFj6YSpbw2paP05alJ-PbIXiRXrqN8C_GzJXsk
Message-ID: <CA+V-a8vk2A80gJGDHe_j4deYqfAUT22SJe6TcGTW3G5L60SfSw@mail.gmail.com>
Subject: Re: [PATCH] drm: renesas: Add zpos, alpha and blend properties to
 RZ/G2L DU
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 2:32=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
>
> Add support for zpos, alpha and blend properties to RZ/G2L DU
> driver as the IP supports all these properties.
>
> It is tested by the below modetest commands:
>
> modetest -M rzg2l-du -s 44@42:1920x1080@AR24 -d -P \
> 37@42:512x300+200+200@XR15
>
> modetest -M rzg2l-du -w {32,37}:alpha:{0,65535}
> modetest -M rzg2l-du -w {32,37}:zpos:{0,1}
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> #On RZ/V=
2H

Cheers,
Prabhakar

> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c b/drivers/gpu/d=
rm/renesas/rz-du/rzg2l_du_vsp.c
> index 8643ff2eec46..040d4e4aff00 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
> @@ -340,6 +340,15 @@ int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, stru=
ct device_node *np,
>
>                 drm_plane_helper_add(&plane->plane,
>                                      &rzg2l_du_vsp_plane_helper_funcs);
> +
> +               drm_plane_create_alpha_property(&plane->plane);
> +               drm_plane_create_zpos_property(&plane->plane, i, 0,
> +                                              num_planes - 1);
> +
> +               drm_plane_create_blend_mode_property(&plane->plane,
> +                                       BIT(DRM_MODE_BLEND_PIXEL_NONE) |
> +                                       BIT(DRM_MODE_BLEND_PREMULTI) |
> +                                       BIT(DRM_MODE_BLEND_COVERAGE));
>         }
>
>         return 0;
> --
> 2.43.0
>
>

