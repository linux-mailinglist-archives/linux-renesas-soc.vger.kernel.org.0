Return-Path: <linux-renesas-soc+bounces-18179-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8C6AD7087
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 14:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 895FB3A1477
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 12:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56901221F20;
	Thu, 12 Jun 2025 12:34:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701BE18DB29;
	Thu, 12 Jun 2025 12:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749731690; cv=none; b=h92tq0aY2Jp2+koURtmLAbJj7b4sq77QnSwgrpcKsKB1ysraspALWNI+y/OJZG1bx5llealQLwtcd73ZdH0sbCMOpcnQoZEvvgXgJRxC7KHQI0oH4HuWL2NvTElS80mVrx9FOO6x3ax2R8+GxdaxIogS6Gfcyb0Di62EMdHwvyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749731690; c=relaxed/simple;
	bh=HMvmy76NLGORQArlbIXSPIXwELaN8ey56Ig9mvz4sxY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Syhbr9DGIDMbjdkBsUQ1wHrxmHU/KWyvruhq1LC8ZKd3eJ2c4DMGTT5/HQfNKWw6WNo/CZ2XQy0bmv40Z4XmUcNWGRwYPzBp9qjVcbnYxOGcukvbB2RPedCnj2DhCtezgMewTT9TU9OwQGDQSPjef/+zkhaf3TtmMZt9vWzLZGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6fad79433bbso9856876d6.0;
        Thu, 12 Jun 2025 05:34:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749731686; x=1750336486;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YdmKBl6XQx/lg6XYfGHOU0jB5qghLcO4dPwReFsMtRM=;
        b=KiMMa0XEfJb8/8nXxKylvl7VLY7DhuSoUKznjOovZ/6Cq8sjlguIBrr92OiOIzWelN
         /dkFjOepRQich3JXrsmptdTzLdHEPzfu5nqZ23ahmNBnlRY6DzIgdZaqLh9nVmqf9Kel
         3I0VGlLAnWkEuPQnb0FcvETZM0NNh9uWt/ecpDs6TOtdDPxXLodWIW3J1eg2/77G9Xaj
         ZxlCO/oNQi1IZ1P3ItIrQv+S5q/Kv/bSnqEhOuvtYRqYtow/Elqj+V80FxgYxRhPbqZh
         2Vy9obYP3XyJWUzfd+pW+qaT5K5IpbY3fhSmsDMfnWW2ESMO6O11ZPbXy+BR6DYcJ58+
         q+kg==
X-Forwarded-Encrypted: i=1; AJvYcCURLPb+AgC1yRmG93NtCxxlz4cRwCMV+kNNQjw11xIRKmNBB4/VCrjOy/NkmQ0ZnJ7/cRrVsotqNC+MmV4=@vger.kernel.org, AJvYcCWIKRSCwtVZUvMT1MWayJMt9aOcz5DOO2B5a+PYU2/qiwqxbnougP90pFcfj0dM7HLCwQlLplHfuVfQbnw=@vger.kernel.org, AJvYcCXfT4QPxd8JyW/itHtFLgbytIvusredRVxXnADNitSpkdft67hloDcQZkrcGOMaxZpFgw8N8b5wNd18pbd0/rnSrgo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKaYpfxay0QCag6llgt7a96y8PM7LsJ3IREsfN10VEoRO0QJt7
	r6hu1uUH578LFFr0kNYrsVnoEaouwFq7lhWdF6+fXLsFJEx6JYRtzexo4MTf0ltc
X-Gm-Gg: ASbGnctTgq7NE5oKRdO0nVYdfmOb2IsiQEfdHARTrlBeMEybt+dVIm1cnjw77AWNSRU
	znCTq/WdsAmMLOkpXSbcJqh6mWInHPk7ZpM71C6NeB/yCKfJoZuWWLfEXLnG62k37O8Ji1aTdrt
	+GkzBixWB9DADkUZgpmxhnMXqAw2nANc2g1aFeFwUB5YdEVbgDdGkTVyLcb09U8MtpqYefeZGfm
	KtPwPCHp5U8Xfo2LDMVkY2ad/a/pNthSM14+p0M03OQMH5Xw5aluuc8KLByKVulzuN02jHp/+je
	t/Ffsfavu29WyDMR5ZS44NYwFIsWXjWS/5ct2JmR8uIK3KkpoKhb6OY/R8+M6mOKAYhk4vjEE1l
	GuNQL/arMSIq22uwjN2yONy6ymUD3
