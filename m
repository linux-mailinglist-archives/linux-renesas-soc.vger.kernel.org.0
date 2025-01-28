Return-Path: <linux-renesas-soc+bounces-12682-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC885A20E91
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 17:30:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 187AB1888CEF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 16:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C5241D5CEA;
	Tue, 28 Jan 2025 16:30:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826BB199E8D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 16:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738081845; cv=none; b=dYUyO/yu8reNlpVz5QYizwU8TP+HmQoZRzhscII9iOeWo5qVY2Q2Oc0ZQ970xpq3QqAix5BedQXfTBcp9kQ+PqZn2O+kNt+Jcw6w79R6fbTTG18VFh4lv+GKMhjNq9uX5fY3IkLWcqfytM43T/dlAE56n/CfZO0Xmrz60cLn5iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738081845; c=relaxed/simple;
	bh=o7W1ZoYgDBZ0l3p1ivvTryrrAX3unJKnv3k5joVx1yQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T1dwfYkq0FyTeuOD5VdIZpTojl/4TDuBbgyqEfJFrKfK+DboNRVA8vOYH/7o8/TLwh6w+jPNx603BD+HiEg6z5HRGaO43bM1rZWHAg5PW4G+ivwrHSL3UAPihSLbgsEprEkTmaQyzgE3y5cpk19p9qtcJ7itwJeRfDpPoKwXVhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-85baea70afeso1192172241.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 08:30:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738081842; x=1738686642;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aOsTjkhNq/R6ROAGzt2MDGu6fBsrFiRsAuem85DOuSc=;
        b=YYiCVKkXp5PxJVEh4RLymmuCwavt2gbordh1Ab24i2M5ued/FiAEBW/zQOSdSXPLGz
         4SGxSovyD6Yx8uj+WP5iW1iX4PdgNXhsZkRNazlONSr9PKH3OPPRJErhEsG4EJADECf7
         +Ik7i0cHHwMryTV9eL0Xs9F2erwBNMbN5jzyKNHfFi8keQkGOgUS8ATz82W8gTWw+9wS
         yYFY0uxi9ILLCJsVBPTjJpsDbO775Q7KjAQpy30lYmNGdHUIFz6/jhoj2FUzFPG5DEH1
         FPidaDW34w7DsolVePLyovAKyMO90EKl9PA2bSzmzPlipdl4bMhSsWUp7iluiXYYOK7Z
         XCSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUm5kHTGY4Q4JCCNaBw2fAz0xTN0rorz1Mrq9/3aaxfJNP36Gypb5ukP2TLM9Hm+qTYJ7z8jzy2lWhQ6ogyyy6dgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyO46jT3GFJVj88cjR/LaPcDTBtXiG0xYxfIiEo6HD6P4PsKhAZ
	3hbPxYYBoWJk2PGtQTFXovI4rjQdTqDfDU+QJCV0QbIijh5geYc2xdTvzswH
X-Gm-Gg: ASbGncubgOjSnQ2hCqaQ6NDoo+AbWKJiCRpPQU3rdgDR9dKKG1ltmMv4vLX4IQZq5cW
	+/jDX4kpaUti1YYV52w+mjwCNMweEHSvr7hzz/0CA0eJwxWyBogLMG0XEWkexAFYEsD7Q8Ysa6x
	PDdGl5+g3umzb928WZaDjrYNHjwVt7waJ88IIVjvQFHmH1Vvd3Bd7/FBfLitPw4cY/SYVVpC0+M
	cwpxBtDkra/N/0peEQt7uvtVCkTz6mAMnN129FgdIv7D7V4qO09mXKsDlMSOltrrtsgKOQ6My2l
	Y2Rr2PjNFQjPoKQCHIuWT2LieoSvwnclvQ7m1w8h1lDOIP3dsAB2jA==
X-Google-Smtp-Source: AGHT+IE8PV7Jv5bkOiv+KItdS5QVM3MzSNG8RuRofrqwgH6z7RhZhAKZSb5tSdlkSfXUm1xa2DPhig==
X-Received: by 2002:a05:6102:5106:b0:4b6:3700:d74a with SMTP id ada2fe7eead31-4b6909bd57fmr40278110137.0.1738081841287;
        Tue, 28 Jan 2025 08:30:41 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b7097869d5sm2227342137.1.2025.01.28.08.30.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 08:30:41 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4afdf096fc5so1408035137.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 08:30:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWkxKMVUGqozrZM8aJuVB93I4uLW3vCYSXZA28AbK7xS3j3hXpf1Nxj3ha0Mm3JbA0+GagrXfGBm83aw3T0UWIVPA==@vger.kernel.org
X-Received: by 2002:a05:6102:3584:b0:4af:f3bd:51cd with SMTP id
 ada2fe7eead31-4b690cdd7e9mr38327900137.16.1738081840834; Tue, 28 Jan 2025
 08:30:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128104714.80807-1-biju.das.jz@bp.renesas.com> <20250128104714.80807-13-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250128104714.80807-13-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Jan 2025 17:30:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXUvuned3tS+hxuUpSJTs_iadUjBNa99Nc=-2AgKrZpyQ@mail.gmail.com>
X-Gm-Features: AWEUYZl2SPGWTrI-X_kQwjOGpllZx2m3yexeAlbcx5sYdg-w6BOPFJLuyx3Tuf4
Message-ID: <CAMuHMdXUvuned3tS+hxuUpSJTs_iadUjBNa99Nc=-2AgKrZpyQ@mail.gmail.com>
Subject: Re: [PATCH v3 12/13] irqchip/renesas-rzv2h: Add RZ/G3E support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 28 Jan 2025 at 11:48, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The ICU block on the RZ/G3E SoC is almost identical to the one found on
> the RZ/V2H SoC, with the following differences:
>  - The TINT register offset starts at 0x830 instead of 0x30.

0x800

>  - The number of GPIO interrupts for TINT selection is 141 instead of 86.
>  - The pin index and TINT selection index are not in the 1:1 map
>  - The number of TSSR registers is 15 instead of 8

16

>  - Each TSSR register can program 2 TINTs instead of 4 TINTs
>
> Add support for the RZ/G3E driver by filling the rzv2h_hw_info table and
> adding LUT for mapping between pin index and TINT selection index.
>
> Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/irqchip/irq-renesas-rzv2h.c
> +++ b/drivers/irqchip/irq-renesas-rzv2h.c

> @@ -84,6 +87,7 @@
>   * @tssr_k:            TSSR index k
>   */
>  struct rzv2h_hw_info {
> +       const u8        *tssel_lut;
>         u16             t_offs;
>         u16             tien;
>         u16             tssel_mask;
> @@ -307,6 +311,9 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
>         if (tint > priv->info->max_tssel)
>                 return -EINVAL;
>
> +       if (priv->info->tssel_lut)
> +               tint = priv->info->tssel_lut[tint & 0xff];

No need to mask with 0xff, because of the check above.

> +
>         hwirq = irqd_to_hwirq(d);
>         tint_nr = hwirq - ICU_TINT_START;
>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

