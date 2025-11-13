Return-Path: <linux-renesas-soc+bounces-24597-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E89DC59BDE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 20:28:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 416BF34914B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 19:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B2233164A5;
	Thu, 13 Nov 2025 19:27:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960522C158F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 19:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763062079; cv=none; b=BS993xglu0JfRi7fC+zZwUcTLjxTolcfVRVbGu7cux/2D1zmxCikDD7jmU0701WrnCinojv/sHJpQPPByHeOg4egFLPHovbuf9gYCT2zfNPY+kOEVv119jSCByeW3Dk5RnEE9BW/OC4FKa8SxCqs553g+ioLF3AmvQpNyVC/Dlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763062079; c=relaxed/simple;
	bh=/zYSzHIQGXXRW4bXCA8LFqV7xaT09/SFuXf711/dyz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xm25WU88KRi7OpwmdvSUpkfO5mOcfzGSZzKSHhKAHx116TSLoUi7MruX50k2/JBlVJW1iHALKR62a7gV69HrHEYwof4yrPZnbL8PsFWdI7VjY5UdlnZ6+JhXa6B8bwTNAuOABBt7gKMIW5A1gLTLDbAptsYNiW2WFFdg4EEsLoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5dd88eef2f3so449477137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 11:27:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763062076; x=1763666876;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMdRBCiOsnpuNgCxcScvg7uDy+Va+eLC4BNnAa1aJwg=;
        b=w+IC+MlUa+JUAIyXZcQAmNG3XcndjKQJqScHthPwWjpszfxoDyWi71GF6bYaz1xUgG
         UdKTnN1I0CLDSujkBKxXqI3fEycT2z6thSWjdJJvGglrT/t0Mry1B9DxD14oMV1bz9yo
         LaUYqviz773GH7f8/6a/tCgxdAB6OB5eitcd2Mu9vjodXTunwpSKRTZ/+1AjDAB9+IJr
         XKs29gC2a1NEyi1MUlAeIkT8M512nG8hqTlvaB+E9ilBPz6xZMpZ1Ejceb8Q3aFXrjk2
         KRqu079Jf175YTL41dfYzuTpgPqP4pLBwORSPfMMDKCD01zAJVDeYXVu/rfeiyEgljIa
         zz/w==
X-Forwarded-Encrypted: i=1; AJvYcCUvzRp+aEe+NFg4UXTu0ySL4JO0v3bSgGXV8ASolN2KOs2ijojwOrFsBA/vnDNswEDPi3Yi3wFzAk0CicZnMEI9wQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGLTC02AlSEZbbLbiuMTjYmg3d8M613hFK5dg5qIxfdkVE/Z1h
	r03oOOhIOsAD0J5G9L/XKLJuKyA3Kl4LcusFTkWRhdgRFiIvoBqQfjPLPkpwX18uwhU=
X-Gm-Gg: ASbGncuUt+Sb4QvoybZYPKoul2M651AuoLhiNMLtq+W/P+yyzDy4/hu61HqZQHAJYuc
	wYlBFgkoH1AIHUhp1aiRUfXVrEMO4rykooSIDAGc4vXp4xHIQMS5AKYVrzk2uDy1smkpWrFGEEH
	DdEPApikFHSlP9j8hQjedgKXIqu1LBiAJ+5eMeEGJQGaZlyxjTRd4k14BOqTk7JZ0L83G4JYLV4
	F3Xr6wYiURAdzgoQuA/S+D9PZa9IpfTSgF43nX7/E1hdjjdFzNBktoIA7AumUFT0xvv8I6yAz6k
	avpIhPKMXgEXICDzAVxqVHqAqHQMN9OPUncPzBpl8n6FV3f/SCewwqO7hIPuDaOmSKFEJP5HZ2/
	de1MDgSx6x87fpZnjI8Y7PAL9hUnYFQ6Oj0D75GzMKBNHq5AW+0ljMvSNDjZ8HYJbZQCvwoQInW
	rZn0qfQPRk6/dCJvyGiRBgrjpuDJcHU4TVpuDUUA==
