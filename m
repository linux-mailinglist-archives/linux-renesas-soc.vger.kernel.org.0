Return-Path: <linux-renesas-soc+bounces-33592-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tfTkMOR8IWo+HQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33592-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 15:25:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68ECD6404E6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 15:25:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33592-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33592-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EC9A630C4429
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jun 2026 13:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A74D478E2B;
	Thu,  4 Jun 2026 13:18:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0191175A64
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Jun 2026 13:18:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780579105; cv=none; b=YtK1yDebFpOWs74Qc9io2ynDsgfOjdeAzHIgv/eEl/daLrVCIv1v2ophDAldUVMft2xIqEfeRK8qLADX6ZN14/e9h2AtR6dBQQmscRPEZrgttd7QlyELjZ869n/xjNoQpKpJ7os4UkRdp4ghZvYxFT5I6Yk3r4Nkj/AsxMy+rPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780579105; c=relaxed/simple;
	bh=bYwokgzjJMEgskZ4MF14lZVcdA6LPWC4F2K8tkcWBKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QRD9J62Xo4o7c9s1bGQUm3wfEf3Ml4Ig5qgSUTeW+7DwLHJjInVUVS/f2DgxAHzd62RZ4eUYgXplToINpDuIQaKEiLYje9iZm1bvgGtg/wGoihREdtSsqqfEjoGYF9YcxpHiwU8LzAWlY8/7aZAoeht7bs6K3F3x8Y3G4NWEnaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5a082548de2so170154e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 06:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780579103; x=1781183903;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZ3z50sIILn0aoc9gJVhIXVKE06Pnx0BbiI15tZf6Ug=;
        b=RbHvpgpAXqopBSedf7ri/O5zG3/FrCZzudleXsCjMKi6engXgHb6BB+zBOmBo9G6sP
         f4d5nX/mlGQ01VQ4+lsmDmOOEcGo5LAIMumrQyB4W/V0VcPmSvpLO9ZyOwN3EwZ3aiJk
         1dfDdq5iO3hhOYXhRKlwVsosit77IgTLFEvH4xYB83QghBSk3dzUcroslwh7sHgDIZQ4
         LWmpkYfTtXkIvTW+gwRKvvZYDhL2yKNzWoNA7dE82TEskAolWKE1uBx7hfo3Q5WpZ4E3
         sIzO975UiJj76n2b32IaF8+y9X6K4zfMiV+x2545tmaQN0rdgIsckvqA0pAdnwv5A4GS
         FYYw==
X-Forwarded-Encrypted: i=1; AFNElJ/nbeKKOVpszNR0FswoN3KdMjGbhzagE+Rn+RxiaFKVh9wOZYX699E1dk2yuWKBz8feQIq2N6nWbxHhRxqtY0PFgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4KirQJsb4kQvpryIwTKQ6E0OLrCyfSk8D1yauZ5Jk/0uHpxQq
	7a3uCDR2hQxFd4rvCWlbyWctIQE4840eDyCt4PVVnRtRfC28gcZ1pyI4cHpE1gjxyXU=
X-Gm-Gg: Acq92OFfjNFZmcvgsXF0vDJPTKP4MjV2zC64NSBz814i2T59xBjbBowbRooEAxB2BqY
	hODQE//z76Df3OoHLkMMBd2SUHnLAijW6S42HcYbwiUIbrSAUlqbW3ig6zoQi+gy4eUUKfZ5j0x
	AFIZSbWiKfZvDgAUSQELts9TQjcN3KZgD1fW9yJT8jcmoo9alnMInNPeswXS6VuidaDh+0SU8ah
	Ws32BzQwREhEDQH/JW6wX9LQfHo2Fi7I6eA4zqr3tX+H+oXl6MYGd5/JNG65msGWm18bIt/FTNf
	M75ubWoH4Xo5GOiDrdw9bq6ijS9xUfh0Gro7OLHnP2RHnthpQ8zA0jZ0fFlQ0V30PRVjHI1RfUN
	ygb2M6PG1cUNaWDl2J/S4bFvQ2TBVMJFnaqGZ/1Y/j7T/MgK1wFbRf/gu7BFSf7uX608dzGMzyn
	jh7n3+Nhu4K699Z6O3V//8guEl0bVOx7H9Pr+l4d5ivP1gpdoAkmlmVGaJtYf4QaM0pgOWdWxeh
	wg=
X-Received: by 2002:a05:6122:608a:b0:575:29ef:7e13 with SMTP id 71dfb90a1353d-5a6e4470317mr4278669e0c.3.1780579102914;
        Thu, 04 Jun 2026 06:18:22 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9641414e193sm4383136241.11.2026.06.04.06.18.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 06:18:22 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-59c1bacf871so216462e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 06:18:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Zl11nRhPCHkR6ehC8LUsRY8nSUXhqLe1XzCgxxGhaDELI6F4nx0rx3M+IiXBl0WqiYef1KuASZoBaSNZzjD2Zkw==@vger.kernel.org
X-Received: by 2002:a05:6123:147:b0:575:3b9e:db3e with SMTP id
 71dfb90a1353d-5a6e446fe58mr4336399e0c.1.1780579101614; Thu, 04 Jun 2026
 06:18:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528134752.79813-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260528134752.79813-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260528134752.79813-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 15:18:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV0YT4=2x20GOkCtETj8abCfjoj4S8VNCTfEuVue=A1Yg@mail.gmail.com>
X-Gm-Features: AVVi8CcsBMYTe1oqLUPm-cmxBRqWCx-zfvbyGziog2OzBpBmPSOTKupPMWje6n8
Message-ID: <CAMuHMdV0YT4=2x20GOkCtETj8abCfjoj4S8VNCTfEuVue=A1Yg@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: rzt2h-n2h-evk: Remove unused
 MII/GMII pins
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-33592-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:prabhakarcsengg@gmail.com,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glider.be:email,renesas.com:email,linux-m68k.org:from_mime,linux-m68k.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 68ECD6404E6

On Thu, 28 May 2026 at 15:47, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Remove the unused TXER, RXER, CRS, and COL pinmux configurations from the
> gmac1 (ETH3) and gmac2 (ETH2) pin groups.
>
> The Ethernet interfaces on both the RZ/T2H and RZ/N2H EVK boards operate
> in RGMII mode, which does not utilize these extra MII/GMII sideband signal
> pins. Update the board switch configuration comments to accurately reflect
> the pin ranges that are actually in use.
>
> Fixes: b272b94fd2239 ("arm64: dts: renesas: rzt2h-n2h-evk: Enable Ethernet support")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

