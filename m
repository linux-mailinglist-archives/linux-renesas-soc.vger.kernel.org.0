Return-Path: <linux-renesas-soc+bounces-20027-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D014B1C394
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 11:42:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4917D162543
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 09:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0843928A1CF;
	Wed,  6 Aug 2025 09:42:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71601189;
	Wed,  6 Aug 2025 09:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754473367; cv=none; b=oK9GKLgP7FG9OiGRiaqDD12H9zAI0ohkXdFg7iwNHadAnQ6DLQJiYzGvLyAkvpTeQKjZppggIqtc2NOqij831s7C+JpanXXNyLgJe0esWUj9DUuppBchT5yPPKaIVIoaacGIq6ov5PIh0DzO7/rfwgDk4krkH2b5oJdfbQ8YfTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754473367; c=relaxed/simple;
	bh=v50oy7iU9A3erJGRNY9dcfwFbcwbvaMY+STaCmBch10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SsUtOFt7YdTnm/xW8QxzqlRCjeC9QjESmF75VpZZAH0q5rlwXTZcsacVhTy5SuD1qL4H0QMYcQJo+vNrgZJe66n9rpQShFKxcrwgMMrSMKRUD7V7KT9XcJNg/apneQE9BXb7SqTwmHdHAodC6xRlw0BJ9r+rZ+xdgBVaGu2GBvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-50307b67169so980949137.1;
        Wed, 06 Aug 2025 02:42:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754473365; x=1755078165;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3qyA8MYZOqOSI0fqM6rEh53kXjTBtoeHL4Ru//M5Kfc=;
        b=D00uWWGUhpHH2Dkm6MbsKcBNIxSOu9in/jm1PhCqAJP5Cc3WDsUwm5Qv+JLm5BUZ3f
         bdXTK5wwg34d5md8F7XTT+Ok5tpvTgEdaRm5/FMBpGc2WCXpT6BqBfKChidpSZADlkY4
         RBO6fN+QbmMlRdEou5Ci/z8GPcE0pj/dt+ZY/y7auXsWYiRer8PcVUBAQRO8mDR2vtIe
         h2IXIfG7Qq+V1WkXEH/gTDsJ/aoCkFGxp6RC7C8Hsugbp15WFX9IZ2psQ03ufVEFsD+4
         JXyg3U99nBNxAqv6qDDDxTwZmyXcPsjmkjvvWNqMsHZKyY23Mt6bYRX9dVB4KcpdrlLz
         JTvA==
X-Forwarded-Encrypted: i=1; AJvYcCUbSCYjw9FEnfpAPTG6xy00l1+E+yp4xKKhXJIsqe1XIASniLqB23UgyoAElyBKC/XrFmhEq4u9uTwRsKKC@vger.kernel.org, AJvYcCVIOtKuOf5sFv86WcKGBRY7on6Kkj3OELcReznXOMh5eDCxGnhzxnjbghOvUfcdGI2INiDqmXE4LIs=@vger.kernel.org, AJvYcCWjzB51eoWdbb5r5prLtiqTgcH1bhmPgepImZ5qd4MLaPt9vm5iBzmrgKwO28q7be2Cu9EII0WZBwnkv6Kuuag7XEo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyckcSaIwI+Sp8z/x8cWCDXmI7aBqzniPuWpleAD4BnGulT+/t5
	EXJBVEVol7RG6pu3MI0rKauuiZt/u3lgLD9JurrxFayNJLClsO4y69dtvWvTnsiD
X-Gm-Gg: ASbGncuQav069oUU/UimEPYJ9Pe5PV1SnZZW0AMhJtNGkbjvIqXqGetAtWMqFbch1fC
	tccvpCsx1ZB9/epGd4EbceoUx3SAqUTQQu6ljm/BqwIlNZ2zCIRH9Z1YEzK1UKDDQsdMpr74qji
	EcHiWwH4bfuDP4D8xKZsqC3RNnamof9i9qC2tjaxOT5D/JOS7cC4SW4dMHhZJWMemZsSFY5JJwq
	GWN+k1uQYBbpRvySUTYOpnx2kqf+QrpDLIQr3sTCgv/Z9F2FVdKnhB/kJwrBGFVC2zLUDZtjPf8
	0s0QaTl4oIEWq0iOq22PV9g5nlKlceJVVI55H4doUvbHhGFrkaZvhTbYZv6T2YtH6/WBbwnZqdw
	B4uYQXM9RTn7tZ7V5LxcJiZdWNheH4gq1Jx14yQx9FyaJf4R9yz5qnCvjl2Fx
X-Google-Smtp-Source: AGHT+IHGxgDbzjGwB3FPiaqC4KafX4mwN/qbVDvU2TiSw1LRUFILGlRYW9u+k7RivKu5DDP++m8S+Q==
X-Received: by 2002:a05:6102:304b:b0:4f9:6a91:cc96 with SMTP id ada2fe7eead31-5037aeec29emr817901137.26.1754473365019;
        Wed, 06 Aug 2025 02:42:45 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4fc0d42ba5esm3420720137.15.2025.08.06.02.42.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 02:42:44 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4fd210f8448so5722698137.2;
        Wed, 06 Aug 2025 02:42:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3CphA4rGF/RSmc+CnqcUXV5XnAosyI7wIsjobwfn+F6UQgmt/i3VDgXpxVw5B9zfxqGNwLROwJd3g/sCCAqeCDoc=@vger.kernel.org, AJvYcCVvTBs34Da2btABShQekfvbC8t9kMRqXaFl2oT2ceEvCK/1On0DCDRQMAS4+Bltzf99bmKHo3NJu/w=@vger.kernel.org, AJvYcCWYzueZHMHSqcxEwYoXnR0rZEslq/wjhrA1bLhMgsTTzvnzbTQt+pBprzE5V/2OBdSFD5oxT2cf/RFJpw2V@vger.kernel.org
X-Received: by 2002:a05:6102:5f0c:b0:4e6:f7e9:c481 with SMTP id
 ada2fe7eead31-50378a39f98mr791877137.7.1754473364181; Wed, 06 Aug 2025
 02:42:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250806092129.621194-1-claudiu.beznea.uj@bp.renesas.com> <20250806092129.621194-2-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250806092129.621194-2-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Aug 2025 11:42:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVRru6aepqdk=Ubx3EcosTATs39E2Lfjo=NWdbm3iafaw@mail.gmail.com>
X-Gm-Features: Ac12FXxoNSlHsrZlZUR-0hbrwAvIN8q1JAuCeFrK0zZtqltsVdOKqfmvUjhJTno
Message-ID: <CAMuHMdVRru6aepqdk=Ubx3EcosTATs39E2Lfjo=NWdbm3iafaw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] clk: renesas: r9a08g045: Add MSTOP for GPIO
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Aug 2025 at 11:21, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The GPIO module also supports MSTOP. Add it in the description of the gpio
> clock.
>
> Fixes: c49695952746 ("clk: renesas: r9a08g045: Drop power domain instantiation")
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

