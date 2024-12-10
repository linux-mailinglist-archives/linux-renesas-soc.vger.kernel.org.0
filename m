Return-Path: <linux-renesas-soc+bounces-11146-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA169EAED1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 11:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1282728D6C4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 10:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87C312080C5;
	Tue, 10 Dec 2024 10:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ah9vAWT6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7F978F57
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 10:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733828191; cv=none; b=OuvOzLdJjVjJEnSPj7Z/xjEbTaneCI1kJkpMepmiv+kTgvKLrPOGKGENhp0kLP5mlZtrvbI5WIzIYzSr8YHr7dMR/yvTk24tQlxf447YmJVg4eBo2SQBsf4r5Wgw/W8X33v1FfRdsnlpbmGMLB7aoSibs6cGcSH3pWjtWrwLqSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733828191; c=relaxed/simple;
	bh=wRkwrOXz+PsutoZZU8yxQ8mnHe2ZfPFHQVKHke+ADMM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NtzuYJWKQb/CRlgQygu5gdfKM37YzOhSUuvPEP8IQ24DDEc8cGcA70ADlAI8f8IIPo/IXiOGCSNqwVL+Ec5ujz0AbI6pj8jaULE8u21trkts+gZyPHbm1qF0Ma8pOOxCjmmVlF2geQDXUBrm64QRTmZFDb4Jo7Z6HMzThu3u72Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ah9vAWT6; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5174db4e34eso1076225e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 02:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733828189; x=1734432989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYe/At4lPYeuyDFrQYZpuq1KtNNfE7scNoZNwO4fVaw=;
        b=Ah9vAWT6QOcaF9LXby/HvNRvyQVkVio9mqg5EHpDbq2x8ldX/vM1WZr6OXNgqa35sN
         3xo7CJoB9/S4vZv4fVnL5aDrifjADg7MpnhxXF5KZqNKG6bzYzrcrMFN28FEQ5n7jfJk
         Vvj+YsnE380jdO+5exW+cpdondvwrsVbXAP6s/Rg40SsHdmHX/1Eizqx+FH/HSJOJhr7
         BJ96bKTdEZv2a2Ux7Nfe6is5AqxkoANQmsaihc0dY09mNBPKReherlqTbrZ+dtKqaUmK
         JwKfSPtPRjWnHcWq1qQUJGzi/o9/Et+t4NNka7zi5PtAOv0Pfpj9BnpzHZNrf7Xmxexw
         h9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733828189; x=1734432989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vYe/At4lPYeuyDFrQYZpuq1KtNNfE7scNoZNwO4fVaw=;
        b=EuImTEkwD95KrIF3lvkdB4thDbftWyINvtLxtqQE8awqb3EyTPOcG4FbjAzsqrb6eR
         9G3AV9sI2LihJUqFgppaaxIQsMqzXY1cR8hXc/MtSBYbtNLoP7ldHPyVWLAN6LTcsURx
         tPLiUKBgML1M0D3620zof+z314Q5AjQyInZuDWwnXbQFNqoGtx58bLj5RMDzX8lWjt3O
         t9BZoxmB0KIQg8DcyxSqKmpI1QEVSm1GGDZRDPu2VGCLryVkm/kXxyDj3dHP3NxbdGoS
         bXhsVkomKFW8rAUgA4ygfuV3Mw17q5KuoC/5KngCepFadurS53vPNY9TsILXOcbCUpJr
         9o7A==
X-Forwarded-Encrypted: i=1; AJvYcCXQVU2cG0YQu0E7fuKIBYgUMR6jenYEAnjagbvF8zYlxcIfNV4picklpj5GEC8gjMKoh9utXa3akN0K3/8/lzIMaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ3ra8nHRNApLxxEn4AbW2bZbvtMkcbYps0qH370Zn1wrh+ePe
	82BPScWxrxHKBfXKTtBRhoVYa5BsuNAWfIKAGJiO0Q/7tLmslzSQM6mQvFM+CbHeXUPmH5Zhcyi
	SjU10APgV9u9SsWuQhnP/JCn9Wlc=
X-Gm-Gg: ASbGncsx+ohbEyFLHcCx/85Ed2awj0jPdZ4JO8wK6itvQ2mctt8Qccj4iDNBWWSeENR
	kQgKt/NgOkpOMze9O7ygUTKmewRewZbDCzagr
X-Google-Smtp-Source: AGHT+IGiJDNXoV/0rwjvQMeyeCzdp8y/LA74Y1M5kCII9S3NOt45kKfM1TxXZv795oa6nzVJjfd9aZb2nzok8MCE4ps=
X-Received: by 2002:a05:6122:3295:b0:516:1e32:f8c7 with SMTP id
 71dfb90a1353d-5188c974cd5mr2594774e0c.0.1733828188798; Tue, 10 Dec 2024
 02:56:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022082433.32513-1-biju.das.jz@bp.renesas.com> <20241022082433.32513-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241022082433.32513-3-biju.das.jz@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 10 Dec 2024 10:56:03 +0000
Message-ID: <CA+V-a8sfth484aB2FO7-2fzGmE-1V2-m=zUzp=riUj6yiaeaaw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm: renesas: rz-du: rzg2l_du_encoder: Fix max dot
 clock for DPI
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 9:32=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> As per the RZ/G2UL hardware manual Table 33.4 Clock List, the maximum
> dot clock for the DPI interface is 83.5 MHz. Add mode_valid callback
> to reject modes greater than 83.5 MHz.
>
> Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com=
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Changes in v2:
>  * Moved .mode_valid from crtc to encoder as the new state is not
>    available in crtc and instead, we could check renc->output for
>    .mode_valid() function of drm_encoder.
>  * Dropped rzg2l_du_crtc_atomic_check().
> ---
>  .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c   | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c b/drivers/g=
pu/drm/renesas/rz-du/rzg2l_du_encoder.c
> index 339cbaaea0b5..564ab4cb3d37 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> @@ -10,6 +10,7 @@
>  #include <linux/export.h>
>  #include <linux/of.h>
>
> +#include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_bridge_connector.h>
>  #include <drm/drm_panel.h>
> @@ -24,6 +25,22 @@
>  static const struct drm_encoder_funcs rzg2l_du_encoder_funcs =3D {
>  };
>
> +static enum drm_mode_status
> +rzg2l_du_encoder_mode_valid(struct drm_encoder *encoder,
> +                           const struct drm_display_mode *mode)
> +{
> +       struct rzg2l_du_encoder *renc =3D to_rzg2l_encoder(encoder);
> +
> +       if (renc->output =3D=3D RZG2L_DU_OUTPUT_DPAD0 && mode->clock > 83=
500)
> +               return MODE_CLOCK_HIGH;
> +
> +       return MODE_OK;
> +}
> +
> +static const struct drm_encoder_helper_funcs rzg2l_du_encoder_helper_fun=
cs =3D {
> +       .mode_valid =3D rzg2l_du_encoder_mode_valid,
> +};
> +
>  int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu,
>                           enum rzg2l_du_output output,
>                           struct device_node *enc_node)
> @@ -48,6 +65,7 @@ int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu=
,
>                 return PTR_ERR(renc);
>
>         renc->output =3D output;
> +       drm_encoder_helper_add(&renc->base, &rzg2l_du_encoder_helper_func=
s);
>
>         /* Attach the bridge to the encoder. */
>         ret =3D drm_bridge_attach(&renc->base, bridge, NULL,
> --
> 2.43.0
>
>

