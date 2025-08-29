Return-Path: <linux-renesas-soc+bounces-21082-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DF2B3BC6E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Aug 2025 15:22:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B9797BEF3D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Aug 2025 13:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCB7B31B103;
	Fri, 29 Aug 2025 13:22:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADB631B105;
	Fri, 29 Aug 2025 13:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756473735; cv=none; b=txI2PKlsz16rvn9bHVbbHY4z9YkPM0B+K9wNsVI6b21Y7kcAi0tqGZrMgtt4kvYQh4XTqjZUTyHG3YMzNH8mzO+Zk956+ett025llDpi7FRsfXO9QSSTqsuG5qllkIURgUeqq5L54mjaw8seNaX/uX7J4WLlfOI82thx3hEIt4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756473735; c=relaxed/simple;
	bh=Ar2OsvPnAjxFcbef4Vsni1oWGjY8CLV49kNcjoqvht8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FyiduajRWytJxf7MEmRskSEYCNE+QwaJXSsRNRjlEms9Bu3JkUI1byAKhB7uNd7Wecm3EmuI93Th0tmp8x+mBwBVLeXKPnl6gFL8+Mwn8Xu7pEcI79yhgIjQZmehgKENUWH85UXc9SpJaZVe2Pg9A08Cdcs5FASWQrGmFZ3mwro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6188b5ad4f0so2946073a12.0;
        Fri, 29 Aug 2025 06:22:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756473731; x=1757078531;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gh2alEfiDxyOU3T+DKRgNfuN6WrImZdpeyvNYQPvGF8=;
        b=OnCruk0WOcBONLiNJG6vduzzCgVpfECpWLPjRlbSSp73l+nFEJbKQhO4viqgFcl42D
         TMeCjHTCLan42ekUff4QizMePMY1MzF/fYU0/sCog1zuWk4wkuhNbrKN1GojE0mLXdDC
         y8D6nXrHFwSbipY9L1h6ymXOMvNU3oVMKrPO/8zg8KDTA49HKggOeIZHzTFYDGMydsEI
         2UwOMRa0EllGSNsuspk5HIbh05YDy9i43Jhwnt8ErOWEBHYt1dJdyEvJuXq9mrBSPeyM
         v3niZPgpUUflvSweHFIWNWTFp4h0+WIGtPUTvf/LSinHLKXs/1BYuMH1DOslnlFEkSMW
         Ciug==
X-Forwarded-Encrypted: i=1; AJvYcCVdBLjzskLDlNJRrrQWygdQBxPkf0HEvxK0ME02Ne5QSpBNP52m/nxrYUauX/yB41LV/QpmLUspVWjEhQHH/l5guxA=@vger.kernel.org, AJvYcCVyEIJJ2ej3HV6qqQxxHymTMw9Uc3ljei7Th/Cu24J/LUEB0oJD1l9tx8K2XKT1B7yZBZAWL/fhS0RChe2z@vger.kernel.org, AJvYcCW8KFnEFEYIlKr/bEv+/jHmmbPcR950eHvPxlD+8Fu4yX2Gczmj5l36+JTrFzVtDAPzmfjH++t39Kk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxG/7os8TJP500QxLWvhoK/DvYuxPb+UAxKi5TmJcxFR0lDzXJD
	lQqaUd5l+kswQDf4aXBK5EYQPUaECJJDiwTtGp+gS1NjzFdNw8iT3lzbMLxk6gPfBpA=
