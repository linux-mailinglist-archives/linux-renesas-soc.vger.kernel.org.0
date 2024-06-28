Return-Path: <linux-renesas-soc+bounces-6855-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA44D91B848
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 09:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FEA41F228A1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 07:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCA831422C7;
	Fri, 28 Jun 2024 07:28:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD243140395;
	Fri, 28 Jun 2024 07:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719559701; cv=none; b=VeirB5vKAUxb/kgwG0o+snEgKtN07aAPibmb1hVGs/xT0my7u+PiDpnyhAc6ZDnyRxlqid0ki1Lpo8QabhFu5500aKNWFX1DplEYHtOkMyt/8V2N6scTM595Gx7y2LG532u2qC5neJCs69r4vZjhrJXKn8N6qfgMV69EyjWvRNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719559701; c=relaxed/simple;
	bh=3MZpXyOu73Fasw3IIRVGXYRsvoswceUbswoCfP0Z9mo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R9odEqcDPaIozRV31o2flEh/Wlo7zGx0upMLhIysMg3W/Xo7kUd8JOEMECyrSRiEnHxBTprEfk6pEor4/yqqyXmrPVoMMshtQKP5DStlD/rJUsDByAqBP4DFPYKv+E2bRK8m8cYyTsiVVslqAaxvE+GrUMoYs5lnfV6AdVng4XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-632597a42b8so3350477b3.3;
        Fri, 28 Jun 2024 00:28:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719559698; x=1720164498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gyxC+GBJtHsOF6k6IM0Q8IHAoGfupC4Wy/5il2gwhW8=;
        b=AgUwIhIvA3GQrxc6zCf0XylFNH6oEJ0ucPX42SP/UnIXpVA2xJPZ2mC05Z3Xti9mll
         DbsTVgYgtdP/X/lAwXPe+LifzmQ4iN50RhxcbZhE8HI8NN9lgRnDJCrGUafoIYKBLu5D
         lVchYnbegRrKHA4sujFwQrDkWaeVoCQVfupzZkEXXP5gWHCmC3SMEvpIDXXVR3RZ/06N
         8rVYRtA6NcdEuZ9MZLh8qJfgNtrA2U2+9WkdHpSR5ms6/GKqx/CXebR2SaB3V6kblRqs
         TNuTAV3gFLYnTzQvF/QC9N5fndNFWef+4OlbQrMDusAD6H8KvFlI9QCpI18R9YezsAL/
         Peow==
X-Forwarded-Encrypted: i=1; AJvYcCUp0XHgJha/j4GgzWq1eQhW2iapgA+k5429taqM+5SBV+YncHyYt8UOVaQTiyam8rCWsmX11m5GE6771qidvUQ+cWBT64U6pC3qjacRr3qLuelPq1nU+T+EdC/M8+NpKIoKaOm8Oqt4shR/S4Unpkc=
X-Gm-Message-State: AOJu0YzSj32XV/jZMgL+aUXWq1wU4TI515IFo3ct/GY9y/rlDXRjzbRJ
	nLSCOn1g0DY3Uh3UPPPhs/XnRjP2Do9EMpxbhc9c0o1uHEQR+fASk3H1Gx0T
X-Google-Smtp-Source: AGHT+IHbqJk8YO5spYSoW8TU2DTdQnM2QdeXijlvmAl4YhXNF9HbIWFZd3/Oh6GLG2kEGkNGqAbWBQ==
X-Received: by 2002:a81:fe04:0:b0:64b:3246:cc24 with SMTP id 00721157ae682-64b3246db8amr3524667b3.29.1719559698364;
        Fri, 28 Jun 2024 00:28:18 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-64a9a8037c4sm2475247b3.65.2024.06.28.00.28.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 00:28:17 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6480542003dso2703607b3.0;
        Fri, 28 Jun 2024 00:28:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWnfC33rh9kIItBF7WECTJG6jSoLLpNhf7UJdL0hz6x4mnfFecMQXYXHSzc0/i4oiU/nf+gSM1mQLUvDMIVkfJikb+CMYxcpso2FV9VUHAVOAdljLY0fUEZWUzeEIfdNnhIl0avdiFWmAVQllz+qAk=
X-Received: by 2002:a81:a785:0:b0:63b:b3b8:e834 with SMTP id
 00721157ae682-649744c0ae3mr45367857b3.32.1719559697160; Fri, 28 Jun 2024
 00:28:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628052010.31856-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20240628052010.31856-1-yang.lee@linux.alibaba.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Jun 2024 09:28:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXyqSHAo4LTy6t7=KSmi8Po0Cmp-U35py32RmCA-_spJg@mail.gmail.com>
Message-ID: <CAMuHMdXyqSHAo4LTy6t7=KSmi8Po0Cmp-U35py32RmCA-_spJg@mail.gmail.com>
Subject: Re: [PATCH -next] soc: renesas: Remove unneeded semicolon
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yang,

On Fri, Jun 28, 2024 at 7:20=E2=80=AFAM Yang Li <yang.lee@linux.alibaba.com=
> wrote:
> ./drivers/soc/renesas/rcar-fuse.c:124:2-3: Unneeded semicolon
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D9441
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

As I haven't sent a PR for this yet, I will fix up the offending commit.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

