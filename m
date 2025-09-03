Return-Path: <linux-renesas-soc+bounces-21272-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A98F7B41DDF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 13:58:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 007DD162F0F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 11:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 876B72FB99F;
	Wed,  3 Sep 2025 11:57:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F20027C872;
	Wed,  3 Sep 2025 11:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756900656; cv=none; b=fekPVGNtePZh/AragRjbDSROnhBNz75mThBC2+4rcplngg1WqMF5FKz0uZXwubr+WXzYS9AOSKMQMSZxGiznQZThIW1QhcIT8aDFh/0nDgbCOFHWmEVRupvtO6iQ7MQfte6cHccnJasE+gUb9lSRnCRJM8V7q5D1GWYopNzo5Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756900656; c=relaxed/simple;
	bh=JVZN7Thk57ubkHL8Lh98PDhOuxGLBmjYHulFrZ/HEBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uEBI0JlSt6A4r+H6XRKI24vjY4zrhKMmLBaKSIXeiPzjsWnQLJFDEOspOkF0ZStwQ3kzLL/rhgquCyHRjSxopqSi5n/uDEnMtIaMesxIV8RgYBsWxc6TXg66Gz4mnx9MKL6DmPkCp6S1MVQAW4Vt6i9A3fvC5Q9EI6piHBdONLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-8920c579f98so1947066241.0;
        Wed, 03 Sep 2025 04:57:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756900653; x=1757505453;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nWlQz62fgHWX4uCU0ljXuo6BVv6lTkeHam21GWLhzFs=;
        b=GK9nqTwgphtD4WHwfb+5DA/0CvgPZVAUlomzRlNnYJ1VCoTf+cqOKCpsHAq0ZbiqIe
         zU8j/UEwt7dMKO1qI4kOGsGPKNLRWXTqqprpQ32xGHvui4qbLd+LAkMLSIIA8x7TTuII
         qgkZpkXbv/mGnRNg9iimFp5lTUR6IhCeycPaVn0czDD7uqYEYDqNGANs5JlL539aLc7V
         Twiq8nBqvyroSWNePzEjcvpmGqq7DsEJW9GRHosXAbofCNp4l1K5kKmedLQG21+gi62U
         2TeAEAdt/AaXK05OL/05RHqBGQpnQVycy4iBCImZ/kA9iSg8XbAAE+1o4LPaoxjchoJN
         VqWw==
X-Forwarded-Encrypted: i=1; AJvYcCU/3OnKU2+3z8Y1TAgpYnZoyem3DntqkqK5SURzeHjNuzj+p3NdIaM6ohJJFkcWtz3FilHZ7DCd0tv27MK4F4XSA2E=@vger.kernel.org, AJvYcCW0nXVFoGyhR7LbQ9xXF9oiYjd1ewmDcDGFkAQt8iIaIuXuEUEKM9H6ZSUawl5xwA3Dpo7r3sLc0xz15z0/@vger.kernel.org, AJvYcCWeVz9bLUoSGU9sg0g1UoF8dwwMy81bb0gXKqvxgYYUtmP+4FhC85Lkq9+T8FfzO0G8QOgIbhZGB+8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlwk9RjBha/dpAnBI3sJG3AVz9KWT+EmsN3KO8zBHCb4Z2wtuI
	bpq/ivRA6xf5LldnrHf2eUYO/HsenByB7X6kZXqgN0vV/AQ4xedpu/dTAN7A0JTD
X-Gm-Gg: ASbGncsIYIOW6OzCv32+tRxNU4/5jKDssX5+jW5+UcU8PSQEMa/9Q7ypGD/wUVeZ1RK
	9doXNQJYyDRWXSRNptGKfHgkKGMp4VpfbRe8O6SUMohKeEdQJcaMOsthjL0CYzXkAiJmmWAbR/m
	KBsdVUugdI3w/ro0vZdiFxO6i4TiebxNi2RgJ/t79xMLJMriBS+pAYoiRMnbuA9p1/hnJbvCeCd
	Ezrojf9dlmr51oPzG5bh25BxkgTTljp6lmP+eXs19bD7AdpF6Db7QFqSKc3OomNWgmGXHT1+gZo
	9bEN2PNHh6U81ca4BFIINu52sfDV4S2jSgnaZOEph4FeeWf0dvg1XQOS1CVT8gwxHfqWpcupF/f
	LgxbLzLn6YSwhAqBDgOq25f7A1bVcXBCEPbDV8V9XdfVGcex5diIVr133ThR1tY3pu90gvNY=
X-Google-Smtp-Source: AGHT+IFsWH0oeH3Lra5H8bVrz+Y7cOVPwnWOiP5c1tx9fAKyrYszG25JuI9TNK3EBkFDd12VNzlUUQ==
X-Received: by 2002:a05:6102:c4f:b0:523:146a:f2b with SMTP id ada2fe7eead31-52b1c7726ddmr3987941137.33.1756900653585;
        Wed, 03 Sep 2025 04:57:33 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8943b7c369asm5614838241.2.2025.09.03.04.57.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 04:57:33 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-89607b19f71so1040049241.1;
        Wed, 03 Sep 2025 04:57:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUWAiSBxnOJWnysGXBiJdPIcli9/okx68tuzabpY+A+oH0zuERvbbBzDFvol1OwuGb8+QKuOTdQJ8tAXzeVC3h+wcs=@vger.kernel.org, AJvYcCVKIVj1JztmnS953Bx5N2TgV4xUASKpWbk2C/eZCAlTONHKhmEh9QMxauwFs4KJA/kJ/v/uUR9BFaz1WfQ7@vger.kernel.org, AJvYcCVZ77E1sR05BdTh+927+bFWSYRUXMOmOjAF9aPDPwmB23S+YA//K739GTihZVzoxQPjXY+l7a+T+PI=@vger.kernel.org
X-Received: by 2002:a05:6102:5818:b0:4f9:69a9:4ec5 with SMTP id
 ada2fe7eead31-52b1c14de5dmr4507201137.27.1756900653047; Wed, 03 Sep 2025
 04:57:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903082757.115778-1-tommaso.merciai.xr@bp.renesas.com> <20250903082757.115778-4-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250903082757.115778-4-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Sep 2025 13:57:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWY-2w5g3eWp181Z3H87fmo=xd58xFoE9iR-afXE7+V0Q@mail.gmail.com>
X-Gm-Features: Ac12FXz5IM3K6C6n98lagyoPE_kosx0avrN_1j7KfJjcNqRBhHU6p88L_-Gp8U4
Message-ID: <CAMuHMdWY-2w5g3eWp181Z3H87fmo=xd58xFoE9iR-afXE7+V0Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] clk: renesas: rzv2h: Re-assert reset on deassert timeout
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Sept 2025 at 10:28, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Prevent issues during reset deassertion by re-asserting the reset if a
> timeout occurs when trying to deassert. This ensures the reset line is in a
> known state and improves reliability for hardware that may not immediately
> clear the reset monitor bit.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v1->v2:
>  - Collected GUytterhoeven tag
>  - Removed dev_warn() in __rzg2l_cpg_assert()

Thanks, will queue in renesas-clk for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

