Return-Path: <linux-renesas-soc+bounces-33428-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mQzRHpjSHmr9VQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33428-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 14:54:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BE462E30C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 14:54:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33428-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33428-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0465530242AC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 12:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40BC43DE430;
	Tue,  2 Jun 2026 12:54:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D822765DF
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 12:54:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780404866; cv=none; b=RhGS7C0Ht4Ejd7UqRGjTXDXLKz/Z3LMumALdFhYNeKEKG+EdDxQ6w2MzSHaxQ4fRjMpbsN31BHAF7ys9FdoMydoifYVdFVLBCDfv9S3dAKE8ITZivZXIDTrAVPeT0owmjgqM3fuziNCOyG78wGCq5oAx8Ziovplq4U17uJIUlms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780404866; c=relaxed/simple;
	bh=Sn677f1avDZkCsXDJK9ax5cLUEJm/EVUXZTw1JXjsYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jsWihxWRkFfUqtAaCQX4HpPhwXfCtcqkvifS0r4FaHSHQuD4fiK2hYlD1/+K7Q5tTIPtZSy/7FJh7STmLGsORXNMUbzc/UBlpnQSAIXONwbxXkNHQfS7+TGGsBxmhBwyow4OF0WVN4aN7yyXf5brrt3pPXoS2rGq+4c93j8CnUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-96387cf6335so4768858241.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 05:54:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780404864; x=1781009664;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wi8lw9em5f2a38ue4BrDD+pK8F7cdkfj8OF9muR3yps=;
        b=PXFi3zdXuylQl1CE7kqFmxn9wI5/7OQK4lrwbwedLFCZU2ldAxsxYx3Hp72pX066Au
         jSDTaW1YGKLrY8LJFek+ngE8J+jANUOhSlE9kM8J2Ud/9trMOr5JjRqxOczly93oS7yt
         Fi+MKS6sLYlIucKKp4r4Pw8QFIy3VgcYJUISqcFGIKpbow7eyhYR4Vh3FFxrKkQdyRUt
         4PxxKfOmoDLAxWoBGYkiT3/3lgmZA16EkLvfexV7fYAZwPrtQFhZfK2mzkF3tvw1cZF7
         sKjbMkCNLjc0J2E4c18k3yqBdLI6ahzDewGJl2kYPvMfmskZk3G3KPGAZWXE364Wso5n
         TxEw==
X-Forwarded-Encrypted: i=1; AFNElJ8/sHEmU/JhFEwQbdZXbpyxGNFm4k72hUGhAqRSXtd0YW9bbNlxFkx7qiPs68ZowCAfhcLTaok+8LLgHw+t7ViazQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRYeVZMhxnbPc1xbouytqrNvESCaLxoMIe/BPGNZDfWHZu2OLX
	IILP4CWgb8JgKaabrLuFgwUXkH5gEacqcJk2cA1IMgu3zp8rNNWUiQVaIETLI0avQ+w=
X-Gm-Gg: Acq92OEj53ptzeST2CrjjvbyJy2X4ZXLfODSmsXUf8bpCdqmCW0SYDHfkwdYwp1xNJp
	Ww+hXjmRwM5Bso2QzzTHiUpUhjhNavpeuCnP78mDIQx18XOHe5frr1QjDXZrK6BrxjafrKfbbNu
	uZB9UPhcb1zUuw6D08kDETo97/YAZEy4mI0Rue5jiSSy7rx0lmVqbc62V+HzUXtzzK81Zmud6jn
	n1aaszAmCwaoOpeoOfkDmId+etvBprAyqB4HWLDZtejMuUQPD15rq4JPhrG47/JIgSPerrJQ+Ei
	58hrTZRQ4K3TL1sAGve6Z+nmOJNdERpCNxZbm6t0L/p0nJ4VxXKzSo0ujSNrz9e4mzJEMWjDHAh
	XyhyxWoiO+jLZQDz78G8GGhLGFpp6slVxHbE0qdoYn+kOtAOiAQJK8Zk3yrq1SnqRGue4FVB8w/
	f+Qjz/PWlv3NApWsaQqVGZKIn//RBwLq0Eubs7BvYUp2nuzxXvx0RihejkgLKllc6anG1WdCrTa
	pSj5TJAWw==
