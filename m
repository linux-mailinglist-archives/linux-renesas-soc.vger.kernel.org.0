Return-Path: <linux-renesas-soc+bounces-27096-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B29D3C594
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 11:39:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 18AD450A729
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 09:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C55D279329;
	Tue, 20 Jan 2026 09:51:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D578F28B7DA
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 09:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768902671; cv=none; b=Eq91qeXL4yyqAnhEBc4CckrjqLZG8IyTjVvTjMNJQKz2rnaKNXahlWdfksN7vjx4WU+BORrnhBGd2ka3rquFw8MiKOXFqO0BvlE7+UxZTQIlrSNhzVKYFspvXCh+6jSnB6A4BbW8tIF3lSoQzWUu8DJgBjF6GgDtBjGBFjibMDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768902671; c=relaxed/simple;
	bh=Y2e+JbZ5geFsLrIwdXvR6J7aoCBZ+QeMG1PGfBHkwC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dqtvhghiQk5fRjRa9UZT7dXE+oyMixVaq+5ocZ3+HIo1Sj1euv5wLZug/hkkQre/ZRjvmWHenDsDhhO++qFxxhoFJnJ/KQszqHwLqEXFygyZZ9RC99t+5nrGMQctEV0GrrzIQZUld8MwYGXORzc+gwR8Z5ABFd36Sxkn2PePj9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8c5265d06c3so614478185a.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 01:51:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768902664; x=1769507464;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l18hDtqu7l45yo1vlmek39RB1c0Zv/I56SgfcgBEbBk=;
        b=jDDvdQA+S8NIaLM3/tRhUJYWLBPTtqkh5s4O1T00zzuotW9z5pjztw1cL/BRfXbjAQ
         IdzBkazOXG+EMg7rkDn9Yk1ryRuWPm+TCAQYYpMPbS1lfpgwC7g2JqTNp3/16N+v4BBN
         M43HcjTj+s7wkQGP1t11+S0JFrqBs6Hcxj1d7/2NPP14uGXo+jJuStEiGz7b02P5Xwix
         apJtom2cCzkAm0wHDr1ojyREZFGfPAHPBri1TvFekBp2YEpxNlSU0385I6olW3UDXsFj
         eqGf0puVSFe7ZLbLYaxmdOjbGwNvsH99q+p5fTMt1T3W4DAzVKqmCSlO/gnITTmcp1nM
         oh/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVvfad72f3wsfes+NzhlY5KP0bOyIpWtLtDbYvG9nBbpNxvDTajda52jXwmOtE6hxacgr/iJAo3+Ej3VqAKYJUAmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlHSoxNpQ+EF5ttZNTkjZGjHlIG5Vpi/KEndNIzjOVSx/MpsyC
	RotzuM65mlpraMwp5sETIY7FVpccoQ5ZFbOP+N4ZbeRY8klV7CwSaymGpwQNf4Wg
X-Gm-Gg: AY/fxX5fbbD7no9ZwADMJjNGg6iIILmF8GJC7dtYjaOQ/FofWq4epqCTNW1yJcsLR/1
	btP3nhduroPgkwr/tGqPU3IycigvVQ17ONENBHSuvJi5E7929OaOZ7zeaLeV9o9vIf1Ykiu5B2e
	4YtA2LYWBxUvCWneR7FUd7iu4xf86eGKx0qz6jPUtpZzAJv37T7u8hqCzGTh3zFqmmdUH4RoevX
	TRRWuOWElmWOT5XzOlz7P57OZLtGcGxc6FQNa7GYMU/f2FQB4Y/qEKtWkeda3sagy5aSRuaWTYv
	vyLpQR2IZD/t4FFxYlZR+DRcaJGLY00gg7UvJy0ut//XJ9esnQh6l2YP9jIt4v+0ssj6Tmu0YIR
	sr/VYhs/DoO73aNyojBuVIQBBYjw9QUTPZ/7KqrY/HTC7AwafUjlL9adhaVSmozVxqF4veeWmwa
	8xGsPda9lAWlufah9oaFjX3OQ6HsVQIhOaxeDGlo9L++Gt21xluTOfl/PrZ6fGcjk=
X-Received: by 2002:a05:620a:440b:b0:8c5:2de4:d6ee with SMTP id af79cd13be357-8c6a64fa163mr1934338685a.33.1768902664422;
        Tue, 20 Jan 2026 01:51:04 -0800 (PST)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com. [209.85.160.180])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a70f1fe1sm977176585a.0.2026.01.20.01.51.04
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 01:51:04 -0800 (PST)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5029aa94f28so39365891cf.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 01:51:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWC0j8HRRPyu2nPMPH3LgJBGDlwYhHks6eQcpv4T8UQW9oElm6/sf4wQSRnHRn1RZITeGmq/onRHKuMMgej6+/EJA==@vger.kernel.org
X-Received: by 2002:a05:6102:cd1:b0:5ef:233e:6b25 with SMTP id
 ada2fe7eead31-5f192508654mr6479996137.13.1768902342092; Tue, 20 Jan 2026
 01:45:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260118-rz-sdio-mux-v5-0-3c37e8872683@solid-run.com> <20260118-rz-sdio-mux-v5-2-3c37e8872683@solid-run.com>
In-Reply-To: <20260118-rz-sdio-mux-v5-2-3c37e8872683@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Jan 2026 10:45:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWnpci1v1oQb34_QRtU-P3S8TSormmNudajT0e34EO14w@mail.gmail.com>
X-Gm-Features: AZwV_Qh1sWLkk903wC1dLdg8mLxjiEBVkYZdOb9H2O-Zh60PCWOHx0RPYuQB8LA
Message-ID: <CAMuHMdWnpci1v1oQb34_QRtU-P3S8TSormmNudajT0e34EO14w@mail.gmail.com>
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

> @@ -677,7 +707,7 @@ EXPORT_SYMBOL_GPL(devm_mux_control_get);
>   *
>   * Return: A pointer to the mux-state, or an ERR_PTR with a negative errno.
>   */
> -static struct mux_state *mux_state_get(struct device *dev, const char *mux_name)
> +static struct mux_state *mux_state_get(struct device *dev, const char *mux_name, bool optional)
>  {
>         struct mux_state *mstate;
>
> @@ -685,12 +715,10 @@ static struct mux_state *mux_state_get(struct device *dev, const char *mux_name)
>         if (!mstate)
>                 return ERR_PTR(-ENOMEM);
>
> -       mstate->mux = mux_get(dev, mux_name, &mstate->state);
> -       if (IS_ERR(mstate->mux)) {
> -               int err = PTR_ERR(mstate->mux);
> -
> +       mstate->mux = mux_get(dev, mux_name, &mstate->state, optional);
> +       if (IS_ERR_OR_NULL(mstate->mux)) {
>                 kfree(mstate);

mstate is freed here...

> -               return ERR_PTR(err);
> +               return ERR_CAST(mstate->mux);

... and dereferenced here, leading to a use after free.

>         }
>
>         return mstate;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

