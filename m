Return-Path: <linux-renesas-soc+bounces-32274-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BuzIPSW/WnBgAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32274-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 09:55:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2A24F35EF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 09:55:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA266300C261
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 May 2026 07:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E710537B41C;
	Fri,  8 May 2026 07:55:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A47328260
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 May 2026 07:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778226929; cv=none; b=BbIFmMvbinRlmV1DVP2myEXCzoSMN7SgeLZCENEUcmpUGMatRxbMt3t5J3t6SM57sOrt3CDuw/Jvicknst+IurHBnmzpqW896WgeCKVSFkNdVfPtx1M1smz0EiIkdl0n1SazCbcHdjTAvkgqNQZ1THdG6vvLntIegD7Wo0n9WZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778226929; c=relaxed/simple;
	bh=pk3moMq1FKy0fl1HwB0CJkZy44+CQqnu0oNoBum5fLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SXC738SPlpX5XRDeu1JkjZuYhYMt7EFCcbnSRThqaHSV8vqdXQvgWoj5PJryT6UFSIkCt92Gmy2GlhtQqBGTuU3tuAeHmLzKHPCbrnwqFHpsCZP59qTirqhduU5AbZrwlzE/zZJHKdZBxGLLrt6imiPG4Lf0gB16JEHGZnVMBhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ba856db1c0so11975675ad.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 May 2026 00:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778226928; x=1778831728;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7FZfZV6lWdmpc+MfoLFhi38NvgPEcuF56xNXrAqxNBA=;
        b=KUua8OOWJ1lRAIpgfJHgWwVytHHnLpXHv9CbTBXbhututmBayo1E+5fhbAHSYOcNjT
         ANyhwAb9d/aE3MUdnfcCfhUvX/rC3gVljf4FzrM5z3avT5eAdrj9jFufBZho+uq2dkP5
         npKIDa3rHWO45/k05mJ0J/ea7XqZKNfwcSaKY8JWwpI9VqG7F8hnqMtjXmqi7L3tw4fb
         zdUQ+KsiHgddWlurLHGvy3jfoqwy7iWY82dibjkgF2mRCj6bH635Q0dgbdwXY2LBK64s
         fFfc5I7qvk3d5kTbRpsGhQHfTV30BN2DCeopD3YT6sfrAOZO20tvzMPM/+i9WSQu4rMO
         +2PA==
X-Forwarded-Encrypted: i=1; AFNElJ/0CN0ep7px63RwVXYW71KmS6IIdYMJ6tqF83bIaGoNOWY1z6hJa5yWwiTVHfjgSRSKlAGrD3SMFIZp6nd0S6I6bQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgbitAU9u2EVrM7ol2aE7uUoPWpc10Nj0idiCG6JwG4HZ6Lfrg
	UOru3TDGBfYlRLXX3mcmmcadqbCYeOaLb5cinsZW0YHRlXPEC+iFmRabHC0MWmZ6RoI=
X-Gm-Gg: Acq92OFvjrBDLEjUTiGRyPZFRYRcRy5JHQrLZdgIp79jS6wnNYKCRxfEO9napLAMg9f
	dufve+s8tG4t4/HpqEbIc9zh3y+hbnN741yvmqbVM5OuTJQXzuws8KK2J2gcbjFde9o9U/9b+T3
	h30Lrx311rBAB/4AgDAMAfmuP3blxvlFnpMXjhIH1vUpKH36G6G2C+7pbiHDVOP/SiH+Sj7NEfZ
	iygD7tgNnRlJBjjx6osAZpgieZZ/iUNloaBVJWzMVqRGkW7mUk6bm/SAv4GikO0GfxHgrNpcxdU
	axAaMNSDrR1QEiuS19ZJyEesbIvaDCI9F1omiV8PfmT3XRS4e292ayMNcKfp0qa/v2kKWpDVCSA
	W9OfRadpgEjVmbz9s5ErpUWm1V2pLpP2KVGMdB0gW5JLR2bmlnAKc7nee5TTQcCUln8j9mKcJt6
	uXAzQ4zG1RPbXU1FFRfSAD++SHAiUD5Mpf8/mvQxYix4L/K6VPU6VzaWY2s/Sn
X-Received: by 2002:a17:903:1ab0:b0:2b2:81aa:f6ba with SMTP id d9443c01a7336-2ba794c0784mr119452185ad.26.1778226928108;
        Fri, 08 May 2026 00:55:28 -0700 (PDT)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com. [209.85.216.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d40a65sm12282445ad.20.2026.05.08.00.55.27
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 00:55:27 -0700 (PDT)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3665a90bcd3so160499a91.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 May 2026 00:55:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Uy0sNJP27VuCGaEBgcM2pzxgA5iJWwqe3irfmNsTQhnuySFWa4GKmfptN7cgOZapzpgqVHeWOaw3ZJP0UxCQtoA==@vger.kernel.org
X-Received: by 2002:a05:6102:8499:10b0:631:28c1:155c with SMTP id
 ada2fe7eead31-63128c11e98mr2184841137.7.1778226445710; Fri, 08 May 2026
 00:47:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <053c312d07445517d8f9c84bfe3cc8fb72d4cd9a.1776793163.git.geert+renesas@glider.be>
 <39879eae-39dd-4b4d-9469-d238cd7d120a@mailbox.org>
In-Reply-To: <39879eae-39dd-4b4d-9469-d238cd7d120a@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 May 2026 09:47:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVumfXkBtxzVBY27SRngHG2eOoWP+cgbkWQDNDkAW1mOg@mail.gmail.com>
X-Gm-Features: AVHnY4Jrjqq6M3ZL6uO54VIlKGFRT3YU3BSC7jZzhSUGnVnDGxRcagGSeBzeNKo
Message-ID: <CAMuHMdVumfXkBtxzVBY27SRngHG2eOoWP+cgbkWQDNDkAW1mOg@mail.gmail.com>
Subject: Re: [PATCH/RFC 10/14] dt-bindings: power: Document Renesas R-Car X5H
 Module Controller
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
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
X-Rspamd-Queue-Id: EA2A24F35EF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[glider.be,kernel.org,arm.com,gmail.com,baylibre.com,pengutronix.de,broadcom.com,sang-engineering.com,mailbox.org,renesas.com,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-32274-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.971];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-m68k.org:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi Marek,

On Thu, 7 May 2026 at 23:53, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 4/21/26 8:11 PM, Geert Uytterhoeven wrote:
> > +  '#power-domain-cells':
> > +    description: |
> > +      - The first power domain specifier cell must be either the Module
> > +        Power Domain Gating (MPDG) register index (0x00-0x3f) from the
> > +        datasheet, or a Power Domain number, as defined in
> > +        <dt-bindings/power/renesas,r8a78000-mdlc.h>,
> > +      - The second power domain specifier cell must be the module number
> > +        (0x00-0xff), composed of the Module System Reset (MSRES) register index
> > +        in the high nibble, and the Module Reset Destination bitfield index in
> > +        the low nibble.
> > +    const: 2
> > +
> > +  '#reset-cells':
> > +    description:
> > +      The single reset specifier cell must be the module number (0x00-0xff).
> > +    const: 1
> Just one more question -- the power-domain-cells second cell and
> reset-cells are always going to be identical values, correct ? If so, it

Yes they are.

> would be nice to keep the description: aligned, and maybe even indicate
> in the description that those two values have to be the same.

I thought that was obvious (but apparently it is not)? The descriptions
are identical, except for the latter not explaining again what a module
number is composed of...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

