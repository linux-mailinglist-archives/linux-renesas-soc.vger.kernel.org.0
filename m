Return-Path: <linux-renesas-soc+bounces-26628-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F209AD158E1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 23:22:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0C6B3028594
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 22:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F4B2857EE;
	Mon, 12 Jan 2026 22:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="F0MEmqUH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD22F284883
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jan 2026 22:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768256530; cv=none; b=B3S4qqWT9AUxG41hDVacg+4yrrjJp2DvRGIgAhIk4v/8xw9PVwO9VcJz6AtQNHX76xbqkCYBwRt9EWC4zA3861wfvt0OQud+NzrLLIWcQXG1rap/jZQXxixjTJ7n3twv5sAzF2yvzz/i+/NrhCq+/l7tdernnDI3DW2BYt4WhTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768256530; c=relaxed/simple;
	bh=PpVle6805UxjTJzUzVBlFwx6MAaoWGvgWT0ChdYxX5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=khSTHT+H8m2wdZAcXLq9vFzdlU+rQett34Y+njlihr8kfMGvaFOQ5lU0OuuXVbDEMrmFzhxuqbdTVFwLH8laG9pUmFI0m9vGvVifgHx6bDbUikN+WjBAcU5MYnCZYSERKz7806zD4fl0zuI3lVdDKbSb1xP9be9k84cPliqnNTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=F0MEmqUH; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a0bae9aca3so44193745ad.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jan 2026 14:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1768256528; x=1768861328; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4w19gL9Si5xuUOM+xx0Gkc/M1vHSFtlbSnI9ldzTAww=;
        b=F0MEmqUHc3EZA8tY2aVOLln/LK9m8xtaNwR5J7Se+7So/dXVydjQeTYG5kP6EygojM
         c844usz2fPEFMbjsk+UXVX53cEChUCMylUE2gMhkPsuvw7jVl9h8yHvQPhM+7Y8e8APE
         31A8vtwSOAR64KMZVccBf8BDKYEG1Pyy9gi44RF5lum0WaDS2v7DuPliUBURaICx13Ai
         HAfOV3QuIsVGbyH0LNUc4dTSkAvfp76fBQyPe5waN88Ci5Foixiartzdsw4dLND2+emf
         2A0LkK6bdo99ATxmNJ6D4SiXnXyJsw3Nv/WWAoHMzbyIl++EBvS4SM8bdpt0jWcmzyDq
         eNjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768256528; x=1768861328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4w19gL9Si5xuUOM+xx0Gkc/M1vHSFtlbSnI9ldzTAww=;
        b=GNRAF2RBJ4WyAQrSzBz3Ch3klEiEwSlS2MDHJ26AKIE9pGmFAPFasoTzztUsF2KlcA
         Qc9l/RuGX1bzeTqF4XAfdY8Zwlw1yYLL49h1MA743Ky6sI35tFmW6BSuzqryzwrrN+lS
         ePA4rF1EQHzlTWurvD2k0Xfxfe0BrC851Q/uUKSK/TzS2pcUWshsOl4WckJXIYm8oiRG
         hQJm8h98MPm1lb+sB9iHVvCaZVY+PLmFzJb/ZbCDQMADQ4rpDoGu3J0dAoL56k2rWTG7
         CApm7VvcxbWeltpR8V1rj99fwCLstu7cFlDuiiCR3GXYMZpvxSSsO22CeDqg4/N32+TA
         yfAQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5BmjPmx4cfPlyvqTLU6Mal95s9O4kekadFAX9FsH470CFTHNsg64YyMKxnD5GzyRw57jLnm2gshl3bf0IL/2L4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9+HhRIeQzO0sAEuO8oph+mlWT3065f0VsYfFyC/6SOLxExnSk
	lfX+CsxICI2YpT9hdmtLt0IeSZrvdlg2ejfLCezJip07iqdGfhKVSXI4i3+vvmt6o/b8rDuLL8y
	zyUwHpKdfMk0Rat/Oj7oYESWEg1OQIUg=
X-Gm-Gg: AY/fxX7O67fXBY8TelIjjp9VVJcQRZdFI7H6TGOfAuWmzm/hKk/KDefPC50kaYe6fHR
	71MapUGsMbJs5YvzhRzvJ+7FOgwmyCkTbrjiDVdA+yZS4BiBI9trGR6VBLY4rJfpIbb/1mdOXUp
	BFezjkWRyx/ApOTNwAbos4mp8yHLCLe60E7QM3U+OKLvG4iQKyyRjromSlsm/UMWYp489CmTQZw
	L1JRo5QSWa1tVmA2RKU2ANWAPJs3W2fGcJZTJa9fF3HmsZ3PIMFTQIsR9SM9a0yrSuveFpNTMRi
	V7YZcZIsiUrYprIxQ6pHPtRiMmJ2
X-Google-Smtp-Source: AGHT+IF7+Y5y+W1I/oKu3PaWNvUb9K8PSy+WoJh05TRnlBlC82+qzM+GksYGzWHyPWmgmkdzBXyTwo91e0gYk9qAGBM=
X-Received: by 2002:a17:903:40ca:b0:295:592e:7633 with SMTP id
 d9443c01a7336-2a3ee4c0fb5mr187274885ad.29.1768256527834; Mon, 12 Jan 2026
 14:22:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-0-8d7a3dbacdf4@bootlin.com>
 <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-2-8d7a3dbacdf4@bootlin.com>
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-2-8d7a3dbacdf4@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 12 Jan 2026 23:21:56 +0100
X-Gm-Features: AZwV_Qj9tssGMaPejz2Zl0XwPzPqVqwiSQM5-St_AAUm7gwon2Sgi9P4XfkbVUU
Message-ID: <CAFBinCBWUXNwEDCJNEmdCtOcGO9eVFfZFC9p9fpdRTesZ7xBSQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] drm/meson/dw-hdmi: convert to of_drm_find_and_get_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luca,

On Fri, Jan 9, 2026 at 11:03=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done.
>
> dw_hdmi->bridge is used only in dw_hdmi_top_thread_irq(), so in order to
> avoid potential use-after-free ensure the irq is freed before putting the
> dw_hdmi->bridge reference.
>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
> @@ -789,8 +789,12 @@ static void meson_dw_hdmi_unbind(struct device *dev,=
 struct device *master,
>                                    void *data)
>  {
>         struct meson_dw_hdmi *meson_dw_hdmi =3D dev_get_drvdata(dev);
> +       struct platform_device *pdev =3D to_platform_device(dev);
> +       int irq =3D platform_get_irq(pdev, 0);
>
> +       devm_free_irq(dev, irq, meson_dw_hdmi);
I have one question (so I can understand things better):
is there a particular reason why you went with free'ing the IRQ
instead of "just" masking it (so the hardware won't fire anymore of
those IRQs)?


Best regards,
Martin

