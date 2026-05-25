Return-Path: <linux-renesas-soc+bounces-33066-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JcxG8AiFGq2KAcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33066-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 12:21:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C010D5C9345
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 12:21:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B4BA3018750
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 10:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A92A7352F86;
	Mon, 25 May 2026 10:21:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB6F34E754
	for <linux-renesas-soc@vger.kernel.org>; Mon, 25 May 2026 10:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779704503; cv=none; b=ul3me8zRHmUmnQR7N6YzjyG5TeDUxKOGDhCtafcuL3J3SQmBpGt2KuzVf93B3jgZUhrn0zAX/3tbYSPbRDNVjFxNgAa4MD6LpvugAZSf48KF+ZyyxGR88YrwZIGtZTrSOCuv+USzzq2VKUbi1eQYj1yWm3QDCBRGlcewFPoYFf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779704503; c=relaxed/simple;
	bh=p0HvZ3sT7POUm4/0PI1XUJ7a2BU4q/k/Mg+JR9ylYyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k/ODfJ1vDFbcBOjqDq3jM1OUeTXkXYxMCMlhmxYF9h+J6PoxgFzkoiWOhgM3F3DGAHb4xZb69ech9sMspfp/aiQhlao4j271S2PYUC0ne+t+JglNsXTxx2ZJoIeOlGuVvvJuIQhXKLmJpB7UzMvPRYPYnU1LtfEJ6aOV+L6gZRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-575124e716fso3191655e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 May 2026 03:21:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779704501; x=1780309301;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+N8nwhp2ksCBATTBgDUrbzFAvExrUr7ic1VBwQK9ofc=;
        b=RPDtnvjpvzUqFyO6vXC9mAns9WxWUrvnPGxe7MCAPJBL4Vsze9rjV6eKb6SIs4oQQv
         2I2Mu5dRpvqjZ+4lqjZZL5mrrQjzVmhYOZds9dNk7sWtvrtAMqmxjq5El0kDiBJARTVy
         /U9wN929nT8WJlhfFz6lVUaNpguRjrDImXwIumfg8DvvWJ2aWLl8UXbejqrKI1qtIqUK
         bvKNpZJutApFlp9NTvNlMtwA+Urz0xa3is2XTmshz1/UUDmcXtvb1/LcMAEhruOUt4Bg
         RB93cJw1ED/8vkk39T74h59+j1foa5X2E2APIjZs4+ucvxPp1BuMhtynVi+wZ5e1y83A
         KOJQ==
X-Forwarded-Encrypted: i=1; AFNElJ8zTL4Oyw6idAO0wQQqKY46jGTBelOWPqe2M0usu70+kJIQjSNL0C8Fp31DdpuUNqxTVIk8PIJk3Qk5EA4HS+wH1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFblNKo07BUr6hfNuNhclRA+DZCouq9jvwb+kU7CwS1kzljvV6
	8Ttw/0N0JQ+4L9KcW+MYx3dRwJeGUCrj7s+bDWHlaQR5WeB25W9z5GNielnpShwZ
X-Gm-Gg: Acq92OGn6cLbQCAJ6K111kcQ4CZpqLxaVREBmmWBIOoV2ylY/hWB2YXQksb5CHPEm8G
	3BVB0R4McjZ6f2+WymLHFyKq+gTA3BTT33IYABLr+31KlIiJKYoUwMvGPH2jeGE48TBcP7wbIzj
	bkwF/IAUWovfHxF/nn+ce7WYDWmYPeX7e0jp+hqXBBifAX+bwK25SLTTBQtnuGKPac4Mw/4b+0M
	eKqMUG4SPs5eUvpXWURxX79vQIyWttKpDP0QtG+0X8DsBDRohMw9Rq+PYVjuvqY2drhQUl/CH4x
	xRBXs4chejTnuhFcxWMOPmByAHOlQqi9HMHXnvF35IRqBmDw+9l/dJ/Nx2fBs7nfv3SYXaSeCDj
	wr41x61NvC+yfWIHQ5h4SpcqoBOSZkZtOUVPNmXtzqHOU+hdfXCbBIz87gTpM4g6knurSPTcH6U
	q/Dto4Q7stD4mLhNx3b6WCigoBuaIAGyFIteiEnqv1oKsr/BnHdg8LnrNmXeP17V95XuZuG6p5/
	GE=
X-Received: by 2002:a05:6122:3482:b0:56f:1ea2:8609 with SMTP id 71dfb90a1353d-5865e4a448emr6630263e0c.3.1779704501173;
        Mon, 25 May 2026 03:21:41 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-58d6412d8cbsm3136005e0c.4.2026.05.25.03.21.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 03:21:37 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-575124e716fso3191632e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 May 2026 03:21:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9X0HATZcgiz6LZK+qyJrzOCZt2NJPT9W7atXE421rHSUGZEBYQT4495hBTP3yqRCNUTRBcVdg22H8x7kBg1zDLOg==@vger.kernel.org
X-Received: by 2002:a05:6122:2215:b0:56c:ce8a:b07a with SMTP id
 71dfb90a1353d-58660d810c9mr6371489e0c.7.1779704495972; Mon, 25 May 2026
 03:21:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdWwantdbvPSFoYm=+_OoQQkKwz+K=qwWgy-7tSp1BNJBw@mail.gmail.com>
 <20260522172000.15096-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260522172000.15096-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 25 May 2026 12:21:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXrdPrtE-8ytaBA5oYsFa_1EyVgQTWM_9qFszwEf_u6FQ@mail.gmail.com>
X-Gm-Features: AVHnY4JxX69tsdj1KyIPYumyrvTwDTMHhV4blwWLghLppzdyXfjGAG938kQSX7s
Message-ID: <CAMuHMdXrdPrtE-8ytaBA5oYsFa_1EyVgQTWM_9qFszwEf_u6FQ@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: renesas: r8a779md: Add support for R-Car
 M3Le R8A779MD Geist
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Nguyen Tran <nguyen.tran.pz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.infradead.org,bp.renesas.com,redhat.com,kernel.org,renesas.com,gmail.com,baylibre.com,sang-engineering.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33066-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.951];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C010D5C9345
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 22 May 2026 at 19:20, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> From: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>
>
> Add support for the Geist board based on the Renesas R-Car R8A779MD (M3Le)
> SoC, a register-compatible variant of the R8A77965 (M3-N) with reduced set
> of peripherals.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V3: - Drop pwm2 and pwm2_pins
>     - Follow KSZ9031RNX tSR for reset assert time,
>       FIGURE 7-5 Note 2 for reset post-deassert time
>     - Add RB from Geert

Thanks, will queue in renesas-devel for v7.2...

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779md-geist.dts
> @@ -0,0 +1,720 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the Geist board with R-Car M3Le
> + *
> + * Copyright (C) 2025-2026 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include "r8a779md.dtsi"
> +
> +/ {
> +       model = "Renesas Geist board based on r8a779md";
> +       compatible = "renesas,geist", "renesas,r8a779md", "renesas,r8a77965";
> +
> +       aliases {
> +               serial0 = &scif2;
> +               serial1 = &hscif1;
> +               ethernet0 = &avb;
> +               mmc0 = &sdhi2;
> +               mmc1 = &sdhi0;
> +       };
> +
> +       chosen {
> +               bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
> +               stdout-path = "serial0:115200n8";
> +       };

... with the chosen node moved to its final alphabetical sorting position.

> +
> +       audio_clkout: audio-clkout {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