X-Google-Smtp-Source: AGHT+IEig6Isf5prsInUYDP87iN9zlIiIbEHu48wdeugYuXB7IeK7gZh4MTOps7hWBGSIY3/3ipP9w==
X-Received: by 2002:a05:6102:2924:b0:5d7:dec5:b6a7 with SMTP id ada2fe7eead31-5dfc54fee8emr487413137.7.1763062074803;
        Thu, 13 Nov 2025 11:27:54 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dfb7232b16sm962810137.10.2025.11.13.11.27.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 11:27:54 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5dbddd71c46so461534137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 11:27:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWRCRjjvITTB139LBPUQ6cnSfw9vt7wkxjv01aR3jvPeCWe/6KcIYCfDwK1k8EOZvCfRt/5xSs59R28BuKDyUhnVQ==@vger.kernel.org
X-Received: by 2002:a05:6102:4420:b0:5d5:f6ae:74b3 with SMTP id
 ada2fe7eead31-5dfc5b976c3mr493792137.39.1763062074252; Thu, 13 Nov 2025
 11:27:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1762773720.git.tommaso.merciai.xr@bp.renesas.com> <160371c0c5edae1fd3d66355f0b0afdb34de9387.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <160371c0c5edae1fd3d66355f0b0afdb34de9387.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Nov 2025 20:27:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW3+78AL5F09PU-cENJAqma=QCTmRCSe0KzANK08QJRmA@mail.gmail.com>
X-Gm-Features: AWmQ_bkZqJFa3uvpGVKoyugpRyy1_JKWhk6NdNKCvuhef6cwYY_WpHE4vNiMjpE
Message-ID: <CAMuHMdW3+78AL5F09PU-cENJAqma=QCTmRCSe0KzANK08QJRmA@mail.gmail.com>
Subject: Re: [PATCH v3 10/21] phy: renesas: rcar-gen3-usb2: Use mux-state for
 phyrst management
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Rosin <peda@axentia.se>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Mon, 10 Nov 2025 at 13:10, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add support for selecting the phyrst mux-state using the Linux mux
> subsystem in the R-Car Gen3 USB2 PHY driver. This ensures correct hardware
> initialization and integration with systems utilizing the mux-state device
> tree property.
>
> A temporary wrapper for optional muxes is introduced until native support
> is available in the multiplexer subsystem.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c

> @@ -948,11 +949,27 @@ static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_chan *cha
>         return rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(channel, enable);
>  }
>
> +/* Temporary wrapper until the multiplexer subsystem supports optional muxes */
> +static inline struct mux_state *
> +devm_mux_state_get_optional(struct device *dev, const char *mux_name)
> +{
> +       if (!of_property_present(dev->of_node, "mux-states"))
> +               return NULL;
> +
> +       return devm_mux_state_get(dev, mux_name);
> +}
> +
> +static void rcar_gen3_phy_mux_state_deselect(void *data)
> +{
> +       mux_state_deselect(data);
> +}

If CONFIG_MULTIPLEXER is not set (e.g. shmobile_defconfig):

arm-linux-gnueabihf-ld: drivers/phy/renesas/phy-rcar-gen3-usb2.o: in
function `rcar_gen3_phy_mux_state_deselect':
phy-rcar-gen3-usb2.c:(.text+0x37c): undefined reference to `mux_state_deselect'
arm-linux-gnueabihf-ld: drivers/phy/renesas/phy-rcar-gen3-usb2.o: in
function `rcar_gen3_phy_usb2_probe':
phy-rcar-gen3-usb2.c:(.text+0x7d0): undefined reference to `devm_mux_state_get'
arm-linux-gnueabihf-ld: phy-rcar-gen3-usb2.c:(.text+0x7fc): undefined
reference to `mux_state_select_delay'

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

