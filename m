Return-Path: <linux-renesas-soc+bounces-32867-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGOoBx2wDWpy1gUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32867-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 14:59:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 746FE58E5ED
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 14:59:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1242F3031CEE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 12:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 027FD3E1D01;
	Wed, 20 May 2026 12:52:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438013DE435
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 12:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779281548; cv=none; b=GB4pdiOuZgK9a0npwpqC6eTC2ZWW/me8yjERkwc49CrBvJyWoWndEJ3L0sw4piNdleDXA+DuQx6wESSTCR7pclk9fRsJBpY7kXXd0rY719yT4K103D5Er7VYap+29+Q5h1oiZX/sfwdwIhxduYf0ZcadVIobSgcprJuJuEO4dKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779281548; c=relaxed/simple;
	bh=wEVllGGRlitUi5HmXwQREobUqeKu0+IX4H6Zregl6ks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VKY+BW3MoStIPFBk/cXRCk75HLivYfM4Y/Av1svGLtL/86qaqJUcnNXUfBdX8BDAPhF3dqhKhXCpk/5daJ1T0iau2J0VWVhXvIFxmxPV4jFjL/a91OcWNDY7dscAjZJ7wxb2Ipj8msBvD+Im0ZWfTl8Nm+gjD8nJbXF3K7uiV5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bd22b2abaa4so851348266b.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 05:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779281545; x=1779886345;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7Xbs/1G/OLUO3ICUULHrqolwG0BvsCuGFywNTCkVd0=;
        b=r1ykMStuO9G4McIP6QueRmaFBrOiZ+uT7xxsJ4mBpUCNYvvo+ZvbLO7n78Ev7aCI+C
         ZQOmsiWVk4g631+CKi0TS1FtmydSj1fHP4AejJSz94bRrMhotAHDBrr/MvfMbn6/w/+q
         DiXpvC8zXgS/kjAhX54J8VZJOgX/Jy39ebyIYOXS8LKxKGhXRv2UsgbH+EFgfIT31pgI
         FGK09cC86oJgljkjOnrZxg6pOZZYg5AWDhX7JOvAvjW9Y+UYvbtd4BANHheCLuXhzb66
         dmz7gw0I/acgFwu2TPKTclBR7E0IZjsktCcQ98ZI6rs7md0BT5n3k9NhMq+sQk3seHhc
         lgrg==
X-Forwarded-Encrypted: i=1; AFNElJ+e7F/93VDMnwEjjHlIR+6jJ9D0p2hsM7yfcWNIckraOBIJTze+F7x3Oab5qHL0n3wcoDVnK+R/CAWCCdWcqDjkTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyEXyi+rsdHr66Ua77gS6Na3orCTG03LZY01A1RxdxbbGNz3ta
	mZ2alR8shI4RGiAQ56cmU3qWNqER6z9yAJCjxKu3C50gSAVzHy/bAoDbux94YNtWcPI=
X-Gm-Gg: Acq92OG0Ho7d3tbn8kCrpBaHmgkehGKOa8BeKCMFp2FkWv4CfEHTqhURWn/fBst+XNQ
	/ljCB+CJ+wqfyGbt9ghZNgFN3/TMLOdM4cM5dd43pGvrrNVzjlqNRA3WHx2XbRPedMzgILuT+Ie
	K2600x+Z2J5pBWyIYAySPHNUNlNAwITNdmaZVWdmfGh8Ho/Tj0AoaeUoYwEOQoOnOfqVn4KQyUI
	Yx9jA3p6d5agXosyH5nXnEcyAwpUzDV2eXpnZt0N089JFD2jJsessGL+TH/03qVCbJKEeYPNiu6
	VKjfNHoKEP+7+OBO2X1hweZhs2MmivVfBl4VyLYECvQP92L1Zhbrj98/QDKjTmWCM0w0q1uVG73
	tOCPlfZBycK706SNMhNiQeSQnoeUdQ7R0hdvZv18OTxghIEjayVX+mQ4J3NayboE8MGg8bBHasl
	khNX994IMdK59B77/yiVuEh7h83jJ/cKIKXAGrOBVZa/4HA/IrN2izMC9afWbSNXua3F7u6FU=
X-Received: by 2002:a17:906:6185:b0:ba8:a21f:9c4e with SMTP id a640c23a62f3a-bd5177e0935mr1316288366b.11.1779281545377;
        Wed, 20 May 2026 05:52:25 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4dee133sm846661166b.35.2026.05.20.05.52.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 05:52:23 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-67c4aaf76ecso8225782a12.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 05:52:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/11biNjmUvVxZZR3XD/lpfnREdvWLw1eMRG7I101KtnmPKzfvPiJxXxKg2q9k4Mmrk1zHC19wDBZ1Pg7KB0Ltwxg==@vger.kernel.org
X-Received: by 2002:a05:6402:24c7:b0:67c:2674:a57 with SMTP id
 4fb4d7f45d1cf-683bab3799bmr9664076a12.0.1779281542288; Wed, 20 May 2026
 05:52:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520115144.60067-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260520115144.60067-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 May 2026 14:52:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWapgcYT8fOz+1uwWS_apAFvAtCEkqMTxWzM2t49TJptw@mail.gmail.com>
X-Gm-Features: AVHnY4IwpQkTbfRh0vPcsz0GG5a7bDpYXgakS3Wb4uu6PL5AEoBqm9urgWKWvzo
Message-ID: <CAMuHMdWapgcYT8fOz+1uwWS_apAFvAtCEkqMTxWzM2t49TJptw@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: dts: renesas: Add max-frequency to SDHI nodes
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-32867-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux-m68k.org:email,renesas.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 746FE58E5ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Wed, 20 May 2026 at 13:51, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add the max-frequency property set to 133333333 Hz (133.33 MHz) to both
> SDHI0 and SDHI1 MMC controller nodes in the RZ/G2{L,LC,UL}/RZ/V2L
> device tree.
>
> This change results in approximately 33% performance improvement as
> it sets the SD clk to 100 MHz instead of the max 133 MHz.

I guess it is the other way around? ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

