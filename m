Return-Path: <linux-renesas-soc+bounces-22406-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D39FBA31F7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Sep 2025 11:24:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F03A1BC80DD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Sep 2025 09:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A21CB266B41;
	Fri, 26 Sep 2025 09:24:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34ECC279355
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Sep 2025 09:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758878671; cv=none; b=SjfZ/2v0ggW7M//fAuR+YMehZpbJNjKbLRrp+EE8H84/ze6T3V/KzwkwIyfSDE55LLe0x5AHBwAU8Yfs2L/xxSDYNONxTMZORmY1NLdLhdMQ5qlwXJ3oHOi5UViDRlRD9GcncLvxdQ6Pzlt8Wrb7NSBzBzGizWBvmUYq130cHyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758878671; c=relaxed/simple;
	bh=wUbRJMho5V5NS/aRRFUvPe88ctT0n1w78dZf3S8MekM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GbT125xD6CG842IP/6aopa+6oLzpT6M9RioZLA837jcevkFJBkFqLsqa2oCd+Tmd5PtEtW29+F1MmfJayRC1aGLl9//TzRscOUYn2KIJfqo/5hhyUNapnjes8fuCsz96LAPR3d/RaFmTKsRHAVp+u3pd6dEhaMcIVP4gTI/UBb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-54a94a48debso727795e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Sep 2025 02:24:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758878667; x=1759483467;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8vXN/4Yr3tP+tgTiuwjLQtfBNx9PrZcekFNLffDoHo=;
        b=q0h0kEdjD1tGSm1VcUy6wuT3yxhERRfCrCQcd4KqxwNULuSlFQU5xzoih1MdPXbiN6
         l1ewfIYKogLWpiGX/XTXQ+y02pVhK9bRQISxT86cHJBJ6NKZ3RzQAHoKbBQC34eFbLxc
         XmZD8iPSzdtJbuONz4gW+D1Ezp3HKWaKyyxprUIF0Y2blJcXWiBsK1Y9HOvIfoDwBvtV
         brELCNyLHOEzAoCjzHskPvqDY9DhGKiHoiwgEY2cks/CUIIJmgdKtXnHAw6Y6XoT0ipZ
         +C40l8HMax0Q1g9Y1766Rn9gfpcrfgoyqplXKDaDdn7xTl+GhyRP9GxNA6qCDJyKtc15
         5jWg==
X-Forwarded-Encrypted: i=1; AJvYcCW0IiNDb2F6m9jk3XTErj2QAFBSNhBXKZOS0OglMkfy7VQR9cueoH4Rstv2JFY9hzGM2iYBPd7AVovPTtsbZyLP1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwRIQ9zcU3VM6zJ1gXYU9ePn9rW5yo3M2mGsQQD3m+CTfJpxiJ
	/NbaR7Zd18bwE6itn4Y0pwzTF6HcXMnH+q6lH+ghGpVah5pCB1ZCiLWiN6WgM99U
X-Gm-Gg: ASbGncvkvxsyTM0PqDNYk47pGxBTIbAGr9vDDcqTTCRofi3T8Rw7UsfUBeZ7R7Jc3Jv
	hSayLZLGEuHpw0acrjZ+isTPAEkDAuGraFwX/rzLlCPQ7yanOY93St25STUG1v1a9zZMvZM4jds
	Gp1lV2U8gU0ACyns2yk809yUoqpg2fPDgG3eWZI92QFTvsU7MS22EpFw1DQsz5BzcGJIZByovuO
	ZcpDlelZ8NDZUZr1NSrrc68O4csPrkJR1gbCVpH2RyKEURvbwTJMPGnjzCkHRGwglhl8znfuCYW
	LotfLISkJkrYjynXN7D0iLRa78kiVF3RbQoTI6gCzkFjb6zVDDyzlKbagU4vz97CIT3k7U5XJwv
	25meL0dRtoFh89tX5vYv1IAoZZdgDJNfX0waCLTAgsxcsqMcXpu7y8HsoQijOI+0a8hvSpS3Btt
	ZWeXb0ug==
