Return-Path: <linux-renesas-soc+bounces-15126-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4910A763A4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 11:57:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FC983AA569
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 09:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A19A1DEFD2;
	Mon, 31 Mar 2025 09:57:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D73A1D9A54;
	Mon, 31 Mar 2025 09:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743415036; cv=none; b=m7IlNnkapRHP5MoEq2fsjF+y/1R+baMw2yP3KnMIFtOS3RK0OlYDwIGJ6BOir4J8lWDzuh4PgAveugRtn94N1qJGrNLXR7+9KiGWltHYeMZgoqq+OMlrTB1BRRQPCrGGkVjK8EQNN9QcmpLXwXAbxjUZo75cSQoTay16yMX2dVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743415036; c=relaxed/simple;
	bh=p/3Rg1e9OKdQiI5S8SM2DoO6zlnsW7B+E91Re3p7IGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oZNDwSNv4NulaIET+4EfNZ8ryf6lMdFh6Gc/cLH/PFdq8shH7KrlhzV85DkJduwa+Hrs3w7e/xjUefJ91bDaIz/urR/m5PZF1UdWkemRyjIIhtUpc7RrSIxl/6c+YiF3M5U1KSma6kTEOOymzd2Nkw14FhCQ9Qz9SAmaF75Cj/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-86d3805a551so1899475241.3;
        Mon, 31 Mar 2025 02:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743415032; x=1744019832;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NDKXXwqQnqUsGfF4Um3thazlHp5Wj29UWM2v6myoNNM=;
        b=wyZq8yTnQTpaMHpVLYjDqqwr47UJ81tUJ9RuLD2OS2gVba4C6rBSXiPI2M9XfIqFXu
         fCifZn3WVcYrCoTReV8OS7ddKSUnnp231nyZzdJoY3w+JddqG1g2IC/lL1uOwGubGaEB
         Exx1S1+cirpWKQCDoM0HLvOrOzssFrGzMG+kFSdXHkK8Ux6+3Mnm882bXgaEATTwbD/3
         vbihhDFsFLklgCsttuIbMVxGAthz6MV/N6ld9t+rszPnRNbsdZsVwkp2p/3ZcKyvHt+p
         d7LjB3rFScPKlW+w3m+7TJL5oe4FNz+ISFq7IIegLMHSZOrPVSPNSe9A9i0zbs9exVwR
         nYgA==
X-Forwarded-Encrypted: i=1; AJvYcCUU5lQutTdZOFsWc40ffHGvVUQyqCPTEo3eiKtvOT/+8lxeI4Wjj5sZFhtxMxCupbXwJt5V+J4kVu26TkBdCjglx5U=@vger.kernel.org, AJvYcCVe5KvmGv8EPKtZYLKR86fQdtCfUFDkVAJfui6rklJfrHaj/4fOHuf8t3T0bCoVSbuEg7+S4NMIoenP@vger.kernel.org, AJvYcCW8NS51auwYGySwTrbQhuwcvQ7/dd827tFRuaD52ohKFlA7O1HexqoTLWg5r8OEFr7r2iBjZuA2v+RRVrXw@vger.kernel.org, AJvYcCWgqfPbMdpeJ7cVXOFiLMuiU73zUHde3OTa6J+2ySA/V1sSZOopo/6qSNpxQlkdN8JuirGaMpGMGVCf@vger.kernel.org
X-Gm-Message-State: AOJu0YxkMBgVi9pPpjEJiwtuZTD1PHLQ54edv980q9Nw5ofMWJsdnCdP
	J1BxVAhLsbQZHoJsei+mi4J2ZCJG0M2FqNQX9ihIUYbftg8RdnQQB+tMmSTD
