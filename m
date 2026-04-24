Return-Path: <linux-renesas-soc+bounces-31626-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDjCIzhW62n2LQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31626-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 13:38:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E876F45DD9A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 13:38:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4DD730179F3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 11:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26512392828;
	Fri, 24 Apr 2026 11:35:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4487393DE3
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 11:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030552; cv=none; b=j96Npp028crhSHTCLKq7dEHFGEhP+FFcA0aUoIRdI+V/1INTpuheFysZvBFAgy6ftzkZj8YV8gAKLMW5K8zgxgF8jv68NaQFeEiDBP2IkHhxtaZbhO4owy4YfD2TkJVYSf6nsTpQTmMDc+spWMgaHAB1MGBSml7d/SKuGjykyEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030552; c=relaxed/simple;
	bh=NrNB0Z4JheJ9/gWbOMPohCnZWZtAqhLPKDbrHylRWo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NERjyEhV8+0b6HmML6s04PaOnGY9KaNKm0VkXt6A5jZc5ghvbq5MTcGls4d4enYXkFb+VSqn7NYdm8yUSBTYSYvyXJGqLGTcsjtCllu8bQ2KPt1gBvZ7qLYLTBSjlhTtYTsC4lY7XIiHvFmkCDXz8Uu3a4Xy3ACcZgnnUBG/fHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-94de68feaf4so3771595241.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 04:35:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777030548; x=1777635348;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTjTO3Vp0zB9Wc0GJptJYSFqlnWOG96HJNT3Sm1YIxY=;
        b=QNkQp7ctv0IzhPJkg+YbT4iLRyADgPYdC+HjyLpPWbTwg207VJ+beLo96Pp1MrZuK0
         nUTa/ehrmYqBwIdZ2uY3dzIZihaIgAqPixuyN8mz9rjsXSRPTJy7yWD3nSditdDRmwr3
         DY+SvdE3fGhON1qVtLJJ6gMPEF6ySWj4I7/vuX1LzYH7Ik0VA8y+PijrgeVUQFD9kuee
         AVAcA34iapU3Y7WlOiZpW4PcPGyWDpGAS88oRU8josq5lrTMIrE0HUYRx3aOdqpWLszD
         4X6cY0oyVY0YWeRLlPOPxnzLl11nVXK6qpAzX2caztLMOrw7ob60w9MKwRalvSTejIZ2
         NihA==
X-Forwarded-Encrypted: i=1; AFNElJ81CEnbHqdde0MI667dKrjJZcvp1bsDqZo5/y1ndFQtF5tfWXNW13KAN397zA7Ft0CBkomHCMmgeotSQe9volI/Gg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvPS/o7MOgKIIDAKZ85esErLlqL86ftSNvpuqSvYs7J47ycFk1
	IAGMha9Tqw+ncGI92Cd4xWKs/i23z2zNeHV+jOqK+mnMed1jtWYPQX9Zc2M/Ywzdq0Y=
X-Gm-Gg: AeBDievOWBatZE/jvDSAy3BlWEhxNo+9UAPeaRmYgOwLVVYd8luUJ7qK5x0bleiK3FR
	YhjTLWR8UaTJWVCKhCh1AG0mO83nIEmjL/vg9Y2dc6zqD4vOLxIQru6TQk60wHqMj6WpScnJZCe
	cMjyEY42rrgpGzy6im3Ypfe+afcq5LS6rL9vREYfm79jbMdArlGctgeswrSvzpcRhU1yxXwVyxD
	GhxOmKvRATQlNkqONdeyFlIJ3pf5g7OZYiYp3CtNARhTPYcjYXmv+9LEbAZFOBlj4HSvBNOoWZW
	s08OtvPK4SEpBrpGC5HGNeaCaOgHhE51C14BIr7yKRGBCUwV2iWQYCppe5S8dVN+jc7npJsEq4P
	ihUA6XYMUE9VX90sQy0WznzTEZRO+ZajgMlPjUokBSP21nyhKtdRw/BoC68kpeQaCj6oDVc50Jp
	nEfUF0tBMp0FVStKbgDnMIhve5DqQ4761az9cGMZhPDkGRqNi9wGxJDaH3aQoO537YfPT3HBNy0
	CQ=
