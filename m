Return-Path: <linux-renesas-soc+bounces-21895-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DCFB58FA8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 09:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B77048425E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 07:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546B327E7FC;
	Tue, 16 Sep 2025 07:52:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FF6272E56
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 07:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758009130; cv=none; b=XzjNM7BCJNN5FeU+LyVtNchwC0OBxaMPvHClpNzeWSbRuXbLIl2oI6WRJ54c+ygCV9ZKdhYbsGUyivBXA1JfFvHf4vptOEKHujonzZiUvYKZQElKat7OJ36m1TKKUtatkaUVivWDrY698Lwr+dg7k6Ca4p+glqlUxekBwow+ztI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758009130; c=relaxed/simple;
	bh=6yWeRjTd3EigN4C7xJHdCPXEVBDs9X8oQniavBQDHtQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IxhTWgUKEDYAk8gQd9hK3Oe2uoBDksVk+2YLJUeba/mrb72xcLisCDTX6xz7TPq6iki+hvJlUcjvTDOM8h0Q+YF+jAJtvK7Hy6fPjlLZ5QxZ/xMaJkY6zk1wdFpVrNRbNBGYV18TAiewpRx3L7EFWUGXZql/jCxjrHBQzmIKLJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-52e532e8198so1045278137.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 00:52:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758009127; x=1758613927;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K9F1be41AfAEhuegD+wVkRBLQQ7Qa3dUKKIwBvQcqqw=;
        b=bBW3D7emBQQ0dDspaEdpHxX14nDv7rVvJalLp5CqQNj4ZJQNoXrL1zJ1B1/rbMIgR4
         YkqEL/MCirWEvBuO9FUs23cK5J0dbUERIf0Y89HJyrX4xLC/9OTSH7HnhxGHKaPsPQAa
         Z2OMO9esvVWY72EK50BmXssjwPmQDjGwgehH66fpMWiq/736BaaikhRH1fSiJ1Mwu0FT
         6ypFrakvgJnFl+nqd6qOtqRHn1fE9Tyv+KruRT3L2vYQZHFIURn2HAYNrvX0Gv6jDNKJ
         Agc6S5hcoLU3urcaouhzp1hIvY/RJopeL7R54f1f9si+yYXpA4yICQI/25HU1iNxlqbl
         4J7w==
X-Forwarded-Encrypted: i=1; AJvYcCX9W4NhMOcphr/QUTuysz+oidA19ZY9SzcSyEtaHJy7ztX0lK3wD1O8qiB4FVrB4LC7melRiJr+m8OFGG0FqZR4Rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YybvDlJkwoqCM7/69i+HREor0XYT06WnJEWL2btVW3+YLqVu7HO
	fCc8RtjekxeWqMY4em3goXFDJ1hH/NhomKd4noSciE+/amWv72ikW7PO6XQXmoUO
X-Gm-Gg: ASbGncsz+5T0EMXHiKr0QunLVWBeISrXpFN79gSiMDK6oHsviaAXNT5ScKN+r0WfIP1
	MWSFeldZaWRKHG6N5xR6CY81PHYh9QavLhSJL5Y1RBRUETyNy43kMXijLzzNZynHRT82JXFwQiP
	XNrfHgl/jnamqu3Z7DGqlHAYcVroReSBTLLSdvWe3Xr9i7qCYR9ZuyxVBof7z8BFjwDpgej395I
	zaJQ12Dng0gGoQK3vJYKgw4vQpjuvtUf4dAnWX9BoFPgW47YmkgUtONWf7ED75xHZgiqWIHX6aN
	aqB3QnxBnqlAYx2L2C/7ZLpwpR53jo2OAhLY4kIO0l5U8gEzrpEaZskzyqYw1wsGMr7MKX/f61r
	9xtH71aMKho1d3QHuIR/C1CSA5c/wtc0YXoCmbkFFEVAuJQ70mpbBRRPnLWxF
X-Google-Smtp-Source: AGHT+IFozRtMGfGr86f3YdmcvwAfqvjDz69SmyeX6NRtEM3gEqoAqgV4cIFd/J6PlBXKtP8LKok++Q==
X-Received: by 2002:a05:6102:3ed1:b0:529:96b9:1fcc with SMTP id ada2fe7eead31-55611c509e7mr4525040137.24.1758009127248;
        Tue, 16 Sep 2025 00:52:07 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8d84fbfd6a9sm1452972241.5.2025.09.16.00.52.06
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 00:52:06 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-8d99807af90so482153241.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 00:52:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOvH+ZzleW5Kg8lmL6TDHMBsgiGxv5+ita6vcT+FoV4YsmP4k6QyYtB4V9tZhuU6TsNoohWzHrBf9721p+TOqdSQ==@vger.kernel.org
X-Received: by 2002:a05:6102:dca:b0:523:5bd4:f982 with SMTP id
 ada2fe7eead31-55612bda230mr4819073137.31.1758009126350; Tue, 16 Sep 2025
 00:52:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87o6rjvzf4.wl-kuninori.morimoto.gx@renesas.com>
 <87jz27vzec.wl-kuninori.morimoto.gx@renesas.com> <CAMuHMdVVV5tY_iwb=Xn6XVY-Ai6spBY70yXhc5VRxwDva8BGng@mail.gmail.com>
 <87jz24fqrg.wl-kuninori.morimoto.gx@renesas.com> <CAMuHMdX3cviP6xHnGP01kRDwuHRrHg0ZpNLV8Mf29MFS1B7S8g@mail.gmail.com>
 <87wm5zi5h0.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wm5zi5h0.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Sep 2025 09:51:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWsKj0s2LjGCOf8_Nm7AE3n4X30bxR6iUp8iCOofDUTww@mail.gmail.com>
X-Gm-Features: AS18NWCq3KxiPfd0GUnp0oi4W3bn5nezjEinSQF5aftVVknOFW2KMtqQ51sfeFU
Message-ID: <CAMuHMdWsKj0s2LjGCOf8_Nm7AE3n4X30bxR6iUp8iCOofDUTww@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: Add R8A78000 X5H DTs
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

On Tue, 16 Sept 2025 at 02:52, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > > > > +                       reg = <0 0xc0700000 0 0x40>;
> > > > > +                       interrupts = <GIC_SPI 4074 IRQ_TYPE_LEVEL_HIGH>;
> > > > > +                       clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
> > > > > +                       clock-names = "fck", "brg_int", "scif_clk";

> > > > According to the DT bindings, "power-domains" and "resets" are missing.
> > >
> > > Unfortunately, can't use for now. It needs SCP support but is under
> > > development. How should I do in this case ? Maybe use dummy device,
> > > but can we use it ??
> >
> > Just leave them out for now, but be prepared to receive complaints
> > from the dtbs_check bots ;-)
>
> OK, but I wonder does these really mandatory (= ) property ?

DT describes hardware, and SCIF is part of the always-on Clock Domain.
I am not so sure about the module reset, but you made it required
in commit 6ac1d60473727931 ("dt-bindings: serial: sh-sci: Document
r8a78000 bindings")?

> I'm asking because it works without these...

Sure it works: SCIF is in the always-on power area, all clocks are
dummies (the real ones are enabled by the boot loader), and the Linux
driver doesn't use resets...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

