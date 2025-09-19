Return-Path: <linux-renesas-soc+bounces-22054-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F391FB8810F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Sep 2025 08:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BE7B3ADC36
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Sep 2025 06:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3042C1F8BA6;
	Fri, 19 Sep 2025 06:52:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0806525A326
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Sep 2025 06:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758264774; cv=none; b=pMrNYb1S1dyW7VfFjEJA/lC1QYhYyvkjJqdkvnGu98FJlpOdgG2K3zwWqIpI7GOFmKqSHCEUAN5mWlCfmqvkmDedHbaFqXdsRysViapW2iIEUFj5P1AuJqIhGUtjXRX8uRhvQM9J0Uyb7vn54qfdltq7iky4JhkTHnSuSxkllg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758264774; c=relaxed/simple;
	bh=92VyL1l/CCW1RzuyUm3CyqNURYeJmbDXunIJF9vmd2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gUuPa1YnthTktAytX+pMo2Xf2N0BEKwaU3sZyZYs6gm1uHez4AyrbXr810y/rRYtn4+TstyUtbz45Rdm6vHai/IkD7Q8QXPSpDdAl1cRWooptEhxWDnBsxLEPS7/AKoMOqddGamvyx00XGbBsenXpluT0p9fdsF4C8UjqIWMKF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-8a967f3a873so702185241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Sep 2025 23:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758264770; x=1758869570;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pkV81nju0TPvNncudyLCXK6ByPHFzfyoX04Ft1zWdlI=;
        b=Q6M9t7inz/tLDWCDdFg9OAtXzV84pQ3B5nT58d2ZZBoCceMoiygY2TDUCCcFTJd5dg
         Kka0+C69Zdk4il/3U2Zx0arK/JxVvWijAFj5ioWEFytG6dkDXvT3GP6rMX7s9JpteaLG
         z+Cj0ZUuLLPVZjpXunHGN5lgE7j0Wzw8NbOHeRXzTcC838YHpi5933ftnNuqhbPHvJ4v
         Muj9m9w+JvhAm7he8MkWVRfSHBb69NGZerCMY/rt3PbdEcM6/4CHuDnlLS8FcP/IcAtQ
         yNlEO2SNmMk1+c/o5j/dJlOCWP13TOr8VX0MRwrwlWDlhwaenGH+V178iDGYppv9EyYH
         B/NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRGSwLl5mU887vTy+YNC5k0EcsDPORwh1QgeGkCN8K+HFaLAz1uXHCzuJ7T0D0oEkmokHATZBU8pfkWEpWFyOtmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YycGxshomKJcXiqVz0hpqsaiSNxec+Y9/a46OT/TBvjXzXGOh6o
	WjXWGWQamwfxajG5m/KXqh/rLKgvrYs1kvkq2NJedoQYIzcGYwTz2PzteZw4uPI+
X-Gm-Gg: ASbGncs1S3Fd/V5MZmV0VVSZhzmVthmVRcHKjp9hhMAgWNffWXmq32Jk24nzIHIsVIO
	jAi1vN/KSAVbb1+WYEloyuMB1T5/Iaiaj7s3plm8+yqVxu/XUl9NPiuAd+1uVsHcNkbPkWzIm42
	pQh4S5rQoUKT4Sr6zsdxl00qAZKrKtmXuSDJ6G684PcU2pXwzQC6P2rDttR0t+JSBRnOlUIXitG
	rea/7uvjF63wuc6WGDyVHdxopaYNUFIEnd1py5KJFkGjGNRUo0UVlX+n59fKObMnutKCHeERybq
	VbvvTzdtu14vAfKFidb+5r1+86tylRHyNznuZcwKqaTRz8Z7xNBiBtbMldQUl6WnuS9fIdyw2JP
	jmULEqe1w3Gv5GdoeYD26VW/NY4oMlBhz7sTTqK0zemhC0DXg6eShwN9OM9KP
X-Google-Smtp-Source: AGHT+IF2xcHk+aL/T/yqDHg+nON2FN+bpNlLwhrTYk0AWnZqZUw9QdTyjbEOhDAJJH0L9q0y8sAmaw==
X-Received: by 2002:a05:6102:d8c:b0:529:1815:ae8f with SMTP id ada2fe7eead31-588baa65188mr652230137.0.1758264769785;
        Thu, 18 Sep 2025 23:52:49 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8e3e7523a42sm788731241.13.2025.09.18.23.52.49
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 23:52:49 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-52e532e8198so341210137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Sep 2025 23:52:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXogaGknMlvsQeQJ8Fbjn9UU6RGh2nSmjIoJ33g2TgXnGkCjif5D91kk5WUj5ncK5lLfnZCL+TIX8WBsgGfoispRw==@vger.kernel.org
X-Received: by 2002:a05:6102:cd4:b0:519:534a:6c24 with SMTP id
 ada2fe7eead31-588f87db47cmr602651137.34.1758264769029; Thu, 18 Sep 2025
 23:52:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87ms6snut0.wl-kuninori.morimoto.gx@renesas.com>
 <87ecs4nult.wl-kuninori.morimoto.gx@renesas.com> <86ikhg13m1.wl-maz@kernel.org>
In-Reply-To: <86ikhg13m1.wl-maz@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Sep 2025 08:52:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVezqWxbFp9dd0WPJnNM+MvmQ9F0UA2Ru_BSV6-6VgOyA@mail.gmail.com>
X-Gm-Features: AS18NWD_Pkgqx7xjtQzxa7XmXgry72f3hJO1WXd7ew0O-6Nznr1kYzKT4iwfWdQ
Message-ID: <CAMuHMdVezqWxbFp9dd0WPJnNM+MvmQ9F0UA2Ru_BSV6-6VgOyA@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] arm64: dts: renesas: Add R8A78000 X5H DTs
To: Marc Zyngier <maz@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	"Liang, Kan" <kan.liang@linux.intel.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Ian Rogers <irogers@google.com>, 
	Ingo Molnar <mingo@redhat.com>, James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>, 
	John Garry <john.g.garry@oracle.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Leo Yan <leo.yan@linux.dev>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	Namhyung Kim <namhyung@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Thu, 18 Sept 2025 at 12:01, Marc Zyngier <maz@kernel.org> wrote:
> On Thu, 18 Sep 2025 07:27:26 +0100,
> Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:
> > +             /*
> > +              * The ARM GIC-720AE - View 1
> > +              *
> > +              * see
> > +              *      r19uh0244ej0052-r-carx5h.pdf
> > +              *      - attachments: 002_R-CarX5H_Address_Map_r0p51.xlsx
> > +              *       - sheet [RT]
> > +              *        - line 619
> > +              */
> > +             gic: interrupt-controller@39000000 {
> > +                     compatible = "arm,gic-v3";
> > +                     #interrupt-cells = <3>;
> > +                     #address-cells = <0>;
> > +                     interrupt-controller;
> > +                     reg = <0 0x39000000 0 0x20000>,
> > +                           <0 0x39080000 0 0x800000>;
> > +                     interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> > +             };
>
> I already asked for:
>
> - this comment to be dropped, as it serves zero purpose to the common
>   mortal

What about using a different comment instead?

    /* Linux must use I/F Region 1 */

I.e. replace "View 1" by the above.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

