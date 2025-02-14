Return-Path: <linux-renesas-soc+bounces-13157-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAB2A35B0B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Feb 2025 11:02:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7818B7A3971
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Feb 2025 10:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F42C21CC51;
	Fri, 14 Feb 2025 10:02:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0C4186E40;
	Fri, 14 Feb 2025 10:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739527353; cv=none; b=ix5Ir7RYkP2Wul7pxt0x2OMJgVOGz3vDSbW4NdY5zADADl+HcXf/A3CPn7x1gctxpoLuE+39cKrSAZbIqSDn82k7OHqjMJgiWI5cQwFfNyFox+u2nOSrnJ7HC/rp4ruh0Jbj2c0lVbHQkl2I+Jl0IOhLu/7RIE3mYdU2d6WLv4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739527353; c=relaxed/simple;
	bh=JhfJ/xemf5hEn+B3JYxhTSlRToZIjtBcYuHFPAzmDQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S60g/WeYRDTraZ3e/v+Ly475iUexjcbMv2RJ9/I5vkKgNvM549fRrkiyVm7BugNHyRMgaKjCYmHPvCBcj/kGM1aZGoAPjYf/jA0XJdO0hamwn/QiIMkgu5vMkD2CIgMZFm15w+yQFMXN/WdkT3NdO02FRQ5QcE2q5IDbeloOYk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5203bbb969cso536710e0c.3;
        Fri, 14 Feb 2025 02:02:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739527350; x=1740132150;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zSu4DvWv010H270v34dYFFy5+XnYa2dAhDT5eUP1bFs=;
        b=iq74xe8S2IKIeFAHdbwsbxybiIv2GOPi1rVHjbO7OPlO3sYyrQu4e3uvUWovXiLnw4
         At9AaWzN9GfamMbaE9W6mtsrFuWNcL03F49fg4DAfVMk7co/WebT1Ds+8p20Tn39LMoG
         JeiRf3HTpus1H7YEAl4LAmvw28PvnQoJRDRvgRrEDkvXFj8cPVeLvgocUHQu+dTnQ/gS
         e4pMfwXCaLp1FvBAtBAX/lfayY4ZmSgvRfRo9/NBzQvWu+0m/nHSLLPZVqFXoTGS/w7L
         xo+orAKp3jH6od4liKmRZJ/U6FIh7aaFCK+LI7AIgf7RyEjIhrqC65HaeTszy1LsJY07
         tHcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAhLXadfFoBlDQe/lnDnBNwm28YbotZhV7R2JScgL/Mof+fyU0FXoo6WV9quQd6gbTN1SKUC1/78MaIv2yB82zbvQ=@vger.kernel.org, AJvYcCVU1M1AJzWsuM/gvTVv+Lz98l/M15/8QCdxmJrQDtgVNsyInzYinqK7CCCF4zRovOlIOfnHTdtG2is=@vger.kernel.org, AJvYcCVmFctTyg3Hggbz7szxBXyCe5oiXt1a0c847dZHMEus3lWq/JrNTsb5lhVF/l/5OPYoBhH62RJfOX1Sy75R@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6GvK8AcEjJOkgMslLPPIu0kD0kQkfoPZ+WZCJRf0+9pO6MKNZ
	iHrkC7RcLZtLcDqUtJOKz4CVBsPs3HqjYTtlpvdUBP1o3xr97eTDotHPexXp3LU=
X-Gm-Gg: ASbGncvh/yIzKLfF5zJTiyggujW92jY7lnPZmawDkN+QpT2bFaPSd8lIuKMcwvMI7MC
	uXpQMIkRlc1kMeu6ZjCxtn6/7lWHO432yaYFVGJOnSIZs1F5pUXmb95ovw/mj0iOJDdV0fbtzh8
	tF1NVX0sfzWrkrGqBFuORGgTyebiYSIdYlIZvhnnxIlXYBaat6z76XcVuitpr+n8QidXDeR9FLa
	MkwL1KXOGzAXVBVaKSXlcaUPfb/SfbTxb+WAtIWV7YkfqV/580jsFf+THWRId9wztl5nru7u0Id
	mYuzZsA7Ehr3YguQgLfTilt2OD1IoM0XJl8+rQTYALZSl8s0tRc7xw==
X-Google-Smtp-Source: AGHT+IGuWLy5kANRaOVyjG0tnar50nhcO391oZ3+U/xymlLK8DM05oDVMXTmbADmGQMuYDSF3mdAGw==
X-Received: by 2002:a05:6122:7c7:b0:520:4539:4b4c with SMTP id 71dfb90a1353d-52067d3efd1mr9353290e0c.9.1739527350496;
        Fri, 14 Feb 2025 02:02:30 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5207aa60600sm526239e0c.13.2025.02.14.02.02.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 02:02:30 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-866e924f735so525314241.2;
        Fri, 14 Feb 2025 02:02:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVHo4oHEPxMGbzDKRmLmJ1ZNBdqwxUzxMFCDK9KREPT9PaqV+bre92pJ8pu8tk3c+EILvnbc/8X7SU=@vger.kernel.org, AJvYcCVccfvaHQ687KnstZXRaROfBFsHULBoDBbRJLwrJGi/fQPsMI894tiM64eu5GuosiuyV1GP9BIWx1vQbKSv@vger.kernel.org, AJvYcCXS9BKXhiVtyfSSLxxbYIcaCkHXPPAhE4z7QRdBPo/pV/BxUgKBpMf1X9f19ZDjR6/Tb+9na2B4I2C0ej5xExfULOI=@vger.kernel.org
X-Received: by 2002:a05:6102:e13:b0:4bb:d688:9bf8 with SMTP id
 ada2fe7eead31-4bbf2221a24mr9261052137.13.1739527349879; Fri, 14 Feb 2025
 02:02:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211105603.195905-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250211105603.195905-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Feb 2025 11:02:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdULQ03BRuXyB-Upa8+zwSAd6rKPkzWm9BQCXjjXb-Tr4Q@mail.gmail.com>
X-Gm-Features: AWEUYZlsz7XVMYiuBo1xlm6v-a2FrYjtwXrLlPVaaTiJqKiwxQ00C-AoLRGkSvI
Message-ID: <CAMuHMdULQ03BRuXyB-Upa8+zwSAd6rKPkzWm9BQCXjjXb-Tr4Q@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rzg2l-cpg: Update error message
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

Thanks for your patch!

On Tue, 11 Feb 2025 at 11:56, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Update the error message in `rzg2l_mod_clock_endisable()` to provide
> clearer debugging information. Instead of printing only the register
> address, include both the `CLK_ON_R(reg)` offset and the corresponding

Indeed, printing the obfuscated virtual address is useless.

> `clk` name (`%pC`). This enhances readability and aids in debugging
> clock enable failures.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

