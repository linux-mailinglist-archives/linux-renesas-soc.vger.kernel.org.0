Return-Path: <linux-renesas-soc+bounces-24907-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A13C78002
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 09:52:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id C73872CB9E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 08:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E11081A238C;
	Fri, 21 Nov 2025 08:52:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C75432FA1B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 08:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763715139; cv=none; b=hLTRrCcspDjxnZViBIQaylUc7hnp7Lo2wizDBYY8TqW65Td4DDq64uQ3JIy/+OVIp5eWAZNsHGTbYZnFwf2QlnUMXo5tIT7HGnh0TC1fITm0V4T0/47hzGRSDws2ho/WvgnGn+oWf62Rdmi3du9L4RG6WO/9wWhRu/6pSqqp56I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763715139; c=relaxed/simple;
	bh=N0EsBkaqL+1RNuChPI4ERSMoZ6LaitffubS469IoYwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WgAV/BjfMbcEQ/stb9/MBVBYUBBguVNeR1Kjsb1zegatAmM46Trya+5zzwodT1zpPHPiVIFO4Zf6bBCDuZ2Xps49LOgcL/WpWNcX3gsrNUEYQuEE7h4vcVNGBm2rJ6l5iMbYIGCAsG3cg8IZbsJIgXMtTx3ebChnnW/J1eFMq0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5dfcfbcbcc0so626339137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 00:52:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763715136; x=1764319936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mp0o/G3k7sqJGdB9kYi02mlmv5ZUKk0I8NDYfP2bT4w=;
        b=meiqGKzpvr1bB+SAt2a2bTivqZePYxsIf9roNjDgmux6S3NCFu4d/8XZbOTw+r3T+1
         fUgy1P+2MDS/0y+7zbgmWnFD6tC6xPZmsLeIrSMwSGgkELzlvmVJCU1Dnw5RzXZhK24Z
         PAZZMk0zPzcdpTekIY56NN9kRWBozGAJ/s0gq2nKF70ecdWtaKi029/oWffuQzFIwUae
         9hmILo8gWveD9AQMhsKtWB8Htw/u2XDpLcGf1w/NqRAZn2eRzkxCcnmORq9JJCbFdrHB
         f/cSErl/T+4qrESTnoREJ+ANK92KJ71bMUBM7gNFAQXJr8Dwx6PgL5RZzVkCf8sW0YFO
         CTPA==
X-Forwarded-Encrypted: i=1; AJvYcCVZwSyv5MlQXZ9jGn47+t7S6Elj/UVDF1S84aSvv18srdj1l27tQSQrH7tNx1k0A9W2u1/3WTQ7wvhbMsKNeFyM7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+1ZmEtVvyTn42zDqVI45ia0WmN6nTYlgbkotWrdJRtTRhodPf
	ktw5DXICPxUyBZKSIwoIJucdBjzynGijL67/gsrDChM0lBT4tsTbojmSkalqED7l
X-Gm-Gg: ASbGncsDw0hWEeDhHGoTR1CKvvZpvIQ0lJ2KtatML5e9VJ7viKYMCXhzlDp/uXUkVFu
	iKVZIiUpf09EwAfVGFV2BeytVefOe+Qm7ps9nC5R0x6RGRJptimmhG43a/LCewyGNvjJXNneN0g
	bxxJzNWNx7MF+Td20IwT7XRoieqs36kt3TaCJThP3m16iCFG/RxXRU+CFSIqebZb9NY2OZJHD5y
	dIcDb+B7reXGNMBEP+swb3UY7IN+FfPe5TfGTL8tAOpzLPtDV7XlrxHLV8vCg3J/CfSvtRYIX7x
	DOkP5yvobOavgGe7WVvZd9UQjuXN9ahzcgSaHNPn2Rr3XP+HJ86jaqN/v233FUA6UTXDetsrwjz
	9pCOg6DFlim0xN/VRP45Ou2gO336VrC4jxiZuQtW4zX4ayk6uHxKc98zY9WkF84Fe4R/D5pyUFO
	y5bTLbbbGukEdPhX2a5+rZAsnxMK6xdJ4srKSV0xOfm5txbSFw
