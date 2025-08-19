Return-Path: <linux-renesas-soc+bounces-20697-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D57AB2BE7F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 12:08:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6C9B688034
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 10:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA25311C3B;
	Tue, 19 Aug 2025 10:04:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C4613D8B1;
	Tue, 19 Aug 2025 10:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755597879; cv=none; b=koUPFS5+SOFzKYyhKJgAtJKRmS3YjxkcKepN8b4KPVveHJElbN6l+BxLL8aj61ZRnCTiHcdqvp1Lzi6MCUy/Zy2o6X7+Eauv/53trlw++xoBFamm1TFgPzl8L3H19yYaSIYPwEfoAFgqeQj2A61w1WZDYWgAJCYyxMgwkxiYGtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755597879; c=relaxed/simple;
	bh=nhMJ3waYvDL0W5VCB0R54bNkmZTRzkLn66dCP2aOzzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KMHppAv27zH/riFAGoQyNnF4CMcuK8lIAGY7vLav+kWrlFbm33lXfOKrYuX2oXlmkMFlF8lGd7dGn7sp8nQ/UyIF05wLNup0+gttAiF0AuOr6otd3PKjHzO4VdCWNveftzdProibkpNPkHsEdxtcoL3emV8L+z0poJ+tCIKHsu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-53b17193865so1499829e0c.0;
        Tue, 19 Aug 2025 03:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755597876; x=1756202676;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lJlWkFNwc4UI7xTpJnUAjxLWy6ein9QK+nD83rWRU2U=;
        b=YqaF9osGW3iNiJkRxN3/qxyEf1R4IKFqM0xgrQcSjHHpJa0ALnekyo0APHnCpx0Dug
         clGDEJM7YoltbZzf3y4ssXlpMDWdX0FfWaZizy12l8BVFxMTZNB4dct+R9Os5aZH7KCb
         sp7LV3VlpKLn3WYf+9FajGU36EdIR79U7H1OnFbCrG4lZXpEubFpFNw9cCdmjyQL9DQn
         XvTLyit/xt/92BGogzCw4ne//k70gX6i/4awmxKbCEw9gLGnH7/RpeDjxttNqf/B+DSJ
         dtQEQdUjS6LPxa0WDqJNZKFkb5d2h5gwIt6AXV8aB0JMMznddW/WFglHHrmYHLNGKZtI
         xBFQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5kE11fKeCK9sTvtLlhcuNQPXvWYgxZ/ftinxOkOO7VZwhZHyduGViIQ3OeN1XzqDfTAPG7f+EbqyEt/9gVTYUGF4=@vger.kernel.org, AJvYcCVnarQCFdaVXMcgcOYLznLPykqE8OkyjEwXmRKf1axRh7C0N2z6PXjHgG56Z0/xtnejFv0syJDupL8HeCap@vger.kernel.org, AJvYcCWTHWoSUWtoB1OaNNASTdRAogNzclsyx5iudTn9a/VNPSFdwYWJHVFRddXZ9QPRBu4aPkhga2sF9Vda@vger.kernel.org
X-Gm-Message-State: AOJu0YxMkdjphZawMf1I1yPd0IHYOsdCQ5mdkamKY7iCeqWbbzVpwxph
	FDRpQ75T+fW1HXVbK/5J2w7mLgjwDGlZoZ8gA04SMl8QJ8fBBTTRPESt/ooK1kyE
X-Gm-Gg: ASbGncujAqlFYBSruAmrDNzpQHvI1hkAVRlgLi3I4nMAhtMYFaUPExhhlySsQFR/S93
	kEtTNvdFQeMBf+EiLe/ZcTKAUBd8Z2gRQHjKayuVy+lZQ2ld9x1orJw3eO0qjA+meY8FyXQxjDV
	reO9V5Z0VGNQS16Kt5ph6znPwMWnJU/a8JUZc2wM1m3GoNgO94Bh+3cNGbTcepC4DdwD/2AetPB
	x/3+rkJZu7mFIMcUBoBZSBwwW90f/WLVLc+3tU0xcze/sm3l9lqHZQ00SIMPzKUymx36FUkRyO7
	zexIbEna8I7kDNGa3NjV57AADkh+6dTEvzolYu5CgENRkWC4Ufz7VTzJs+nfHIbLnzsq46jd//A
	/mE9EZn8mtv0U0saaW5+dZBAc2OJdryKsKm/Twv85d/BfyLB7+V4PTsI4SmvX
X-Google-Smtp-Source: AGHT+IHlSsALr/U+WvxQxhrBN9xWARlUTqCQquT6G67WYhUL4OSDCuXol06J4f6PMyNSYIsYBcyfBw==
X-Received: by 2002:a05:6102:3706:b0:4fd:3b3:d4b0 with SMTP id ada2fe7eead31-51923d37e34mr535532137.20.1755597876013;
        Tue, 19 Aug 2025 03:04:36 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8902780d0easm2354869241.11.2025.08.19.03.04.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 03:04:35 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-50f863d662eso1396476137.0;
        Tue, 19 Aug 2025 03:04:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUobAYZVW0jV4hviHWwVI/R1hO3zxBs8Okla8Sp54/k75hgsOPF/nbVjlL8q1rwDNYNXA9kKW3Fensjra3NDbOzoY4=@vger.kernel.org, AJvYcCW5MrJngfJQlaVKj+eIXcxxRLYGokyWysaAckalx7/2/LY/qhlnrhCrcmwPAsrEFslKT9uuN2LgKcb2@vger.kernel.org, AJvYcCXvrSQv5AG0przTOwdpme07qxPRfAQMonz3uxzvs249mWW/VoWbFvsO9amtjB0/4NHADgY2QPcVPHDJ0EGJ@vger.kernel.org
X-Received: by 2002:a05:6102:3e89:b0:4f9:d929:8558 with SMTP id
 ada2fe7eead31-51921bf488dmr645140137.10.1755597875622; Tue, 19 Aug 2025
 03:04:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250727235905.290427-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250727235905.290427-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Aug 2025 12:04:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVuMQ8gk7BfqS3_ckNvWuB2ofyWmSuW9xcscDFmKxGrhQ@mail.gmail.com>
X-Gm-Features: Ac12FXzpimHfkylZhKiWWGzMW_6TYqgkeSKP6CpQ8wJpP5FhlHv8WCtrU9fD57U
Message-ID: <CAMuHMdVuMQ8gk7BfqS3_ckNvWuB2ofyWmSuW9xcscDFmKxGrhQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g3: Invert microSD voltage
 selector on Retronix R-Car V4H Sparrow Hawk EVTB1
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Jul 2025 at 01:59, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Invert the polarity of microSD voltage selector on Retronix R-Car V4H
> Sparrow Hawk board. The voltage selector was not populated on prototype
> EVTA1 boards, and is implemented slightly different on EVTB1 boards. As
> the EVTA1 boards are from a limited run and generally not available,
> update the DT to make it compatible with EVTB1 microSD voltage selector.
>
> Fixes: a719915e76f2 ("arm64: dts: renesas: r8a779g3: Add Retronix R-Car V4H Sparrow Hawk board support")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