X-Google-Smtp-Source: AGHT+IHssHqpj8tpytx5oKPL/gYKfnWAcsnJBTEMjqRK6IUxecWolGe0vqo3MRJgMkGJB28DZRIPgg==
X-Received: by 2002:a0c:f083:0:20b0:6fb:39e5:1b64 with SMTP id 6a1803df08f44-6fb39e51b7emr10142526d6.40.1749731686469;
        Thu, 12 Jun 2025 05:34:46 -0700 (PDT)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com. [209.85.222.178])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8eabe70sm34572385a.57.2025.06.12.05.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 05:34:46 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7d3939ecb7dso91700785a.3;
        Thu, 12 Jun 2025 05:34:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUdFztynFyr3VNJqCnSTDTjwU18hpKq2+brppVl0PRoG5fSywVc9oP7OSMFjtZPLnV31LTcE+g1A5muAzI=@vger.kernel.org, AJvYcCWdKykHP21sChuXDzmDe8MHhRkk38AafyFg2HQh78NbLL9WjzUXZ0N7azVFFK4e8XwQIx6oU0xhgcc7DQE=@vger.kernel.org, AJvYcCXHpd0tRLTkVuYEYz0ERob7MrGekBe3CppqlD+FR95aduObxlh+/uAQdPRBAvXXOONYHPdyjQV26ak5+pNTK0qImt8=@vger.kernel.org
X-Received: by 2002:a05:620a:2953:b0:7cd:565b:dbc9 with SMTP id
 af79cd13be357-7d3b369e445mr372396085a.26.1749731685801; Thu, 12 Jun 2025
 05:34:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506104731.111876-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWhwJTbJOBhKmC9YUaSebBg-9m7euqmxqJLCXdr6++siA@mail.gmail.com>
 <bdd989b4-a572-44c2-ae7b-2c445c09fd7a@linaro.org> <d05f2c03-fa86-4fc6-9b81-1a7b5592c2e8@nvidia.com>
In-Reply-To: <d05f2c03-fa86-4fc6-9b81-1a7b5592c2e8@nvidia.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jun 2025 14:34:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX9NzFvsOv9eT0t4KVNufHSqVEht7yRbrt0qE49WgHpGg@mail.gmail.com>
X-Gm-Features: AX0GCFtVgQikSSiKAPvkGq33v0M-ImHzyr3NJwP-bYJMvcSTiP6kAXgBA_LZ8eQ
Message-ID: <CAMuHMdX9NzFvsOv9eT0t4KVNufHSqVEht7yRbrt0qE49WgHpGg@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Build STMMAC Ethernet driver into the
 kernel for NFS boot
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Prabhakar <prabhakar.csengg@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

Hi Jon,

CC Arnd

On Thu, 12 Jun 2025 at 14:20, Jon Hunter <jonathanh@nvidia.com> wrote:
> On 23/05/2025 12:54, Krzysztof Kozlowski wrote:
> > On 23/05/2025 13:39, Geert Uytterhoeven wrote:
> >> On Tue, 6 May 2025 at 12:47, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> >>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>>
> >>> Enable `CONFIG_STMMAC_ETH` as built-in (`y`) instead of a module (`m`) to
> >>> ensure the Ethernet driver is available early in the boot process. This
> >>> is necessary for platforms mounting the root filesystem via NFS, as the
> >>> driver must be available before the root filesystem is accessed.
> >>>
> >>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>> ---
> >>> With this change, the Renesas RZ/V2H EVK board can boot from NFS
> >>> which has the DWMAC IP.
> >>
> >> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >> i.e. will queue in renesas-devel for v6.17.
> >
> > With my Nacked, please.
>
> I was surprised to see this change in -next. We also use NFS for testing
> and we use the dwmac drivers. To date we are explictly building these
> drivers into the initramfs but I noticed that that is now failing
> because this driver is no longer a module by default. This is easy for

Oops, sorry for that...

> us to fix.

Good ;-)

> I do agree that if we start to build every networking driver into the
> kernel it is going to bloat. Yes I do see the kernel image growing
> regardless of this, but nonetheless it seems better to just build as a
> module IMO.

Not _every_ networking driver, of course.  AFAIK, making network
drivers built-in for systems where development is done using nfsroot
has always been acceptable for the arm64 defconfig before.  For things
not critical for booting, modular is indeed the preferred way.

BTW, we have other low-hanging fruit to fix, though:

CONFIG_SOUND=y
CONFIG_SND=y
CONFIG_SND_SOC=y
CONFIG_SND_SOC_SAMSUNG=y (Krzysztof? ;-)
CONFIG_USB=y

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