X-Gm-Gg: ASbGncvrohG0LX+e6WwUF+rwr3mr53HQBF/+zgTMrdT5E1hOP/CSe2/mWAUEN+JqCZc
	J2voQou1kh0gJE5l7gVx8s/q+Hxc/U4dpD37sD9KpZnFVMTMPniCUfeYLLibO4Y0zZzaN1jXqUU
	3MbfuzBJwMysMB+5rIjmsQzHCoGX1HQgzMYfMFJmJC+CqFA0fKW/yzu3Q48uk3a4MlCh6xcJ2N1
	4KauDs7PW4Qz8NJYgbCXUNGDHfANVquc3keAimCdGvsz6YcO0Yv9Ghfyj/GkIptiF+e/UAZPEpA
	jQ078nEC4Ud+lF2QzeYDTQRu79XdhED39oLkswGHp3fXMnncLfg5BBi+zRWSC+O7wg9bNHiaXOQ
	qvOSit9s=
X-Google-Smtp-Source: AGHT+IHCgixM8s9QHKNm2cE/fiEKzZfYhCHSda7E3sZ6ACviD3wnP4/wnpikZ8kRKc8R3kdfa9ACZg==
X-Received: by 2002:a05:6102:510c:b0:4bb:c4ff:5cb9 with SMTP id ada2fe7eead31-4c6d388ae4fmr4090030137.15.1743415032493;
        Mon, 31 Mar 2025 02:57:12 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c6bfe5e1b8sm1504699137.29.2025.03.31.02.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 02:57:12 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-86fbc8717fcso1902868241.2;
        Mon, 31 Mar 2025 02:57:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUxAJRcye+Af9bmALC76E4TcGevphRcRDKP4HLPWzCTgc8QDH9jaRXc9gA9ADWaIh4ZxlbjpmmDboZcuf+z@vger.kernel.org, AJvYcCW7fRqswr+bpMKR+0OOI6W/GdLnZKqt2DuLbuivysjo18B3glurMs68M06rTboPFxpJ+M5+UUdqgDKz@vger.kernel.org, AJvYcCWIfzwUaQJG/aLVLDplHw6jqyo0vJn8zm43HR2WDn5hf+tw6kx73ODQEzHA5BSdkLeuz2Z4qsA2QSiO@vger.kernel.org, AJvYcCXCGMieVPbcJ5HHeFBJ9xrJ44EWMAMYQZOeTYep+Z3RGfLRvQQ80HzDvNgsT8O/PNUbYIZm6a8NN2/60AhQibyjTEo=@vger.kernel.org
X-Received: by 2002:a05:6102:3e8b:b0:4bb:9b46:3f8a with SMTP id
 ada2fe7eead31-4c6d37d6375mr5246639137.2.1743415032023; Mon, 31 Mar 2025
 02:57:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328200105.176129-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250328200105.176129-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Mar 2025 11:56:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXSoP_9P5rEQfFXP=SWSJ+3HY6XOZ0N2BMuke7=euHsVA@mail.gmail.com>
X-Gm-Features: AQ5f1JqG1KZ3j4Pb4gI9mqpSOzWYswvml48p8d-PmllTwg4qSacaqqgDLYqOCG0
Message-ID: <CAMuHMdXSoP_9P5rEQfFXP=SWSJ+3HY6XOZ0N2BMuke7=euHsVA@mail.gmail.com>
Subject: Re: [PATCH 0/6] clk: renesas: rzv2h: Add clock and reset entries for
 USB2 and GBETH
To: Prabhakar <prabhakar.csengg@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar (and Biju),

On Fri, 28 Mar 2025 at 21:01, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> Note, these patch apply on top of the following patch series:
> https://lore.kernel.org/all/20250228202655.491035-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

That patch series was ultimately ignored because it was not clear how
it related to other similar patches for the same driver.  So please
coordinate and resend, based on renesas-clk-for-v6.16, or even better,
v6.15-rc1 next week.

I may still review some clock patches (the ones that do not depend
on pending new constructs) in this series this week, if time permits,
but I won't apply them.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

