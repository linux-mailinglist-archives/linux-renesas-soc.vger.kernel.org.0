Return-Path: <linux-renesas-soc+bounces-34379-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2jVZHDLCOmouGAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34379-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 19:28:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D725B6B90C4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 19:28:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34379-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34379-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 110FA30068F5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 17:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706A838B13C;
	Tue, 23 Jun 2026 17:27:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D05138B123
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jun 2026 17:27:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782235650; cv=none; b=lIzPlOdR2d3FJfZJpowp1+FQDgCKzYjbaTw8GzfRbG9ipBu1frreSqMjo065/LQr48kmJMGnK8PskHd7NE9QETsTllrr/Ll7AaWIHiPrXQhIKqlCFDswXtkMjmg5j9emlmHev1VPeKAr7A/7P03vgLI2fBoaUbH6cKcoC20h+z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782235650; c=relaxed/simple;
	bh=vgfeiR53zUTqL9wCEjuNbQgZ56wPbSXK33ZlwgtxoP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=stOA1yuVAwVRpoURCjMbLID/In64Fs+mqLmMYIqi+qDerqAdT1GwCIFeeMnMaL3NzDQiLOTgE1GESkml/8yV91vQ3afcSMqd5CYqJrcO8g9F4OJ31HqalFMjwh3V14GoIxYWn2MxVnNsRy4ZJWWeHZPmk4RO5GSADy62LbXAM+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5bbd26a2729so86927e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jun 2026 10:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782235648; x=1782840448;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Muh/OMSDZ663MN4xoOU6DnOJThUhytQ4BDNNdsQmXS0=;
        b=HGoh8CTgKP63mwNEBQBoo58xlSQ2HWijMr2voMU3GoeGqgRqGnsuV0krEcrAEqfAys
         EN+2up4YBreI98T3q/1JlPvPvhHv6fHiKKVQQoyNhBXktDAN547dT3du9mUNXBITuzk1
         Zea/k2e4okkcUXT8vcrdxotM1saFTF8IB0Dc9OFr+tGs49FcAILiUn9whxcJa/bIozf+
         6B2hlhJjPViDYmcWunhFpOul64rQXQDIos6iPO6+2Zxi/MZGXmIQtzCHPMyKFHRkEUUH
         ZVVGDyClFggfkIH5YZGzdmP4lIc9AnyBhxCq446ev84ZCZhEZofXZQnrhEP3Aw1CPZ2M
         4/uA==
X-Forwarded-Encrypted: i=1; AFNElJ8xxt2ZxHZAvKPma3OWSFblXyBFuLZXjQyrqK1R/0S5BxPVdFxNdfWF+dKy9b5HaRCzqSPO/2WMuphIPHhtT0dL9w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu52Z8tGu0m/hc2TuhTfwDgejbrn8wPjfWZLOe7EM8wnv2wL1h
	ADaK02hMhgCqnYRT4VKmDR0Kd8mL0wbITwdKGGo6NABlrAFgJEzKWc+ii8yQ2Wz+
X-Gm-Gg: AfdE7ckiinU0EErM2/W61dOEtceNagTJ/nCD97IElbqdWCQ4kV/bIUJb7XdnLvX4BNR
	Gf0U0wZEwdvbyr+RSvAwsBdl8uc5JHqOzL5hXQXwnWrBIW2XervH20p8xnb5PW+7rDAwcjJmq7C
	5/qKqcewMFFhgWGbcMtGKmZgwSvzueSkVPEpt6JOFjI4f6YlFREtA/TIGczn77oSM1zK53pHcGI
	PXBGeM0R/Rj0eUiK73KaQy7vWTgK7AhQEbpJyc10m3KRwnY1giiCCdede9nUgiBwxkHQ2+f85dt
	MviJjJm2npNbK3g5RpWYt5SjjrJD6rAFnySUWxaU1GX750QmQMSIIW5UnwO/zmnxLuldvjjv65M
	LbcgTC7RO5lnVLPiBGJrE68TOX6CwK4ogk7gCABN1VuG6dtqlB7glMcCGDsKVlcBABVXUtjZPaB
	td7R7Jy48KGURAo5FpMIVO/SIZe6VnGtgsduQoCTqDI2sejflrew==
X-Received: by 2002:a05:6122:6e01:b0:59b:7fbd:39f8 with SMTP id 71dfb90a1353d-5bbebcf0d8cmr10981759e0c.10.1782235648082;
        Tue, 23 Jun 2026 10:27:28 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bbfb7d309asm9747564e0c.1.2026.06.23.10.27.27
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 10:27:27 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-6c3154fa47fso89384137.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jun 2026 10:27:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+p6Rm1xb9Vlx0LgMHzxcf9VDooTcz7TSr5aqjEeoszg7YYML9bJDWdiw00LCMwg3CA91uFwjQFcZMJpsLT9Jp6Uw==@vger.kernel.org
X-Received: by 2002:a05:6102:dcd:b0:6c5:d55d:c091 with SMTP id
 ada2fe7eead31-72a1f0afecdmr13056221137.14.1782235646896; Tue, 23 Jun 2026
 10:27:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623162039.153291-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260623162039.153291-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Jun 2026 19:27:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVjvjckPSBtqvWy_WHZZL08KeNo1xeL7jaTG+5rKyWiTQ@mail.gmail.com>
X-Gm-Features: AVVi8CettBHPDtUTsCGKpp8vAn8Psn3jekUVojmzhnZ0gc3_U3cHxNpDSHwB5q0
Message-ID: <CAMuHMdVjvjckPSBtqvWy_WHZZL08KeNo1xeL7jaTG+5rKyWiTQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: renesas,versaclock7: Update maintainer
To: Biju <biju.das.au@gmail.com>
Cc: Alex Helms <alexander.helms.jy@renesas.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Brian Masney <bmasney@redhat.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-34379-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:alexander.helms.jy@renesas.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:bmasney@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[renesas.com,baylibre.com,kernel.org,gmail.com,bp.renesas.com,redhat.com,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	TO_DN_SOME(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,linux-m68k.org:from_mime,linux-m68k.org:email,renesas.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,glider.be:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D725B6B90C4

On Tue, 23 Jun 2026 at 18:20, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Alex's email is bouncing. Update the maintainers list with my contact
> details to take over the schema maintenance.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

