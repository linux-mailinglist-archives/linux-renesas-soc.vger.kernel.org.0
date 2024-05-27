Return-Path: <linux-renesas-soc+bounces-5483-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7084F8CFCA0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 11:18:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 102B51F22A75
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 09:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92846138493;
	Mon, 27 May 2024 09:18:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F8B8BF0;
	Mon, 27 May 2024 09:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716801497; cv=none; b=Fnk4+rHD39MBEGzJ3VyWnZtfEbkGqtsaB/lnpT+2uFe3Ii3f21IEgnfgZltUkC3vfmal5EmFiaqYjtOu8RT3DnGBq8nLEhsoHWVTyWeMolje2UFODEVaibI46oe+4kqbwuecoqEYFj7wAxvrhLqLIrdT2BchrBo3NmpzQBjS0v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716801497; c=relaxed/simple;
	bh=06ov8LDF6C94yAWPdz3byY1cC7MZjQLNnXADs1Y3168=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jCY14G/zfR6Eh+d05QmMMJ8x4jaowWgJ4XwSu9Do3bP2EYGMHu7+fOBPHAUlTo6fv8A0k9q9CvGybaLMwJ8mM2KmwL23Bw3ePsQ1qRWRNkZVDSmNVy8SSsObZWjto1kG5AKqjBxxMcKeB/GjRVoS8fSGXumyBO4ahCP6lCSB6SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-62a0809c805so31949007b3.0;
        Mon, 27 May 2024 02:18:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716801494; x=1717406294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T1bOMQpnCot1Q27PtbLkLD5PwnyVT+SP5xzT/2JZo+w=;
        b=mawjDWl1xV1jPbO4ia8tEPVTF+Har/s6m5YjRrR4HrB9bP3mUKI8cdca+7m+Wgog13
         9IrvUSLvNxqTcd9PuUiufV9t+4JOQS6woGyPhyVG0uVjft1CJ+AcW/R64IhXEM3+r/OI
         vN7xhHuEwnS3X8CYl1Nv7S87T6M96eEY2q1/fNlnAFJdTfYiLWL9p2+c3C2JTz+XjZlO
         Pxw3LsdWGrVkfElo3CGSUhO49lE6+JAKNLSa7uU2jAMjoOwY+mUcBHOHPST82RmJ31Th
         NfBtM5yZwidfLDJJkNrOuwsyxlsDj/KAozi2AXaaHmW5B8Hy3s2TzsM1m6jWi42ltScB
         rdvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXql4lpZ8/HnTn4OMGeOcel9oPzFyKLStu38DP97PCtMSLmaExd/XIFr32oN/cMgrcsFs86fP7YQAemPWtSR2mKVwNwQ40zFz2fnPTW3eyKRd6poj9sRwuSfPf16f3HNCwUMViFrkFZTCjk1TIObZSCYTveOPGx3ejrV7NXT8rOPiieb0IK0wtex1535ePW+2L63tgKxl1XMmeJinGVJ1+YoOkszxg
X-Gm-Message-State: AOJu0YwzQ1RmBxEQlDdV4c3tgNx9X2/hTEGPa2nvGS5fFzx5wasSsZrs
	TW/AMFJ5GeSssiCWtwDFp+S9t38sg7fsdeU3x3aHcdD+WTcODtiT7nSspoWy
X-Google-Smtp-Source: AGHT+IE9Lj3+8RNO8Lg1zFGWdi6XIwXNIUZWezZlbPLmFzYS+nnUL9IP9IDsYFEeXfITyQhpF4Cpqw==
X-Received: by 2002:a81:6c04:0:b0:61b:df5:7876 with SMTP id 00721157ae682-62a08d7443amr81201407b3.6.1716801494081;
        Mon, 27 May 2024 02:18:14 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62a0a56c17csm15751687b3.131.2024.05.27.02.18.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 02:18:12 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-df4e503983fso5168391276.2;
        Mon, 27 May 2024 02:18:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXciuFRHdC5fTuENBxKqtuVlm+RKosNzV0B+hc4MWzsvZg0EqU8NPUtrBINsAB9G6ya7vp6oHgKx4X8dqjZNR8HKye8VkOXzcvG5Rq2ufS8D3RG+rlCrhe5FAZzwrMaLdikhJuKHucqizf0+8TkKJ/qwnFyUmZrjKvQ00V4H2JXRd4O5UmKPCvfGFrMUBiXhQ0y166n6xSRZTCmqljkHh9/tIXNCrT3
X-Received: by 2002:a05:6902:528:b0:de6:4ff:3164 with SMTP id
 3f1490d57ef6-df7721ad3dbmr8878974276.36.1716801492684; Mon, 27 May 2024
 02:18:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240524082800.333991-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240524082800.333991-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240524082800.333991-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 May 2024 11:18:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWzZP2d6kRw1oTkMYgzS46J68gR_bg14==HCvVpkp0sJA@mail.gmail.com>
Message-ID: <CAMuHMdWzZP2d6kRw1oTkMYgzS46J68gR_bg14==HCvVpkp0sJA@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: clock: Add R9A09G057 CPG Clock and Reset Definitions
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Fri, May 24, 2024 at 10:29=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Define RZ/V2H(P) (R9A09G057) Clock Pulse Generator module clock outputs
> (CPG_CLK_ON* registers), and reset definitions (CPG_RST_* registers)
> in Section 4.4.2 and 4.4.3 ("List of Clock/Reset Signals") of the RZ/V2H(=
P)
> Hardware User's Manual (Rev.1.01, Feb. 2024).
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/include/dt-bindings/clock/r9a09g057-cpg.h
> @@ -0,0 +1,644 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> + *
> + * Copyright (C) 2024 Renesas Electronics Corp.
> + */
> +#ifndef __DT_BINDINGS_CLOCK_R9A09G057_CPG_H__
> +#define __DT_BINDINGS_CLOCK_R9A09G057_CPG_H__
> +
> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> +
> +/* Clock list */

No distinction between Core and Module clocks?

> +#define R9A09G057_SYS_0_PCLK                           0
> +#define R9A09G057_DMAC_0_ACLK                          1
> +#define R9A09G057_DMAC_1_ACLK                          2
> +#define R9A09G057_DMAC_2_ACLK                          3

[...]

> +/* Resets list */

[...]

No power domain specifiers, as mentioned in PATCH 1/4?

> +
> +#endif /* __DT_BINDINGS_CLOCK_R9A09G057_CPG_H__ */

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