X-Received: by 2002:a05:6102:441d:b0:602:a80a:4d58 with SMTP id ada2fe7eead31-616f75088a6mr16325857137.26.1777030547696;
        Fri, 24 Apr 2026 04:35:47 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9589065388asm11036718241.0.2026.04.24.04.35.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 04:35:47 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56db1b3626bso5027345e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 04:35:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Uqau7Xiy9OGYRDY1xoYwq1miKbAxev7AcVBafqwc1NlDxrmizIGQNDgwNoEzmNDRFefAbc02MG5eniu798+BKcw==@vger.kernel.org
X-Received: by 2002:a05:6102:292a:b0:60a:cd0e:5cee with SMTP id
 ada2fe7eead31-616f4f84fdamr16386481137.12.1777030099174; Fri, 24 Apr 2026
 04:28:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <7hcxzqr4qi.fsf@baylibre.com>
In-Reply-To: <7hcxzqr4qi.fsf@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 13:28:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU=3AN8wHbnO2Cx4WsLuYWhv_fRfTA50fmrqyREO3nrbQ@mail.gmail.com>
X-Gm-Features: AQROBzBE70P7irgYnQUYx63AIUadZqGfMGlPrac0wi4EECHihh00jV8ht_DYoMI
Message-ID: <CAMuHMdU=3AN8wHbnO2Cx4WsLuYWhv_fRfTA50fmrqyREO3nrbQ@mail.gmail.com>
Subject: Re: [PATCH/RFC 00/14] R-Car X5H Ironhide SCMI CPG/MDLC remapping
To: Kevin Hilman <khilman@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: E876F45DD9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,gmail.com,baylibre.com,pengutronix.de,broadcom.com,sang-engineering.com,mailbox.org,renesas.com,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-31626-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,linux-m68k.org:email,baylibre.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hi Kevin,

On Thu, 23 Apr 2026 at 00:48, Kevin Hilman <khilman@baylibre.com> wrote:
> Geert Uytterhoeven <geert+renesas@glider.be> writes:
> > TL;DR:
> >
> >     Describe hardware in DT, and perform the mapping to SCMI in Linux.
> >
> > The Renesas R-Car X5H-based Ironhide board is the first Renesas
> > SoC/board combination that implements the ARM System Control and
> > Management Interface (SCMI).
> >
> > This means Linux can no longer perform various system operations (e.g.
> > clock, power domain, and reset control) by accessing the hardware
> > directly.  Instead, these operations are abstracted according to various
> > SCMI sub-protocols, and Linux has to send messages to an SCMI-compliant
> > firmware running on a System Control Processor (SCP).
> > More specifically, the R-Car X5H SCP FW SCMI controls access to:
> >   1. Core clocks and module clocks,
> >   2. Module resets,
> >   3. Power domains,
>
> I'm very curious how power domain hierarchy is described on this SoC,
> because one more issue to add to your list is that hierarchy cannot be
> described for power domains in SCMI.

So far I had no need for such a description. AFAIK, this is handled
inside the SCMI firmware, which does know the hierarchy.  Hence the
firmware can power up a domain when any of its children is powered up,
and power it down when the last of its children is powered down?

I think the clue lies in having a PSCI top-level domain, cfr. what
you wrote in [1]:

   "But... how do I describe the relationship of this hierarchy? In
    particular, when the SCMI-controlled PDs are actually subdomains of a
    top-level, non-SCMI PD."

Or am I missing something?

So far I have used only a few devices on R-Car X5H, and e.g. the
serial ports are in the always-on domain.  I did experiment with
a dummy UFS driver, as UFS is inside a real power domain, and that
seemed to work fine.

[1] https://lore.kernel.org/arm-scmi/7hecy3h7ky.fsf@baylibre.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

