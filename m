Return-Path: <linux-renesas-soc+bounces-25410-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 37938C94FD7
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Nov 2025 14:10:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B70E74E0539
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Nov 2025 13:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3827AD5A;
	Sun, 30 Nov 2025 13:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="d5eWb3Zm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A6E23A98E
	for <linux-renesas-soc@vger.kernel.org>; Sun, 30 Nov 2025 13:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764508199; cv=none; b=ip2CXuNGZgyfon1FfJ6qOtQKZ90HnqqAAB+ovVD1n3euGkMj0sP+vRuFGv2Ee5Kp7/KXiS8tmg2avd98LHXej2ji3s2zw/7ZrdQ2NAuuTD1C9bFumdMOyssqyunoUNkm4o2SGcRrhmHGo68+JWTTKGDqtxT3X6/xQkftMz/1nqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764508199; c=relaxed/simple;
	bh=GiWaax2Wc3zbu9RvrCaY6s8VLk1fuWJvLLtVwMu0eLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CfAGnmDalt7uiyNxIfcJarUGymSTLs6b+WaTvS9DdWOsAA3jqCgH/hW66r3wCLgKABWyuD/jPBsm7r35Aj/TjPR2NXSF4UgDfGwiFikUmQkg3pPoDIXLuQTkrCFhAZ46UlKcRDZYArgtuk8G32OfjIl7EqDH4o3Tr1KmG8c4txg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=d5eWb3Zm; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-295548467c7so38475395ad.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 30 Nov 2025 05:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1764508197; x=1765112997; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNmbbxbBaoTz8DomyGsXnxRB8wBP1F/AJR530QwYnIc=;
        b=d5eWb3ZmvHbeV7glCICJSUcP18r/RWTm0m4aan2HRRUE+TlfUx+RTEbwVKxUEiwUVY
         33g362VthRlxbunzjT9dCWwpHpaIPoaeLWYqIE4uMULKzwjZGJoiVpRV+GfCXnayTZU5
         WDxfJO+GzVC/JOBACXn0LDFL2l/Ed2hqI4fwEcLf8Lgf5hFyHQ4QhtQ59oB19VoWRoiu
         aAJ3GI0jNdrErahVM1u+jQEjIu8o4DcUMtPq7eaFctH0K9a4XIeoM5Zi3gVJKbIeoyiO
         Pem+BnUpSJiGaOmnrgjqrMvdKRsHdUTH2jiweVXUC1jkHBLClx+x+sP/lF3nfEpO9461
         0jLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764508197; x=1765112997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FNmbbxbBaoTz8DomyGsXnxRB8wBP1F/AJR530QwYnIc=;
        b=jWreNA+fQq9Uz+maybmGfRKJ6HRdWHdgOBcmReYuVTM54egjoya5SAZfcEMXVT8IhP
         IERoFeHJBpb9rr6HKAMeMfSmYOlPT5t8llEg+68HmCbGTR296n7jW4o3DQHph1Fn/OiS
         5KwYyMH4I/zjaVlmq0o5bmkfg6mtJAua21MNWbRpMb16dbjcGDpLfNvZvKykzmDxJC8Z
         wjX8h/ZP77Da3d3JgO0IvXYxYiZJPrZy4+kqaddNZq7NlKWskoVYvfeLF0gEyN0XHPfm
         97oXD6XXdKqsOE3UXkDb94FI3So2WyERl7KQhTkFRdJarZSh5VIvlHWuqgXR9HWaKymE
         0Pjw==
X-Forwarded-Encrypted: i=1; AJvYcCXESOcIZiSm8tYzWRxu5igw5zPE/a2MGKTOTv+IiXrTX3wFSHBIQARHiDkfd1Zo1+omKRvQrnaoiiJbAF40MxfK8g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yynlkmx2jrOA/1bKuBP3BtYOVh7LF9qnMCEQqZjvQXToKs8HI0Z
	CDHC7QbIXixp+xSpNbGhatef9EOEEcgADcAwJIpQZTTsm7ttP6xEE2Lxnj/Ue+sC/EwaxA6ZQFq
	mRixRqPdtlXFLxR+3RWiowEJ1xUT+swQ=
