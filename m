Return-Path: <linux-renesas-soc+bounces-31706-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDJeA0O48GkyXwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31706-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 15:38:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4F5486027
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 15:38:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CD81D31F6F26
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 13:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C51E8481AAB;
	Tue, 28 Apr 2026 13:20:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F01481A8D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 13:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777382420; cv=none; b=E0o+OIErxnytn1NhHvsV3CKSrygM9uYf23kh1jqp6R8bz+VHsQB+udFpdWZWeG9vvwtCARE4bdddjPYxai+clXyXAI/kGUa1bSyS/4FBxro/9qUGxZPxvz/83k3LzIQCXo18m0kGmSKNBNTHKCDnxEFRAMU+yFbSBaPfev8WcII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777382420; c=relaxed/simple;
	bh=HByK9I/cQLk+DGHkedH+tOE/B56fdAqY26kq7gGGvc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hVmHq1/a5s2yFzZ9Z0jxyhwIE2GZd5Zq0G6CRmMuwZz7ugdDxjO3UsPWktaW90oZaowo7x5tG13fc1LKn+hqj/0lwljZQfzztqislRyjv8LePEUQI0Md9DpaQb4mxckqrKtexHMV5JapFrcbwlTgBkyu1q775MvWs7hA7E0QAG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ba7fd666666so1056204566b.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 06:20:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777382418; x=1777987218;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HtptQ8Ok+QUe7qY7BUFtd0TlrWN/BKcm1+4rkRiMvqY=;
        b=OhG0dTune+EUplayhOLECENRTkwioqMllSIitvm0VDSYkqvF/hgx65fRcWFbXVwQGL
         oOSsCjkKTNpoanrhIW9noGzsOQPgm667GpbgmACvTlrVxE3EesmewV1DdXXtYdky3/YF
         mIbJEuMPcQkaWbEwgttypl++CuRosmpbB1Z+mDxvck4LXrYw4NsOW19z+O1U1+KViuwf
         XNnaqS/xJd89054XxA6tiKCyrfqOtnpXNQa4Fjd5BPwpdClycaPEG4gHzyewOJrIWTDS
         LEXKbB2iKa/o+8oY2aKD1ZOlobKZT9RO/17dWNGDUwCjq9voxn6iY2oiDnpACaysIjSw
         bYjg==
X-Forwarded-Encrypted: i=1; AFNElJ+0J2FkGaZn9E+0zwJgNb6gAwDDw7JBLYdNJpH4vonwWSqWo8++FZ2JDX6Ne0RQkvs0C6zq3mZ9uCuqo/1R0iUYrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUhtxyllfGh0q0yrGMOn8AZhvb+ef5Ap6tQOpWZDVpaUMn0NNz
	VQ3sLYqanVjrmdjeKe0gjsXJxY2yWiquQBy+ymnSjjFW1nnms85podySifjK5m8+WvM=
X-Gm-Gg: AeBDiet0bxxsGFJhtxoKxzI5/Ex6iEfX1BD81BIjm/ZfhUqWpYNsVWt7Y4+Eo43erxt
	vY22GrOswlSqzgZ9XpiA52/H8cQKkFMcCql60f8umMCez1DmHZ6wJoh8dFAni9ntbMh5u139dNN
	EgXncPGslENQ/A8NigOMrhWtSCo2BM/JeeuO0oOH4xlCvEMFcPZ6uzDcCtdpyU3PAlwbrgBY/Wy
	H5LucBg9ue03zin6s/EGGA/rQ3kwKmimXNFm5TxhDvg9v/KtoPEFXVE4X8nIqCr5FZMCjKp4oQ6
	GyvA03JOI5xUGF3VXOUNmrAZ8qxz4L/sOnQpuMiTYf4KHsB13/7+LnXztuahyKgeMfFC2Xzeqpv
	9hFkKp/XiZg7ZXqaGKMspwklWNGRqK3O0il0UKrH6fUuKeAPDk8cicsPDq6TBu+GOX/rxsI8r0f
	dhhs8rcxOUaOpdAzCJMTOkNvIg/oiyxczH27Sn436JBw/dpp2q7+eZPSm2U5AyiKQN8PXt2tQ=
X-Received: by 2002:a17:906:6206:b0:ba5:95b1:f152 with SMTP id a640c23a62f3a-bb7ff559c2cmr176659666b.0.1777382417564;
        Tue, 28 Apr 2026 06:20:17 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80bba0addsm102443166b.50.2026.04.28.06.20.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 06:20:16 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-674a44b84fcso16140882a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 06:20:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8HNalDDgblHOuLJiu+OZKNHeq2ssaAjm/IzH6SodWE+pm+CbqA/5DRTurDwcSeXf2l5VbApdInImmx2INev1DJRQ==@vger.kernel.org
X-Received: by 2002:a05:6402:324e:b0:66e:431a:c72 with SMTP id
 4fb4d7f45d1cf-679bb04acebmr1055930a12.5.1777382415846; Tue, 28 Apr 2026
 06:20:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317101627.174491-1-biju.das.jz@bp.renesas.com> <20260317101627.174491-8-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260317101627.174491-8-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Apr 2026 15:20:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVDCSUdihaO-ciEbemRqG92f+vydC8FnVX40b+LHuuP8w@mail.gmail.com>
X-Gm-Features: AVHnY4LNzhtqD7Hg54dY6b7ja94gT4UdWmWqGBjWo24voRsyGFM5uceybjh7Pr0
Message-ID: <CAMuHMdVDCSUdihaO-ciEbemRqG92f+vydC8FnVX40b+LHuuP8w@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] pinctrl: renesas: rzg2l: Simplify rzg2l_pinctrl_set_mux()
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 6D4F5486027
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31706-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.627];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,glider.be:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-m68k.org:email]

Hi Biju,

On Tue, 17 Mar 2026 at 11:16, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The port and function selectors are evaluated multiple times
> in rzg2l_pinctrl_set_mux(). Simplify the function by dropping
> dupicate evaluation storing them in local variables.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -681,16 +681,18 @@ static int rzg2l_pinctrl_set_mux(struct pinctrl_dev *pctldev,
>         for (i = 0; i < group->grp.npins; i++) {
>                 u64 *pin_data = pctrl->desc.pins[pins[i]].drv_data;
>                 u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
> +               u32 port = RZG2L_PIN_ID_TO_PORT(pins[i]);
>                 u32 pin = RZG2L_PIN_ID_TO_PIN(pins[i]);
> +               u8 func;

unsigned int

>
> -               ret = rzg2l_validate_pin(pctrl, *pin_data, RZG2L_PIN_ID_TO_PORT(pins[i]), pin);
> +               ret = rzg2l_validate_pin(pctrl, *pin_data, port, pin);
>                 if (ret)
>                         return ret;
>
> -               dev_dbg(pctrl->dev, "port:%u pin: %u off:%x PSEL:%u\n",
> -                       RZG2L_PIN_ID_TO_PORT(pins[i]), pin, off, psel_val[i] - hwcfg->func_base);
> +               func = psel_val[i] - hwcfg->func_base;
> +               dev_dbg(pctrl->dev, "port:%u pin: %u off:%x PSEL:%u\n", port, pin, off, func);
>
> -               rzg2l_pinctrl_set_pfc_mode(pctrl, pin, off, psel_val[i] - hwcfg->func_base);
> +               rzg2l_pinctrl_set_pfc_mode(pctrl, pin, off, func);
>         }
>
>         return 0;

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

