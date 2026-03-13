Return-Path: <linux-renesas-soc+bounces-29352-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJvpD20OtGlvfwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29352-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 14:17:33 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA76828394F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 14:17:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1933A3028118
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 13:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D553C207A20;
	Fri, 13 Mar 2026 13:15:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B41D13DBA0
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 13:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773407731; cv=none; b=BazlomVN/hgCpTkOavq7Mg6L23AqOnt71TmmMdQt3+E9U/MHah+j8ZL8kBdIUOp2zK12gC1l9wuAaYZgPbYAXApazr9rNfTiEVE0N7iJtL95Iok9Xi2+wfi20fqRHg/7ma1ZQphkHUw5fj2ydiWjOCAz8IwshXFZ5Na/W6+bQT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773407731; c=relaxed/simple;
	bh=FD5ekiLOOBJChecwQG0dJl1knwV67wRC3yOiIGyhM2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CGu2eU5N4vKWMDW7iu8shyksZ/bBqSAUjLMHEsTknUc6lAnmRqzPdGs1QD10oOBs65NhjLWTXn7poLT3GlsfGkopHL2XfBtsqXPvQ04A1f6XBnsEA5TD/4AtrKtRMDEJLV+Vc5ECoFFTcF1sD6Rto63xZI0GPV8cOOnuhQml8I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56a8fdaddebso826358e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 06:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773407729; x=1774012529;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5IMCEYZjdyKVwdjBQt6YE34M1pH2EvbKGqyAdLQ6lqA=;
        b=D60xnLKFostIqVuDLeyKsBeBwc5RcYqSkI1RKf4IGOjqZi3AO7GNX6efp7jt35Fthi
         Ezr5o3vK5wobxM9rmTHZy9Sa5vq5zqUqcE22t97+ThImbrlOPTQiqzQA427JY5SCp5cv
         0Ht46USTstO//YJlka0hXnqRLP0dspaUYueTugY0PgjyoQ+jwohLgruTRPNzuTL/4IAm
         UKcNY9ijK3S1cmntFkUP0m6oc+YFSMJrAW96ilTv78aM/JfU88nZsTtSj8HQEySxI6EH
         afRdAOhsx71KObMAwjIXXhSQXAqFZgFGzQTCCCpTWtlzTadcvQ3LJCyZC10xif4wS3Zb
         t8Cg==
X-Forwarded-Encrypted: i=1; AJvYcCVq50o8AuV7KwIa6nDb414enp3H5/AmK87xfgp8vvuNKqIpNG7vuB6MiPoqbsTRqzx220zbnAGMTypL5f6Aj2AsvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvUp/JAikx21A1IJJGDv9sizuOY6g9TNAVl4Fwh1c/CQSEwtue
	lenB3hBaghOTeB46r3yR0x2IT3dySoiWXxwKg56qmlWsvgVDplctusMZ6/1qmMMs2Pk=
X-Gm-Gg: ATEYQzyZOOztVslqScsTjIS8YOcJwakQRYPMywbm27wTyA0zJ9xjGn7BN5/moTqsBuP
	DotuPDjnb4u6M+tQTZ2KoRJ9L/gp0nNDM9ppAps91aMBaWKPjSv7wz9zYJD01rZ2TXxaGRC7/PA
	RxDs4zo+m+yb/Yc0HbDNbKYrKjI0HdAkBDZRmyECFgeBS1K8he3IFI5nfn7SCU5VVsM+NWtAo4N
	ZeIjWXJdumSvaqKvRLP0CD1Mo33BHtl9KufOnWvVhG3YDRwMa4G9I+S1NIFg68j2P8aiDzSntFB
	gFwlMIi93PLl0+bmEc2YKRICG3VAaanuQTdq6w5q3hkZ593AVaPNvFCIJNdS08hr4WjFoyvSps2
	FGVxOHw/bZUlzcOGEvYH5QybZ5yjZnLR6N3aKerNh0NKkaOiIbGgcE7sDcjj1eshOQBKWjFEQqz
	sekRL2yVyII5cVMlrGF2oQcqOk5nQPRScn9hOYT6v1RRw61wL42z5mOESkXDfPqGiim9WuZwI=
X-Received: by 2002:a05:6122:a07:b0:566:fe6c:e1ba with SMTP id 71dfb90a1353d-56b6282da4cmr1090375e0c.4.1773407729265;
        Fri, 13 Mar 2026 06:15:29 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b4646bdfasm3810892e0c.13.2026.03.13.06.15.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 06:15:29 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5ffc6a96665so669990137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 06:15:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV1rtFX4A4wEdQrtEiqLIuVP6qbyIp1UNDTFZS1OMRqFb7dLOyoUwadzmi99v9OT3YQeUXNtqaUR+PiaAb3ttfKuQ==@vger.kernel.org
X-Received: by 2002:a05:6102:304d:b0:5df:8f4:61e6 with SMTP id
 ada2fe7eead31-6020e59d4f6mr1216341137.32.1773407728697; Fri, 13 Mar 2026
 06:15:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218151925.1104098-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20260218151925.1104098-1-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Mar 2026 14:15:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWv1dQ55NcwMga_X0G8K97RgMRXoDu_FV10fNQv7AadbA@mail.gmail.com>
X-Gm-Features: AaiRm53MA-SJ4NIehTNXTLcQgD9txV-qYKgCrRyK2DnKPdvwRUSvj6k_ZDhmScM
Message-ID: <CAMuHMdWv1dQ55NcwMga_X0G8K97RgMRXoDu_FV10fNQv7AadbA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Add GPIO set_config
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: linusw@kernel.org, brgl@kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29352-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,tuxon.dev:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: AA76828394F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Claudiu,

On Wed, 18 Feb 2026 at 16:19, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add GPIO set_config to allow setting GPIO specific functionalities.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -1848,6 +1848,25 @@ static void rzg2l_gpio_free(struct gpio_chip *chip, unsigned int offset)
>         rzg2l_gpio_direction_input(chip, offset);
>  }
>
> +static int rzg2l_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
> +                                unsigned long config)
> +{
> +       switch (pinconf_to_config_param(config)) {
> +       case PIN_CONFIG_BIAS_DISABLE:
> +       case PIN_CONFIG_BIAS_PULL_UP:
> +       case PIN_CONFIG_BIAS_PULL_DOWN:
> +       case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> +       case PIN_CONFIG_DRIVE_PUSH_PULL:
> +       case PIN_CONFIG_SLEW_RATE:
> +       case PIN_CONFIG_DRIVE_STRENGTH:
> +       case PIN_CONFIG_DRIVE_STRENGTH_UA:
> +       case PIN_CONFIG_POWER_SOURCE:

Shouldn't you handle all types that are supported by
rzg2l_pinctrl_pinconf_[gs]et()?

The following are missing:
PIN_CONFIG_INPUT_ENABLE
PIN_CONFIG_OUTPUT_ENABLE
PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS
PIN_CONFIG_INPUT_SCHMITT_ENABLE
RENESAS_RZV2H_PIN_CONFIG_OUTPUT_IMPEDANCE

> +               return pinctrl_gpio_set_config(chip, offset, config);
> +       default:
> +               return -EOPNOTSUPP;
> +       }
> +}
> +
>  static const char * const rzg2l_gpio_names[] = {
>         "P0_0", "P0_1", "P0_2", "P0_3", "P0_4", "P0_5", "P0_6", "P0_7",
>         "P1_0", "P1_1", "P1_2", "P1_3", "P1_4", "P1_5", "P1_6", "P1_7",

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

