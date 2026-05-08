Return-Path: <linux-renesas-soc+bounces-32275-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CJWFyig/WmwgQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32275-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 10:34:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F22964F3C2B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 10:34:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 66A8B30087CF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 May 2026 08:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF26377000;
	Fri,  8 May 2026 08:34:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4031837F727
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 May 2026 08:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778229286; cv=none; b=FRxQA8M8KIvR3A977wyDnUCeo0hgwvZalCDCDGqn29DXf4227AlPoWp2ay2nhJUHMIm0Y8nyCo/IsaDUW201KHw4A4clfQVlFmti3C6wsLj5YJAHxU83bOt7j87pled3SvsawMRRqMiLQBiRTJRZEEcUsr/5uSanlvAUFlJe4iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778229286; c=relaxed/simple;
	bh=OF+KbbPBry4fiTqCO/A0vEBAM9IFzJmbWYXTqxwsniM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fstR+ZQ90DGU5jjV7nSFWYJDPi8/XO5lSctpRkr30Wp46+jPqAgwGa+FFSRW/KgE7PAbPKfBeC1EwscG0yh6fIpO1COgYnR+aUA422p4LxRvIa8O3leb8V9XUQHzg2ecHyhpNxFjocFgn0w5Otg0eyjMuNzXcKnbIbQ+VhSdVvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7de4be15125so1427888a34.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 May 2026 01:34:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778229283; x=1778834083;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vUNwtFp7LXv7nOLjMf/BlzJYT09wzG6WamyTo0Ov/no=;
        b=C0hYh69T6M5tbHI5gkqQkt9jzq1Z62I79c/EbdF0DfyYIU1VxtTTyjBP2mcL+CXjlX
         QAL7jZqp2bIrKeWLwSdlkLsJ4NDGaJFTZA3q69dvbOf66XmQ2QgHkil4VxjrCU0yxtYp
         8MXEK/MW+YcZXm71QuXZIxHfieWMJpIFew4RSr4zKujFwWkL0FyhxM2rwKnE5eZYuivk
         UXXloiW84Mt2UpxlAlUHo5xX9SRD2yMawr9efWjeuw61vR5Yf+tYD9EazRPg0UuoAT3P
         e9ZVikUFwZru1zAFqk2dHpgLyswOZhee/63s/yOrWqHnJ0B/d9QWC6Mzlpc3cCycstJ7
         J2PQ==
X-Forwarded-Encrypted: i=1; AFNElJ9g2kB2xJYKRPjQiihWdEhaN7Ki9hk+JQXu8QgY5512TTtkcpHXLYEar3j+udR3RjnuhvM86H4IoU0j6tcxb/Zjpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVvqrkB+PO4zPFjjjCPQhbtGNaMHbWNKpDyNRhweBzIYxc8K1s
	WNpDfpNtoSRHdVx4wqITwdUJ2s0Hz+8ZNt9Ca2oHdSDC8ROcITHxPQ/L33ARGPrvvJk=
X-Gm-Gg: AeBDietED8H3KPz4vwIsMNjqCyUq1vswocS++hDZH8qrk9aNS//lqKVKNrUF8Ky22Qg
	cVJB0/WtNkB2MP8drIWKF3zggyTmTVTLTW5L0w/x5L5ZHAqy+v/JjNZ8EOaYgvfh3iB75Lg+aEq
	LaZWoQZfqaTSX213I51aBoqauneFmSuPJ5Y6ZsMCzwoC8H6eBQj1ouIPpDITAjuVgacGhhqkRGX
	AB6RZILNdrBBxKm8NkMQ538G3r3oARj2hp0qG/DAe7vjrTQT+43+avDArJF+B3JpC+P2ToYSJmb
	rnCfHFiroFNtGIC/rR589phHAlXcwy/BC2z2tQqju3saCFIMf4bxj6uhCPUdrT/9fJEdGHlXMxu
	0S9bO1bzp7+hlNA1e62qAOaKNnt+krBRGw2xE+ZOKG+wUE6eMcYvrzw9ae/8WRb9zVE2R8wLjUi
	SIBpfKrDNs5WluEOtLI6TLeKst5lqvQhAbPNhSdorkaOATHVXMNt4pWHmLZw93imDk
