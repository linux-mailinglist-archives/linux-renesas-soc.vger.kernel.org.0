Return-Path: <linux-renesas-soc+bounces-21697-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F4CB51276
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 11:28:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE0DF561E3D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 09:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3788313545;
	Wed, 10 Sep 2025 09:28:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F852BE7B1;
	Wed, 10 Sep 2025 09:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757496483; cv=none; b=OV9ccKkh+d4ZEkOxdylWUgQ3LPqVpBPFJCWMh6XkrEHTT9OA5EdBMr2xSMji8nukMXoorAA5+Abdpf9FEzAvNO8O22BN1qfn/kUUtt8Fy2g94aOY7Di9F6B3JW2kL85hzOYWGZixB5Z9qncnTbXdtXGqmr2nyH2yBPhnHlBk4fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757496483; c=relaxed/simple;
	bh=aSFFwup56Na+mc+GbIhVEfY7AY/MM1tKLA8ABojdkhs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aXkl4qWdcNe4cFz8HKx67cwf5GC/Smyc8tdlujD8vXk/KEzRZhMIkIyPiq0q4irVdYvpEuGhU6E+EQPHnJweLOHYKbtGyUDPCDUvEUm1sbsqGaezDhkvvMa17DTCgVQrW14QaT7FI4o1w4TN8LLB92jUhuKLQIoJMibs2Q5X7W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-52b66993757so2098597137.1;
        Wed, 10 Sep 2025 02:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757496480; x=1758101280;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cM4pW56c+6+KnwUEMEDed5wG5Vyjqd+monXczey7cig=;
        b=GVHv9LnVLLJF+qyJkuVsGDPZbjKOmG2QTqL06KdjE2MSSLr9wloP3XjrV/gq+dqwYk
         2yLb9UImZx8u/naGPh/cQ+OcVp3qCPi0xOI2daly9N/6Xaakjizjc4kE0BLGaNmmdXfN
         NqHM5fyS6+96F0T/Yduc8hqjFM/B2CL6yneVPI9D0mzpNIVj0+TkHJkUPuR46woVfBWk
         yRq96wRMif/3qfY7wV2Dyx33YWj99LYRtImWermXWj2EhwWJYp3XbXHaarVsavesjXjT
         hXDJqeyvuVuUyvpQSPuMO6g49J6Q39Vya8gPxi8/XiGgKtA4Dk/l3mpsJsUMLT6xnO8u
         f3iw==
X-Forwarded-Encrypted: i=1; AJvYcCVOG4Jit4bq4pvceF3iQd4D3tZLVCeOs2IUz/GaW61PIJc4DtQ2HswBVX7N2Xb5ODTLbUCXR8J6QPPUYgMd@vger.kernel.org, AJvYcCVjxAN4fNZa6OLtv6OaxCzpztOyPCGNBlxVRgr2MX9LpQ6IyGHCyqSyA8S7Vqy1TuWgRArGvmT2j8sUtTpHXI7Uo9s=@vger.kernel.org, AJvYcCXsG4IHVZ3arCgE6l7yDlVHRwYYXbOiOzyn+1mUAogEwt2R/92sijAyECascjysmB95q1Bp4xowt6E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0l0b3t5+qfflsiBhE4FFb+Ysanz+JXaMRafU3lw8gI5Xj4HYS
	31jQ+48z889g2O+lDOiMKDZLZwL0o7ncI+NlOKvZKUO4oE7UExssitu6puKp0bG5
X-Gm-Gg: ASbGnct7ZJCTmkblmANnFikCeXk73Zd3pJuKSYwKQKCl0AQekN7S1SIXTs3uqrth016
	tf4mzB56uEmE5SCJys95wAhFlEIop7foaTQzVn2hyzSSSKFBRONQ3ClnsFFEiWRDu20Z876T0Uc
	2chzF2ZNoMm0tAwTfsG9bTOq2ImbJGTGtvp18FSk773/RIBJ6ZgLI1xG/xRw2uAP626gS3+n30Z
	2j5SHMiVaST3A/Jy6kI4to0IQ2uJCbcWCgFFfQG1oDbM4PQc+Qxa6+CkBBCf+yI1B2UBUfP4s2a
	LINwiwk/KBLiBe/lqeGoyC5Sl6wEaN3+/S2R23mOf3h3OcJlSj9Ot3zsG6uagCvBhwg36IAksSF
	3pZeWj1Bp0v6ncsPY3dYGsrrId/nq8mJH/CjUVl49Co5C71XnOSfQCDVLuTZY
