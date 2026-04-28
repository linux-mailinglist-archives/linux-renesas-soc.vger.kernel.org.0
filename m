Return-Path: <linux-renesas-soc+bounces-31687-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMz2JPcE8GlmNQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31687-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 02:53:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E978947C40B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 02:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3B9A302A05A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 00:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76B502877F4;
	Tue, 28 Apr 2026 00:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="UmLvCjgn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDF427B35F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Apr 2026 00:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777337575; cv=none; b=A1IJpI1HUq4mRTsh8aUJ42Mp0wP+pEY2FhV2ShNaDNDmh+O568eG+DZk+Wo/pVRYyWLBfEfV1tvB7Q3/OBZh+HdR9IYL2sSzf0aDLaMgwQKhSRbelG7wvzBdgpaBBS2oxj0vsLVDds1cCzN/Srm0jD4VvjHn4LcxFUck8W3Rejk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777337575; c=relaxed/simple;
	bh=8Uem3oqRD7Kri2DSyAgANGL+qzMirF3VGc9HlXIQYOs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LALFqhnwe/zcTFGynD2V5yU//e87bOrKqe/Qw5culGWvxGyuHEg1qHA1M2XUvBXifhG8pyN2R7GoFWZLj52m4tJxECPQa0gzuiNgylHe/Ri3a64oneuXpS3W5HFAMO/NiY5mOtZfUit/qdlByAMkUoW1vgWxVjkItrTogpvD3FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=UmLvCjgn; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c7b9f54d3deso3680809a12.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Apr 2026 17:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777337573; x=1777942373; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=t3FnaIBp0espZORVL/rfnjBPdcVtbw4VckmuHvIfsjM=;
        b=UmLvCjgncUFnkOkej4+wGBHe0fTbbx54IoP/u0gXvql2aNFmqqno+yqwl+Ccx54FTN
         gkS26kFBc2qdrgwLMIhHZo9xqUwAylAU2efyVow9NXrRClAnEBtKOtj/Mp0qDcDB/4pb
         j2zd9BfXxrR086oPDlyxqLHwu+R15O3ovW4uYngGN7f5NWjRPVzDTRD+39B9JVFrd16p
         DobTC1E1tD9X+FTQaV5U2PD9+FJcFOxI/fIqxRCnGTh9g/geoS2QDELG7DPvgPquAd8u
         YrsmS/8TVtKpJgNA9HeCptCErNwn5dpt/rcBqDGk/iUM1o8rRq4SZxubM1IjxyIxGeAj
         +hGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777337573; x=1777942373;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3FnaIBp0espZORVL/rfnjBPdcVtbw4VckmuHvIfsjM=;
        b=Mf9jweK+nozx+zEA9I2EHlsBaOepOy2Lfj1yRM57mRUG5E6iK4fIF4Di6cfsYd8lbt
         bZ9zi9floI7BGWhCm++Q/r12pSHl2VodrKhRdmPl91AfgCEz2iMNB9TtfbCKm2Wkjr9X
         er4ImPZgFrrsBFSRpczaiODV2xUBLLIpqVNwVmR5sdHDD4CM4dRdkFH9U8I42WVAqtc/
         42lm5RWXwVrRyTKBDEpcIySgQ3KjQBQIUsMxPbq85NuuM+VzQ3mE6C5XrKMhHHnCP9VY
         fYy+3OQV+LpLQeH98/38Mnee3hE4HalBttg+BFWYMNnSEQKNRw86/+EBfxg9JBs/AhA1
         dV4g==
X-Forwarded-Encrypted: i=1; AFNElJ/ZVZACmyHiPbXmamDfcEB5mz93DUk2yFepBdoiYwcRzlRl0wnBQxKy4sZNdz54fyMapVC5LJovwUK3si/j4OrAdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgxI71enpChzmT08KHb7YLAq7Z26Rlnvs7wV5ZIoWRQcAHnj60
	aSXqcsTHhulJpWXvNHio3U+P4OlXZtnaAceTyVXifcYtFd4F77ZB9l9sj096bdW343M=
