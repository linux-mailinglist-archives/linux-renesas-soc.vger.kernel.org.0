Return-Path: <linux-renesas-soc+bounces-31629-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEvJBHNd62mzLwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31629-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 14:09:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A691545E343
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 14:09:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ABE863002306
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 12:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F3172FFFB8;
	Fri, 24 Apr 2026 12:09:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D770A2F83B5
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 12:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777032560; cv=none; b=pHRBlATyOjjXYoqgCrpK2UZyl5+mZI8kx1g9zqGK9Lh5+XDMq2UZJzjr2vKpal52Nvt7LvJsDzwgp9Xtii9woVSGpN7EfmVXsFNbRvsuEFvQ1wHZjxCT4dAVVOUQAQvt1nRa0FHJ1vdbLs7c0nMnWEjOvP8VxA6bEkx3k9cAvKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777032560; c=relaxed/simple;
	bh=6x8AaL0soP/QvCrhUlcKrRT+37cNHuikR53lCEKEpMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uzuqebHG5vjhB7Wdp+3tTp2IXH1sFVebvujSJe88yiMVz6fLjx+aIVCsccM5d7/NjYgF3anfcCjTKVqZeP36T8zy+ju435shi2Zsm6vLWFG7Te72BqJwshyGtq8RY+/tS3XQfcZu0+U8W6FD8ajkz7klFs0GLm1xzkLg1kjtyWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b9382e59c0eso272336266b.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 05:09:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777032557; x=1777637357;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DlPOzsbSlIKF8HuNfduxYXPi56LqB7rH+tGNemLx+GY=;
        b=P/z78XC1kczX0iVyGTvSCrcO/HTLV5vUc5CrSZcUf6A2ESQ1zogT2i0eUO4natGw2X
         mhxG+Llr8mgZdoGhcmJnEhuSkxJgZ0xkem6lASdKWMVLTI6aHh2dXoKLOVrloRRk7v8W
         AE/+ur91yzpK+fYA4qdONAmXX4LL/Eb5yglnXj7EmYRNQQMhHfW0amuks0mLkync+bXA
         o5snPE9pY+s0oWRKahkkXc6N2uwVGTBW7pQpcrvK+h2HVOlpSdiOATe6LrPf9Kubnm9s
         2RR5kWq5sLSYUFRJsQ9UY4v6PSNGoRpqJPBvT8HnoUTD+nxXjak2HwVE/7sS4Padf4ur
         GIhA==
X-Forwarded-Encrypted: i=1; AFNElJ87QWpzXRIeNhZnF5xg3ZjjY2NTq9gRehHf0JwGvofaQkm8uI3LgDLmz4jotBe2KF3h5ztCm/VHsTrene4t65B1QA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfV35bmdu2gegsVRYEcvtEqy/UH7dN8MGiO4a4k7t7WP3MmtW7
	ujcJTLQRlSevCJGdan2Pzsl7H2KWUxLxFJj9GZPllWspLcvtKyZGVL343sQ924irdV0=
X-Gm-Gg: AeBDievDlISwc5a8tESy1yoRDmq53EVN43AT2RlLbQbm9dVirVzl3VXFtEGH3hzphV2
	f6Fa74t3HWSfyJhimiKfUipWQjmnswxGeYN+mIfOKUUU5wxmZgVJNdK+o8ImxA90+Dk+kNjVOCu
	rLZ8lngfm+KZ6m7YPvl7BFwvUPO9s7cBg5Q7rcEEggHoMcpDVhfGLUHzijDTn7XzzlJL4AY2q7o
	x+E40YON7FlzcsmMLt0hULZAp7mjpA8yofcu0hyZoscyS9ICYhpX5LiDH7+4A44YHZELAe/9xvB
	o9ntiPqplrDDinWBmBgiuBOEhE8geyvegdXVIhmqRTUy5i/nwt3kaFpkvib9fRxWe5gxKT8I5wI
	U+F830b0hEx+kZUJrATRT5ASxwzB/f11o7M2TNTyzsDeDC+GouI4VECknp4S/Wd6h4B5/bInRXD
	az0jXAAmKsrptmWYb1Ydi6Dfb0TZvcBPigD9RmofvueSEopRF+Vnv6049oxvK20C8QXBJZu2A=
X-Received: by 2002:a17:907:7250:b0:baa:a612:b168 with SMTP id a640c23a62f3a-baaa612b2ccmr668076666b.27.1777032556283;
        Fri, 24 Apr 2026 05:09:16 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba4517ee077sm786162266b.18.2026.04.24.05.09.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 05:09:13 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-67790429f71so4374781a12.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 05:09:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8fZO5LMZm7GSpExplx86xC8gb3ntY+yznEoQcmdvLAgW1vdSmmJXm+ajn0oOHLe1rpIwLbGDOPloAqVWzxvxYcCg==@vger.kernel.org
