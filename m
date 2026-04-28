Return-Path: <linux-renesas-soc+bounces-31718-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uM/NCaoE8WnhbwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31718-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 21:04:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F09C48AF53
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 21:04:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 251D7301A1EB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 19:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92B83290D9;
	Tue, 28 Apr 2026 19:04:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E8E2FF155
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 19:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777403047; cv=none; b=XME9xVfP2qUzJ3+sO15ctCY1T86ZWI1CmxF89GfdtARawVAukduuRBh82SNays1WcSfttnhKxeHGKqAJeh0LIt/w08yHSknX8IBoSHSUIDgiJmPFOOK9Fk05WxCvwEjdb0jmhFwE312eo8kfjkhUrg/pV821T0DvKIaE/U3z3k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777403047; c=relaxed/simple;
	bh=J0CuarzPFG0TpN6nt7FLMyrw37XeJiUf9kmvM0wcMSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E4utIS0aFSP68gEyrQhcmXOPyoJmqtzwAq6omMCIIQ6H9fkDl4rlAi+1RAcDpdA1ig279XlYiyn00AVZgTfJH/ey/FTnloat4fT0BwQTZV0WVSLHvkGpSVQVgjzr8g/637dvwkUuPa0Z86X4eUT5ImT61z4uVAL2sR9PgVDTJgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-60fce51aa55so3645973137.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 12:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777403045; x=1778007845;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+PiOGrtlfrHasMb8ONEfDi5/8WTl/cLX2Kw/y7AM8M=;
        b=QFTIU1oWx6PW+jAOl2Pgl9QLdGJhYez1DPPSYoaCcR+zvCIB0plGybKt9YxgFTYLGy
         6Eg6BcNKYL7v4qpQeQoQEHLauDxv9zQ3C4OzAjjdKjDFAKvQ4SPLzknk8zX+X6ZqxK7Y
         ii4nosRGSjgv/d0d9lw7A9msdeoxmGF7Mz+EteTGYtVvlN678PYmyTECmklWXGUI9NDe
         nIknQc+vyNV1CdO4Mystq5Qdp41PFXGttkM0HHuFJdta8MxSSRD9Re6SqsT6HOJYLJe7
         llv1r+VCeToFIc/2kyD2xYH2g0cp5C4HGdp+eM9ePlPxAHvZ+ROt50l81DimC8DIVkZs
         eg5Q==
X-Forwarded-Encrypted: i=1; AFNElJ/WTzq1FIigqA2hKeSjaAS24635o6Fx21sl9R3jEcdMfcXKOWFd+4pgLuvTMkHU51So5ubkw83zJ5ACZU3dYiorew==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe5PQZYhcGTR2FEODc8JriV5HQp8iJCdYFKwL3TFCaKW4CTQc0
	Kiwr6VyTWqJM+dD6febU1POCbPmruaV7G/L/gs/HIsQVRZOLvOCF1Zw+6LNpOVSc3aA=
X-Gm-Gg: AeBDieum+1HwT3/htCCwyUgCabqG5h4ZpXoVnh+WQpWzpEJ3vfkhfLOVA9i+l4d3lxF
	+pSs3z7LSDQXMlYXBN7rgPn92m+qusqTdb1I4CoMm4Buu+TvoNyiK3r6whxJqlhwEePRpBVX+D6
	4oUrhUJJDlmJXry/IJi82rO8fOChoevgoEO92WH4wOFse8l6zuDp+MHUBnMt5OacZ/IcxwDfCZ0
	743my/mR0jf7KajFCtOsCrRDdTUTevR+1ktl+l3bl+lU/ensD0p2m9qBhIvlTvsmkIa3/z1DLoN
	hiTwctEKJH2cfK3AFWZxDsEbhsFAGyJPivD0teDA7+hK47z0vyfAeGA3isb34KzuGs3u+Seo5OH
	2x+732whJdm3Bi949EzOHvLSIAltniedwpcmzVmE1ZSTytrbeHDG2waoB6Z2fR/bNfm+xkkoYbx
	TJzXPQPV8MhDhoiUqD1Pjv0a/aUPy1IVjJ5Vz6PpM44dSSeFaG1cEsXmh2Q7teNtBHmGaKEEeSJ
	DE=
X-Received: by 2002:a05:6102:800c:b0:608:6d10:e415 with SMTP id ada2fe7eead31-62808a51b15mr2250943137.8.1777403044768;
        Tue, 28 Apr 2026 12:04:04 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ca0c6e270sm1733073241.4.2026.04.28.12.04.04
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 12:04:04 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56f8b51db2cso3635915e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 12:04:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+4ucO42U+Tz8L2UtX1as5I2PhMXGfDMHGqZWPH5UHvAMas1AHM2azN5FBV7FcRvVmgMz4OCBrkN25maW4IROTq/w==@vger.kernel.org
X-Received: by 2002:a05:6102:2ad3:b0:608:8fb9:9104 with SMTP id
 ada2fe7eead31-6280b3e3ee8mr2068848137.29.1777403044232; Tue, 28 Apr 2026
 12:04:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317101627.174491-1-biju.das.jz@bp.renesas.com> <20260317101627.174491-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260317101627.174491-7-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Apr 2026 21:03:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWc_ffY83M8aR91X+=R3_n5go8q9E7-L1Q8YN-5z64grw@mail.gmail.com>
