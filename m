Return-Path: <linux-renesas-soc+bounces-20612-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88577B2A101
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 14:01:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3083B189B9FE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 11:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B829E2E2294;
	Mon, 18 Aug 2025 11:57:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6F130EF78
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Aug 2025 11:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755518259; cv=none; b=Y3nflM3HAdNteG5/Dr2UzfFw7SO0EO/EvUiCDJeDZ65briJO+u85a4pIt6+xGUxLNS8tD8ZXdpy5q/IBlp7UC0S6h0CWLh+uYnBSJ4UeieRZr4XLhqhBOYvyWm0Y31+U0XXx/jDPL5gQULJgRVn+tVcVUl3pxXjIrRCGq7zsEPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755518259; c=relaxed/simple;
	bh=PTlHDyzjc7ZoLG2AzlF2BSeHkmCbyujPGGcgGvmZYlA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I3DARZu9pUOw5kRLv7wmwj7qneBFuAhlcK5fVTzFdGbeBMDCtEWVgAlJPMq/viWVuL3wFTRlRLfeU8z4O88s0JvXfGHBebpMO5W5RavntYh5026js0bJWQbszoZuVP5lBmZvAHpZR4BukfKd6uMy0fWvGsBsT2aIYJCw5Vt+u4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-50e2e0ce5f3so3824906137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Aug 2025 04:57:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755518254; x=1756123054;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W6iEP+rMvsEuH7S9z/AWnoX1FJ02vHEks5nyz6Ye9Cg=;
        b=lhV44fozgW4fTLsWDFJYMTKk++xOoNJEQdFs+HL8ufhV/vin8GJa8Bn3rGKYP1NAoC
         gyIdW43guHIPr5MPpHlvXl3U4WMAltach2Hi/N+no2OKhxCYXJZ77U/dRqql0I+nnZiq
         G+M21xSg550w6QXkQlbWFTMWg3A5nu/8HpaJG/cLnz88Fq5OpPEZMYr+dEVfabZ5wHkw
         aXHTH+J3xW6od+Vd8zIMLv3BIz6d1Q5DvOZnMdtC5QGjf3/QmdjgMDIpU/Afz6rD1UgD
         9d1mgZewM3ZK5oM8QmNKeh2Ts5UxVRw+leDHV1fBDAvlHf4Hf5WewNt7qTpGyBSmJ0O6
         aBhg==
X-Gm-Message-State: AOJu0YxS7VcCVdalh5DHinKWpBrCocKS7KPGZKcC91tPCQGKgFvKbsLC
	ep3tHqMLOMQjQ4wi0IyBqz80Fqr1DRORz0KP/UgXiKXLluxwNBImkfuZoehEw4s1
X-Gm-Gg: ASbGnctCClczKQD8H0McK6LUqesGhqbEFZqBfQlE+m02YyzOxRIFLmestBcfnVy+9vH
	WHY5q+yEyBrR3u9XrEExfpFetb39VgUh94lA/mJcEyt4fQwnsUdvDT3LGDfssG5yUO8CjUQa6MF
	V4Lt65MeDTgvMuuGIRuvPa6z7ppptTiyyHUT/5/V7uttRKsRPf2na9BLYNYcHHRBhf1TWvT9ZDR
	hW+x70b68U2pXllY4Vk3l5q5ORNS7BnueQlQN4/jhiArjDMP625MKzTZBFbl16SaNE28ZirmHRN
	qTwqlxxCH1CCs36mqt3BWvJMJBKpV5naQ3zrvsGmBGu6q8RaPB0hOlETDuYgnNiQkbyIezDO4CX
	1Jv3sJzo/cU/K56pbzyTfSIsznn/008DsdsY3X7BVdooHbaZiqr47dSmaih+utrI0BNEuQjY=
X-Google-Smtp-Source: AGHT+IEtgiM0Q2aDxi0dWiUzFf7EyT5tJMrMpXrgj+wDfptA9Zv5kaKPiDS9C31JcqLDQPZilS3tHw==
X-Received: by 2002:a05:6102:26d0:b0:4df:9281:5ec3 with SMTP id ada2fe7eead31-5124ebca02amr4721677137.2.1755518254498;
        Mon, 18 Aug 2025 04:57:34 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5127d4e2a84sm1963356137.5.2025.08.18.04.57.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 04:57:34 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-50e2e0ce5f3so3824901137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Aug 2025 04:57:34 -0700 (PDT)
X-Received: by 2002:a05:6102:5d7:b0:4e9:963a:a42b with SMTP id
 ada2fe7eead31-5104c1ddc16mr4378336137.8.1755518253804; Mon, 18 Aug 2025
 04:57:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <175174252387.83411.17393827352291413834.sendpatchset@1.0.0.127.in-addr.arpa>
 <175174256197.83411.17862990607564379077.sendpatchset@1.0.0.127.in-addr.arpa>
In-Reply-To: <175174256197.83411.17862990607564379077.sendpatchset@1.0.0.127.in-addr.arpa>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Aug 2025 13:57:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVQcCdEF5gz8JbGO2deu1p_xgO-qz+Y+E_naLdRTWuSvw@mail.gmail.com>
X-Gm-Features: Ac12FXycgyi1vXXAq5Otcvmj3PEH1u3sq7z6Lyo0PndtuKfBR5xZIHjYzeaxX4s
Message-ID: <CAMuHMdVQcCdEF5gz8JbGO2deu1p_xgO-qz+Y+E_naLdRTWuSvw@mail.gmail.com>
Subject: Re: [PATCH 5/6] ARM: dts: renesas: gr-mango: initial board support
To: Magnus Damm <damm@opensource.se>
Cc: linux-renesas-soc@vger.kernel.org, wsa+renesas@sang-engineering.com, 
	geert+renesas@glider.be
Content-Type: text/plain; charset="UTF-8"

Hi Magnus,

Thanks for your patch!

On Sat, 5 Jul 2025 at 21:09, Magnus Damm <damm@opensource.se> wrote:
> From: Magnus Damm <damm@opensource.se>
>
> Add initial support for the GR-Mango board which is based on RZ/A2M by Renesas

Is this the same as the GR-Mango2 board, which is the board
I found schematics for?
https://www.renesas.com/en/design-resources/boards-kits/gr-mango

> Electronics. Included in this patch are DTS nodes for serial console as well
> as MII Ethernet.
>
> Signed-off-by: Magnus Damm <damm@opensource.se>

> --- /dev/null
> +++ work/arch/arm/boot/dts/renesas/r7s9210-gr-mango.dts 2025-07-05 21:56:25.214033636 +0900
> @@ -0,0 +1,87 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the GRMANGO board

GR-MANGO...

> + *
> + * Based on RZA2MEVB, Copyright (C) 2018 Renesas Electronics
> + */
> +
> +/dts-v1/;
> +#include "r7s9210.dtsi"
> +#include <dt-bindings/pinctrl/r7s9210-pinctrl.h>
> +
> +/ {
> +       model = "GRMANGO";

GR-MANGO...

> +       compatible = "renesas,grmango", "renesas,r7s9210";

According to the GR-MANGO2 schematics, this is not a Renesas board, but
a Core Corporation board?  So this needs a different vendor prefix, also
to be added to Documentation/devicetree/bindings/vendor-prefixes.yaml.


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

