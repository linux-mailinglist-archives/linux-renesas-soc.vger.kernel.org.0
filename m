Return-Path: <linux-renesas-soc+bounces-22825-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8071DBC92C6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Oct 2025 15:04:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 273513E4257
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Oct 2025 13:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 373A92E6CBE;
	Thu,  9 Oct 2025 13:04:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806982E6CC8
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Oct 2025 13:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760015053; cv=none; b=cajm7O94oXcRgvbaCajto1v155sEgdsa7xTL2jZZ+SVothNJL2cr9+KK6mPqRU3dectEHzKu23JS4kDzBSa3GlSkwsF7+MFIDdKK5tMBNiiZH0a+0gAxqZ700cJ72JzYU0///wCSiqvXZRXk0I34tRef3BpAF1ItMgEj2M6bLmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760015053; c=relaxed/simple;
	bh=lK0YRiXmrbwdKZ8P7SUBMaJw3qsSLA898PoG0gyE2ig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oyxMQpmXQVmg8ZjX6SQw8rWxWAf8+qhDpt90daN4qESmxUg8jmphbQUa+y7VYkfPCi8+asHRT6s5Rxf53FW/8hhdgjYr9Hsis0Hlvc2v7OpTNkCjgcIU2QnHkQdrhdW/8qz9hYlzRzBTi/4Y5mBZgKXKwbISyJ0OrdKFmrtl/do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-528a601a3cbso1368472137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Oct 2025 06:04:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760015050; x=1760619850;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F57hbkLvypADnVAMcMK58RQc/+BVGtUmwttvCSfbYq0=;
        b=c+kSE2tT0pbNbYlcYPly0JIQk1G3YR7pDinR5OF+aQYT+dp+llJKYEqozqc3hUcSgx
         CVcqbmJaDSMlE5QKdEmFRYRG2YCsNvu0aVjEJfG8gPbwevnnsn3+f9WQKnsKcgvjHfK5
         Kfxyjas+LqN29GQvB04+Z1YMGx+eMYP/KkfpdspDeXgG7PEPle/VjLX6mTVjPDwQWHPD
         m8l+PLlkoTwyncv5n16z08DIeFV7DVk8HFGk/mvDLvWe2vesliQYATyxkibgNJH95/0W
         3yhEDnJfKuXSvicyDuhoqvBHiI5afFBR94hIAfmNv2Vyjqlai5r64nuWwdTgqA+3PCq4
         vZiQ==
X-Gm-Message-State: AOJu0Yw/ZbN8PqB0DLgK6FrVFP7JYRlBX5Efj9nxLeovSaaQkPJHk6G1
	1SAljlVMQcpMun/mQGNTpIr3x5gUmHpDqVqOwe7+36UXgHnDx4fPY1UrjQBQzMIs
X-Gm-Gg: ASbGncuG0PV7EYDNoR2XV1FHsCIg0nZjvZdvWKycYWk62n3l6AiKIiosrg6DJTd45Vo
	Dug5wztJkRH8P6lOymAFSqirygVxpMO/qDcjHduGqhRZc3uPrfjACez40Aw37sT8VpMHVqpEBCU
	WUc0/nNccAKvAJiXoBkq4aiSPcU/eoDwGvsVLJkPkaCl0IGEAPDvrbs2hMRwqz4c/hO1VpC2kfA
	lMh9TdKLMPJntcRemi8iDpdgvxGgsEf2PsZAKtSmZ7V/I/hkgqXKUwZYQZOUbtASj4YZ6t9O6/5
	lAY/UOpBHY5obLeeSxwECZu4Ev1IqMBGp+mB9IQ8gpsJqn4S/YHuRwfPoqcBsuoarLQ7cfxP7Vi
	tgoNHGdCJZm8iwW8qgmGKjqTkXrjfY6heBDflJco7gDbEtZGIddU+a5hbqCxaCFRfoqSZu2gb8w
	pI/4gi2VnmEuo7CcXE268=
X-Google-Smtp-Source: AGHT+IGAJQ/WmkpEVP6YNeKdbGu3jG4+4CWVyF+VI4XEFJIn6vUw7Z8QCE0y+ikPDgqeVX0sJLsjkA==
X-Received: by 2002:a05:6102:2912:b0:5d4:1f2c:9b96 with SMTP id ada2fe7eead31-5d5e258d2c8mr3417792137.5.1760015049952;
        Thu, 09 Oct 2025 06:04:09 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5d3571cd4sm2465809137.0.2025.10.09.06.04.09
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 06:04:09 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5565a83f796so865216137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Oct 2025 06:04:09 -0700 (PDT)
X-Received: by 2002:a67:eacf:0:b0:5ca:714b:2dcd with SMTP id
 ada2fe7eead31-5d5d4d8caeamr3851246137.10.1760015049336; Thu, 09 Oct 2025
 06:04:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251009104500.69787-7-wsa+renesas@sang-engineering.com> <20251009104500.69787-9-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251009104500.69787-9-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Oct 2025 15:03:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWT5ErgNr=N0VthHf5f0AEAfsfFPWUSmhoy30QjZL=cqw@mail.gmail.com>
X-Gm-Features: AS18NWDUSk9bq9sp_OYBrerwfkIBZEZZxc3nmI1ffEo1gqmpf0UUhuXBoL8iw8E
Message-ID: <CAMuHMdWT5ErgNr=N0VthHf5f0AEAfsfFPWUSmhoy30QjZL=cqw@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] dt-bindings: watchdog: factor out RZ/N1 watchdog
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"Rob Herring (Arm)" <robh@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Thu, 9 Oct 2025 at 12:45, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Renesas created different watchdog IPs but they are all handled in the
> same binding documentation. This leads to a lot of conditional handling
> which makes it unnecessarily hard to add new items. Factor out the RZ/N1
> watchdog to make handling easier.
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Changes since v3:
> * added tags from Geert and Rob (Thanks!)
> * enabled 'timeout-sec' as the WDT core handles larger timeouts for us

Aha, so here is the answer that proves my assumption was wrong ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