X-Gm-Gg: AeBDieuTnvRASgnVeYrZaqlxsyk5A7TcuCl60QTwsajm7hMQQmFRBbWFCXZE/40/R+1
	oAtI9u/CGpersttNnjqr7fsRDB9n3ktKBE0hf3Z27xJ6DszBF8+LYSXQovH9GWI/yTosNA5xcSZ
	/8q8F5JChPuIfRriZYd1/bDnhm1v1Ch7PD+sPwe1vEP2x2QzUdu7U4cUAiYoHilXvdRJJ/nUUJ5
	zjxktvYUPXUzLIOPQ+PtPj1y0Zj+vpwatgRm2uBALbLyUtqglXwSkq2zz0edVCGEjbzRrJ/ee2s
	vYxDVpPEcu6msJE/13VT5KQKfBK1eEh4fBsg1QHd2me1xo1Ara7ix1EHWwRiqPuUG/A+hNA4TAs
	/TyU/vIjxCBpaCPZfFpMYHE3+ReQ4+PbL8mvFRNvyWK+eoDiYkrvz1pon+/d9+Dr0cE19b+cLNy
	Rnff/lD50tWItbg63rgOgOMBsoXKV2jg==
X-Received: by 2002:a05:6a21:339a:b0:3a2:ecb8:56f0 with SMTP id adf61e73a8af0-3a39c214537mr1036677637.33.1777337572752;
        Mon, 27 Apr 2026 17:52:52 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834dae1ff95sm798672b3a.17.2026.04.27.17.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 17:52:52 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi
 <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Magnus
 Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Ulf Hansson
 <ulfh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Marek Vasut
 <marek.vasut+renesas@mailbox.org>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH/RFC 00/14] R-Car X5H Ironhide SCMI CPG/MDLC remapping
In-Reply-To: <CAMuHMdU=3AN8wHbnO2Cx4WsLuYWhv_fRfTA50fmrqyREO3nrbQ@mail.gmail.com>
References: <cover.1776793163.git.geert+renesas@glider.be>
 <7hcxzqr4qi.fsf@baylibre.com>
 <CAMuHMdU=3AN8wHbnO2Cx4WsLuYWhv_fRfTA50fmrqyREO3nrbQ@mail.gmail.com>
Date: Mon, 27 Apr 2026 17:52:51 -0700
Message-ID: <7hcxzjewik.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: E978947C40B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31687-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,gmail.com,baylibre.com,pengutronix.de,broadcom.com,sang-engineering.com,mailbox.org,renesas.com,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[khilman@baylibre.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email,glider.be:email,baylibre-com.20251104.gappssmtp.com:dkim]

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Hi Kevin,
>
> On Thu, 23 Apr 2026 at 00:48, Kevin Hilman <khilman@baylibre.com> wrote:
>> Geert Uytterhoeven <geert+renesas@glider.be> writes:
>> > TL;DR:
>> >
>> >     Describe hardware in DT, and perform the mapping to SCMI in Linux.
>> >
>> > The Renesas R-Car X5H-based Ironhide board is the first Renesas
>> > SoC/board combination that implements the ARM System Control and
>> > Management Interface (SCMI).
>> >
>> > This means Linux can no longer perform various system operations (e.g.
>> > clock, power domain, and reset control) by accessing the hardware
>> > directly.  Instead, these operations are abstracted according to various
>> > SCMI sub-protocols, and Linux has to send messages to an SCMI-compliant
>> > firmware running on a System Control Processor (SCP).
>> > More specifically, the R-Car X5H SCP FW SCMI controls access to:
>> >   1. Core clocks and module clocks,
>> >   2. Module resets,
>> >   3. Power domains,
>>
>> I'm very curious how power domain hierarchy is described on this SoC,
>> because one more issue to add to your list is that hierarchy cannot be
>> described for power domains in SCMI.
>
> So far I had no need for such a description. AFAIK, this is handled
> inside the SCMI firmware, which does know the hierarchy.  Hence the
> firmware can power up a domain when any of its children is powered up,
> and power it down when the last of its children is powered down?

Yes, but this firwmare behavior is subject to the normal list of 
limitations/quirks/lack-of-bugs/etc. that we usually run into with
firmware.  So if there's ever a need for linux to understand hierarchy
for those reasons, you may find yourself stuck. :)

> I think the clue lies in having a PSCI top-level domain, cfr. what
> you wrote in [1]:
>
>    "But... how do I describe the relationship of this hierarchy? In
>     particular, when the SCMI-controlled PDs are actually subdomains of a
>     top-level, non-SCMI PD."
>
> Or am I missing something?

Indeed, the tricky part is when the domains may have CPUs/clusters in
them, and in my case with the TI SoCs, the top-level domain with CPU
clusters is PSCI controlled.

It wouldn't suprise me that other SoCs have similar features where some
domains are children or siblings of domains with CPUs in them.  This
kind of dependency is pretty complex to manage in just SCP firmware,
because it involves TF-A/PSCI as well, so it's a likely spot for
firmware "quirks".

Kevin

