Return-Path: <linux-renesas-soc+bounces-31502-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCJPKWq56GkHPgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31502-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 14:04:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFC7445AD9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 14:04:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FDDB301496B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 12:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8146346E55;
	Wed, 22 Apr 2026 12:04:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7783A1E5724
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 12:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776859494; cv=none; b=DMfijNuzcxCfvCNIidhZqupv++bgI40CFUtgGijbwQfoiRefFKcljPo2mWEKS1mOK4EBSZNvVE9pF/lDd/Mip+utFHWcFWEjOkM96qzLeemHRMxVIZcuJyGtOGv7GQgC/ZCs7rY9G14TKs/3lv/KLcNbunbpaYcSzl0UBjt0sj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776859494; c=relaxed/simple;
	bh=heNJUHm5r9IeudYZX2feX2GOb6GdY81hvbpNQO/lRDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KsoQ2Bs6H7fRD+iRdJ0uzwcds1w9SIhaoho9WIR6jKrmCHpGMOoaufYw4a8CSZ6Es0bHXl1PBHodzI1jNbzf1C2YgEk5QM53H8cBgGhFYXURf/AJNnScMspJNWXOlUEarZoJbPRtx6wVhabJk3i1qXSemmEL60sPGOD7jc6UXBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-676e62faf2bso1588694a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 05:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776859492; x=1777464292;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSSaNDclY+hoXNdXjyqRLx9mMF7rFOkXAgklHu0Nry8=;
        b=P4uunsY6qtHOYNLIf9H338b/VSAtTOs2FN7ixNvwEBJwfrI1IqUn0NmyIpcSdx6Xci
         xhnBbaMXFxqQFA81QdxGBK3uoSHh+HYP7eRkbKty46UKUIhDBqwcauWPDSB2y6R/vFCD
         ca3HjpXg16D/peaFp5pEczB53eZZJlOLXYD011Av/9UvsFkwiT+np4rURCQ/+hyo8Oza
         3WP7BVBY9W8+m2Ezo8aDKFKvOh67wbQVHcmUarnks4Kn1RvwlbTGHGPz82syxqSa4LBA
         hLU3P2o8yZjg2SBF1uIXlfQdNxK8f4vneajCClxIGcRm3To7CDUwJDpsl+WdTA/VS7BY
         5K4A==
X-Forwarded-Encrypted: i=1; AFNElJ8ejbvzU1aokiCkopW8bSfV1ktxDwbg7trcHAgvBSzJpHj+5cJKlXhF4s5UrV3Gv2YrfUQjMLuxyaX+eAKg10pbnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjJiSuxqYD8KNQEdoVNFcs01w7Hwp7SyVLQ81Q8iOkFltvIYGU
	pUuB4c9Ee0JbcrA97KHy9K22GdyUf2eH3Sirs90F0i5yhLyZTSePXE5PABgIKASQGLY=
X-Gm-Gg: AeBDiesUmaTzp9OOMl/omMm572/wW5+UjnOKgOiJkJGy77vLnK4FWVgT/E+2fhySbQY
	a/r1JI5CULtMqMRD0INKZQBosW+1uIqbRm1u+sxMCChevZ6Ex885ArDKOTfu9tUdWtnTdf6AkRn
	b0e9cO8sB9b1XIqneK5VHGdg2wsj7bZJUBdyUnHaI7w3bQnVF5EG5TxAI5UQRNsyU/rSZvGPUbS
	gxY11G7j9Qyk8n6qbv4rwo4ZNFsO+VZUr+zPgqT3u6uiL6sNgEs2mCwccxhIOH4NAYbCNiZT+Xc
	amr7xdisWqvP4ZbGdAg14r+66CCFdhzZPRm0k+6yE8yYflRAEbAuJStAMqvU8Hg7QlVhNedGT1I
	y7xpI7TMd/ZGQp8gaQY5QoVaAmZGV9WzpW/GXP5fL70UuQOBci9+ESuZ1CYVPpkIrMv7vpxH19u
	vqhSKWLugXQRm1f+x6DYatwmqC4dVRQysusKNwSUqO5FgoBc1ik3cxyn6fXU77lomMe11Fsu0=
X-Received: by 2002:a17:907:7f91:b0:bab:8238:63ba with SMTP id a640c23a62f3a-bab82386452mr74786066b.0.1776859490586;
        Wed, 22 Apr 2026 05:04:50 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455046429sm537659966b.50.2026.04.22.05.04.49
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 05:04:49 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ba7a1cc0380so673656766b.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 05:04:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+GC7mBDgiZenGznDh92vlU9k4ZrMK6WncRTpjYC4u7418OPcAjYkB1/wNbR6aPMtZjuV+MFoRVwg/fbYks3vwXbw==@vger.kernel.org
X-Received: by 2002:a17:907:268b:b0:ba5:1970:2bb6 with SMTP id
 a640c23a62f3a-ba519702c56mr898304966b.34.1776859488923; Wed, 22 Apr 2026
 05:04:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413182456.811543-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260413182456.811543-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260413182456.811543-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Apr 2026 14:04:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJCyurtvXfUFw8NA7RONgtf9XqqWvrcg0iWjPBCutSEA@mail.gmail.com>
X-Gm-Features: AQROBzDuK88y7skSIsbJm8EH5n7PJ8NFVloT8VUmIGD2wAxUgH48C7LtE8lF00g
Message-ID: <CAMuHMdWJCyurtvXfUFw8NA7RONgtf9XqqWvrcg0iWjPBCutSEA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] pinctrl: renesas: rzg2l: Handle RZ/V2H(P) IOLH
 configuration in PM cache
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31502-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 4DFC7445AD9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Prabhakar,

On Mon, 13 Apr 2026 at 20:25, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Include PIN_CFG_IOLH_RZV2H in the IOLH capability checks when saving
> and restoring pin configuration registers.
>
> On RZ/V2H(P), the IOLH configuration is defined by the
> PIN_CFG_IOLH_RZV2H capability. The previous implementation did not
> account for this, causing the IOLH registers to be skipped during PM
> save/restore.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -3033,7 +3033,8 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
>                 }
>
>                 caps = FIELD_GET(PIN_CFG_MASK, cfg);
> -               has_iolh = !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH_B | PIN_CFG_IOLH_C));
> +               has_iolh = !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH_B |
> +                                     PIN_CFG_IOLH_C | PIN_CFG_IOLH_RZV2H));

Unless I am missing something, PIN_CFG_IOLH_RZV2H is only ever set for
dedicated pins on RZ/V2H and RZ/G3E, so this change does not have any
impact for now?

>                 has_ien = !!(caps & PIN_CFG_IEN);
>                 has_pupd = !!(caps & PIN_CFG_PUPD);
>                 has_smt = !!(caps & PIN_CFG_SMT);
> @@ -3131,7 +3132,8 @@ static void rzg2l_pinctrl_pm_setup_dedicated_regs(struct rzg2l_pinctrl *pctrl, b
>                 }
>
>                 /* And apply them in a single shot. */
> -               has_iolh = !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH_B | PIN_CFG_IOLH_C));
> +               has_iolh = !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH_B |
> +                                     PIN_CFG_IOLH_C | PIN_CFG_IOLH_RZV2H));
>                 has_ien = !!(caps & PIN_CFG_IEN);
>                 has_sr = !!(caps & PIN_CFG_SR);
>                 pincnt = hweight8(FIELD_GET(RZG2L_SINGLE_PIN_BITS_MASK, cfg));

This part LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

