Return-Path: <linux-renesas-soc+bounces-30916-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFC9Afj01GkjywcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30916-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 14:13:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 598FE3AE2E0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 14:13:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B650307ABBE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Apr 2026 12:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE963A5E85;
	Tue,  7 Apr 2026 12:06:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A293A8FE9
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Apr 2026 12:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775563590; cv=none; b=iNvlzHf8pZSYhr7pjbPlPfc/+1uBXy1fRsQ1CPUp2wJRsjIpAgXhzsLVhFLJkuI0glezs1psmSnMhJaN14wxFX+vY37eHK6Cvlsni4EIQBxo4CCYoKRDQFc6jdlTgknXdXRb0f/k2e18nCORntoXQRskjOnE2ZOHfM00tP1shho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775563590; c=relaxed/simple;
	bh=RLEQaCwlrPnS44zbzdgyul2aW2ANkVmjK7JC5gW/u4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P9IhC08VN5ldoRBmCUZ9TF/LCn5JC9LLSoLh5cJ5pIzxCxuDj2dB5iQHdkK69HHUbRAhqKZcASTR3fQjd24gQR0i8pUJDhFM2KH/wiod62pmigtdKQxGGjs2KZ/f+tLW53TcehWvqPce15zrSxgzG278lifRKbg6C8rILcoZV64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56a9a7e762bso3787983e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Apr 2026 05:06:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775563588; x=1776168388;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4MGYxkmthcoZTlDIjYHdP2FYlzdY22eALuxJJY+zxh4=;
        b=f7iaaZDiZ05uGmE6nltcurfTPEr31n/kq+y8E/3YWnXiUZ9i7Q+KdoS1amXxG8EnrR
         BHLsh7t5StzCQ0n69O6Qlm2QvMn4XBy45LkgD77jzlyQrxRBXHyIkT4zwzrkhABtV+pp
         MzSqWBO6bCqg+LNBhlklLthNydcQlWuCkebuFLOvVzbvAnf/8+bliIfGcI25Mai+MURW
         iUCpg0i0WPXNuPeZJVmWboN2ehgQZOMLWLLpHgM+nYgPtaDplLnJAFdHdMKFVCWRvm5P
         bNEPSxnDrhY4/LUHQoW1ZE9MwIzzEE/Ntp0yN4TDf1cI5yrPAEXxp5e78slLY3CHIPxn
         hqLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFBTn6SAYi8fr6byb+1R9z+jWLIdN9GHLvyMP+/gBOGFJfwVDZ0i0PUM20xx5M5Yae1Ac0NVT2Cet5kfa91cScOA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1zrA/wF5V34JkyCHQU59mlHc235fSKNVAsUgCciSfWzh9OriF
	uIX22axZaTblCHiFovtXgqCQWM/2oPlKJeXw7gJPeKsyFwPJTPrVaxQEPMbX4wmp
X-Gm-Gg: AeBDiesHwPWj+64gZCFiDgaP2q0KBTfHqYHP3jA0WWUR+AxAPyTTdSfKmHu18swUgOm
	6dzh7hW5OsvpeQql+HPeN4qW2VWEs3HAAyCd3asLorMoFlle4sTPCdN9IUBhuhCnc3H1agGJFfM
	kDyRq6SL2vw3UR/4ZK8zZdROIkyd7jlmg87V+IurATVE8mM0DOkeuwUj8FNgEts5CiMqnSnr8XK
	mxvxvmr33h2oDMakEie67w4yk/xVUv0+kNYqTa+rw7X++WRf0HDLJZxgmNMMupf5unv300IjmVC
	IjPiqhbizuxD4a4M+Lz1Hxyc1+X8ZRqdk/2RZqfp7PSidQeek3QpsGOQ2qeyl4ZjA67aTd6LHTs
	1TW9GfQms4VRhaTv09lp1v2HDsy0pzDhgzthlMcQiVUYCWdmVOnGRAZ1wsmWMY6pGrEI4OuFtVX
	sVhzQKr4plEPao4I3SiUUINwIkXsesA0iXdc8KrGWu4595xdi8BJwspVdYFrrvAfg6
X-Received: by 2002:a05:6122:3b84:b0:56e:eb08:21ca with SMTP id 71dfb90a1353d-56eeb082629mr3558602e0c.7.1775563587768;
        Tue, 07 Apr 2026 05:06:27 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bc9bb4csm18669170e0c.10.2026.04.07.05.06.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 05:06:27 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56a8e0ea02aso5397913e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Apr 2026 05:06:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUM+NnIY9bmjw+PfFBv10HeU+NyHhvJuNpRK5vor5b6pKizrUyWc6GyzlcraeIjjIzaiGhr29bi+/yBfXb48zlZ+A==@vger.kernel.org
X-Received: by 2002:a05:6122:4891:b0:56d:aa1f:e48a with SMTP id
 71dfb90a1353d-56dab9dd9c9mr6282392e0c.12.1775563586213; Tue, 07 Apr 2026
 05:06:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260328000031.94645-1-marek.vasut+renesas@mailbox.org> <20260328000031.94645-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260328000031.94645-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Apr 2026 14:06:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVOHaQU0qAYYQV3u7bAm3jzKmQM=btnpFaToxGxPrVGXA@mail.gmail.com>
X-Gm-Features: AQROBzBNV8VVoIPRYTToqrCO0lTdjZgYrqxs7rGtDCmLPkMo9NmWHxs4WMpk4YA
Message-ID: <CAMuHMdVOHaQU0qAYYQV3u7bAm3jzKmQM=btnpFaToxGxPrVGXA@mail.gmail.com>
Subject: Re: [RFC][PATCH 3/4] ARM: dts: renesas: r8a7740: Add ZT/ZTR trace
 clock on R-Mobile A1
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,baylibre.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-30916-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.310];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 598FE3AE2E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Marek,

On Sat, 28 Mar 2026 at 01:00, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add ZT trace bus and ZTR trace clock on the R-Mobile A1.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/arch/arm/boot/dts/renesas/r8a7740.dtsi
> +++ b/arch/arm/boot/dts/renesas/r8a7740.dtsi
> @@ -551,9 +551,9 @@ cpg_clocks: cpg_clocks@e6150000 {
>                         clock-output-names = "system", "pllc0", "pllc1",
>                                              "pllc2", "r",
>                                              "usb24s",
> -                                            "i", "zg", "b", "m1", "hp",
> -                                            "hpp", "usbp", "s", "zb", "m3",
> -                                            "cp";
> +                                            "i", "zg", "b", "m1", "ztr", "zt",
> +                                            "hp", "hpp", "usbp", "s", "zb",
> +                                            "m3", "cp";

The order of the names must match the indices in the DT bindings below.
Else consumers end up with a wrong parent clock, leading to issues
like the I2C controller driver failing to probe because its parent
clock is out of range.

>                 };
>
>                 /* Variable factor clocks (DIV6) */
> diff --git a/include/dt-bindings/clock/r8a7740-clock.h b/include/dt-bindings/clock/r8a7740-clock.h
> index 1b3fdb39cc426..8a8816b2ff6ac 100644
> --- a/include/dt-bindings/clock/r8a7740-clock.h
> +++ b/include/dt-bindings/clock/r8a7740-clock.h
> @@ -24,6 +24,8 @@
>  #define R8A7740_CLK_ZB         14
>  #define R8A7740_CLK_M3         15
>  #define R8A7740_CLK_CP         16
> +#define R8A7740_CLK_ZTR                17
> +#define R8A7740_CLK_ZT         18

Append at the end, good.

>
>  /* MSTP1 */
>  #define R8A7740_CLK_CEU21      28

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

