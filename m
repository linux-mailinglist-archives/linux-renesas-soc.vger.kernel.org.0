Return-Path: <linux-renesas-soc+bounces-26748-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B106D1FAAF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 16:16:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4D6CD30049F8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 15:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DC46A945;
	Wed, 14 Jan 2026 15:15:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F76928851C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 15:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768403733; cv=none; b=QBTBxOz6yYBCkNraM7lSyP/ZY4tgBXZzrs7nFVaxkX2CIzUl1z1+a45YoU2U95tQnA+VHl5T8GitmE/FFsM0wikMYVuAkqwR2bh//ShBG5nY37jMyjBYhU7M2y1xYRCoHf6juyCEQl6dp1oyx42aaSdcSGoDhI6W6KG3AnrcrTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768403733; c=relaxed/simple;
	bh=G8RYK+aX88sOsP16hmOe0deVsIEt5mGBHm2uBkX4C7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tORfe3nsumKB+mHgksi7omEXNgt9dUAN5gyZ612AEh+Z3jghv1UNevSbENxAFNt7gcaRlJra+xVl4nF806p7I6UFIrhFQMAl+f3/B+2EYLC1HXEXTZV0yhZzj90bE2vGcH78Uh9ZlOqwir78K3GMVD7879YYMmv6u85MaeHN8LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56376c3e866so2566368e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 07:15:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768403731; x=1769008531;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mAk6Po7rUczPO72n7frU+FuUdnko5VLEu/mgiUZN78=;
        b=Oym8m9Pmvn5DF48Q573qorRYzNSh2BSGjWVxwXdDEbOvDTz8ZeyA0+CPEUkURZ2Sj1
         oCOeSW/mhlar/d/9GnuuD6LS/zyQ0vISGmtfKJYo/So8uBWfwMIrpIsoaV6to8aBG97i
         P4aAl5OKdcZnHySy1nW5v7hXAYWjMS2BT6uOzV/IE+SZ7ychVz3u/kLScLVXyLioSqgM
         reBk2OWG2vtj0MYavuoqYZYrkyKIXqfkB3x9fHshaB7lTv86B5cuoZWEwlEv9gwcvvLR
         U0WHT73arMyqKxA7nh0Rjkou+TjYRl7bhAqhXvgWCuUtIsCIs8gQyLLG3XJVWlxynaoq
         JpOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdvRiUoJbTD8PB39mrmqlGu58DuJi57h2HkCF5PfayGIHz81t7HK9ao202JzCSjHzJf8SsZo6QFyfKzh8YN1ni8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3QVe0EERn1KrERcZDBk03ZGWZNy8izekrHZCL++gzb0F0PorN
	uHAv3qNCMw0S4I6rfTj6twkVhFwZZf1bS6y6t0oJ9AkKbAV4U3uPx/SJlzkGko3N
X-Gm-Gg: AY/fxX7XBbpnmqL1uUPXYa41sr6vmp1dh5hXFca8Rycg2ofJl67Whh23YNQlm5Aeie1
	7/anOm3Pms7gUDQhD6I74NmWuqem/oZ+9/6+r18H2P4i+cpxOOSSk8zQe2rbf18gl8XVCAYkkv4
	vQqjwadhtc7WagXvDkLz2QBD5s9BeSts8XpaTMw4AvhPFp0HkC/AWEkCg6Dh9bhEhQLNGLN54xO
	x8iK6ge9+AvmbbBpystM7uuRjKy/ORoBPBO670ToQD/LA+6OCq8FcSf7fcEuHdZVMKuSTGM8tHT
	hjdeA4rA1z6fHhL/MEAuOBYMmfGZe+XxHVYChWDBhIKSPSl6QNTmeyXXDjrcCWoeRSKHDSvhO3Y
	qnpfYN7nRGAA+y82Wn46ig9Ul43ihY0rNl4tEjXiFPWyYsi8FPO3D5kFohOzA6pnLBScHu/6cDs
	sBMCylhs9axOJPHaG40/MpvS54BSOB0PPVksa5LVF9QWGrw7Pc
X-Received: by 2002:a05:6122:65a9:b0:559:7077:9a8f with SMTP id 71dfb90a1353d-563a093dc0emr1141440e0c.5.1768403730816;
        Wed, 14 Jan 2026 07:15:30 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5634ca16da7sm21065178e0c.17.2026.01.14.07.15.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 07:15:30 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-94130b88642so5825477241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 07:15:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU28dPYUdmpQwSgHuWJ7Yg8WQaYGFOymwHpvla1+VO2RLOYY9A+Uva7CxlCUds1bv2l+wyifz+6NJjpodNCvQe+7g==@vger.kernel.org
X-Received: by 2002:a05:6102:3e05:b0:5ed:99d:6f6 with SMTP id
 ada2fe7eead31-5f17f4a6362mr1410838137.19.1768403730497; Wed, 14 Jan 2026
 07:15:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com> <8a2f65d0888a6ce6de94e9df0bc4593b9dde107a.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <8a2f65d0888a6ce6de94e9df0bc4593b9dde107a.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 16:15:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXrnq6hA36LZVuFFpcn5eE3ukng1FnKAVYW6dz5wn3DiQ@mail.gmail.com>
X-Gm-Features: AZwV_QiK_um5XwX0Uu_MDOD3I9TuaB-CMYyAU5lez0Cp5nlWbm7lpzSkXutUdXY
Message-ID: <CAMuHMdXrnq6hA36LZVuFFpcn5eE3ukng1FnKAVYW6dz5wn3DiQ@mail.gmail.com>
Subject: Re: [PATCH 18/22] arm64: dts: renesas: r9a09g047: Add vspd0 node
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Nov 2025 at 15:11, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add vspd0 node to RZ/G3E SoC DTSI.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

