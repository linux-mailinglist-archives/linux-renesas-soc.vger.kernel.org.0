Return-Path: <linux-renesas-soc+bounces-22439-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C51BA9084
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 13:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 140C23A4358
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 11:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 057193002B4;
	Mon, 29 Sep 2025 11:34:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDEE2FBDFB
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 11:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759145672; cv=none; b=mua+onAwQBw4TYD50s/N1W0BCyYQ42Bdz9Z92Qq4QNOwGF9Xvz6bNVHk5kxT4xozF6lrkTXoOxDNKD1aOAxIs4iiTjas0ucAuDga5i+PnFsKZTBLER3K7YCy6cdaxPquoMdaXhPIcEYmLSbreZ+qiv2XriSWKy3h3ow6FzncI70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759145672; c=relaxed/simple;
	bh=CyqsEr2YH2CBCrRlLUbTkQtjycgfh1uAGWvQeIO2INY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kJGuuB3+6k+xVnlX10Wlk2ye45qCqi8a6ijjeV3AKX+BbTgf+0ny17Z46+b3DHIIDYir7Y44GUlQLSiuwWaNpXC9xZLLcOt1yNHziiz0o36yrDCb+9wbKoSrDbqzNkSC7QvNRMUzYEpB9LIoiqQmpELZWQ+CzD3dHfMUwcMhl1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-8e8163d94bbso3053723241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 04:34:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759145670; x=1759750470;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XxW5mXe/+NcsYxkIwV9fCeaWAATP0wBLi6jwkn7jUaI=;
        b=WpwQ9PnK1QYHR2qLpweZJtSlZQw7xATwGFNBjUKFBLhGRrwDf0cUr0hic/qNXvSQqG
         CvHEHnxGk3TXvOXj66kyFmxQ4Enzmxi6TYSNBh77xa4ym/2PrUzlpFuYY2u6wiW3eBqO
         4Tsq3MIgjsDhWn40/iWrqYqPgYR7BKzY0pxlDGXbQC2W42v6ExkEzuhimwJZS1L8LUvh
         xCvMb9zyhYnn0BOMCIWYT2Raq6/2EWXZvyCxcamk7SP3HqDF3rRfGhP8BKmbeZ5sjsWC
         yCin5mJXYrsaMuSNjkotizEvp7VII0MQQR8S6Esm+KE9fkwueBIXZDaQq3oafj6CYMDo
         nTmA==
X-Forwarded-Encrypted: i=1; AJvYcCUvtE18VXBCYFsLChXEtSrSjr9hip+AIHISMtYocghLrzo3nZ5SFEOasRBts/fkKCpXObBq3psaJtQQ+4dpxt/2Ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkNPQdGCdMpOX0WkezmIt5dE6DbbmqL0/G4KFJPOGM1Q1BBGhi
	YLZ9sbYxC76jFdZ8UZRA1sKYem3HdbpzLXzwZ53cJs9CxredY8vl2iuB/zHV7DKh
X-Gm-Gg: ASbGncszkwrvuW9ZKZCTVqb6GYwfPsenbRYvYMg9gdwWASifzxMqaAgIxcnBLUh9H2u
	djKPW3Emtveo6LEHBtaA35viujsiVsTgE5+sPMfKh1zoFWiVyQhyM0opQaVc7pbeVbpq/dQjhAI
	ZOlVSyuaRZ6zbhKmtt01YF2OXOgSnFkmKXMyJZ/Idlhv6XmzdcKn5w8t1HmtCrRoJ3wxsGLEF+Q
	Ec0I9NGlx0UQIVG9liFxSrTPFZzkVrV2b6LzRopclkyT7T6YQxXyrHFxauBW3zEQ16rdAEIAbrn
	kdgObXVVe8mVdFG7oxEbSKRdrVYhXsAPcHQsztBn13F5yoCyZ+/c67HVFZK7gQbYJR8rPcGZULi
	twlqj1COPrRvIw8u/JifwX9GbqR/pElG0to3VJ6Q9uJ7g6Sw55qiHzC+8KnDn
X-Google-Smtp-Source: AGHT+IG+uqPh/+yg9nLVhUT7H+/QPt9jClJCccreRxry7v/hhH3UqoRPScgx1ITFQsywhcBKEFFTwA==
X-Received: by 2002:a05:6102:3584:b0:526:db01:5fb2 with SMTP id ada2fe7eead31-5acd2e02eecmr6506865137.30.1759145669948;
        Mon, 29 Sep 2025 04:34:29 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ae3182b293sm3588902137.6.2025.09.29.04.34.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 04:34:28 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5c7fda918feso1139743137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 04:34:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWq7yB5r14XkwsighYhiOVGImez/qT8Ja8wyKwzQolpIU2+IY/f50kEjCDDg+Igeyg1R1r9wcei6ZR2GDAJ0kMoWg==@vger.kernel.org
X-Received: by 2002:a05:6102:3a11:b0:59e:a2d5:2945 with SMTP id
 ada2fe7eead31-5acc8e94d9fmr6861602137.8.1759145668352; Mon, 29 Sep 2025
 04:34:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909113840.122785-1-john.madieu.xa@bp.renesas.com>
 <20250909113840.122785-4-john.madieu.xa@bp.renesas.com> <CAMuHMdXfN2qK-Yd=ZAaLek=UMkLK+NzdU5aFr0ET3o9m8RB4pA@mail.gmail.com>
In-Reply-To: <CAMuHMdXfN2qK-Yd=ZAaLek=UMkLK+NzdU5aFr0ET3o9m8RB4pA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Sep 2025 13:34:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUt86L1Pcui8LD=i6hyqPQYnx=Apse8_h=YyFHAeCta9Q@mail.gmail.com>
X-Gm-Features: AS18NWAfMK9KQyXLWhPAcgQzNt-Bd1yk2_D_oAV-tjfTbvXk5XD0wBN0Yq448N4
Message-ID: <CAMuHMdUt86L1Pcui8LD=i6hyqPQYnx=Apse8_h=YyFHAeCta9Q@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] arm64: dts: renesas: r9a09g047: Add TSU node
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: catalin.marinas@arm.com, conor+dt@kernel.org, daniel.lezcano@linaro.org, 
	krzk+dt@kernel.org, lukasz.luba@arm.com, magnus.damm@gmail.com, 
	mturquette@baylibre.com, p.zabel@pengutronix.de, robh@kernel.org, 
	rui.zhang@intel.com, sboyd@kernel.org, will@kernel.org, 
	biju.das.jz@bp.renesas.com, devicetree@vger.kernel.org, john.madieu@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	rafael@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Sept 2025 at 16:04, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, 9 Sept 2025 at 13:39, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> > Add TSU node along with thermal zones and keep it enabled in the SoC DTSI.
> >
> > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
>
> LGTM, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

