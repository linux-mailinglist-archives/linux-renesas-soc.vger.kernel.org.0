Return-Path: <linux-renesas-soc+bounces-27141-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDiQNQbeb2n8RwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27141-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 20:56:54 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2154ADF2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 20:56:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 97ED538DBF1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 17:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D9BA33DEF0;
	Tue, 20 Jan 2026 17:52:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEB536403C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 17:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768931548; cv=none; b=q4geiPnPtSGKPwIRYWUktDbfW8yHMwRimS67v7F4qdJ0KRtOhGRae9dPKbdSx9DORUEemwiwuxWErAC1+GzDgp+GFKwclXTq7pSxIJuXJMnITl/YCYtsM7P8/y7NTerMGJgebwXG4H0WgJVyYi0V14Yb50CRMf2P83KEzeD4jRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768931548; c=relaxed/simple;
	bh=3/JP3tCIvtYedAAyMYL0a51zMnc14SZU20ikWY9BXqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A8pS7mIVlB/7HjLZEem5o/UnkKfrxEi4+iXIf8t3MBqnfa6va1qJ2zkkj3Z6r3axNC+jvxTt8/VRIFBO0ltmhE6AN+291pydH1QQH6Tc9/LiN9ZoMCCwswnOrZYvIKgviero52mUxiUsI8ISP9DuyTNFoZYZtcJ4K+i53dI0OyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-11f1fb91996so12740454c88.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 09:52:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768931545; x=1769536345;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dcPNSr1vco6+E9e0XJi5xyBPxmbRiBl/7/yDisLqrnI=;
        b=lbED4rRP06obIWLb9KOF2CmigKUHb5eASx8DChywoTZVwvh0hIw6kND4Z3L1JRTKKH
         XyLX+5nQKblMmK5IQkffoI74jfftHSzHklu9DkmHBEDPMBdm1PRQT7P7MIWhIpaKYLSU
         yOgLc7aNuuVlbjOYqeykn5J88ZUQr8kP6NORDSKzbtWqmbXLSiTCEjBWCNQsolk3a0o7
         lC3r1m4mFaI0+1ODAGS3O/IZ2WrRX0rcXkg4F/mDcFIat+5GdTabHPZ70XA988udd46s
         n6lrAINaV3DXhtheWkS3dZir6Nk6KuZzZzhJSH4jLULM81nOW2rY60P3ruhCTvr1yTZb
         ymuA==
X-Forwarded-Encrypted: i=1; AJvYcCV6ar1ycMYNvzk9VRw2TuTs+yuF15TzISZimSgHNOpvad94acW9jGkHmvs5mZtjaIpoycpWp5/C41AilIZgCxZ6aA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNBjHCMDvLa60hVb/Cgv5dcfbA9MnH3GmhSWURuKUpiO7a5ykH
	I0ooiKYyNJLfcCumi4dKtpFTSwqv/VhLgvekGQ+YjBVhJAx2yzyoIYU7w3xTsg==
X-Gm-Gg: AY/fxX4eConWuPtDmZxid48rEtFgSkPxFjDRp/EPHq1PEQgURjJdz7+9m4k80HImUth
	9dZxM3FR4cVPTe1Nzd6Vmm4UCiiEefWHWMQ3Xij+RcDNG184j0K/mSf8/H0NM1+cRQZlYC118+g
	RyLFIDjd9J4m43NqFrCzHmVpyXDePlV66lLIIaxPiwsPGtxGtoOAdAoN29vXjIfL/spf0nSesVy
	AkGfCDOUa9wqnqhCFWpDHsuzTRujgMqZBc7VDxFwMU2OxjOf4o8Lz6IrOuVKYNm6U9dtwIdjZMH
	ySnHUD13Y4Ja4jXfLNERS44C/SOF0cdya9oV9nObCwAe8hgryfrYY+2hrSJrUh4cGMoLzs3GyL3
	NazlQCBuVg0eb21xzOEr53tt5/NMUE/lGJxVzauwx+5fgOtjmi4ECSZsR7KW6gnAs7yNHVVxzpp
	/e/5h6mXTCenbrY6X1RuwjSEKzZlOXzuYQJ6Q0gEvRKFKYDDBV
X-Received: by 2002:a05:6102:c94:b0:5df:b1f4:77dc with SMTP id ada2fe7eead31-5f1a717f708mr3996003137.31.1768924654118;
        Tue, 20 Jan 2026 07:57:34 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f1a6d3ca2esm4830627137.10.2026.01.20.07.57.32
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 07:57:32 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-93f56a97064so1682608241.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 07:57:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVD69UQVy86r9xA1eq2Yk4DD9epE2UxtImcocbRMPYvE8VUJNWyhJk32xNVoYxcs7ICwm7yxxLK3XnzA44cWhNpYQ==@vger.kernel.org
X-Received: by 2002:a05:6102:b15:b0:5df:c094:628d with SMTP id
 ada2fe7eead31-5f1a6fa3ca2mr4116825137.3.1768924652088; Tue, 20 Jan 2026
 07:57:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260118-rz-sdio-mux-v5-0-3c37e8872683@solid-run.com> <20260118-rz-sdio-mux-v5-2-3c37e8872683@solid-run.com>
