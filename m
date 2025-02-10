Return-Path: <linux-renesas-soc+bounces-13013-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64116A2F2E7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 17:15:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1761B1889EF5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 16:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30D092580FF;
	Mon, 10 Feb 2025 16:14:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C95D1F4609
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Feb 2025 16:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739204082; cv=none; b=Eo6IemdhSJc2CLdxIciPGaREuoZWCR9/3jOwngdM/HekUQAZJG5JNQaSSwkR95CiOPXMChiQlipLXR8t7wykbGxoJKROQJP2BF1DzbhaFBTN3OUP3LQOw8cnTSOkcUbTOWj49oeBBT3/COyc38GdNBKQmdPkAM4fbu0xbFMMDhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739204082; c=relaxed/simple;
	bh=u5B5BaUIbKY67asPnZulk6SCYRMsnIg2yM5cwrZupGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I41ovmSR5yog7Yu+O6DXvahgCgkoUryQZCxT6TWvj7ND1dQI0YXN0epfyU9phM54bc4AcM9HbdXbQnj2TRtyzCqACBdqsfgR0SFrD8M3atf31fvFWxGPuOjMxLaIZti7lPujE8/Gt/6mIocv5ve0s1tz8BdHP1XEx7jAje3zD8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-866fe7d07d0so1050120241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Feb 2025 08:14:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739204078; x=1739808878;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gcHURsGRyqGHMRG97wEPnf5Pws9q0cKD5BNKIMlLPWA=;
        b=hUu2ePfbEXK/Kc0NiYd4q3MM9gVgC8ICEpwpP1/NbXYRnvy7IRkmEfE8IH4yPIIcBd
         QlFrex5UZjcMhbz7jUFjXwcAWNXEguTBUsaiuYYJOeYLvZGwZYq1d+vFPvYS/nj2QI8b
         IsHFcNnxkuHU1Upd5IYSnhK7Fk5kzF+3cDmXoDpuXiAIDZ6owXaf6rv67yrAoXbbfdoE
         SXT1iLmgjz7rxkZYH+2R/lkHyBNsW71XmWSDoWVp/IuUF7O5Sgssdgt7156Z1mMFth4b
         AKwolCqie/Hk3puF/4pE62ENBAxZNk72WBBJ6lxjBJtwZwpAWRPGSwild54Rn1O7ODnC
         Ls4g==
X-Gm-Message-State: AOJu0YyCoKH+/n2xs1xTeRXo2AipLEjG6/AYB7hK7f6v1HmWfP8ABL6I
	I6gjpegvhxMUAu40jLq5mZDPaJ9ksWelhuuJ7sOLWlFk3lpVXZCKl25gnHsw
X-Gm-Gg: ASbGncvMpoUeMIqixMMiKsujd1rUicCoVXjKqfqQhvUTvL8J5BwR08OVt1XA9HDECVC
	XkMJkrud4ieVqZnlwL8/zRwhLcH90HwspcVlIShTF+ULZQMS0qT6/UcFNpBn3OXx++sKVvcZGea
	Q1R2wuaKKcUE5f95tIfl1TfA0/b09HbJPRgJktS5nU+sYPsXbtpJ5bVL0vYIXZxj5zZYWWuL6ZL
	oJm8Bx8UEgU18O4au8lBeffikpcRXGV1CkDlWgTT4378Ah8YEPmx6BbLNTlpA2Vv3ZG3ZMJgGiN
	8c8izNBuLoJiBjkjdTt2SOAud+tCqOTSUMm2D/gGWfmXpQGZPYU0dA==
X-Google-Smtp-Source: AGHT+IEczKtYj0G04U0KSTvB3nc/OFRs6gIc0d2wtLy2HaOcqI4tx/E3QcMfi6mbuEv537RPjskLMA==
X-Received: by 2002:a05:6122:2388:b0:51f:4154:c1b2 with SMTP id 71dfb90a1353d-51f4154c297mr6709959e0c.2.1739204078490;
        Mon, 10 Feb 2025 08:14:38 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52050a2c061sm118919e0c.32.2025.02.10.08.14.38
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 08:14:38 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4baf654570fso445065137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Feb 2025 08:14:38 -0800 (PST)
X-Received: by 2002:a05:6102:508a:b0:4b6:8d8b:82c6 with SMTP id
 ada2fe7eead31-4ba85e70c19mr8513345137.15.1739204077889; Mon, 10 Feb 2025
 08:14:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
 <20250129165122.2980-7-thierry.bultel.yh@bp.renesas.com> <CAMuHMdVUhXQ80DRbr7yFNgzmGMuDEuScZZhKihhtee1U4qP3UA@mail.gmail.com>
 <Z6oSv8TDtnI5Tvye@superbuilder>
In-Reply-To: <Z6oSv8TDtnI5Tvye@superbuilder>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Feb 2025 17:14:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW7RvX8bYSP7jL+BUkZJn=j2aECYCxNCNCFu1TZF4DAWg@mail.gmail.com>
X-Gm-Features: AWEUYZlrpNDR0ImtKW2UmVXk3_kKVErko0phIHEF753dgkWSp35Rqpo9dYK0aMw
Message-ID: <CAMuHMdW7RvX8bYSP7jL+BUkZJn=j2aECYCxNCNCFu1TZF4DAWg@mail.gmail.com>
Subject: Re: [PATCH 06/14] clk: renesas: Add support for RZ/T2H family clock
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Mon, 10 Feb 2025 at 15:53, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> On Mon, Feb 10, 2025 at 03:06:29PM +0100, Geert Uytterhoeven wrote:
> > On Wed, 29 Jan 2025 at 17:52, Thierry Bultel
> > <thierry.bultel.yh@bp.renesas.com> wrote:
> > > Add the CPG driver for T2H family.
> > >
> > > Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> >
> > > --- /dev/null
> > > +++ b/drivers/clk/renesas/rzt2h-cpg.c

> > Given RZ/T2 does not use the "write bit 16 + n when touching bit
> > n"-scheme (like RZ/G2L and RZ/V2H), I am wondering if it would be easier
> > to use renesas-cpg-mssr.c instead, like R-Car and RZ/A2M are doing?
>
> Because this is the early support for RZ/T2H CPG, the patch
> does not show the all differences that the driver will have with
> renesas-cpg-mssr.c
> Taking an example, renesas-cpg-mssr.c does not seem to
> handle all the clock types (eg  case CLK_TYPE_MUX) that RZ/T2H
> uses. I am just afraid that even if renesas-cpg-mssr.c would
> eventually fit now, significant changes would be required later.
> But you have a wider sight on this than me.

Sure, you will have to add a few new clock types, and a new set of
Module Stop and Module Reset Control Registers.

We'll see. I also don't have a full view on the RZ/T2 internals yet...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

