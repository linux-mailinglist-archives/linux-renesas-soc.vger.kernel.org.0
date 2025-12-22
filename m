Return-Path: <linux-renesas-soc+bounces-25972-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0A6CD5766
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 11:08:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C96823008567
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 10:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B11C308F05;
	Mon, 22 Dec 2025 10:08:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D599E20DD48
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 10:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766398107; cv=none; b=FL8ndpWEmEJQhGEAo6mbuzH7MFpCh7/LAAqProB2zymmWGOlUB5paEf1gAkibwEQO+AIIZou9RtkF1kAEWNIESUdd6DyUjyF1bJ/6H5mYTb6+mJm+wM9BP+i+2/rAfAFVtrC45jscYNRhxgtwvVM5MBro3Ca1OGS7fXkTcOXTDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766398107; c=relaxed/simple;
	bh=pYxC0xGJLfaMlKM2nphME9JmmJ1biPNjHd+MZwrmnFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NQ9ILvNm0Ljd7RCLWvez04UKALKsGlNzqJEBnxwSzDuHpV5OEprxm7JaN3yD+cojAhQgmZddLYZUfnSCuASABx7/G8ZBlqjzCedphz796b0pAAlUzBaXz1SV2tpOASEX23oH7Nj2lHVvI7NxTaMZxvJBfsn+1dxAW8nbT4Z0FZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-55ab217bb5eso416359e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 02:08:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766398105; x=1767002905;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VEzlntz/A3Digs4sjukIlKb5qv62LH8yawTgFzZ88fo=;
        b=Ja++h5FfVUkykqRAQVrm7UJWMyos0ikVbfxTF8BWcC8BhawNbLciIeY+h+EmWwG47H
         HXlRpmr4sqinzoYr8fnqGJ6GLEjKB7EpcwYNzRXKCuAXQz+H3/S5pcC6CCFNDthpFq9G
         qIH/xHKkvmiacPIIxNVZMIlpeOWB78YBNo/vCvcUcKWxSWVKQZNN8yIb0ak0Hiamr+eL
         oxGJt+ZkbDlDmUJFfjyov/GNVWMcLryC6+lZv4SscPh11dI3ScG9VdA3f9OfCx26NRAh
         KXWU2V4vD3gPxKvG38/rjmTOjORLBxtSuHrf71KU3XF64BA8A0isBz4q1lqtAD3Y779F
         nSxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVcMdsBZTJcqDH8qutp4CFc36nZVhA01BMeK1oPG7iZaWhz7Ts3f1fkP3ieNi2okPcRZa1uSo9/WzWWp481oPabg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4vb7TpahMh5z7IX+AKgkQz9uhxjZVbMBUUyBmoAKeuZEh16gK
	IgADFylEPTVZGubcOqYbC1BnBwB3yRdJapEo7u6weI2ebbZBg/ni6ovXzB3olmS5
X-Gm-Gg: AY/fxX4k37KAKXVu0P1+X13qyrG18gKvw652azMlVqC5oQNkIVa2maj0UI8QvsEmQMM
	O3B0cd8r5QZvujICZqgriU/vqFhsuKvZzkPp53i0YITuJRUakhf/5tjPbDCTnJg8xesEx0l6yv2
	ZPD4mpULXBOG0MkHUwZhHcrzdlMBzXYonGlWSUj+eH/l27votdU2DlzTA2E7kgyDrFp8vey75EG
	15adyBroC14+l8dD9WrFxwS01vxfKT6yT+9H3U685NA8A7WKcnP+xo7BL8FGKLMro9SEjsOIm6A
	m6RSTi7aApdBlPU6NNy6bbAknXdLrzkNbqrhQmK9uEkqsaCHDNn9D/Il5calruiYzayi+yLv848
	F5NcIywQLcrrQgnIl/YZfJzwDiK5Fhd/ly8tNiHiYmmsvu+VwP9eKicBM3gsq85VeikgxrcqKA9
	hUG7YXWmyC5xcmwn4zAw3Z+AiZPusbNL4ynEBD+4q/92VT4BnO
X-Google-Smtp-Source: AGHT+IGPjA9RNaQucxNf3KP6tgf03uR35VIzGlPXJCqiCNrJ7QPnqCRrNjnxb3AfQ0xTy6YFNINSjg==
X-Received: by 2002:a05:6122:3295:b0:559:58a5:f6cc with SMTP id 71dfb90a1353d-5615bcde344mr3076364e0c.4.1766398104712;
        Mon, 22 Dec 2025 02:08:24 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5615d132a6csm3226694e0c.10.2025.12.22.02.08.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 02:08:22 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5dfd2148bf3so1262605137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 02:08:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWth9YQRuOOC3cVWl43ANMxDHS1xoJmGZcAPsZhGQCIoj7us8Ixv9FW21s0vSZENUGz7ishLHk4BjktvRIuhW68GA==@vger.kernel.org
