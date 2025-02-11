Return-Path: <linux-renesas-soc+bounces-13052-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F91A30CEC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 14:31:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A71F11883198
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 13:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A54FB1F3D58;
	Tue, 11 Feb 2025 13:31:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BF01F03E2
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Feb 2025 13:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739280709; cv=none; b=qL6btT1K8P+VWjNbOxu1Jc8J6ABCYrgHsL/NwN+ke8+3Fy+TZ837AiDRuMPDSVt9lNWMMM9smoHrHZhFLN3SwhKN5vN8E1UShzVM/WgyQG0INoisISuy8yRRobFi1sti+opUvFejLyOgKSSpkYUqhr3XtDgg67cYJWiSCoxURCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739280709; c=relaxed/simple;
	bh=lkXwy5pKw34VMddVsbPXmr1T3o71xjqFdqLPJHdnDvE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KK/CLq99eKEfXLxNLRx2j+dW/ETCrontnelUdX37a6aSBSk9+XicvUwv/0zwTLaKCewaZTdFSQyaWRywwOLpqI9+N5tRz/BjOQHnGWv1KK2Pga15ZY+EqB9DVA0HpunMdVv701y38muent9H97eT3pylQSbVTm931RLQB4brhlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4bbbab48111so885702137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Feb 2025 05:31:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739280706; x=1739885506;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5LmVlk9PKVVacloptG6wMrNSRdHMpdQuCvtvI6stRSg=;
        b=S+w1N6sBe5NPzxlZy9nDg8GYuhIXjNupQANtag0Un5WE6qAk/DA6FE1/l3DZPmcnsu
         tZ61pQi6aukYwMgBaOAYfR7jdSbO8KJYzcs31XAR3oT3BzE+m5KP1AuA7rTSsKwFydiu
         EXFpvCRcBojSUhLHNAymhAoEl/IHbKBN5xC/fXs2szlJ/HHY28Lc2skNCyt3sZGP3fUc
         Lr0KGvqV3eO7j/KzTWRUZ7qa4IWQmTA0ZG8DsDWk5WVCVCHZu0l+RXnpEEqTN9S6Fz46
         03qR8PbMwoz3JgM2Qt+4Gd9WWr/z+UBel8tQKGLqxmjVbO5xEG0qlAHMapqtw9jtSV0O
         vnXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRPvcEqEXik07l8gftSf7TiZxtiZunnzFq1ktv33ccdnTptoBvaMR8mGV973LCdY+FElY8CQozi92gVIQ/ntm30w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIj8oYnkz6ts9tOBUaMlPuzeLuWclqlQ2KYIjx8xb1D4XQZ7Ua
	SmzSb2nLygJddjI48xTeh9BhJyH3BJrstwknDBHJti25I5OG9gNDBq/hlRYBkXA=
X-Gm-Gg: ASbGncvHxidGcQtpUbyBm8FYCvCrhbY4l5A88pKpVxw/ckksHftrX5+Su/xGgpssuL4
	b4n+FlvI7owo/MDHcsVIogrGEmXoh3WzxePSHTlIpBs/HEUkDKCAWO7kz4sCGH1w0/+OUCYmgiQ
	NDL3I1/P1hILVrPXYmzO6HMXqp5nZ/isTJHukcWVRvJ4bibiqxnFY2ybFMBSf+IZrHjq8Bgrqh2
	rMWoOhqwUmlFFkhKZIhkAB6XlapIez7dFuuDkYTP0sAZwjnqVEfX4csIhGyUJzJzTMGnRTziGUb
	6ZnwB5XCJnnQ/4OuzH+jdHln//Uv/F64GOH30qnSDzS+QwSlavIrJA==
X-Google-Smtp-Source: AGHT+IGlChd6tLj+3i61XHBupEwAOjCBzGCKhTp+KaBl7fQhROVtbuFM+lTWKj8neJnqJkIQtbT1yQ==
X-Received: by 2002:a05:6102:3912:b0:4bb:b589:9da5 with SMTP id ada2fe7eead31-4bbe0557e42mr2387539137.25.1739280705998;
        Tue, 11 Feb 2025 05:31:45 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4bbc5693b8csm826333137.5.2025.02.11.05.31.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 05:31:45 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-86718c2c3b9so665789241.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Feb 2025 05:31:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCURPPzJnu/R+u7heFd7EZi7L6K/VuQURYA8ki9HDQKbxiRB772xlgsvrohDiem5VhL7Yu3S+lQyjFlpIPyhbPbtNw==@vger.kernel.org
X-Received: by 2002:a05:6122:a26:b0:520:3e1c:500f with SMTP id
 71dfb90a1353d-5205721d689mr2015603e0c.8.1739280705132; Tue, 11 Feb 2025
 05:31:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207113653.21641-1-biju.das.jz@bp.renesas.com> <20250207113653.21641-9-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250207113653.21641-9-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Feb 2025 14:31:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUOFDqX2XLT9y77Xx38tUuJQNR3UXnfD=dUsKBf_duLGA@mail.gmail.com>
X-Gm-Features: AWEUYZlieXktIfSJaz89OuRY0pntSdFiP3G7ldUmVZfCvICfNvmLzIyF_6n72nc
Message-ID: <CAMuHMdUOFDqX2XLT9y77Xx38tUuJQNR3UXnfD=dUsKBf_duLGA@mail.gmail.com>
Subject: Re: [PATCH v4 08/12] irqchip/renesas-rzv2h: Add field_width variable
 to struct rzv2h_hw_info
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Feb 2025 at 12:37, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> On RZ/G3E the field width for TSSR register for a TINT is 16 compared to 8
> on the RZ/V2H. Add field_width variable to struct rzv2h_hw_info to handle
> this difference and drop the macros ICU_TSSR_K and ICU_TSSR_TSSEL_N as
> (32 / field_width) provides the number of tints in TSSR register.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4:
>  New patch using field_width to handle the differences.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

