Return-Path: <linux-renesas-soc+bounces-32190-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sC5GOpdI/Gk0NwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32190-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 10:08:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BB34E482B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 10:08:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A0B87300C30E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 08:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34B303368A0;
	Thu,  7 May 2026 08:08:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4AF331A63
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2026 08:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778141331; cv=none; b=ITYwMi9uwaiHdDBvLkBkhkvj8GXoFIoxI7N06sD6AeO9/gU4sL35n0rYF5paxJhv8vdx8MiwkvYmdhj/D+e0P3KIuPbw/E9LHtEfoIeGfplQvKPSFFqGzgLdbreHyKXbfcrHC8c4R22bc3OV/MqXJlo6gLWsoca7WEWw3jWCBJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778141331; c=relaxed/simple;
	bh=BtfahhhAzKwhxGXbFBG/UrJl92zYnGC9mAaLmhhe9pU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WwESvZ1M7DXGUMQf4AUu6kgXa9NcpiYCq05UqEwTv1X3JbYE8nVFFrie31NY2jFAJu4Ddiz1Tr2PGz/8Y7h9ETo60EzDGDzl8Uw+5Kz1v2QwDnnO8C+8/WAFjfBOIPbFAYbTqyl9mJNAA5h6t/McqO5zM53RdLoAAGccFv8tb60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5637886c92aso293222e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 01:08:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778141328; x=1778746128;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nlujo7B4GXnOEwb19kGu4mpvesYmekRBqIKCAW22YrQ=;
        b=K5FRgrJsgRMvEscvijQbpn3a1wc9cr71W/InVdkNizR1+ZbmbjXS6JtTSfVoEdk4Kx
         KdVyAwfVQrmgZ0QNE2ZZU8N4D6QRycZns8Ohnv9tDJnvWSUCThtVssg5xko3BAjWdlMo
         TRzyQARoyrDr5cVTCpQR1jGDZ0LchGFHOnw7RXtutVQyy9K+URCwXCu2VLODbDf+EGFd
         zgbVPnyb5R1GX9L5KF/qqogksGZrzp+wadPLApJZ8lDcWZcJdLj1Y4RjOzkAUEkMgzDl
         2DMNHIzI/bWzz8X4qsQl+E+yFzHkDYiQ6ymD/8kMaXbbQBXLTQb7gfLeeaJfJBYZS7cu
         iz1w==
X-Forwarded-Encrypted: i=1; AFNElJ9Gs0Uha0p4YMsuvEoA7KPVrhv2p+9X33wxK5/AV0HWZvyokW+gCI5VUfB42wDr+/wD69NPDmJTWeA6B3DOaZ9eKg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/vi5JVTgb7ViSL07SZE+hD5E35T1fN5FdSRWuomGJibOO6NNn
	X2HINW4f5nqYQ58cHEdEd1+uT7VLmjjBp7ZrDKDWmGpt91QeLZNrQjeggKm3wdHWLkE=
X-Gm-Gg: AeBDiet8uENMFnOkUJXtxwjPJAUlJeI9Q5YHVOauRjTX2hpx+FNoC0/nxuAKROcQS5q
	WarIldeiWSAt3Fo8pIMeH2QeKxU4ymRr4uaIvINTNzznlfDW7dxO9zd/AoSDfMCwK3UAWBh/oHI
	lHTwgNpNpBglC0GIGbjJkw0Hq1J2LwUpfiTvPcdRZeKVjfgLrKhp3kiknrpODVMKTqIC8P4/E+v
	Emiaa/Ek5Z7lwKRlFi+XA/2UCpYi8miBcL/GNVa9nGDrqQsT3nfWYTTqOos9m8zs5j2EePrBkIJ
	U4zc8mifPq0cI4QL6MkGPyarAatd2YRCgYIY2X05c6y13OLCrwX1V1lMD44wpZ07inJ2c8Gskg8
	JQQBUKZil0QskKWUUZb1x+a2wlOTexUacNh9w5RXkz2jvsYzOrvX+zC3243O5jmcu4TAoPkUSfB
	/nhrMhL2fzQpu9keMH/E4oLYxqmOyaw5ulC9cNamTqJtiURTi0gRsN0zm4tg+OQXH6XXOq1+Q=
