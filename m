Return-Path: <linux-renesas-soc+bounces-12889-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8246BA2A38C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 09:50:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83002188386A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 08:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2A4F225762;
	Thu,  6 Feb 2025 08:50:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37421214231;
	Thu,  6 Feb 2025 08:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738831840; cv=none; b=kCf/r5qmxQbPFsdRv3Qo6GHQKIGTT373SIhzGeXqWT9SZbkbNaFVVq58msnoI8RTRHFEBbcoHgqGh1OFJfLR+NjKoWFwvfIrHuI6XiGqS6abAWkQ7arw26uBbU3irl0SLZyb5cVSuLPnKYW7hjm2aX/FdAvQrPOYHrb3NykMQ+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738831840; c=relaxed/simple;
	bh=uSMRkH5QgBfeEo1EH8d4AedTrFZiPuqo+VTkWCNquGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vc6vaNvV/081kadcufiy2iP+e5oMsUrKB8vcMkPJUnWn1GKoBJLoIB0xRcg9GAn4SraXbO7sM0qDSI+1HWEpt8+EyVykzFx+VGMOIv9yvIBsFNcVMJRBlHTPiCbEZ8YunT7FlCpPegtDOWz67zfHd7lJ3gSAy11qJFkkT+FAA4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-51f27fed6ebso38107e0c.2;
        Thu, 06 Feb 2025 00:50:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738831837; x=1739436637;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k+m8N5ISN/bAHKlWimr+U9vI8G5AhdyDs4G0KNenkNw=;
        b=OzDgAlo0BG9lc1G//zOTtZ1IT+KhiMYzdzowr3QBrxIAp+xOqjzmZxOyKnYofm2xUe
         J1peOU7JuQUfnAdCHk7vBGuBGnVJz8iShWndT8UF3W4R0egWu2lPfg7wfgpn0v55Vozq
         jVhFF5iqOxarB55b/PD9KSQ8xVLBXRBaOA5XekzjEZvHDvuXx9fJUCSXt7jfS1fx9SWV
         rHwODuG+j1DTphifXFs84m8eHAdJF1actt+JSmPHyObGivWRrDMOQz7hKfSvjX6VIdmw
         01lO61OB8xhcT1U4KjKXuarjU/eIeRvD0jnqAvfeFBPz/bC7gSSjntdp072Xhxth7dFZ
         xOGA==
X-Forwarded-Encrypted: i=1; AJvYcCVEPjKwRuuBl6e6IPfkfIyzwDEOyAHwO0pxMyMlCtTbJFHYVTSpYRnJTzJnCtPkSsYSgPdgV9xE5e7PnI9ABW1ltVE=@vger.kernel.org, AJvYcCWtkb58CqH8bo9MH30yhzByzJ0uZslCsuleYTlqeT5dyKSVJW0HNCgwJAmyHrPoC5unnAFwJiMobrJG@vger.kernel.org, AJvYcCXbNs4y8HlHX77/12g/f5BnhPkGcDGewtccZz8vyLf6VLWEG6k+OFiJ5zrI8vMsvsGyBSe0M8QQdyob@vger.kernel.org
X-Gm-Message-State: AOJu0YwYduw8oG1/KVwDv0DCLnRRo6wTERtH/Knpbb6r+zG6yE0opL40
	9wO68KLRCorcrhELBn3456w/xpw8fOpuP+Jye5ZsMNiR3qCgyqx1/wdmfqqT
X-Gm-Gg: ASbGnctAqiUUMXWFqjc7Rg5HTvmiF7kmRcDEeKhYdhAD5xkDlLHmi8z9sIsaT2ivBBl
	7QtftHesX3++D/C2i3YoGMjtmhJh331VxPMupul+DUKHRKqrsiYzRKThCXQYxFKmNsjadj90OoP
	wFdjiRGamuOZto73h7wmPvjpl9JYhJx1vF9eZSKEe1TgeVcSFeeLGZcAmTQSLhAhOZQHuCLYarb
	QSikFCIbDpYmHJnLrVLIToCqH53hhScvEvRVPWxnG+gT5zNmv7/QXuOtCl1vXbBkz1ednqaTjSG
	Zb1C9eKxhPD9J4/+MttfGf8Hxr6EQzAqzf3Yu7BuBazrbyWkqb8x/w==
