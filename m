Return-Path: <linux-renesas-soc+bounces-20019-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C39B1C26F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 10:50:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E18A07A3E04
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 08:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C15E221FD4;
	Wed,  6 Aug 2025 08:50:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0631E766E;
	Wed,  6 Aug 2025 08:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754470247; cv=none; b=ZcVoqAASgCA0UwDAH57Kt3ICx2GZh4V4U2c6tm7BBluCYyAIEN7+hQRK09fJ3ql79ZVR2esoO7ksUd0zDrE5jBgfV0HVYXvxXxyIvZvOOEa2BPlxbvLw2qChJcRhPp4I/+qSl0n9cXbNS55vnFbHuFtyzgjUxbGDHx1pcLfK1eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754470247; c=relaxed/simple;
	bh=zTLXxRmwS50E8iCjpUm8xHlzWL2Fvbbcr/d4M3YSzVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aEiAsE1r7P1eUM27lrj6TW1GjDJ2oaXVkeG6vyalGBmxjOnF6JdEZ6jbrav7akvj/woK+eu8zdrk2oyb4CoTPHfVCnEQuOW9pFNR11t7dMrfQfk9/SWH336nuyQuvH5mjYPxI0Wv/amnSmA59NvR/IRIcQ2ouzY+HpkNP3UKiBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5396c1d72dbso2591680e0c.2;
        Wed, 06 Aug 2025 01:50:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754470244; x=1755075044;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=67NaUlX10oTgepae7uOpNwDzs2oEs7i1yEI/7g9wvX0=;
        b=SMA/GfKIWkezAYKD6JY41jSK8c5kHQyr+R4rRd5Q5C/sxm6n9Khpx3upXWjVRNYema
         ZAvSGtzXMmdraFaSS7nvpe1fYZBILIM8QqWF++graCXHKlYC9/CrSjqAoI2wmL3TBRPQ
         SAQWxPEBw8Qpc4iRWqSlbSt1uA4I4R2nCK+HEKp6nc+rcxfkzPldA0IWHrwR/pRh1SSZ
         rcIc5DjQb+lEfrKhYtwoJ6r2DwOcmTxGvC1BgQUC8zG+PJ+A+OTc5v6zd6GwAVrEz0dM
         UdNNv+OLIdUxtrUC1bW4DsqJPnP6qotqrJ1pVS+T+dTME3bes7yLI9ysI/BPUklRYHGY
         0mxw==
X-Forwarded-Encrypted: i=1; AJvYcCWjk9V12d/lcLXaSpAhHJ4YFxzzVDuUhpqVJVkliMiYMlqmkJ4ccVVK09CzbdzrCaA3jPYoY/DzdlCI@vger.kernel.org, AJvYcCWvjs48HQRTH3fLIApFp8bmGz6mJx3EWO0Yi7L/nAUBrckBp0A2Acs6mMznFeM+5yhFx/QGqVBYon+98aeI8qOZneA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrKTCM72QRhfHGP+LGiYuRs4ojbFlT0tpGiDQXKIGs664rtoGW
	Ct9roolOjvWdynLIjN6JfPmc/cv3hVwiylIA+s/vspGZrp1SWFOqy/bdZAIkGVOU
X-Gm-Gg: ASbGncv9Xbz3gowaGXG/bow2YiM0ld6kNn27VJZJDetF5InuFqQkebav4dG84uU+enN
	J4PWx7jQBv/kojf828pvcoPiIvUhv4pquN2P8NKZLHYcF+18aQTSUM5XS9wE9K9ckwqhgiHYgEM
	siNWJk19oaSjJtF8U96Iip/015YvLVrDDVtqSekUKb+TS5UF6ETnIZC03y4InXCHsD8EwlNZ3tR
	i1Pb+e612zkI/+68YcTnRCltsVUjPaFaYet3NkDuhOyjGjzzw06fa7LHHsIniT/0ErdlSNVqLBe
	t4YbNY6B2E3J7E9NnAM/Vj7/jIddtHcPpMVI8UN2SgNkUyubBnPfcyTwhYGC7CNuky7BRh6qPiM
	FDNNAP2AQWPi0erdC+lRKufeMeE8OIOjh6AmpYcG1I6AsRaIWC2LlzgRjQlVO
X-Google-Smtp-Source: AGHT+IGVZwgmbVElBG019brSaBYQLDQRiIPa7hrDldOrN48vHRkWwBJkjtOoEdwjK6S79NWY6Yu88A==
X-Received: by 2002:a05:6122:2219:b0:539:1dd2:22fa with SMTP id 71dfb90a1353d-539a03a4161mr796150e0c.1.1754470243911;
        Wed, 06 Aug 2025 01:50:43 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53936b15df5sm4114235e0c.3.2025.08.06.01.50.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 01:50:43 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-87f04817bf6so4472227241.0;
        Wed, 06 Aug 2025 01:50:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVmnWRTJeZY1tTFO97vo8izgCRzUZSuNRfaoKXs2WymJcfs5WAMwJTlRlen/8JKNtK+BWAeB8OTvJ8gha/bM4an8VQ=@vger.kernel.org, AJvYcCWQdbBwmV/y5v3oc3iDigo4ivkgfnBAo/MA/Dt5xDbADTlVnxxIAeUP3piVBjpsIhnmJ/tKRa1yt3ik@vger.kernel.org
X-Received: by 2002:a05:6102:2910:b0:4e5:9c06:39d8 with SMTP id
 ada2fe7eead31-503722a56bbmr726573137.5.1754470242932; Wed, 06 Aug 2025
 01:50:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250720194756.413341-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250720194756.413341-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Aug 2025 10:50:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX9LzH6zqZTmitwmBpLCqLn+=MK8LxJGdBBp6uABwH67A@mail.gmail.com>
X-Gm-Features: Ac12FXxrT45x6X7YTOqNpVc_gzzfmkQ9G50H_zgTu-Yqdf2-Oq5tksnUmX_Lqj8
Message-ID: <CAMuHMdX9LzH6zqZTmitwmBpLCqLn+=MK8LxJGdBBp6uABwH67A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g3: Describe generic SPI NOR
 support on Retronix R-Car V4H Sparrow Hawk board
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

Thanks for your patch!

On Sun, 20 Jul 2025 at 21:48, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Retronix R-Car V4H Sparrow Hawk EVTA1 is populated with Spansion S25FS512S,
> EVTB1 is populated with Winbond W77Q51NW. Describe the SPI NOR using generic
> "spi-flash" compatible, because both flashes can be auto-detected based on

s/spi-flash/jedec,spi-nor/

> their built-in IDs.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

LGTM (I don't have EVTB1 schematics), so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

