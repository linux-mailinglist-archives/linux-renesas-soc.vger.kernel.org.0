Return-Path: <linux-renesas-soc+bounces-26779-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F637D2042C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 17:42:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9484B3009F2B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 16:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 653D33A1E66;
	Wed, 14 Jan 2026 16:42:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CAC3A35D3
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 16:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768408951; cv=none; b=GRZgOSK6xmjkKuOCHQ6SfqJLEMZt0F6kfb9i0O30LIgYT3+1DXCLLQkb8fqwYTZbMkNrx5xAmgviAlgKR6wkUVXgkA0UrSccUgZ1Vu3BBFk6GjY++69IiUWJ/TaCZLiYkFNXDrVBM7fbQ7HzfvGxhKZ08Q/yNSkI45ruMG4xZRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768408951; c=relaxed/simple;
	bh=CysL6xiruiSX67uvlyRqvQmCCx8IHf9xdy9dHvpB3oc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YxFWbjMTMXrhGs0khWmI6cDtLpM8AO1+w0vAQoh3OYZv26W5W5hbbBYeOYkZ/91Ri60XGMopKi4X0dKU+f0PosyzOYAhg623mKwELfMvUJFh7siH2oja+HMteR5yt9QkXZet0TTiM3bbRbOexlSMfVHImGojtMxmyWJxAmAzpeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-559f4801609so9183e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 08:42:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768408948; x=1769013748;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9zAI1vAm8zyuEJBGK15rFf8mW6aC3AlXImIyYe4APAQ=;
        b=QXFJZQwRLIMSSuTk2v9qxARzzHIfvDOqlv5KcF12mEud9GjKJ0O73ajb3SQdMybpDv
         oj7un2GxScJgTsFSnDJtE9btXBbT+kpm9JWhnPHOkTT8cBfcG6GjYfzurq3ewlThW9FI
         +4JwE+vJo1nS5H9wsSRM4ioP9WzY7bzPaaL1kY0nd7Z+CmctRN7IJIWwACtYhlgpbIK6
         98RFxoTukLltEGxm5CUEtXUbG+XUWeZtyLzGoUTewv1dpPAjmFm/FStOXIywP8Mr1Tc9
         z/w9gpIs3WIR4FZRMEV39h/ItvCu5b9S4I0BNCxR0uW8XAvTm+ekOrGK+gNFI5PXo2T2
         wdMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWglRzw9lQbtILer/METG4M90soUALgyD6CH7YDSzVYWszoYyfTDxds59/JDmGDxF/X+bkZWE5GKaiKs2T1zdsrbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZulRNuEfqPKjPcx3rKd97fj3pwA/KSxiEM8E1zIKJBz73zD5j
	d7PrtKM9FZf6lzOuEWH4tvQlaZrroPPAhWkG0pUma5oRjf1a0FNKDYjm7mghJR8E
X-Gm-Gg: AY/fxX5yBNgy8FGgnkDpuzbFyZ5cc5Tr6TKpqMQF+lcpwNBSQOVXX1FLjwx+2oVkz3W
	q6+YioDiQ5yhKvr292M+gD6G0T2TGBLWVCWSmnGaybc0huopisAPSnZbIe+B4gRVGAFCYzi5sU2
	sXg7knkwF1NWpJMZ5N/HpqIumrM6p9DZ6o5ebP7408GWO4HWy7ON+B2i/2qs/KUfqy9s3fPkTpG
	EoZhNy20+Ny5fPCjxTY7H0tiPGw+RqP9QD01tKB0WKw8k7cpsCARwbsYz82qlR9tOdH6doTB95f
	W5QPB5KFqENS1XKoKzq+FlifXQRYqwmPX4Ocveb+AMu990JRM2uzhATKFFe/f5xFd5HuQfjebpe
	r6RYFiBIjEHY1OPyotTUJ9SDzYziAqkT3UZuMcqESuOfrkP/UcLSJd9PcDAiu0DQKQU3l9QXeRH
	5cMXl++Sq7nYhb397WvwD/PdBgblRtGBB85SoFJRDG59N/6vQc
X-Received: by 2002:a05:6102:418e:b0:5ef:7221:aa9b with SMTP id ada2fe7eead31-5f17f49bd77mr1438872137.18.1768408948342;
        Wed, 14 Jan 2026 08:42:28 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-944124a34acsm22925836241.10.2026.01.14.08.42.27
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 08:42:27 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-93f5761e09aso22314241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 08:42:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVHx9Lpe7aPkEWytsUXT0SJoIc6uPbsV8uqktET6gFK9oy0XIHGGp0uQwRK9dt5Mou38uFGYiwjTuSUk0OM1/4tJg==@vger.kernel.org
X-Received: by 2002:a05:6102:3906:b0:5ef:b3da:1634 with SMTP id
 ada2fe7eead31-5f17f68f312mr1450471137.43.1768408947433; Wed, 14 Jan 2026
 08:42:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124131003.992554-1-chris.brandt@renesas.com> <20251124131003.992554-2-chris.brandt@renesas.com>
In-Reply-To: <20251124131003.992554-2-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 17:42:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVRaP1JwDfxPy3LNS7FY_0pNMTBxYj-VNRiWz3c3SgTDA@mail.gmail.com>
X-Gm-Features: AZwV_QjWcqhv4BWp6yUPa3iKC9wMZIiturOyBbCVRUrZoIrQDIcjrKfTqR4MbTg
Message-ID: <CAMuHMdVRaP1JwDfxPy3LNS7FY_0pNMTBxYj-VNRiWz3c3SgTDA@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] clk: renesas: rzg2l: Remove DSI clock rate restrictions
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hien Huynh <hien.huynh.px@renesas.com>, Nghia Vo <nghia.vo.zn@renesas.com>, 
	Hugo Villeneuve <hugo@hugovil.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

Hi Chris,

On Mon, 24 Nov 2025 at 14:10, Chris Brandt <chris.brandt@renesas.com> wrote:
> Convert the limited MIPI clock calculations to a full range of settings
> based on math including H/W limitation validation.
> Since the required DSI division setting must be specified from external
> sources before calculations, expose a new API to set it.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Tested-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.20.

> --- a/include/linux/clk/renesas.h
> +++ b/include/linux/clk/renesas.h
> @@ -18,6 +18,11 @@ struct device;
>  struct device_node;
>  struct generic_pm_domain;
>
> +enum {
> +       PLL5_TARGET_DPI,
> +       PLL5_TARGET_DSI
> +};

While applying, I will move this just above the functions it applies to...

> +
>  void cpg_mstp_add_clk_domain(struct device_node *np);
>  #ifdef CONFIG_CLK_RENESAS_CPG_MSTP
>  int cpg_mstp_attach_dev(struct generic_pm_domain *unused, struct device *dev);
> @@ -177,4 +182,10 @@ static inline bool rzv2h_get_pll_divs_pars(const struct rzv2h_pll_limits *limits
>  }
>  #endif
>
> +#ifdef CONFIG_CLK_RZG2L
> +void rzg2l_cpg_dsi_div_set_divider(u8 divider, int target);
> +#else
> +static inline void rzg2l_cpg_dsi_div_set_divider(u8 divider, int target) { }
> +#endif
> +

... and this part up, just before the RZ/V2H parts.

>  #endif

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

