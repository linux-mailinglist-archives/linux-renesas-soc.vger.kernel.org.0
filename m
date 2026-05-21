Return-Path: <linux-renesas-soc+bounces-32896-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wB0aNaW9Dmr5BwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32896-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 10:09:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 176855A0C0A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 10:09:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E1E73106885
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 08:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B9F395ADD;
	Thu, 21 May 2026 08:00:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99EA39EB7C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 21 May 2026 08:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779350459; cv=none; b=VQlQACL6Xvujk4g1RFx1n6fJFCePRp+uRdYYe+id4M2g2V/N2MbwihrlYdOhN9YJN/J56vEcHTU837hF39GTdK0eMN3QQeUwocZQPKsvcZlrGbr7j3K3CiiMAMUUrzfcOti0guPg3H2l7F0oFxOcZouXDMFeOuSZf+stHHLxOGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779350459; c=relaxed/simple;
	bh=+RDLim/geriyK6BHkVN+y+fbAsLHqr+xXa+qxaKtufQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WMTh2/mdXsivG4DeUi/5EBpqbZo91PNL2ZmsHtcFV6KPDSSFg9+CHtDcNaFa35zj4jsCXwXOe+hbzczo9/vpkpW1xATy9TPiBtmXhH41DrpMSa7CyEmYlZ5nJDv0SQgwib2vZ2LjjSI7B8crx9y8/mYMDWmsoYQfzHJnT2ulMbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-95cc96eac66so3902251241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 May 2026 01:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779350456; x=1779955256;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kh5ilGfgBOd7IY4hv5kPF1I4gBzJqYiKUxJVuEQxYWY=;
        b=W9JsRIFB/X/GLNSJqruaf71L9m5QZese28GwZ8Vdn9Y37yUOl5jImW5Kw9NHVx5GWj
         2rjLXsOI4+ZUUsE7FKQsTx9UAJCHl5zJB0QPWthTS8uWEBg8PGCcMh+WsgFgw4X0/YZX
         Kj9MEdPtAi3ucEhCXqKnMskEDN5joCXd5pKztD9IA6K1MYjGJOnv51Sr6br3mZs06gmP
         hdPojzKjH8RKZb9Dq0wzSgZftojLgMjMw7DjrVXRed0XoIkaehyKE9kEGNidB7dSBjqP
         3XlLiMm1DRlB1XVsphkJgP+RNAwGGv8gvKxkRDOonMFadso31Ao8fKOdraqQ3/K7dDt2
         q6fw==
X-Forwarded-Encrypted: i=1; AFNElJ+qx45hS4Lc23ZNYxQ/OYvK18yXZ0Il1dGcgpvOn/h0fN8tYO6bU+tlhJq4L9Tcnd2hY1SI2U+JIvd+tkAY8/TH0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvUGvZW7DNo77i2Ak0KNgBykkBb0BKIJ4MOHoWKCSIypXfryX9
	rnOSiiWkVUCyAtfNXBeruoN2rDUvWYPeKTk653sggo0gNu3+GOJHFw39kCekNH6YxwM=
X-Gm-Gg: Acq92OGso33WYhq0S/KAXoW9/0m49YfPASlfOmY+jAFt+yw6IOgQU43MFPdeXv8MuZd
	420LHa+JMZ2R1qGyuyD7dvGmL2d0Pm/Pg6LRkgSMw4zkDY+SosY3JHXuAN69+R66Dj/4Swu0QTf
	w3zA8Fgr7nxOZ/C/U+vz5BEHurxAMaUe6/XChJ81QCXuMNwOhX4kSYvirEkg/Vt3iF4O+plAFzL
	LuMeeZz3HEwFl3f98XWLE0tl+FKr5KphRwcWRG71au5d/MkQpNAQ1YhrNoa2D7KGCNp/KXAmmoS
	cJZVKL9kZRN1s9fapIKPDAes2qy3Qn92kGq+2PUMHiOE/cG1fh3K6K8b06o4p8M9UQpA4Oy6gjP
	rA4BvyPiF/iJAUZ12NFhTJVpkt7rw9ASiDTN7ORxnHjtemaid3j4yjGmkWIr5TtWdjeet45cXmw
	REUUIfaLU3W/vuM52aN20dXqfRX5ABMTIgz1JtGawjdQIKZCR8AfIpiCVdhYI2
X-Received: by 2002:a05:6102:3e88:b0:631:ec2d:12bd with SMTP id ada2fe7eead31-6738b86c0f1mr913772137.5.1779350456514;
        Thu, 21 May 2026 01:00:56 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-63ce6ecd76dsm11162511137.7.2026.05.21.01.00.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:00:56 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-6329f0e0a16so3695041137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 May 2026 01:00:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/l0Uj9Mk6Z3/ZTVyIwEhh+o6ycxg3892MYo2Kp9sD6PFrD3dbfFGsidiSiU63mdxCs+89E9My5OzvqVoYDKTSAGA==@vger.kernel.org
