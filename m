Return-Path: <linux-renesas-soc+bounces-32690-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMUGOfdDB2oCvAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32690-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 18:04:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB54552A10
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 18:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A4C8C305B278
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 15:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2766E22FF22;
	Fri, 15 May 2026 15:46:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A441D3FF1D6
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 15:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778860015; cv=none; b=a1Df9yPrhYQqrL/vEipWxdMQhv43FNhAsO8tAsx8fKlt4lXX5xcnyUCPhBC7floc+AOqc0cUpKcjxeWNLO1FeaJPPT/XSFcGsD1gtqTDA9GfwB5ZoyVwkjTMolm5t4p7WVBgK8omTbyRifzLsgwZtlcICZWVg78rS50HtE779AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778860015; c=relaxed/simple;
	bh=nSQhZQ6tGlBOmtUdwr13VWi2FIFZQeS4gjHokci/kyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ITa8T+7SrLAUSAikcwzHIkvn8t8jX+jDdfcKvQWU6OLedyzdh5+Z30f37nUENYUD2ozkMvKGyrPnqmqWo6N27wtGmQc0t5M2Q6yezmrjs67LgJY/pJbnsfIoyz1d1vJQgUIBqu69TGhmMzO0eQDvrhhDopVXW1BRU/+6BC4FG9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-394413a63d3so35162361fa.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 08:46:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778860012; x=1779464812;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkAu8P10dwihkNM39UctSZpVluViyWa9thhV649dqfg=;
        b=ql/3OGR04FZmEbcqi8DYQypGGaxXfZ6A4MdN9ZgKbPfd1RwtA+xLV79Bxn19LBtBKW
         dWBDk5uXkeu2wnE8/kIue6aOFMhEmqYmX+mh3KrMtRrK7MgqUykNagWA6JnM/8lPItfb
         uzAQYzLJxDb0locgJeFghTzsu+ckl+r6IN+XjzfRfGgESKEcjfKNsUCZDfeAfjJnWR8h
         /c3Bk4rFOS0Met4aby9ccpPgMGIIQmNJB3myuUrZyhjArncl7aA+T4aZermsHAui7PUF
         m9ML0OQ/QEb2mJDkUUjZO03CrorXxKWG3HP2gb9IdmzCs1EDuZr6VFah31qxmLi1jTNd
         LL0Q==
X-Forwarded-Encrypted: i=1; AFNElJ+cdNVJPrHW1eHKX9Ir2eh17TckQQDutAKLIhBgUx+SNa4eRj02hbmmZBMm7tSMHY7GFwtrIHBGEfBZszNhJEWRrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlWg+DSQ0UHTvcqtmSpQOzcGMSBn4/la7mGhK/kgKnxKebH5Tv
	0WLrC5pV+UT5Yil5LsYxxlve2BDzE5D4zBWqnNpbwt/8vXUYTvpGqQKHgVgjbCkpF7U=
X-Gm-Gg: Acq92OHZkrfG4yIt27os0/YCV+gBPD4j2bNl7E/gbcDyRG0XHQxoO9de/bFs3gJCFWX
	t0KPiRu6qcbCQG3AKmoRAMOJyCLFN/jTcLAvBVF79uGDr0UnFpSz+/pNCgVb6cLOVomi4ZHl+vP
	GmOAyUJuvIHsBA6uA7F9vEGzxYUVwPg/OwqKbOVcqM3dfcwqaXzY+3z7Yepv3OjMvdiZ7eiTqCK
	SP8guHGMy3hIn+WWiJ/w9U34NE3YmT0PM6S90FyIuN9ozznGV59WS4ptPfEuSpz1j9q5G0BZmzL
	0M0gAXIPxIzXMkf+Cz5ypz5tCe4NYf+AlAKk44HcN6CIigP+nXlgnwu+arq01/jvE6BTBcFmAwA
	VQImg4q1dcSf1yUbdhyJxOVv17jOV/YIrb9etuGK+NQoFAQL2WGrjU8fJZE+lL9I2LIuuHHDEaw
	jC2+7EKZ35OO8xQRCYQgvR3Lpp4OSMO2eIyvqhPvGWc2+He3CwqEoL1FfSzWe0hI7k
