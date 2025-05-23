Return-Path: <linux-renesas-soc+bounces-17421-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A70AC2014
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 11:46:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C36E67AE09D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 09:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D23E226CF3;
	Fri, 23 May 2025 09:46:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68847083A;
	Fri, 23 May 2025 09:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747993561; cv=none; b=YwD06a7Uui/h4Rtgb+QYD6Y5kGC9KUPRcySi0xusmMGtHu6a/geck45eUGF/KvSnPqaVwe4/g9SCzLEO5eul04oCKoSk+SyFFE+M4m1aFYUjjXixCrlYrsqWiSMfafQhswzmI/BFyybkplQu1e4Q+x9J1vWAy1EVU6hEUeE/F8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747993561; c=relaxed/simple;
	bh=h/iL4fUsYOZZ8+FO4kARxrN/ltMajuDCxzO811uGr7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k+Rz8AbPW/9941NUuIqaogUEYPH+NS0qDLUKdAINsYNXCHEi9UFuAYPCNobBJi96iylQvcpxz2xLBHu/j+7SvCE7FmUMqeDWOZI8v9YRTMx9Rbs96C02vU9Pzo/55JFJF+fwHGn7mGJiQgkbGU+NgHBuaOGaKEn1mCeKT93mXVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6f2c45ecaffso80387456d6.2;
        Fri, 23 May 2025 02:45:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747993557; x=1748598357;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SIMAXgcvqIyXNjRhtR36j5HZ/vtO8c2vs8eG0bQl56g=;
        b=rugjPyo1mw8srCn4jLPFnXsCz2JrpXTQoHepaJSOPAIsPc7+Mx7+RBIzXQ9cYPd3NI
         /MWsH4e54OUzEtpuz3iWLiTERk7hGRGUJ4EnUBaVS8cKXwyz0hN0dEVuK32RbJXc++Xq
         OHFimF/6W9ZPJzaQmymhr+A+LzulB1tddniVJHJ2gGoGCGG+67cZzX1GHwbnz2ynckVU
         gFW0LDnja8N5Pt9RBVcuLUxrgCiH5B6mL4Oz8Q4DQdq2PXsoTr+pEZPoin77Du0xwD+j
         py/BZhyH6K7mBHGiKDkZMA92ampXu8Q5xPmyVaZmYSMiy5dGmM6ZJvLmj6Nky/1UnV4M
         5C3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVlDoie4QovG19e1Xrjsd0h4fvJZilzUJin7qKTVtAlPeTVB+gMF5jTS1MqKBLohTQo2fJ472bmy/VgyGVM@vger.kernel.org, AJvYcCWsKxJiE909bELwJ/c3mBnfUkejx5+qJv944MLGei/z+Nj9nj1GUI75W5yqX509gJJimheEGZvGATdIekxcXFWJFFE=@vger.kernel.org, AJvYcCXkjnyFT7W7g/Atcx5RVcWigIRxlmyIKHTJY3bQYIRST5rLTTX+zXUz6Ip/HwMUmgWNJVBaT2gatXZwuv8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyS4Bu6eUU1neN2qQ/mNjw4o0oFIMMBgtfxjYyHHhMM1WQF9p2
	96LaEor2zwX56MmPNXfi9fjCKsyldCrJRTV2z/1FSmxUcLEDw+TaLVSbiyfvKFVJ
X-Gm-Gg: ASbGnctCDnyC0HK8RNSsgQvVLsZVAuJD6DRd2plZ8U1dsP4ytese/pkttcjGBLpHCDu
	s0CVmInWKs5jQZaODk2fB0A1vTNAAJlxeapDgdwJ+Tjfpt+PZoSroxjaIxMF4oCcsgPUaqEWa7+
	YmwAUeBlbpwzJqZMNdnwgCloOGmlnDuTb/Wf3udFEwuI4hAy/3fdL4G9QrcJkA5MBhSEnHAeEJ8
	2Xhi3ba/lIfAO4m7ITL3rj5xL/rRgpOt+2u0fPxbV9ax+i0WWj4XUTLbdjnVt5EhpWuEcqMJxz3
	ySqlDnT5cW8G8j5DFniStOjxmcJ8dTCwblZzPmnHVFtnIOgofDu/g0zfKFtvx6zLMalsKoSeQIP
	eG8XPjnztfhKQrQ==