X-Received: by 2002:a05:6830:63ca:b0:7dc:e1e6:7687 with SMTP id 46e09a7af769-7e1deec8566mr7929358a34.4.1778229282966;
        Fri, 08 May 2026 01:34:42 -0700 (PDT)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com. [209.85.167.172])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e367be2aa5sm787885a34.4.2026.05.08.01.34.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 01:34:42 -0700 (PDT)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-463a0e14abfso983101b6e.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 May 2026 01:34:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/vWvyxyvCHicerJs0bMaeMdZU7C/iiTXQeRd+5oCCSCLpRGbJMAPT+8v62NcSryh2/HoXUxzdbngu5V/7vyck6dw==@vger.kernel.org
X-Received: by 2002:a67:e709:0:b0:604:ec90:ba14 with SMTP id
 ada2fe7eead31-630f8ee2fa0mr5929351137.11.1778228781677; Fri, 08 May 2026
 01:26:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <053c312d07445517d8f9c84bfe3cc8fb72d4cd9a.1776793163.git.geert+renesas@glider.be>
 <bf83a028-3ef3-482a-9ce3-8aec16f6ebed@mailbox.org> <CAMuHMdWN2zaZrY2jKKXpNqrP8xSqc-uJTr-siTBgaA=-EY_4BQ@mail.gmail.com>
 <fa28c6fe-484c-4133-824e-649c52ef2200@mailbox.org>
In-Reply-To: <fa28c6fe-484c-4133-824e-649c52ef2200@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 May 2026 10:26:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUU=RohST4LDDD27W5dj=HwJFApMcDpsXATQ1MaMH-tUA@mail.gmail.com>
X-Gm-Features: AVHnY4JJUxMOqvyoeb-hr7ynluUAgTja2N2yaP-Ep1K9EfNyRckxSh-cxJzmeNw
Message-ID: <CAMuHMdUU=RohST4LDDD27W5dj=HwJFApMcDpsXATQ1MaMH-tUA@mail.gmail.com>
Subject: Re: [PATCH/RFC 10/14] dt-bindings: power: Document Renesas R-Car X5H
 Module Controller
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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
X-Rspamd-Queue-Id: F22964F3C2B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,gmail.com,baylibre.com,pengutronix.de,broadcom.com,sang-engineering.com,mailbox.org,renesas.com,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-32275-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.957];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	R_DKIM_NA(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.232.135.74:c];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mailbox.org:email,mail.gmail.com:mid,0.0.0.0:email,linux-m68k.org:email,c0710000:email]
X-Rspamd-Action: no action

Hi Marek,

