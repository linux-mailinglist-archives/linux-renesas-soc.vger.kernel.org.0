Return-Path: <linux-renesas-soc+bounces-28750-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GhQK3jvp2mWlwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28750-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 09:38:16 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AA81FCB9F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 09:38:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 04C3630254E9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 08:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AAEA391827;
	Wed,  4 Mar 2026 08:36:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22238375AD9
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Mar 2026 08:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772613406; cv=none; b=lcMWHQaZ3P/HhooNlbbDeZfmgy8lt5dyYjd+rs3iFldpHT1FBajJ1FWAHeWCu5wmkNtXDThAuLsCvLgpzClsw3WO0OigW9+mr/jaU49MD+VoSfuvONE4MQBXGtItv7EAjYJg3KFw3KTX0/AZeNcAh8ZUwmkecsyPkmW63ojl1OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772613406; c=relaxed/simple;
	bh=elLmZc1jcw/cKiPUPuBZuwYPvBIc0Ez1uIV9vvssIMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nw49XwwFvjYNnhWEnIjbV3b3a7Q4xfR/r5MamxcyvjS1DHArsh0Avcvhz5+WUSznlvORua4lJiV1kCO4eYQtidObERg1sFyOnbixGGAhfrtuvX4RMfNhYD+6XxWz3Cp+Zdexq/5nOXx2yrm1mlsrV4yDwpFoabkUMISPOfQ2uqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5673804da95so2856105e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Mar 2026 00:36:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772613404; x=1773218204;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7EM3HBjgEUYLDW4ZlFiTbUJGOP/CBi5VZ79QGeNCuqE=;
        b=I34xHBOmvV2YdafSo9VuRQ/qQI8QCPvHIvn1zn6B+A3fa2mD7+83b6w8XVQfjaHlF2
         Koya3Vs8DN1DHDuS6Ugh42tU0abDcC3bgl4FunNQgNSNhiCwEwOjcBpe4RAYsCCNa58U
         5X9kCfOsWxCUEIOsWVqz/vOC7U0ql449YJbux0u1L1addrwqEU8sYH+uLEMARwJvZJQx
         PW/ddKGSllZvfm2HpFihoDevEnfkivjDSzxLhvFbEj9HvCGi4uafavWFhyAHODXCZK9g
         uxyY/mE19X59ld08FheZx6c8epl9R50KTWFI83gZK4m0BUK4ifT0sPccZcwsw9LkpUMm
         kkgg==
X-Forwarded-Encrypted: i=1; AJvYcCXpIgL8tLTGUeclmHaWTBkzQ16TVkvVoznVgj90xrKaPK5SV9tgrjKUA58lK8nB5kdNhWAD4FlUFEq2XyfKPp+kEw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5H1sFE5REW4p3su6oELK0W/dGQC8V7A6Xb8R5P9NztJmzrq0W
	lOGvZIIjbKk+1Bnvr6cdIqbzRKUBEcCaJ7ZmOfQgQKhhhxhbL3Q95mrTZd+dehuY
X-Gm-Gg: ATEYQzwO/TW8PH+krRk89387ALd/dTi8ONGvWaPGSxVP6ydMHbf7t/NRC2kwru75mJW
	tMvfvGfJ1WruJIuZq31M8i6i3r8SNvDcRBWpp5y4V9+30AZ4girLD25vnMeF2ie37+19NS4O6Wj
	Wp1riXHVBu547y+c0Ms2WxaZ3m9r93UJiCRYVHwsMsgOsFMlGVSZZLtTn4asFwlyavPpx+RtICJ
	V5RJyVakwCTdEwg2+pcw3HJSlVRoT+RjfvR98GoV5tQ8tC33aRwFsPtBFbvjyBB5WMLbkBNzETd
	HyvjEk5QUmLZKOVoeGkxr/xnIPnW1Uq0jLT54MJnu0T+7HqRA/ILhJoeicfBV0P6Plv4unqklgV
	BIN3yaNXfxLqQWNOJs0aCq+/sKJFHNfFZ+9HyLhcxiDxxdoxiIroqe8LOXk+JQIBLFvRiyYN+/F
	hZmKM0yi5+8QDoV3s4qmh3sCzSm1yQEdq5HPqLbIToC0qcb7pLD4gc1BbbhUJziyL6
X-Received: by 2002:a05:6122:2911:b0:566:398d:96b9 with SMTP id 71dfb90a1353d-56ae74c9578mr466830e0c.1.1772613403963;
        Wed, 04 Mar 2026 00:36:43 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56ae16a4e31sm2872546e0c.11.2026.03.04.00.36.43
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 00:36:43 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5688c221fd3so2936892e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Mar 2026 00:36:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXw4GfFA7qwiwDI6RAkhbtC6Do6g4qfcAYGRQ7G0NTAMj393St8AC1d1KQEp1O12vt8bwthwtpCXvVt+65CFKq2gQ==@vger.kernel.org
X-Received: by 2002:a05:6102:2922:b0:5f5:7721:569c with SMTP id
 ada2fe7eead31-5ffaaa87597mr553949137.4.1772613402810; Wed, 04 Mar 2026
 00:36:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203103031.247435-1-biju.das.jz@bp.renesas.com> <20260203103031.247435-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260203103031.247435-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Mar 2026 09:36:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWUJ05q1s1L5wQRc8X8h1wGyAkuVoAEmMEEurZSLrHQkg@mail.gmail.com>
X-Gm-Features: AaiRm50D9HbEEWtQYOio6TpUThokdQuGEdJJw5GSvHjNWvW1Lgs1DYUnBt4LkWQ
Message-ID: <CAMuHMdWUJ05q1s1L5wQRc8X8h1wGyAkuVoAEmMEEurZSLrHQkg@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] dt-bindings: soc: renesas: renesas,rzg2l-sysc:
 Document RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 22AA81FCB9F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org,microchip.com];
	TAGGED_FROM(0.00)[bounces-28750-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.424];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,microchip.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,glider.be:email,renesas.com:email,linux-m68k.org:email]
X-Rspamd-Action: no action

On Tue, 3 Feb 2026 at 11:30, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Document RZ/G3L (R9A08G046) SYSC bindings. The SYSC block found on the
> RZ/G3L SoC is similar to the one found on the RZ/G3S.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

