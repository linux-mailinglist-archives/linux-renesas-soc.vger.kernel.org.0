Return-Path: <linux-renesas-soc+bounces-23416-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1165BFB313
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 11:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 845381A0247D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 09:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D7428DB71;
	Wed, 22 Oct 2025 09:39:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB68295DB8
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Oct 2025 09:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761125940; cv=none; b=Q07U8J2rxgFIEbQSf+51tsNN645VvNgd8aLXmGS74MstnOVr81J6GtDBHkp9SzYfzhmvxomLdNOGDzoRdny/7foNgEZLFL3LOXswKbwnGpPaxsip6/eTj6cyjzhvc/+Qvyv3IjXWXjwImDSKxrC3GfYW1RS2EEWvFBbN7YAUP1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761125940; c=relaxed/simple;
	bh=dFJgqQh2BXhnHzS6LSg7icRKRTpEo7skpwGo1v2sTjo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=osYfq+RUqOAqh13gPVd+E5tdbeRbvXmIiSo1q1AYuyaWKIqHDWL1B64nrIcwZe3WvUb2gn4xKilDfHh1JNy3jKNsDSHQAoPTphxMZrcbb+EDHQXi60gepdH7XAaoGQiz6L2fqCB1Dpma4VuC1mrC0cKihgOTFAD/kLdygLNYtz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-930ff50d181so4408767241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Oct 2025 02:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761125938; x=1761730738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XWYnqPsGR/+m0VSRYyHFTH5ffcOTH5Kpd/uIr+BQaho=;
        b=w5CWrIclzIrV59GsJijZ7RkX+R/SyNhlvFIkyzpvnm2i9CaX+RMxp8YKzsIjSM465D
         26HMyRLwJ1ffH3/Jsi73qvWGe7MeAXWyZTfEBJWzXwC71lBI2cgZI31C2HZMggKK20Bh
         q2agEt+TV2SB8tD+jVDzqFbs6sxxMi02Ib1YWyAxVepp/nOvY1swsBj/h9TlZQ9z4bUL
         ukgIJ84Y96Ftz4XX/2XT7HQ4d/AnpSd3AGlWxZfmpZso2Uid755IzRBBAclBXtgMuaAC
         X+9wy94CwzdL30BAL3AhuAt/y1b0bBcQ5GHtLiQpCzK2D/UiAQjc3D9lE2Ns5fGzxIGg
         LFeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVY86z/VNqhB/w/3ldENY35iGWsJ1Lv1IWJ2x1YnDWI+Vsh5Q543SnkLrbv/PfuSaDQ6npgyP3o1fhdlV335raQAA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+u6YLFb9rfOs/31Vr3Wr3r920YQDeXPqQK/t75LhtNEntLFIp
	+QeCaP07baZfPzUTxXE1XwVVFfGxUSA+PInrE3pJfPVKxY/iNVppoVsiUA+Lpazj
X-Gm-Gg: ASbGncs56IcY57InG4IuTkrfKyeIWZ+S5BWLl4cS9L6JFUU8wFS8RBi3Xk/IWu5fX5B
	dMxqoKdmUHccds8IahWJlKzEjZlKB6pkSfDKAasFu+AYKASAEJsxNxHKidhY9x9lbXVLvcjsLy9
	ILYjyNG2iVI6G/5qfbw6GtfdGPiWUUD5mNfFMEq/Jiy9OdlzC9ByYH9h3IUAVhZ6jl7cjABh3Dt
	5bH3Z6SVrcN9ufiG1Sx77ITXhqqbgb/0BYgt7Jss2JI4O/lWOhtmikcwejpmzgqyhIs1nwaU4MY
	j8n/xvEeFFwoxBoWwbjcmU8WM3RCIudDQHIhguiLccBqyClCs3G+g98TTMK5Ob9evS2lr9bPksP
	W0iokvM0DUXjQDjP53qsRO6p3D/2fNFTZb5B59XP7IO6Z5KlMxJktxypbPhzj7lhUrB869a022o
	QJPKyNiLgFEGaHDr4TX9DVxBE/jbEamfLoF8hAdkxcl5iq3fsl
X-Google-Smtp-Source: AGHT+IFgcxi3QtBes/jBiDykT7ZOsX7VpBnQgtbj2rPzsukMzga0X4MT9ofVqxTY+VO4mBDTsS2bUA==
X-Received: by 2002:a05:6122:8c03:b0:554:b927:c76f with SMTP id 71dfb90a1353d-5564eca4526mr5637348e0c.0.1761125937662;
        Wed, 22 Oct 2025 02:38:57 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-556a31eb8cbsm120211e0c.21.2025.10.22.02.38.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 02:38:56 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5db221488bfso359392137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Oct 2025 02:38:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXVepm2Pr5E1/o53+MhzDVOH8cUp0x4HJ6HLGzaKa+dHpIiHI60Ar5xTszE0U+04YfATdY/55xVfEkABAiY6588fA==@vger.kernel.org
X-Received: by 2002:a05:6102:a4c:b0:529:e9a5:c216 with SMTP id
 ada2fe7eead31-5d7dd42f318mr6592013137.4.1761125935974; Wed, 22 Oct 2025
 02:38:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022033847.471106-1-marek.vasut+renesas@mailbox.org> <20251022033847.471106-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251022033847.471106-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Oct 2025 11:38:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXrFTnJcQgVaCZWeMEHVCg3PbHd=oxzTQnDCixc-NDvwA@mail.gmail.com>
X-Gm-Features: AS18NWCUxVmbBX5A4GWgkcFHdLZ81csYvV48uizjGHlywJaqitAbOBSEWovXEnU
Message-ID: <CAMuHMdXrFTnJcQgVaCZWeMEHVCg3PbHd=oxzTQnDCixc-NDvwA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Matt Coster <matt.coster@imgtec.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Wed, 22 Oct 2025 at 05:39, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Describe Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
> present in Renesas R-Car R8A77960 M3-W SoC.
>
> Acked-by: Matt Coster <matt.coster@imgtec.com>
> Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se=
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V3: - Add AB from Matt
>     - Disable the GPU by default

Thanks for the update!

My
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
on v2 is still valid, will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

