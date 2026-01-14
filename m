Return-Path: <linux-renesas-soc+bounces-26709-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6336AD1D992
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 10:38:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 510A530D1BC7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 09:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA4653876BF;
	Wed, 14 Jan 2026 09:32:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E71C3876B1
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 09:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768383142; cv=none; b=KF7MnQpM7wTs55TahmJMBeoNm3eSH6C7nWF06gflyCDuVOBhZnT/2XK5aSAav34aSnruD7+NyKEkvPM5oZ7gT/bOZY7LgjG7morfTI2dtTZsTUssgXCOSy2VbKYjB44Sqw5ronrtcOPYsqJv14+nOmj4YO7DkZVUu8o59wobUu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768383142; c=relaxed/simple;
	bh=yoneIDgg3Px7HEZFC9PfXSJccPcj273iQf1nmWmPzLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AVlG0edvgdLECbgfqWgmvEfYurFl5oMXLuC+cceGrz9/r4AfvRpk6gX6B6dBEGzYP1+inO6DrbSzt3FgrlOKxygjIaSInLIecYeLO23JzkUoIswUaIN/2uAaW+5LJ9NPtJHKkTK8QMS6U2GIFJnelwktX5RkEsijbnuKUqd7hw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5636274b362so1655458e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 01:32:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768383140; x=1768987940;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zDJce+CzgnUUMSOqtY7/Bi9afy0UIdZaZUJnldMOyg=;
        b=Ib4J2cLhFd/Kwp1tHBmrixuWBnP5UWF5w2oFiex2zlOoLNGTbOuySLiaF3Cb48aeVy
         pNVjq34G+i70UnLUcE5kZDpz1VBui6vzMZrEKVDWuQGAHkKP6NceOooa+DFkD6QTorjA
         LOv/2b//xPMpBmmO6Cgge32HljRzo3BlvjOyFK7sUJudNHsUt4mjzxazck/AmnV5K7MQ
         /n805zB5EUiZmIy2LXo/QzNcMYBqYQ2Hd+casj4V1zkN3riLE8Q7EN/3F1majU4+1X+C
         OwBopR2G1GHBTFcCCXNvXpcR2au64hJ9QcK1ibhEBcVpgmI4F4QQbNa3xCDZW4njeCZp
         aH0w==
X-Forwarded-Encrypted: i=1; AJvYcCXtu7jQM5YBgjLjauEGdt5l2n9TGE3EiITidC8traL0DDYI8VGJzkc2wE7ZKsbGnWjZnv98rCjqI9EaJ/lk8bsuwg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+w5/gujEJiemLRVC3vjL+lKcON6wvxURrwqPT+EicEJGu9+XW
	rngpb/gNpCv94DJcwobeBxx/n75QudWZRHDMdtIpo0zU1gabF0obtEniWBIzgPNO
X-Gm-Gg: AY/fxX4pOeEVTnW0Z3wdZCe5Ah2IWppcfQU2h+kg7rKaDZYaKGJd4aEQRElP9+mC3V+
	D2k4DRJvOwzSYH3NeTIz0JGFqTWS6yO6fzCsHTVbFwkIyPOG4jXh725bDRh5zS88J6rP6+kdtKP
	5BudYmGpqNOieUyEU4i8KoJEbr7SomyHF6mPipNNdehRIztcRuZtFV85d6+XFPHJehYUTsEXBdS
	TT1Se89IHpRk439hYyqEkAOKtreyRpQGxocEZldfsledAr3XF2Eb42yph507GLq+9wkR3DbYzRp
	Y3PWJLZ/dc+LU4mVx7Dosvn84+9RYcODHTzwidtTtVat8738LEMDsn1EmKzuXLipW0FpmV9VCwm
	Q7MRb6B7b6q7aeta4sDA3eygYD4P14SaTChowNq2LjkatZznd7nhiNy6bN3W8R+AjEahWg5ylJg
	iv5QcGU/eN9+dt9lvP+Gk3AGJMtPtZUrP/FRrFDn5OnQFAYQCQ
