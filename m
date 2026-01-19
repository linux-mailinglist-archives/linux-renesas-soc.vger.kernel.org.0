Return-Path: <linux-renesas-soc+bounces-27053-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D283D3AFBE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 16:56:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0982830006E6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 15:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB2038BF96;
	Mon, 19 Jan 2026 15:56:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0B038E118
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 15:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768838200; cv=none; b=unyZIU7bn+ozWNh9ptg1xR8pichNRNuCymxxcPrRRxuDtCTgJEifFxb/9/06oYsKVb+x4MJQ35zitjffyVuzbEPM2inaYVOTVP4ssTG0DLI4/XUfF/yLlu6SycrzikoqhZA4l1FcQPSVygbkdCOjh/9B6r3JIRe0j8U86+c5I1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768838200; c=relaxed/simple;
	bh=Dp97EfgvlxD7c5USj7Zd8TdA26s/fLAuRxZfKhDVn8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ulxlOSbpZZ3u0frMh5PwBhjrXBUtkGFld9xIjaHoSLUOrcYqPdm856/tDjoyb1HmWc/7j+Wgz7lacq7RhIf7YV1wesSPno34QqD5JygUrGU1YENDMH/h+BDXMDR/5wwuq7aCSSDLaazLSUAnzDAUMQ+B/Z7JFYS8vof/XBOhnfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56373f07265so3658696e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 07:56:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768838189; x=1769442989;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lIG0R7dTQh7juPXtId/WkTt26c5+hMUHXl8ZjoaDDHE=;
        b=ZGwK5DEycBrLOZWwPVZ8RzetWnQsOL5xmawQlw4e2yu7JWy8ev5QXdtrylaFTL62lm
         9HrZjA/iLZH2e4BkNohPlP+YUtJiInH7kUrvJeyPyF/9EgQztyhUETtNma3jUBm+PTmV
         xSTMAVZ3T//6zsCOqnQ3i1xoVGg7iy3uD7v7pP8dHj3IDBTEKl4fIHsmXkHHjuVLD8ZC
         U9QFkgSKvppIQy7iymB1pn0QAHFTIRHynoZapmZzSJUhtroe++H5XA7hy+qov0lOtIxB
         kqFNsis7t5jpFndzoqnYEVeaQ6SH4E89Yzi+B7VxIpmEaOPFCPg6nm3NfwiCLKAfCCsZ
         FRJA==
X-Forwarded-Encrypted: i=1; AJvYcCXIn5QLTaSlaJWuEklp5qmY2SyeiUxKUNes9kjopgYvqXYo8IS1ddf75gSAgE/vF3pXrrTOUH10NnPP/ULfiBJwuw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlk1xFU1pKLOtJV5UTvC7zqkesD+ztFM72f9gRIFRs7/fHXGUu
	qkR367wzxoFcLju099PyQKsZCO8xtAkzvPwSEgp6kQGlqG0ONKlcXImc4wZBftpJ
X-Gm-Gg: AY/fxX5ZCIo34qjzeuuesxLlnYq90TxqsUBDFAZLABN55RgM8HnOrwHsY/VWClOFJFa
	GuJ8eQfa7MTenFBS7itCrpaaiRGsTOgCjqLTU4rd+QWzzfdd6A8JS8nFFHQDKcijurd18+nVFl0
	XHLlj9kvDa1yo7tfIYbxBHLkVq7KiZ4ctWVF1gDgRay3MtD6wJEKFlmBgU6Ad5pbPDUSrE33T4c
	jgAm0oP3I33f2iCEeNZjzh2Dqkke7k0N7DvncebzTt3w+4WrClabIc4iYXuVLYalAVr54p4X9/+
	c/LyR9RrSmgqJEkTjJ+s4V5evW5UNJJpDHXXZz7q34V1EiPVohWpHnpXYL8O7z+BPit5QTKyvC4
	z7kcXMc9b1CeZo0wf6PMdfed9g8kgjX5Rwb5HtAt6RWrefhIzJx3uzml3kZTUIKMzlRg+oAgSK+
	Pz4D4VbDguK4z2G9WjRAs/ctMEE+5RbaGe6pLIvRScWik2Fm8y
X-Received: by 2002:a05:6122:4589:b0:556:9cb9:65cd with SMTP id 71dfb90a1353d-563b5bc906bmr4038639e0c.6.1768838189055;
        Mon, 19 Jan 2026 07:56:29 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-563b71009casm2800391e0c.16.2026.01.19.07.56.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 07:56:26 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-947fcfc81aaso154948241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 07:56:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVWrp6o4P3IFiQs89tfhxDRDO/OFxBMsgSUjtnj/d6bdqn5IhBJG9c/3OVOT/f0yq+BbNqQXIPs0/VBn2Ww8bJVkw==@vger.kernel.org
X-Received: by 2002:a05:6102:d92:b0:5ee:a04c:7ea8 with SMTP id
 ada2fe7eead31-5f1a4dbb696mr4034214137.11.1768838185442; Mon, 19 Jan 2026
 07:56:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260117005028.126361-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260117005028.126361-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jan 2026 16:56:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXHKJYcP78WLUfGrN8v+PmChj7jEsjhnVXYnSOzZ7mkpw@mail.gmail.com>
X-Gm-Features: AZwV_Qi7XL9IrXJqTbj9Y3MASXIhOVDU833eXHPX6YIuUQHpjkdHjq-l7kFo-k4
Message-ID: <CAMuHMdXHKJYcP78WLUfGrN8v+PmChj7jEsjhnVXYnSOzZ7mkpw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/panel: simple: Add Waveshare 13.3" panel support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Sam Ravnborg <sam@ravnborg.org>, Simona Vetter <simona@ffwll.ch>, 
	Thierry Reding <thierry.reding@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sat, 17 Jan 2026 at 01:50, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add WaveShare 13.3inch 1920x1080 DSI Capacitive Touch Display support.
>
> While the panel is described as DPI panel, it is part of a larger unit
> in non-removable metal casing, so the actual internal configuration is
> not known. The panel is attached to "waveshare,dsi2dpi" bridge via DT.
> It is likely that internally, this panel is an LVDS panel, connected to
> ICN6211 DSI-to-DPI bridge and then another unknown DPI-to-LVDS bridge.
>
> Current device link is at https://www.waveshare.com/13.3inch-dsi-lcd.htm
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -4998,6 +4998,33 @@ static const struct panel_desc vl050_8048nt_c01 = {
>         .bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
>  };
>
> +static const struct drm_display_mode waveshare_133inch_mode = {
> +       .clock = 148500,
> +       .hdisplay = 1920,
> +       .hsync_start = 1920 + 88,
> +       .hsync_end = 1920 + 88 + 44,
> +       .htotal = 1920 + 88 + 44 + 148,
> +       .vdisplay = 1080,
> +       .vsync_start = 1080 + 4,
> +       .vsync_end = 1080 + 4 + 5,
> +       .vtotal = 1080 + 4 + 5 + 36,
> +       .flags = DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PHSYNC,
> +};

That looks like the plain standard 60Hz Full HD mode.
Is there really no other copy of that structure available in the kernel?

auo_t215hvn01_mode is almost the same, except for .clock and .flags.
drivers/video/fbdev/core/modedb.c has the same mode, but in a different
structure.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

