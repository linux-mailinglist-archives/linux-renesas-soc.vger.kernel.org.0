Return-Path: <linux-renesas-soc+bounces-19782-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D96B162F8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jul 2025 16:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9741518C7FC1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jul 2025 14:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23FA32D97B0;
	Wed, 30 Jul 2025 14:40:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D4D2D662D;
	Wed, 30 Jul 2025 14:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753886403; cv=none; b=DfBDNuERIwwSYs/gM1wZZDQXS0Kh3gXW/V51f9bE9ocBmD604z+6edperY/61GY3MAYN0nNxPQIrWjhbIsapr4xwGsq/8PwHB8V41VsowJKpZ2yRc4jgiDVQE12AYFhZe+bhYZnbBmZBTI/45bm8H0C/R+RZRFPYPv0Qoq6BJYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753886403; c=relaxed/simple;
	bh=fsNDK0m2HvXhd+HmVg8X+IiMSdt3lmbUgCmoyNIyCOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B0MD4bzSuaZRnhgjXP7WpQ8i0LfIdQgszRXVWrBXoJ7nE0g5u1Gmnm129YX4tRwgZOzWacvA3p8FmSO1/wwXm0VvCbKXpx0OGXm/MCg9f1PCC1zfQZUNT26nsxvpHtdyCFwWSt+pZNWdzdN/fqbsIrqHS34oeeC+nITz6CTziSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-88d89eaf08dso203748241.1;
        Wed, 30 Jul 2025 07:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753886400; x=1754491200;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l+/EyocnWfozW31T/mNyvD0w3Vb0gJmDVRrDiDkyjlc=;
        b=cIEMjlvcyfKuA3dRR/eKMGdtV31S81UUXc4mfqnwka2ZveLS706yf0VGKAML3yOqUh
         ts/w+Dg7jrbMOeepe5VRSbZyYy1IPLERNDaxpCi88tI6D+njEQ20N9CRAF+Qr53E3ETs
         rsr1aOtxxdb5fapCJOYqoSSINXBqV2G2g497oDGBGO3Zzhe2sf3thkcvPZUrvdOuNQUP
         9ybN2TE6dw6fIDKqSD8irdqo72PrL8jdxHIg65bAy0D1c+lCs2vRh2RAIrVSJRrCbHU1
         sy0UrvvEIljOhhQ5LLC6P9XsoRakp1b/ekZ+jVk+kLxexJtZkRglzyqxwMN3CbSZ+qLY
         yIrA==
X-Forwarded-Encrypted: i=1; AJvYcCVWhq9tLldHFPEBWxqz/kkiP8LqJ7Yk8IW5fDidcb+jvuZzvAQLBdbY8egwR4WkDZw5fU4oUlO/rTcECuyYVcM=@vger.kernel.org
X-Gm-Message-State: AOJu0YypQHD5brLG0eDEYlsehI+bieaBAxOY/TPgXlG+jUFYNAQ+4Tl4
	1l3k05atvc64Nb5FC4Wlu86fcb49X2yToeCunvPVSyHjxPnFC6xxKgYM3MtnNizt
X-Gm-Gg: ASbGncuThYlFue7rwozpoH2K1GkbBgn6b9VLpk97nhkOHkpV2An8Yj4CUwRzMpFwOgB
	5FbfFCA8pCXXKBqi7JgPpoeYCmu64VN3hGQPBeBL62QrXB7PSY8E7UPxoeEXABIJrqah0d50ACf
	ZRUrPlXUgU1no9aR2R8RTjmdpXch1VYFVgnkdTscMnNjSfuPRmi6CTCxri4t+3Gp/+SHwIX6CiT
	EevKGVP0RdsUV5YHeZgR6fbhCRvFN40BbhF+gck8PO8MSY36MTkNxWNQMUzjAsubUDbsSAqkHKp
	UbOll0ZvOpaBlwk3RiiG54POQJbsESnBsCdt6eHDnsBfy03tHRau2XZoo1lU/jUmhNhX1ZixpT0
	q46jaPFvprQPpZEPbeXA76vfEyYMgHzOWmWkHlAb2n988gkgPlf/0F9f+QR2b
X-Google-Smtp-Source: AGHT+IFmsyN4oP7DnANK0MkQ76aO4WZZsRcjAkfqT2KzDstalkDrSpWeA5c1MQg8fRnwcOChvM7nsg==
X-Received: by 2002:a05:6102:6119:20b0:4fb:fc47:e8c2 with SMTP id ada2fe7eead31-4fbfc47ed68mr508048137.9.1753886399872;
        Wed, 30 Jul 2025 07:39:59 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4fa46e0938esm2020906137.12.2025.07.30.07.39.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 07:39:59 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4fc042790f1so82542137.1;
        Wed, 30 Jul 2025 07:39:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4U3TG2TldlGdG1dDX1/YCB3N4gZvIsf87pj70bXCWOQn45UPjGcV1qRQChgf8+yR19D7iN2bnk+YpnGlqyW4=@vger.kernel.org
X-Received: by 2002:a05:6102:1481:b0:4ec:c548:e57b with SMTP id
 ada2fe7eead31-4fbe7ad20fcmr3270846137.0.1753886397780; Wed, 30 Jul 2025
 07:39:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724094146.6443-1-wsa+renesas@sang-engineering.com> <20250724094146.6443-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250724094146.6443-5-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Jul 2025 16:39:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX5BfNm1GJ8UyqftcVc07p1aodXuVHxNaYWDYLHaxzXMw@mail.gmail.com>
X-Gm-Features: Ac12FXwSHxwgh1iE-RiAFlbvbPUyCFA8Vv2qiKkbn-bMclgIM8YsBFxjbxa_ny4
Message-ID: <CAMuHMdX5BfNm1GJ8UyqftcVc07p1aodXuVHxNaYWDYLHaxzXMw@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] i3c: master: Add basic driver for the Renesas I3C controller
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Frank Li <Frank.Li@nxp.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Thu, 24 Jul 2025 at 11:41, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Add a basic driver for the I3C controller found in Renesas RZ/G3S and
> G3E SoCs. Support I3C pure busses (tested with two targets) and mixed
> busses (two I3C devices plus various I2C targets). DAA and communication
> with temperature sensors worked reliably at various speeds.
>
> Missing features such as IBI, HotJoin, and target mode will be added
> incrementally.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Thanks for your patch!

Just a few stylistic comments for now...

> --- /dev/null
> +++ b/drivers/i3c/master/renesas-i3c.c

> +#define REFCKCTL               0x70
> +#define  REFCKCTL_IREFCKS(x)   FIELD_PREP(GENMASK(2, 0), x)

Interesting... Usually the FIELD_*() macros are used like this:

    #define REFCKCTL_IREFCKS    GENMASK(2, 0)

    x = readl(base + REFCKCTL);
    a = FIELD_GET(REFCKCTL_IREFCKS, x);

    y = FIELD_PREP(REFCKCTL_IREFCKS, b);
    writel(y, base + REFCKCTL);

That way you do not have to duplicate "GENMASK(2, 0)" in the read and
write marshalling macros.  But I do agree this driver does not seem
to have register fields that are both read and written ;-)

> +static inline u32 renesas_readl(void __iomem *base, u32 reg)
> +{
> +       return readl(base + reg);
> +}
> +
> +static inline void renesas_writel(void __iomem *base, u32 reg, u32 val)
> +{
> +       writel(val, base + reg);
> +}

Why not use readl() and writel() directly?
To make it easier to add debug prints during initial development?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

