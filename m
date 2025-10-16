Return-Path: <linux-renesas-soc+bounces-23125-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77719BE2096
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 09:54:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D30BB5441EF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 07:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 642332FD7DE;
	Thu, 16 Oct 2025 07:52:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AED2FB989
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 07:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760601142; cv=none; b=gJ3Z2tMnc2Z0xirUEiqqdjt5hK3dKba7O2Z8oIc/M3BjRaIAaJYswYxcZKvK0h7qKh5A/niB2//8GHMfi3ebuoTQF8MfXtB1jHdxP8CcodPDS3J0YRjdn4ostFx3hBh4GXuQbnncfqrIlubEKHEtzHHGLPizOIa5KhVToiD7h50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760601142; c=relaxed/simple;
	bh=AJH7WrJPOAN6kLMOwNFtaIrtlfTcjK2iYHOpcKmV6vg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EuDJ1JXFl9TsK3murVVpGytAcRYyrz3ufRTktd9mukrpdrN2zA6db94WN6hrfTQTm7ev9BZnXGgtWzG0tkC10LGdkpTuId7m+azNtpMQAarJaj08wUr7oOC3RKCsGl+HKft4B1H7rb4gSjBpZVW21gTYy9rbYgyNZzGIGdRWIwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-59a8c1eb90cso168789137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 00:52:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760601139; x=1761205939;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EM+UMNW8Lw0f3qHhaxOgNQsZ553oQZShOlYIZj5jsS0=;
        b=dnDK7e2bmN+DPaX/IuiRmU2iqGRoxHMKjMl7w8MdB3vcG4Jdt5mZgdzYn3iXrckuv0
         LvuTRGs7I0i5Nzt/fKuGcfWQlelDNcePX9ZvLgQ/pm6S886Tl4JeA2fIfdPWqnPHGicQ
         AdAB4gThT2fU3/rCnZL7HEddkFcb9pg109NY55gPNjw4Uv7tkElf38kv99SnInexdrrJ
         2SouqYhuo6jKLrdMSAeh5dtN1ZbmtVhMQJacE9DW9vspB7vfeyeFD9e0DvQAp66KfKF1
         ru+n3rVm5SjSBeJ2RYBN3KaQw9gGHS14xe/C4K5J5TZzAxHHdm9S59nUp85qy8fcHitc
         QIvA==
X-Forwarded-Encrypted: i=1; AJvYcCW1avtKgRE3zSrSOvWV2wRlKeqCBkcZTf+YDAGpq+XlsMfiF/jaU0ty6VQOsqT0OczLpkaNWbRn3qEDcntUGmsYsA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrxc+oEXXwCRmPahcqB9qpaPguhvvr7SDP6mZdvalNL/sRASZm
	POXQ6PysmYxX70EP5PMU29/hBT2y+rhGCBlSgyeyxHbWuxn9LU4FLI10iAw1PMYI
X-Gm-Gg: ASbGncu0gP2skxVnfzLgkGfKz2YYj1SF5o9p1lrJaEWgwVWPHV14fhsH6KEKyv13SQt
	O3V/wN1twrWM5B8cHLgXWl++Yw21xZTjnkExUNkM0/dFaQzAFrpkZlVPEtuKTP8AUwTaCsxWrcd
	RC/XpQ5WP0aRdn+tplHOxLUv40sRJJLNwWgdxEn3a9uIb/KybLYFIQV8hbCi51S08B3cABscpwx
	U2KTXQ3o7eRW6AdaM/ISBJhM85ygeGMQl/AwMwKN9cAzBGA+F5vPZZWSQI4kPs/fYQHnFtkKlcx
	PV2ZtBlZaNnDu5JAywvCRBl0bQ9tSpFbmmrhmb8GldbjgIEJJTMYrUNfTqNGbp9XEWezS+6hDdo
	tHiPH9jGoqMM7gH5BvsxGMJklp7/0GgGYd7TjEJ7FPlkoGIylHmpHKzZErvzlbeTQy4qOOUH8pP
	55tYZwn5uZJ9cmrxHFALg9Zb4lraGaEbqmO4GQhAp71Q==
X-Google-Smtp-Source: AGHT+IHR3JsKywZQAdhJ5kIsvohGhmHRdCSZudEIAhAfDZyY3HdBHR63pINHC0tJTxnmXQpyouHECw==
X-Received: by 2002:a05:6102:290f:b0:5d5:f6ae:38ca with SMTP id ada2fe7eead31-5d5f6ae3bb8mr8206825137.41.1760601138697;
        Thu, 16 Oct 2025 00:52:18 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5fc8f0a48sm6048703137.12.2025.10.16.00.52.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 00:52:18 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-54bbaca0ee5so152211e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 00:52:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWDhIkTgKNTdvl3F04hW4MpLGW9QlMKvKW+IqY+9dOrLL5Ha1kjEJEcmwugyR4MLhC8LvVc3XvA5qyXt/+L5IMZQQ==@vger.kernel.org
X-Received: by 2002:a05:6102:4a96:b0:5d6:5ac:3902 with SMTP id
 ada2fe7eead31-5d605ac3938mr7430525137.21.1760601137749; Thu, 16 Oct 2025
 00:52:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015155905.186612-1-marek.vasut+renesas@mailbox.org>
 <aO_eLEFLAnjc8n4G@shikoro> <62670d89-56f2-419e-8f80-0536858415f3@mailbox.org>
In-Reply-To: <62670d89-56f2-419e-8f80-0536858415f3@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Oct 2025 09:52:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWAhew_Mp0g71F3TYBtg0-ygyCA=CUN+kiqVyQBv7-4jg@mail.gmail.com>
X-Gm-Features: AS18NWAX5i90o9h8ql65F7fSE-NJTpXX6NfoQ0S55rLMlpTfCwhxCtz9GyA1ilQ
Message-ID: <CAMuHMdWAhew_Mp0g71F3TYBtg0-ygyCA=CUN+kiqVyQBv7-4jg@mail.gmail.com>
Subject: Re: [PATCH v2] thermal/drivers/rcar_gen3: Document R-Car Gen4 and
 RZ/G2 support in driver comment
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-pm@vger.kernel.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Lukasz Luba <lukasz.luba@arm.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Zhang Rui <rui.zhang@intel.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

My
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
on v1 is still valid

On Wed, 15 Oct 2025 at 22:13, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 10/15/25 7:47 PM, Wolfram Sang wrote:
> >> - *  R-Car Gen3 THS thermal sensor driver
> >> + *  R-Car Gen3/Gen4 and RZ/G2 THS thermal sensor driver
> >
> > I am not opposed to the patch. Just want to mention that such
> > information gets stale all the time, so I would suggest:
> >
> > + R-Car Gen3 THS and compatible thermal sensor driver
> This won't cover RZ/G2 which something else, and Gen5 seems like it will
> be also a bit different, so maybe the list is now exhaustive?

Until it gets reused in a non-R-Car SoC, a decade later...
BTW, do you know the origins of RZ/T2H RSCI?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

