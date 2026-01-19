Return-Path: <linux-renesas-soc+bounces-27069-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C97ED3B718
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 20:17:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B29C73000B5B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 19:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0F4E215F42;
	Mon, 19 Jan 2026 19:17:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B801550095A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 19:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768850265; cv=none; b=bhoI1EZlJjIc5CopLIdk5qMBephkgzlU6UsDM+Um8cWRczdK0lva9qNu/vyzGgCqLWG+jY/F6gu0yJuWEJeWu3Kp3sX0IwtW1QoC2d9x513S16r8kcIrr2DqfKXGuzNyVdj8HK49OmfqJTQTFxc0wr3Ag1A0ZP7EFV6pxsrzdR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768850265; c=relaxed/simple;
	bh=/6iwuNMZc5kIHFz9+eHrkjYu4KucuYpwvc1o9G18MMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oopKl1ROtOKEnP5SBGyRX6S0ng3nlagoaaAmQYXXOCVVan1CDImpy3GrOMoOA8EkJ6psxCxafreIXTt122PYx3iR2vOb1ZmqOPtMIlqTQQXOT2PyUjf6PCv+9JZaNLlmq22YpSglZ7pjZJhfioPRKjUkKF/Yv1vuD5cRqEDDk7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56378a18ba4so1162907e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 11:17:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768850263; x=1769455063;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/ksvhxDAHEK6GRShjDfoLa3UE0f58CuM5UI6afaKhU=;
        b=M+voG2kb8SxfWEIijZ21JTNOsCrIK//9kADChaNcKxQdOb0ulemPKAQJ2x0+zVNf9t
         l2NAT1yAFE0fHVRFrRA+hGyDwaNC3X0ptkexIec9b54TCjE5HiQeqhC+Z18XdPTXJRf+
         4Pop+yYHcz3DW8wCHvsDpHH9wNUxvLelZoLyfqGiDmrkswrSxdMXmoWZR0NdN2/V6AKu
         iWxgfUA1Wm17MU4RqapQaSgwJh6C2AnMgMCvnB/9qCR3ENeb1QYJjqf0PSNhS+xUu7Hw
         8Y/caBzARAIy9RXuorYkVyjiBPSvXZUkcQYck3iYJ5sj2ESvTSyAMhKxwziVhPxKz1t2
         0PYw==
X-Forwarded-Encrypted: i=1; AJvYcCV8AEJdPH/ngbrKZwtZgJbbDoesXw1XpI5HEGs10dtAfizL+QJ3T3jSYdu/HtvwjG9hfvOJR6KJnsHuFqRRC6MmxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQk+/x4A/uLCbHNJOSM6JqD6VlbqM/Ex6B3WXP8+WCBEkOQeLG
	CANX93nrwsiFf+f3uqMmDA20xnY/2FKe4IuEg/exHfUPxO3FEq4ugF6boaUqvjaF
X-Gm-Gg: AY/fxX7ebhru5gJizuY2ksinUr1a48zk0LjNSnzlRB6Ap9t/Vc9kqYuQ1nnlWilmV87
	wPNhHA5iW4Yyl8n/EtlGf3ugfG3nLS1i0NbTfUAnUe6fO1NsgiSa9h8k0MYkVQkPov4GzreLZK2
	6DYVtCr/I4tTpTy63h0iVt/i+crZSOsQ6zyjSMrPEVxn9eZxFBt+fWmhBo6WPEnzHerLTPBvoN2
	J5KvuyMCDEXrzfMkqGXOzj/FNhb/b3B29/RQPx2+6V9YIM+Ab6FmzCYE3VrimQm5BOXj4U5D0DZ
	OVzLsDtxWyo4g6ZhiohrMMQHFgec2Ztyz1JbQ/8GJ7ababTuS+QyNzviCAb3S5AA7TmLFng88TL
	JuepDFjEX0CwkmQSCv2BB4UliPrzHFItOkuAaGiVbIzoije8I62hO5B7m9f1fQObElaAxCw5sct
	dypPWcLy1yWV4MYB+TYWquARqsf/WRXrZEpP+HB64wepUtazMo
X-Received: by 2002:a05:6122:3c82:b0:563:6566:b2d9 with SMTP id 71dfb90a1353d-563b73b90b8mr3269276e0c.18.1768850262640;
        Mon, 19 Jan 2026 11:17:42 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-563b7004ff8sm2940504e0c.9.2026.01.19.11.17.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 11:17:42 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9412cb281acso1417529241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 11:17:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVKsfPcAVNZoigNhozSiIn5w73FsXY0Te1hyL9re63KTixPtL8ZqUVcIgJyiLvdGxybGYbOH6NneCx0LsEd6du4Mg==@vger.kernel.org
X-Received: by 2002:a05:6102:dcb:b0:5dd:84f1:b51a with SMTP id
 ada2fe7eead31-5f1a720e344mr3315725137.43.1768850261678; Mon, 19 Jan 2026
 11:17:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com> <20260119-soc-of-root-v1-1-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-1-32a0fa9a78b4@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jan 2026 20:17:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVG-2qucH5dB40CO=8Haw080NqxE-zg=GyVmD2njs-ibg@mail.gmail.com>
X-Gm-Features: AZwV_QiDYUVl5G1JTvUBamxzE_5VCyogXoHB30dVWIYjGOrIgN6mvoOLoE2_KFA
Message-ID: <CAMuHMdVG-2qucH5dB40CO=8Haw080NqxE-zg=GyVmD2njs-ibg@mail.gmail.com>
Subject: Re: [PATCH 1/8] of: provide of_machine_get_compatible()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Mon, 19 Jan 2026 at 11:40, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Provide a helper function allowing users to read the compatible string
> of the machine, hiding the access to the root node.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks for your patch!

> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -434,6 +434,19 @@ bool of_machine_compatible_match(const char *const *compats)
>  }
>  EXPORT_SYMBOL(of_machine_compatible_match);
>
> +/**
> + * of_machine_get_compatible - Get the compatible string of this machine

... the first compatible string...

Do you see a need for adding an index parameter?

> + * @compatible: address at which the compatible string will be stored
> + *
> + * Returns:
> + * 0 on success, negative error number on failure.
> + */
> +int of_machine_get_compatible(const char **compatible)
> +{
> +       return of_property_read_string(of_root, "compatible", compatible);
> +}
> +EXPORT_SYMBOL_GPL(of_machine_get_compatible);
> +
>  /**
>   * of_machine_device_match - Test root of device tree against a of_device_id array
>   * @matches:   NULL terminated array of of_device_id match structures to search in

> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -426,6 +426,8 @@ static inline bool of_machine_is_compatible(const char *compat)
>         return of_machine_compatible_match(compats);
>  }
>
> +int of_machine_get_compatible(const char **compatible);
> +
>  extern int of_add_property(struct device_node *np, struct property *prop);
>  extern int of_remove_property(struct device_node *np, struct property *prop);
>  extern int of_update_property(struct device_node *np, struct property *newprop);
>

Do you need a dummy for the !CONFIG_OF case?
This is only used by drivers/soc/fsl/guts.c, and FSL_GUTS is selected
by MMC_SDHCI_OF_ESDHC, which is OF-only, but can be enabled
when PPC || COMPILE_TEST.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