X-Google-Smtp-Source: AGHT+IHzB84IcAyytbgaKJ+86NqOTeA9Qtu/aypEW9Q+LOkVuQF2/3aUghtfHEfRZ4/OB2ts0cJFGg==
X-Received: by 2002:a05:6102:291f:b0:505:ff14:8e0 with SMTP id ada2fe7eead31-53d0dbe86a9mr4633421137.11.1757496479960;
        Wed, 10 Sep 2025 02:27:59 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-544912fdff1sm13598359e0c.10.2025.09.10.02.27.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 02:27:59 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-52a4e220b9bso834213137.3;
        Wed, 10 Sep 2025 02:27:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUoxgHXFkFNMBfPUMi16h6X6qvuDfR1FmhEBW56HP0c9FuvgDww1rHnlBMT2dEcqAP2E8FQ1rOx4Ndv07DV@vger.kernel.org, AJvYcCWpowdlNDzbfQGx7QvY/7JBKVJOeb7tFOrA18PTxUNmaW5cItKU9XgLVCKicTfJEpO8n10DwWoVfxc=@vger.kernel.org, AJvYcCXB9dH8DLzoq0+SiELJaF9RmWClVL4/kGCYSbeI7LEWBc6aoge4Mj4C1I9vKcKttZMv+P9D2En4uY0mjLNDDTX7Igo=@vger.kernel.org
X-Received: by 2002:a05:6102:5803:b0:521:b9f2:a5ca with SMTP id
 ada2fe7eead31-53d0dbe8686mr4377472137.13.1757496479003; Wed, 10 Sep 2025
 02:27:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87segx256a.wl-kuninori.morimoto.gx@renesas.com>
 <20250908012810.4767-1-chenyuan_fl@163.com> <87ms751z28.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ms751z28.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Sep 2025 11:27:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUYFbWCK=SKDK8cKSsiYkorwfaeoO+cf=f2ERftLY=Yag@mail.gmail.com>
X-Gm-Features: AS18NWADa4v7ZheOwfPM7H9Z3s9duog9cwBJwfAogeGSU-l7LrKIHl7D5DA-A_c
Message-ID: <CAMuHMdUYFbWCK=SKDK8cKSsiYkorwfaeoO+cf=f2ERftLY=Yag@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: fix memory leak in cpg_mssr_reserved_init()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: chenyuan_fl@163.com, geert+renesas@glider.be, mturquette@baylibre.com, 
	sboyd@kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yuan CHen <chenyuan@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Sept 2025 at 04:02, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > In the current implementation, when krealloc_array() fails, the error handling path
> > incorrectly sets the original memory pointer to NULL before it is freed,
> > resulting in a memory leak during reallocation failure.
> >
> > Fixes: 6aa17547649 ("clk: renesas: cpg-mssr: Ignore all clocks assigned to non-Linux system")
> > Signed-off-by: Yuan CHen <chenyuan@kylinos.cn>
>
> You want to use ${LINUX}/scripts/checkpatch.pl to get maximum 75 chars warning
>
> Patch itself is agree, but I still don't understand the git-log.
>
>         incorrectly sets the original memory pointer to NULL before it is freed,
>
> I still don't understand this part. which part are you talking about ?
> What does this "original memory pointer" mean ? And what does this "freed"
> mean ? freed what ??
>
> I guess you want to indicate is like this ?
>
>         In case of krealloc_array() failure, current error handling just
>         returns from function without freeing alloced array.
>         It cause a memory leak. Fixup it.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.18, with the patch description
reworded.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

