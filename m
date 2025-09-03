Return-Path: <linux-renesas-soc+bounces-21259-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7766B41D67
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 13:49:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEEC63B5531
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 11:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 387492FDC4B;
	Wed,  3 Sep 2025 11:48:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E728E2FD7D0;
	Wed,  3 Sep 2025 11:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756900080; cv=none; b=lv4us95HWIf96aooFPRJJw14q5L4iTOJ8NYdcyDCszMdpvI6/FY2ji1f4G9Md+YLvJjOS2TmBXtAikxz0NBymbidzvaGZHV4Gj51phmidD1V5/wv9Xr38b6xNeb4B/piJ7lIISC617SWQjJ+wsEJeGpLVaGzlI4IC6/4Z/DeT/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756900080; c=relaxed/simple;
	bh=ZdwempJvBtJovCgd+MTrePiC9RHedGoUEQPAD86OCQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lFLnP5/rvvfxlIBf9ZTkW/DHDz6WLY3QMbY4z3OliEeXp5Ibf5sBbJNh2KxfR89Sh5JFBWAg5UzGa1FJKA0yXK+vc9nBaEe1GfBzh0W+I8TJeYtro4KQP1PfRw/v7aldqpM8etZGhF2LA1xklSrszbdcPkzHn80c2uwanNSXo2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-54494c3f7e3so1726143e0c.3;
        Wed, 03 Sep 2025 04:47:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756900076; x=1757504876;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y+biNvSqrfSzl2r9izXVLctTlUnBxiZuYdnD5qsnrok=;
        b=CB63syktsdghO3lfqh9CTMe64yrbDqTViiQ+J3f4MxSNRDlErqX2i8Z7Up/Pwc4KNk
         kNDLD9sqNK029DfUpKz3uCzELdhLIEasy6xNX8ZdpediJa/oXFQ6smkiAIrXWBSDZ2E3
         sFY5OwKHw4UgJZu10fNWWGXGqASrpNa+T3tp9UjNvWr6HnAxS811pfn6SDW5lKN6nmr0
         Dl3AhYsXUVgOmgOQ+iZ+GyH9uiwWrnP75epOrHBd4XMmd4X5D7SNjbzo+A0cJ4N4q8s+
         HFxJjAOb84tJ8TzTup6W8xzR7ZLl/bpwr4vQ8OY+vckdXy0MYPIj7Qo0Avi1DBrYcBh2
         DZ7Q==
X-Forwarded-Encrypted: i=1; AJvYcCU65gfDADfZ3D6IBKAxYrrH7pwVByO4/9zP9Poy9jGZP4dHllADH3jqKdJh1l2Sv6OzqAiyBcA4O4nWEdh9QbCN4wg=@vger.kernel.org, AJvYcCUxjS7nvK01LlEoXF68qPZUOFF1lh6YpyCgzXcQg6s6lQ2gmW02WOR+5b7TT5Zem1ICxHWjeIFc8WsEBZBs@vger.kernel.org, AJvYcCVuzZB8CkJx/3SJe1xOWRZgEysZ2bdIm5YZvpEKUOZiG/P4uq4kMkq10OefxDrNGZuUpvXG/oBRdFmw@vger.kernel.org
X-Gm-Message-State: AOJu0YyuUfqu58jyFTzoeUeE79HBU6d0XtZQ5sjhNTerMNP2o5jXKWIm
	q8ppTpSUDvVNfKdLsieUnt75tQfoqzUcdFZ62KKn3lqaPkCGonAWi2kiZmhWkmZY
X-Gm-Gg: ASbGncsgK+k6cC7MDuwQ8M+B6fYUNkSkxPEUOW76RMoVk4qCFh1ObZ8Q+NcIad4zRm2
	wAeHFDJisTBrOrpMXUXxoHDGnAkVDee/YxrTY39AGdOQifoHfVXMQ/RM1MRi25BikZFbFq5GwbU
	g4LmFZad+O+eecPt/kV4ZYsmybidoJ2oL2HJ/Zq/VLNydH4r8nKCnDwn41MAl4/saBmXahUijPK
	Q0v6WupXnsPZBaSpmxVGk5RZwXG0SFZJ1RJG4U4P0xjmwWfBBgzCzqoHNLEg1hYEq9ZsNALhhBm
	ODylUh7HCvVOrR/qtM8J1CloyNQ3wTYmiFQG2WcMesDGMMvHHZgLcozj7KjgA2d0e8d0+nP5vNs
	lP6hjUXZ4euL7bbBtlg5ME2dysrtfdrFnLyOF6ul8gxd4ife7bZRthaO3+IGstvRf2xVN/OM=
X-Google-Smtp-Source: AGHT+IHp5OHjUZc08e8Hn4C2vCXzXgV++bIW+OO/rZqmVNlpmVtcmDnpRSFRIkMROWC7THIKtWMB/A==
X-Received: by 2002:a05:6122:168d:b0:544:6d4a:f52b with SMTP id 71dfb90a1353d-544a016d50dmr4171498e0c.3.1756900076426;
        Wed, 03 Sep 2025 04:47:56 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54491464aebsm6762651e0c.14.2025.09.03.04.47.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 04:47:55 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-89a89313bb7so308881241.3;
        Wed, 03 Sep 2025 04:47:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWYnreUlC71bgBsv6BZZRElPygf/oBTMAH40GDVuz293hnatmPu0oHdXAieAfVVhFt0ntb/yLd3NBQ9@vger.kernel.org, AJvYcCX/rkx8kMSafLFuSZAzWre4SkRnm7TnaQ2wuerBlC/PGRXaE91CqYvD8Ed2CftznQ7L9qIRnCyilcLeV2sR5Wdggnw=@vger.kernel.org, AJvYcCXIsRv3hHwAs2mfLTRa+wFlrMxPMjjFrEpntXLHBpoSmxcV4toNdVoRiPWcWgSqFZBdbHeLZkNWWOkdRhNF@vger.kernel.org
X-Received: by 2002:a67:e707:0:b0:4fd:3b67:4572 with SMTP id
 ada2fe7eead31-52b19e70aa8mr5178541137.15.1756900075470; Wed, 03 Sep 2025
 04:47:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820200659.2048755-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250820200659.2048755-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250820200659.2048755-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Sep 2025 13:47:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUL2KhkLxS3LaLPNSLZE2Kjm5ozvAVVoVhYAVE5nHEU_g@mail.gmail.com>
X-Gm-Features: Ac12FXzPhk7GMgHMuUjdIMpl5n7j8S9fwHotPSO-KmwjTe1GmoJdWtYHxzcGfaA
Message-ID: <CAMuHMdUL2KhkLxS3LaLPNSLZE2Kjm5ozvAVVoVhYAVE5nHEU_g@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] arm64: dts: renesas: r9a09g087: Add pinctrl node
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Aug 2025 at 22:07, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add pinctrl node to RZ/N2H ("R9A09G087") SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
> - Dropped RZN2H_PORT_PINMUX and RZN2H_GPIO macros
> - Added Reviewed-by tag from Geert

Thanks, will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

