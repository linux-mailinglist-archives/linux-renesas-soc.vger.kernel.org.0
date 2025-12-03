Return-Path: <linux-renesas-soc+bounces-25536-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF691C9F3EB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Dec 2025 15:12:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BF723A308A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Dec 2025 14:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A5012F8BC5;
	Wed,  3 Dec 2025 14:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WbJkUg7R"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480A72EC09D
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Dec 2025 14:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764771122; cv=none; b=J6UmCr1+fMGaPs1TsZm9Fk4oAZxR8l0Z2lP9GaSOV6jeSirpeUv98C8/d21PDofSyK9pe29s47Gmj69x1VRgnOwD0Ibt7Aw2n9J5bLW9R5kJekGPwRZbsHOEjC1XNugNIdGqqYWJ29/fS8rbz8CpvS/IMX4qdwZHyT0OOeOVRqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764771122; c=relaxed/simple;
	bh=NdHWVdISt9yTJOf1wbSI0ZP1LTkrmcR8XeIiZO6D2yg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=svfANxvLGA3JH0yb3HwQBf2GIFenl532rjnViHkDvUofLqymtxMrIr7LyMiIsKYxX9R0bUUZwyN+YSSCAX+fzGq3SpuTv8n6H2HNgDnpFGj+7myQI1fNf80Ux+qrA6//909kgIxKBBIblYonXoDtDlA4kH99RHXJ2OFK3brcmKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WbJkUg7R; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4edb7c8232aso85836751cf.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Dec 2025 06:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764771120; x=1765375920; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TjikvMbBLAvP8JTEk2DJsCaYzW4mbrgZZwpCXseTwmY=;
        b=WbJkUg7R3h5yrDA2Fhg/gNRBgO+nGzj8/JdrN0gNMr9x137QKMnoDpjKExR7cASjBu
         uRxvbdIM1eboAQbE7PPHNnGDXfj3DHAtkyeY0AjTk930vzbyddxN0CY+dNqFTAZpe6gA
         d8oZ9zAShf//OX3qtb3+yUEYKh5MXkScC0LZNIlmygG1W3qenDG6YCU0U7F/dmkYkDkr
         ZLpdLftGQqnDY/P1MUMVcl4TDt8wgZA2zyluo7Yl2aAPsblh0d8eR87HknwLlYZ6gBvX
         WevMDFXxuYZaS/VUJlIMEtMbHoo9uAOdsQIvcULGNu2dwunhKax70giCN8xyoZPnIRO1
         ll0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764771120; x=1765375920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TjikvMbBLAvP8JTEk2DJsCaYzW4mbrgZZwpCXseTwmY=;
        b=a5Wq/cbfGK3nkAlStCSfmiRf9jxKtoR+lORPTKSZHy1nd0sN9uwYlCF/Audn3C/jeY
         IWXEPDfDNsj0vvXhdiuMYjEiRlZcDabUrPGjVp71FirDZpIM4YvvRUQhSkqs/YIjZ0wC
         XWrFKjIRthdU8Xv8G70tSeoDFHGw39/UIw3VTsGOlzpl3a2HEeoWG9gsDAOtoUwkknM4
         0cpT+Cmuc1TCkVlQdWP1GO31PsrW9IfYgnR4rhcNLdvLf+RFmcYf1QUyq2SM7Aqv8o4/
         uKMZ22dEnDtpaCRi9rFgE2vcmX0WnkgrTv5ldWyc69LpxqFdL011sJjVzy9RZrH9LkBJ
         M6oA==
X-Forwarded-Encrypted: i=1; AJvYcCXB5rrwoAoI6k+OB/YSJG66LHihMdNvEP+cVEmqWWmCuPYBh8gyUjswxjJHZuoKJz+D41q9bdPdN9YJVcJd1beSeg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6yh78R0yYjre0ry2qybqQyf3B+IXsqbDJDl7Dds4DGnznEqIU
	asWK0hBv/caTZZQppAQh1PTdK30wdFzH4IV7mTwuYk0FPTyL6T6iogAyzJCdxBbdwrn0q2IaQac
	OjDQZ8I8Oilj3KswcH2tuRbiaDjgB5PE=
X-Gm-Gg: ASbGnctWpipuOVcCOYZ9XDTzErgpGCPWIv++HHE6B+5xt9kfO2t9uYHgf5wzXRCet19
	Tbj4Ni2xunjEAKw7E8oGhDSbfyQ8eDwNJzRLhfV+27D65mjGYxoVExt+fvqvQFBA5iiL8LtdNQp
	V0vqQBevguSYFQvxLEMloNbs2NXiSntEFxvJB1SFP6sf62gs3SguysEbD0N1k6iz5du7SUkO+2A
	bnb6el1Nj9PWTM4HNRxqkSIDuKVH5kCe9vFQdaZIQ/adWxMsaSkYqHCf9JWxs1GGD/EbXw=
X-Google-Smtp-Source: AGHT+IHYrT4T9dL1OLnbfPDjT28JMb2318J5/B3eoFhCblccxFHS7LXQDPLZwahRE4rYRyKabmK+IYyCL27PUavzRcU=
X-Received: by 2002:ac8:7c4b:0:b0:4ee:1db1:a61b with SMTP id
 d75a77b69052e-4f0176e0e22mr32108741cf.75.1764771119925; Wed, 03 Dec 2025
 06:11:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251202-mcde-drm-regression-thirdfix-v6-0-f1bffd4ec0fa@kernel.org>
 <20251202-mcde-drm-regression-thirdfix-v6-4-f1bffd4ec0fa@kernel.org>
