Return-Path: <linux-renesas-soc+bounces-13431-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DBABFA3DFD1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Feb 2025 17:07:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 495337AE603
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Feb 2025 15:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7AC11F03CF;
	Thu, 20 Feb 2025 16:00:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE78B1CA84;
	Thu, 20 Feb 2025 16:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740067221; cv=none; b=vFtRbTM50aEKVGm45wc3EYcN7eHSerGqHlX/pwtc7/9+bELH9IrLC+NcSQPx21ggLB66WV0ogQ3EGug/3gdIpfgPPclTeMxQS4MSu41dV5zn6nmNRG0RLVrnuDBJfChnBe8561X1kRJPJW2TvcXpoD4uvpXgyl4beKg/u2fbrCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740067221; c=relaxed/simple;
	bh=lITit8E8HgMiorpzx6jMrHL0bTT4WYvXtwGYjILa31g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gh6M5k5DvEJUWEwUCscFLzOufhwNLuHFdi6jiE68OHHN7/HTlsOFiy3S7GEOO6dThsokvheaLcLRkFtd8V7B6vXql+hQb0KJv4omakMyaFe78X8bdCXo4PudxyL8DPb4nqSE5LNeB/VbKrnES43vVOflazigNHiCwONPbX8pW4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4bda3ea7076so751639137.0;
        Thu, 20 Feb 2025 08:00:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740067217; x=1740672017;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8DP/IzhvLEYt7X5yzWJGnuxtGhjL06pFsb15h3dFGzY=;
        b=owpDX88XxyCPmze/u1UzHJjb40GNmrJh1h0fQWN4/qdxi9jPWyG9rER80T1IMBtrY3
         IZeOJS7xzOtOSp18p05uF5e4eZCN1wVZ9RjPATQoPqZEeyGuTXWN/y5FBRj6crnGOPpm
         C7Y/m8LqGPc/NSYC/EBvM5fSUiPxw+jtg55lJo72hdiy0stzLpMXhPQm/ux2ZU3HBM49
         7n0fOucF2Taaiy45t0PEoiDK45b0XjaJP3wrq7OdFnwEEBhQJFyumL3zEi5zh/9c+PW2
         RWFSon4CnCKppVtslm7HmG9sYegS+KS/+njo9pPTBbm+OuctVuPe77NQBPlQklZjH6yJ
         FWRg==
X-Forwarded-Encrypted: i=1; AJvYcCU8R27ypKL1fPzxeK9sa51kXLHzbCvpdBfvdJqWhHCG7T5f3kJuXJvRALnNtMqdT/Q07zhMchUk/uBNti4=@vger.kernel.org, AJvYcCWzMb694+LoMLARfDmc55ZsqqN2xKD7lVBA6MTIzmWR1jBXEhxOF/RNuWkACfK8p9vO+EyMmwl+c2koJVjVtIaBJHg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKG0z5FItZnp8rtyGNT+Tkl3WKEzy/Q6pjsPg444EPxrbOUJtP
	BuqeFeC1e8IXyeyLOq2gdW6QDr25qxptsFanfHKirV1kpaY4GrYpK7rcAz5w
X-Gm-Gg: ASbGncttscPaRcQcgyTdZ1whOlx8+XwQcrdsNoy3naOWbcZf7sSmyzTmiZLwmUdySUJ
	+DWqVQUsGrXZTeQN8u6aHRHDYmRSpJget3smGUb4K/TlcYLmjDQLeFNnTW1u+lzuVgsk4oc8I1S
	kqsPZ9BxWxYzOBs+GglX/Wub6meXTbYMXSI+z6Kej+rCI4wDFlAHdqvk5rRGKq2ZpwdkwcfcabW
	RomuAlsAq1ERuLaiAQqTlSibSUK2NMYgap/fNBT5wSJXmB1VZWSLmN01YN9yzI+yjXn2ASmds7C
	CWFEnPj9qaPGG105JkhGgQBhl96STzt0/iQJbqtNMpBEVGEyB6WfCg==
X-Google-Smtp-Source: AGHT+IFL444QRSN4eUstz1CBWE6gNgO4/kChxX6sG+E1dTMbjGSg5oudtsH0eO6qwr87Kfx28ap8qQ==
X-Received: by 2002:a05:6102:441b:b0:4bd:39c7:804d with SMTP id ada2fe7eead31-4be98bc9720mr1953861137.0.1740067217139;
        Thu, 20 Feb 2025 08:00:17 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4be52eee266sm2238343137.24.2025.02.20.08.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 08:00:16 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4bd3989f027so670258137.1;
        Thu, 20 Feb 2025 08:00:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWDOV+d9P7A7aU63bdujX54PCi4P8nyw53A/vg5CECsPld5xEYAEypq3CxxmWAEcDBU9c8e2RMtzEufT+S9oS8CY+8=@vger.kernel.org, AJvYcCXzTV1z5em0DvSa5XmZCz4tVpDJ8tJSqH47R1S5QbVzLQAKWgL3Q1OCjlcA+0zONvuUXTxKVA5P9onSBQg=@vger.kernel.org
X-Received: by 2002:a05:6102:5c0c:b0:4be:5b97:ea09 with SMTP id
 ada2fe7eead31-4be990d7724mr1561355137.1.1740067216583; Thu, 20 Feb 2025
 08:00:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250215131843.228905-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250215131843.228905-1-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Feb 2025 17:00:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW4sN6x5C7iQgiZD=Vmzg=BA1v+WjS7aapXmuM2_y8JvQ@mail.gmail.com>
X-Gm-Features: AWEUYZnZothNAEF-GE_ObB0k-KNQl8S7t-UJTvE2SkEwVyzmqKOynwhwqd67DpU
Message-ID: <CAMuHMdW4sN6x5C7iQgiZD=Vmzg=BA1v+WjS7aapXmuM2_y8JvQ@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: rz-sysc: Suppress binding attributes
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: magnus.damm@gmail.com, john.madieu.xa@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 15 Feb 2025 at 14:18, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The matching data for the rz-sysc driver is marked with __initconst, which
> means it is discarded after initialization. Because of this, attempting to
> unbind/bind the driver through sysfs after system boot can lead to "Unable
> to handle kernel paging request at virtual address" errors due to accessing
> freed memory.
>
> Since the System Controller (SYSC) is an essential block for Renesas SoCs,
> suppress binding attributes to prevent them being exposed in sysfs,
> avoiding potential issues.
>
> Fixes: 1660e5ea6a3e ("soc: renesas: Add SYSC driver for Renesas RZ family")
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

>  drivers/soc/renesas/rz-sysc.c | 1 +

Looks like there are more opportunities for similar changes?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