X-Received: by 2002:a05:6122:e149:b0:56a:fff5:b4d6 with SMTP id 71dfb90a1353d-5755953264amr3811317e0c.4.1778141328414;
        Thu, 07 May 2026 01:08:48 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5754dc8b662sm4464218e0c.4.2026.05.07.01.08.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:08:47 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-94ac7f22d23so140396241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 01:08:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9FxMa0aX0x3yZWgia0pqH86868c42d4blzE/gEC5W5UuZbTqtnpenJGEFz+Se82dZM3xBWTKuxjUIUCd8PX1ldCA==@vger.kernel.org
X-Received: by 2002:a05:6102:304e:b0:62e:79ee:4cda with SMTP id
 ada2fe7eead31-630f8e6ad78mr3364577137.3.1778141327428; Thu, 07 May 2026
 01:08:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
 <aekXUvIPb8nkhdKu@pluto> <CAMuHMdWJvMH+a1RqozbaCxxH_8M569JcruTFa8PW+87FysnjHw@mail.gmail.com>
 <ae6Zp54NhKlVes8J@pluto>
In-Reply-To: <ae6Zp54NhKlVes8J@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 10:08:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVunEehM01pLa3t5a6o0NmMOCQRwh7n5J+OkDk2YR9kUA@mail.gmail.com>
X-Gm-Features: AVHnY4JbGLo8_iAmQ_D9O0588NyvaqL5CIqCjBD959GBuikmvjn-HVAEApsHrL4
Message-ID: <CAMuHMdVunEehM01pLa3t5a6o0NmMOCQRwh7n5J+OkDk2YR9kUA@mail.gmail.com>
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
X-Rspamd-Queue-Id: 95BB34E482B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,pengutronix.de,broadcom.com,sang-engineering.com,mailbox.org,renesas.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32190-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Cristian,

On Mon, 27 Apr 2026 at 01:03, Cristian Marussi <cristian.marussi@arm.com> wrote:
> On Fri, Apr 24, 2026 at 02:08:55PM +0200, Geert Uytterhoeven wrote:
> > On Wed, 22 Apr 2026 at 20:45, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > On Tue, Apr 21, 2026 at 08:11:38PM +0200, Geert Uytterhoeven wrote:
> > > > Currently non-SCMI drivers cannot find out what the specific versions of
> > > > each SCMI provider implementation on the running system are.
> > >
> > > Thanks for your patches....this is not a proper full review of the series,
> > > BUT this patch catched my eye..
> > >
> > > Indeed, yes, it is deliberate that the SCMI version information is NOT
> > > exposed out of the SCMI world, since being the SCMI an attempt to
> > > standardize a common FW interface (as in [1] of course), you should not
> > > know what runs inside the black-box, it should be irrelevant...
> > >
> > > ...indeed the versioning is used inside the SCMI stack to deal properly
> > > with different protocol versions implemented by the server OR to apply
> > > proper quirks when needed, but all the rest should be standard....
> > >
> > > ...you should NOT really behave differently based on the underneath
> > > protocol or firmare implementation version...it is the SCMI stack that
> > > should behave properly, transparently...
> >
> > Oh well...
> >
> > > Having said that...I understand that at least it could be useful to be able
> > > to query the SCMI stack to know, even from non-SCMI drivers, WHICH quirks
> > > have been applied/activated at run time...but anything more than that it
> >
> > I see no need for that, but we can discover which quirks have been
> > applied from the kernel log ;-)
>
> Ok so I may have misunderstood...it seemed to me, glancing through the
> series that you wanted sort of reconfigure other non-SCMI drivers based
> on the SCMI FW version assuming that some quirks were applied BUT also
> that some sort of corrective workaround was needed additionally...so
> what I was saying was that: is not more straightforward to be possibly
> able to check if a quirk has been applied instead of querying the
> version from outside ?

I am not sure I can implement everything as quirks...
Also, as quirks.h lives under drivers/firmware/arm_scmi/, accessing
quirks.h elsewhere requires a relative include path.