X-Google-Smtp-Source: AGHT+IFgfFFzJmKc+o9vgPQxJK7S6XBc5nV7mo5rKevZUQFHkytoi6JWhRFNtdP+IIYGUwg3aEEx8g==
X-Received: by 2002:a05:6102:91b:b0:5db:c9cd:673f with SMTP id ada2fe7eead31-5e1de2fdbdamr297806137.26.1763715136254;
        Fri, 21 Nov 2025 00:52:16 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e1bda01436sm1914809137.7.2025.11.21.00.52.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 00:52:15 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5dbe6be1ac5so691409137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 00:52:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUOBoKz90ldYHibjl2XYo9YbQkRPPSTX1Mav0j7BH/KRjTFFmcN2AkOHBsh/iqdU1C4UnhqMUd2EqKQEFq8doZQ1Q==@vger.kernel.org
X-Received: by 2002:a05:6102:54ac:b0:5d7:de24:5b3e with SMTP id
 ada2fe7eead31-5e1de0bc143mr295832137.6.1763715134655; Fri, 21 Nov 2025
 00:52:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120-mcde-drm-regression-thirdfix-v3-0-24b1e9886bbf@linaro.org>
 <20251120-mcde-drm-regression-thirdfix-v3-3-24b1e9886bbf@linaro.org>
In-Reply-To: <20251120-mcde-drm-regression-thirdfix-v3-3-24b1e9886bbf@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Nov 2025 09:52:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW5SuSChcSz_DvHTBC=CQbaVaHZqRUM=DcD5mz0axrzyA@mail.gmail.com>
X-Gm-Features: AWmQ_bmAM3OoqlGn0ls34RpdzCzLcnLx3CYUx3Z4rxiZsMoWrh7MVo_S5_sFk44
Message-ID: <CAMuHMdW5SuSChcSz_DvHTBC=CQbaVaHZqRUM=DcD5mz0axrzyA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] RFT: drm/rcar-du: Modify custom commit tail
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Thu, 20 Nov 2025 at 23:56, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
> commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
> "drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
> caused regressions in all bridges that e.g. send DSI commands in
> their .prepare() and .unprepare() callbacks when used with R-Car DU.
>
> This is needed on R-Car DU, where the CRTC provides clock to LVDS
> and DSI, and has to be started before a bridge may call .prepare,
> which may trigger e.g. a DSI transfer.
>
> This specifically fixes the case where ILI9881C is connected to R-Car
> DU DSI. The ILI9881C panel driver does DSI command transfer in its
> struct drm_panel_funcs .prepare function, which is currently called
> before R-Car DU rcar_du_crtc_atomic_enable() rcar_mipi_dsi_pclk_enable()
> and the DSI command transfer times out.
>
> Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable=
 and post-disable")
> Link: https://lore.kernel.org/all/20251107230517.471894-1-marek.vasut%2Br=
enesas%40mailbox.org/
> Co-developed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for your patch!

> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> @@ -540,11 +540,30 @@ static void rcar_du_atomic_commit_tail(struct drm_a=
tomic_state *old_state)
>                         rcdu->dpad1_source =3D rcrtc->index;
>         }
>
> -       /* Apply the atomic update. */
> -       drm_atomic_helper_commit_modeset_disables(dev, old_state);
> +       /*
> +        * Apply the atomic update.
> +        *
> +        * We need special ordering to make sure the CRTC disabled last
> +        * and enabled first. We do this with modified versions of the
> +        * common modeset_disables/enables functions.
> +        */
> +
> +       /* Variant of drm_atomic_helper_commit_modeset_disables() */
> +       drm_encoder_bridge_disable(dev, state);

drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c:555:41: error: =E2=80=98state=
=E2=80=99
undeclared (first use in this function); did you mean =E2=80=98statx=E2=80=
=99?

old_state (everywhere)?

After making that change, it still works on Koelsch (R-Car M2-W),
which was not affected by the breakage.

> +       drm_encoder_bridge_post_disable(dev, state);
> +       drm_crtc_disable(dev, state);
> +       drm_atomic_helper_update_legacy_modeset_state(dev, state);
> +       drm_atomic_helper_calc_timestamping_constants(state);
> +       drm_crtc_set_mode(dev, state);
> +
>         drm_atomic_helper_commit_planes(dev, old_state,
>                                         DRM_PLANE_COMMIT_ACTIVE_ONLY);
> -       drm_atomic_helper_commit_modeset_enables(dev, old_state);
> +
> +       /* Variant of drm_atomic_helper_commit_modeset_enables() */
> +       drm_crtc_enable(dev, state);
> +       drm_encoder_bridge_pre_enable(dev, state);
> +       drm_encoder_bridge_enable(dev, state);
> +       drm_atomic_helper_commit_writebacks(dev, state);
>
>         drm_atomic_helper_commit_hw_done(old_state);
>         drm_atomic_helper_wait_for_flip_done(dev, old_state);
>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