X-Gm-Gg: ASbGncv9KQ3uompR6G/q1/mZq9Lh4TTq0oW2iCBJQ4KoZmsq09zRvvtdxjDKY8O6X9t
	ACcwzqXcUlFEbaTwkg+ErOPpbzfj4q8QwIOh21gtdEdurEco4VCCRKRP9EbgKxxf//848j5pUb6
	fw2rh4uXWkn6Lh5X7I0saNHbC45rMwbyCgq8t59TkhbBNtLVr/NWM8kTXEYpmXi6ifzcIJAvkFO
	2vyPsF7KrJEfwFkHmdR8wkBpIUDgfhSuiRJ9pMMtcbmUOf9Kppx+mLAF8ONY7L0i3nM/59gColt
	32URq+w1jlrJ1UR3vHKERbM8ATNtb1W7dOqrODYrRnTQCwjeoPeSjP/LpNmrCIHWKuiJVQyveTE
	FB7iRd1eZwQf1twqzTJz0xctWX1Yi53gx42IFxzvbZANko/sSoSKTOXfp9jC+
X-Google-Smtp-Source: AGHT+IFjA3Z+Z0LsUTsSqupHI/lw8DWYIiHpxBxHReOc39i/DcUhNqbME1OwopgVE4Q4MHyZszYMNw==
X-Received: by 2002:a05:6402:84e:b0:612:a86b:ac79 with SMTP id 4fb4d7f45d1cf-61c1b45403amr21551329a12.2.1756473730771;
        Fri, 29 Aug 2025 06:22:10 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc1c77f9sm1757712a12.8.2025.08.29.06.22.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 06:22:09 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb72d5409so350587866b.0;
        Fri, 29 Aug 2025 06:22:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUsVHlYzFI3/EMw2Pye2U9tyCZZNdMLizicjEmPpKkx3J4m19VVAJoyVaer5rC8wMX+o5rZDKnboydrkhld@vger.kernel.org, AJvYcCV+XHMzwHWXxIz+tmFyme8Uj9XSzrOImRir+7jXUjGHxtFNDMPR6+ffuXXY6Hw6E9Ookqqi3kzBMQs=@vger.kernel.org, AJvYcCVVIjv9CnSse+mMNbnDw33YdU8tMZRE2gBb7isrs8G+Y5clyNdzwaQY1r/yqJfXvpSn+QW4vz1CsABbr+rmKS7FOQI=@vger.kernel.org
X-Received: by 2002:a17:906:dc8a:b0:afe:b5fa:2af2 with SMTP id
 a640c23a62f3a-afeb5fab37fmr1034747366b.64.1756473729266; Fri, 29 Aug 2025
 06:22:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABx5tqJ0+1bjoMM4qPS94coa0wyQaae1gJP14pUKk+xVgD5kaQ@mail.gmail.com>
In-Reply-To: <CABx5tqJ0+1bjoMM4qPS94coa0wyQaae1gJP14pUKk+xVgD5kaQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 Aug 2025 15:21:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXkrx7DRrCBe7uKLrxFOnwhbVwtetC-VVbsW-61SwvvyQ@mail.gmail.com>
X-Gm-Features: Ac12FXz9u_LsmYONcCJlsUxq9RqfLUhM_38ADImMh0QHC8dVLHaIV0v7KV2X7Ag
Message-ID: <CAMuHMdXkrx7DRrCBe7uKLrxFOnwhbVwtetC-VVbsW-61SwvvyQ@mail.gmail.com>
Subject: Re: Bouncing email for Renesas Versaclock 7 Clock Driver maintainer
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

On Fri, 29 Aug 2025 at 13:25, Brian Masney <bmasney@redhat.com> wrote:
> The MAINTAINERS file has the following entry and Alex's email address bounces.
>
> RENESAS VERSACLOCK 7 CLOCK DRIVER
> M:     Alex Helms <alexander.helms.jy@renesas.com>
> S:     Maintained
> F:     Documentation/devicetree/bindings/clock/renesas,versaclock7.yaml
> F:     drivers/clk/clk-versaclock7.c
>
> Should this driver, along with clk-versaclock3.c and clk-versaclock5.c
> be moved under the drivers/clk/renesas/ directory?

The latter is meant for on-SoC clock drivers.
The versaclock parts are "discrete" clock controllers.

> If not, is there anyone else from Renesas that should be listed as a
> maintainer instead?

Checking internally...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