In-Reply-To: <20260118-rz-sdio-mux-v5-2-3c37e8872683@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Jan 2026 16:57:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU=wDmDJFYvtzxptAkkOQ8r7sPGUxp9u71e64ikY85+Zw@mail.gmail.com>
X-Gm-Features: AZwV_QgiDRrYV1BByFjO2lg9vbxQpf_lMefb8OE6E5E-nZ3iF4svsU32o-Zkiz4
Message-ID: <CAMuHMdU=wDmDJFYvtzxptAkkOQ8r7sPGUxp9u71e64ikY85+Zw@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] mux: Add helper functions for getting optional and
 selected mux-state
To: Josua Mayer <josua@solid-run.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Peter Rosin <peda@axentia.se>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, Jon Nettleton <jon@solid-run.com>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, linux-can@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.24 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27141-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[32];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,linaro.org,axentia.se,iki.fi,kemnade.info,baylibre.com,atomide.com,gmail.com,ti.com,glider.be,sang-engineering.com,solid-run.com,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Queue-Id: 7D2154ADF2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Josua,

On Sun, 18 Jan 2026 at 11:29, Josua Mayer <josua@solid-run.com> wrote:
> In-tree phy-can-transceiver driver has already implemented a local
> version of devm_mux_state_get_optional.
>
> The omap-i2c driver gets and selects an optional mux in its probe
> function without using any helper.
>
> Add new helper functions covering both aforementioned use-cases:
>
> - mux_control_get_optional:
>   Get a mux-control if specified in dt, return NULL otherwise.
> - devm_mux_state_get_optional:
>   Get a mux-state if specified in dt, return NULL otherwise.
> - devm_mux_state_get_selected:
>   Get and select a mux-state specified in dt, return error otherwise.
> - devm_mux_state_get_optional_selected:
>   Get and select a mux-state if specified in dt, return error or NULL.
>
> Existing mux_get helper function is changed to take an extra argument
> indicating whether the mux is optional.
> In this case no error is printed, and NULL returned in case of ENOENT.
>
> Calling code is adapted to handle NULL return case, and to pass optional
> argument as required.
>
> To support automatic deselect for _selected helper, a new structure is
> created storing an exit pointer similar to clock core which is called on
> release.
>
> To facilitate code sharing between optional/mandatory/selected helpers,
> a new internal helper function is added to handle quiet (optional) and
> verbose (mandatory) errors, as well as storing the correct callback for
> devm release: __devm_mux_state_get
>
> Due to this structure devm_mux_state_get_*_selected can no longer print
> a useful error message when select fails. Instead callers should print
> errors where needed.
>
> Commit e153fdea9db04 ("phy: can-transceiver: Re-instate "mux-states"
> property presence check") noted that "mux_get() always prints an error
> message in case of an error, including when the property is not present,
> confusing the user."
>
> The first error message covers the case that a mux name is not matched
> in dt. The second error message is based on of_parse_phandle_with_args
> return value.
>
> In optional case no error is printed and NULL is returned.
> This ensures that the new helper functions will not confuse the user
> either.
>
> With the addition of optional helper functions it became clear that
> drivers should compile and link even if CONFIG_MULTIPLEXER was not enabled.
> Add stubs for all symbols exported by mux core.
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Thanks for your patch!

> --- a/drivers/mux/core.c
> +++ b/drivers/mux/core.c
> @@ -46,6 +46,16 @@ static const struct class mux_class = {
>         .name = "mux",
>  };
>
> +/*
> + * struct devm_mux_state_state -       Tracks managed resources for mux-state objects.

Please run scripts/checkpatch.pl:

    WARNING: please, no space before tabs
    #80: FILE: drivers/mux/core.c:50:
    + * struct devm_mux_state_state - ^ITracks managed resources for
mux-state objects.$

> + * @mux:                               Pointer to a mux state.
> + * @exit:                              An optional callback to execte before free.
> + */
> +struct devm_mux_state_state {
> +       struct mux_state *mstate;
> +       int (*exit)(struct mux_state *mstate);
> +};
> +
>  static DEFINE_IDA(mux_ida);
>
>  static int __init mux_init(void)

> --- a/include/linux/mux/consumer.h
> +++ b/include/linux/mux/consumer.h

> +static inline void mux_control_put(struct mux_control *mux)
> +{
> +       return;
> +}

    WARNING: void function return statements are not generally useful
    #441: FILE: include/linux/mux/consumer.h:139:
    + return;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

