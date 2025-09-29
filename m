Return-Path: <linux-renesas-soc+bounces-22443-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93436BA9119
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 13:39:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6118E3B18F2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 11:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85A8E30215A;
	Mon, 29 Sep 2025 11:38:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12F33016FB
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 11:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759145905; cv=none; b=GBzD27Bo+zFV5GtvwESMrnbQUy4ruIm1+UQuoiNXXd1gRcvTcvN2MLKOkbc7/mDGSJZSyA1CgWt4WX3BgeexGoIdpNc/8ER/je69bVjF6kBvsohPlTDHcx94cJqYn88JJEWxssv8tyyeLFLGfutbIAA2QaZy0abBPxuXONf9qB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759145905; c=relaxed/simple;
	bh=rQxIntxCaMjAl4ZMKvmJmWmfz83LZmlH0mwttLjRCPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kTlDxPRyWUWdmyqZbUWVZebceL7eFQWmVlGqk+rPx7Rj2JBUHEhycGVqUzgk8rT8FlhB3B/9rVQCrDOqsSeNpiPWH108NNvWNKT1PahSstv5zctJ+WRW+nTviA2cnIQrc/M9rI2X21De2EKpBgqp6Yq0jyxEzQQFMkvAg3K2P2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-89018e9f902so2380283241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 04:38:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759145901; x=1759750701;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L+DvsJXG0G61gRFxkleWdib9RoQxt94Uw42byP7fd3k=;
        b=HPYoYxAF2H3846YEDAcgz43NhrK11o4uaDR20IRpZEdOfCs5mhl1c0o2pdFv4T3RGi
         YEUeJ4kp3nLZbMMvyDaQjziUFGTd+WGOU1DJnBCP+TbrVnCYMLWVlT/qPFhAjSQIiNHX
         CvYi4hzZCSHr30Zn9cjCAtF8VJbDRkIZxsoEdvXO7NHXQmKxIfjTZ8MfODGpp+J5Chzs
         0sTg4CqLyHST6yG853HB+0zkJ6+/PrYEp77C77ov69rlKmS1aPhovoC3SyiTnpJUMNqz
         iohu2j0S6D4xjaju3xNGVjTsN6BSyG5VIjKv3pNYa1w5LQDFwl2+Mb3N3pJOvTKvcQtJ
         5SPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeWizzE+N2OXgWDeUFRA6sfjeuGQbdLwwvTJ9+LSZ1bnYUG8VbtwalWgc/zUZTS5j3ulEGepOInfnRaY4+kVwJbA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc9N4Ngo8NWlUR6xANU9IlX7yxIp9oe5PgXIwRHvv6QtuW7u2Q
	clvMNdYpv9tUpdoux5Z7Iu6QlsYSv9U7CyuE6gFzaPCUPr58UzdY0cSRh7uJeWNP
X-Gm-Gg: ASbGncsKCYEnkJ0xjjz26BXoOk1se2fbAYSlvY7FF0uAhRWcVV7wyv/R81ieXwVh1kn
	g4u0kn1gzau0r04CY1dSZr4we9NznUEBWJv1LXClOMFQlVy85DhHKoQ9087xhiG+iXVGqTjYK1d
	9cww9jD3YHwzIpPIOzJwcgTCgdjahtZROD3qqofaBvGLor2GB+Bdst03w4Jm53Ud23my9Bk436b
	NX2p8ZnSeYmzDIoBzSaYBeTzz3hKY20OJsY0Yq+zAH3X5R8qw5s8u78AvMPRZX4aH9eSszc2nUZ
	2ZTT6y2lU2kfTZENmDSt/vhNLUzbVxgx8n8vgAqw4i9SRbIItNUHurfTXaccxRPf3Aad5ElhoVq
	BkFF0Ku38WZgedqqXDVTnK+V81d6K/9YOtyrGVCb0xFXJjEYlONeti8DqW76t
X-Google-Smtp-Source: AGHT+IFBPsECDvREkJUkZWnJ5iV9iDHSfWQ14OqW/c7TH3A+w6K0RWO77eRHr58/dKJIIJuimXsDSA==
X-Received: by 2002:a05:6102:3051:b0:535:af8c:ba4a with SMTP id ada2fe7eead31-5c88ea57d1cmr1159679137.0.1759145901344;
        Mon, 29 Sep 2025 04:38:21 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-916d98d76cdsm2239258241.16.2025.09.29.04.38.20
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 04:38:20 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5a0d17db499so3855037137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 04:38:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU2zBL5WDDGfFDWfc/oXXMaGoden7bBUORs6rQfKHfQ8+Cb8R/GXla0mrNo4imxic7gy5uMM4gukz5+0WFWVnKPng==@vger.kernel.org
X-Received: by 2002:a05:6102:32cf:b0:519:f3b6:a1ae with SMTP id
 ada2fe7eead31-5acd10ea445mr6745656137.22.1759145900183; Mon, 29 Sep 2025
 04:38:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250810122125.792966-1-claudiu.beznea.uj@bp.renesas.com> <20250810122125.792966-5-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250810122125.792966-5-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Sep 2025 13:38:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXhgGGYAYnR1cgWVtFCdHEQZWmfx_KY3Z3keDHxTp_drA@mail.gmail.com>
X-Gm-Features: AS18NWDeDP8x0wSmUHzwgi3zdRuByvOv6E-OXpBdrFgnvBXmf6gvI4PDDQHxKx0
Message-ID: <CAMuHMdXhgGGYAYnR1cgWVtFCdHEQZWmfx_KY3Z3keDHxTp_drA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] arm64: defconfig: Enable RZ/G3S thermal
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, p.zabel@pengutronix.de, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	niklas.soderlund@ragnatech.se, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 10 Aug 2025 at 15:03, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Enable the CONFIG_RZG3S_THERMAL flag for the RZ/G3S SoC.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks, will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

