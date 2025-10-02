Return-Path: <linux-renesas-soc+bounces-22573-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD095BB3C52
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Oct 2025 13:34:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26A3B3A91EA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Oct 2025 11:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DBA0310620;
	Thu,  2 Oct 2025 11:34:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D2430E842
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Oct 2025 11:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759404854; cv=none; b=iktV8aD+2ZsBKrJ2i8L2697wh+99PyyH6PFZUlxuhqz1qBqZz5m0oCRksaTMWdrS+FHyMzSbx8Tc2PYR4xGWFzOLDt+yGq0uzabKkVsoqyk5OCRKbq59K2g/PVRSnBGe0VexcoyLmJ+ya8D37zA1UQorhXJjf2s2qtVoMbrLJ1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759404854; c=relaxed/simple;
	bh=x+1FQUwO3io7ehHnRHpcpm9bLXK7u5rU0yzGlRJI1FU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LP/f0hlDNSX3KoOn6wNKm3g+2WjNfCkaQv9UKyjhqxz7DTeGrMHm3tv/x5oz6EcZqg3kwQ3kvbgNqxi8ENSteYtgVtR8lVhmAkyVsDPXnyGNCpaAzvii5NiwcEjrzSNAaX3zTrAzcamj47adSYy7ubiHkCcZVp9sL7pamx1ZEHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-54bc6356624so1549451e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Oct 2025 04:34:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759404849; x=1760009649;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HTujdmb/4FHbWCjwo6XZ8ozA5SwqEm2+sB5nwCZ442Y=;
        b=waY2Q0p93FZU3DJRR9ntAKu9C5V6MiCn1Y1sgVh8iVABappvyEeLW4+Vj4YAC8tr0d
         gx7rwCZYCykGc0WuKuLoKfD1yt0LuowD5vwGbDEzGmRq7JwjgIySOYLK5Vwex3zHWs9f
         PLSLZqO289WBTl5oRajDh4lvCILv8nugqrIZUDg1P/74CZSHwAMjNQUza6VY/Gr7SFF+
         WQYPRrzN3y8E3oNvID/5/cHasbfe/HBessk3CwgcXCLdFOfFTgrpjECcI+UhMG1lnKlt
         apnngTs9Y/ZcZC9sS5aWK5LkTEc08uLN1crNBkLZ/OZ8PqM9EkbjkE29PU/Q1joyYWJJ
         au7Q==
X-Gm-Message-State: AOJu0Ywhq4s814G/cNiTGXABifq/Te8ZGvSvt3x5GdieZbzkfyrBlh6j
	zVB/Ofk/nNwJ8NrtMwUWyWdjZddVG13ssTjEWEhMr8AQ/5ykW4HbHDfQShovxDfB
X-Gm-Gg: ASbGncsLSAFDkwlPR3w/uN4QCB6ahhywI4B2A3Nd1op1QrsMy3X4ikrl2zEStpqn3Wb
	jbFL4XwnS/7DPSFFRDQhVkYG0XYlKLvwkYBT+yxKnyZarCm7y2GgiPc9kMf9JnnVNHVRJ/U7A+d
	oJ4ivyZXlRT+0URSudVmBGxFTXNlPiAosrIUzY4cM5fTYe3uU5Kca5YtsqJfrFHO1dEId6KLG7k
	EtAd5ZuBgTmskcWhWZCcMF3XHa0xBf48cE7sJzzwNgMp5HqwPIPlgp09GcDEUf0DosuNo7gTXqv
	fj2JnInflF1ULeKzqBy8s7lfhK6bjRUXIbwCgAuAqgVUpLjnwvGXGTQhCT/y8MfHIgngUl6Pim3
	+2nprIokDorvI5/ga5CFpPn9XWMkdLT/Hm108hYl/Y/xtz5H8YrhPLu2KpPdjgI7MuT/86uo4C6
	N2fwTzCwhoPomYKAq5wuk=
X-Google-Smtp-Source: AGHT+IFDbV9zoNTI5AEg0Q5c8flx3/nM5sAJgRrRVCVAx5sXb2/LDs7U44hUolDHMUqSAyd8SR4gdA==
X-Received: by 2002:a05:6122:1d93:b0:54a:a3b1:db63 with SMTP id 71dfb90a1353d-5523c1022b2mr1304844e0c.6.1759404849343;
        Thu, 02 Oct 2025 04:34:09 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523ce0f84dsm448627e0c.3.2025.10.02.04.34.09
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 04:34:09 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5565a83f796so749268137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Oct 2025 04:34:09 -0700 (PDT)
X-Received: by 2002:a05:6102:31a8:b0:596:9fd8:9268 with SMTP id
 ada2fe7eead31-5d40bff8b65mr900877137.8.1759404848912; Thu, 02 Oct 2025
 04:34:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929083449.14393-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250929083449.14393-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Oct 2025 13:33:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWO4tcgucOEb2=e=uTSua4+CouHe=NY1169zsVT_v1t4Q@mail.gmail.com>
X-Gm-Features: AS18NWAm_QECv465lM4_4Mk9GND9CcslBOXbeEU7EQikSdzrt8xRpNNMiKN5L1c
Message-ID: <CAMuHMdWO4tcgucOEb2=e=uTSua4+CouHe=NY1169zsVT_v1t4Q@mail.gmail.com>
Subject: Re: [RFC PATCH] dt-bindings: mfd: Add Renesas R2A11302FT PMIC
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Thu, 2 Oct 2025 at 11:30, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Basic binding description for the above PMIC already referenced in
> upstream DTs for the Renesas Lager and Koelsch boards.
>
> Do you think we could / should upstream it? Passes dt_binding_check and
> dtbs_check.
>
> Fixes:
> arch/arm/boot/dts/renesas/r8a7790-lager.dtb: /soc/spi@e6e10000/pmic@0: failed to match any schema with compatible: ['renesas,r2a11302ft']
> arch/arm/boot/dts/renesas/r8a7791-koelsch.dtb: /soc/spi@e6e20000/pmic@0: failed to match any schema with compatible: ['renesas,r2a11302ft']
>
> Notes:
>
> Would have loved to add this to 'trivial-devices' but 'spi-cpol' and
> 'spi-cpha' are not allowed there.
>
> There is no driver and there will likely never be one.
>
> I don't have and couldn't find any datasheet.
>
> Maybe Geert wants to be listed as maintainer? He is the only one who

Morimoto-san wrote the driver that is part of the R-Car H1 BSP.

> ever playes with this device. All is fine with me...

Am I? ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

