Return-Path: <linux-renesas-soc+bounces-30214-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKRcI0a3w2litgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30214-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 11:21:58 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 234A5322D0D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 11:21:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 16094309EDA6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 10:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA6363AC0F4;
	Wed, 25 Mar 2026 10:16:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557453AC0FA
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 10:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774433801; cv=none; b=A9G6MFnhPaZq7cZ/5RYMXfR8RvRbu5x1yvt+oof2UnEd52sfCetjdEQEI0Rvsi9wrQuA4r51Z9nRqn+BVytT67LkOAAFqsBHLOFzIqK4Yazp+Mgxmgy1aCHO9cZhlhbsImV2YR0YGts3nwjau+tB2CKUVU5FZnV7BcQYTRRA/no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774433801; c=relaxed/simple;
	bh=OEBtpeSr41dZ3EZGknc7L9hCWxi5F1KcZZ1/d9YvxG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T4FlVmhhIa+8/GUSmzdFZ+3COIWA+RYUDsdoMz9fPf4SIET5eYds4+GjRZGMiGaClTAK/hsiCnp2S+ztDhAyECPuRSfd9r3xe9Fxcz7RNARSax0aBXmAjNCe0IW5JTipgUzpW1mjxdXI8gn35qW4TLKOEOEsh7yraAC4K5HFvxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56b7fce3ae6so756461e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 03:16:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774433799; x=1775038599;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNQGjJuwM+3CX5QT0Pm/2VPyuySRhYU5/R5xPZKy+IA=;
        b=VUWldUDJz93TqKpLk7lu7WDJykxc55qDYyZFeCx7DjlxAK/BAU7l6nAstipDhBGdYM
         MAlWuNXhZuzPlu57I7IaPZizGjFDD+/dnFsAiwQLkDqaLpHF+25FYpgY8j7VeK2i52CB
         VpxkDrsc2GmEbQ1vJcJeBgKroEOeXnuWA9j1TunTXDMZuQ/KhkOl5eDiGjV3FKRzhZII
         T+1docR+Cg4wXqc/Ap34R1ED3UVcziKaHw3NkKDojkO8AIvuOxQaDQixU1Zp+dwoPLgP
         maNfTMY2PSHILNGEkZNsL3F4qU8DMHQINtDSuLc31NrOPEsReWysUQH5WtRhUhu8ATvM
         FVQw==
X-Forwarded-Encrypted: i=1; AJvYcCUzRvrxn/IjMqUO+IIQeM4GvG4q3TsIPoOZzzQPbY7iiDNIEqdZMhX0xnXrSTVEZSOBInAwkPIU9OcdkHAFzxHkpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwbl58+kcTo7jZmU6bleNHETLGvIlECQE4OZb5xTcz8DixDB+5
	8oOBNBWxRggzuR896jQrs5lS4DHa6LH3LRFXCVqCjAdIIbWU5a5gb3Pkm+xLKC/DAMw=
X-Gm-Gg: ATEYQzwWs/m/YdhOz8f4rOuA4EX40tCn5IssC+VXA2jNTjrEHeGw++/+LaB9UH1DIQX
	20ITCq0UMzrMVqHXYZtT1AN2ufmoShtKvVTzoqb+mYoFXw1p3FQGuRxVXSo1SDGjI1qcMxFYz4G
	4qosCh0cPyVQuU+wKWEvHXL9B6z74pdxPRutGWLsYC/uk6EKYm6xa5cgoMhixW7G0mSVFCy0JMi
	hVgb3ZO7W3JMMG/nr5dQ3lr6Hq/dlhyjaWtPFDsojsgwbdAXY8NTT6lTlwoGhZT0gO7mDFwM79D
	kzu5MXmW99vIU+xUB/8WkjZNyJG+Gg2iehQc+6dgZWoJjUH/+7HiNCmU1e0PikY7CEPqLYt5Fm/
	tgWXiYRDb2LfI5VrHnBkKF7epAMwWDnGd1KvgU4Fgl1TP181PGmZkLWA+bTYJ7nujHT8wnqvI/h
	2hiI7O89jq/ThXVjWKAELIamOsurgxCfDdJ9Kv5wL41YDtB4H0rbR9tpOSvp4t
X-Received: by 2002:a05:6122:378c:b0:559:6788:7b55 with SMTP id 71dfb90a1353d-56d220863eemr1228694e0c.3.1774433799235;
        Wed, 25 Mar 2026 03:16:39 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56cddb939c2sm19174540e0c.6.2026.03.25.03.16.38
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 03:16:38 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5ffdd9a6155so691169137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 03:16:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVwjNn8phmqo89Snz93FJ8afNyN/Lk8sihcSw65Ab7/QkgPLUO35bFF0WSOlRhbwvwp0SRj6vVbOCZ4lFszgHzpYA==@vger.kernel.org
X-Received: by 2002:a05:6102:2ac7:b0:600:d0f:bacf with SMTP id
 ada2fe7eead31-603161b855fmr3344811137.11.1774433798679; Wed, 25 Mar 2026
 03:16:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324225239.19136-1-fabrizio.castro.jz@renesas.com> <20260324225239.19136-2-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20260324225239.19136-2-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 11:16:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXcKBYrQ+5fP4b99zKD0q81LXeH4w6ssP+iOUQNEeB3Vw@mail.gmail.com>
X-Gm-Features: AQROBzC-crhwu8Gg_duZpu3fi-1fiqmCCzQLU7W9KwffAtApPIHHGTBoF1MILbE
Message-ID: <CAMuHMdXcKBYrQ+5fP4b99zKD0q81LXeH4w6ssP+iOUQNEeB3Vw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g056: Remove wdt{0,2,3} nodes
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,baylibre.com,vger.kernel.org,bp.renesas.com];
	TAGGED_FROM(0.00)[bounces-30214-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,glider.be:email,linux-m68k.org:email,mail.gmail.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 234A5322D0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 24 Mar 2026 at 23:53, Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> The Renesas RZ/V2N SoC (a.k.a. r9a09g056) comes with 4 CA55
> cores and 1 CM33 core.
>
> While the user manual doesn't explicitly specify which cores
> should have access to particular watchdogs, it turns out that
> (similarly to the Renesas RZ/V2H(P)) it only makes sense for
> Linux to use WDT1.
>
> Remove DT nodes wdt{0,2,3} from the RZ/V2N SoC specific dtsi
> to make it compliant with the original design intent.
>
> This change is harmless as there are no users for the nodes
> being stripped out of this device tree.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