X-Received: by 2002:a17:907:3da4:b0:bac:1263:2562 with SMTP id
 a640c23a62f3a-bac12632637mr434030666b.24.1777032550820; Fri, 24 Apr 2026
 05:09:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
 <aekXUvIPb8nkhdKu@pluto>
In-Reply-To: <aekXUvIPb8nkhdKu@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 14:08:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJvMH+a1RqozbaCxxH_8M569JcruTFa8PW+87FysnjHw@mail.gmail.com>
X-Gm-Features: AQROBzCeAVXP6DoeEYDD8I1FaXSTP-ZpY0v2OnIf6zjZFA9mNfY85ZLl0E87BuA
Message-ID: <CAMuHMdWJvMH+a1RqozbaCxxH_8M569JcruTFa8PW+87FysnjHw@mail.gmail.com>
Subject: Re: [PATCH/RFC 05/14] firmware: arm_scmi: Add scmi_get_base_info()
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: A691545E343
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,pengutronix.de,broadcom.com,sang-engineering.com,mailbox.org,renesas.com,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-31629-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux-m68k.org:email]

Hi Cristian,

On Wed, 22 Apr 2026 at 20:45, Cristian Marussi <cristian.marussi@arm.com> wrote:
> On Tue, Apr 21, 2026 at 08:11:38PM +0200, Geert Uytterhoeven wrote:
> > Currently non-SCMI drivers cannot find out what the specific versions of
> > each SCMI provider implementation on the running system are.
>
> Thanks for your patches....this is not a proper full review of the series,
> BUT this patch catched my eye..
>
> Indeed, yes, it is deliberate that the SCMI version information is NOT
> exposed out of the SCMI world, since being the SCMI an attempt to
> standardize a common FW interface (as in [1] of course), you should not
> know what runs inside the black-box, it should be irrelevant...
>
> ...indeed the versioning is used inside the SCMI stack to deal properly
> with different protocol versions implemented by the server OR to apply
> proper quirks when needed, but all the rest should be standard....
>
> ...you should NOT really behave differently based on the underneath
> protocol or firmare implementation version...it is the SCMI stack that
> should behave properly, transparently...

Oh well...

> Having said that...I understand that at least it could be useful to be able
> to query the SCMI stack to know, even from non-SCMI drivers, WHICH quirks
> have been applied/activated at run time...but anything more than that it

I see no need for that, but we can discover which quirks have been
applied from the kernel log ;-)

> seems to me dangerous and prone to a number of abuses of the SCMI stack
> itself...
>
> (Also...exposing the versions itself means also tracking that bit of info
> in more than one place: the quirk framework and your drivers.)

I'll see if I can get everything handled as quirks instead...

> > However, different versions may use different ABIs (e.g. different clock
> > IDs), or behave different, requiring remapping or workarounds in other
> > drivers.
>
> ...abuse like this indeed :P ... the SCMI server is supposed to be that
> one entity remapping the IDs in the background if the same IDs happen to
> be representing different physical resources across a number of distinct
> platforms all supported by the same firmware blob...so as to present
> a consistent set of contiguos IDs...

In our case it is just a single platform, with different ID number
spaces for different firmware versions.

> Also because this should be one of the selling point of the SCMI stack
> in a virtualized environment: you can ship the same kernel drivers with
> the same DT and you know that ID=<N> will always identify the specific
> resource that is needed by your driver without worrying about the fact
> that in reality in the backstage the effectively managed physical resource
> could be different across different platforms, because that does not matter

This sounds strange to me, do I understand it correctly?
So the ID should (1) be tied to the use-case, and not to the underlying
hardware, and (2) be the same for different platforms?

For (1): Then we must not put these IDs in DT at all, as DT is supposed
    to describe the hardware (and firmware IDs in DT were IMHO already
    a stretch before).
For (2): How can there be a contiguous list of IDs, as not all platforms
    may have the same underlying hardware?

> if the SCMI platform server had properly remapped (at build time/run-time ?)
> the resources to your expected ID...alternatively of course you can ship
> with different DTs to describe different hardware...BUT remmapping stuff

That is a different issue: as SCMI covers the full platform, not just
the SoC, the IDs can be board-specific, and thus should be specified
in the board .dts, not in the SoC .dtsi?
Then the SoC .dtsi should describe the hardware, and we end up with
things like arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts?

> in the drivers themselves guessing on the vendor/subvendor/impl_vers
> seems a dangerous abuse...

There is no guessing.

> I watched a bit of the LPC discussions around this (from Marek I think)
> but sincerely most of those problems had one (not necessarily simple)
> solution: fix your firmwares AND/OR apply quirks in the meantime...

Unfortunately (at this point) we have to work with the firmware that exists.

From that LPC discussion, we learned that we are actually the lucky
guys: some other vendors tend to change the IDs and/or behavior without
bumping the version, so Linux cannot even act upon that...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

