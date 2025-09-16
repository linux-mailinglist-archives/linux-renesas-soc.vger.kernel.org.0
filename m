Return-Path: <linux-renesas-soc+bounces-21911-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 504C4B593AA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 12:30:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAA342A25D6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 10:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B1F306D5E;
	Tue, 16 Sep 2025 10:27:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C46306D40
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 10:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758018467; cv=none; b=u7JhH+6QPD0Y8VNBdicJs49IxjmnkaV8z2qpeGjK4524eAwL/P4CnZaEEVZ9fHjyAG74drchK1l1940bY0XWKYmwmaB1/X6icV35CJLChtVzQYqcxU1hrRshlA0AiJ3WiiAwdIUTAej47zYvbkGTS5I8bxhgLoeg/940Nv4ZP3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758018467; c=relaxed/simple;
	bh=M5TSTKdOE7KOvxaTBZ6x7dRz7TvGD4id6ZsQA8rgfRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lmzd3wDynuA749q+PRchv1VKw1GfXUsW1R6stpXE/DFcbG/bAo5zeViiI0DRLQ8lY/fhBlck9RzE7hyCNvxwuTd1KrIH8iZDcCDH7M8JfwLaYKNx8wJW7p9QBDSylkYrL5P8vxZcFP7m6OlcSzJ102681Jo/vk1aFkhjGweSXkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-74381e2079fso6283601a34.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 03:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758018465; x=1758623265;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D1FWUIy12ESADGq4B/o282N3x/QgWaUFK1UozSJnDAM=;
        b=ajhQHn8zWgqwud/nKxG1cwPGeAxgOC/V/MtuEw1hObcby7LJqqPcayUd8Yu/BRxSvR
         NtN75UV636cbFQ7vGsqviG5Dn7ffAlf1ahyHVoB8GllkPAxTJWdXIwPmfUjIxCCfkzNx
         WdNqVpj2XyLls/UilURmdNtQQe/UHLhLno1RgyGXduCNBB/3x786EtbJ9SbL3yOjHcIK
         lUsSUUzI9xNfCiBoZ5lW3B2KcWUAcaKb+yuAdNCH0GJCHHCnZRTWZmCunpa4RNE01kjH
         mr7srDgRt5it09ig+Z2FaB4kAb4BpqTbSAMuYZnNPDp1hUhTOh5cfzrTkFSSw9PjoBbt
         bViA==
X-Forwarded-Encrypted: i=1; AJvYcCX2k7c6PKQKi7JBiB4qfoaEd84BkfXn5qkTzfFTGJ4qcEvyGXWJwKVMQPH+AjBiq9gyd4jOUKrN3xtdC1H3s6yPjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDPBHAg3nwEPUW1tFxtpjSTbrNqJMbbXozTLVozQjb5ICYzFzR
	6LAaGNnncRmeGD9JPwOM/xgqCPcowycmTrHqAyutGIqs+RYz9mxccBjL6ko+fnET
X-Gm-Gg: ASbGnctCh/YwQUJ/66xrOBPZLiDL/4u7uX+csmi1gqGkOIpGLZC1MBCwMgXTrdypWTX
	zvWNmS8iQW/ScQgNrKg9GY0iWa7Enq1kr/WcxBtwILnjy8fCw8LtX7l9C/GtqNzlvf904oJQbkJ
	5aLC8hNGy3nSvnwQcHvyepGPFrY9RzmyfcB2IbXZIfCiZDT6D0xF2kD8AU5Q6UsriKB2t4oSI6u
	Bm5hrxh4HsYOs1ywhoT1l/ZSm1yP7qXAWAtN0gz4NeL4CIqfPMkIyMy7x8ZWKtz7axvLs/X0kEa
	2jQEnJLI9CO7jWFERNimh+poNTGNckuXCDUJgbHwLh5zEoiwJEesc705sG2y/TRN03AUu17sTw4
	g6DlF/WuIrq22oHWF6Kpt41n4L+nvsBE3311W6fZExlzQ+Gp6UzGSerzmb3Xg6DpJF9iBR9E=
X-Google-Smtp-Source: AGHT+IG3nvn+0pQxYho8UxHVwt9/122+o/W9jPlujSY4Z0lST7ekHIkOW3xaJjqKDGXDu/1d6+QFig==
X-Received: by 2002:a05:6808:1a10:b0:438:3def:446a with SMTP id 5614622812f47-43b8da72091mr9468073b6e.45.1758018464720;
        Tue, 16 Sep 2025 03:27:44 -0700 (PDT)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com. [209.85.210.51])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-43b82a73075sm3077284b6e.19.2025.09.16.03.27.44
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 03:27:44 -0700 (PDT)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-74ed00220f6so1932253a34.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 03:27:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVko8vHoxO4rjHOaHs52BKfR0O5tf8zRli0iyLMwitlYR4DszU6n7Owv5sZa1ROUUbq3raOaO+eQFmKUGVNj9nojQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3ec6:b0:529:ee6c:6760 with SMTP id
 ada2fe7eead31-556091886d7mr5576842137.7.1758018092612; Tue, 16 Sep 2025
 03:21:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87tt13i0lh.wl-kuninori.morimoto.gx@renesas.com> <87o6rbi0jy.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o6rbi0jy.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Sep 2025 12:21:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVKhw3t6oJhWrdFCkpaXKL5EXxBAPtqiYSDPv5aDNiFkA@mail.gmail.com>
X-Gm-Features: AS18NWA-CCVGKbHBzPrL9HA4tPoq9LGRxBm1encbDpHU-DmGUfLkgrDyZx8KuHI
Message-ID: <CAMuHMdVKhw3t6oJhWrdFCkpaXKL5EXxBAPtqiYSDPv5aDNiFkA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] dt-bindings: arm: cpus: Add Cortex-A720AE
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "Liang, Kan" <kan.liang@linux.intel.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Ian Rogers <irogers@google.com>, 
	Ingo Molnar <mingo@redhat.com>, James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>, 
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

On Tue, 16 Sept 2025 at 04:38, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> Renesas R-Car Gen5 X5H uses Cortex-A720AE. Add compatibility for it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> @@ -148,6 +148,7 @@ properties:
>        - arm,cortex-a710
>        - arm,cortex-a715
>        - arm,cortex-a720
> +      - arm,cortex-a720ae
>        - arm,cortex-a725
>        - arm,cortex-m0
>        - arm,cortex-m0+

Already added in commit 0f356eb097c31471 ("dt-bindings: arm:
Add Cortex-A320/A520AE/A720AE cores and PMU") in dt-rh/for-next
(next-20250905 and later).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

