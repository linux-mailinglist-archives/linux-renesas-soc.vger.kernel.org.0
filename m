Return-Path: <linux-renesas-soc+bounces-21856-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AED8B5787E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Sep 2025 13:36:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA7ED188DC43
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Sep 2025 11:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAEEE3043A5;
	Mon, 15 Sep 2025 11:30:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25632FF141
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Sep 2025 11:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757935851; cv=none; b=RyxztqwYv23tc+yKp6ObWw/HBx0s52/4fnmqvFgKJQxvx2/SfyUp77lq0DDgYaUQNEc5wIj9euV19kSEUh6U6IJxogWqBESOH+Uv4n/85Lh2SJo1SGHx34tJZytLdCpyZ3IYmG6o275jwT5pVpprt1wzJ4UT/km7T4xjWztP/G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757935851; c=relaxed/simple;
	bh=UrRBcNgc2GxQFH5pIfqBkMg5GVTDP+gL8ZcwdqJeQ14=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UsEQoTjs7JeNiFUrO78q36wC9ZLKUe+jj7hFMWpzC1i+lXDRHAlok6Yh7RwK9Fa576lbYDoJgnFIaChKS++hea8g8+w27z+e8Pf0CLXvjD+9qtIdXB6sa12H01FxuYrfH8/KgQf9alU12DwqjyOT0775ILaAPu6hw4yAiDofmnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-544ad727e87so2905129e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Sep 2025 04:30:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757935848; x=1758540648;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NQBIjgXfu6Gxi8be5ntWO50wYelw8C9JIsRhAGgfqf0=;
        b=P8Cu+xX9MSfUfYCC4PokSNBX4Oo7vfyOkDEeDxnLG4tul2f2WEUfR6OF4UsiHmm9Tg
         yUPk3CCddDpvae1icKR1O+eveUs5Y6lpg8tAlh2VQe/K75YRDUJ3HCjnLKJdYDfo2eai
         rJfFCORMbiWQxFKvJ04AlhiYW3WwIMGbM1+1YXnfWlmGati+MA8TZu7ENXg1tq4bggx9
         U3Bk02EnkUWbkCkNVyaebOdPkUnKYX3C/d5wGPTnuXitO5fyvT5EdA7NkIMh0ivonbAB
         CGygF3qXOf/MpxDftVdcSRiMkvEjzefHnC1pFORHrI+6MUHNxWzU2rcU3ANGdlZW9cPn
         f7qg==
X-Forwarded-Encrypted: i=1; AJvYcCVZYRewxIos/7QjufzgUwCa08f3O/K1geHpVO5s6QH4jo62cJu23tUmIP5Yh652RppiSEdjp64Evc+VaJYbV4mKIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzAc3CH+jiDW+8xHuJFTf0dXYGVVUo+uURwhHD9rlZHab5BNQ7
	aaOD89nOR6HdPqq9iIAx78GFlfYwD8Qaob64Q42O9ip/39FxAzsU8t/FYDv2XgVd
X-Gm-Gg: ASbGncsgwzzrwwb6xzKUfRMozN3OBFDEy9bjLDYzDTF1JlqhtWyB6wZZkEaeFtdXX86
	YA9K/O38EcS6Z3Ol/rDaHSg5sLOKahm1yC0oKCiWcS5zcxq/tdXMNRTcsF4xP19sUi6FJI70L4h
	7m2b+LUYwGjRxRaGHF/INFl/KIeoSl6DK+NhWyPriMEu3xDgOHYRA4crvYOq4wKsln7zKXjuLII
	H/I9wqC3M1PuvAYZweOGivsip8jlxtgU/uSOSkPNfBq/nfoSWFOYcUjSMn429IyfYydOTGuCVCq
	D9VaDSwfnZyYdmMtT7h8VJrE6JGGSA9EKdZnwPJ4R48/YAY/HxSsK3o1oszuXA1+U9MeRbwxXiE
	cqw7uUxq3cD9y4nq1w695QPUUmkpxCf4m8CDmk5QnuhdZromS9RhHqCrY2vug
X-Google-Smtp-Source: AGHT+IG6JabNcBvwfwtsVbN03V1yWF+4dxF+6zcvuSfK7JCzsmzG7s/hnC+akf823pKQ1VsWz+hC4g==
X-Received: by 2002:a05:6122:3bc8:b0:541:bf69:17ac with SMTP id 71dfb90a1353d-54a16d192f6mr4146950e0c.16.1757935847974;
        Mon, 15 Sep 2025 04:30:47 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a3354dcdbsm632327e0c.30.2025.09.15.04.30.46
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 04:30:47 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-50f8bf5c518so3398123137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Sep 2025 04:30:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW8+IOxzY8++UEyD/haHemWfR3X5kp+en9umSwNQISll3kFIxvjq0FiRbgQDs1TCXeZOeZiBi5rx520pF71+Uyv0g==@vger.kernel.org
X-Received: by 2002:a05:6102:290c:b0:526:f807:b90a with SMTP id
 ada2fe7eead31-55607e2b975mr4729860137.8.1757935846600; Mon, 15 Sep 2025
 04:30:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250912104733.173281-1-biju.das.jz@bp.renesas.com> <20250912104733.173281-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250912104733.173281-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 Sep 2025 13:30:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX4V7pG9X=sa8e+2oOT0HpR9FcD78c-e1x81g+qbUrypA@mail.gmail.com>
X-Gm-Features: AS18NWDvTIOpaxSS7-BC4gTDK_1rrdMWh5mlR7XCHFBxf0fUTl306c1znni9qEI
Message-ID: <CAMuHMdX4V7pG9X=sa8e+2oOT0HpR9FcD78c-e1x81g+qbUrypA@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] can: rcar_canfd: Move enabling of RAM clk from probe()
To: Biju <biju.das.au@gmail.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-can@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

Thanks for your patch!

On Fri, 12 Sept 2025 at 12:47, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The RAM clk needs to be enabled in resume for proper operation in STR mode
> for RZ/G3E SoC. This change also result in less power consumption.

results

Note that after this patch, the amount of power consumption is
unchanged,  as the RAM clock is still enabled during probe, and disabled
during remove.

I suspect that on RZ/G3E the RAM clock was disabled after resume?

>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

For the code changes:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

