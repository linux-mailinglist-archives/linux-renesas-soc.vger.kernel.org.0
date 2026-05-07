Return-Path: <linux-renesas-soc+bounces-32213-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEEFNkBi/GkqPgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32213-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 11:58:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 551B24E65C0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 11:58:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8032301629C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 09:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11D7331714A;
	Thu,  7 May 2026 09:57:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B500838C2A5
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2026 09:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778147845; cv=none; b=Nni8Usw+gXdADOFO6VVJF9/pgATaSAp+0lJLA46wKebKwVVxJ0hSJmMJB1vPmASp2FPKDrn1i1X9WM9S2DhHdr4Z+W0+2Kic/yPv7DP07NsRrX2F4PUgxa9yTjQIuuuN+Z0eNlafW4Zv6aPmQ2dlXuOLhpLox1MEk4EdiCElkFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778147845; c=relaxed/simple;
	bh=edl/piVKrs5OtkoJiz0xR24LhvlZrWG/37ME+V/oG4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QIooHmHcKkNurG1iUD6CczNaUFbf9NkisKlJ46MsSoyOb+7giDo9MajrWuQiQZO4fQp8hEbBi/pxPx7nFbnO2ZSqFIn5OPoVt32LCt+Aad+KeIQJAa4bl0D399A4ccF8hudMUVlQwo2Xp7W1YXo9NZcGMGj6ZEGn6MXJLSrFEeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5751770a178so213776e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 02:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778147844; x=1778752644;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ccgb4ZWN8MCcCOU1Q+Lq/+mMMkjF43VStizUiniPGuE=;
        b=M7pTboMKS175Fp5Sj2dLHyzyawBYKLEcxXtmbfmjwvgU/rmhdH0I/ZYWLaqyGfblDq
         zbeamLoqHRifgLV/bWZyNGh505Nayz1hDcNGbK7hMG9MV4udNjIw8zd9qUt/HRmyhfmu
         bZ8tuFLSg49LCnX7kS0XtEbA444ys8BU/anT0wR24lVS2JEjRAkRjCTCXHvVNRb1LMky
         7I5SAHtJJlmVeC30Uadbpd216rIlKHWkaEet48ODQcGyRUm4yT0XSrY+ClccDO3EbGF+
         lA216tqvGSTv71TU0nzpIg4Q9fQOG9EEwrPyJ2yKI9HuFkWGZAeFuaBNy7e9sI74UpLH
         xpFw==
X-Forwarded-Encrypted: i=1; AFNElJ8Hbdl310unxiqN8+3D29yrIdgDVeUIa8AkufcqQ30VS95Gs71JczeZmsqA8qGwAShY0v/jXGPrvMYzc1mp+fruYw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/nmWIfqwQf8L+IBdAtQu3/ioHmmafvSrEC2Mf0BXP0lG826/0
	Ejvt4cTv+5bqFNLT82ZfZtcKgtxzApTRV89MMW5qSvsn7Kv4wpCZvuwFcv42xkqW1os=
X-Gm-Gg: AeBDietl4/MoJdhTwSyvr6pPTh3mRFx629oh6DK4/hlS2k965bHmcw6sgBd66EFgC9y
	OxI5kCPOp+YYC5bc/xpfTJTsZkErvsSfdwi4vxFFlgRO3Z2A01hruth9WRkxz457mKkilqoFRU1
	zCcsvtGDEJEJFpR62YCLoKI3gfiidK+Dx1ZBZvk1aRbkfZHkd+PznpfqKhhrrVrUa8kjpD4e7c1
	OEJVhTExMROHkpxh0xUFO3JVy+p5aenO8vfMHNHvxRRtiGOhG6qMs+BVPwBwEy/QmXIGHixavGu
	uOjaEZ3lPZWiQMtSrRJbkF0sGd3Kl12jnrjcp6qvRlxNAAjzkOVDCy/kZQ3cqijpoVP+FB9V0Vz
	eDaSw/V9G48T6/kfuzOo7UHKwNOPC/es+8azeKs4uZNXvevkWyEPBQnvVTDizk9q4DnpzXS3qaq
	LWYKxQqyI+FzGk8gF3xxvxH3sT4L5vWiW7hxg8gLbNfEbs2pm6K/nSWZYmXxC9NIFIIgn3pdbvY
	QQM8nq9GmIpAQ==
X-Received: by 2002:a05:6122:8b0b:b0:575:1711:a9c4 with SMTP id 71dfb90a1353d-575596e4079mr600873e0c.9.1778147843702;
        Thu, 07 May 2026 02:57:23 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5749f85940asm11950433e0c.7.2026.05.07.02.57.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 02:57:23 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5752b27958fso226838e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 02:57:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+bDdl11CPIKD7PuOju0ZaD1x8ug2b/wKCcyDCm0N6qq3OficDk2lBmr4IybG6hMlhhjk7Cxpa3M3lqVondWeqG5w==@vger.kernel.org
X-Received: by 2002:a05:6122:6598:b0:575:44b3:300d with SMTP id
 71dfb90a1353d-575596e4216mr3743417e0c.10.1778147842619; Thu, 07 May 2026
 02:57:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430125342.439755-1-biju.das.jz@bp.renesas.com> <20260430125342.439755-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260430125342.439755-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 11:57:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXOWbHjPmKDm8Qt4YUf=s57iw9svfX93xGT8cs8J0vNUA@mail.gmail.com>
X-Gm-Features: AVHnY4LIh-6RAexuL5Iep_BX0eA7afS5VP6xEDhIHRNwdpWeS2ltwNzyuj8AWQ8
Message-ID: <CAMuHMdXOWbHjPmKDm8Qt4YUf=s57iw9svfX93xGT8cs8J0vNUA@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] arm64: dts: renesas: r9a08g046: Add OPP table
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 551B24E65C0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-32213-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Action: no action

On Thu, 30 Apr 2026 at 14:53, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add OPP table for RZ/G3L SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