X-Received: by 2002:a05:6102:952:b0:660:cba2:b6a5 with SMTP id
 ada2fe7eead31-6738d46a2c9mr965451137.7.1779350455953; Thu, 21 May 2026
 01:00:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
 <aekXUvIPb8nkhdKu@pluto> <CAMuHMdX8b9C3D8fV5th6GCgs6JAq7HZbF_SrOKz_gDy2H8ksow@mail.gmail.com>
 <agor5HJ0JFBoX3sZ@pluto>
In-Reply-To: <agor5HJ0JFBoX3sZ@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 May 2026 10:00:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJrXcp7_S-KTKQJ8NuVhywiCWEHXMVvWkTFZwnmQayyA@mail.gmail.com>
X-Gm-Features: AVHnY4LKAf9GYj9Cj8Ma9x6mjosVr-AC-oJEzWQ_9yBj7Yua2eAsFSXzEFT0UeE
Message-ID: <CAMuHMdWJrXcp7_S-KTKQJ8NuVhywiCWEHXMVvWkTFZwnmQayyA@mail.gmail.com>
Subject: Re: [PATCH/RFC 05/14] firmware: arm_scmi: Add scmi_get_base_info()
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
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
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,pengutronix.de,broadcom.com,sang-engineering.com,mailbox.org,renesas.com,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-32896-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,arm.com:email]
X-Rspamd-Queue-Id: 176855A0C0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Cristian,

On Sun, 17 May 2026 at 22:58, Cristian Marussi <cristian.marussi@arm.com> wrote:
> On Fri, May 15, 2026 at 05:39:45PM +0200, Geert Uytterhoeven wrote:
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
> >
> > [...]
> >
> > > I watched a bit of the LPC discussions around this (from Marek I think)
> > > but sincerely most of those problems had one (not necessarily simple)
> > > solution: fix your firmwares AND/OR apply quirks in the meantime...
> >
> > So let's forward to the future, where the firmware is fixed, is fully
> > compliant with the SCMI spec, and all IDs are stable, so no quirks are
> > needed.
> >
> > Where do we specify the SCMI IDs to use?  Unless when using the
> > remapping driver proposed in this patch series, they must end up in the
> > DTB.  Existing upstream users put them either in the SoC-specific .dtsi,
> > or in board-specific .dts.
> >
> > The SCMI server is supposed to expose to an agent (e.g. Linux) a
> > sequential and contiguous list of IDs that represent only resources that
> > the agent is allowed to use.
> >   - We cannot put the SCMI IDs in the SoC-specific .dtsi, as that
> >     describes all hardware in the SoC, which is typically much more than
> >     Linux can or even wants to use when running on a specific board.
> >   - You would think we could put the SCMI IDs in the board-specific
> >     .dts.  However, that would limit actual use cases later, which do
> >     not necessarily depend on the board solely.
> >       - E.g. when moving control of the CAN-FD controller from Linux to
> >         the Realtime OS, the CAN-FD node must be disabled in the DTB (by
> >         overriding status to "reserved", or by just deleting the CAN-FD
> >         node, both of which can be done by the boot loader). However,
> >         with SCMI, the IDs corresponding to CAN-FD resources must be
> >         removed from the ID space, causing a full renumbering. Who is
> >         supposed to update the IDs in the DTB?
>
> As per my previous email, after such a breaking change I would expect a
> new DTB describing the new HW to be needed anyway.

The underlying hardware would still be the same...

> >       - E.g. when partitioning a single Linux system in multiple VMs,
> >         and distributing hardware across these VMs, all VMs need
> >         different DTBs, each describing a subset of the hardware.  With
> >         SCMI, each VM needs different SCMI ID spaces, causing not a
> >         simple partitioning of the devices in the DTB, but also a
> >         renumbering of all IDs.
>
> Ok now I am lost..why do you need a distinct IDs space for each VM ?

Aren't the different VMs different SCMI agents?  If not, how do you
prevent them from stepping on each other's resources?

> In a virtualized env, I would expect to leverage the SCMI stack to
> realize the exact opposite: same set of IDs advertised to each VM (and
> so same DTB potentially) by the server which in turn can decide to
> assign the same device (and handle the sharing) to some ID or assign
> different devices to the same or different IDs on each VM: i.e. you
> have a set of virtual_IDs that is what the server exposes to each VM
> SCMI agent, and then a bunch of real physical IDs, without any contraint
> on their numbering, that the server uses in the backstage to refer to
> the real resources and that it properly remaps to each per-VM set of
> exposed virtual_IDs during the build and/or boot board configuration
> phase....i.e. when the FW adapts and reconfigures to the specific
> board that is finally running on.

Again[1], how would that work?  Clock, resets, and power domains are
not the final resources that are used by the OS.  They are merely
resources for devices that are described in DTB with other resources
(MMIO register ranges, interrupt numbers, ...) which are not handled
by SCMI.  If the server remaps e.g. a clock to a different clock,
it will no longer work with the corresponding device described in DT.

[1] https://lore.kernel.org/all/CAMuHMdVunEehM01pLa3t5a6o0NmMOCQRwh7n5J+OkDk2YR9kUA@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