X-Received: by 2002:a05:6122:3d0c:b0:563:78a0:2509 with SMTP id 71dfb90a1353d-563a0a4ab9fmr650653e0c.17.1768383139881;
        Wed, 14 Jan 2026 01:32:19 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56375cd7cd6sm11938786e0c.10.2026.01.14.01.32.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 01:32:18 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-93f63d46f34so2633240241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 01:32:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV5VgH2VMPLMk/nS4J3h4IfywRuLBHcg9aT7dhjYppOoLrQPFbH6ER3sfdfYYfIlsO6YUE5Oi/fkA6fwjyjohI3hA==@vger.kernel.org
X-Received: by 2002:a05:6102:3f11:b0:5dd:b2a1:a5a4 with SMTP id
 ada2fe7eead31-5f17f3f0042mr733928137.5.1768383138240; Wed, 14 Jan 2026
 01:32:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112234834.226128-1-marek.vasut+renesas@mailbox.org> <20260112234834.226128-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260112234834.226128-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 10:32:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUJBKnqU_HtF1KpZY-75iTWjZwedLbFSYLpgDfVHGsW1g@mail.gmail.com>
X-Gm-Features: AZwV_QiKgVRnWvbmqW5MDnkyAYhxg5wrvIwNyBPnn7EJexnd8UAobHHJuJB4uzo
Message-ID: <CAMuHMdUJBKnqU_HtF1KpZY-75iTWjZwedLbFSYLpgDfVHGsW1g@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: waveshare-dsi: Add support for 1..4 DSI
 data lanes
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Joseph Guo <qijian.guo@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Tue, 13 Jan 2026 at 00:48, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Parse the data lane count out of DT. Limit the supported data lanes
> to 1..4 which is the maximum available DSI pairs on the connector of
> any known panels which may use this bridge. Internally, this bridge
> is an ChipOne ICN6211 which loads its register configuration from a
> dedicated storage and its I2C does not seem to be accessible. The
> ICN6211 also supports up to 4 DSI lanes, so this is a hard limit.
>
> To avoid any breakage on old DTs where the parsing of data lanes from
> DT may fail, fall back to the original hard-coded value of 2 lanes and
> warn user.
>
> The lane configuration is preconfigured in the bridge for each of the
> WaveShare panels. The 13.3" DSI panel works with 4-lane configuration,
> others seem to use 2-lane configuration. This is a hardware property,
> so the actual count should come from DT.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/drivers/gpu/drm/bridge/waveshare-dsi.c
> +++ b/drivers/gpu/drm/bridge/waveshare-dsi.c
> @@ -66,7 +66,11 @@ static int ws_bridge_attach_dsi(struct ws_bridge *ws)
>         dsi->mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
>                           MIPI_DSI_CLOCK_NON_CONTINUOUS;
>         dsi->format = MIPI_DSI_FMT_RGB888;
> -       dsi->lanes = 2;
> +       dsi->lanes = drm_of_get_data_lanes_count_ep(dev->of_node, 0, 0, 1, 4);
> +       if (dsi->lanes < 0) {
> +               dev_warn(dev, "Invalid DSI lane count %d, falling back to 2 lanes\n", dsi->lanes);

"Invalid or missing"?

BTW, I doubt the kerneldoc for drm_of_get_data_lanes_count_ep()
is correct:

 * Return:
 * * min..max - positive integer count of "data-lanes" elements
 * * -EINVAL - the "data-mapping" property is unsupported
 * * -ENODEV - the "data-mapping" property is missing

1. s/data-mapping/data-lanes/,
2. of_property_count_u32_elems() never returns -ENODEV?

> +               dsi->lanes = 2; /* Old DT backward compatibility */
> +       }
>
>         ret = devm_mipi_dsi_attach(dev, dsi);
>         if (ret < 0)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