X-Google-Smtp-Source: AGHT+IFsIkcmEzV+KdkXJwx3BdvGTnPXnp1PG1ZKfZXpPevaeGNQPWvaFOvD9UYpKq16r3JqNI3vtg==
X-Received: by 2002:a05:6122:7cf:b0:544:8d16:4541 with SMTP id 71dfb90a1353d-54bea102e5fmr2460073e0c.7.1758878666729;
        Fri, 26 Sep 2025 02:24:26 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54bed881ea0sm821839e0c.1.2025.09.26.02.24.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 02:24:26 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-59c662bd660so802949137.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Sep 2025 02:24:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWj4K5MCiX71dXLKpwpylJQz99Xf2+ORJa+8r53OBSbTGCRuXQBmUz2dZzXmBgm/QL5aJfu4b63Fjxnqk30b6LcNw==@vger.kernel.org
X-Received: by 2002:a05:6102:621c:20b0:5b1:15:1986 with SMTP id
 ada2fe7eead31-5b100151fe9mr1352205137.15.1758878666185; Fri, 26 Sep 2025
 02:24:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250919100740.28429-1-wsa+renesas@sang-engineering.com> <20250922192640.GA841738-robh@kernel.org>
In-Reply-To: <20250922192640.GA841738-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Sep 2025 11:24:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVdMCm2eYmkzo9tOXn5MHyqmvKN-Cu=2RO7q7n3EZF3=A@mail.gmail.com>
X-Gm-Features: AS18NWA7DJU_DehkMVc8u2tM81YJnXpnMbPvztHNUybS4R8bb44hSxW0C3oaO7U
Message-ID: <CAMuHMdVdMCm2eYmkzo9tOXn5MHyqmvKN-Cu=2RO7q7n3EZF3=A@mail.gmail.com>
Subject: Re: [RFC PATCH] ARM: dts: renesas: r9a06g032-rzn1d400-eb: describe LEDs
To: Rob Herring <robh@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	Magnus Damm <magnus.damm@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Mon, 22 Sept 2025 at 21:26, Rob Herring <robh@kernel.org> wrote:
> On Fri, Sep 19, 2025 at 12:07:20PM +0200, Wolfram Sang wrote:
> > To be able to use the LEDs, a configuration switch has to be set to a
> > non-default value. So, infrastructure to support these switches (which
> > modify signal routing via the CPLD on the demo board (DB)) is added as
> > well.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> > This patch depends on "[PATCH v3 5/8] ARM: dts: r9a06g032: Add GPIO
> > controllers" which is still in-flight. I send this out as RFC already,
> > so we can discuss the introduction of the switch dependant settings. I
> > copied this approach form RZ/G3S.

> > --- /dev/null
> > +++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db-switches.h
> > @@ -0,0 +1,22 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +/*
> > + * On-board switches for the Renesas RZ/N1D demo board (DB) and extension
> > + * board (EB)
> > + *
> > + * Copyright (C) 2025 Renesas Electronics Corp.
> > + */
> > +
> > +#ifndef __N1D_DB_EB_SWITCHES_H__
> > +#define __N1D_DB_EB_SWITCHES_H__
> > +
> > +#define SW_OFF         0
> > +#define SW_ON          1
> > +
> > +/*
> > + * SW_2-2:
> > + *     SW_OFF - enable PMOD1-3+LEDs on the extension board
> > + *     SW_ON  - enable CAT/S3 (default)
> > + */
> > +#define SW_2_2 SW_ON
> > +
> > +#endif
> > diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
> > index 3258b2e27434..849b5ad9c79d 100644
> > --- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
> > +++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
> > @@ -15,6 +15,7 @@
> >  #include <dt-bindings/pinctrl/rzn1-pinctrl.h>
> >
> >  #include "r9a06g032.dtsi"
> > +#include "r9a06g032-rzn1d400-db-switches.h"
> >
> >  / {
> >       model = "RZN1D-DB Board";
> > @@ -185,6 +186,14 @@ fixed-link {
> >       };
> >  };
> >
> > +#if SW2_2 == SW_OFF
>
> The "rule" for DT headers is #defines for numbers only.
>
> If the switches are s/w readable, then I'd say firmware should read them
> and enable/disable the LEDs as appropriate. If not, then maybe the DT
> should have a property reflecting the switch state and firmware uses
> that to enable/disable.

Both options require updating the (10y-old?) firmware, which is unlikely
to happen.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

