Return-Path: <linux-renesas-soc+bounces-34209-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6bHpNzckNGqUPgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34209-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 19:00:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 808666A1BA0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 19:00:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=OqLhegBD;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34209-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34209-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C69703047419
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 17:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C138C3451B0;
	Thu, 18 Jun 2026 17:00:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9A131E820
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 17:00:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781802036; cv=none; b=a1fJ9PfkzV5RaG439NRoBXFmbnxQXJgzfFjBSJjxQ8VcxkEU7CgUkUz5D7d1m4PTghqKNbkx+16eUonsXFh9+yGs52dJsTmjekWxHAJttBd4rMw+XEe293Ae5zxc8+p2Qv48bDwjXfX4XTcx7pBcMJnk8mo6EPk4Nlg8LRBJEsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781802036; c=relaxed/simple;
	bh=/mutgZL9lgn7/Kt30wwqo3XImwb5c0U6/NKTa9jeqqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jUXZn8sq3RamtEIbO2RU2NbIn6khpXK/uTbKzYWCKURj4zQ73AgYn5oQhHkX6zRWE0DV+nja/Ul2F/zThhMk+IsAn1ovaUiLYfkn01vE930e5677ad49rUIjKLn30gyBZCulYcNQqyHFzAARACytI2nbIRyRsguOtrKux3u8Zz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OqLhegBD; arc=none smtp.client-ip=209.85.217.51
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-6c6f47198e3so806176137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 10:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781802034; x=1782406834; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZcqBl9MGo5keDsaGunZf7Kbn8uQHXFUIROLGD7+Cdxs=;
        b=OqLhegBD8l6nWA3R9T+gVRJenjGupcKJtAR8RhYMCr8aKCKdb4ilGwxOnSkc88DXhG
         dVah1DxQ7DfoYOKAH+fNuBvBvaa/z9iWlD8A1GibnoM6s6I9UvW+lplJ5un5WiEKAbYP
         /hRzC8GZKvVlHt43M66zFVDa7TWclukgY5qmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781802034; x=1782406834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZcqBl9MGo5keDsaGunZf7Kbn8uQHXFUIROLGD7+Cdxs=;
        b=gKY9FN4GN1DCMHHXnsf1+OYEIDhzrJ4DLpvJlobrm4hwmii9V19ould9LB1jyRe+MP
         p+ASytYJgqvR1Ac/GQZHbxkodcCDlCS1j98/yqkoSIxCvBVV29I4ZAmxwRWEDBCW1tgK
         eMWjUi3NbgUhXRfPopVh2k6rkMxlVHDXJW1gLDe2Opo9lNsGFcG3a/wxO3d2HkOZWM+O
         jDWKs6kc8JEYSvwYIkSpr7L2Kb16okHVTfgII3E3y61MQ7atwUxCeYxxD56jVjX+jrrs
         lx3Z1OcvwhDVT9biNvFfTwHswYTOYffmya7I1wL70O7dG1h3Bf6TUJWgk4elLwaA4mnQ
         R5Lg==
X-Forwarded-Encrypted: i=1; AFNElJ/f2h3nOK28QNclx55XBLGCeslRYXXrRw5JX1p2L1WsBj1buBXx78PUPrt9OtKsbc2pfIVRaAz9jLGZ31p8z4XAuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUaqzrbLDXKWCDb4UOgu/H+q7I0YEgUXfn71yjp3lqvBCw3Oe+
	9yOKPvS+yKNm7iG2W1mbdOGjZ3ptWYebr5owyXZadwdk/mFis9sfBsvfAH8DsmmvlW2JIBDpcQU
	h01Y=