X-Google-Smtp-Source: AGHT+IEafZ6YtcQLAUFWKIVRhpnEIim5RqK8X+v6V+Jzg9uT0ZluXEj6r/bWsavbadF2zlw/PRZ3qQ==
X-Received: by 2002:a05:6122:da7:b0:515:daa7:ed07 with SMTP id 71dfb90a1353d-51f0c0c2b93mr3405954e0c.0.1738831837189;
        Thu, 06 Feb 2025 00:50:37 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51f228db814sm110253e0c.29.2025.02.06.00.50.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 00:50:36 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-866f01c2f2aso179824241.0;
        Thu, 06 Feb 2025 00:50:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVuAlfOmJvH7bq59Vfo2kBVRgoNUq3FNqD/lxczivEfr9uZHnFj5DTUv5IyhpnNfJH+LKi9Wcv6SllWu/5CfCv0aS0=@vger.kernel.org, AJvYcCVy4JYJElQxXeEVwj++RHyqKJCsvHksFM4bkZOnSxwWZ3SkpUQ6LS2TJTN1n1wKqN99Pd5K2KE+Zdtk@vger.kernel.org, AJvYcCW4ulxx1ysFSMDhJ8fX07GgKy+qjFCv4yB5GFuB7gRoc7l2D86MievE6MLhl0VaC+vQco43Yxk8Ohpu@vger.kernel.org
X-Received: by 2002:a05:6102:1492:b0:4b2:5c4b:5186 with SMTP id
 ada2fe7eead31-4ba47abc62fmr4087479137.23.1738831836554; Thu, 06 Feb 2025
 00:50:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131112429.119882-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250131112429.119882-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Feb 2025 09:50:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXsJVLYP2pchKoTkDH5+Sd5nsHUBOjbV8B7YM0b1y97jg@mail.gmail.com>
X-Gm-Features: AWEUYZlbK1VuIyuJey21a-mgoN_ZrmnGqJ1wEwqSqe3ZLnP5o92mfYULu9wsHys
Message-ID: <CAMuHMdXsJVLYP2pchKoTkDH5+Sd5nsHUBOjbV8B7YM0b1y97jg@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] Add RZ/G3E SDHI support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 31 Jan 2025 at 12:24, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The SD/MMC block on the RZ/G3E ("R9A09G047") SoC is similar to that
> of the RZ/V2H, but the SD0 channel has only dedicated pins, so we must
> use SD_STATUS register to control voltage and power enable (internal
> regulator).
>
> For SD1 and SD2 channel we can either use gpio regulator or internal
> regulator (using SD_STATUS register) for voltage switching.
>
> For SD0, fixed voltage(eMMC) uses fixed regulator and non-fixed voltage
> (SD) uses internal regulator.

Thanks for your series!

> Biju Das (8):
>   dt-bindings: mmc: renesas,sdhi: Document RZ/G3E support
>   mmc: renesas_sdhi: Arrange local variables in reverse xmas tree order
>   mmc: renesas_sdhi: Add support for RZ/G3E SoC
>   arm64: dts: renesas: r9a09g047: Add SDHI0-SDHI2 nodes
>   arm64: dts: renesas: r9a09g057: Add support for enabling SDHI internal
>     regulator
>   arm64: dts: renesas: rzg3e-smarc-som: Enable SDHI{0,2}
>   arm64: dts: renesas: rzg3e-smarc-som: Add support for enable SD on
>     SDHI0
>   arm64: dts: renesas: r9a09g047e57-smarc: Enable SDHI1

Note that this was not sent as a single series: patches 2 and 5 were
sent as a separate series.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