X-Google-Smtp-Source: AGHT+IGPYmJasgQHNO7kkyG+SP4QBwNIGajtpNniX2uoxFmm8E8UpOrL0UZ4bc05vd7nm+OMILMS1w==
X-Received: by 2002:a05:6122:7cf:b0:520:98ec:b25c with SMTP id 71dfb90a1353d-52f1fcc506dmr1452520e0c.1.1747993546068;
        Fri, 23 May 2025 02:45:46 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dba910ba8sm13229274e0c.7.2025.05.23.02.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 02:45:45 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4e15f5a86dfso4390069137.3;
        Fri, 23 May 2025 02:45:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWMzRWm7Y5STgX3984R/xuKHdkeoOSIDXazDZNJa2kX+YpMaWaJ5YFYW/SM3H2xqkS1m3XeF5GptpanXsBJjzn78x8=@vger.kernel.org, AJvYcCWNUoA9Zn6PMb7XhNtuvFM8RRAMd1bm3dMymtWUEXTIhhlxZUXh6Dna+bcDYgct17pjkfUJjNp816gOOJ0=@vger.kernel.org, AJvYcCWeEtt9EI4TpUMMFzngsr8JR7abws8zB36ukoqQ2s85ACHko/JHY+6ZabfitEmJqvf0dUW5uFh43fHFsCL2@vger.kernel.org
X-Received: by 2002:a05:6102:5124:b0:4c1:71b6:6c with SMTP id
 ada2fe7eead31-4e2f197459amr1648572137.7.1747993545548; Fri, 23 May 2025
 02:45:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515141828.43444-1-thierry.bultel.yh@bp.renesas.com>
 <20250515141828.43444-7-thierry.bultel.yh@bp.renesas.com> <aC2yYDpsv7ef9IVA@shikoro>
In-Reply-To: <aC2yYDpsv7ef9IVA@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 May 2025 11:45:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVPn3adKZMiLqoEz9ANNyekmB9WRFyz++49+FeEOkrSSA@mail.gmail.com>
X-Gm-Features: AX0GCFuUcLFh4s5h6nXire-SXOd4MlRuMkr0jYbYBmCHrIk1IOV3brCGtq66p8c
Message-ID: <CAMuHMdVPn3adKZMiLqoEz9ANNyekmB9WRFyz++49+FeEOkrSSA@mail.gmail.com>
Subject: Re: [PATCH v9 06/10] serial: sh-sci: Use private port ID
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Wed, 21 May 2025 at 13:00, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> On Thu, May 15, 2025 at 04:18:21PM +0200, Thierry Bultel wrote:
> > New port types cannot be added in serial_core.h, which is shared with
> > userspace.
> > In order to support new port types, the coming new ones will have
> > BIT(7) set in the id value, and in this case, uartport->type is
> > set to PORT_GENERIC.
> > This commit therefore changes all the places where the port type is
> > read, by not relying on uartport->type but on the private
> > value stored in struct sci_port.
>
> I quite like this approach to become independent of serial_core.h by
> adding a driver-local type. Because it changes only access to the
> variables but not much the logic of this driver. Two high level comments
> I do have:
>
> - I'd go for bit 31 as the flag, though. It is extremly unlikely that we
>   ever need a number in serial_core.h again, but if, it could likely be
>   > 127

Actually I asked Thierry to use bit 7, so both type and regtype can
fit in the existing hole in struct sci_port.

AFAIU, there is a hard moratorium on adding new public numbers to
serial_core.h.  I doubt this field has ever been used by userspace
for anything other than 8250 and derivatives.  The modern way to
discover the serial port type would be to look into sysfs anyway.

> - whatever bit numer we choose, it should be hidden as a constant. My
>   suggestion:
>
> #define SCI_LOCAL_PORT_FLAG     BIT(x)
>
> ?

I agree that would be good to have.

Alternatively:

    enum {
            SCI_PORT_LOCAL = 128,
            SCI_PORT_RSCI,
    };

and

    #define SCI_PUBLIC_PORT_ID(port) (((port) >= SCI_PORT_LOCAL) ?
PORT_GENERIC : (port))

and 128 can be changed easily when the need ever arises?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

