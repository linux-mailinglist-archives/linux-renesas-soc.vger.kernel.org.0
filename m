Return-Path: <linux-renesas-soc+bounces-18195-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C69AD7427
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 16:40:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 016017A1BA2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 14:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D6424BD00;
	Thu, 12 Jun 2025 14:38:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A077F24887E;
	Thu, 12 Jun 2025 14:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749739085; cv=none; b=ekvPo0xmLcWz/GigWuhntVoBDstSdCW8bhTHwsPSya0pT+bvtIxxAa3vVnVkqBilfAA/IglITng1WuqWa2gel+3eZElBk66gnxOS4mt+oKwJX1xsGybktl97EmDVeYlFKzSXUmiSu5EYinDPD7NouNPUXZZ2lifZ08+0ldWuwMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749739085; c=relaxed/simple;
	bh=rcWY/p5LscZB/eY47pNHyjZQUoAaDL7HqhHzTn8MMHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pT+sr+INd85tndc2wdDTR1de5DWX4whrqogbDv31hKTsub9FBX3giwVyfaKcjY4/TyrXoCK2hCuc8j/EA4b+OTyyNFTYOJxWKMOxEJpucdrkb0QwQ/ers1fFZvyPJQP3FxLplmYnXji+1sVWYvcfDyO4OrYTBX5fCLXHdV6h7PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7d20f799fe9so103461685a.2;
        Thu, 12 Jun 2025 07:38:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749739082; x=1750343882;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WXPKWcxO6rIorYrjw986yZDztVPxEBR0fO+hJyxSFWo=;
        b=I4DN3neKW3uP6096Zwtd8VXB0lrd5qBuZDR0jJ0tEsIlIhrIP+oEXZl6avHMyy0S7p
         4V0cNPDs5fUSopYVHwWzSJGi3UQBAyWPFGFq3VBSCiz7BYla36MzA/pE+QOtmln1MkWK
         40wqalclsa6hrJUOqQySAlXqP5777jMhF8fStIRmz62WlI1vNcAx1llgsT/Q9KoZxPVt
         uj350Je+H5gD6fuKNQ2ycAieElhGlIpTkvNQBRh3nUlBTUFaNkfQBM/6NAY0GbG2FJK5
         ZwllW0mDhzE+mg1M4PeBELG1sQZr+osJCssBN9zUtHJXEm7iadxme9kuNi4XKswoU7Pc
         eLIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQWh3Qssk9hYINArOoNID5VpHukO+k66QlARHwt1PsWybbBLnPEekipI4OCK3BB8suzufph2uXHYGD@vger.kernel.org, AJvYcCW1MidkJDKkkP96/dnjawh59/6oFvM62Sq849JYf/Z2P83anpYIXMuUAqeWsoHEgTbU/Z1Nqmg+SOKO@vger.kernel.org, AJvYcCWaIckXq0I/RQlvlkcT7heVJ9UHMBBU8BtmMxJ4zwtq7jhrVjkTYfKZk5PXn9bbOOmHKxvX6uptPFQfo6N9Fr3czno=@vger.kernel.org, AJvYcCXz0uHRF6f12IMDpG10H+yioCJXxUPD4dITeUs8sqQHEhv37byL8nu09UevNW7tC0WNroWfguTZtbfOGsA5@vger.kernel.org
X-Gm-Message-State: AOJu0YwfdZ3gZTKHR7DPvSZplXTf6C2nkf2BAbCQ6xgmLjoU0aLHF7P2
	VwpWc3mWikqkfj0vyLeNKti4EXCgRM7nukvx9tvDS2fDB4uVrmerijs3OapkfT6m
X-Gm-Gg: ASbGncvXmcPg9Cf7dtHTuhtBaxAPItWEJZJe8s/hiAFAea+mh2KGckhOfv0bO6kHB3h
	ToOLPiqvIHUj5Ye57aY9rgMfHz4fqY308bVZkl1o6l1TqMSqFNNrZ3Umc2XX4pC6Rqzqd7btAPy
	9XOxPeTdNoaacYuV38H7UFPzt7kKKDHZQW1TxHIzlkZRWhBgUEXDJ7DTMFaroJ2xgqTZj15GRQw
	/+90AWt6D37MYaXK+jWQcMsUACLombupCmXl6yteGtOevn5kA/0w+CsrZK+D5vg0Vn+8GjVBzUa
	ftceFgVXFlXMn2JB6SWhQ8TdA4V9lrUi+Ee0TNWK3euImGsMbd6WJbhYtAQ0tm+oRE772oWa23+
	XwM7SKpGSrfdz9Lm8c9WgcIVo
X-Google-Smtp-Source: AGHT+IFvCCuenbrLRIqzq1LldUXaSalqr+87/5W6hlCFSU6fB+7nKYrrod7vKqzOdsZeRUXPNc+EsA==
X-Received: by 2002:a05:620a:c50:b0:7ce:e010:88bb with SMTP id af79cd13be357-7d3a883450amr1115162885a.22.1749739082099;
        Thu, 12 Jun 2025 07:38:02 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87f013bc870sm321004241.32.2025.06.12.07.37.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 07:38:00 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4e7b52428bdso286214137.1;
        Thu, 12 Jun 2025 07:37:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVnhygOe28nKGyZso1VI1EpT9Lc9ATG3VgD2Bt64puOUGeVhFJ+7OIN2J8T1AeSKqkaqV6eQhrHB94eDnc2Z2c6Fis=@vger.kernel.org, AJvYcCWNuetxqlXq61KvdwhPGq3gFm5sBskqFtOz21pgmjYlOm3ooEENARpHEgJJ4Pk67O19gJwrzI76HEfh@vger.kernel.org, AJvYcCWSaPe2qh/JiztXvHi+3xTZpVU0cdZNY7QtLje9t+y3zRDk/ANHAybPNkSKnPztgai+T1EnPwsBicdnf8oo@vger.kernel.org, AJvYcCXJBJKMxGHPtFHVXsgTomrRu2Olo1/pkliwHvmHKI9rijxHkdjumqpAlTbGekEPHCMya9CvGTG+YHWd@vger.kernel.org
X-Received: by 2002:a05:6102:6059:b0:4e7:dbd2:4604 with SMTP id
 ada2fe7eead31-4e7dbd24d49mr810417137.17.1749739078113; Thu, 12 Jun 2025
 07:37:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609203656.333138-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250609203656.333138-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250609203656.333138-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jun 2025 16:37:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXSreUFnFz7Zic4MHdsCzejtQ-Xe7fe_Eqy=OqU==LqAg@mail.gmail.com>
X-Gm-Features: AX0GCFuGUSyS6NXK_oY2YSePBy3FQOgAaO2z5J9ycj50v0DbFOnhdEQZTqIlRy0
Message-ID: <CAMuHMdXSreUFnFz7Zic4MHdsCzejtQ-Xe7fe_Eqy=OqU==LqAg@mail.gmail.com>
Subject: Re: [PATCH 2/8] soc: renesas: Add config option for RZ/N2H
 (R9A09G087) SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Jun 2025 at 22:37, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add a new Kconfig option, ARCH_R9A09G087, to enable ARM64 platform support
> for the Renesas RZ/N2H SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