X-Gm-Features: AVHnY4L-xXB553nhUeyCaK_IudMmOEPvxPnSOf8YTHReSNXuNx1vwH3gqM29JKs
Message-ID: <CAMuHMdWc_ffY83M8aR91X+=R3_n5go8q9E7-L1Q8YN-5z64grw@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] pinctrl: renesas: rzg2l: Add support for RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 6F09C48AF53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31718-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,bp.renesas.com,vger.kernel.org];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.642];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email,renesas.com:email,mail.gmail.com:mid]

Hi Biju,

On Tue, 17 Mar 2026 at 11:16, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add pinctrl driver support for RZ/G3L SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c

> @@ -2479,6 +2614,37 @@ static struct rzg2l_dedicated_configs rzg3e_dedicated_pins[] = {
>          (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_PUPD)) },
>  };
>
> +static const struct rzg2l_dedicated_configs rzg3l_dedicated_pins[] = {
> +       { "WDTOVF_N", RZG2L_SINGLE_PIN_PACK(0x5, 0,
> +         (PIN_CFG_IOLH_A | PIN_CFG_WDTOVF_N_POC)) },
> +       { "SCIF_RXD", RZG2L_SINGLE_PIN_PACK(0x6, 0,
> +         (PIN_CFG_IOLH_A | PIN_CFG_PUPD | PIN_CFG_PVDD1833_OTH_AWO_POC)) },
> +       { "SCIF_TXD", RZG2L_SINGLE_PIN_PACK(0x6, 1,
> +         (PIN_CFG_IOLH_A | PIN_CFG_PUPD | PIN_CFG_PVDD1833_OTH_AWO_POC)) },

The main documentation indeed calls these pins "SCIF_RXD" and
"SCIF_TXD", like on RZ/V2H and RZ/G3E.
However, unlike the latter SoCs, RZ/G3L has multiple SCIF interfaces.
As the pin function spreadsheet does call them "SCIF0_RXD" resp.
"SCIF0_TXD", and users will probably use that spreadsheet to find the
right pin control configuration, I think it makes sense to use the
names that include the zero index.

> +       { "SD0_CLK", RZG2L_SINGLE_PIN_PACK(0x9, 0,  PIN_CFG_IOLH_B) },

One space too many before PIN_CFG_IOLH_B.

> +       { "SD0_CMD", RZG2L_SINGLE_PIN_PACK(0x9, 1,
> +         (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
> +       { "SD0_RST#", RZG2L_SINGLE_PIN_PACK(0x9, 2, PIN_CFG_IOLH_B) },
> +       { "SD0_DS", RZG2L_SINGLE_PIN_PACK(0x9, 5,
> +         (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
> +       { "SD0_DATA0", RZG2L_SINGLE_PIN_PACK(0x0a, 0,
> +         (PIN_CFG_IOLH_B |  PIN_CFG_IEN | PIN_CFG_PUPD)) },

One space too many before PIN_CFG_IEN.

> +       { "SD0_DATA1", RZG2L_SINGLE_PIN_PACK(0x0a, 1,
> +         (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
> +       { "SD0_DATA2", RZG2L_SINGLE_PIN_PACK(0x0a, 2,
> +         (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
> +       { "SD0_DATA3", RZG2L_SINGLE_PIN_PACK(0x0a, 3,
> +         (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
> +       { "SD0_DATA4", RZG2L_SINGLE_PIN_PACK(0x0a, 4,
> +         (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
> +       { "SD0_DATA5", RZG2L_SINGLE_PIN_PACK(0x0a, 5,
> +         (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
> +       { "SD0_DATA6", RZG2L_SINGLE_PIN_PACK(0x0a, 6,
> +         (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
> +       { "SD0_DATA7", RZG2L_SINGLE_PIN_PACK(0x0a, 7,
> +         (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },

The SD data pins are called "SD0_D[0-7]" in the main docs, but
"SD0_DAT[0-7]" in the spreadsheet. So please pick one of these ;-)

> +};
> +
>  static int rzg2l_gpio_get_gpioint(unsigned int virq, struct rzg2l_pinctrl *pctrl)
>  {
>         const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[virq];

> @@ -3263,6 +3432,8 @@ static int rzg2l_pinctrl_suspend_noirq(struct device *dev)
>
>         cache->qspi = readb(pctrl->base + QSPI);
>         cache->oen = readb(pctrl->base + pctrl->data->hwcfg->regs.oen);
> +       if (regs->other_poc)
> +               cache->other_poc = readb(pctrl->base + regs->other_poc);
>
>         if (!atomic_read(&pctrl->wakeup_path))
>                 clk_disable_unprepare(pctrl->clk);
> @@ -3288,6 +3459,8 @@ static int rzg2l_pinctrl_resume_noirq(struct device *dev)
>         }
>
>         writeb(cache->qspi, pctrl->base + QSPI);

RZ/G3L does not have the QSPI register.
However, this write is harmless, as it has the SD_CH1_POC at this offset,
which is thus saved/restored twice.

> +       if (regs->other_poc)
> +               writeb(cache->other_poc, pctrl->base + regs->other_poc);
>
>         raw_spin_lock_irqsave(&pctrl->lock, flags);
>         rzg2l_oen_write_with_pwpr(pctrl, cache->oen);

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

