Return-Path: <linux-renesas-soc+bounces-22189-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F55B949C8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 08:47:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B94453BCFE4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 06:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6255B30FC2D;
	Tue, 23 Sep 2025 06:47:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA26A231C91
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 06:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758610038; cv=none; b=u3z+1BQFKigRK+3RhKhv1oi+kjceTJAPi7fqtY2t3REIcOfmTzr6uTecR8nLGeTK/xTBYWLJXGMHOjFGIk8KAdJTOblkQ2xNCCegf1ww7vkT4i6p3tqI1mPmhR6KRrvppNNX88la52DJBfMM68AbGUBD2phG4OtU2vb5DClDd9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758610038; c=relaxed/simple;
	bh=2LzdFVxCXwCfJ4ulDN7WItQnbdwjYVISQX81SvmdtTU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lvqe2MD8nWVSNK6tB16hdxN3ny2bvGr7zenI0PfjU/9F5DnDH48+Dhr5Oqs/hCOd2V8ABAKpWwV4Y6In7/+kcwyEdH0v+JyhkXTFvi7irXO6e7rIXrB7DzfSCOiycIzRlUK3jlaJirKkMqVMZHRdjq8q/yP1InffbTK4NXkP4JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-54bd3158f7bso53237e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 23:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758610035; x=1759214835;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MrqmRbHxqTgRekvhDXdBEX/h9tK7W2RIqWha/LWNLSo=;
        b=QY42ov3TTPC3NVI0xoTVXUdVWXV5v0RWD5zhdg+hYUklN7l+DKcyMhiFs5tdSH539R
         kJq0Lf4U3m4QxLfvpjamgqR5qf0ZnPKN2nn6EL6OMbWZXJUiL3aBOy+NauQWQAbVpapx
         u12fqQ3t/urBf8sBFRc9RlEUZARopSUe5J77onER+kGG3r4XPOlSIAFN94Xw50ajD28Q
         UX66zio32unnV33YOmOMlL4idn5TnS7K+z/lQ0D3lBEL7g38dv4DWa24eniqGid/X3s5
         1ZYx5X10ifDe61Eweul0chAFk3qLOU1xBdN3oXRFHkgvTqHBtlV1ohV/DHiIics+okoM
         ZDdw==
X-Forwarded-Encrypted: i=1; AJvYcCVmnRCgZeaTGnWHcYej65FPH1yGpkdWQBdZM8CkWpm6NLexXSYsKrfpnnxmJ+QkZSGjOPSM6iHJFFTPxVbJUeFKkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgkvMJcRWjtpQKgW3RhIMrAylpS4odplq33y3tl7FaHCns5VHk
	sL9DZCfhTnearqw7lyZWT0ZsEirXkqh9eAl9uIpQmGnPht4u10YNvuCQcga6c4sE
X-Gm-Gg: ASbGncuAQ75iIaSGFpSnngLH7jFXOB3XG7qpVL65fG7z58PcFwo+V1v4GrlEqR0xcuS
	V3dBQE9Iw/A1wJwdqH4IWCnCTuilV9RrVvkgtWRKCnd56jtG6ybew10VFuRNWNF+WbAzCGasEoH
	9efGDX9E0i4KoI6sEHIhATz2/D3pqD4m4CJSHxpGr3Tgpf8KInZK9mEkO0o9tVra2Ci27PJ65G7
	c7psMUmBgLx3/qIyP9droq/bp5RkEdcrH6GjnywBMHYGVG1yoJ3TwACzuh9lIJjXRgMPhLXz9Js
	c10hcLZt+g91gzm53Fq7O5JxRP2/CNrVbDsugD3EIErxh8QamZO4kRdk9UqtpWsXQAM/CRdHugE
	QEsUtYrKlNnDa9tRUhFROqspTrGwZZuqvtc7NjZTO3Bp14UC5QhMPfXB8wHmAem/H
X-Google-Smtp-Source: AGHT+IHj/dvUTnONVcRB8f5EXR1dtVJXjaYo9e20kIjSgLeJlbYgpSiCuer+DP8GguI52gQkuCHryQ==
X-Received: by 2002:a05:6102:4488:b0:521:f2f5:e444 with SMTP id ada2fe7eead31-5a5787b01b3mr620356137.17.1758610035525;
        Mon, 22 Sep 2025 23:47:15 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8e3e5dc2f2fsm2470254241.7.2025.09.22.23.47.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 23:47:14 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-54a9482f832so2071971e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 23:47:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVb+mGpG7rrn0kToWq7jq4Lajt6YBBiaAuybJTCbYsLzKy2REROhUIG4/iPPIrrLunGlCR+xXDgT1wqLXzlaHGcKA==@vger.kernel.org
X-Received: by 2002:a05:6122:3122:b0:544:9313:8387 with SMTP id
 71dfb90a1353d-54bcb245adamr531248e0c.15.1758610034331; Mon, 22 Sep 2025
 23:47:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org> <20250922185740.153759-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250922185740.153759-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Sep 2025 08:47:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUqzfGb0ehdXjdmbZfZ9XVoHMjL8y0hoJ-BYLEkLepP3w@mail.gmail.com>
X-Gm-Features: AS18NWBbqJdzROVb-R_5LsREkzO-QMxyulkUW7pFQYzo2rYa7Cd6WwBB1tWZSMs
Message-ID: <CAMuHMdUqzfGb0ehdXjdmbZfZ9XVoHMjL8y0hoJ-BYLEkLepP3w@mail.gmail.com>
Subject: Re: [PATCH 2/9] drm/rcar-du: dsi: Deduplicate mipi_dsi_pixel_format_to_bpp()
 usage
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Mon, 22 Sept 2025 at 20:58, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Call mipi_dsi_pixel_format_to_bpp() once in rcar_mipi_dsi_set_display_timing()
> and store the value into a variable. This slightly simplifies the code.
>
> No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> @@ -449,6 +449,7 @@ static void rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi,
>  static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *dsi,
>                                              const struct drm_display_mode *mode)
>  {
> +       const int dsibpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
>         u32 setr;
>         u32 vprmset0r;
>         u32 vprmset1r;
> @@ -457,11 +458,11 @@ static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *dsi,
>         u32 vprmset4r;
>
>         /* Configuration for Pixel Stream and Packet Header */
> -       if (mipi_dsi_pixel_format_to_bpp(dsi->format) == 24)
> +       if (dsibpp == 24)
>                 rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB24);
> -       else if (mipi_dsi_pixel_format_to_bpp(dsi->format) == 18)
> +       else if (dsibpp == 18)
>                 rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB18);
> -       else if (mipi_dsi_pixel_format_to_bpp(dsi->format) == 16)
> +       else if (dsibpp == 16)

What about using the switch() statement instead?

>                 rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB16);
>         else {
>                 dev_warn(dsi->dev, "unsupported format");

The current code even has a default case ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

