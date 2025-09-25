Return-Path: <linux-renesas-soc+bounces-22375-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C04B9FA73
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 15:47:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B3F618897AC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 13:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D7027877B;
	Thu, 25 Sep 2025 13:47:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F081F416B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Sep 2025 13:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758808027; cv=none; b=q/tRy246nW7LwxYaCF0YorKI3HiFl5n5HGLkAUJRGmd1whQPlar14kiCN5oWsWiQoeQ21FHq5MIV8Za5uDDDPwkNijTRplMfpxCwE/DSmNlAGT/ct1nNtkjx4hf7RI8IQ5maF+IC/I943ZJox/iq1b1KcJcWSdlBtR3Z+IyqEms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758808027; c=relaxed/simple;
	bh=76V+ef64wstiWIEawou8zi8nz4mysgrIAL+3ytmcNms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HwTmCyir1C+ukgxBdT7pve6agfCVoPvo/AkUl1pJ4yVNVU6IB8GatqZcpx3HdwGseOiDx+pJfPNIXwzitWVIMj/5da2ed8beSwSGdjtC35WPap1OvNSoJIqL2mKW6cJR6e62t7B8YVMHDbBZpx7GYWj0ukvRWPS4jFtKejZj544=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-8e936be1359so658148241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Sep 2025 06:47:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758808025; x=1759412825;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e9u5mgXPjjEdl0wf/nsDsPLKxWAZf+E1AY9DpKNlfbM=;
        b=Ai6x4VDHiehz/ONeYEnxeuUijzSFK8aN4pnHEpKCTa9aWJTtDpgbNgWIVQfGnPx0fh
         G2/BsFsLmBi8ziU6k671O51fs3cdsNXhSZtaSext5PJ9sHyRhGnBLPUQX+rZDvZkZbJe
         VBHRXnzzU1sfTqygMOwiL6PtRd6qp5GahCnshawk9JdNX8qZz/4HAjsyYFbUHUswB+b4
         K03jyNVBXkAUyOr/T81vrJkHkzTUElXv44NneGh0ZwUmls/8h0sPBs/XLGrcrI+hAeUa
         4JaZE5I03uFWJq5npEZHTpyROZJcK8EJoqPYbLJDMizbZc+7RCB1H/2Pt7D5fFtlZdQp
         KAbg==
X-Forwarded-Encrypted: i=1; AJvYcCW/MITGpKTTLFe7WclvEZyw/OZlHFaTTSRefwjWD05ccUIkT+MvuijfqHFvppDbXDsdpMsW6eN4w5pKLu0SsBlq7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjMpFG3/blTBy3BxouMvVQjrBlz8aWY7Uu9Vg8XmxlPC+ZcN3K
	3K/zFgHl1A2hzEOGX4FTrBeRuGjbPCnTxqT1oLl3ymvwDSMXJNi6zx09C64mt2CP
X-Gm-Gg: ASbGncvzlrztZqVvHbvwCCWuQuO9WUVUt2VTOSYEGVKNzSrzB1ruziFwAWBCM+gRTwI
	fjyHKmtiVcmoexxW5qcbq/TqmpZqetqfIyCfLbhMS0f/B31aZqpHu9+tu9U/MLuLHteFtioahab
	2Hjg6vkP2pexsI80OdI6cI6IdCEx4Qaa2qASLY4Y/fiYl4CTpmLp13NXqMik8etAMkawnPCtfuL
	YHl2aiWG68sBWu/CwUtjIBHQzXB40nsO4Wc+8VHH43fHhUZru9onjLyRu9dcWlJCiw8Vtx7jT9V
	vtcskiBkTmR8fzII51DHP2bIWfD0YITzFDQ/6lK9qj+HLbGQKflM2G9vYmmDhLf5H2YyOuP/o/U
	O4Wq6fK6hhIpfoANmDG+A7polYgd0/b2zCr+lJMt/OuCr52wI9jSZInhaoabY
X-Google-Smtp-Source: AGHT+IEqvEcLjuvuJ8nWYy289xTREbItD8Vx7e+Ojff/D6TNYv44vonwgB6ZL6BORJ+mgbMvQBHkTg==
X-Received: by 2002:a05:6102:5107:b0:59d:2396:18fb with SMTP id ada2fe7eead31-5acd1c83bb6mr1495282137.25.1758808024586;
        Thu, 25 Sep 2025 06:47:04 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ae39effc0csm511480137.14.2025.09.25.06.47.04
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 06:47:04 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5aa6b7c085aso1141017137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Sep 2025 06:47:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUsqh8Uwp8MyOOyxwHwOgU1UW0DE8GX3O4A1hAjf15etsS2y4l2Oh6cSjUfHhIeDJqkrNGrotA2Hw39VWFFFLvtKg==@vger.kernel.org
X-Received: by 2002:a05:6102:3e85:b0:525:9f17:9e55 with SMTP id
 ada2fe7eead31-5acd43506ebmr1559910137.32.1758808023996; Thu, 25 Sep 2025
 06:47:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250922074101.2067014-1-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdXKbPGqAnAcL2kFyF6K3hH9=gr8ECAFVpkgj-OL1mB4eg@mail.gmail.com> <e19b5006-c6b5-4e72-a3bf-42fa6833936a@tuxon.dev>
In-Reply-To: <e19b5006-c6b5-4e72-a3bf-42fa6833936a@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 25 Sep 2025 15:46:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXOLnLbPNyRm5-=nHBNbVpE6GRkkx36SC1dgnjdOrzLhg@mail.gmail.com>
X-Gm-Features: AS18NWACshqhP7gJRe8a3wvNaNnnr4LUuRpGFp0o_IIumNSTw6shqMump8vYGSc
Message-ID: <CAMuHMdXOLnLbPNyRm5-=nHBNbVpE6GRkkx36SC1dgnjdOrzLhg@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: rz-sysc: Populate readable_reg/writeable_reg
 in regmap config
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: magnus.damm@gmail.com, john.madieu.xa@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Wed, 24 Sept 2025 at 17:45, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> On 9/24/25 16:44, Geert Uytterhoeven wrote:
> > On Mon, 22 Sept 2025 at 09:41, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>
> >> Not all system controller registers are accessible from Linux. Accessing
> >> such registers generates synchronous external abort. Populate the
> >> readable_reg and writeable_reg members of the regmap config to inform the
> >> regmap core which registers can be accessed. The list will need to be
> >> updated whenever new system controller functionality is exported through
> >> regmap.
> >>
> >> Fixes: 2da2740fb9c8 ("soc: renesas: rz-sysc: Add syscon/regmap support")
> >> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > How can this be triggered?
>
> I found this issue by reading the exported regmap debug file:
>
> cat /sys/kernel/debug/regmap/11020000.system-controller-rz_sysc_regs/registers

Thank you, that was exactly what I was looking for!

> > AFAIU, registers are only accessed as
> > obtained from syscon_regmap_lookup_by_phandle_args(), i.e. based on the
> > register offset stored in the DTB.  If the offset in the DTB is wrong,
> > there is not much we can do ("garbage in, garbage out"), and the DTB
> > should be fixed instead.
> >
> > Is there another way the user can access these non-existing registers?
> > Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

