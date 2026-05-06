Return-Path: <linux-renesas-soc+bounces-32145-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILi8ONVj+2nkagMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32145-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 17:52:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D93B14DDA6E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 17:52:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8F1113091D4E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 15:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FF3048AE23;
	Wed,  6 May 2026 15:39:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84623ED136
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 May 2026 15:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778081980; cv=none; b=jCdwWeoT8hSCvPLOD5j748ix6WZ4d9qgmt0SscVlwOs2C2gfSlKu+FROMiwwpDDUf5VcxTJp1yKKwOY+YOyIOlZb+Wbiw0J78veEhbdG4ZMsdRuZWE8jq79N9E+2ZBywoGsifwnq7RSK90uo3AEBQZgNujrPb5yRpFVexoWphqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778081980; c=relaxed/simple;
	bh=b1Zj/yubQP5OfGxkmSWulM2UnchKdTF2OR2GBJBJdSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IMKu4uXFNB1YLiUHpzf3Ygux8ksouiiXzFN3GCNhECralaEooqTMsAV50yIt5Ju/tZWy5Uv8W3f8GEdloorYLspTfnJ4CX2l5vz0X/ZfZIhvlEl9Po03FGsqtbedjlHnarJlK+DPuOO/smZQjtuva67ynkyS3IbZkFsCumcpWzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-62dff2771abso1496897137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 08:39:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778081975; x=1778686775;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXYTW+fjcIqcCo2bBFDn3rYsoWd1fm91n2FElFkHP/k=;
        b=W9r2wJtfBDiLSfyUEz+9TJbYwdWeEQn+yzec75bZlQD02fwAhw/c/Dj60tqAEzRuuR
         FYtTJ3MQmXOFoCITqXRXbBTpwOyA/20VN28AEoOI6FEx1FZCe+3WjjetBdb+FSMkq6qG
         Z2lyGQuXGF54CDklL4BxdZxniaB0CRgejnHMkYk3WvsWo8JNIp/uWlENqVJyQojacGU9
         3TV4K7havlDjC+iyiSE97zJO1RRyqbGuZRxwZ9pZNNPr3ynM4BNq9u+fZwqQYgZ6i5wg
         tCZNP91GanYVFkPF0pLh0g2gx/bOCmoXxg95il3HeiRm6R6J5RV6Kup2Gss/9pYMokKM
         8Pzw==
X-Forwarded-Encrypted: i=1; AFNElJ9epQWCAw+P8t7q4Sf2WmqAArcmUd+7kXej4tJULyH71/ZcPSSYO0BEbGySRvyBuqySaYvYQ/5HqkEDcUtaKTBtBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6YB4lAMr+1bqGw2zrdmxtXX2NUhdM3R2sdiiPHWoqfFYQjDlc
	vI19M6xsu8JieDdtT+5QapkAY2HrWivOf3LR8gU7wIK7kMhzEjWnxjuP6fD1HFURat4=
X-Gm-Gg: AeBDietEsEfZUan/8LkAiEOrhXqRNpaeOb4AT0U5kzkYAJ0MARcU8vC+R/JJov0ew3j
	SCZVRrPyJ9+DIlwHEuZ2Ilr8l3BBqnQ1KiObz7l4cdxD8Ca+UQ7peyf9hRMe7Bf+JBKP8kwtupd
	lLvecTU1Px2o7Mt8uoR3h1HXthYedY0XGVfBbycMRlpIZscnlEwDnNtCWDs9jTlos9JlkxQZ4cS
	EUmFwdY7YdvnF+8TDSq9NziyogCwUQ2KZx8lEieWa/bx1k3nPfnyHa2k7p/L53DEk3quecDkGof
	5jM9fCaDCRa/3DsvCFSz25m1T+fjwlGVzZD6Fl4/Y3sFzkfnvtFSMnwDs/nd0wBZkhpE/64dnsn
	IKhvZVYwS7ZAR25xm0gfDnpAMJIJx9I0RtpsEw3SNJWCTOwd773t8hrsL4k7+uUk2xdFBX9gkbO
	m/EgI2HziSl5expajWhUZ+zwRPuaPeGQxsh+tCnsTMedOhqN1U8jpiDY6oOyzpFrO7Z4fGxM8=
X-Received: by 2002:a05:6102:5813:b0:62f:4387:fcc3 with SMTP id ada2fe7eead31-630f8edacfamr1846507137.12.1778081975068;
        Wed, 06 May 2026 08:39:35 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ce0af5801sm9123479241.10.2026.05.06.08.39.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:39:34 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-94dd01deb53so1819896241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 08:39:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9XRYYgfVuVRGKGXRNIvTkmkREj62VVBEx+FLIhxmZakQ2WfCUM0+V6YXFR2Y8SBFzVC9gUIqpokYtA96dIgQ1Dqw==@vger.kernel.org
X-Received: by 2002:a05:6102:419e:b0:605:3556:6619 with SMTP id
 ada2fe7eead31-630f907d492mr1975422137.31.1778081974628; Wed, 06 May 2026
 08:39:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430093422.74812-1-biju.das.jz@bp.renesas.com> <20260430093422.74812-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260430093422.74812-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 May 2026 17:39:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUaTUWUNYBOFe_6Ri1_riRutUZ9VEfz37RJV5UXS=Vg0Q@mail.gmail.com>
X-Gm-Features: AVHnY4LgzfHN41YN-V7cEvvs2C2tHhX8ZDYGE5oWoEa2HgNRZk365TqmESGxYzA
Message-ID: <CAMuHMdUaTUWUNYBOFe_6Ri1_riRutUZ9VEfz37RJV5UXS=Vg0Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] pinctrl: renesas: rzg2l: Add support for selecting
 power source for {WDT,AWO,ISO}
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: D93B14DDA6E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32145-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,mail.gmail.com:mid,linux-m68k.org:email,glider.be:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

