Return-Path: <linux-renesas-soc+bounces-33420-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIILCBG7HmrZJgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33420-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 13:14:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 726B362D37F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 13:14:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9454730D8976
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 11:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59FEF3ABD8F;
	Tue,  2 Jun 2026 11:07:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097E1394463
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 11:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780398451; cv=none; b=fzYE2KkInzcjJ+C9lj0ALK4J0cZlEG/ecCLsXdyHMzNAxKOw3Cj8VfwCk+RCTM8ysb9XuB3rFc7wHxTEpdkJINiLFjlqIEUq+Ih3YDovj/RiEA4hBJUaAUdGNp1IrSikTc85YhmIaYvnJrqGW14Iwgb9ZRHDReZyvN3GnzTN8q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780398451; c=relaxed/simple;
	bh=l69NxiUTG+KDRNL+lJ3c2t+QaNlhHUbuUDROt+qYWW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bUAjtOroxt0PuJxVWnMcSShx+CYgENx2Yzr23jSmA1//lpIIn9zJXuw/DO1ROwx7+xR5+0iLJ78+ruqBt5ItnljFsD8W0bRA+d/72r/pyXMuosMr/fOlWnBmj8zFFNPt/PgGWZvw0i0/ZBIw8xs7qgna9+Anv6W6rqVoI3Du0Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bebac79fff8so282801566b.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 04:07:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780398448; x=1781003248;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDA630jESKneh4iwNa8g/St2EwYznnBHuc+Np5jJahc=;
        b=astwyorMKamVrbWvZk4FuxSruNuBRXGhcDkZaaYuDHHfh6v0ABsQFavkygUfuVmVz3
         BvJzr9gZtciB1WG+AStlOfdn92BUWUsFS9yXvPAWsSmGP/rxTm7CHCuKUGo/eSBY7gBu
         Gx4Toicm7KHMYH4nFrZx4I4W8XyR0ZLCdJLVdOycFRA3+/6MkwKlq3JEH/dqw12cBl0N
         n2w8P8cfB3knSYT7JEDttvtt2ul50KscCVsQWujb026eJaiUUZ0zUjozOPAM8GWX/aYC
         EVrcH3jhW7J83qJSS3YzfLa/h/b/CsnZOPjG5d98O1cNzkdkVNf6QuxdzrI+Jbgt6LRf
         dkug==
X-Forwarded-Encrypted: i=1; AFNElJ8t7iKkcMJKoLtx6z3UUobkfqLyYdd63WumagG3zsdZ4kPVDjPaZsQNTkXCdzS9RR8SWqX1RDNSjRGDAAyi471O/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyY9MD7FrzHWNRowxLWCYov5i38BHvWf7xoAwnICg66CdFVKPKO
	+sZ+UHbogFLHzxfWXOBVTri0D4ERaUiQyMiQb2P/AB61FmzSLXce7ikSQyhYICLf5gY=
X-Gm-Gg: Acq92OHRyxFZ7BGEcpVXGFxyPashtMmkxqIPL4a0PvZCOuhXvM+x9bOM+LNIRgsdV2G
	K6fsO55xgJhc7E5CkBAPg3m1kNxKuQAJbftS0UqBRr9JfKpAR9ZDsdAhmTYJmZyaSUghQLyaLGq
	nah/Ar+WbqHxnIgd4pcSysjQguK8sOSQg+SPfsFH6Tnh7kvsCxj9V4DRcE6zjNpqhLlESMIhEAV
	QfEyBH+EZa/OtCiYqLDnc87nORuauclOzzfRKvUS7buwAkjStVsc8bKg5By+WAAZQm9258f9rdw
	YmazUFBlsfN7vRtEL8UHmkfrcz1wuSj/LuzQHN3IUiiZ3oTgJMsRO0I+VHqXC92GLf6b0L5DoWO
	BgkUKSOTnrpV8PntU7sbO3+NEcziEVHuI5osHRUqi4WzOBr6ls5Y1Ce85To2JRzZjPzQeOSlEXU
	1pxn+8l4vQuWwsUd7UAX80ZHm/46c5UgCoCf3CDNIBclFS/khYYPMQBIFgZLaKiFVWxs/3yhE=
X-Received: by 2002:a17:907:7858:b0:bdb:a519:5677 with SMTP id a640c23a62f3a-beaafee7f63mr688316566b.16.1780398448331;
        Tue, 02 Jun 2026 04:07:28 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bed94f9f82asm218750666b.20.2026.06.02.04.07.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 04:07:27 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-68c19f1f3ceso6252023a12.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 04:07:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ92Pdj1hml+yYHHJokydJAXYWYbTJFUI2snS7waIdAlXA1UzzGrYBaLoS+rtFYu5XWz12DdstG9kS9ILdBIkD1Izw==@vger.kernel.org
X-Received: by 2002:a05:6402:28c7:b0:68a:f749:608d with SMTP id
 4fb4d7f45d1cf-68c8d1faa20mr7720273a12.21.1780398446024; Tue, 02 Jun 2026
 04:07:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519111958.233194-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260519111958.233194-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Jun 2026 13:07:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUYxOu5fpyGMRACsBQtAMwJrxt9nPiEN-9UhPVY1h3vwQ@mail.gmail.com>
X-Gm-Features: AVHnY4Jru0COyS5ymsVNqmANoEEEJi1BF8TktYxaag_QanrsBHKyvZKEqE5P2sU
Message-ID: <CAMuHMdUYxOu5fpyGMRACsBQtAMwJrxt9nPiEN-9UhPVY1h3vwQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Enable RSPI support on RZ/G3L SMARC EVK
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 726B362D37F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33420-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi Biju,

On Tue, 19 May 2026 at 13:20, Biju <biju.das.au@gmail.com> wrote:
> There is an internal discussion about dropping patch#2, as RSPI is useless
> without a device connected to that interface. However, as per the
> schematic, RSPI signals are wired up to the PMOD connector. Currently, it
> is enabled on RZ/G2L and RZ/G3E. Please share your thoughts on this.

Sorry, I had missed this question before.
RZ/G3E SMARC EVK (which shares the same carrier board) has it enabled,
too, as the connector is labelled "Type-2A", i.e. meant for expanded
SPI.  Obviously it really depends on the use case: one might want to
use the pins as GPIOs?  We can revisit this when we get real connector
support.

> Biju Das (2):
>   arm64: dts: renesas: r9a08g046: Add RSPI{0..2} nodes
>   arm64: dts: renesas: r9a08g046l48-smarc: Enable RSPI2

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

