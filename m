Return-Path: <linux-renesas-soc+bounces-19820-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 618C8B17D93
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 09:31:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA5F0189BEE6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 07:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D42D620D4E1;
	Fri,  1 Aug 2025 07:30:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9691F20DD48;
	Fri,  1 Aug 2025 07:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754033416; cv=none; b=PLLptFDBMVZqLRfDybjcLIC2tBZbdaM02bHQIaOfgMvigzBdtSCgfWhb2Mp191wQpQ33i9N0tpD9aUufBGWhBC6jzySzxx3fGPy4+c2FTIT3Cux0BOyUUCcGEYkCUWESE/S/LiXtrQzvjUvNZkajalqG8UiYD0OuJvDC4CZ1fUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754033416; c=relaxed/simple;
	bh=iRTVadAHZKFXlthF/+BY/8ed4fZ+qx2tijOBhd3003A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G/mkrlT8xPB1dhbb10K11sZ3MNGzWnt+qe2ZejG01dEpwBINPcXH7+k8xNHHex9qt+16IDqSr2VT71WerEYOcEMKg+eZ5WFuoKDk+FQMEsQf0WDcoY3Iu50hMi4o8+tk7KNQlilEaj9wo3Py4Tz2q0E3dbQQR6osp397eHaSrH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-886c8de5d90so311517241.0;
        Fri, 01 Aug 2025 00:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754033413; x=1754638213;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aqkLvIoOIR9FUnEm/FEQ+kXJsZ2x0J1RmYajooCOTvc=;
        b=SWHj00MZapyza3FB0y5LBLRhHOlr01Q67MlWHxujIPzHk9CsXZDKH7E0CTi8i+T5Qq
         6/UNSCMJQik5Kg9qj6G7jBV02dIyXu4ic86NiZtMjFjI/cqC1TGUDNG2L3+/R26ZxaHf
         /8+pzXuaPUyzirf2Dhw8VS4WAUrEddUEqO6NaWUIGuEYRQOO22CmruiKRQ5XKkvxQ3sc
         tjIeaer2vRzemQ4yeyaqmTruSHInSH6o9GZ38ckr7vh0FYKVO4dJjJetEAFIMHyzYXyi
         OVH7/WBQsu2jMnt2swl9wExB9s5PpUicy3fD1UochOh1vZJUDTAUIi/BRBJsYD1xtoX1
         xqBA==
X-Forwarded-Encrypted: i=1; AJvYcCU8TmdO48r8JCjOaXIQBu9lP3Vtx3tg2xRKLd+K2Ac26xnnliXR2oIRTk4a4M2nlmazBbf9iq9THgk0@vger.kernel.org, AJvYcCV1T070TnycdhepenYNeiWHyNZA7kEZlaKHClex95FmV1eQSy8zdvBS/PBUENI1cJNhrdp5qejE8zyhNtPw@vger.kernel.org, AJvYcCXCNancLfACboSQER2R14xASekIR2T2ANPGMrxCVbP5gq+6q1AHWY+uZRX6tvsrU+W/HbeLa6oEBSMuhjvoK4RUy3U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCU4dPoGUAP6WxjeojOfddt99AmbZeZmP3W7zl5Z9h4HpBTNGX
	m5j2o/HsiyjobON1F4NVSlUrBDSF8InLHDeG1gigVeJtpA4zI8O3fS8TpMMEkm9s
X-Gm-Gg: ASbGncsR+85G5I64Evz4B6pD6Q0hHNZGLLM9Yga9e8dg42pGxXNBCdsldxIdAIDZ95g
	s9D66dfouTo8L6+ypHIxGyiWrBdppwntyQGhps3rSV93ykhfOj+2o4g9DMH0cexd5CVhMLER+7N
	mMR7eMCoaDEE6J/9WS9fPuDZADIPGPTldmW4H4f1z8N8yeLIF1/HlGGH6hIdqZbLRSNJiT+SlJG
	bOWF42UXHy1wULAmfydW/9RbkbMvEXvjYFSxVVJn4roTMLU+MFdBCsI1UxhvdGCz43BX3z+uyXP
	QE61n6FxR4yFQzPzX1+nlD5qHDbHgolxbaZF5l+trXIZtD9rypj2AfubtKhWmbS5tTlK2LXsOo/
	PUhpMN7dNtJKitCDVtCJPIwH2Z71yce/aG46kO7LYMbbt5XQTBV9JZvfUlZ1Z
X-Google-Smtp-Source: AGHT+IHHSpuSQF2rI/x/SaRImeB5EWsw8ML2YU7F/xD0byBq+x8yIKRvtWtFP8e52Y/UtwSDOFjUeA==
X-Received: by 2002:a05:6102:358e:b0:4fc:670:fbf with SMTP id ada2fe7eead31-4fc8ddc707dmr572234137.18.1754033413237;
        Fri, 01 Aug 2025 00:30:13 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4fc14934bbesm608902137.23.2025.08.01.00.30.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 00:30:12 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4fc83dda10bso121062137.0;
        Fri, 01 Aug 2025 00:30:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVz43uenmVMjPAxss+jcORkl+qMjGKaDuVatmkKtLKxTJLBXAnUbPa94DAGFsGblmFSSdbGYb4LUm07@vger.kernel.org, AJvYcCWYaeWslfDiKNyEKcIE1wm+OclIqaZSOkHR5Z82fwRYcP5ojxsK9CxVN3VdJJCxF+9Ic22F0cvBxypRsRAcAC2NvLM=@vger.kernel.org, AJvYcCWpijwnFg9sFtbv6ISUyd0xytXDaUqeKZyjtOfXxJ7tJEXwz8wJoZqOQPZFmSUpvkFgVSCOCzYxQP2AU+4s@vger.kernel.org
X-Received: by 2002:a05:6102:148f:b0:4e9:add0:2816 with SMTP id
 ada2fe7eead31-4fc8bf6d8f8mr603774137.5.1754033412670; Fri, 01 Aug 2025
 00:30:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250731125109.147422-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250731125109.147422-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 1 Aug 2025 09:30:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXTbOcYPrgHxpCNJEWNhcd8e5NBC0gyYQXn0KmQ8wqEMw@mail.gmail.com>
X-Gm-Features: Ac12FXy2OJ_6FgAPBwCOB1r8zYd0_R9sLX_ruyB3uzg1MOjqqe-yBUpDRJGBn2E
Message-ID: <CAMuHMdXTbOcYPrgHxpCNJEWNhcd8e5NBC0gyYQXn0KmQ8wqEMw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzg2lc-smarc: Fix typo for deleting node
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 31 Jul 2025 at 14:51, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Fix typo for deleting node 'channel@0'->'channel0'.
>
> Fixes: 46da632734a5 ("arm64: dts: renesas: rzg2lc-smarc: Enable CANFD channel 1")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
> @@ -48,7 +48,7 @@ sound_card {
>  #if (SW_SCIF_CAN || SW_RSPI_CAN)
>  &canfd {
>         pinctrl-0 = <&can1_pins>;
> -       /delete-node/ channel@0;
> +       /delete-node/ channel0;

As pointed out by Rob's bot, you must not delete this node.
Instead, set channel0's status to disabled.

>  };
>  #else
>  &canfd {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