X-Gm-Gg: ASbGncsdfgZrD23MXcmUFDUYAKz4kV3ERyn2WKoNCW+5tQ5mCLSZ97y166pZxxGIoA/
	kYbn/tBZXgzki7r/oR7EHEu0p2aKZHgkixNfm+eIP8yHb+3sa3pzkG0/aZ386UabO3JNrhm5h8C
	+JT3aXF/j82+TRLQS8iGfXe9N6Y9LFKSz55iEAn3t8FTK1YQtZBOSMfBN70FQc98FFWhg6w1aMl
	90+13s986prLhTywXjZkJyphpIkj4n2Qj37+ILsDKJIn0kYW47eGQNAaoDdpfXqfFFjLiV1lFPf
	1p2ajOZXZYfOUylOptKekABbqL1W
X-Google-Smtp-Source: AGHT+IG53GhYkY/+dF5qGVT19Jadft1SJnnMvw5Wcu0qyYtU4QLG8FtzqF0lB0krYhtMk3QufvRzdFqig5aHMJFxvm0=
X-Received: by 2002:a17:903:903:b0:295:a1a5:bae9 with SMTP id
 d9443c01a7336-29b6be86b48mr332545755ad.8.1764508197220; Sun, 30 Nov 2025
 05:09:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-0-88f8a107eca2@bootlin.com>
 <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-17-88f8a107eca2@bootlin.com>
In-Reply-To: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-17-88f8a107eca2@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 30 Nov 2025 14:09:46 +0100
X-Gm-Features: AWmQ_bkqQ0yeDiiVRXlgzLTrdqIA678_lHRrauQKV29M6KsFuJAoinD-iLMIAaM
Message-ID: <CAFBinCCQjeUu7pgfwViH6b0-M6S_sKgfvz9VAP1hpqLRj=bL_g@mail.gmail.com>
Subject: Re: [PATCH v2 17/26] drm/meson: encoder_*: use devm_of_drm_get_bridge()
 to put the next bridge
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, Phong LE <ple@baylibre.com>, 
	Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Adrien Grassein <adrien.grassein@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Louis Chauvet <louis.chauvet@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luca,

On Fri, Nov 28, 2025 at 5:54=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> This driver obtains a bridge pointer from of_drm_find_bridge() in the pro=
be
> function and stores it until driver removal. of_drm_find_bridge() is
> deprecated. Move to devm_of_drm_get_bridge() which puts the bridge
> reference on remove or on probe failure.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/meson/meson_encoder_cvbs.c | 2 +-
>  drivers/gpu/drm/meson/meson_encoder_dsi.c  | 2 +-
>  drivers/gpu/drm/meson/meson_encoder_hdmi.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm=
/meson/meson_encoder_cvbs.c
> index dc374bfc5951..bf8588a5f6dd 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> @@ -241,7 +241,7 @@ int meson_encoder_cvbs_probe(struct meson_drm *priv)
>                 return 0;
>         }
>
> -       meson_encoder_cvbs->next_bridge =3D of_drm_find_bridge(remote);
> +       meson_encoder_cvbs->next_bridge =3D devm_of_drm_get_bridge(priv->=
dev, remote);
>         of_node_put(remote);
>         if (!meson_encoder_cvbs->next_bridge)
>                 return dev_err_probe(priv->dev, -EPROBE_DEFER,
Would you be happy with me sending a patch that replaces the whole
logic in two meson_encoder_{cvbs,dsi,hdmi}.c with
devm_drm_of_get_bridge()?
I see two benefits:
- simpler code
- a patch less in your series (less maintenance burden for you)

What I'm not sure about is how this series interacts with
devm_drm_of_get_bridge() which is why I'm asking before cooking a
patch.


Best regards,
Martin

