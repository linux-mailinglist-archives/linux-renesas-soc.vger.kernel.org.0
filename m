Return-Path: <linux-renesas-soc+bounces-23151-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A19BE3C38
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 15:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A522B58748E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 13:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FE9B339B4A;
	Thu, 16 Oct 2025 13:42:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939A6339B30
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 13:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760622130; cv=none; b=rgwDKVO+6eo4Be+b2WE494kyPjMhBri8+w7C9WS7IjIYeNdx/PSyvoQv62c7swGYXckLck7emmCBNU8MFrQUQ12Kw8w5bTUoDK4YHlMgRCyxCSDI6T3vcHpGMGAk5SZAUI79dZj7QeeDpp/DNr5YOTd3bU7FYy4HtWtFrLiq2hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760622130; c=relaxed/simple;
	bh=fJlAd8F8EmfNdA9ffCw/7YWJBisZ2aZJ6bgML77jXw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hPlae0YpVKEeYROe9E385lIpcYG7nHkG7RnXZZbEnK5jIXih7JQY39mVsc9YZDAmeiTSi8/v9kmQoNyQkC8LDFkrgroiHOCWeFUL9RDcxPtZJosBd0YO1F5FqX0E6MAqxzT9uJrbMxrnhHcNkaOlcC1Qtc9/sSV8FHmsciL2v4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-54b21395093so474455e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 06:42:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760622127; x=1761226927;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tIs3qdLP3F/YAW7YsgnmPdGp6LZDuxUynC8+HjYB7O8=;
        b=V2WvxjyGhyO7US5JHlNXbXZ7OvUJ0Bt+zXKZyHVap3EncOlGGmE08uGE2CzhQyRnw+
         GlpEZ9a9mq3wox+0rkfQxZGVzCx8tCyhLDskPNayXRaJrMSzWo7OJzdL3fv0+xYo3aMj
         c9EG3F9CamnIVpPI14+vYIUzUS9r6xQdM8disJzIf97RmDPLQLpHruREGS/RQixlTIlf
         YjcuoQbrp0H9FSLwPl56aOL1bFmFxcEWZ4ZuY8w6YkOmCJcsy9SVGW6cLO5OqG7PAhwo
         +ZDO3pYaTAkbxkOnMWOOLXsPci1MufLq83Q5qSvwmPs658G4AzA1WGwZEvnFp+NLE/At
         y86g==
X-Forwarded-Encrypted: i=1; AJvYcCUnpb0fhCt2L/J3PcfRPwBLBNLYv5MJ4dc4a4lmTw/Uf5cD+wTNFfoh2pW1NF2AG/dHYbR6J83YQQB8jHDasR1oUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyFeT2gEKCT7IJNqex/IszMcxmGWxWeEkb1hC4vtuJhGBS2MI6
	NFyeGZatc0sC0AmQ1P6QzbvoVgN1/EAWY/c/tYtKAo585u6e8c70abOHG2hsTesW
X-Gm-Gg: ASbGncsrwJ2BXXpl9BWwoK8XH9SrahYmcS1S+vcIo7f+jI9rE7RiELLw+ICcGotj4xD
	7pNIjiwbye1cngoB/1PWwjtBmh/b6fz9A3aA6g1FLnpo5tYnn/oLrXECbd9pRz3+egrzi5obTMg
	3Xduyfqzakf2XXVvV7+ek2JLxAQv5fynJFplpvjyu3UakXfyIbxNbPTkcACcuYWruN1qYg+lCxx
	LYaDBOsbjHfF8BTKaJp3TP4t+uq6po5UBYIJJBXd5ktsVdZqR6k5jLbiLTDQMdwsKKydPSBpjTU
	NFnPs02Zzyanb5yvJi/e5gGfFolfu3ae5baPJ6+qYrIG8PsLcvctBssD3Z015hZtTLOEvwsiYb1
	A3jdJOdUeUTTRldW9AaWNh3roSw+aLJmNQJt4kN23Bi4RIZ0Eb/inbdKpDdR+eeUtK0mW2IO6OA
	4kTxKLRLxrCnscn4MnxcCUjx/YfJHWGwWB+ohAvFnD1/15U+4g
X-Google-Smtp-Source: AGHT+IGJQ0iYasFOUpOTyovY4UByXHnpbFB1uKcjZ+JT5DazCmqOSqpRq5PTbRjpUNSD3HUjfwcDtA==
X-Received: by 2002:a05:6122:6ab:b0:554:e069:d7b with SMTP id 71dfb90a1353d-5563feb71d6mr1185910e0c.0.1760622127250;
        Thu, 16 Oct 2025 06:42:07 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-554d80fdbd5sm5971677e0c.22.2025.10.16.06.42.06
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 06:42:06 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-528a601a3cbso1459451137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 06:42:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWF4tK4AUT5p1F36astf24AhDiaomgcKv9Hr16BJS17b2Lob/TtR7dLu7OneIdhA7/q4KS8W4pufQPGSuQEngmdIA==@vger.kernel.org
X-Received: by 2002:a05:6102:5088:b0:5d5:f6ae:3905 with SMTP id
 ada2fe7eead31-5d7ce7f9f8cmr1588639137.22.1760622126274; Thu, 16 Oct 2025
 06:42:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250912142056.2123725-1-chris.brandt@renesas.com> <20250912142056.2123725-2-chris.brandt@renesas.com>
In-Reply-To: <20250912142056.2123725-2-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Oct 2025 15:41:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWEjUzpu_-pukUxHBFDqw_+xjE9gy4MTKz-39bwDGCuTg@mail.gmail.com>
X-Gm-Features: AS18NWDpgOC-c34fem89ycndlFrZkPR3jTMZt246SCjZMhsihbRFxV1WKYaC9YE
Message-ID: <CAMuHMdWEjUzpu_-pukUxHBFDqw_+xjE9gy4MTKz-39bwDGCuTg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: renesas: rzg2l: Remove DSI clock rate restrictions
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

On Fri, 12 Sept 2025 at 16:22, Chris Brandt <chris.brandt@renesas.com> wrote:
> Convert the limited MIPI clock calculations to a full range of settings
> based on math including H/W limitation validation.
> Since the required DSI division setting must be specified from external
> sources before calculations, expose a new API to set it.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Signed-off-by: hienhuynh <hien.huynh.px@renesas.com>
> Signed-off-by: Nghia Vo <nghia.vo.zn@renesas.com>

Thanks for your patch!

> --- a/include/linux/clk/renesas.h
> +++ b/include/linux/clk/renesas.h
> @@ -33,3 +33,7 @@ void cpg_mssr_detach_dev(struct generic_pm_domain *unused, struct device *dev);
>  #define cpg_mssr_detach_dev    NULL
>  #endif
>  #endif
> +
> +#ifdef CONFIG_CLK_RZG2L
> +void rzg2l_cpg_dsi_div_set_divider(int divider, int target);
> +#endif

This needs a dummy for compile-testing the CONFIG_CLK_RZG2L=n case.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

