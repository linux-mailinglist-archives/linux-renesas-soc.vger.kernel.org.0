Return-Path: <linux-renesas-soc+bounces-34293-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zohkE/QPOWrHmAcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34293-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 12:35:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E836AEBC9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 12:35:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34293-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34293-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A345E30182AB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 10:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DC17371878;
	Mon, 22 Jun 2026 10:35:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06905233953
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 10:35:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782124523; cv=none; b=Qcyj4j5hl1QAZBm1hdmJBVe3yL6613dP5kXgZWzyLGUmqWmoHl8UwzGN3vtlrIpTn0j64/jFdG0rLbsiwPNBHfrOZ6pQB0Oe4Z+l4UKdwGoHB7QcVzvyUyreeDyakuv8dnyO/g80MQXX9UuPR1TvvSyur7IMWCNdWPgL5M+bguw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782124523; c=relaxed/simple;
	bh=oMPdsikacqtzYTFY2QxLAR1WVtrEJqjXLr9DFz6PV3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K5C7gn8zQXVHjVO0uPQesep0I5Z5B3wEqBWwcL2wPiim7PNk1auV3KNcfWbhsvxj4Fm+MNC3EeRTHDUMCFlUV14Nt33WbaHUKPSRtq3H6kTel4KYfIxDNQzGqhXCq57TYRvauBc0lQlznnETeUqkIEQ77DFeYLWAr6dO9bgtCJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-72695bd3ba9so2544299137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 03:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782124521; x=1782729321;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbT9MfaCjQT3Ym3J/HtdCmcThbQYXtUBVcRrZ9h8JX8=;
        b=ja4Oyfg/Am+FTzE2h9YUxIyESrNYWT0LiuvuBcZ/QPkjpEXmGBwm8RA5rzmy+sXHuG
         +CU858XymSvOIXAv8OqJmU5dRIuPAnP6DBkY/tq6Rr/LVRNuVMQJz1Fq4zcku3qDmuAt
         PPOGVTtYoiPhgjBg2685f4CzczCNKxl+OxJP8ah9+ut/KTRRh2czRon0u5uUVViRcYzg
         f+agVPgCxQ7MYhB32X+NQu6wMtUqDMnNodLC9H389221ITzbzOBNgnw+5cy3XkA8WorM
         sZRlJ9n3ANxJwQJ48fod0ipup5uz8NRj+xi5ZhZEfQX/SmFFOPV71UX+RVNP199BEVJy
         Q70w==
X-Forwarded-Encrypted: i=1; AFNElJ/+zmfxaEpMQ0Jrn63K/q/thndM0x6uYWMiGBcm4Kroxk9xERnwwMIkY27QIs+O9sC2bv6eu1pmCDqCXuH7OvYY6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5/EqMGLAbEY9qijqYCPEpKqCvITx8BKBnRuiO3yDCsPc1te5J
	85x86Ihk7V4NqJYcHwPY8P8LQFK9lpkpBLFDxHXKd+VVeHL2xOs5+JKmK/z30ZQL
X-Gm-Gg: AfdE7cl16xZG4plpZ3UJGYa1pfvAoUYT2LBLprbdoI1Kl+K8t4i6DKmfv0zqKsPfQq7
	V7kWBdVvkwt32ke7cGrkXxOs9izsx0F4KTsfmabcv7tqvMeqhzDhTPs+cRyml0dnaojPlHNgaNJ
	2nn+AOBA+V8b87/DcTnc/N6JgPu3ufP2Hi9iMm6MXu2+QJAnyunV3XEByb+DyJfxL3sSbkgKWgd
	yUU4mUmjBQBSLat9/CxxY7kk04RdTbVK6cyv+LU3s4tKHnDJDI3QxvqnJRwwdtAgowrpljKMzON
	VvioP5MhZB4xzF1VoiT7Ge6C5xLSW0yG40xetmTpkgj4eqMq0LXgxHkiZCiCBLmjsebVaZj/Qf7
	h53WTsT3vROM5wmNQbiB9BGM6289ay6bbVv942bStGdu6nh5EvQEIWp/aT1unWUpIZq8B64Weke
	P9WsarBOqrkeOiIbNTNvlKL7TNRSVpz2XQ34lRbwWEt9kcNDImCg==
X-Received: by 2002:a05:6102:418d:b0:728:aa5f:dc5f with SMTP id ada2fe7eead31-72a795dde27mr6019597137.25.1782124521042;
        Mon, 22 Jun 2026 03:35:21 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9670c15e914sm5939889241.7.2026.06.22.03.35.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 03:35:20 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-966d4748ad5so2235130241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 03:35:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+15J82FHUiItYPzF0kgI3yUxUM96kJ67JZMfmANI6Z6C2UJQ3ak1IYpImMdjsEi2soDxjw8x9XgRiPSI+D8c7AsA==@vger.kernel.org
X-Received: by 2002:a05:6102:324c:20b0:729:4c16:b4f4 with SMTP id
 ada2fe7eead31-72a767f94a8mr4675989137.2.1782124519443; Mon, 22 Jun 2026
 03:35:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 12:35:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUEPR0xWXRwLjBt5sF7i4HxcDLHCQGmc=gGvFmHRDv-Jw@mail.gmail.com>
X-Gm-Features: AVVi8Cfb4mv2QoVmKeKaT0JRkwbOlUFA4xPaWe_fn-8CnsZR_T46Ke01ntwYiSg
Message-ID: <CAMuHMdUEPR0xWXRwLjBt5sF7i4HxcDLHCQGmc=gGvFmHRDv-Jw@mail.gmail.com>
Subject: Re: [PATCH 1/9] arm64: dts: renesas: r8a774a1: Add soc: label to soc node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34293-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut+renesas@mailbox.org,m:linux-arm-kernel@lists.infradead.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C0E836AEBC9

Hi Marek,

On Sun, 21 Jun 2026 at 04:51, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add soc: label to the /soc {} node to align the DT with r8a77951.dtsi
> which already has that soc: label. The soc: label is useful in U-Boot
> where it is used in U-Boot extras DT fragments.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

For the whole series:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3, squashed into a single
commit. Unfortunately there is no cover letter, so I will have to add
all nine Link-tags.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