Hi Biju,

On Thu, 30 Apr 2026 at 11:34, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The RZ/G3L SoC has support for setting power source that are not
> controlled by the following voltage control registers:
>   - SD_CH{0,1,2}_POC, XSPI_POC, ETH{0,1}_POC, I3C_SET.POC
>
> Add support for selecting voltages using OTHER_POC register for
> setting I/O domain voltage for WDT, ISO and AWO by extending
> rzg2l_caps_to_pwr_reg() with a mask output parameter so that callers
> callers can identify which bit(s) within OTHER_POC correspond to the
> requested domain. Update rzg2l_get_power_source() to extract the
> relevant bit field via field_get() when reading OTHER_POC, and update
> rzg2l_set_power_source() to perform a read-modify-write under the
> spinlock when writing to OTHER_POC, since multiple domains share the
> same register.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Updated commit description.
>  * Updated rzg2l_caps_to_pwr_reg() to return mask in addition to register
>    offset.
>  * Dropped ffs(), using field_get() instead to get PoC offset in
>    rzg2l_get_power_source().
>  * Simplified rzg2l_set_power_source() by using mask from
>    rzg2l_caps_to_pwr_reg().
>  * Added scoped_guard() for RMW operation in rzg2l_set_power_source().

Thanks for the update!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c

> @@ -900,7 +909,8 @@ static void rzg2l_rmw_pin_config(struct rzg2l_pinctrl *pctrl, u32 offset,
>         raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>  }
>
> -static int rzg2l_caps_to_pwr_reg(const struct rzg2l_register_offsets *regs, u32 caps)
> +static int rzg2l_caps_to_pwr_reg(const struct rzg2l_register_offsets *regs,
> +                                u32 caps, u8 *mask)
>  {
>         if (caps & PIN_CFG_IO_VMC_SD0)
>                 return SD_CH(regs->sd_ch, 0);
> @@ -912,6 +922,16 @@ static int rzg2l_caps_to_pwr_reg(const struct rzg2l_register_offsets *regs, u32
>                 return ETH_POC(regs->eth_poc, 1);
>         if (caps & PIN_CFG_IO_VMC_QSPI)
>                 return QSPI;
> +       if (caps & PIN_CFG_OTHER_POC_MASK) {
> +               if (caps & PIN_CFG_PVDD1833_OTH_AWO_POC)
> +                       *mask = BIT(0);
> +               else if (caps & PIN_CFG_PVDD1833_OTH_ISO_POC)
> +                       *mask = BIT(1);
> +               else
> +                       *mask = BIT(2);
> +
> +               return OTHER_POC;
> +       }

You could always return a proper value in *mask...

>
>         return -EINVAL;
>  }
> @@ -920,17 +940,20 @@ static int rzg2l_get_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps
>  {
>         const struct rzg2l_hwcfg *hwcfg = pctrl->data->hwcfg;
>         const struct rzg2l_register_offsets *regs = &hwcfg->regs;
> +       u8 val, mask;
>         int pwr_reg;
> -       u8 val;
>
>         if (caps & PIN_CFG_SOFT_PS)
>                 return pctrl->settings[pin].power_source;
>
> -       pwr_reg = rzg2l_caps_to_pwr_reg(regs, caps);
> +       pwr_reg = rzg2l_caps_to_pwr_reg(regs, caps, &mask);
>         if (pwr_reg < 0)
>                 return pwr_reg;
>
>         val = readb(pctrl->base + pwr_reg);
> +       if (pwr_reg == OTHER_POC)

... so you could drop this check...

> +               val = field_get(mask, val);
> +
>         switch (val) {
>         case PVDD_1800:
>                 return 1800;

> @@ -958,25 +981,37 @@ static int rzg2l_set_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps
>
>         switch (ps) {
>         case 1800:
> -               val = PVDD_1800;
> +               poc_val = PVDD_1800;
>                 break;
>         case 2500:
>                 if (!(caps & (PIN_CFG_IO_VMC_ETH0 | PIN_CFG_IO_VMC_ETH1)))
>                         return -EINVAL;
> -               val = PVDD_2500;
> +               poc_val = PVDD_2500;
>                 break;
>         case 3300:
> -               val = PVDD_3300;
> +               poc_val = PVDD_3300;
>                 break;
>         default:
>                 return -EINVAL;
>         }
>
> -       pwr_reg = rzg2l_caps_to_pwr_reg(regs, caps);
> +       pwr_reg = rzg2l_caps_to_pwr_reg(regs, caps, &mask);
>         if (pwr_reg < 0)
>                 return pwr_reg;
>
> -       writeb(val, pctrl->base + pwr_reg);
> +       if (pwr_reg == OTHER_POC) {
> +               scoped_guard(raw_spinlock, &pctrl->lock) {
> +                       val = readb(pctrl->base + pwr_reg);
> +                       if (poc_val)
> +                               val |= mask;
> +                       else
> +                               val &= ~mask;
> +                       writeb(val, pctrl->base + pwr_reg);
> +               }
> +       } else {
> +               writeb(poc_val, pctrl->base + pwr_reg);
> +       }

... but that would mean you would always do an RMW-cycle,
while other SoCs have just one field, and don't need RMW.

> +
>         pctrl->settings[pin].power_source = ps;
>
>         return 0;

We can always revisit this later, if the need arises for more variants, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.2.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

