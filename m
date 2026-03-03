Return-Path: <linux-renesas-soc+bounces-28710-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDr2E6HnpmnjZAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28710-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 14:52:33 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DAB1F0C66
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 14:52:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D20DF314317B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 13:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA94375F97;
	Tue,  3 Mar 2026 13:45:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6EB344D9A
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Mar 2026 13:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772545504; cv=none; b=b5sXSMbC9EanNeirgZuI5YDOERXiYfsL65wWtCxvTId3qNCnvpVhSXRZJ8K2wp0IONYcTPv74mHd6P7///5o974oPA6zzzciQ9GTNxNhbRBQZdFs4X9SlgAlJWjUwcjJNEvprH2CyFvA5NIWfucp4ghwRX+Rf60DgzNyj6pSFzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772545504; c=relaxed/simple;
	bh=OZlKTjQLB0WPI61T4DAyImwow6wj/voA0icWw8WR7eg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d4NBvcAG0NXYcT2PrgtzusavubrLzIzbF5t3M3BpRUCu3I5ZD8omwP2pfATZq5rzkiYpVebgfpucVPHQawjIgNNRJ5qn13UtYl/mFQgC4DkQaeUvIF8M+cuZfSeMWqH+1SfCttLMCKBOE/zwb0cAszz7hfk86ICcn/utBaPeCEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-567543b8989so2298109e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Mar 2026 05:44:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772545498; x=1773150298;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHho9gbjcUTzNqYeeRJYxoqkklrdbqzzppf7Ht7TuIk=;
        b=IEnakAxSPCQQY6NRMdUFKaxiQWMW//BLXeMHPfTJ9fvN1XSa1m9NfGBzw0N4Lmj0hr
         aEi778crLCvauDU8u8Prz2Gw/nLZRPkcpsyu+O7Y3CBriJip28Bv7TgXOxWg0k3gqNOF
         2fB+mREdZvZ5XZzYnOGGe2OeJNY6Xa461c8wM3w2Gp4q3FgTeYVvi/jL4ng410NleAV7
         ifWL0tJEL6s9esn+iAFBrQemT3VpVX/euJTqv6+OnrzYyVBadkT4SfFk2iCFs+u0Q2v4
         BTftEv6RXq1nsQm4XCdPGkfQnD8HKMul87dUovghjpXwGiQDevnKB7GWmFJEOjif+iGh
         HBFA==
X-Forwarded-Encrypted: i=1; AJvYcCVftSMNCs7cXatuYQofPz9L4HU3NQEnG4dHENTA8/EgJaGQkyQYZmiL2REs8zxy5uKFI1n5jQZnH3Nqtn0toXvsgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKAOs5SXuRHvOwaj7ZP4YtFRxJSQLXcnfuzi91byjORkKiepfg
	Cv01SQwBY1Qt2mTGj4xn2B+sFJ0WZecCiLaAAz7GjmNITc7qwD9sF3YTH36kRx1w
X-Gm-Gg: ATEYQzwUoIEmiMwoa40ZjccXvlm7XDuyNpgHvazIgGhPbungDlg6LpKdV3Mi3IMk+N5
	zOGmmfENSV1mw05rBkbvJu68gr+J/N4q3IahyLp9RsIZnbg1vMLDmLMQF3yspu6dcuzS+LU8Npa
	GkmqY/EROEZUq0gzvvRIl3ZTDkRq3G1I6v0NxjlERy5UJ4ZwEZf9jWxKC2FgD/+fYYLlcRnkKgD
	QRixtGzUhpcQzdPeJ9MHkGZkB6UJhZTQljSzP9/t5C1IhwcBi6YHLmJP5au5ria8AcmCxN4doHt
	ipWxoXIJ66BSd+UMZM4liFGC9777S/t9Rm7HesGuBtwZp3yAb4kbDj9efz3vdiNvHYkkspxYWAH
	nwGcHmSfOBzv6pHz6t6D+fYKKuI0+u/l6+LJxRtakmH2BwNJFw45z0mBM6Qnp4rvGP2abz0hfQE
	mB75jurI3KgtUTr3wiLaIqRug+c5nA6Xs004IWInqJLwR3M6RkI2BJ/sLAnZC8
X-Received: by 2002:a05:6122:4d11:b0:56a:9dab:795b with SMTP id 71dfb90a1353d-56aa0a89697mr6584483e0c.9.1772545497862;
        Tue, 03 Mar 2026 05:44:57 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a92177fbasm19176352e0c.16.2026.03.03.05.44.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 05:44:57 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5ff9ef0a426so24773137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Mar 2026 05:44:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVu4YzmqG6tKMZyd1YL1Nin+cahFzMRMt13ZsaPWy61G+yDQw8FKes9mEPMhg8LJDR6r3HRyOXbPW9I7el4RyYBQQ==@vger.kernel.org
X-Received: by 2002:a05:6102:c86:b0:5db:3bbf:8e62 with SMTP id
 ada2fe7eead31-5ff322805e3mr5632374137.1.1772545496655; Tue, 03 Mar 2026
 05:44:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260213131742.3606334-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260213131742.3606334-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260213131742.3606334-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Mar 2026 14:44:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUbGe-w5ZB1+PNxx_rwLY-_v5AjsqeHOPuHk1Pg6VJ5sg@mail.gmail.com>
X-Gm-Features: AaiRm52z-qW2A9vW7rtR0TULKyTJgxAT4NduiN7xLAkoAbB3DCf3jv7njgyfHzQ
Message-ID: <CAMuHMdUbGe-w5ZB1+PNxx_rwLY-_v5AjsqeHOPuHk1Pg6VJ5sg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g077: Fix CPG register
 region sizes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: A8DAB1F0C66
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-28710-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	NEURAL_SPAM(0.00)[0.501];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri, 13 Feb 2026 at 14:18, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The CPG register regions were incorrectly sized. Update them to match
> the actual hardware specification:
> - First region (0x80280000): 0x1000 -> 0x10000 (64KB)
> - Second region (0x81280000): 0x9000 -> 0x10000 (64KB)
>
> Fixes: d17b34744f5e4 ("arm64: dts: renesas: Add initial support for the Renesas RZ/T2H SoC")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-fixes for v7.0.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

