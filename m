Return-Path: <linux-renesas-soc+bounces-20703-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2978EB2C4E3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 15:13:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83C0E244185
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 13:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E38341ABF;
	Tue, 19 Aug 2025 13:06:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791B532BF46;
	Tue, 19 Aug 2025 13:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755608771; cv=none; b=GRoMfolABe0C352KykQcjLfRJiYJ6aiw9pWapn3ZHNBpcBAko+W3Ql7X703jT6ruSHEmO0JB+sdaFU+Ly98NPo6Y8tDGP8EukqbL/brFY/8ayQusLY+nlWLSfzU2h1yEaL68MT3pXyVrb7Exx8XORJ77sYWebNiTNkKKu+sus04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755608771; c=relaxed/simple;
	bh=cRFojcPNllV40ehqCehsEpGuU/MxDG/dFERecHjiEUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TP8n45xi/PmadwEUQtszw14y4gP6wgeK4WNA40lDmFJXIIHUIq8+En4mMFT3G7wKikIA10+XqbeNi5zEZ3Hux1VJSdVo26ZlYu+t3BtXm4myyfC1ydHgJ/dLr724rUEmwGclroQzcYkG8YeUavhBF6bylAyLceNVGx1D7Vsz3fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-53b1740154dso3673537e0c.1;
        Tue, 19 Aug 2025 06:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755608768; x=1756213568;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8XOdfZsHoyTBBC5eTa1c4VcrP/Xh4XLwdxd8CP9jAi0=;
        b=K3cB106PQu1tYqJET32dmDR1ed1dzh99fQ5yEjUDsx5Eoc1xdmuRYpI7FYyt99+pSS
         rHU6cObniE7bqgugP7OHBu3cvSHcGYq8dBRD83IRF1jJWN1ivSd/WbeLAqIbnqFtySus
         Q9FIJFxIHl+Z7MHVM3UpWXFoEe1eJ6BOVgoibQ8IXPEjoo4lXIDk1o6fsBCD/R/nNnq9
         6KDKqLgqOcw+cZ5hpeA5WUIgCHkwLw8nhdNdS24WR8yOqPhBvDP4v7h8bjyyOwJ8VWCc
         zyYWVuoG4DgFli9+SfKL2xfSmc2x4WLxv3PLgnFFyFiLUi0igkLQ/r2ySZXPoRyUKB7+
         o2UQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5uombveublmyXy1mucq7SouQsu9NB5GhT1gro+7TVd3nhwqie6E4BYl18L8Xl950u5F/Ig5kAJuU+@vger.kernel.org, AJvYcCVftBj0o4wGyLaHVZ/JDaDlkMKqLaYds9fxa0Ru5G1ta8mc8QyJ42QlYxsXkd7gCkDMRRyi2vghbn66l3qggaZYNu4=@vger.kernel.org, AJvYcCW40lRZ/jaSCMqYwC75Ce6T6GCc9r5V0vnpbmaq95ntrH8WJwQGboyeHcH1kPyAhrNukEpxVAExXWs3@vger.kernel.org, AJvYcCWnHWjKSka4rIfG8S2E9qi6FBWJs1M9qBHqKsSYypK23mgBKZ20Tggl1gjgu7PtvDapzWl2Qn6ZgSIPADRu@vger.kernel.org
X-Gm-Message-State: AOJu0YxlzHFWy2QxooLMyO1J14DfLjWSJkL4OC5/qHAozndKY+TaAQrm
	N3w95RjKBhgQL9dA1okqCyfqrVHnOfgB4iLKQYVrAXNXcjOuUuTClRpIz4gHPmPH
X-Gm-Gg: ASbGncuNNonHo1xlCnvBsskcqldZfipMtQSoLt1/7PBPBjjeXq0wK01UAE+lbg5b/kL
	u6AriorjonvgQdBsYCXjbOE240Zqz3vM29uFUfQReQLudGFzfN93tnmk4WK6yBroVM9wVYGL5v/
	4MJNhUd4lZP1k/dN0Bp067ZY02lcPfju7dOhzrRU55mQ7vbLxCdCS1blD4JESzi0FlLXcA8LueN
	INfjO++pcwSjyq1KrVx1ARzIjzR2emMJBP7dUXWmATZ1NcCiJwNC3dz+U/FV2GYMrh/zovllZSB
	DBo0X1g8zu91AYIDyC+cOdJfAXRC2Vm6H3InvLduUxZiMePibEoEGJzZcinvd4ryIY31M7i3u2z
	KlilupF+RdGIbtrilNhI5n1M1Sqrdfs7vNnadqzZkYrQuOZ/Enq8sG2oUvlTNwOSpGi3Eacc=
X-Google-Smtp-Source: AGHT+IH8JI5kcbwxb0nmuwhaK0Vfx4/7mxZOTMEcvqZanF3GYNy9KpIkQyd3iaYTg/8U3zjX8MbXdQ==
X-Received: by 2002:a05:6122:921:b0:535:ed79:2aed with SMTP id 71dfb90a1353d-53b5e5955b7mr872314e0c.2.1755608767803;
        Tue, 19 Aug 2025 06:06:07 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53b2bed931esm2528042e0c.20.2025.08.19.06.06.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 06:06:07 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-50f7e78cc12so3672173137.0;
        Tue, 19 Aug 2025 06:06:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWPdJ4H7LjsfJNs3Xz+0911sApXx3mzWeu47ekRKs5SV/bLxCn+NXsDRPVnZJU02lE45cqH65Yp1ouo8emsQuI/Qk4=@vger.kernel.org, AJvYcCWvKegN/ef58vjWojEiVqjWSrh/M/5x7SRS9xuYuCtfuKJNrQRGYp0pmyAq5rMOfYfKnh1Gkz/wMFMq@vger.kernel.org, AJvYcCWxW+eACyb87ChQfU0J2GaabJ+DOAIaylvbNFzTGxbDC46awa0wsAkvL68Q3WrH873HvU5mUXFOiqzB8oCq@vger.kernel.org, AJvYcCXpWcbZ1Mm8RlRquAxL9DLPDJJiwighAF5DyjmIYkGjEGfjO85mLwbJ1nBus7kjHfHe5XuYBoO7xLnJ@vger.kernel.org
X-Received: by 2002:a05:6102:4a97:b0:4e5:5c14:5937 with SMTP id
 ada2fe7eead31-51929a19afbmr863928137.1.1755608766525; Tue, 19 Aug 2025
 06:06:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250728201435.3505594-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250728201435.3505594-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Aug 2025 15:05:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXTfz5mBNLNTwGjzuuVV5L726a2x_penD85524X5GsXjA@mail.gmail.com>
X-Gm-Features: Ac12FXzFxo0dVvYfSvWWErtn55ptRVL7u8GTkaX8Cq25P7cD0mfdKfGkkT3ZV4I
Message-ID: <CAMuHMdXTfz5mBNLNTwGjzuuVV5L726a2x_penD85524X5GsXjA@mail.gmail.com>
Subject: Re: [PATCH v7 1/6] clk: renesas: rzv2h-cpg: Add instance field to
 struct pll
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Jul 2025 at 22:14, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add a two-bit "instance" member to struct pll and extend the PLL_PACK()
> macro to accept an instance parameter.  Initialize all existing PLL
> definitions with instance 0 to preserve legacy behavior. This change
> enables support for SoCs with multiple PLL instances (for example,
> RZ/G3E we have two PLL DSIs).
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