X-Received: by 2002:a05:651c:e09:b0:393:a5dd:135b with SMTP id 38308e7fff4ca-39561d4c039mr13665811fa.14.1778860011661;
        Fri, 15 May 2026 08:46:51 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945cb1a373sm15990091fa.36.2026.05.15.08.46.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 08:46:51 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-393925cb1baso44351fa.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 08:46:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9jk1C5l/pnftyA/NeaIxTPWLWTWkuJKJ+a7fmtv6Lo6UwraQbyTtF/+Yv0YdzHP68XUKDRdJ1e7n2Z1HDnMclwLg==@vger.kernel.org
X-Received: by 2002:a05:6402:e0d:b0:684:44f:d859 with SMTP id
 4fb4d7f45d1cf-684044fdae7mr1374876a12.3.1778859601770; Fri, 15 May 2026
 08:40:01 -0700 (PDT)
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
Date: Fri, 15 May 2026 17:39:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8b9C3D8fV5th6GCgs6JAq7HZbF_SrOKz_gDy2H8ksow@mail.gmail.com>
X-Gm-Features: AVHnY4L73EskDuVnlvp0bKAJEo06GxthEmZ8mwHk1YJIsXaKqejpar7GeFZqJcE
Message-ID: <CAMuHMdX8b9C3D8fV5th6GCgs6JAq7HZbF_SrOKz_gDy2H8ksow@mail.gmail.com>
Subject: Re: [PATCH/RFC 05/14] firmware: arm_scmi: Add scmi_get_base_info()
To: Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Saravana Kannan <saravanak@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 8CB54552A10
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,pengutronix.de,broadcom.com,sang-engineering.com,mailbox.org,renesas.com,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-32690-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,arm.com:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Christian,

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

[...]

> I watched a bit of the LPC discussions around this (from Marek I think)
> but sincerely most of those problems had one (not necessarily simple)
> solution: fix your firmwares AND/OR apply quirks in the meantime...

So let's forward to the future, where the firmware is fixed, is fully
compliant with the SCMI spec, and all IDs are stable, so no quirks are
needed.

Where do we specify the SCMI IDs to use?  Unless when using the
remapping driver proposed in this patch series, they must end up in the
DTB.  Existing upstream users put them either in the SoC-specific .dtsi,
or in board-specific .dts.

The SCMI server is supposed to expose to an agent (e.g. Linux) a
sequential and contiguous list of IDs that represent only resources that
the agent is allowed to use.
  - We cannot put the SCMI IDs in the SoC-specific .dtsi, as that
    describes all hardware in the SoC, which is typically much more than
    Linux can or even wants to use when running on a specific board.
  - You would think we could put the SCMI IDs in the board-specific
    .dts.  However, that would limit actual use cases later, which do
    not necessarily depend on the board solely.
      - E.g. when moving control of the CAN-FD controller from Linux to
        the Realtime OS, the CAN-FD node must be disabled in the DTB (by
        overriding status to "reserved", or by just deleting the CAN-FD
        node, both of which can be done by the boot loader). However,
        with SCMI, the IDs corresponding to CAN-FD resources must be
        removed from the ID space, causing a full renumbering. Who is
        supposed to update the IDs in the DTB?
      - E.g. when partitioning a single Linux system in multiple VMs,
        and distributing hardware across these VMs, all VMs need
        different DTBs, each describing a subset of the hardware.  With
        SCMI, each VM needs different SCMI ID spaces, causing not a
        simple partitioning of the devices in the DTB, but also a
        renumbering of all IDs.

Hence there are no stable SCMI IDs in DT, by design!
And what do we describe in the SoC-specific .dtsi?  E.g. U-Boot IPL
still needs real hardware description.

What is the stance on this from the DT maintainers?
Thanks a lot for your answers!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

