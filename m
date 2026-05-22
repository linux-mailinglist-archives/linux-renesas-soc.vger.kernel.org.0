Return-Path: <linux-renesas-soc+bounces-32930-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAEcIzksEGphUgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32930-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:13:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AC05B1CA9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:13:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BA8D30BEBAF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 10:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C93DC3C769E;
	Fri, 22 May 2026 10:04:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6153C73D7
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 10:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444289; cv=none; b=dZJeWyhR8t2YsGnBGfcTBNVcpdUIkCeg3Ft5lXU24vcnw/m4pamYKomLYEnlVojmLL/Rcftkw5H31bUhTh86wWSRy+356LI9Btl9W4hTSYiPaPRzlRV56ycBK6tn6TjY6J02gBoVzLhn4rnO8KzKXuihL36epwb2P5JVhC+4pR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444289; c=relaxed/simple;
	bh=cPyf6p/XKrJubb9Nym45gBjTYmcHCP1JNKlIqT8IZ/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QFsGiLRrogYvygMqUdIS92NXiyvgJtDdYzoiLgp9KaygHgOFc1Dk6SJioK0Gxx1alno715Lc0m/sHNNYHkBLN7csW6h152Hsznqfhsh2miwp5uD6Z9jSDtvIfpoHlE238IF+Us+IZOmtdEGd51cDoqZvjJbFODsNh+1BwRsIIek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-6313c800372so5459667137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 03:04:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444285; x=1780049085;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJUL14tFNOQCmDEBkpQTY/EgtnSRNRNf2m4/Z8oQVFQ=;
        b=p9dO9lUjhQmC0ldKWUwDEj3PHwkNZbPh5f7UhFpVfqD+0KB6SPeFTw9FlX5znTTJOq
         Rk/xfgDlLQJWnD+M8+1p04EYgSCQNPV0EdbXiWggoCv9JUiLofiPjGHdlBXgrt2OGWVp
         0a0XS+/aMgKXTEZMu0qbNKQEyMfcvEywMmgXKvJ8yF8P/yMnFczR/UKuQ7XhUBK6vUrr
         czoGRuOXgirYLomqB9pUEW4yNgHdDv7FWAHFUNtMdEfik7e0h0QicJVjImzpYmi0jYU7
         fJL5zKzJYSeSTV2lRoEgOCRgmz4v3X/f6E05JiUawZ4fKm+l8jjkfp6/oqdk+5ItzZDp
         qHfg==
X-Forwarded-Encrypted: i=1; AFNElJ/5+oHnQwPgvnB7akneaZWfxO1j9yY7ugqjx1m/pjSMbMH7yfWTGsmEuRNqyRkzkOuFun52TgJmZDRz/bgTEFE+AQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdteMtEnY9d2RZoVOtK3XinPPVnwD4FHCm9Tez9lEY2a0RO4J4
	co+2PtdIu3y7NYDVaA4tbwo1AXl+iFFKyiwkxMwPHLcp/A8tuRY1/cGGs9x1//a1
X-Gm-Gg: Acq92OEwjQqu/mOsFMgYiqwE7l/NPqVSbd4+Vo0nptxiEIQeLZexAxOsFLbgljGFkLY
	Ay4pzC4ZPUvAIDMvD9To+KEFVrwIfanMU6puyQnn6CxCk+PUattP+eBjzQ13JUl8D8BzdRLCGox
	Tog0QcUKknQxjGg8Vz+ALc9sUJb01QnpmBb9ijEb2liRi0qv07Uce4Qp8csAUomXKgcJ8MHhRTW
	0wNPhpGa85OzUhUxNyoOUkIXFssecG6hfi1r7x5SotBd/eZc2msrYXkMRo9ykiWrmy9/WwUN5kn
	BPDSBXS4lIAkWHuRtKPwsX4NbZIvmyFvrvZuUyD5A67p0HjyaJipv0evww+THvBDD+fQT48NT7I
	bH4oOPJ/nxN21oFUK9grOAxKAFvOfW/palAKT4qTtyDUF4/ahWUy1G/7pH24B2eRLIP2Sxp9bDl
	QxFq2qG1w1jDmMllZ54LcWa55up1DvJR04nhdkXVPR7BXU9wl4Y8wNdV3OaISOkY3D
X-Received: by 2002:a05:6102:3f0f:b0:62f:5908:648a with SMTP id ada2fe7eead31-67c818f134emr1340118137.28.1779444285256;
        Fri, 22 May 2026 03:04:45 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-961738b2babsm998933241.7.2026.05.22.03.04.44
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 03:04:44 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-57512b86273so5212355e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 03:04:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+5jnTxNwicqO4el4HmpNPTGC3ALoqZlV1pS72FAcExlFNLXwdf10p6loh8waFl7yvzgpQU9T4dDm7PltQC5mrQ1Q==@vger.kernel.org
X-Received: by 2002:a05:6122:e22c:b0:56f:bb91:4861 with SMTP id
 71dfb90a1353d-586595dd60bmr1509233e0c.0.1779444283961; Fri, 22 May 2026
 03:04:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513115312.1574367-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260513115312.1574367-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260513115312.1574367-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 12:04:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVcgJ=aG2p-9gx+gtUwM0xcFo+D0NEqBJnqOqSmBEM7ZA@mail.gmail.com>
X-Gm-Features: AVHnY4J9gG82jZ29COhQDeru9nClVZkKnYVdR2yBsg7-d7Z_mL0WABVx35RpFZY
Message-ID: <CAMuHMdVcgJ=aG2p-9gx+gtUwM0xcFo+D0NEqBJnqOqSmBEM7ZA@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: renesas: rzt2h: Skip PFC mode configuration
 if already set
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
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-32930-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.616];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E4AC05B1CA9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Prabhakar,

On Wed, 13 May 2026 at 13:53, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> In rzt2h_pinctrl_set_pfc_mode(), read the PMC and PFC registers upfront
> and skip the pin function configuration if the pin is already in
> peripheral mode with the desired function.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> @@ -188,8 +188,18 @@ static void rzt2h_pinctrl_set_pfc_mode(struct rzt2h_pinctrl *pctrl,
>  {
>         u64 reg64;
>         u16 reg16;
> +       u8 pmc;
>
>         guard(raw_spinlock_irqsave)(&pctrl->lock);

Missing blank line.

> +       reg64 = rzt2h_pinctrl_readq(pctrl, port, PFC(port));
> +       pmc = (pctrl, port, PMC(port));
> +       /* Check if pin is already configured to the desired function */
> +       if (pmc & BIT(pin)) {
> +               u8 current_func = field_get(PFC_PIN_MASK(pin), reg64);
> +
> +               if (current_func == func)
> +                       return;
> +       }

I will shrink that to

    if ((rzt2h_pinctrl_readb(pctrl, port, PMC(port)) & BIT(pin)) &&
        field_get(PFC_PIN_MASK(pin), reg64) == func)
            return;

while applying.

>
>         /* Set pin to 'Non-use (Hi-Z input protection)'  */
>         reg16 = rzt2h_pinctrl_readw(pctrl, port, PM(port));

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

