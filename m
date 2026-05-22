Return-Path: <linux-renesas-soc+bounces-33002-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDGyCaJgEGpAWwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33002-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:56:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8F45B5A64
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:56:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 854F6310074B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 13:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCA533B894B;
	Fri, 22 May 2026 13:24:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50485221277
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 13:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456266; cv=none; b=FLk7tQnsjMMCGHeZRijy5216hI/+bwvlX79/U8a+shEA0GraQ76EMSfL+CMoqFY4UGHtzehTfMyMsQ70BqCDQ9798L2GfF3HgBQhlUtAFW2wqfVX88TQszVpVbqx56M4xL0MxvDTzIXjX/SLMWT8cESGAY2ayXtGceM0YU9Eyy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456266; c=relaxed/simple;
	bh=5jJ4w8wnIzSsklB+C2cv7wJkPFCPFGJMxCqrgKm3mQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=opdw6Gz6reHDHmUfxfXxbCq1kL28pIUwv/RFYaW7/6IpcuJ7FYVDGaawZYtNr5MO9tbK5mJpnMJZvdGFSQ1EPsBusYVYxPUVHIiCMfP6vc6VZzk3lGnITmp/6Rq6LwF626RifQmUfLlmS+ExWlAaZcN24/+yLR+XChv72kz1/EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bd4f7f05e90so1324795466b.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:24:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456264; x=1780061064;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7GDvKPT9BVyh92cXGfrSByV+to8ygxr9SCCX7AQDOOY=;
        b=P56zX9ZXZul7Bof2An7dYkCWS7WUPfG6SV2on5XKMhIa9BACmR3YkQIEGCCdiIqcPK
         28va1rRu1kxmQfMYM0ctP56zZYHwDYUkWGLPnKObHxoNqpj4igo+IZCllfZMxWOBH/8D
         uhEPFRLYuVozxnKRxckok7rcPOzr36ZgD+bfg3+O4WWnUEczT/nAfU/WntquDrTRQa3V
         5RCrGTEQ/kkPI2E9lm+qMMhzpl6ZFyjZfOM/rlTLoLYZMRHshW158rmd2h66Y6NbGS0W
         ngIMbzf4XZZqC7CH8QV0IIEq6LS9QYle3bjDcY+34sRMg9xRhaArzaFZraYNECyNYePK
         kn8Q==
X-Forwarded-Encrypted: i=1; AFNElJ8IBGaxlgb5JV2ogSjYzPoJSLL6SYBpAkqJJrq7xmDMQs+CuBuMcgw4zTZWTepAFuAUDsxGjaGZlBrs1w5CGErzLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaomsuWqe1nS7SlJz2HxCItRhUqQ+VOdiItvbwFl0ZEuXO5WPB
	jYhp0lSoaU7rmNh2mYcM/mTibb9c6WBbx+Zxc+Awi/2hRIk0soTbICBHUoELrp067ao=
X-Gm-Gg: Acq92OHzmLOs74wYJVhMlEI+hDsnFsMVFlST082Ia2JJ+eN4VjpEOHhJ53SUeUlwAYi
	JLXF3XtbGs+xwcS0VMPBqZo8txKqqCn//4VeHI+Sb/rdUSNUwMUL8PfkokS/VuoaD5zWbYdYOGp
	fxJcfiLlheunKqTmD6JJRyqqnVjVoLDIm8q/Finkg/+R4kz8WPjexXJBEJqpdD7qSb+1OYOEmMH
	6A8O2BfksOKchLOzTsH3x0DxKaXAE89sOtD7T+d5+v2LyNK+iEE9h4itGSTKuhcyyu0Zg6m9Nwr
	pcMoyrb65yXGs+idxMKAM/7wc41y5CCZCkuFqvxDQktsZEwn8TpWVZXPRwVJY2671HbrA/4ZzA7
	FNYqXaFfYNQqXHU4E6x8hH8eMhECF566/pF0VzRf9Egh0L4weqlND1xYOIF0YTc1gJfjHYcGbMK
	8PPHB2VbczSzTYkZWC8KYvuD0wsbjK1mPNKjV0IAw8JDnEe3FcdMhb29XBzYYjZ0FSWmvS3yc+R
	v7sXV5/Iw==
X-Received: by 2002:a17:907:c48d:b0:bd4:f598:cc3d with SMTP id a640c23a62f3a-bdd274c91admr223927266b.41.1779456263470;
        Fri, 22 May 2026 06:24:23 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc65db561sm52891166b.51.2026.05.22.06.24.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:24:22 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-687e7edaafeso229131a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:24:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+oPN09uvKj4uMChv7F5fuP3u1Cnr/2kZKZwJjGu18f5Ik0JA07VZ2T6Xaby6ZebpN27eFeygUu9+vZ4AfDHJLqVg==@vger.kernel.org
X-Received: by 2002:a05:6402:40d4:b0:67b:7d11:758e with SMTP id
 4fb4d7f45d1cf-6889c44d02bmr1805319a12.11.1779456261967; Fri, 22 May 2026
 06:24:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org> <20260505034325.167797-11-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-11-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:24:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWsopE_aeQb25wa-UGbAegObAmuAsjR3KhyE6tqkJX2rQ@mail.gmail.com>
X-Gm-Features: AVHnY4KDNA7entSIpywZdqDZOTEKyZkKaLYsaeA_apHbUNOL0nn5iX7Rgbyd_YU
Message-ID: <CAMuHMdWsopE_aeQb25wa-UGbAegObAmuAsjR3KhyE6tqkJX2rQ@mail.gmail.com>
Subject: Re: [PATCH 10/11] arm64: dts: renesas: white-hawk: Specify ethernet
 PHY reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33002-lists,linux-renesas-soc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 2F8F45B5A64
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 5 May 2026 at 05:44, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ9031RNX reference manual [1] DS00002096H page 60 FIGURE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING Note 2 states, that after the
> de-assertion of reset, wait a minimum of 100 us before starting
> programming on the MIIM (MDC/MDIO) interface. Set DT property
> reset-deassert-us to three times that, 300 us, to provide ample
> time between reset deassertion and MDIO access.
>
> The KSZ9031RNX reference manual [1] DS00002096H page 60 TABLE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING PARAMETERS row tSR Stable supply
> voltages to de-assertion of reset is at minimum 10 ms. Set DT
> property reset-assert-us to 10ms because the KSZ9031RNX RM does
> not explicitly spell out how long the reset has to be asserted,
> but this at least covers the worst case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031MNX-Data-Sheet-DS00002096.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

No regression on my White Hawk, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Modulo the document references:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