In-Reply-To: <20251202-mcde-drm-regression-thirdfix-v6-4-f1bffd4ec0fa@kernel.org>
From: Vicente Bergas <vicencb@gmail.com>
Date: Wed, 3 Dec 2025 15:11:47 +0100
X-Gm-Features: AWmQ_bkzp4_vseBr9tvcxqOGhh90DbsGff_6vKvilwsSsGnyg33iWaxt34V14Bc
Message-ID: <CAAMcf8AtH_WmM=EBNkcYyD7otYjk6YuuHHCVHUi4n+viOpu5WA@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] RFT: drm/rockchip: Create custom commit tail
To: Linus Walleij <linusw@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Aradhya Bhatia <aradhya.bhatia@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 2, 2025 at 10:03=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
> "drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
> caused a series of regressions in all panels that send
> DSI commands in their .prepare() and .unprepare()
> callbacks when used with the Rockchip driver.
>
> As the CRTC is no longer online at bridge_pre_enable()
> and gone at brige_post_disable() which maps to the panel
> bridge .prepare()/.unprepare() callbacks, any CRTC that
> enable/disable the DSI transmitter in it's enable/disable
> callbacks will be unable to send any DSI commands in the
> .prepare() and .unprepare() callbacks.
>
> However the Rockchip driver definitely need the CRTC to be
> enabled during .prepare()/.unprepare().
>
> Solve this by implementing a custom commit tail function
> in the Rockchip driver that always enables the CRTC first
> and disables it last, using the newly exported helpers.
>
> This patch is an edited carbon-copy of the same patch to
> the ST-Ericsson MCDE driver.
>
> Link: https://lore.kernel.org/all/CAAMcf8Di8sc_XVZAnzQ9sUiUf-Ayvg2yjhx2dW=
mvvCnfF3pBRA@mail.gmail.com/
> Reported-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
> Reported-by: Vicente Bergas <vicencb@gmail.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> Rockchip people: can you please test this patch (along
> with patch 1 of course).

Hi Linus,
i've applied all 4 patches from the V6 patch series on top of v6.18
and tested on the rk3399-gru-kevin platform.
It indeed fixes the reported issue.

Tested-by: Vicente Bergas <vicencb@gmail.com>

Regards,
  Vicente.

> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_fb.c | 50 ++++++++++++++++++++++++=
+++++-
>  1 file changed, 49 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c b/drivers/gpu/drm=
/rockchip/rockchip_drm_fb.c
> index 2f469d370021..63e50ea00920 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> @@ -24,8 +24,56 @@ static const struct drm_framebuffer_funcs rockchip_drm=
_fb_funcs =3D {
>         .dirty         =3D drm_atomic_helper_dirtyfb,
>  };
>
> +/*
> + * This commit tail explicitly copies and changes the behaviour of
> + * the related core DRM atomic helper instead of trying to make
> + * the core helpers overly generic.
> + */
> +static void rockchip_drm_atomic_commit_tail(struct drm_atomic_state *sta=
te)
> +{
> +       struct drm_device *dev =3D state->dev;
> +
> +       /*
> +        * Variant of drm_atomic_helper_commit_modeset_disables()
> +        * that will disable and post-disable all bridges BEFORE
> +        * disabling the CRTC.
> +        */
> +       drm_atomic_helper_commit_encoder_bridge_disable(dev, state);
> +       drm_atomic_helper_commit_encoder_bridge_post_disable(dev, state);
> +       drm_atomic_helper_commit_crtc_disable(dev, state);
> +       drm_atomic_helper_update_legacy_modeset_state(dev, state);
> +       drm_atomic_helper_calc_timestamping_constants(state);
> +       drm_atomic_helper_commit_crtc_set_mode(dev, state);
> +
> +       /*
> +        * Variant of drm_atomic_helper_commit_modeset_enables()
> +        * that will enable the CRTC BEFORE pre-enabling and
> +        * enabling the bridges.
> +        */
> +       drm_atomic_helper_commit_crtc_enable(dev, state);
> +       drm_atomic_helper_commit_encoder_bridge_pre_enable(dev, state);
> +       drm_atomic_helper_commit_encoder_bridge_enable(dev, state);
> +       drm_atomic_helper_commit_writebacks(dev, state);
> +
> +       drm_atomic_helper_commit_planes(dev, state,
> +                                       DRM_PLANE_COMMIT_ACTIVE_ONLY);
> +
> +       drm_atomic_helper_fake_vblank(state);
> +
> +       drm_atomic_helper_commit_hw_done(state);
> +
> +       drm_atomic_helper_wait_for_vblanks(dev, state);
> +
> +       drm_atomic_helper_cleanup_planes(dev, state);
> +}
> +
>  static const struct drm_mode_config_helper_funcs rockchip_mode_config_he=
lpers =3D {
> -       .atomic_commit_tail =3D drm_atomic_helper_commit_tail_rpm,
> +       /*
> +        * Using this function is necessary to commit atomic updates
> +        * that need the CRTC to be enabled before a commit, as is
> +        * the case with e.g. DSI displays.
> +        */
> +       .atomic_commit_tail =3D rockchip_drm_atomic_commit_tail,
>  };
>
>  static struct drm_framebuffer *
>
> --
> 2.51.1
>

