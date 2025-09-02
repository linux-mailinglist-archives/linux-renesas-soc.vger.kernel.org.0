Return-Path: <linux-renesas-soc+bounces-21191-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D32CB402C5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 15:23:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AF2E3BD4A9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 13:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C60EE3019C5;
	Tue,  2 Sep 2025 13:19:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4190378F43;
	Tue,  2 Sep 2025 13:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756819180; cv=none; b=BApqIhQZ82FpiAi8wtCdk7Xj2Oe5dxYn/rnRukPwudDH/wdxK+BeAzqLOLU3NYNHgMO6zC5kVifCUIrGQmoXw9M+qDLEE8JeVeZck509wAooZ1Sdjp8fwCVblpM2RLOzcmdTJPSLpTO/gh0lbD+QtahYBYrnLsfYD/Nc1lygQ4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756819180; c=relaxed/simple;
	bh=7ezCBtEzEDCfWMrIuBk2RX4WBzGukb9PoA+nthRFEJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RkcJcvd4wtYe4r4kLHrcPguYfdRi2fqg/f28by3DvRYiRdHAYHNu0fTx0PrpKNEaDf1fexZNCIuUyARjtBBEXoTTQeGYCA7UrxSkeDQYDGRCDFur0mdmbXurV7XR58+z+HC8I2cBuypqQgDpcwsWQJPdiQWsY+FCRSmPeAa5vns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-529858dc690so1272254137.0;
        Tue, 02 Sep 2025 06:19:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819178; x=1757423978;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qw26R79NODPbly0gxpCIdsEY0s00Sf9I+4m6dANRMwY=;
        b=IfPhpsRCLsScHHtbEGxf88bo0E7vNIuR/ezr//jjVrtfR4OZfTTOPSjSCNWh+6EXnG
         1pPx8YOcj0JZgHSvRmCtS39ph+43jRK7PLVmm6HflTHPOdgFX3SboajSJsvMbnU3RWSL
         1+fry91R75s0KReydgMFSOlDKBS/BwpWckORlgecHs5zA2RTCItulY6bCQSV20Ua1CO2
         NNJpkuubiZlhe5Shi962Iv0xG0SSWB1DuWzRxcLLDMKH+BJAKzsbmblSRVfdyWEeY5bf
         T5MVgcidflpjMvMBSbex7u3X6lulZnd1aozOOnajx84BzUmEItSog6/gwiKY5jjX/cY3
         1Zzw==
X-Forwarded-Encrypted: i=1; AJvYcCUep/aFKnAiELjONH4GHOZsE4JMdOTqA6kDs1YT09R0HV+J6WQddzbMvMW0ouaCHrAPsVbwCdRoCHysf0EjYlRarT4=@vger.kernel.org, AJvYcCW8h//3l6fQR4u+kXUOKStFPOmlvxqO3fYOfK6luBnk7GYGtFqaH9Hr6mKQAzGyFrbQVbGg97G/82xn@vger.kernel.org, AJvYcCXQ+fGvM91MJyv9hLbSr3oK8z1rRSbI5HJiCRWVIw6oC9bC1fwJoR9ovm6jBMDM20PwTsYiDvonv0LJ+Ait@vger.kernel.org, AJvYcCXbQeW2d+8tFyvL1ZQhr5eDqUXP/q1uklR7E5K5ZqyEIEsopM0737ectXISJa6KKZU9pvRpOi7WYMaO@vger.kernel.org
X-Gm-Message-State: AOJu0YxQcWIFKvcqqR68E9I2Evjc6p3KxvE0hHyIe1qJ1HPtE/YXCMr1
	/AC/zB+CEEYhL4Q+aJjQO7w8/uGB1yF8Q8lZXvoAyf9HTBWt7pv/lQOCWa9xgQyd
X-Gm-Gg: ASbGncsDzYWtr5EOZkEoz0scmwt6wq8Vs/iJcRXSLKnWd7xQV9ZSAeNoEYKf4M7Xa0a
	spzBPJOe/FflIaQiyMw6BvFffOsSaLjYOqQinbKbgzh6Q5Fplj23HOtIGHGXMUrPIGgXEf04nng
	rQjqF5Z+jqvPg1GY+nIsHUenemxaBo6ZLOg/NfeCd3dfvluPDr/L79vBVP/12SUzMzsMKFayemH
	R65rXnjZ9ww52UEupreWQtsrsE1LoEUNFHVRzNZTLDZjHgzLQpYD07ZofNAHmO/4ej30pXaw5p8
	J2hOgbIKUDZmgugiKMUaefS+QsPk+e0F4XUhu2YW+XsaRsdZTIrFJet/pqIMxlGDRQpnZeMDiFW
	LiwTHsxUy2gjFnY4v6w6VCzXqFPOdO3/H+aTB40rlk5spgooqlBzoRCUv6ILflCXdKzUE62k=
X-Google-Smtp-Source: AGHT+IGPzEDyHxkB8d2ck8y1zQ2pzOwX20cHA+kb7StIQPajrTfFNKTtmPO5aEkXI1xGjdFurhEYAA==
X-Received: by 2002:a05:6102:510e:b0:524:b344:748d with SMTP id ada2fe7eead31-52b1b2ea2a7mr3940416137.17.1756819176583;
        Tue, 02 Sep 2025 06:19:36 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8943ba549d2sm4511162241.12.2025.09.02.06.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 06:19:36 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-890190c6165so1714618241.2;
        Tue, 02 Sep 2025 06:19:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW53Ht1nUKjk8Z08geyN665gZ5J0NGM4k5BAtLWh2olGuFocvIaPHv1l1bpOjB8MquXg4jtK1juDOko@vger.kernel.org, AJvYcCWVIb+HJSR4pVYCGySQcn8y4Gmd2VbnCsWrXntflp6H3+WDigB+DzCG0RsemjjYOA+Vm++ET6q1NviG@vger.kernel.org, AJvYcCXNAZa86NN/tBP1zEBaFj4kqtqMkZ72WKav0iNRckiT3/dcdlbV78KkpXxUzN4wUHKWo4wvMDwJZa6JlRm0@vger.kernel.org, AJvYcCXPe7mg+n64t8waWopRAjIGm0InbaoKInbqRd2Fjlm/wBBL+KTrllhI59+aqIBO6yR33jlBNN2gSojT2Yz1ziw0Pfc=@vger.kernel.org
X-Received: by 2002:a05:6102:2ac9:b0:520:a44f:3dd6 with SMTP id
 ada2fe7eead31-52b19950e41mr3178704137.8.1756819175942; Tue, 02 Sep 2025
 06:19:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820171812.402519-1-biju.das.jz@bp.renesas.com> <20250820171812.402519-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250820171812.402519-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Sep 2025 15:19:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVrMJEpM4T6YjSbttmkezPRhVGCeDGHTf2EAbDGR4bbxQ@mail.gmail.com>
X-Gm-Features: Ac12FXwR38KEkRhbr2Q1mg-SFhan459xmkTa4MvT02eo-vKbPi6G21ViQysuQCg
Message-ID: <CAMuHMdVrMJEpM4T6YjSbttmkezPRhVGCeDGHTf2EAbDGR4bbxQ@mail.gmail.com>
Subject: Re: [PATCH 01/11] dt-bindings: clock: renesas,r9a09g047-cpg: Add
 USB3.0 core clocks
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Aug 2025 at 19:18, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add definitions for USB3.0 core clocks in the R9A09G047 CPG DT bindings
> header file.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

