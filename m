Return-Path: <linux-renesas-soc+bounces-16770-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E66BBAAE77F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 19:13:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E97C1BC2980
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 17:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1300B28C037;
	Wed,  7 May 2025 17:13:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027C625DD12
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 May 2025 17:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746637995; cv=none; b=HTCSPRzO3XCyEfDaPJWEitNA+Nlg5DOK20VM4bk2ewrBqr8XfV7RTq0xKYdrK4Ceh0WpUcelI+evEUVTtlDOmFmFJnc8Oo488z9a7bNA27PX1yVNHctREqSNkukEUqvxG1QRp60GhcmRciFLY8aBNXGHwAeqgsGKAuoNtM4WTJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746637995; c=relaxed/simple;
	bh=DmuVlokwg4Y4hHupSNCuzOW3HYpmiK2wQ3qzUXi1tLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F/3DAerpktmbhgKul1lSo6pI4flRxZeLL4gDBSk3cknbg0ULnSx8tDHGyJfjDxdLO2JLpnrNBxTRFvtVmGDkAFo2NQOJST51qMR854f/ZuzIDNywEOMeDw6TjRznbmnifM7QgMNie9lDKp+szxpD1z/f7dFYZzebHOpupf1DAsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-878af63c5eeso24957241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 May 2025 10:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746637991; x=1747242791;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sv6lMwB024ExmknADtZVgbGkqyPjFvNGVhsNRkW3ECc=;
        b=eXcQfq8qFrutDIphyzKCaohfpUxGMX1riqt7l0ckFUbl6mXq1xhCSkM90S0fLJPcKA
         xR7nA3G7zr2BXGjp2fQHM7RPrPArwC02nwcqA8Pt6DhnYlzyKyc1mOtA6/SIFdvm9J+G
         ubWSdS6ALoMg2Cbhy/m4/fVsTpr6MTF6RnKf46r4k2YOg2DghZ7ERCq5YsxM291LuAPA
         W+JdgojtTBA0EVLCRRyw6BqkM01Ni9AtwDV5+Q6YPAEc5PMAG5+xD0lgAJ8qrhKDC3Gt
         7i63uL0gncggV1g1ad5x6f2UcvvKK3sjeu8wU4CtiRI+SBQ3Ug8N8CqcE94EdAb8mCqn
         hLbw==
X-Forwarded-Encrypted: i=1; AJvYcCXVgCgjBNTy0q85rdcSLSI/j0KT37rucFLYrdC8N6exvFeN/YPUVa9Qm2FRQmnQa4OtDIUMZYqBtWzGuqhqZi/3qA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzA66vWXSCzGulvSrVJQZD1f1UAZD53xKC4oP5X0rf194ce7ePQ
	Cc4Kk3PEG6pjlceDWxOhkjO0xtSoLSchzlVgObneAn8LayWyzGc3idsEqhYG
X-Gm-Gg: ASbGnctlwZuow2gHR+b+eXLTTA01HK+KGzL5FWNX6mM/OR58oJF0IftWO1PGHYLpYuX
	pyUpHBOa2enVGrhf/7l/HTKwYS1IICaejIyKcDxyHeWl8/WhNOnvzI5w/lT7Rha4DQcCDn1V7Ry
	XNYwPjvlRNH4q6wXODUfLwYfe5rtq/X/QG6TC/HzOu3QQtyCHCjPWijxfT1GcXPG9z9bH3p53Sr
	55Rw6Ck4+eGZqel7zyQfDQpWI5ukF00R5bzvKgejB1CD6O3veyvK9kkFlYNoR5zAaWnA4dgaLhu
	O3moBq4JbVYPmV107eYMFIK8LDgBS9VUZHE/GoXZLoyhoZB5iF0the/D8naDvRq4juL1dML3hZM
	hIyU=
X-Google-Smtp-Source: AGHT+IEKwycDjFPuIt2SGqFVozfJiujWogW/9UfR2ce3tuYcSGPEq8vPvXM5AstxNdidjE51scLuCg==
X-Received: by 2002:a05:6102:15aa:b0:4b1:1eb5:8ee3 with SMTP id ada2fe7eead31-4dc738b8f16mr3221576137.22.1746637991433;
        Wed, 07 May 2025 10:13:11 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4daf2318292sm2104358137.11.2025.05.07.10.13.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 10:13:11 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4c321929641so21155137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 May 2025 10:13:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXq+sPeBVflI7nnEjMCoALk167PWT1uR7AaF1Z0DfAguE7KGiP6FNLohJG71v6XZlDXL5XJuUBrbASzwXeuV4JmCw==@vger.kernel.org
X-Received: by 2002:a05:6102:80a8:b0:4c3:64bc:7d16 with SMTP id
 ada2fe7eead31-4dc73885fc2mr3276300137.16.1746637991083; Wed, 07 May 2025
 10:13:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507162146.140494-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250507162146.140494-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 May 2025 19:12:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUe9LBTMikGaHJGWoBEgpsJht9zhQ8pxSPxOcE+BaYQpg@mail.gmail.com>
X-Gm-Features: ATxdqUGPtzA803lpW_WbwpRV4ncpSqIwozPa_7DDTc-pQHH0Uneju5l2r33x0lo
Message-ID: <CAMuHMdUe9LBTMikGaHJGWoBEgpsJht9zhQ8pxSPxOcE+BaYQpg@mail.gmail.com>
Subject: Re: [PATCH] memory: renesas-rpc-if: Add missing static keyword
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 May 2025 at 18:21, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Fix the below sparse warnings:
>  symbol 'rpcif_impl' was not declared. Should it be static?
>  symbol 'xspi_impl' was not declared. Should it be static?
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505072013.1EqwjtaR-lkp@intel.com/
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