X-Received: by 2002:a05:6102:8009:b0:6d3:4e:6d80 with SMTP id ada2fe7eead31-6e174d9a5e8mr1721414137.11.1780404864007;
        Tue, 02 Jun 2026 05:54:24 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6c8c6958f31sm7647601137.12.2026.06.02.05.54.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 05:54:22 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-96387cf6335so4768822241.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 05:54:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9ssJePJ23nkckNfIOFS2m7KYMUz2xn/Oew+x5bGMfrgSFokCr3TIOI39FIYM0eHHm1kjcZGfpYgv0IrZM7PCJ/Ig==@vger.kernel.org
X-Received: by 2002:a05:6102:604a:b0:643:80f1:350f with SMTP id
 ada2fe7eead31-6e1841a6973mr1450406137.21.1780404862675; Tue, 02 Jun 2026
 05:54:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527202317.5347-1-rosenp@gmail.com>
In-Reply-To: <20260527202317.5347-1-rosenp@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Jun 2026 14:54:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUcqeaPmDPUDa-rWJjxQAsY6jfaQfMTtJJ3bUK-Z_32cQ@mail.gmail.com>
X-Gm-Features: AVHnY4KDMTL0q4heTM07BlcY3ivbV4ExX8CD9RluKc_4RyO9BG5F3XDi0rlWYyw
Message-ID: <CAMuHMdUcqeaPmDPUDa-rWJjxQAsY6jfaQfMTtJJ3bUK-Z_32cQ@mail.gmail.com>
Subject: Re: [PATCHv2] pinctrl: rza2: embed pins in the priv struct
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"open list:PIN CONTROLLER - RENESAS" <linux-renesas-soc@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be|_ptr)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33428-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:rosenp@gmail.com,m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid,linux-m68k.org:from_mime,linux-m68k.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 32BE462E30C

Hi Rosen,

On Wed, 27 May 2026 at 22:23, Rosen Penev <rosenp@gmail.com> wrote:
> Turn the separately allocated pinctrl_pin_desc array into a flexible
> array member of struct rza2_pinctrl_priv, annotated with
> __counted_by(npins). The pin count is now computed before allocation so
> struct_size() can size the combined object, collapsing two allocations
> into one.
>
> Change npins to unsigned int to avoid potential overflow/underflow
> errors.
>
> Assisted-by: Claude:Opus-4.7
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v2: use unsigned inr

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rza2.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rza2.c

> @@ -289,21 +289,17 @@ static int rza2_gpio_register(struct rza2_pinctrl_priv *priv)
>
>  static int rza2_pinctrl_register(struct rza2_pinctrl_priv *priv)
>  {
> -       struct pinctrl_pin_desc *pins;
> +       struct pinctrl_pin_desc *pin;

I will drop pin...

>         unsigned int i;
>         int ret;
>
> -       pins = devm_kcalloc(priv->dev, priv->npins, sizeof(*pins), GFP_KERNEL);
> -       if (!pins)
> -               return -ENOMEM;
> -
> -       priv->pins = pins;
> -       priv->desc.pins = pins;
> +       priv->desc.pins = priv->pins;
>         priv->desc.npins = priv->npins;
>
>         for (i = 0; i < priv->npins; i++) {
> -               pins[i].number = i;
> -               pins[i].name = rza2_gpio_names[i];
> +               pin = &priv->pins[i];
> +               pin->number = i;
> +               pin->name = rza2_gpio_names[i];

... and simplify this to

    priv->pins[i].number = i;
    priv->pins[i].name = rza2_gpio_names[i];

while applying.

>         }
>
>         ret = devm_pinctrl_register_and_init(priv->dev, &priv->desc, priv,

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.3, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

