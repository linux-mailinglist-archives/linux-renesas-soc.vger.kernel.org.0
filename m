Return-Path: <linux-renesas-soc+bounces-24581-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFFAC58F5F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 18:01:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A162B4220F1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 16:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2F936A017;
	Thu, 13 Nov 2025 16:38:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DB536999C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 16:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763051925; cv=none; b=jHRD+bS1AfojJ1mV0vkQZCsvoEdSUIQbo+2Kx9DntNTZGnRUAS4KRziLX227EDY3QyBhIodaTawFu1TTiNX3C6DCQNe1qPvSX4L3SsShIKjOuyywHjWd2S2QHoumqd5+LNlAZD96k+agWH+abGgN4q339eoSgkocwHOPKRM8IwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763051925; c=relaxed/simple;
	bh=6POMRmRsIFBjMD+KOp5/v8EgPR8+GZSyR+y+p1dAs5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RbRdytO7uqv00MMZbiwbKpNngY6k46MndOgYFNwxAzHw1dRhPJugEamMu2AiyYGmfgNl1VEmF7yjTPeQfcld/MvMO92M+kDSD0o+pkgKDwGLHZ1lTSbavPAOJRHF8lhBjFWU5n4dvUsiyfcXdJkwUJrq/iuWziYz4+znow6Woxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-935241a7a0eso520016241.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 08:38:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763051923; x=1763656723;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=958YNef+Bt2Q0WGZYn2Q5QLvs3OwYQ/fTXGUrCIU6wE=;
        b=XO7zc7TzLSbIQ85IgDJJ/LAbk82UCyk6vbknOpQGWAbXDOMgNVQJ10TylB/AKWDe6w
         wrm5TxXbF84CKucVAD1kYBoo3bRwGwZQkD23tx5TiQJSvkEbcSvYNkjWZ4jxu9G0Asdh
         53jyAGtDSxz2SU3DMaqx9rjTck9s+AvLtJpTNIb4r5kXSbc9pJuV+lFtJOiYy7xeagg/
         RYVF8KTdVDydJR0TbkGSgzNDoAhF88nXCsbB+iKDahALr8uR0EiwGwmqhziBAaLqFen7
         +kxNVLNqYFFE5EZGALw6fwGfN27QAil7gpTff9GT7DMYXg9IJIeuk+pPc/f7IM4dPgdY
         67Qw==
X-Forwarded-Encrypted: i=1; AJvYcCXUFr9b0ptyDvJJA2jvnPiOznmgXteJypIKEgQDsKnDpSj0VsllerP2ypLWULKjFwEPAF8yJUzNIuXi9oAcAln3xQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqcGJJhsoPo5jET8Ila//zT+U8ChYZmw/ziVSTgGyv0aTLn5vJ
	gtBakBxp3kmCB4S7cAhhAereqdPfUecGWDsGHKWtG5Huz5ifzcOC/Ys4NOyghCKy1m4=
X-Gm-Gg: ASbGncsYlNBjvn0zZ2vAdUXR6pGNx5YybwwmZwRlXNMAmMH8+g3qpg09DqrjGvkjWX9
	oXrmVkTbm+8AE6MoFiQKsoOdrMZuOy4vRr9Owu6bQVL/mq8unV3QRSn6tgX3e/sOkcU/HVyyxeV
	MjcKCPyaO8Phowf5gqIkHX0vt7NGUvON9J7eDTz5pWMsDnzgYI9s39n3KWn6VHpxmq1FQCpEGMo
	IowW1yvLaFolwbY4+Xy765jGT8m1rIPGzo4yBfn6JxcCM2sdKHxkloisymEPHjKZWCjo86UJf3v
	j1+WVLSI4sIfMiQps+g4aap4ldrjNLh9isFq7+K9kus8he2JB95yZg9kySsGIYOKACZCJ+LfRKd
	rgRgZCnWVp6gdM3H0ggF4X0h/vY/k000/a8oNMISn4253CH6+BjWp6m1IB4uaUH3ovEBlvW3ClL
	IUdDpiJ3p3dWss4Qs3WoRmc9sY/BbnWfNIOmfcAg==
X-Google-Smtp-Source: AGHT+IEsP1YiqH1QoaEMR/nhwOVwIYTj2s2MfO4k5owx+b2MlcQMSRDFD1b6nOUzDNa3bLN9eN8mIw==
X-Received: by 2002:a05:6102:5088:b0:5dd:b2a0:ac6a with SMTP id ada2fe7eead31-5dfc557ae99mr179124137.9.1763051922935;
        Thu, 13 Nov 2025 08:38:42 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b0f32e47asm830973e0c.1.2025.11.13.08.38.42
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 08:38:42 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-93729793469so603625241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 08:38:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUV8E/Oau9ZEyloKDbd1XW9fRpk5oZJXqHDoklINwhH9sKZWQVpagQvNLqrcGfL3aBGFedNoEyWSoCXwb7I4kglZw==@vger.kernel.org
X-Received: by 2002:a05:6102:4422:b0:5db:ca9e:b57d with SMTP id
 ada2fe7eead31-5dfc561815cmr167985137.19.1763051922603; Thu, 13 Nov 2025
 08:38:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106080758.36645-1-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20251106080758.36645-1-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Nov 2025 17:38:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWmzY24PwTg0=oFU3ZN1wrgDpKvnQJ7=zDZvxpx5y5K5Q@mail.gmail.com>
X-Gm-Features: AWmQ_bkzY_8MEzmaJCoKDY8pOB5ThYiIkB4YoEC3TzmpiYwCpzmuuMs1N6fl8Y8
Message-ID: <CAMuHMdWmzY24PwTg0=oFU3ZN1wrgDpKvnQJ7=zDZvxpx5y5K5Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Refactor OEN register PWPR handling
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: linus.walleij@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	biju.das.jz@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pavel Machek <pavel@denx.de>
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Nov 2025 at 09:08, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Extract the OEN register write with PWPR protection logic into a helper
> function to eliminate code duplication between rzg2l_write_oen() and
> rzg2l_pinctrl_resume_noirq().
>
> Introduce rzg2l_oen_write_with_pwpr() helper that encapsulates the
> PWPR unlock, OEN register write, and PWPR lock sequence. This helper
> must be called with pctrl->lock already held by the caller.
>
> Reported-by: Pavel Machek <pavel@denx.de>
> Closes: https://lore.kernel.org/cip-dev/OS9PR01MB16368C765305362F5F4132759FFC4A@OS9PR01MB16368.jpnprd01.prod.outlook.com/T/#u
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

