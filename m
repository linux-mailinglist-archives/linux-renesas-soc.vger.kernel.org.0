Return-Path: <linux-renesas-soc+bounces-22135-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C390AB90558
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 13:22:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8667A17ADD2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 11:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A23C2FAC15;
	Mon, 22 Sep 2025 11:22:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED08E27F000
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 11:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758540175; cv=none; b=Z/Bk7URi0GtsTYDDMSWLAaASjAFhsjv6GMmYttP8eoNgvmzj/3ZeIIL5rnyvbgkQKpFMt+tgEFQVk3FOETPTBzWQTSGVo6ebTDEaa23hxA+NO1tpKKLGX4AfPw6Hsa8dt5Cdsqgpx5gjI+jq09VIWoDU3wdFgQ64Sjb+b+GgMOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758540175; c=relaxed/simple;
	bh=R+J7A/D/BT85jecefZhkauMnlhpiEuEVanyMh9GP9MQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W0YyMiCBNiWvvnMHxfc2SeUDWP0DJrMBEQLkK7FWuWDVc1/OLP15j8NhTiNSbCe6qjW+sS53e/ce9abWY+e/kQpxm1rXdW5jIvMGYRT5i/gh4Ik6kG75oLtgP8xd2c1M8/q/CgtRs4zWhgPmdVUV1mLMAxajUX6WBaewdBRhqjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5997f407c85so635198137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 04:22:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758540173; x=1759144973;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BeKLvvwALsTHiuzXo30Jgo5xAk/wTxebBE1AyiMQQmw=;
        b=l/LRADmuNpHF7xZdW6Kj9s9SrjwBUyChJbKUOTlLmqnUE22bC4bN/93BlYl/1qX2vH
         T5ZbmyL3c2hFTeQbrqP1tcvrxjvtKtmDWXV27jZM7UtLL/anj9CvAFFexTGQ364fOaG2
         TgEuUF/GqfaC4WUqM3FN73KkX4n7KiN9Ku6Gvt/rpvrlgy1YMYOxaauUv9Ns6QIp6QL0
         9UUqiERt66u/YeCUONsHaZxZwa3hQPaMFpJLWf9wZSzaXgj3k7T7wpKcSNn6cN6JDfPZ
         97eb3snNnA0iQKB+EvGJADC/l4IWX9YVKudmiUozNmQ9pLpPoce8AD5J8R6pFOEFAiMk
         ab9A==
X-Forwarded-Encrypted: i=1; AJvYcCVzXlF6I2NVhTgKabnPewPT9j0Y0SkT/HAhG1Wg+/ROXZmbMlD+SEsomL2uHqw+H5suWm4EOLwdBKJr4MleaK+Riw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1nsfXV8GIzcFnGlm3QoPvdYl5aN7wjKng4u6OSZ/5ssrQWtNt
	Nia632emZESu3itLFjCatOX//KKh3K3RbCkJNMLQZ/ZoMxNX3YoXzyk7tfKcztOF
X-Gm-Gg: ASbGnctGypq3jzxQcB149+N2ruQWB6OpXzsLmQaVLIdWUfwk40BKOgNFHL4v/IroSWB
	TR1NgfB5u0Si7xVkRZZ17PtEDjg6QJLYHutn49KU79Toj60/arliNYlE9JBD7NNCpRak9MnG4IC
	wqNYdhmUFxiw5tHT2ztBhDYBjY5B64CDXDIaFWoROjg0xszi7Jj6ipJi2vz5IgEobwLQgzQ3bzh
	l0OiBVhkfOupgE94FLuBSNSVxD69HIlflFv2HxFcDc2EW9ML0icWGbP7RZL+5/FSQLVRDFRO2Qj
	/f78UcI80XmDaSV8spLGn4AoT66Jye4/zWi3YZWYvYiE9yJ/NiT7lz7uCqC11WlIF62niaxaTRB
	G+UM31qtHS1tn0JK8vHh/7vf8HRFI0crVbZ7nQjoAUiYSq3Hkk+5s9xhLwnHN
X-Google-Smtp-Source: AGHT+IG0StetljHGjmXHgayUCOuS5hwJhhoSyuzh/3UX7ffvUiVm8LPZI4PT4FU2jZFoCdWWY4hahw==
X-Received: by 2002:a05:6102:3583:b0:5a2:8581:e76a with SMTP id ada2fe7eead31-5a28581e92amr579478137.31.1758540172517;
        Mon, 22 Sep 2025 04:22:52 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8e3e75254casm1944046241.11.2025.09.22.04.22.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 04:22:52 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-580a1f1f187so1380744137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 04:22:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV5jy+7177IoaJQ1docmrMjQRdIEvTABVJ4MtUYdvlKf0xJpAGVeUxB5qNM1F5DA/tYUM93Ujbvr/focfZw0ARk2Q==@vger.kernel.org
X-Received: by 2002:a05:6102:44d6:20b0:58c:aceb:1e3a with SMTP id
 ada2fe7eead31-58cacfa662bmr2899131137.11.1758540171927; Mon, 22 Sep 2025
 04:22:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918030723.331634-1-marek.vasut+renesas@mailbox.org>
 <CA+V-a8sjPx8U+MB3v-SxErRPqbz4irAgZhCvd5CHY=6uO_VoyQ@mail.gmail.com>
 <353db156-e518-49c8-96ac-bd138ee64a01@mailbox.org> <CA+V-a8sLxBq8vSuq2HxcchpLqyQxqTRtkWjUKsRN9tBqGhU7mw@mail.gmail.com>
 <9dbc6022-eb97-49af-bda7-1a7a8069609a@mailbox.org>
In-Reply-To: <9dbc6022-eb97-49af-bda7-1a7a8069609a@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Sep 2025 13:22:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWuCyq+jXSasGdrMOSBP-XmDG-wHsBaXUMTGA3mtq_C5Q@mail.gmail.com>
X-Gm-Features: AS18NWCcJxRGFKqDDP8RObyysXU-qowur5BL23YHV7cqfVEWdGx3y3-RI54QevU
Message-ID: <CAMuHMdWuCyq+jXSasGdrMOSBP-XmDG-wHsBaXUMTGA3mtq_C5Q@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Read back reset registers to
 assure values latched
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, linux-clk@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Fri, 19 Sept 2025 at 01:16, Marek Vasut <marek.vasut@mailbox.org> wrote:
> Thank you for sharing this, but it seems this is not the case for R-Car
> Gen4. I found out that V4H and V4M has additional "synchronized" and
> "asynchronized" reset types according to SRCRn_FSRCHRKRAn attachment to
> the V4H RM. The PCIe resets are "asynchronized". This extra readl()
> added in this patch is turning all the resets into "synchronized" and
> therefore makes them behave as expected.

Interesting...

So e.g. MSIOF has synchronized resets, while I2C has not, although
both are connected to the peripheral AXI bus...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