X-Gm-Gg: AfdE7cnf4VGkhP+mw7G7+4Sf/JL2TYss5EepGLnqyupx8gnypFsIcjintlzKgM8iknF
	ala6ls0IOcZOmz/c3Fu1CvVH3zM1YUwW92b0uwKVzoYEKw4HD/0LbB7PdqXQ8ikJ4Hv/v9xd6f9
	wllSInK5aJUYojlAC63q8IyNKWMZCXDyyXjD/Wzi28GmyFOiJuIokXHt0b9eg4NLERjt4gyiTiu
	ycZBxYHQucINVb9av+rYGACT9NxSfQYpGh066SSeRLHLwESt4HpANgLkcW6NC2tXc0JG4y3EyxQ
	iaKMkoINfZahRHpjDgeWU1GYdLcKmIUgFAoOutQd3PuPbOrjvSpiLSFeMycaUISyJJVjL0xb8fe
	9/SWPTmjs0StgX2E0Hw8TDPOZFYCaDwhQnfFvbDq2ApAG3HWh9+WGglh1efSl/3ZJXvGro+80zL
	Xuabi+gMZ3jf+2ofHHvqvSbeVv1U3MZVQUwRYqt1xh5RiRM5pWVKMh+dv43DF5Nub3cw==
X-Received: by 2002:a05:6102:2b98:b0:634:420a:ab25 with SMTP id ada2fe7eead31-727b467766fmr2130937137.9.1781802033709;
        Thu, 18 Jun 2026 10:00:33 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7276c65e8e5sm2549949137.2.2026.06.18.10.00.31
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 10:00:31 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5bbe617d624so267605e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 10:00:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/CbI3W1vNnfDyG4Oqi+Q2VejcK2Puvy2kIhAapDAsrpMTs1xXsn360jKrD7j+0mee71tNXlyE0YC5iEV1QhorI4A==@vger.kernel.org
X-Received: by 2002:a05:6122:630c:10b0:5a2:497:328e with SMTP id
 71dfb90a1353d-5bbd2b3cf4bmr1469561e0c.6.1781802030784; Thu, 18 Jun 2026
 10:00:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-topic-sm8650-ayaneo-pocket-s2-r63419-v7-0-b84b6da84293@linaro.org>
 <20260605-topic-sm8650-ayaneo-pocket-s2-r63419-v7-2-b84b6da84293@linaro.org>
In-Reply-To: <20260605-topic-sm8650-ayaneo-pocket-s2-r63419-v7-2-b84b6da84293@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 18 Jun 2026 10:00:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W5FgXGznH1+SA74WOfAUXaAggaJi=ds8udqZ69K3i=Ow@mail.gmail.com>
X-Gm-Features: AVVi8Ce_ut-32lQvTeJIIrgccY3EJcV-YqwYkYCDQTO3z8hfvNAAO1n3hS3X_Xs
Message-ID: <CAD=FV=W5FgXGznH1+SA74WOfAUXaAggaJi=ds8udqZ69K3i=Ow@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] drm: panel: add support for the Renesas R63419
 based dual-DSI video mode Display Panels
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, KancyJoe <kancy2333@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34209-lists,linux-renesas-soc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:kancy2333@outlook.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dianders@chromium.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be,lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,outlook.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,outlook.com:email,vger.kernel.org:from_smtp,linaro.org:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 808666A1BA0

Hi,

On Fri, Jun 5, 2026 at 7:51=E2=80=AFAM Neil Armstrong <neil.armstrong@linar=
o.org> wrote:
>
> From: KancyJoe <kancy2333@outlook.com>
>
> Implement support for the Renesas 63419 based dual-DSI video mode
> Display Panels found in the Ayaneo gaming handled devices.
>
> Signed-off-by: KancyJoe <kancy2333@outlook.com>

I notice "Kancy Joe" has a space in the source files, but not in the
signoff. I guess Signed-off-by isn't necessarily required to be real
names these days, but still seems odd...


> +/*
> + * Helper to switch between DSI links, so we share a single dsi_ctx
> + * for both links, so in case of an error all writes & sleep for
> + * both links are ignored.
> + */
> +static inline void dsi_link_switch(struct renesas_r63419_panel *ctx,
> +                                  struct mipi_dsi_multi_context *dsi_ctx=
,
> +                                  unsigned int link)
> +{
> +       dsi_ctx->dsi =3D ctx->dsi[link];
> +}
> +
> +static int renesas_r63419_on(struct renesas_r63419_panel *ctx)
> +{
> +       struct mipi_dsi_multi_context dsi_ctx =3D { 0 };
> +
> +       /* Panel registers are loaded from DDIC Non Volatile Memory */
> +
> +       dsi_link_switch(ctx, &dsi_ctx, 0);
> +       mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +       dsi_link_switch(ctx, &dsi_ctx, 1);
> +       mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);

