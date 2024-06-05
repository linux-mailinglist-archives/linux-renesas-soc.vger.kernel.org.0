Return-Path: <linux-renesas-soc+bounces-5859-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A7F8FC96E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 12:54:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9158B2821B2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 10:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AF1619148D;
	Wed,  5 Jun 2024 10:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qOy05tkp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9861420B6
	for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Jun 2024 10:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717584874; cv=none; b=aScavPYQGopRu41WfLuwGPAOmQH8U3v8j7t7aAhgy79nVyc1esDrCJdsRNEdjFFdoRKUAkMiUoQyWRpciuIG7L0IHBmVeVN9EqZZTqvReUrW49Nig2sKKnMYuBSrFBfv43XYM31ZsR+sAT3sWgem2JniuhNgJJ056NfZps1032Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717584874; c=relaxed/simple;
	bh=FTgBRYYy6JQRexZRZJFjuNAFj4Osr8S9dZDMnD+Hpkg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aXX8k2HfDSrFrrkQAno93Sb4R3hwyILoAbWEXhgJk+mvkHbAgyqJfDewnAh/ATDsN03TXRx4OwzCPOOOfb5z/HDE0p2RceYTJNOYiGeX7E7Hr+Ep7qF2EA/97zk9DrvNQTcAKxBRCWigDW+vEaHt0Csf4wFrRncMjTWMYu5sLnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qOy05tkp; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-df79380ffceso614724276.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Jun 2024 03:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717584871; x=1718189671; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jwOYdBEP20eHqXfiLB/uZRRK7vGmn2sMRMDnSyVKlSw=;
        b=qOy05tkp1Jh9xyTIiDfcWBORdVYV9xOpdRiBq5wfsDPG3C03dKc5lIEI9cgtiUDw97
         79BOWCujxAwC42Ia9HJuq2CvetruFN1Qq3klniYjWPtZziiBVZwXkDiyu1bZ9NBpaLcv
         6JR90CNU4nd3KyrUKWJRQJ9XnGk4xbt0KjoltJUCC+NpAqnfeFjBeB7g711/V8MVfRqy
         l6pTVZ5fII/62FaGvHXWr87DRgtumoiP1M/gyccN6P6yV1e1U5OfFv1OGwJLpV6iFYNa
         X5XIfjQBNF6tKb9wJDbvjfxyxgi52+59XVhrRIZYvKGru9tjjlS886D+XZHB8rOU9jIW
         fFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717584871; x=1718189671;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jwOYdBEP20eHqXfiLB/uZRRK7vGmn2sMRMDnSyVKlSw=;
        b=DmPhm2dYfgnHuxPJ9OOd9jndwQbtqNXm2XFIgEM+rK+i8z5lEZtRwe6EZcQ+REWBD0
         bTHUxGGIR3rQvYoI0E9gT22jcTteNs7wBB1fqYSS82PiDfCAW0NThNNOFMDNO+9hXqfi
         0TIMVWLQqVgA6QWo6vm5iq5lq23fTLVPmPG3PsDCs8KQ1vOZeaj5qeoEo9xjGU1Eiko0
         pvdPbfaO9oPZW8nKp8Dpz1bMB8Nh5Bk8u1Y/kWhgiM4SUUdoGActG6iIZR61vOVlFw9u
         I497k/BI/7Jq2lepIohtpiOyWqLzB7039JEz8GfHW71l912hl6qozWrBd9NeiUhbWZZJ
         qJ0g==
X-Forwarded-Encrypted: i=1; AJvYcCXdeIKdCMv8iutOjyk8bt6FIHLfTtUE3VXHXnm4QUok74U1CMtJD61Quo0iIjsbpnY79bMsNBEIT9qO+8cmxO4uQBc6h71HBNkOhCteb9uAVGA=
X-Gm-Message-State: AOJu0YwGFhk+hODuXAdbT0va1JMrkqYcXb7oNsWXAouHIBXDnfutyALK
	bdMerYVc4AZAFGqrozELSo1j0yp29xuiK3EsIUZbIt0tmwqRUGJasIzOX3K2vHatkA2nKqVraOI
	aO84z6GJcDS1uu98vf2g0SRT6iuDIxSYJsfW0Yg==
X-Google-Smtp-Source: AGHT+IFCIpk76VQM4IGtOzYy0kvzCqfdvB04uHsR5vs8p9fLuPGESGvnInQIi3EisoXfHVIM/A1cG1VKEJLdP84nFxo=
X-Received: by 2002:a25:c102:0:b0:df4:d98d:3e4f with SMTP id
 3f1490d57ef6-dfab854c9c8mr4052568276.12.1717584871226; Wed, 05 Jun 2024
 03:54:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1716811405.git.geert+renesas@glider.be> <CAPDyKFpa4LZF3eN7x-NT+b9=dKB3Oe6RY8RAyetdRBSR1-LQoQ@mail.gmail.com>
 <0a025885-ed95-45d3-bf76-d2a043baaed7@ideasonboard.com>
