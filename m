Return-Path: <linux-renesas-soc+bounces-20705-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CABB2C520
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 15:19:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5F121882B5F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 13:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E153933CE88;
	Tue, 19 Aug 2025 13:14:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D5C311C19;
	Tue, 19 Aug 2025 13:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755609284; cv=none; b=sAsNWPk+ZW9P/3kuNWlF8+x1z/e0ZY+BhxMErU1sGkfnXHqH0SFGq0wFdeAq6puUtKme5CQRjKsjaSRmZRsnJKrrFRw8ISkh36VDW0yMFHb2JGVbXV8ygyOjoQFnsf5ha8N/yGfrGC7jTCkGNaBhlxC5Rrf6R1o9NJpJe433gCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755609284; c=relaxed/simple;
	bh=1gKMdAUE2OshcUGdUlR3ZrdbtgbJEwjx0CgIUxXGcLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bqPKt7/dAi7APHHj4ESqXci4nwGgOnxXwpitFuzGU/1KuaLrL6NPR1T5rKqaX12ca9gBQGy7RzthaBIugtlmQyPNyCs5ZTlEvZb1nxiMx6cWn714NI7DcPRFDf8culhmf2egzX2Kyq/YuYmYyaiF/2Kq0GviZygbeuOsWcnbfeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-50f88cd5ac7so3847923137.1;
        Tue, 19 Aug 2025 06:14:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755609282; x=1756214082;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w8Kx5cGiGpdinLDvM81MdLwujJYEv4s4yCGfX3+iapQ=;
        b=pGWM6D7Gp/E7ip/cfTM9Erh+yiYdAYibAugw0/cPBZ+rR/kLLElUK440aUCqxwSsHR
         BASKrnzibYKZaJHqMWPTYIkMqLBlN9PYPbJjBD4tAgFgbEmVBmm1rv6YOz7KinzCXJmd
         olOZyfbiQULJKTcDGvBMNd3DNWal6HlxXFCoaqLgYp2Zee6dPfbNKw/fQGm6QiC1TS2F
         G0q4f4fcGc3E/u4g0qRLbh1FEemwmJUJldgZPFAWzNiE6BeCSejb6HKD0ssgK4ekeIgD
         IHml9qW43m9ZHfWKaNHNB41onzNmGMwcxJFfKKF0Kb9s9vut6w7ccRdOkjWY20GX1wnY
         DMXg==
X-Forwarded-Encrypted: i=1; AJvYcCUdfhW1b7Y3Ca5k14vc+EEO0NUBLWM2K12DPSv11RA0EwE/n9dRP2aHwcewRlufa+iLMybbNQqGsn/n@vger.kernel.org, AJvYcCUuv9I/RUliQFK6BxpADowC5mdxQj+p9yRchrxqVttjTmTUCEo7hT/q0F8ij5rJo2YbIX+bL5v515c18aUo@vger.kernel.org, AJvYcCVu/8bA5K/PueXClJfOZgTiPu9Xm7zifDkxU1Wf/bZwTyZAUAHTKwjgM56l4PFPYF7XIlu6T7Y16o5y@vger.kernel.org, AJvYcCWEbLPphPR8ifNTZzi59cuN2I2vcb6xGjlkL0pd8aKNH62MIY0lP4YS4uw2XJPHYs39Vc5I2jZ+rBVgymj+5ovsABE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxt72M0v9m5wl00Y/gk6bxUcuzYOBs8QPywOWjVS0x2RG3SElY
	6RNgu7m8JcQgyp2IeivmZ55NI+kG0nOWKNBdntdLphTXoIFfP4ge5VX1IGkHAA13
X-Gm-Gg: ASbGncs5ImtGrTditJ+mO83cpNcfy9xwS/hflbkiyXGHi5nQv2OfGK259eEuH9ywCUm
	pIhZ4njItCeeRnP49UM1Wxd/C2Rzz1xQZiZVl60yE2AjV2XyCql+xspBcfyu+zBUSXKMVNmAL9e
	RpYin8Hl7owKcJlPzl0BQq9O8rAABvujDToeoGRg4RgPvjhjMGb/OJIXTCAT9qrHF5Svn1UpagI
	FJnQD0dM6/Um534UXFBmXzD2namngIr7aZ2nxHAJCEiCAYSGuTVdh4SvYkGwulQPmBx28SeOMgm
	YtkANwnkqQi2guh4CLOaiTCJocKjUbFd5tTRIVNS1WXUgOX1bjmQqbwpRBhJaxc68KP86FlIop5
	r+qIZht2lHWb8AsBF8bhCgTTo8DnwXnD+yNlptrbyAWQpitWU7WaCo2HTBgo8
X-Google-Smtp-Source: AGHT+IE6IUPud65EnXlvUr2B9H12xe04ANAAYjMR68KPziB56fb8AAsrOw1lRMa2NFGCZlUkWXsT0g==
X-Received: by 2002:a05:6102:3048:b0:4f7:c5ed:209c with SMTP id ada2fe7eead31-5192201cbb1mr768695137.7.1755609281923;
        Tue, 19 Aug 2025 06:14:41 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5127f80546fsm2903858137.14.2025.08.19.06.14.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 06:14:41 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-50f8ad2176eso3146611137.2;
        Tue, 19 Aug 2025 06:14:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVhC4ydS/klI+b0AXH+JyyGyYN+YNAiAKJOBPZ2KOCykd2TGNO5jMbwBalVZ3fpYbPvxp3vPFtm8hB5Al0B@vger.kernel.org, AJvYcCVqrSPuwJvwRV9iygKGMvMk0rOLutNZga/YXyZ81s2xIm9Ldau/ktcHcpqLR0+dPCmiOJA/abG6TOL1@vger.kernel.org, AJvYcCWBHUwvJCrrId2XiM9XRN9MlHUqCQx1FuiOHRolq+uWLSVrYo/b7ULgZuY3Z8xmf4In7eJryp0Heson3lz9loqRCpM=@vger.kernel.org, AJvYcCXiQiRM3ulC2Wv88qQb58ojH5ZQnuZI/pOLMz4OSwCyGuUDBkLuYzNbsXY7ILq3n4AGhwHTux5a8SIj@vger.kernel.org
X-Received: by 2002:a05:6102:6cc:b0:4e4:5ed0:19b2 with SMTP id
 ada2fe7eead31-51922118868mr745706137.9.1755609280511; Tue, 19 Aug 2025
 06:14:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250728201435.3505594-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250728201435.3505594-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Aug 2025 15:14:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5Rk2ppHwKZLgjektLCVShkoh=ESoSt9PY6jcp-uEukQ@mail.gmail.com>
X-Gm-Features: Ac12FXz6ckZqsKpNRXFU7y3mbLg1_W5_Ln9ZIyfl6OPClvcylW7dhk8Lvat-Pt0
Message-ID: <CAMuHMdV5Rk2ppHwKZLgjektLCVShkoh=ESoSt9PY6jcp-uEukQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/6] clk: renesas: r9a09g057: Add clock and reset
 entries for DSI and LCDC
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
> Add clock and reset entries for the DSI and LCDC peripherals.
>
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

