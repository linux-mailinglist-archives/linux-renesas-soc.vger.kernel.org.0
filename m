Return-Path: <linux-renesas-soc+bounces-33017-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEFfFOZqEGqgXAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33017-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 16:40:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 508A65B64E3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 16:40:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AA2EB30E9D33
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 13:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95038401487;
	Fri, 22 May 2026 13:55:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30533FE677
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 13:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779458147; cv=none; b=j49VpxP8blHZ+WxFpPtoxS+DwJV7DV8UvMzw1I7vKiwrIdR44ZfM9pAypoCRZbz+VcwUfQ5NyOo04RvMKQVLF2NcTAvdbZA13TSe631CrtfXrWRB8K6XtLcxnfXoUppc25yn/+E2azZcSbz6TOrZfzI+wmde12ve7Zt5kYEv1Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779458147; c=relaxed/simple;
	bh=FUrrvYF1KlCYgNZMOn/2U2OmhC3p91aW8lXQejJ1EWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FxLuRua+D+UxgEIHJpATxKWG3dm3hC6Rup0h3VbFxAk2zyIRJ+dWmEWg6kCGWi5UC97tRjSCCjgMgWDdX8fKKggPcfAE7KdBTmwj9R+enCjvx+OYoGjy+TtVConYeZj1GcvRwb0XKWXtu2XQtLGS8nUuZStWdrqqogLIhaTMOVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-57513a91514so2431039e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:55:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779458145; x=1780062945;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3tqZ3OVcBR7J9y1KxfWGi4ZaR+C0ebaX/TOYg/Itik=;
        b=FK//SGDCHzjjyP8dhIZhfecptdVQbveL/mpjB2cAk9ZOxeeVHEPqtnHGS6sT4BSAzV
         n09CQ/UKInJoohetSQpza2CdeoI08Kf7lxckb9MAFY/zf1lpQEIXabftwnLW9GFgJhhN
         wzpARZ0gztHQ6KFYVoNaU3sBYbLrXS96eMljSzuyOJ0CvDwK0M6zyvhnm6fjKroYuSvd
         AVW0TTgd1ign4tbfj8a6A/1PtesTk9w4RGRtjbB+GACgmJfqRvXbsH/ShE5Js1WQPZcr
         BjLinA0SoX2vRUqET9dO4h7Do5IiMCOeRzk51SnG2NRpkK1+R+Q4mB0nCJaw77I8q60A
         VjDA==
X-Forwarded-Encrypted: i=1; AFNElJ/3EZX5F7cvcDSjl3bsLvWb5afBsXRdPCZk3S+JgpnLbqgZ8vzO3jaaXymBJXtkpm243p68SIju/wfKCR4xG5hRCA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/voNrLilP1UIytrZ5mwgp6nLZDtst0kC0Y7xPtp7Z9wpf8BpF
	XOvZPQpL8ISrhP9VWV1nHTs5HvcGy7uKXTWsglWrnopg3znDfZmg4J2BH1qI4xEB+5o=
X-Gm-Gg: Acq92OGN4sqep91tHQYxYT1U1goqJI2Jiy8tBchIjUsSBcuvseQTQ7X3Ly96jNqPoAj
	hUelhRxhY9BYZmEBYFLv1kLgxLgqU+cUTehq3+h8aUJhbVNnrNJ7Tth0LCAOKeQNVCvQXsIg2NI
	vwxdbH3QyA9TYdfhACEsBAqfdY2XN5oYXfGy1pcH/m8SeUA+1Z950ZZlyw2B99bRmDTxY6IwxIa
	ahJporj/04Iqba4a1vWYMYj8vbMLbHEzz0H5Md9+fNBD0L3lO6Bl2z9GOaRiQFy71vXN3uLg8fq
	+ZZ2dI62vvQDNmO/k675QCCKXbSzPQKeLaFAvtKRt3PpA+uk7NmjbHT2YTuzYhDCm4mvpTl6dU2
	7TFfJpnPdv/fu2nyERP4OcuejV0RQ6jHigIlCO60Q9Mp3d4o6z6ghD1IwL/NhzZnzw8LPOJ+x5g
	aDQYeB0j5W9wt9n7etzEfFck6ir7smDH086YMGA3G7KGCKKiFiIPVNCDaT7f5B
X-Received: by 2002:a05:6122:2404:b0:575:e902:bf83 with SMTP id 71dfb90a1353d-586590103ffmr2077691e0c.0.1779458144827;
        Fri, 22 May 2026 06:55:44 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586ec46c8ddsm2343533e0c.0.2026.05.22.06.55.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:55:42 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-95673f7b5baso2064807241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:55:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/V+108/Dy9UuFdAGRp5DoKydEFNfwMK4LL0//sdJHK7wU4+RJKlb/zFg7krYU1baQC4xdLFo286EiIhXAalvlVvw==@vger.kernel.org
X-Received: by 2002:a05:6102:fa2:b0:639:6533:65a0 with SMTP id
 ada2fe7eead31-67c7ffecbb9mr1562113137.18.1779458141395; Fri, 22 May 2026
 06:55:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410163530.383818-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260410163530.383818-11-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260410163530.383818-11-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:55:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV=jDbjoyqh1qraVSRPjTJieTEoY331zHRn3-rRvPW81w@mail.gmail.com>
X-Gm-Features: AVHnY4ISeZdPBYDF9Wtg2Sy3PVMdCCeL0WeBXF2maqndwrmCz-EByfhYArSf_hI
Message-ID: <CAMuHMdV=jDbjoyqh1qraVSRPjTJieTEoY331zHRn3-rRvPW81w@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] arm64: dts: renesas: r9a09g087: add MTU3 support
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,gmail.com,baylibre.com,pengutronix.de,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33017-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.940];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Queue-Id: 508A65B64E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 10 Apr 2026 at 18:37, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/N2H (R9A09G087) SoC has an MTU3 block.
>
> Add support for it.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

