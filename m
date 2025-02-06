Return-Path: <linux-renesas-soc+bounces-12888-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD598A2A37B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 09:48:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 585811676D9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 08:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57EF8224883;
	Thu,  6 Feb 2025 08:48:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F8E22256E;
	Thu,  6 Feb 2025 08:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738831687; cv=none; b=ZlIpwsCfBLyI1DVH09CiwoJUcx3Ogu4oYTPaNTMcOIlRDSdMzhNHaCNSePj702CNrlzu652iBwSGR3lV4Bc29w6ZEcrjEhWVBFACGw0iZmJL7jnz4NbDHwkSPkCdUscSzUogz52h6DzKBYK+eT58ZO46jgab5ER3gsJs7LhJr5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738831687; c=relaxed/simple;
	bh=SbGSvDznCvpVo16ZJOVFrKm0G1PzAOeAHU9uzxkwR+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=el8FRRGZMgcYlMDOag3Idu9XEZ4+eG+ZglAKEJ1QZz10aDvD+pDpm7lfjR46Z7bCMdoe/2F/lyIjKjGIwPTCYjcHXygdBEGfjq2BZTIdUigqsz89gkrWXzW/XLnax5yvUcXYrxFcjjMR5djxIoOb8jpX7aFkG01pDpol9/BNmAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-51878cf85a7so184949e0c.0;
        Thu, 06 Feb 2025 00:48:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738831683; x=1739436483;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/z3Xiv0BD4Jx1ChxwRnk/m5m/1wYw6Wv4vgYkkyeu1s=;
        b=oZuxH1BArGThVKUZQ8msoWnUOG+MGSed98p3+Pnj9dvVhYXtqT45Fd5r6TquUo9SiD
         cIr/EvZ+VCXPHlvORL5Hwyo1KKNCNAYxAzsNCZ3EM7MBe5D1UFD8L13FuLpZ53zLNLzu
         FlXRmQ7kAAtLwy2fpdq1s/a7iipPc6GHxUslunWvXqzsr7QtPYM+4BG8s6+f2455vEw3
         5NG/hxWW9y4mFu+QZcKU2lOhg4YqTrgHA8NLnkqcX/WsP6U5eTJHqJ+ffhOTM9MOkA0I
         jvbvza8FpXlavOLVLzyAJpKak/yd1slehkdQuR8QrCVeql4zckWmEfl8snMBptbjGtFS
         6TlA==
X-Forwarded-Encrypted: i=1; AJvYcCWXWBWKl/xfat7zw45QSNjL1iall4HMAE7FNRUI9dToRd1zP8LzYFAOHEfUtmLj/xDwvh1q/DJcsdN7cgM6qQpA+1o=@vger.kernel.org, AJvYcCWoNrw0tE7C1bpNd8IXNrw9UACxpr9lwxFizsQFMKV7eub/IGR9fO89+J5Jle4fV62IEJzSFPo2abba@vger.kernel.org, AJvYcCXgJ5dgGOPOrAxH4jaU7h07+mYA0SMQeoS7JGq6CaryB3ncDMjEaFA4mzjFnmGfju+okXKc1kOkEpI+@vger.kernel.org
X-Gm-Message-State: AOJu0YzHEXS+wR2V5QmMr/sikPFNt/fKRCmMBfNsuNORMrdRrLUEJq3C
	/45FIQiNSpBt07O0iCFRhKl/hWzkLv2kpoJ0h9C2OOl4OKzzQqnVg4lu/vfJ
X-Gm-Gg: ASbGncs5GOhO5eph5mV8VHehGPFXUKFQrorchmi5wuUzy/yNOHfPgS0s36G/NXI+KsT
	ku/z54cIz6H+v6X9VwRiH/FXzqcp/P9W32i8DXp1LKTpCh1afqd0VtaQ85FQsc6JKW9qUMBF2SY
	dGDK9VcPbQIzy0dg7xNx5cnxdS/UfEOnaPz6JBQP3+kEKucZK179qkCPdGM9Ke/hd7jtztCVIHB
	C4o5eozLXvmT4wU5Z6teNZcYq8IVi9WHwUksPkgU8qpbHImKgZU/KOG8MHoWlEa6Wtjp11fzYCC
	pWCUTrmNpGycJQTvDd4fi1/ZzMKD/td4Qn748yg3gEty7X/jnn6mJA==
X-Google-Smtp-Source: AGHT+IGRjK2zKKyozsCpGY0dd5iKn44Mq/FhCPylbjIO29ErNHe2PfBPNQ+YAFeN5iJQV+XGFL+5LA==
X-Received: by 2002:a05:6122:2491:b0:51b:8949:c9ab with SMTP id 71dfb90a1353d-51f0c51ccc5mr3647757e0c.9.1738831682913;
        Thu, 06 Feb 2025 00:48:02 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51f228dd7e6sm117912e0c.36.2025.02.06.00.48.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 00:48:02 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4b6398d477fso191786137.0;
        Thu, 06 Feb 2025 00:48:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUExzsGqFP5RML2KMhkpB63LFgim+r6vegO7KXgDwn/qteAYe5sEWUP66VeZSzVBmpdYOMCuTeEQ5Ka@vger.kernel.org, AJvYcCV+uuE1zBplbqJY4kFu1aXuAEsGuqjjEfr+rtRDBPeZedAuTMmE6Zs1aQ8UInAWBf3jxtCyOaJGOqSA8/ovr67fp30=@vger.kernel.org, AJvYcCWFvechT0yvm/AXMv+WzICDa1x0I5bOi7px9xxQ2g0X0ug05cQaXk3PuPVX33NlskAYTRJnchY+GVlh@vger.kernel.org
X-Received: by 2002:a05:6102:38d1:b0:4b2:73f7:5adf with SMTP id
 ada2fe7eead31-4ba478989aamr3608246137.9.1738831681965; Thu, 06 Feb 2025
 00:48:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131112429.119882-1-biju.das.jz@bp.renesas.com> <20250131112429.119882-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250131112429.119882-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Feb 2025 09:47:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUUZ3-6ZRtqL36frfYQsyp85fJuv2K6YS6_=c2KP-P+PA@mail.gmail.com>
X-Gm-Features: AWEUYZlVcEap4LgxFWv_sZA1X7jS_4G-TZlYqhuDtUh15T443QSMyk6AsZHzG2E
Message-ID: <CAMuHMdUUZ3-6ZRtqL36frfYQsyp85fJuv2K6YS6_=c2KP-P+PA@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: mmc: renesas,sdhi: Document RZ/G3E support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 31 Jan 2025 at 12:24, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The SD/MMC block on the RZ/G3E ("R9A09G047") SoC is similar to that
> of the RZ/V2H, but the SD0 channel has only dedicated pins, so we must
> use SD_STATUS register to control voltage and power enable (internal
> regulator), for non-fixed voltage (SD) MMC interface. However, it is
> optional for fixed voltage MMC interface (eMMC).
>
> For SD1 and SD2 channels, we can either use gpio regulator or internal
> regulator (using SD_STATUS register) for voltage switching.
>
> Document RZ/G3E SDHI IP support with optional internal regulator for
> both RZ/G3E and RZ/V2H SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Dropped tags.
>  * Documented internal regulator as optional property for both RZ/G3E and
>    RZ/V2H SoCs.

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

