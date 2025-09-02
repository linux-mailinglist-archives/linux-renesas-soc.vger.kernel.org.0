Return-Path: <linux-renesas-soc+bounces-21192-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8414B40318
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 15:28:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63D84169F81
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 13:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F152EA73D;
	Tue,  2 Sep 2025 13:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A3mFPCMw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E483090D2
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Sep 2025 13:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756819463; cv=none; b=JpVzbesNbjxxesv5jVus0Yn7P4pbvn8MbQhzr4WOhE/PxjZdvvxl8tTKHuKPFmx+sZwCzOdR7oqFh+nTqmKjxxBtMe9JDz+dtX+ZcWCVAi/2CA2Asgg6KZR20aDSYj6wWFRbqVf1NSsxbtgnrCRVEVwQEdqOAxCuqiF7DoKWNes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756819463; c=relaxed/simple;
	bh=OH2KPRJdRKeC88rqgAwfnEjC2ko5FrnD5JbjS71ojBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ivmOI9cOH+gBuqhCgswnlCYUWrWp+HAgOCtPss6lZaCIEHCVAJEx3TTse8yseYErncNK8cM2FDOXuIltY6NF/CiGTBBjQOOriRZGJVewqjVI73wJwOAWkHH7WNHpXH5PUpqBeVAYD2msgxK2YGZaw9cvlHrhdD48FRRL6As7030=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A3mFPCMw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756819460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DhYHhdpq3o9OaEYWMGamjRW3AE6EMxkRxl/8TQh1o2g=;
	b=A3mFPCMwMMlT2R5+LSlhtM0I3jJ+M0HwqeeYbo+K72HiPx7iInnaZnhhQAnLK4NqTDhfd9
	vxFhvty47BvGd0JXKerENTam3LnwruWD7grlv5O1W9Aq9J0TGbYSU5RLBoewCClMCNZjIB
	DPTO8obfQK8HglfnRH0Uci3wQ8j7ByE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-5sGo_KBROvSteVAYcZa_pA-1; Tue, 02 Sep 2025 09:24:18 -0400
X-MC-Unique: 5sGo_KBROvSteVAYcZa_pA-1
X-Mimecast-MFC-AGG-ID: 5sGo_KBROvSteVAYcZa_pA_1756819458
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70dfcc58904so80592626d6.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Sep 2025 06:24:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819457; x=1757424257;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DhYHhdpq3o9OaEYWMGamjRW3AE6EMxkRxl/8TQh1o2g=;
        b=ivKvAGi/r8vmO1cRXUCJRcQpVuj5aWNlqb1vIzZcJ4pjqvjijBz1zUs8o3mv8mhxY0
         K6foqXTNO6XvNh7UKxwfdMJCxZhdH7UeMkgdD5bzr6NFQeSaEnOhjvVZ5DzfWY7rf61Y
         1cgpGYTLOljU00jwYJ3mAjR/GLoNDUn6vukprX48X/90c19JzYOpoQQyRS0qFnXOVP52
         XBBX0V6Xhvj/i4+UWfsbq3QdjHpOLtJRWrJbBy85QtLtr1nbnBLqBXMGKXoO7gsTLuKX
         qljwOX62XZFfDuH99XHnHQOgsdeS80icC39+Ctx7ko2VYkp2MvF7Umorw8BH1u7mt2pl
         Rq3A==
X-Forwarded-Encrypted: i=1; AJvYcCWNIKK1xEPu5QNKXsTkB8Xd1lu+/fOq6QmdFSXsfO/brpVxIjpRa2A12+z3MQEdKChCxYBAbo9aZrA5vZ5PoRjyOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAwDEqVQqE/YuMADt+fOHecR4eICGB2l3PbaqxwP6QWo8gw/ir
	EI2cCaEc1TlN/+XUtQRsIR+EWfz6Zg8IfT3FZWn7nk4RzlQSkBN/bCIwqkHWxcKfRt3EQ4U0tuv
	4FqRWjNAvalaPyIi+Rts1bAMmaT5Vasrq7e8uCzSeZQihnjXknan/1vsFuDaYzZFQzV1VjMPL
X-Gm-Gg: ASbGncs/EdTxX6RB0lapwZdsI+b/HHghLxUvvI3f9kvS2Ve7FHNYyX5vrrhaYs6/rdA
	8Urf9wiLNeinNZs6847WTP6bpjJldXGjqaEnTYHxnHUNxnI/9tDBYIy5Ll4Yb7s+zUMsv1A6QcZ
	AxPB8/qC91lRr/ZHzR0cC2smzQXbOSgEYxpVwR3qnB/YNvoTM/9ELCgq6nx1m+1yCOGxHPrjGzO
	ptuYgNQnBalfJnCYx7xwWTHS/TOab4l0S05FNSEFWQpraRVoASebb8b3C1TvJ9ciqdob/wIW7Hj
	zux5RWSPV2PMeLZwWEEsPUCf7hmgy/M1kXZQ6wE65/ZAdWsOboZ6AMWjZn4=
