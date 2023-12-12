Return-Path: <linux-renesas-soc+bounces-929-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D37480E5B0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Dec 2023 09:19:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DD40B20B99
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Dec 2023 08:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C31A18AEF;
	Tue, 12 Dec 2023 08:19:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C823CD;
	Tue, 12 Dec 2023 00:19:46 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5d74186170fso47827097b3.3;
        Tue, 12 Dec 2023 00:19:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702369185; x=1702973985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jz85Z8XdgQqhlQatAV59mgkpmbeo3/1i+Ku2kekUiYM=;
        b=AE0WlbLx2nt/VQ6AVzeKqmw5eKqSs4eIuuLWUYJBqX6VSbHQwgJdisT34N1j+eV2LY
         4WeK/l9p5V4F9WT+8XaOHE1HJhS8qHat0nqqX5oiUYaE+uEm2Edv3UuY3dBgSkuv4nw0
         EgzCtZHWrU9Yed+nf23Fzi9QXA9OHnDm7UhI1tcADF8VNqcDdFE8NrZ3ofxIB3jZxyXx
         th1hWG3Co1NAnHjbqxATjBbFm4yvSZvZA8nsx8sXlkwHNGytox3I5eCjsWmX7ySmysIB
         /+rQdKQZf2E1xLoOGLql6IkIfKWQZU5yO5HTt57LcQkB6wnGE2PvNMAOW5IQQzd1llmO
         nNaQ==
X-Gm-Message-State: AOJu0YxPqPFO63y8i+nDzxmeNtHWh/wIpQo/fG4bXqA5WI3/2Oqxk5xM
	bWGdFgFBZzzd+NcCff8CKoosoe9c0H/gqQ==
X-Google-Smtp-Source: AGHT+IG/nJUd5A/IT+XaxgFsazX9RuXKRifXnK6FA0+MllAXtWmP18OaMJDSAsJL2DxaU/AdBbsROw==
X-Received: by 2002:a25:cf13:0:b0:db7:dacf:3fa3 with SMTP id f19-20020a25cf13000000b00db7dacf3fa3mr2945250ybg.80.1702369185493;
        Tue, 12 Dec 2023 00:19:45 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id g11-20020a25200b000000b00d7745e2bb19sm3113654ybg.29.2023.12.12.00.19.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 00:19:45 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dbc72b692adso2337390276.2;
        Tue, 12 Dec 2023 00:19:44 -0800 (PST)
X-Received: by 2002:a5b:792:0:b0:da0:ccd6:b8a2 with SMTP id
 b18-20020a5b0792000000b00da0ccd6b8a2mr3073704ybq.19.1702369184206; Tue, 12
 Dec 2023 00:19:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231211-primate-arbitrate-fbcd307a0b00@spud>
In-Reply-To: <20231211-primate-arbitrate-fbcd307a0b00@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Dec 2023 09:19:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX0bETuMoZCZM7pAodbwyf0ttZMpKuq0ibBZX7S-YV8xw@mail.gmail.com>
Message-ID: <CAMuHMdX0bETuMoZCZM7pAodbwyf0ttZMpKuq0ibBZX7S-YV8xw@mail.gmail.com>
Subject: Re: [PATCH v1] soc: renesas: make ARCH_R9A07G043 depend on !DMA_DIRECT_REMAP
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

On Mon, Dec 11, 2023 at 11:06=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Randy reported yet another build issue with randconfigs on rv32:
> WARNING: unmet direct dependencies detected for DMA_GLOBAL_POOL
>   Depends on [n]: !ARCH_HAS_DMA_SET_UNCACHED [=3Dn] && !DMA_DIRECT_REMAP =
[=3Dy]
>   Selected by [y]:
>   - ARCH_R9A07G043 [=3Dy] && SOC_RENESAS [=3Dy] && RISCV [=3Dy] && NONPOR=
TABLE [=3Dy] && RISCV_ALTERNATIVE [=3Dy] && !RISCV_ISA_ZICBOM [=3Dn] && RIS=
CV_SBI [=3Dy]
>
> This happens when DMA_DIRECT_REMAP is selected by the T-Head CMO erratum

or by the Zicbom extension support?

> option and DMA_GLOBAL_POOL is selected by the Andes CMO erratum. Block
> selecting the RZ/Five config option, and by extension DMA_GLOBAL_POOL,
> if DMA_DIRECT_REMAP has already been enabled.
>
> Fixes: 484861e09f3e ("soc: renesas: Kconfig: Select the required configs =
for RZ/Five SoC")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
> Closes: https://lore.kernel.org/all/24942b4d-d16a-463f-b39a-f9dfcb89d742@=
infradead.org/
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.8.

Or should this be queued as a fix for v6.7 instead?

> ---
> I don't know what the exact fixes tag here is as I did not bisect with
> the randconfig, so I blamed the one that added DMA_GLOBAL_POOL.

Bisection leads to commit da323d4640704001 ("dma-direct: add
dependencies to CONFIG_DMA_GLOBAL_POOL") in v6.7-rc1, but that is
merely making visible the symptoms, so I think your Fixes tag is fine.

Esmil: I think you need a similar fix for ERRATA_STARFIVE_JH7100 in
your tree.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

