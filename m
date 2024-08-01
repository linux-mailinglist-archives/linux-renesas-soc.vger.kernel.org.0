Return-Path: <linux-renesas-soc+bounces-7688-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFE4944F4B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2024 17:32:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B1A61C25365
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2024 15:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2F8F13BAD5;
	Thu,  1 Aug 2024 15:31:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FD81EB4B1;
	Thu,  1 Aug 2024 15:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722526297; cv=none; b=t7E9OmYcuhVojRhgBPBep7rYinZFmjNPty14em5N3pDY12keLnBgABS+rqpaOnlDb1tEl4k8sWModcIBZyLbH8QaPZ5AhRxRSnvp7gNdK355SMlkVBmKYInzbI3otzqMczPCazdMmAzSKOXplN4D6I1kg4PC2iRn0oEiVmeaPeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722526297; c=relaxed/simple;
	bh=7xL0Avo8izUJdfsqJNLy79ZuDA++AqkF76A0ghNPpCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ciaVRfzvw5uWkEn1dMK6igBblU9EMFryewpoaPEo9+bOtmQr3290kPT2V8Yu4Kt7TMvjfnBFhB5BzEwHzNEm0ZTZ/152D3XEgXomMfr4T8w1eeP1UKjfxw4MS/lQ8oCLPg2gNFLVJs8wQ/jp921SWJbK0lXxsDi5+rig/RQ1Cs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-67b709024bfso64441257b3.3;
        Thu, 01 Aug 2024 08:31:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722526294; x=1723131094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oEvAEJsDUsgTpw4IFZkSM7blNWl56QIoDqvTQ+o7eJ4=;
        b=PhUQnHz8QMDZ3hw6aPXD6yLZpk/YQRGcKapL8hsW8mv2arkJ0eUTQKE53jY2dfLjBF
         xkGP/SPz/etil1sNgPRDL31/aKlYJGbQsSkkidghLH1Wfp4NfIA1R3gdhYcU3zGEA26O
         P8HvKN7UBfENQFZXkh24oDszl229dv3OZXRDuybMRvSIhj2Ht5R/FhWWSQwgxdQL9Z4y
         ZNTJFubt3XpsTTn8LIXDyoUvmyaypdhBVzYx2oSUMVio0shR/dfFMOn1Z60TSbuW79/+
         LrfrBUTnR3lIXriZbkRB4V1GtogNAMfp2pUFnOPZ5unEa9SxcQFeACFJ9IVBevdWvD3O
         RSWw==
X-Forwarded-Encrypted: i=1; AJvYcCUTX+vf6tsmSe5Zxc0YAaIGxJKbx1/D7OXsd608FsMnuzJNXBIJJqCFj8WVrNGv+4eHYEfX9fR2YEKPIOiKPfvNJUsIGYmyyupr/BLdzA8H2lU59ZRTH37l1MycsXUHH4I30bTCRaCYXb5M0YpQjOjpzjM2PuwOL/wHtn0TP4/SF+gEQtrr3b0APtqks2Zd9cc6SbFZj7uIYRjTCyLx2kxaJqxsLohk
X-Gm-Message-State: AOJu0YxOA2mPquhKNL3JTnSstX1NVl9RUBmFAGtbabAJL/wQVvs3O/d8
	3kUcfvDdAAHXpvk6VoPOX9isaO9oZRF4kwOrSYl1hIeb//KGEGdhNZSmgLFO
X-Google-Smtp-Source: AGHT+IHPtk4KvEDMrUGA4GO9IUYqJnOwGdYLl8tx435MJ6tvQhgzjQqdAe5mgpkNJZ0IpKcDSBnpLA==
X-Received: by 2002:a81:a551:0:b0:646:5f95:9c7d with SMTP id 00721157ae682-689637fcac2mr3572897b3.36.1722526293894;
        Thu, 01 Aug 2024 08:31:33 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6756bc9ec42sm33797317b3.115.2024.08.01.08.31.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 08:31:33 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e0b167da277so5342593276.3;
        Thu, 01 Aug 2024 08:31:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXwRJSNM5yjDjauZkwBkW0CzGFf0d/NJcAPutXHBsP7ViLrqLnubrEB8/XsFBRhVqR2JS8NFDzapCBahSe6S8tf6WD5P1izbpuSdx5MEYwElce6NAzEkpkpVcAzkXwByJOCEMOk84ie6KQMBJkNDaZdlyNyMD4nfcsDaX2JfvCRWdhYv1ELcq4Gy8/WJoiP9GLizBUu0XPiWLxxdPEaYfCQEeeFDA6s
X-Received: by 2002:a05:6902:90e:b0:e0b:55d8:cde6 with SMTP id
 3f1490d57ef6-e0bde2b2450mr600736276.6.1722526293300; Thu, 01 Aug 2024
 08:31:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729202645.263525-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240729202645.263525-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240729202645.263525-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Aug 2024 17:31:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVmSwFMhxpBVsDvyzkmtmsu6EZ30SbMYdmBvQ28tBiAtg@mail.gmail.com>
Message-ID: <CAMuHMdVmSwFMhxpBVsDvyzkmtmsu6EZ30SbMYdmBvQ28tBiAtg@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: clock: renesas: Document RZ/V2H(P)
 SoC CPG
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 10:28=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document the device tree bindings for the Renesas RZ/V2H(P) SoC
> Clock Pulse Generator (CPG).
>
> CPG block handles the below operations:
> - Generation and control of clock signals for the IP modules
> - Generation and control of resets
> - Control over booting
> - Low power consumption and power supply domains
>
> Also define constants for the core clocks of the RZ/V2H(P) SoC. Note the
> core clocks are a subset of the ones which are listed as part of section
> 4.4.2 of HW manual Rev.1.01 which cannot be controlled by CLKON register.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v4->v5
> - Included RB tag from Geert

Thanks, will queue in renesas-clk for v6.12.

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