Instead of dsi_link_switch(), can't you use the mipi_dsi_dual()
function? I think it would be:

mipi_dsi_dual(mipi_dsi_dcs_exit_sleep_mode_multi, dsi_ctx,
ctx->dsi[0], ctx->dsi[1]);


> +static int renesas_r63419_disable(struct drm_panel *panel)
> +{
> +       struct renesas_r63419_panel *ctx =3D to_renesas_r63419_panel(pane=
l);
> +       struct mipi_dsi_multi_context dsi_ctx =3D { 0 };
> +
> +       dsi_link_switch(ctx, &dsi_ctx, 0);
> +       mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +       dsi_link_switch(ctx, &dsi_ctx, 1);
> +       mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +       mipi_dsi_msleep(&dsi_ctx, 50);
> +
> +       dsi_link_switch(ctx, &dsi_ctx, 0);
> +       mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +       dsi_link_switch(ctx, &dsi_ctx, 1);
> +       mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +       mipi_dsi_msleep(&dsi_ctx, 120);
> +
> +       return dsi_ctx.accum_err;

I'm not sure we've been terribly consistent, but should the above be
"return 0"? I'm not actually sure there's any benefit to a panel's
disable() function returning an error to begin with.
drm_panel_disable() doesn't return an error, so all this does is skip
setting "panel->enabled" to false and make it harder for the system to
recover.


> +static int renesas_r63419_prepare(struct drm_panel *panel)
> +{
> +       struct renesas_r63419_panel *ctx =3D to_renesas_r63419_panel(pane=
l);
> +       int ret;
> +
> +       ret =3D regulator_bulk_enable(ARRAY_SIZE(renesas_r63419_vdd_suppl=
ies),
> +                                   ctx->vdd_supplies);
> +       if (ret < 0)
> +               return ret;
> +
> +       usleep_range(1000, 2000);
> +
> +       ret =3D regulator_bulk_enable(ARRAY_SIZE(renesas_r63419_vcc_suppl=
ies),
> +                                   ctx->vcc_supplies);
> +       if (ret < 0) {
> +               regulator_bulk_disable(ARRAY_SIZE(renesas_r63419_vdd_supp=
lies),
> +                                      ctx->vdd_supplies);
> +               return ret;
> +       }
> +
> +       usleep_range(1000, 2000);
> +
> +       gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +
> +       usleep_range(3000, 4000);
> +
> +       ret =3D renesas_r63419_on(ctx);
> +       if (ret < 0) {
> +               dev_err(panel->dev, "Failed to initialize panel: %d\n", r=
et);
> +
> +               /* Power off sequence from the r63419 datasheet */
> +               regulator_bulk_disable(ARRAY_SIZE(renesas_r63419_vcc_supp=
lies),
> +                                      ctx->vcc_supplies);
> +               regulator_bulk_disable(ARRAY_SIZE(renesas_r63419_vdd_supp=
lies),
> +                                      ctx->vdd_supplies);
> +
> +               gpiod_set_value_cansleep(ctx->reset_gpio, 1);

To make de-init opposite to init, shouldn't the reset come before you
turn the regulators off? Depending on the design of the panel, I'd
imagine this could prevent back-powering some logic?

I'd also expect vdd supplies to be turned off first?


> +static int renesas_r63419_unprepare(struct drm_panel *panel)
> +{
> +       struct renesas_r63419_panel *ctx =3D to_renesas_r63419_panel(pane=
l);
> +
> +       /* Power off sequence from the r63419 datasheet */
> +       regulator_bulk_disable(ARRAY_SIZE(renesas_r63419_vcc_supplies), c=
tx->vcc_supplies);
> +       regulator_bulk_disable(ARRAY_SIZE(renesas_r63419_vdd_supplies), c=
tx->vdd_supplies);
> +
> +       gpiod_set_value_cansleep(ctx->reset_gpio, 1);

Similar: shouldn't the reset come before the regulators to make
power-off the opposite of init.


> +static int renesas_r63419_get_modes(struct drm_panel *panel,
> +                                   struct drm_connector *connector)
> +{
> +       struct renesas_r63419_panel *ctx =3D to_renesas_r63419_panel(pane=
l);
> +       const struct drm_display_mode *mode =3D ctx->desc->mode;
> +
> +       drm_connector_set_panel_orientation(connector, ctx->orientation);

IIRC, the above was a workaround that caused a warning splat. Is your
panel used on a system that actually needs it? Could your DRM driver
be fixed rather than persisting this hack? For context, see commit
47bef230225b ("drm/panel: panel-edp: Implement .get_orientation
callback")


> +static int renesas_r63419_probe(struct mipi_dsi_device *dsi)
> +{
> +       struct mipi_dsi_device_info info =3D { };
> +       struct device *dev =3D &dsi->dev;
> +       struct renesas_r63419_panel *ctx;
> +       struct device_node *dsi1_node;
> +       struct mipi_dsi_host *dsi1_host;
> +       int ret, i;
> +
> +       ctx =3D devm_drm_panel_alloc(dev, struct renesas_r63419_panel, pa=
nel,
> +                                  &renesas_r63419_panel_funcs, DRM_MODE_=
CONNECTOR_DSI);
> +       if (IS_ERR(ctx))
> +               return PTR_ERR(ctx);
> +
> +       ctx->desc =3D of_device_get_match_data(dev);
> +       if (!ctx->desc)
> +               return dev_err_probe(dev, -ENODEV,
> +                                    "Failed to get panel description\n")=
;
> +
> +       ret =3D devm_regulator_bulk_get_const(&dsi->dev,
> +                                           ARRAY_SIZE(renesas_r63419_vdd=
_supplies),
> +                                           renesas_r63419_vdd_supplies, =
&ctx->vdd_supplies);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret =3D devm_regulator_bulk_get_const(&dsi->dev,
> +                                           ARRAY_SIZE(renesas_r63419_vcc=
_supplies),
> +                                           renesas_r63419_vcc_supplies, =
&ctx->vcc_supplies);
> +       if (ret < 0)
> +               return ret;

It seems like both sets of supplies are always enabled / disabled
together with no delay between them. Do you truly need two lists, or
can this be combined to one list of regulators. That would simplify a
bunch of logic.


> +       ctx->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +       if (IS_ERR(ctx->reset_gpio))
> +               return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> +                                    "Failed to get reset gpio\n");
> +
> +       /* Get second DSI host */
> +       dsi1_node =3D of_graph_get_remote_node(dsi->dev.of_node, 1, -1);
> +       if (!dsi1_node)
> +               return dev_err_probe(dev, -ENODEV,
> +                                    "Failed to get remote node for secon=
d DSI\n");
> +
> +       dsi1_host =3D of_find_mipi_dsi_host_by_node(dsi1_node);
> +       of_node_put(dsi1_node);
> +       if (!dsi1_host)
> +               return dev_err_probe(dev, -EPROBE_DEFER,
> +                                    "Failed to find second DSI host\n");
> +
> +       /* Copy current DSI info, do not provide OF node since no driver =
needs to be attached */
> +       strscpy(info.type, dsi->name, sizeof(info.type));

Can't you use the two-argument form of strscpy()?

FWIW, I also notice that the Sashiko AI bot had some comments. Did you
already look all of those over and decide they don't need fixing? I
have a vague recollection that there's no need to worry about someone
calling disable() and then enable() without going through the
unprepare() / prepare(). If my memory is correct, I guess that would
be nice to document... I didn't analyze some of the other claims that
the AI bot had.


-Doug