X-Received: by 2002:ad4:5bcb:0:b0:71f:238c:1495 with SMTP id 6a1803df08f44-71f238c1812mr45372476d6.12.1756819456907;
        Tue, 02 Sep 2025 06:24:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2gpj5sDjHqMalc6nLErCXydSa307HuH4gEcNe0djbjrEuBMYzkPHUoJgDAmOWEyhdUzjogg==
X-Received: by 2002:ad4:5bcb:0:b0:71f:238c:1495 with SMTP id 6a1803df08f44-71f238c1812mr45371836d6.12.1756819456245;
        Tue, 02 Sep 2025 06:24:16 -0700 (PDT)
Received: from x1 ([2600:382:7727:a6e4:b49a:a295:b546:7faf])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720acdff0dbsm11654266d6.18.2025.09.02.06.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 06:24:15 -0700 (PDT)
Date: Tue, 2 Sep 2025 09:24:12 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: claudiu beznea <claudiu.beznea@tuxon.dev>, mturquette@baylibre.com,
	sboyd@kernel.org, geert+renesas@glider.be, linux@armlinux.org.uk,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 0/2] clk: renesas: rzg2l: Disable unused clocks after
 resume
Message-ID: <aLbv_FmJV8xV8hpR@x1>
References: <20250821080333.27049-1-claudiu.beznea.uj@bp.renesas.com>
 <aKyX4YJswZLuqA6Y@x1>
 <0d71269f-1c78-4732-8235-5640bf340d00@tuxon.dev>
 <aK2gE0CysSWisFwB@x1>
 <CAMuHMdXNnGg0rEcM1hvvjBUJXFFAx4oiX=qVb3nKfmd4YBxhGw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXNnGg0rEcM1hvvjBUJXFFAx4oiX=qVb3nKfmd4YBxhGw@mail.gmail.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Geert,

On Mon, Sep 01, 2025 at 11:46:34AM +0200, Geert Uytterhoeven wrote:
> On Tue, 26 Aug 2025 at 13:52, Brian Masney <bmasney@redhat.com> wrote:
> > On Tue, Aug 26, 2025 at 02:01:56PM +0300, claudiu beznea wrote:
> > > On 8/25/25 20:05, Brian Masney wrote:
> > > > On Thu, Aug 21, 2025 at 11:03:30AM +0300, Claudiu wrote:
> > > > > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > > > > This series disables clocks that remain unused after resume.
> > > > > This is necessary when the resume process is done with the help of the
> > > > > bootloader, as the bootloader enables various clocks when returning from
> > > > > resume.
> > > > >
> > > > > On the RZ/G3S SoC (where this series was tested), the bootloader enables
> > > > > the SDHI clocks (for all SDHI modules, of which 2 are used by Linux and
> > > > > 1 is unused) and the clocks for a serial IP (unused by Linux).
> > > > >
> > > > > Testing was done on the RZ/G3S SMARC Carrier II board.
> > > >
> > > > Do you think that other boards would also benefit from this change? If
> > > > so, what do you think about putting the call to register_pm_notifier()
> > > > inside an __init block in clk.c so that this same change doesn't have to
> > > > be implemented across various clk drivers?
> > >
> > > Yes, that was my other approach I was thinking about. I wanted to see how
> > > other people consider this version.
> > >
> > > > Alternatively, if this is board specific, could this be fixed in the
> > > > boot loader so that the clock that's not used by Linus is properly shut
> > > > down on resume?
> > >
> > > As a result of your request I did some more investigations on my side, I can
> > > say that, yes, in theory that could be also handled by bootloader.
> > >
> > > I can drop this and try to do it in bootloader, if any. Please let me know
> > > if you still consider this (or the variant that implements it in a generic
> > > way) necessary.
> >
> > Personally I would go the route of fixing this in the bootloader for
> > this particular platform.
> >
> > If this issue affects other platforms, particularly across multiple
> > SoC vendors, then I think it would be worthwhile to have a discussion
> > about adding this functionality to the clk core.
> 
> How would the bootloader know which clocks are not used by Linux?
> And why to offload this to the bootloader for resume, but not for boot?

If the bootloader is involved with resume, then I assume that it's also
involved with suspend as well? If so, could the boot loader save the
state of the 3 clocks on suspend, and set them back to that same state
on resume?

How widespread is this issue? Does it just affect this board, or is it
common across other boards?

There are some longstanding issues with clk_disable_unused that Stephen
talked about at Linux Plumbers almost two years ago [1]. We'll have to
wait to hear back from him, however I suspect he may be reluctant to
expand the scope of clk_disable_unused even further given the existing
issues.

[1] https://www.youtube.com/watch?v=tXYzM8yLIQA

Brian


