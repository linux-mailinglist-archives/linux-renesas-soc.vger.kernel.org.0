Return-Path: <linux-renesas-soc+bounces-21262-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 646E3B41DA8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 13:54:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FA0A1BA6B9E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 11:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9DC12FCC1A;
	Wed,  3 Sep 2025 11:49:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BA11DB375;
	Wed,  3 Sep 2025 11:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756900166; cv=none; b=prm9boa4PMAJxsyk6nzUgzCnlY0mTRFIwNN9AlNiLQ+Gpxyv6LFoup0VVB6SfgUgFOGb81gR/zZ7NAHC5R25Q6U0nngMypMEHwaIA7xBCKdnwQ0nU9jsfLci8FpBK5ZbVW9bzkqqUHYM8aQtHYavDv0WHPhTGe2jJlgMTdZHjnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756900166; c=relaxed/simple;
	bh=wbm9Eu3hAJ2MZq5eNJBDYCRdjvYHdJgfLFecAa0YS10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h4KUfzI6dYWsSWuOtVi9iQPVQlT9e9BELvbDQN8YJwHJDKyRibqSwlQMJFgmX6b9qqHdvK9vltRNfe+ZNAZR5GbVvTgAv3ZGp3aPAMk2A9L7nlhzQPWXr0MrskJXQuNKgbhdl67Zq51sRojcRhtFTpu7/2gIlG2FS0bv1BPJ9NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-544c796daa1so764234e0c.1;
        Wed, 03 Sep 2025 04:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756900164; x=1757504964;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oTCBKOndNUo8u5QS3zPmOLzcc5DQj9IWE1iJA6Ce9vI=;
        b=WgVtcs0gem4oMYq7eYmtOtPsTkbIm0vBskpFxaMA7TnJ5cJjdQaPQhsB1QHrPjg0eQ
         nWLGFh9WhNN7m79hFWPD/5d/6XKPigLiQZTmF21cjJhQVzMx02XHG/ELNG45I0TrZ4t4
         ZvACoangg026hHJnKPv3nkxl8WqiLY7lUCx+NqwgavkWI4mQf6BdjTdbGaNy/hqUJwRf
         XctjDoq+jIwECoNQau3fw2JqmKqrOcgZOz+R5WzeRKAiPWIllQb7rWlmZHRD2MH/fM9H
         WUfR05DlUjDXZ0F0Wd6CHINDQedRjMKjJGXKRHBSXLRvevf3jKPAhq7B6k3UrwkXFk08
         FHqA==
X-Forwarded-Encrypted: i=1; AJvYcCU4diE3gCNV/R/2s8d6ECWJK3kJrhionCTDcq5rVznohq/EMLZqGWD3o010RVPMrPC6T6kdLq95+xaG@vger.kernel.org, AJvYcCWUgOm09ehz6KlqA7efOVgFGC2xjt+ee9rH2ZfUpuzGtNryTYAJeP3oqQCr/q6ODIHE/BjgJv3NNAb5t3pn@vger.kernel.org, AJvYcCXxt7CjI9riAx4xFtpRYLLwUZvzep3kk4If6D8pX/w+RyK3Mm+k9IC4MjqBq2pUuPQDTG2XaQwC2M8QW2ybRXKnZkE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0uRrgS/i+6xnWrxuvDGPLOmIXYFsldEzccBengT2PMkyrVtcZ
	+v3HmBRfI6cScaO7dpLcy0lPzBp2bKoZUAmZfsmXN0+yeU+OqcBztLbjVB7Do315
X-Gm-Gg: ASbGncuMiIpxKq4O3pGTX1UH/Vu7LGJt8jkXqzM6eLejtllW//6RFAs1tZqjYFRsK+o
	vwUZq0WJkdc6t1mXKCjHwZbkg1pgjqljayBTdzGIZvQ2B0EfKIgaZkM/UvyFwvkUuIsUKA1onwT
	aIfSNxFbO2rjYKEuh4ZN3D+9ozwhrcQIbOUgAFBpDykm/rBZ67qFeFEEIDwn+pEiHw+fFccrgfI
	WaJzID5krwUvu3lyoyU4o6qBRIKik7M0WKO409GTd2bKZQFmLvVRMWognyQou2S7qqpfijztNcJ
	MWVlZbFTOhA4kL7PbhAUQpcDyXncq1tJQ4GE7r20FOitvLRoS6yyF1LWvzyvuMVF6IB8bMpV1CI
	S3Q6Vhk0gMNDbnwHB7cxEO4pzjDOXNksruTzIqdEMIfvB6IZeR4b0rRkREkXhRcF4xk+YuWQ=
X-Google-Smtp-Source: AGHT+IHnQVRBUPfiZdije+lINxiNfI6uWBJMkKU95W8IBGKULJutEf9sCVqPvfugOAzSQ1MZ2cgDiA==
X-Received: by 2002:a05:6122:8c21:b0:541:fdc4:2551 with SMTP id 71dfb90a1353d-544a01d3574mr4262960e0c.3.1756900163697;
        Wed, 03 Sep 2025 04:49:23 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8960ab19f6csm3139681241.8.2025.09.03.04.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 04:49:23 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-52e532e8198so577322137.3;
        Wed, 03 Sep 2025 04:49:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3y1niTPeYPl4cFu2Ami0g//A6tC57TIXdfL4I+FQZf2JdsJDJPqexqdamZ9NO36GkDe3epsN3gsiaWCtDt9aTR4I=@vger.kernel.org, AJvYcCVx9Dzn6dc8/GkoTxhorRBnnJ+1Qqk1tgirkDIblust4peKyckHANBZvHfcoSPWuFoMsHIosyn/xsS4vXeW@vger.kernel.org, AJvYcCWdErXvMJMO6yrx+o/fdPsNwRIor73bafULZRpcLAT9tBiLYdAJqfMBz0S4y+pPrcZ914g49eiLvwbM@vger.kernel.org
X-Received: by 2002:a05:6102:2c0f:b0:519:534a:6c20 with SMTP id
 ada2fe7eead31-52b1c6693f5mr4735991137.30.1756900163163; Wed, 03 Sep 2025
 04:49:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820200659.2048755-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250820200659.2048755-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250820200659.2048755-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Sep 2025 13:49:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV97MFZV_hxy5bh4hxvUq+V75ECecxHvNXeGWwiw-DhqQ@mail.gmail.com>
X-Gm-Features: Ac12FXyZCMAVif33nyoABfKhRCIL-ikBa_H_0anVlNU7FLAMpM80ousvVZF5RYE
Message-ID: <CAMuHMdV97MFZV_hxy5bh4hxvUq+V75ECecxHvNXeGWwiw-DhqQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] arm64: dts: renesas: rzt2h-evk-common: Add pinctrl
 for SCI0 node
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
> Add pinctrl for SCI0 node.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
> - Dropped including <dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h>
> - Added Reviewed-by tag from Geert

Thanks, will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

