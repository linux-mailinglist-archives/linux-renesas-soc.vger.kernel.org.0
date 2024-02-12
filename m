Return-Path: <linux-renesas-soc+bounces-2638-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE928519C5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Feb 2024 17:42:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BD8E286CAF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Feb 2024 16:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70AD23E468;
	Mon, 12 Feb 2024 16:38:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5923E464
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Feb 2024 16:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707755922; cv=none; b=tkB3k6GvIL3GMSHo9fTM7Irw7ODbeME76hQSWHiblStV8MmneeFluFAhkhAauTwEWpBNFnIUfHsgnmY7lSTcWpTUU/khoYUgQsW4B3jfvDzOe3u1eVhb6tDNAccfyStrPaz4SZjlzMpJmB3hdx20WhphJplXgcyqwjjj9rCLsqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707755922; c=relaxed/simple;
	bh=PG0JKO1onPtnU51/7GLeG/L650VNq8TFkxJssRTMAqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dRgWAU1KTyAtRcws94KWHnWJGVBqPEG1tJS3FIuhhCI0ul92dfVOt2pbqoQxt/FIHxoidlrO63YFLM4dcCtMi5oMpljUpb2brnhx68vXgQ0kCRCXQkS6k+/hFT7VGmMEn7AtwnR/qK79q9SGh3slnFD42ocV/DPVkNlwic8T04c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-604b94c0556so24727467b3.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Feb 2024 08:38:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707755918; x=1708360718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eohAPNISCcpwBNEU0CiXwCzqrVCQ/glAqmYpMft046E=;
        b=CzYaK/TEajDgtMqFhhTK7na66eLJQAMlndUXjyeTFk3eWlzFLyWVfC8NrkzjlwJmkD
         t9bt0bkNeJDbTz8U5OVMLnKOdLyBZ++83WhQAU7B9Ag7xgpfi2AzdxOWSFo5Ug3A1FYq
         b7t2aJLBUL64QeSbafLin0L9uauyG4prhtoYEGhJDAxCp0/yOL9F7iYU0szBCs8FmueH
         zRHHcqOQFPptbBtYSzqXcg0cheDGAsgjMSpioTiwM5RfToEqG8nuYb4Tw+8FSihEGL9E
         S0ogkWyXRERDgGBNo8d+FdXjntV4wYAc3nhjtzrH9K8NZWqibz3wDEEXvq2aqlUm0JCu
         tWXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpqsy4sidof4bkP2U0xToQ6oA1wSTJDYwkAwry1QhLpgpw5xIEPnXP67dVjxMnKnG6Xs0EFlwtX8R3fLdIgNQ6RlDrRS9Bol8tVwpIAWn423I=
X-Gm-Message-State: AOJu0YzIuZj17Ky1ZYUltSiHnvPclyU4Ed0sevqJSIFEoNVnX7fmp+1B
	jLEFUYdW2jcS02e+y+974OJ/VD+bOqhhcflYYpC3WWQf+GdSmElDbgR1iBBMH9k=
X-Google-Smtp-Source: AGHT+IE+yRAf1U4HDDyCMInjSFSDVRheJ+MnyJzTAC39YzXbmAtvrasCFxSD6wKQMn2dMfU1W1Duvg==
X-Received: by 2002:a81:91c9:0:b0:603:e000:1c03 with SMTP id i192-20020a8191c9000000b00603e0001c03mr3947232ywg.17.1707755918639;
        Mon, 12 Feb 2024 08:38:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXbkLrk0EuGX1VXoYqTX5uiN4JszdBgD2YDG6V3DTQLBQCKVrUmta86IzSbuUUj/L1P8tns6VBqqgKcoJ2uYfefJUB0ztdY3PzQ41AvEUu1UF8=
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id t125-20020a815f83000000b006042cdc8de6sm1227174ywb.101.2024.02.12.08.38.38
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 08:38:38 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso2874152276.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Feb 2024 08:38:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVbT9RpfaJWq31UI1R4UpFTpWBYx63h2nea3S760UHhm/PhnsRSEdv1bhXHN3G0quwvA/38a1dPQkEg+EeIB/gEtTib2BFkLISPjQ/1I158vN4=
X-Received: by 2002:a25:684b:0:b0:dc7:4363:452a with SMTP id
 d72-20020a25684b000000b00dc74363452amr4265093ybc.13.1707755918134; Mon, 12
 Feb 2024 08:38:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240212113712.71878-1-biju.das.jz@bp.renesas.com> <20240212113712.71878-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240212113712.71878-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Feb 2024 17:38:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXZ0_O8-bjB9NyOKc3JKHjcE_w3wrhgQN3Ur7A8DvovKA@mail.gmail.com>
Message-ID: <CAMuHMdXZ0_O8-bjB9NyOKc3JKHjcE_w3wrhgQN3Ur7A8DvovKA@mail.gmail.com>
Subject: Re: [PATCH 2/5] irqchip/renesas-rzg2l: Rename rzg2l_tint_eoi()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Marc Zyngier <maz@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Mon, Feb 12, 2024 at 12:37=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
> Rename rzg2l_tint_eoi->rzg2l_clear_tint_int and simplify the code by
> removing redundant priv and hw_irq local variables.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/irqchip/irq-renesas-rzg2l.c
> +++ b/drivers/irqchip/irq-renesas-rzg2l.c
> @@ -103,11 +103,10 @@ static void rzg2l_irq_eoi(struct irq_data *d)
>                 writel_relaxed(iscr & ~bit, priv->base + ISCR);
>  }
>
> -static void rzg2l_tint_eoi(struct irq_data *d)
> +static void rzg2l_clear_tint_int(struct rzg2l_irqc_priv *priv,
> +                                unsigned int hwirq)
>  {
> -       unsigned int hw_irq =3D irqd_to_hwirq(d) - IRQC_TINT_START;
> -       struct rzg2l_irqc_priv *priv =3D irq_data_to_priv(d);
> -       u32 bit =3D BIT(hw_irq);
> +       u32 bit =3D BIT(hwirq - IRQC_TINT_START);
>         u32 reg;
>
>         reg =3D readl_relaxed(priv->base + TSCR);
> @@ -127,7 +126,7 @@ static void rzg2l_irqc_eoi(struct irq_data *d)
>         if (hw_irq >=3D IRQC_IRQ_START && hw_irq <=3D IRQC_IRQ_COUNT)
>                 rzg2l_irq_eoi(d);
>         else if (hw_irq >=3D IRQC_TINT_START && hw_irq < IRQC_NUM_IRQ)
> -               rzg2l_tint_eoi(d);
> +               rzg2l_clear_tint_int(priv, hw_irq);

Perhaps pass the tint number (i.e. "hw_irq - IRQC_TINT_START") instead?

>         raw_spin_unlock(&priv->lock);
>         irq_chip_eoi_parent(d);

I think it makes sense to make a similar change to rzg2l_irq_eoi().

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

