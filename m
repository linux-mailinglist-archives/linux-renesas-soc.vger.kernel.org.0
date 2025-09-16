Return-Path: <linux-renesas-soc+bounces-21909-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B5EB59345
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 12:20:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 964A81783F1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 10:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1968B2F7462;
	Tue, 16 Sep 2025 10:19:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CE5302173
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 10:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758017984; cv=none; b=oLBKH2XMNgGwO6xPh/FClC2o25jNFnJYsFchwZnXis18pxxxBxuRiK7+iY7X4rckDBk6O+/25JoBGqfwj32g0Oj+2clEAV5xj3eKUuvPIJVOgkozvBofSB436Pj9hbk94GWWj0L5SaeV3DRmNBVyI6r7wK2lbM1hRnLvbbCStgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758017984; c=relaxed/simple;
	bh=2ok48w1w7KOUXd9zly8s4KVnQwWsqmEcAwqHID6jWeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g1sPmYTt5LaEnDhZlVnOWvQljK+/mlESh/1ZWuFztRBN1qebZF9sC/Y/t3tbWHwtR6ofHQs+4OVTZulV5r1ZUFaJBt6yQBa2Nwq5xir+pKt6BnRhFTi0R4/MYtT1bzljIovR1flTo5XbhTKGzQQ49HV/jgIIgK4p5FxxDfjf+3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-55785303d1fso2041566137.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 03:19:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758017981; x=1758622781;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xR3Y4U+9jEsROKJfJw59rI/EkalzjoLUt+5BWaKi6Y8=;
        b=Nf9DATO9BHsprUSButdQq0Gr3H1e9s+EbrBtNmQT0uFGtmvNIJhqyrnzMOkKhT5kH8
         6t9/cPgqfWFWwgHGg++lQdh+aJma/8NT4m3liZbn8UDyhoigULbOO6MJJsnhToCXiZJl
         MKARtMWAgjaJsVnoufgVJWIMBoRcf0MK2ZUFnGYRT6mXpUiFhw0MGVKTczkwH7F6wt7h
         WK4KoJAHSsz+PB01Ot9GjkZf7hUXM1Iej6taTy5U9M6eNbgQSuEEv4YtqNNk3BrIdIhD
         qIvqK+cD+nb6EqvWOXF4O2/wm1VWy0On1m31B1sXbX7grjSHTQILXILMZ4O8eAgYpEas
         CUnA==
X-Forwarded-Encrypted: i=1; AJvYcCVYd2yLx12dBg7Bg0I4vlzBv9cRlHx4uYVdIigbHgWL5xCNN01kyIyWphanGHNc72vZ4IGdYg1jPmNr4BADcVJLog==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWLD7ZxaifD3ULfg5D4+mENL1dgLwOEFkEG3Q3i4gQAPTzcgue
	bFLp3s6R2Uaaq0OUtxlbGZ7TIpqKI10LqP8cuP7qtb7GVRRRsQ7zEkSYS4vnNeFN
X-Gm-Gg: ASbGnctpkjdz/CzfwRPCSduoYtYWEzkxNZqB79wktJs7XvS3tge3QJN0ivMIA+rD+eo
	sJYgxxT7Y4r6I4J12Zs5wVO/B59P0HuR9uI3dlG5IuOsf/Bt2LSWDIGRHFS7WELkoJQ5MWRk7dc
	wXuEbQwI+D6msCCNxj5zBcBUlG/1FWRJ1b3xSgBXwgpmB8fgfPSPb3mhaE1ZJQlm1xnxCL3v0iK
	DMky7brLfDcJkjmdWRe3EUMiCQzBGJRdNlTVcr1iGhFJIPdeTWJdAHf0Dgk3CEIlsZxl13uoYzx
	DYRgvR23nG01t4KQujgPhxQfhJc/A2xSm8DDFXeyTuk0PffJ8SIVZNqPGpvxt3RucPBRtGSyd1y
	20EOdPBQHjAZ0B5ZBttADOB/BUiiNVMHsk38sw242hQPKgn++/2NqOvCjZ+7LkMICUS21hWI=
X-Google-Smtp-Source: AGHT+IE9RQ0aRaLRJoB8IrGnooDkVh/aSYd+ILcRxea/k/T8XDwMT2mz5xQRqbO2rBhf19sP+PdRUw==
X-Received: by 2002:a05:6102:3a08:b0:4e5:9c40:824d with SMTP id ada2fe7eead31-5560e9cd284mr6259485137.16.1758017981201;
        Tue, 16 Sep 2025 03:19:41 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5592c19f6eesm2448744137.1.2025.09.16.03.19.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 03:19:39 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-557a2ba1e65so3578104137.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 03:19:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVqRbYLdzKsBKtXT5ROKMH58ZUm+0MeEXmeEBGltKdqO7Imk1Nrhag/RRpf8nNSNlh6oZKvMm7QeDRWLku/yfShkQ==@vger.kernel.org
X-Received: by 2002:a05:6102:374f:b0:524:4800:77a8 with SMTP id
 ada2fe7eead31-5560908dc48mr5549412137.5.1758017979210; Tue, 16 Sep 2025
 03:19:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87tt13i0lh.wl-kuninori.morimoto.gx@renesas.com> <87qzw7i0k9.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87qzw7i0k9.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Sep 2025 12:19:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVQTftuiPGw3j-u7bzScs=UmsFruCKvSq-t_=JuKmpB=Q@mail.gmail.com>
X-Gm-Features: AS18NWAlUh-W1y7BXcMGcm9tJYfZlPplczM9NMOiyqYXewDD8MKxNGtLUFMdjw4
Message-ID: <CAMuHMdVQTftuiPGw3j-u7bzScs=UmsFruCKvSq-t_=JuKmpB=Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] soc: renesas: Identify R-Car X5H
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
> From: Duy Nguyen <duy.nguyen.rh@renesas.com>
>
> Add support for identifying the R-Car X5H SoC.
>
> [Kuninori: tidyup for upstreaming]
>
> Signed-off-by: Duy Nguyen <duy.nguyen.rh@renesas.com>
> Signed-off-by: Huy Bui <huy.bui.wm@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Already commit 5284d0b09d1bdc69 ("soc: renesas: Identify R-Car X5H")
in soc/for-next.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

