Return-Path: <linux-renesas-soc+bounces-17461-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17142AC2676
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 17:29:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 036481BA2611
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 15:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FB0A246793;
	Fri, 23 May 2025 15:28:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4E32472BC;
	Fri, 23 May 2025 15:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748014105; cv=none; b=oyFHUKbnNIzlHXnLT+rSpoEV0YFz9tFrWp3bVUzR0xO3JhUHhJJsDOOZ9xpG7kShMKN3m8YOUvC0lZZEyhnCC3s6ofvAStaxv44s95m5yJrn10WK3ShZaVLyuWOGFpIjPiTfbSy7+Q/jMo1mrNXwq+WawsBBthQEzpN83knsfrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748014105; c=relaxed/simple;
	bh=fLh8dMSpRgKeAZH8Rg4qUiKs8kZY6ep2DqeKi7PE2kY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=or5goZdFh3FYU/YNANrqqOApeNbabVSZLhgpgoI3zcb2OJztS91Ywn0ubkvrpm2/PtNs1wc2jSmmKvNCfnK837N+imtTKa7/OF6LHZHZYQE0lxvORk+OWYxn5RWPeI0VgY4dAkSQimaA1ngEzupPxgZIUIkLFg8p13eyOHkA1zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c5e39d1db2so583994085a.3;
        Fri, 23 May 2025 08:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748014102; x=1748618902;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vt7Vxhj4cQ3c3in5afKDF2daYfkHG1WNnCOETUzny6U=;
        b=auHguSS9Ul0E/hBsg79H+0XuAjAeMOVdv5njHNewAX7ZZQPfzWhX0hO3INxwqIkJYU
         h26vdpisONsDcCLW0henJy8M6Cn3N5E7MyLn4tm1/s1SJo0Tbg2aWipRg+gpOo9lEQjk
         V3rJtL8rgA3BlkZonerItfUkfzNMetYIKCl36FLvxPFSQQaW4OkvdzrJhTovTtdkmJXl
         +Dn5btbtu1LUfsbAv3CD5ljbmq3gqXVBReIWZxeWg/ftc73IfgP3Zao3H+CVcvNSpcUo
         UI+L0vpQRmm2e5ZuNp6OmWXSxiitEGb7MOxxJfaBGF0oLgDKMrzdUSZxJcqYPlkdNkWI
         Xkmg==
X-Forwarded-Encrypted: i=1; AJvYcCUvrIjc9NJahr8Rl76Xf6b7+MT5YHW3EwnQYyQKRnUPKOT/ZKk7bDE6KwmIYROzdiAH4foekdylujgAbEU=@vger.kernel.org, AJvYcCWnT/JllpWTWYi4qk+WFjpd/e7fvv8a/rr44YmRH9B+ewdtjFF38jw4K1kNpM7PACyJDL1HxRjzPODknq6Y75P9Plo=@vger.kernel.org, AJvYcCXWsT7N6ikGeLAGqXvaoykon0xmU15w7wfF/qyQXoLxi0sOEv9fxApySEQsQk2xDBmUMaOMQu1lp3PiAjVe@vger.kernel.org
X-Gm-Message-State: AOJu0YxUbiCTBxGnyK/vy7cqqaFRCqtwjEK5Ngocs95pvMwVeIgYjwDx
	AeqLGQ3/+zkwgD8OdQJLYk5wo2WJS972PYxumquWz/VEnFvrodXnCsuLtWk2la3bZ8I=
X-Gm-Gg: ASbGnctIxZXd/SjsSsfCJEL5gG752trVivpWPRG/EQr1cLGKUtw6O5guhx0YKFcSqMO
	MZHgqXfHNM9mYWvewakULNqGzDa2U5e9PyqiTNu8rDQrvlGV5Yuq4VlnxEKgrp0AZQ4CWjLHke4
	nFDZocSQu1tV04cqMwPjZAT/E7kI+LWNH+xv06oMmp4o5ZCU6JaPCCI+pLe3LjsaNZn3yat4hNF
	BfrmaDI0WcA4LPser7dTw5TKsVb29wShnmTuDOB37ylsfp3DuKe8PGfE4No8ci/4DLB2A/klRNp
	gxnGOf0HqWUWTrFPrmq75rhGdZ4zIIqxfww7TKjGlJTiMGiQgpLK9aRQyf/i0C0+OuuNDhulU9m
	J8pl3YrP9dtLhhKVv6w==
X-Google-Smtp-Source: AGHT+IGwHQuc8ABe7uMrplVpa7Vqdd3XL8rhOU4fiTc5j0rdyYl9i1agi7ky+ZqxTeis4cl5m/+5rQ==
X-Received: by 2002:a05:620a:2604:b0:7ce:c604:3a77 with SMTP id af79cd13be357-7cee31cef0amr501242285a.11.1748014102182;
        Fri, 23 May 2025 08:28:22 -0700 (PDT)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com. [209.85.222.177])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd468b6c74sm1201982585a.74.2025.05.23.08.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 08:28:21 -0700 (PDT)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c559b3eb0bso625403085a.1;
        Fri, 23 May 2025 08:28:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWewDqEdVoF5EJ5sYJRwbPiZmCGW6coOpR873Teprs0Dapns9j4tBXRE863VGFMiDd6EjElEKQbNVB320Y=@vger.kernel.org, AJvYcCWhGYZS7JSFFiYpoQKlvOpSjEnjc7IsRJ9dFjPAiZKqwHsMYdQObImn8FiFqHQfh4Abyy/lmlrNpdJ/wZK/@vger.kernel.org, AJvYcCWnU73DmrejNrWy2Ci1zdvNjUjNuD69wRLGVGeoGG+LGF3j8YrNVdIArXCpGN3hr7Q03GuMdTl4U+kYg/5iwWaQZNE=@vger.kernel.org
X-Received: by 2002:a05:620a:4482:b0:7cd:3a:f2d8 with SMTP id
 af79cd13be357-7cee31e76cfmr441171385a.24.1748014101697; Fri, 23 May 2025
 08:28:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523142417.2840797-1-thierry.bultel.yh@bp.renesas.com> <20250523142417.2840797-8-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250523142417.2840797-8-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 May 2025 17:28:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVxkzE9E1xf+stYeaoLfP+PgTjAdywLLgdKzviSyAXCPQ@mail.gmail.com>
X-Gm-Features: AX0GCFuENv5B_luDdi19emcdX_cJln9O3E64o1N9SOIfUUPUV03C5zjEJlQaw4I
Message-ID: <CAMuHMdVxkzE9E1xf+stYeaoLfP+PgTjAdywLLgdKzviSyAXCPQ@mail.gmail.com>
Subject: Re: [PATCH v10 07/10] serial: sh-sci: Add support for RZ/T2H SCI
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 May 2025 at 16:24, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> Define a new RSCI port type, and the RSCI 32 bits registers set.
> The RZ/T2H SCI has a a fifo, and a quite different set of registers
> from the original SH SCI ones.
> DMA is not supported yet.
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
> Changes v9->v10:
>   - removed unneed #ifdef in rsci.h
>   - use same error message in sci_init_clocks

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

