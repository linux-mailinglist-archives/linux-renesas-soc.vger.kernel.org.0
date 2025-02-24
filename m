Return-Path: <linux-renesas-soc+bounces-13554-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA16A4197F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 10:50:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00EF43A8ED8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 09:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06BFA1FC0F8;
	Mon, 24 Feb 2025 09:49:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E059118DF7C;
	Mon, 24 Feb 2025 09:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740390584; cv=none; b=OA+GagE8r6GyNExUT0bX1SNvebEDrkiRp0jRml7MTKIumkDsSyCGxfIkr9JRrJDWgsFvc6sow+iFyTZ2ZrbIHnD7ivFjsgfy8H5mBAwF2e/MbvnMzsu2Ac0qgpyMb9vIQ3M9JkxLocSkl7ShXWojU2nZ/FcIs/zB8i3AY7f65wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740390584; c=relaxed/simple;
	bh=wKP0ZvtqVEvnjUag7mIqTFU0dDxFIM3oPXIrJHQBtqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JJgU9JfcZmYzTxDIafoIMRoDYQI/3ox4hkmT0f4CuF7JyjkAKrGXz5pv6qPpjj0FTIBa4K2msfPEIxdQuVjKxTU0HDa38uXEgCSs/Pwnd1YeA9osjiCDI2Czu+XS5xCK2LSb5mxjtgfNwFpcIFiqeSNHuhv/RFAwVw37FfOyx/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4bfb4853c29so1003452137.0;
        Mon, 24 Feb 2025 01:49:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740390581; x=1740995381;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tchK2LqxovqryZGaaL7rRkpuuWybVSfdD8fFD9c89Mo=;
        b=iiZ6WJ+mpfUlnZ+elO9XOvyJFGvckrJC5B/MZFEO+sVrB0o0nKy8dGmc8T4/5qnjZn
         Qzn0/eB2a4lgPDV26uKXEVlbYILIW1VrwyksedCyI0fZY+uNk708Vy/9QCeH6R/a5Uj9
         JAjkhgskRVGYIUA//S9QThqwel01rty6xYTuVptO7uTFXh/MYKdQztq+o9OQZ0ov5DiZ
         CG9h9biAIFflgtjQxGdAHyjRBxDnRf8XsoNssA4rr+wEdEczFotmxJqX6p21mxltJ/ou
         H7cg5t7NcxhMM8AoKvLIN0UD5ZkX2N8lK1hWkzdJScXQhCWiY+mvcdCchuO4APYCWfkI
         EU9A==
X-Forwarded-Encrypted: i=1; AJvYcCUigpJIORAeA1XJMltfVGcJIrBNZ6o/RQplgm5r7OwekPKz8fkYSLxwXjUovOkc4/NZdwz6KwP5@vger.kernel.org, AJvYcCWFyZwnxvlc+uXIEIOzHE9me8vknMj9aDo/fs2/xIESMvTQcCDZ1Zp4i/AjRozVWFpTbYLcvQnjH+ZeE+/ikl+JZfA=@vger.kernel.org, AJvYcCWrj+T5GyB9B3G55/16taW8TarY+XMbkJN2zGu3OQnnDX6/dZzZt5WZTrqikRddWJjYPGNZyo/pSd5CZwE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzd1foGwoxdDpYACiv5ZU1+F+ND08wcQMYaajw9HWfMizKnC6Q
	mqpAKytCVDtLdVpsPIwG4rT5oqc2g+AVeOhO1Vx1PLqv40RFh4qUP1XiVm7v2LU=
X-Gm-Gg: ASbGncsAmBoM4xi0+glWKntPfkFZSxlsFG4o1LlLfmzp+Q5c/xxZ/EvplWdiToieuGS
	9RDxLIPRyc9I8GS5CiEccQscvp6jaFvdGbjf9sfSKEi9PE0S4hndBiDsiI1GTnMP44sQYf+ldvs
	eZ7K2lGu1wUzUR0rGPuKkQMzSLQZP2J4hCU9RZ5bl/CFdbxlj8/WhCzImc9adCqcQzBk2mAOlYE
	KJvg3u50K3Vq2cykzQsw1/rFd0zugWNsGLyYWNGscqoyaCT5TzMerIX8SyID5LcLc+3egOGhS85
	sbZJ5rH7BiojAenrX8dmYYKWvvtfYhz387NDsVFtJAeYZxqQov3/79WTKQPU6DxG
X-Google-Smtp-Source: AGHT+IFUjUydf/NzLTZgweIG/o4kP8kO5SHNRltzfEDjwz0NZmtsP9UoA46G3kfUHaRcxb5MnXmcUQ==
X-Received: by 2002:a05:6102:50ab:b0:4bb:d394:46b5 with SMTP id ada2fe7eead31-4bfc003eae0mr5668969137.1.1740390580688;
        Mon, 24 Feb 2025 01:49:40 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4be4d833cd5sm3224631137.13.2025.02.24.01.49.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 01:49:40 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-86718c2c3b9so1067204241.2;
        Mon, 24 Feb 2025 01:49:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUPtjNqpRgkxp3wOGVeZ6PN/RPTnJKJ2uifCbYaOTAze1q+xXsmoPIYgijTYd06a0YzeWyj3Kd7mUJ+5+A=@vger.kernel.org, AJvYcCWQxq0xJSpKLwgbQs3PCbHrPGotntZSEb1HqjaXyAbc0UJw1yXDZrdeFDehAJ9kASs0Q8chHfBd@vger.kernel.org, AJvYcCWrBTmxOZLJ4GvKXtmkp9rStCBJOZxuqgvcR9Mgj3xfbm7FWH1O7Xyhz1UByiQAMM6+oPHk3F3hf9uordPnxYstGIw=@vger.kernel.org
X-Received: by 2002:a05:6102:442c:b0:4b2:9eeb:518f with SMTP id
 ada2fe7eead31-4bfc00c0415mr5871994137.10.1740390580092; Mon, 24 Feb 2025
 01:49:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250223233613.100518-2-thorsten.blum@linux.dev>
In-Reply-To: <20250223233613.100518-2-thorsten.blum@linux.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Feb 2025 10:49:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXnxwvU48VGoWQOwOEnM81apbpPq-mzqUD4PiBJnodD7A@mail.gmail.com>
X-Gm-Features: AWEUYZmvyxjROFgMbBy9Q2nVsAqCQOrnswnulEcgmrRf2UVfxaewQk6ZOtbA8LM
Message-ID: <CAMuHMdXnxwvU48VGoWQOwOEnM81apbpPq-mzqUD4PiBJnodD7A@mail.gmail.com>
Subject: Re: [PATCH net-next] net: ethernet: renesas: rcar_gen4_ptp: Remove
 bool conversion
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Feb 2025 at 00:37, Thorsten Blum <thorsten.blum@linux.dev> wrote:
> Remove the unnecessary bool conversion and simplify the code.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