> > > Also because this should be one of the selling point of the SCMI stack
> > > in a virtualized environment: you can ship the same kernel drivers with
> > > the same DT and you know that ID=<N> will always identify the specific
> > > resource that is needed by your driver without worrying about the fact
> > > that in reality in the backstage the effectively managed physical resource
> > > could be different across different platforms, because that does not matter
> >
> > This sounds strange to me, do I understand it correctly?
> > So the ID should (1) be tied to the use-case, and not to the underlying
> > hardware, and (2) be the same for different platforms?
> >
> > For (1): Then we must not put these IDs in DT at all, as DT is supposed
> >     to describe the hardware (and firmware IDs in DT were IMHO already
> >     a stretch before).
> > For (2): How can there be a contiguous list of IDs, as not all platforms
> >     may have the same underlying hardware?
>
> I would NOT say that an SCMI FW must behave like this regarding IDs, but it
> is a possible SCMI deployed setup that can be useful in virtualized setups
>
> I mean, the DT describes the hardware of course BUT when you refer to
> some of this hardware DT bits from some other subsystem by referencing a
> phandle, even in the non-SCMI world, you are in fact selecting a specific
> resource that fit you use case, right ? Can we say this ?
> I mean you needed that specific clock or regulator that you described
> previously so as to be able to enable some other piece of HW...

OK.

> Now, the SCMI provides an abstraction on top of this, since you really
> discover domain IDs of a specific class (clocks/regulators etc) you are
> in fact describing an HW abstraction that you then refer with the usual
> phandle...also because there is NOT so much SCMI hardware to describe,
> given that the HW is handled transparently (opaquely really :P) by the
> driver on the FW side...
>
> ...you basically obtain such domain ID, usable as phandles through dynamic
> SCMI enumeration so that you can use it all over your DT to make use of such
> resources...
>
> ...on top of this, consider that the SCMI server CAN provide to its agents
> a per-agent-view of the world, IOW it can (and should) expose to a specific
> agent ONLY the resources needed by that agent, i.e. it can expose the set
> of resources 1-N to two distinct agents and that does NOT mean that the
> underlying physical resource mapped by ID=3 in both agents has to be
> effectively the same piece of hardware: it could be the case, and this
> would be useful to exposed and managed properly a shared resource, or
> it could also be that the same ID=3 could refer to completely distinct
> pieces of the same class of hardware...(same protocol same class of
> resource...)
>
> In fact the SCMI server provides an abstraction, sometime a mere illusion
> to the agents...
>
> So in a virtualized ennvironment you could expose the same ID to a pair
> of distinct agents on distinct VMs, so that you can use the same driver
> and same DT despite the fact that maybe the underlying resources are
> distinct pieces of hardware ...

I am not sure how this can actually work.  Many clock, reset, and
power domain resources cannot just be remapped to different hardware,
as they are related to other hardware resources described in DT,
which are not handled by SCMI.

Take for example a serial port:

    serial@c0714000 {
            compatible = "vendor,serial"'
            reg = <0 0xc0714000 0 0x60>;
            interrupts = <GIC_ESPI 15 IRQ_TYPE_LEVEL_HIGH>;
            clocks = <&scmi_clk 42>, <&scmi_clk 43>, <&scif_clk>;
            clock-names = "fck", "brg_int", "scif_clk";
            dmas = <&dmac1 0x33>, <&dmac1 0x32>;
            dma-names = "tx", "rx";
            power-domains = <&scmi_pd 44>;
            resets = <&scmi_reset 45>;
            status = "disabled";
    };

The clock, power-domain, and reset cannot be remapped to a different
serial port instance, as they are tied intimately to this specific
instance at MMIO address 0xc0714000, which is wired to a specific ESPI
interrupt and to specific DMA controller channels.

> ...OR on the other side you could decide to share the same resource with
> different agents (say a clock) and take care, as a server, of armonizing
> conflicting requests from different agents (e.g. by refcounting enable/disable
> across all agents), WITHOUT necessarily need to expose that same resource
> with the same ID to both agents...

E.g. preventing the inadvertent disabling of shared resources like
shared parent clocks I can agree with.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