X-Received: by 2002:a05:6102:3a0e:b0:5d7:de89:8dc6 with SMTP id
 ada2fe7eead31-5eb1a616c74mr2760273137.6.1766398102025; Mon, 22 Dec 2025
 02:08:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251210-rz-sdio-mux-v3-0-ca628db56d60@solid-run.com> <20251210-rz-sdio-mux-v3-2-ca628db56d60@solid-run.com>
In-Reply-To: <20251210-rz-sdio-mux-v3-2-ca628db56d60@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Dec 2025 11:08:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXjAS6HOYy5=uxcK0RZL5X6agRoHG67QUw4xh5+ovZaJQ@mail.gmail.com>
X-Gm-Features: AQt7F2qgJlv5WWEn-8R7_EQWn45G6An5kBRt8R2C89e3bKVxcY7XZ_y43fEdjFs
Message-ID: <CAMuHMdXjAS6HOYy5=uxcK0RZL5X6agRoHG67QUw4xh5+ovZaJQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] mux: Add helper functions for getting optional and
 selected mux-state
To: Josua Mayer <josua@solid-run.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Peter Rosin <peda@axentia.se>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>, 
	Jon Nettleton <jon@solid-run.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-can@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Josua,

On Wed, 10 Dec 2025 at 18:39, Josua Mayer <josua@solid-run.com> wrote:
> In-tree phy-can-transceiver driver has already implemented a local
> version of devm_mux_state_get_optional.
>
> The omap-i2c driver gets and selects an optional mux in its probe
> function without using any helper.
>
> Add new helper functions covering both aforementioned use-cases:
>
> - devm_mux_state_get_optional:
>   Get a mux-state if specified in dt, return NULL otherwise.
> - devm_mux_state_get_optional_selected:
>   Get and select a mux-state if specified in dt, return error or NULL.
>
> Existing mux_get helper function is changed to return -ENOENT in case dt
> did not specify a mux-state or -control matching given name (if valid).
> This matches of_parse_phandle_with_args semantics which also returns
> -ENOENT if the property does nto exists, or its value is zero.
>
> The new helper functions check for ENOENT to return NULL for optional
> muxes.
>
> Commit e153fdea9db04 ("phy: can-transceiver: Re-instate "mux-states"
> property presence check") noted that "mux_get() always prints an error
> message in case of an error, including when the property is not present,
> confusing the user."
>
> The first error message covers the case that a mux name is not matched
> in dt. This is removed as the returned error code (-ENOENT) is clear.
>
> The second error message is based on of_parse_phandle_with_args return
> value. In case mux description is missing from DT, it returns -ENOENT.
> Print error message only for other error codes.
>
> This ensures that the new helper functions will not confuse the user
> either.
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Thanks for your patch!

> --- a/drivers/mux/core.c
> +++ b/drivers/mux/core.c
> @@ -542,11 +542,8 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
>                 else
>                         index = of_property_match_string(np, "mux-control-names",
>                                                          mux_name);
> -               if (index < 0) {
> -                       dev_err(dev, "mux controller '%s' not found\n",
> -                               mux_name);
> -                       return ERR_PTR(index);
> -               }
> +               if (index < 0)
> +                       return ERR_PTR(-ENOENT);
>         }
>
>         if (state)
> @@ -558,8 +555,10 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
>                                                  "mux-controls", "#mux-control-cells",
>                                                  index, &args);
>         if (ret) {
> -               dev_err(dev, "%pOF: failed to get mux-%s %s(%i)\n",
> -                       np, state ? "state" : "control", mux_name ?: "", index);
> +               if (ret != -ENOENT)

I think the non-optional variant should still print an error message in
case of -ENOENT, else this has to be duplicated in all drivers using it.

This is typically handled by having a non-printing core helper function,
and having printing non-optional, and non-printing/ignoring optional wrappers
around the former.

> +                       dev_err(dev, "%pOF: failed to get mux-%s %s(%i)\n",
> +                               np, state ? "state" : "control",
> +                               mux_name ?: "", index);
>                 return ERR_PTR(ret);
>         }
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

