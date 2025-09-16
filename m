Return-Path: <linux-renesas-soc+bounces-21910-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F908B593B3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 12:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0924B1BC7AD4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 10:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C4213054FC;
	Tue, 16 Sep 2025 10:24:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D50304962
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 10:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758018296; cv=none; b=NKF+bsuCKxK+LcLeH5dlxKIoJLv7Y10/cWY7Adkr0LEp481RQnTzLHRFWm9uRWI3UkJBSvBDK/zX6mHawjJ135V/OZCR3G4zieuVKl99Cg00Kh2emKWWClSFYqjePF0lptGxlx/C9b3U2cRkaQbYLwBNXA8uDWs+LinJixubRvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758018296; c=relaxed/simple;
	bh=2HZc75dZXq+Z0RKpYly9QbI31fy1NZoUzdLLkl+FAos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y02Ph1C8skN5YSz8VBOxacxMCJtSXcWzHMyCzMcIb4f91ckg/VC8CSheQ6pmFlsI8oV5zav4Ko1NzTc8PnPMnKamvKQiDnVlTtfeNVH3hjLpPRerPna7dPp8/QrqIKMBcE2vhBaDVziEsHNQ9iuHRHsJJhYOjsvJlvXdaG9XyIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-8ddac4b8124so859606241.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 03:24:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758018293; x=1758623093;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hzQC5o3G/5QL6Qh+OxxIc+msYH/uvK2UseyCJUUA/QI=;
        b=cQTjlPm5/vmG9XBUmcvxagTSC3UpFE5ufhwm9MZFfxhBcLOSAB7OikGo69eT+J4cqT
         3sWRIutFduR1t/gHTobxbcbbQbbeKSkW89PKOq0HkK7LN4hR35nS7VxWSKeMTvLHC4jd
         ic7pQljVklRAIunzvevNNHwqh+Bg8BlNA+LRoEY5gZ3s1XmFYvb1guDwpCTEJsLNjD61
         W4uvHIXQq6Jme2VbgAX+yYFbCOkSGJqqZ6KIX3LWTsIvX2bmjqVYvswyLIJ8gVvUpxIe
         oI4Z4Uz/v13a31SG+tvVD+YyYOfkrG+MfJXFhqwQlA1pKcDPHAhZVSEmvNA0IhMe6E2W
         KbJA==
X-Forwarded-Encrypted: i=1; AJvYcCW2S5GMjoFaCTHRzr9AUVbE02VKaVvE/29GZwC2MYIuyNUqusQxmp3WHQ1oaA7UoRpz0NfOUWJMtb5aeTldR3gGpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCZAAXD5fEo2ItxuGyYuiY1DJzLzJMLJtA/wlO/EzKsP5n+jcm
	XgFCYhHkbpPBwbbtTtiO1DukgOFTbakBU+szWmkqBNrb3yxENzPebEgY2jN4R0Qc
X-Gm-Gg: ASbGncsiO+Jw8hSiTgbqAHElz0/7SmDyzoXdK0K8p4qg59Re01LOG2JfySNGHouU1ci
	XxGSqo4A2ZkTrlJlwKiZ+gVyqeCuS8tgmcJAEPKw6q7Es/g1QRZ4VNAmzUkqFfQRnZgTX9edlCz
	YqOlLP6eyij7ua26PhJD+fXWbNAzYhiJlmeLWGla+lKBr2DXLa753w4FvhwQoIInBM4f9nRQ9WM
	6EppwwX23yQHdkUaA9gYz7nZwivdCTGRc6cvTjtBfAmIrndKBmXknnztxUWH/dHxGEKKGf4GMni
	974uFXeITm6Be5yJ/8qlvrJx/azZ2ockd3BViGb4smOOaQkRvbWgpbdXxdzAolQBwBdWNqW9CZa
	PvNLKxwwzuzRNsvSyrG5D9GQx400RHcPk6OjAWdMWXVz94d7XStNR9jgSbzYM
X-Google-Smtp-Source: AGHT+IFpJYQcU59SvhHzyS7e/gPYFXjaosBep5IOLbpesJrvrAhDKmQ6A5j9EpNbfwX5zsVN9Lkf8g==
X-Received: by 2002:a05:6102:8025:b0:523:d0d7:b964 with SMTP id ada2fe7eead31-55609f106d4mr5664592137.12.1758018293144;
        Tue, 16 Sep 2025 03:24:53 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8ccd6e91934sm2793494241.22.2025.09.16.03.24.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 03:24:52 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-556f7e21432so3056473137.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 03:24:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUY4mpYYoofeby+gSRaqfish10N8KjMqhr3YNc8iz7AQ3N6ooLHCRNlaazCS4B/TSU/YCbfrkxMhjF4sHiyRG/xyA==@vger.kernel.org
X-Received: by 2002:a05:6122:c81:b0:544:7057:a812 with SMTP id
 71dfb90a1353d-54a16b7e208mr5192058e0c.3.1758017916045; Tue, 16 Sep 2025
 03:18:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87tt13i0lh.wl-kuninori.morimoto.gx@renesas.com> <87segni0kg.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87segni0kg.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Sep 2025 12:18:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXRNUDNnF7QVwUxbxyOCsTEdJjCuWw3-bqA0tA2uoxiFQ@mail.gmail.com>
X-Gm-Features: AS18NWA9ABGiKPyMIlR3UAj5Udf9cOnnhSw8y3TAUBDcJz0NhqQSnwO50GNAW48
Message-ID: <CAMuHMdXRNUDNnF7QVwUxbxyOCsTEdJjCuWw3-bqA0tA2uoxiFQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: soc: renesas: Document R-Car X5H Ironhide
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

On Tue, 16 Sept 2025 at 04:38, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> Document the compatible values for the Renesas R-Car X5H (R8A78000) SoC,
> as used on the Renesas Ironhide board.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Already commit 1ed2786e9ef8f162 ("dt-bindings: soc: renesas: Document
R-Car X5H Ironhide") in soc/for-next.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

