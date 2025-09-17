Return-Path: <linux-renesas-soc+bounces-21969-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DCCB80559
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 17:02:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D90134E24F8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 15:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEB8A332A47;
	Wed, 17 Sep 2025 14:58:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6AB32E73E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Sep 2025 14:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758121132; cv=none; b=SWmPqCpZl2IIyhzW2yCBZAtY5NhtRXgj3BEAZxh14zsvFQmfsKJ8naCQsAXJ8AEu6CHdrotFD/fQIMtq0O3cv6fp0mIkcg8ppCHt9N0AZVmBHlb7LRbQ7ePI2H+1Sc6ZrShgllxyHETtNwmPgiR6vSMuRGvyRD5FcW9zTQWH3Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758121132; c=relaxed/simple;
	bh=aWHBMOW8hyEe365SagMQZPNiGW5aSEvEFBlvvt4KhAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=he2cfBCfOSwZ4YwLIcuLLFW19xqPdbHVM+aBq4HKPw3JNXGxcJpM0nSfwQFJz5Hxg+HJNvRhEsfrRw5ehUwtZlQTkxl1UCpUlJIDK38GsYj4GFAAYeDXqUPNweXiWsympeuLBsPkpCy35KTtVZHyIN4LJ7BqTgdY0q3wMJ+gjT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-54a6248e23aso259680e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Sep 2025 07:58:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758121129; x=1758725929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=05Xx0KU64Po07Lz8pcNMpuzAdK+HLbLydsRr28mrazU=;
        b=Egqy60FZHPlIIzSA7iDYDTKKcccqsuTiHCv9/S7M3GY56fR7utUEuUPgLd0pGRaqPi
         6w0ddSAihzDKs5vcQOGnEEQOszbWAnWis8813svokK5nKGzL2wI5te815XB2ZvP+BCDC
         x/BNJaT+GGBTfMVlkVMUwaCxIzdtQmzCfCWxecuiRLkevZjaX9mKorq9WwDAGsLpuI1G
         2FxSj7Px6q+qeKxseDmREWqRR8jW/rUYE91bH3k09OIAJyyYu8UGBK2G8M7G0NfuI6zD
         XGGISNDFFO1AKt7h/juVB7neYCwyGakNq65QLToqK55rSsuty15HLpDJgY4vnE1c3A1H
         oBYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXL+VZj+4ycOcQ+VRjJHgJrchCTnr5PGNYSE028I/QnzPSGRtHheggawdmF/4zbhd0gS5c6a6Glk6xMuxkFoqiHag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5VExHQoCQJYYTDGxhUeXkZZXiFAbJIL8rEEfa/V43EpsovEaF
	824er/LQdjM+7rIEODc6JIkV0GM/TMg531ii6JYR/Gclxofv71VmsPobweQiiCU+wFI=
X-Gm-Gg: ASbGncuSg/unR3MtV5LKVnU8xPmNPedx40r25WayFgkoS3DCOoBE7AZyB1o8hGAMxrz
	CL2JxN7ubf625iQEZ8lrADMACId3v6JMcHga1KxtCj3jvBXN7F+coZiyIbOlrq2Bp96j5Ayi3sA
	RCOTKGUva4hqU1Kpmk4/DOfbixB217tYhvmqYmj9ICKHlwFmR4V1WeXz6B4Kxind413ANjFYUtr
	YVEQ40xTErDz1o4VGC0f/qXk3nxJgv5QzyWcOrAuIkSOmCKRuyK4A1IRWa17M9rFguz1LqK0S3Y
	cCSm12hnw26SLC10pyNrldGDw2G3DhLA2feNPifTVHyr6g3D9pelUCi0+SmRysqiNYd+b4+5EM+
	9WnkQFImUB3uQWcP2BSkwS3wMaJxW9J8KRVidOKxvEbSINuU969kfOzkrfTq4Qeb1
X-Google-Smtp-Source: AGHT+IGjv/aKKyuOF9U1Xfgav5+53c0UyFPqsohmyfeSzAFW3yxy08EqVj2xl1sDsbiEk0iLHu5VUA==
X-Received: by 2002:a05:6122:1da9:b0:545:ef3e:2f94 with SMTP id 71dfb90a1353d-54a605dd9c8mr697038e0c.1.1758121128843;
        Wed, 17 Sep 2025 07:58:48 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a0d3f050esm3537239e0c.14.2025.09.17.07.58.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 07:58:48 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-54a6248e23aso259656e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Sep 2025 07:58:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW5KlIhvuyOa8FCKxCGc0YZtgCnRZaeuTP5sHJsiyYd1kqY1wa30/9y4VnBJVOb5+qetb2ofFYQmiTCWilS5dwdWg==@vger.kernel.org
X-Received: by 2002:a05:6122:829c:b0:539:3bb5:e4c8 with SMTP id
 71dfb90a1353d-54a60a7a014mr768825e0c.12.1758121126748; Wed, 17 Sep 2025
 07:58:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87ecs5abp9.wl-kuninori.morimoto.gx@renesas.com> <875xdhabml.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875xdhabml.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Sep 2025 16:58:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX=oJqJhXOm6w_65dJHRD3VZyJZUWfHzot5EuZtRB2tZw@mail.gmail.com>
X-Gm-Features: AS18NWDSUjkX-aOCFteBo5qpdwwTSUCRiYts8nug9t_TpQbYuJMfunN09RrdfOE
Message-ID: <CAMuHMdX=oJqJhXOm6w_65dJHRD3VZyJZUWfHzot5EuZtRB2tZw@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] arm64: dts: renesas: R8A78000: Add initial
 Ironhide support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "Liang, Kan" <kan.liang@linux.intel.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Ian Rogers <irogers@google.com>, Ingo Molnar <mingo@redhat.com>, 
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>, 
	John Garry <john.g.garry@oracle.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Leo Yan <leo.yan@linux.dev>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	Namhyung Kim <namhyung@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Rob Herring <robh@kernel.org>, 
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, Will Deacon <will@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

On Wed, 17 Sept 2025 at 07:31, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Hai Pham <hai.pham.ud@renesas.com>
>
> Add the initial support for Renesas X5H Ironhide board.
>
> Note: It is using "maxcpus" in bootargs to limit number of CPU, because
> SMP support is now under development. This limitation will be removed
> in the future.
>
> [Kuninori: tidyup for upstreaming]
>
> Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
> Signed-off-by: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Khanh Le <khanh.le.xr@renesas.com>
> Signed-off-by: Huy Bui <huy.bui.wm@renesas.com>
> Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for the update!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
> @@ -0,0 +1,92 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the Ironhide board
> + *
> + * Copyright (C) 2025 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +#include "r8a78000.dtsi"
> +
> +/ {
> +       model = "Renesas Ironhide board based on r8a78000";
> +       compatible = "renesas,ironhide", "renesas,r8a78000";
> +
> +       aliases {
> +               serial0 = &hscif0;
> +       };
> +
> +       chosen {
> +               /*
> +                * REMOVE-ME
> +                *
> +                * It works 1 CPU core only for now. This limitation will be
> +                * removed in future.
> +                */
> +               bootargs = "maxcpus=1";

I still don't fully understand why this is needed: without that line,
Ironhide boots fine, and only a single CPU is enabled.
None of the cpu node have an enable-method, so Linux does not try to
enable secondary CPUs anyway.  Even with the enable-method re-added
(like in your v2), Linux cannot enable secondary CPUs, as there is no
PSCI node.

What am I missing?

> +               stdout-path = "serial0:1843200n8";
> +       };

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