On Thu, 7 May 2026 at 23:36, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 5/7/26 9:37 AM, Geert Uytterhoeven wrote:
> > On Thu, 7 May 2026 at 00:58, Marek Vasut <marek.vasut@mailbox.org> wrote:
> >> On 4/21/26 8:11 PM, Geert Uytterhoeven wrote:
> >>> +  '#power-domain-cells':
> >>> +    description: |
> >>> +      - The first power domain specifier cell must be either the Module
> >>> +        Power Domain Gating (MPDG) register index (0x00-0x3f) from the
> >>> +        datasheet,
> >>
> >> I agree with this part.
> >>
> >>> or a Power Domain number, as defined in
> >>> +        <dt-bindings/power/renesas,r8a78000-mdlc.h>,
> >>
> >> I do not understand this part, please see end of this email ...
> >>
> >>> +      - The second power domain specifier cell must be the module number
> >>> +        (0x00-0xff), composed of the Module System Reset (MSRES) register index
> >>> +        in the high nibble, and the Module Reset Destination bitfield index in
> >>> +        the low nibble.
> >>> +    const: 2
> >>
> >> I am unsure about this part.
> >>
> >> There are multiple MDLC blocks, AON, SCP, HSCN, and so on. Each MDLC
> >> block contains multiple Module Power Domain Gating registers (MPDGn) and
> >> multiple Module System RESet register (MSRES) .
> >>
> >> I do understand and agree that the first power-domains-cells cell must
> >> be the identifier of power domain within the MDLC block.
> >>
> >> However, I do not understand the second cell. The MDLC bindings already
> >> contain reset-cells, which should be used to refer to a reset within the
> >> MDLC block. Resets within the MDLC block are operated using the MSRES
> >> registers. Why are resets conflated into power-domain-cells ?
> >
> > The Module Reset Destination bitfields in the MSRES registers are
> > 2-bit wide, and control both Reset and Module Standby.  Hence the
> > same register bitfields are referred to in the power-domains and
> > resets properties, through the module number.
> >
> > Module Standby controls the clock(s) going into the module,
> > and is modelled as an SCMI clock (SCP_CLOCK_ID_MDLC_*) by the SCP
> > firmware. This is very similar to how MSTP (Module Stop) clocks are
> > handled on earlier R-Car SoCs (except that the SCP_CLOCK_ID_MDLC_*
> > clocks have a zero rate :-(.
> >
> > Summarized, the first cell is the power domain part, and the second
> > cell is the clock domain part.
>
> Thank you for the clarification.
>
> Since there are up to 32 MPDG registers, and 256 resets, can we encode
> both into a single cell ?
>
> (mpdg_register_offset << 16) | (reset_bit_offset << 0)

We could.  I did consider it (with a shift of 8 cfr. 256 modules),
but see below...

> I cannot tell whether this is much better, but it at least ties the PD
> components (power domain and clock domain) into a single value, which
> matches reality a bit better. The current split power domain and clock
> domain description in two cells gives me the illusion that it is
> possible to mix and match power domains and clock domains in DT
> description, but in fact the two cells are strongly tied together.

They are only tied together in the sense that a module (hardware block)
is part of a power domain, and has module standby (clock) control.
Some power domains are backed by MDLC hardware registers,
others are not, hence the need for the additional definitions in
<dt-bindings/power/renesas,r8a78000-mdlc.h>.
I am not aware (yet) of modules that are part of a power domain,
but do not have module standby control. If these exist, we
need an additional definition (R8A78000_MDLC_MODULE_NONE?) in
<dt-bindings/power/renesas,r8a78000-mdlc.h>.

Due to this separation, and due to a possible future need for expansion
(R8A78000_MDLC_MODULE_NONE, MDLCs with more than 256 modules, ...),
I went for two cells.

> If we cannot encode the two into a single cell, maybe we can at least
> have some sort of macro for this, e.g. this (0xff as no MPDG register
> bits for this block):
> #define R8A78000_MDLC_PD_HSCIF0 (0xff << 16) ((0x5 << 4) | (0x3 << 0))
>
> What do you think ?

I (and I believe the DT maintainers) are not so fond of defines for
numbers that can be (more or less) just read from the documentation.
(and 0xff should be R8A78000_MDLC_PD_APL?)

> > So perhaps I will clarify like this:
> >
> >        - The first power domain specifier cell is the power domain part, and
> >          must be either the Module Power Domain Gating (MPDG) register index
>
> ... for power domains which are backed by MDPG bits, and which can be
> controlled in that manner ...

OK.

> >          (0x00-0x3f) from the datasheet, or a Power Domain number, as defined in
> >          <dt-bindings/power/renesas,r8a78000-mdlc.h>,
>
> ... for power domains which are always on, and for which there are no
> MPDG bits which can be used to control them ...

OK,

>
> >        - The second power domain specifier cell is the clock domain part, and

Upon second thought: s/clock domain/module standby/

> >          must be the module number (0x00-0xff), composed of the Module System
> >          Reset (MSRES) register index in the high nibble, and the Module Reset
> >          Destination bitfield index in the low nibble.
>
> I can understand this.
>
> >>> +  '#reset-cells':
> >>> +    description:
> >>> +      The single reset specifier cell must be the module number (0x00-0xff).
> >>> +    const: 1
> >>
> >> [...]
> >>
> >>> +#ifndef __DT_BINDINGS_POWER_RENESAS_R8A78000_MDLC_H__
> >>> +#define __DT_BINDINGS_POWER_RENESAS_R8A78000_MDLC_H__
> >>> +
> >>> +/* R-Car X5H MDLC Power Domains */
> >>> +
> >>> +#define R8A78000_MDLC_PD_AON                 0x40
> >>> +#define R8A78000_MDLC_PD_SCP                 0x41
> >>> +#define R8A78000_MDLC_PD_APL                 0x42
> >>> +#define R8A78000_MDLC_PD_CMN                 0x43
> >>> +#define R8A78000_MDLC_PD_ACL                 0x44
> >> ... what do these numbers represent ? Shouldn't those be register
> >> offsets from MDLC MPDG00 according to power-domain-cells ?
> >
> > These are Power Domains that are not backed by any of the 64 Module
> > Power Domain Gating (MPDG) registers in MDLC blocks.
>
> I suspect that might not be entirely correct for all of them, please
> read on and see CMN below.

Thanks, looks like R8A78000_MDLC_PD_CMN should be dropped.

> Let's take PD_AC00 , AP core 0 , as a domain of interest. My
> understanding is, that the domain structure for PD_AC00 looks as follows:
>
> PD_AON {
>    PD_SCP { };
>    PD_APL {
>      hierarchy is SYSSS
>      always-power-on
>      PD_CMN {
>        hierarchy is CMNN
>        power-gating-bit is MDLC_CMNN 20
>        PD_APU0 {
>          hierarchy is SYSSS
>          power-gating is done by APMU
>          PD_ACL0 {
>            hierarchy is CMNN
>            power-gating-bit is MDLC_CMNN 16
>            PD_AC00 {
>              hierarchy is CMNN
>              power-gating-bit is MDLC_CMNN 0
>            };
>            ...
>          };
>          ...
>        };
>        ...
>      };
>      ...
>      PD_HSCIF0 {
>        hierarchy is PERW
>        power-gating-bit is MDLC_PERW 23
>      };
>    };
>    ...
> };
>
> With this in mind, I think CPU 0 DT node should refer to the PD_AC00
> power domain this way:
>
> cpu@0 {
>    ...
>    power-domains = <&mdlc_cmnn R8A78000_MDLC_PD_AC00>;
>    ...
> };

So we do have a few modules (I found a few more) that are part of
power domains, but do no support module standby.  One more reason to
decouple them in power-domains.

However, CPU cores are controlled through PSCI (the slightly less evil
brother of SCMI? ;-), so
Documentation/devicetree/bindings/arm/psci.yaml applies, too?

>
> The MDLC driver would pass the PD_AC00 domain ID to matching SCMI power
> domain management protocol call, or, for bare-metal MDLC driver, would
> have to internally encode PD hierarchy, walk it, and apply PD operations
> in each step.
>
> I think even for SCIF/HSCIF, the power domain reference should be
> something along the lines of the following description. The MDLC driver
> should internally encode that R8A78000_MLDC_PD_HSCIF0 is a sub-domain of
> R8A78000_MDLC_PD_APL .
>
> serial@c0710000 {
>    ...
>    power-domains = <&mdlc_perw R8A78000_MDLC_PD_HSCIF0>;
>    ...
> };

R8A78000_MLDC_PD_HSCIF0 is a not a full sub-domain, but merely standby
(clock) control inside the PD_APL clock domain?


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