In-Reply-To: <0a025885-ed95-45d3-bf76-d2a043baaed7@ideasonboard.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 5 Jun 2024 12:53:55 +0200
Message-ID: <CAPDyKFrxUDhnUUfz5wHpGVQfNYssxoWO5Eb2wtmZMTcMYhEjxQ@mail.gmail.com>
Subject: Re: [PATCH/RFC 0/3] pmdomain: renesas: rmobile-sysc: Remove serial
 console handling
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Peng Fan <peng.fan@nxp.com>, linux-pm@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Jun 2024 at 12:41, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> Hi Ulf,
>
> On 05/06/2024 12:34, Ulf Hansson wrote:
> > + Tomi
> >
> > On Mon, 27 May 2024 at 14:41, Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> >>
> >>          Hi all,
> >>
> >> Since commit a47cf07f60dcb02d ("serial: core: Call
> >> device_set_awake_path() for console port"), the serial driver properly
> >> handles the case where the serial console is part of the awake path, and
> >> it looked like we could start removing special serial console handling
> >> from PM Domain drivers like the R-Mobile SYSC PM Domain driver.
> >> Unfortunately the devil is in the details, as usual...
> >>
> >> Earlycon relies on the serial port to be initialized by the firmware
> >> and/or bootloader.  Linux is not aware of any hardware dependencies that
> >> must be met to keep the port working, and thus cannot guarantee they
> >> stay met, until the full serial driver takes over.
> >>
> >> E.g. all unused clocks and unused PM Domains are disabled in a late
> >> initcall.  As this happens after the full serial driver has taken over,
> >> the serial port's clock and/or PM Domain are no longer deemed unused,
> >> and this is typically not a problem.
> >>
> >> However, if the serial port's clock or PM Domain is shared with another
> >> device, and that other device is runtime-suspended before the full
> >> serial driver has probed, the serial port's clock and/or PM Domain will
> >> be disabled inadvertently.  Any subsequent serial console output will
> >> cause a crash or system lock-up.  E.g. on R/SH-Mobile SoCs, the serial
> >> ports share their PM Domain with several other I/O devices.  After the
> >> use of pwm (Armadillo-800-EVA) or i2c (KZM-A9-GT) during early boot,
> >> before the full serial driver takes over, the PM Domain containing the
> >> early serial port is powered down, causing a lock-up when booted with
> >> "earlycon".
> >
> > Hi Geert,
> >
> > Thanks for the detailed description of the problem! As pointed out in
> > regards to another similar recent patch [1], this is indeed a generic
> > problem, not limited to the serial console handling.
> >
> > At Linaro Connect a few weeks ago I followed up with Saravana from the
> > earlier discussions at LPC last fall. We now have a generic solution
> > for genpd drafted on plain paper, based on fw_devlink and the
> > ->sync_state() callback. I am currently working on the genpd series,
> > while Saravana will re-spin the series (can't find the link to the
> > last version) for the clock framework. Ideally, we want these things
> > to work in a very similar way.
> >
> > That said, allow me to post the series for genpd in a week or two to
> > see if it can solve your problem too, for the serial console.
>
> Both the genpd and the clock solutions will make suppliers depend on all
> their consumers to be probed, right?
>
> I think it is a solution, and should be worked on, but it has the
> drawback that suppliers that have consumers that will possibly never be
> probed, will also never be able to turn off unused resources.
>
> This was specifically the case with the TI ti-sci pmdomain case I was
> looking at: the genpd driver (ti_sci_pm_domains.c) provides a lot of
> genpds for totally unrelated devices, and so if, e.g., you don't have or
> don't want to load a driver for the GPU, all PDs are affected.
>
> Even here the solutions you mention will help: instead of things getting
> broken because genpds get turned off while they are actually in use, the
> genpds will be kept enabled, thus fixing the breakage. Unfortunately,
> they'll be kept enabled forever.
>
> I've been ill for quite a while so I haven't had the chance to look at
> this more, but before that I was hacking around a bit with something I
> named .partial_sync_state(). .sync_state() gets called when all the
> consumers have probed, but .partial_sync_state() gets called when _a_
> consumer has been probed.
>
> For the .sync_state() things are easy for the driver, as it knows
> everything related has been probed, but for .partial_sync_state() the
> driver needs to track resources internally. .partial_sync_state() will
> tell the driver that a consumer device has probed, the driver can then
> find out which specific resources (genpds in my case) that consumer
> refers to, and then... Well, that's how far I got with my hacks =).
>
> So, I don't know if this .partial_sync_state() can even work, but I
> think we do need something more on top of the .sync_state().

Thanks for the update!

You certainly have a point, but rather than implementing some platform
specific method, I think we should be able enforce the call to
->sync_state(), based upon some condition/timeout - and even if all
consumers haven't been probed.

[...]

Kind regards
Uffe

