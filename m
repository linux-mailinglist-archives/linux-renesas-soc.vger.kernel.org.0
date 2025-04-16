Return-Path: <linux-renesas-soc+bounces-16052-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1996A8B63F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 11:59:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 686BD19024D5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 09:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91442237705;
	Wed, 16 Apr 2025 09:57:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61F4236430;
	Wed, 16 Apr 2025 09:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744797466; cv=none; b=DN14isBSHU4xT5SRlVVi0LrDHc3DClmp1vnPYbA+EE7QHu+A+aBwUUV99T9SlqIv3arqJeBmJVLRvTao+7qLKxq9Qv0uWl4HJVyFqaGObQqFQj90j3yt/u/351pXLNyHz5lkkZpjuemrhsOAXWjKlkWwvJd/5Koq3eL+6LAnIf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744797466; c=relaxed/simple;
	bh=NKVh9dZG5JCkxtUFXaoujRkuPvplbl0S3KshdhQiTA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NgD5akve7vrib4wYcxeE3oxeAUDzwaG3ji2D3P34RgIPxCXTbsxlytbU5AGhY8mbjDMLfiLOP4jMZsSW+CAGWIJLjnEfdzXXh32Lg6KG3EprHHM6pK914D560aXYkYasmTBk0vdp1HkHCOal9vOcU5DM+N36b8lKbLaAi2V9Xk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5240764f7c1so2370600e0c.2;
        Wed, 16 Apr 2025 02:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744797461; x=1745402261;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ho208Ls7afq1DaxglhBlsTxce9BflgAJatinG20gBNk=;
        b=wT/YMq/+00TW3BUuunNfzigloXNZDDi8HMR+ME6G2Fl/wmYPu2ie7nxqmsJMTCo2jO
         sZ5Bai4GYXOL7Y2SX6bP7hZa28WeqamhBPK0GAY4QWfs8tek/k4m4LrBneQh4gGT0BWK
         PT8rH9TY4JgG7JzZ3d34XiYR1AKgvBt1W28fLQ6R73bvyQjmWSEEW6XsqJhnCRJ5YR9c
         /yTiGhFAL+17pd2lkQIG9HgoRxHJ84wKwn5FXOxiTY9K+X66CHQcfZWF3RVsdYRgtE2W
         TCl+yyhsZkO2cXdxFXmk7gTACc+2nsVnSRuYPuJHejMtERdYF6jx5EW6D6PNsEdJKYLL
         BdVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVqGzb8omlN97eEuBdBdkHQvEJWhk/ODysau4R1D1Ue+Llzxm+0jR37OTpW4wJSyIkDu3SZ9ci7RCk@vger.kernel.org, AJvYcCWQcISDlFD+JflIUOV97FZQjn5ABz0WOnaBuIrqSGrwy1xgXNGFnGG1Y9hg0YikaenHpt4HQYTJDRtUGKLg@vger.kernel.org, AJvYcCWuzEOM0aQeWKVeuo8dWA9WIdKe9BcRsuo30kR59w2f4sU79N+z8Eca2mI/ZzCDoX/GnDp8PDWckwKSoh6FVuLxspA=@vger.kernel.org, AJvYcCXW8jpjdCZ8PDJHx43wN6MJ9IdH8mYIH0OsWn6nuRxeDiCXaECTiZouFI/lBzpOzdp8KZyUODGSYNad@vger.kernel.org
X-Gm-Message-State: AOJu0Yye+sXFcMQihwtxCcX8Mr3KObAIUDsQnDax/pnUh2HSFgQSaaAA
	PERcpjv69evifJJN/K/DFZ/i6xNi1FkA2pFVRi7cNnw82VvyBicqqaJREL6q
X-Gm-Gg: ASbGncvKuLoL2gTFoh1eN8y+RB9eI0XgCMslAEvZK9Tb+dGTz8+99OHUfHgTjuO7Pgw
	30REJPI+UydwJ/Zy1vUqB3PTROX9wjJDw9nS71r7SBTq8oH9eTEUBR/NZjYHB3A9podgTc3Mvs4
	/XQRuuQJWCTMWAbIVsTRhzPDzB+d0z7Cap4Pq/KjAkYeKXVkpNTvoDiBqiYsW9REdT9592xM0FW
	pHc0s2kgMSr1Yo0KTRPvpddmH0mL6emJTEGF+vXVCD2P2E5jjHLssulJBdscLddn6hedKtbIJQg
	sGCqPNCzYJzLj8LHjwL/hRtfp3TtvUy8kG9K4+lBFJpWR1EodFwH2MJr43gtHlLebKqlXK7EMP2
	k8/c=
X-Google-Smtp-Source: AGHT+IEVeHD42gkpw+XtXGZ70A19wMwdLNuKgd4mvjTJaq3zakOl021vusd1+6GtoUnutfy68ZVTQQ==
X-Received: by 2002:a05:6122:d96:b0:520:af9c:c058 with SMTP id 71dfb90a1353d-5290deea531mr366083e0c.5.1744797461413;
        Wed, 16 Apr 2025 02:57:41 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-527abe8d72esm3026508e0c.34.2025.04.16.02.57.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 02:57:40 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-875b8e006f8so318378241.0;
        Wed, 16 Apr 2025 02:57:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/dc7P4tOZtA8k1yhMvjaB6objtC4rJzeCkru5NuWGygJgwc9Lo55JK00gD67JCgteuHQT4Wyn1v6V@vger.kernel.org, AJvYcCUg3397I/umZL4B6ZPyUvxtKm36jo9urKxPC1jpRMOc356IdWOeJ9cAPTmm7m8+sjJ1buLxgzz7AwI2RcdA@vger.kernel.org, AJvYcCWYoFK4r0QaLv0pNRExRQH+DuhfuXL0OnvqFiweQJfsX3rE7CL9mEQ4O5MkKi03b8KJhwvFMcc6I4mWqPO/sYbRkNA=@vger.kernel.org, AJvYcCX79cJToAXrgTu6mvDmFemMmIqeoksiaqGPSYZ2lS7SKNVBHXQ9Rolmtsi28edcA+JS5ebCHxYm8R/+@vger.kernel.org
X-Received: by 2002:a05:6102:5e8f:b0:4bd:3519:44be with SMTP id
 ada2fe7eead31-4cb5921580emr265747137.15.1744797460341; Wed, 16 Apr 2025
 02:57:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402131142.1270701-1-tommaso.merciai.xr@bp.renesas.com> <20250402131142.1270701-3-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250402131142.1270701-3-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Apr 2025 11:57:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX3W5N=__6CpyoQ6DAumoS=8p6Zcwbsn2H6e9PYKsn=dw@mail.gmail.com>
X-Gm-Features: ATxdqUFRQ2wAxnSiubYaAZxSXiLAOnqb_ba0SYhUbUDUQXOzs-nV2UVFXRENq8U
Message-ID: <CAMuHMdX3W5N=__6CpyoQ6DAumoS=8p6Zcwbsn2H6e9PYKsn=dw@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: gpu: mali-bifrost: Add compatible for
 RZ/G3E SoC
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Apr 2025 at 15:12, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add a compatible string for the Renesas RZ/G3E SoC variants that
> include a Mali-G52 GPU. These variants share the same restrictions on
> interrupts, clocks, and power domains as the RZ/G2L SoC, so extend
> the existing schema validation accordingly.
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

