Return-Path: <linux-renesas-soc+bounces-13229-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D148A39707
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 10:27:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CF0E174096
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 09:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B82F22F3AB;
	Tue, 18 Feb 2025 09:25:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C0F1F94A;
	Tue, 18 Feb 2025 09:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739870723; cv=none; b=BbDmZkwEJHpOngvjngZJUY/jxgQ6mURUx+sTrTslY2CJPPO499ZibVLJbaSjkpGFGKHAfE57+plIb0EaxfiW+P0vxVdg/DNi0G+9Jx/x6qgzjpGl6F0OGmnYYi01sacnQDHL5DywHrg6y4U8lxrWDMzv+q8ykn4JNZiuKnlmnvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739870723; c=relaxed/simple;
	bh=2A+HPgq4kw3LHWNne2m/gQ/v0dE8qcC9rhzvU6/BKms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ed5vn3HmQKELJBeQR7HqwJSS7lFb0hum/NBmTHc6tRkd1v3Uo3uZbF1eovkkYQnmObLFK7zk+k/HTGMe5aRIl1nCaP1HuDXVf9sTo2PwX2X1lu3aqjiHQY+I4NkMEfOgqZNGJm2kArfrpfUTR7SvqHAqR9DPG2Y8G8nwS1sQxqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5209ea469e9so2042279e0c.0;
        Tue, 18 Feb 2025 01:25:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739870719; x=1740475519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6e+XkVhruxUj9hYDMFwzpshD1I1yvdexdZUX8aeqRjQ=;
        b=Sp+2rTCXn8yCvha93yEvj4SE8O8xqBjGuoAicI2vEo2yNQ41YdwZC40SRbIpj6KtdU
         5HMqd7LbiLj2RMH6aIw/4yAX/LGUyfUxw/eM9NDGbzajSjvJG7FC2EsrFilANznNdJIC
         u9dG0tIvAziGEKGRrs6wAqUvLyFyTM0csgEdHBSK/uMUhKmDfFd7jYt/kPtCsP00GVDr
         GjIPAyTtGN3awBOJayRGJxzI4LCXZrygk0PpIqkamRtspuVv2Pq6FEXJEVqGGq/nd2h/
         IJ9ZHBzIcF+miciNV/zh2bGOYDswr+UvUgYF0eCeTZfiB744y/SPj0xM22YZCeDjIa0Y
         JBJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTLX/onvgWpm3fikqPNMnTRwRQVc6wzPLWAJjB4WEuFnwhfQg+SLbKM6SNg9hl+LionleDZCalQjNld7/CmecsCQ==@vger.kernel.org, AJvYcCVcf2jSwrpVtOypbwLmhROgZRonjilytt49lZemsOWpsyxV7LhKelCab/FGeaQmWLnMVWuB7uaf@vger.kernel.org
X-Gm-Message-State: AOJu0YyOtfanjcN/bxNGpYve2QlNL90qHfOo3BxHMaZGGYG960HjxSAN
	JvFSF2quOAOAMpMqV5i1qt/Q2SstH9OoFeByLvPYMlrUBs3iLt9GQQ7RwzH8FYM=
X-Gm-Gg: ASbGnctFj+hENqoDwEjKO5raJk20Hnj1yC6XoYTvoIVkZrIIjUp31HpPTASE1zt6+OW
	nSmodr1GCYZVqCF4HVCVCG59GP2ZKs53dIiwap0xPOoDT57fwntF6GCu7Jpx+FsZNBy4iBukJp0
	CU4jsLB+oHcL13rQOVCrqDveiXO+Yz2D+tDuQ9dvfJxrMHQlkA/csS/zu/6JQeu1RW3AzF2PegL
	AZTdQEBG5G/ovHj6OB9NtLdnd15xmOnoBp3PhMu6qx5MtFySRTcZV4uycghr+u6Sx7NcQEPrO4H
	9DG+cvRvMQNBiknK6/rxH8GJ6ISBkfNasiXUJrSVD8ony/jXCP/v/w==
X-Google-Smtp-Source: AGHT+IEEF/9w4eanA8pthwvr4xzFjx6NKjXpDBdJWnJ252CK5mg2qI/Ab6ZmWoEaDgeYf9R0eDlsCg==
X-Received: by 2002:ac5:c85b:0:b0:520:abfc:4f10 with SMTP id 71dfb90a1353d-520abfc5121mr3456433e0c.3.1739870718888;
        Tue, 18 Feb 2025 01:25:18 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-869044f1107sm1601956241.17.2025.02.18.01.25.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 01:25:18 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4b9486a15a0so3781119137.0;
        Tue, 18 Feb 2025 01:25:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUCyFcJtvz+w2tz71cAnTipl8gxbtgHGn+SVWzyj8jSOC0QzAE3LL9EhtfZixy3OgVNb//o9rLJ@vger.kernel.org, AJvYcCWu8GrNw7UYRJkFXGZ7udLdxyO9iYQUjdLm0g0VpnPBvfKS2T6RbeojR/cGEiO9SA5xJBkp4goV/O0PYNoM4QBZuw==@vger.kernel.org
X-Received: by 2002:a05:6102:34b:b0:4bd:860f:ff2 with SMTP id
 ada2fe7eead31-4bd860f10cfmr4418314137.4.1739870718057; Tue, 18 Feb 2025
 01:25:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250214174650.2056949-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250214174650.2056949-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Feb 2025 10:25:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXBUU3rNxQbHZxGgC2S1GecsLs7RmB8FJvmc9F3SCUDSg@mail.gmail.com>
X-Gm-Features: AWEUYZl4_uJMHXPeHvfbjIrwfWbSOO1mQge9bKgHdmnh8AXGWvdCSYwBMMdGvH0
Message-ID: <CAMuHMdXBUU3rNxQbHZxGgC2S1GecsLs7RmB8FJvmc9F3SCUDSg@mail.gmail.com>
Subject: Re: [net-next] net: phy: marvell-88q2xxx: Init PHY private structure
 for mv88q211x
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Stefan Eichenberger <eichest@gmail.com>, Dimitri Fedrau <dima.fedrau@gmail.com>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Fri, 14 Feb 2025 at 18:50, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> When adding LED support for mv88q222x devices the PHY private data
> structure was added to the mv88q211x code path, the data structure is
> however only allocated during mv88q222x probe. This results in a nullptr
> deference for mv88q2110 devices.
>
>         Unable to handle kernel NULL pointer dereference at virtual addre=
ss 0000000000000001
>         Mem abort info:
>           ESR =3D 0x0000000096000004
>           EC =3D 0x25: DABT (current EL), IL =3D 32 bits
>           SET =3D 0, FnV =3D 0
>           EA =3D 0, S1PTW =3D 0
>           FSC =3D 0x04: level 0 translation fault
>         Data abort info:
>           ISV =3D 0, ISS =3D 0x00000004, ISS2 =3D 0x00000000
>           CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
>           GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
>         [0000000000000001] user address but active_mm is swapper
>         Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
>         CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.14.0-rc1-arm64=
-renesas-00342-ga3783dbf2574 #7
>         Hardware name: Renesas White Hawk Single board based on r8a779g2 =
(DT)
>         pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
>         pc : mv88q2xxx_config_init+0x28/0x84
>         lr : mv88q2110_config_init+0x98/0xb0
>         sp : ffff8000823eb9d0
>         x29: ffff8000823eb9d0 x28: ffff000440942000 x27: ffff80008144e400
>         x26: 0000000000001002 x25: 0000000000000000 x24: 0000000000000000
>         x23: 0000000000000009 x22: ffff8000810534f0 x21: ffff800081053550
>         x20: 0000000000000000 x19: ffff0004437d6800 x18: 0000000000000018
>         x17: 00000000000961c8 x16: ffff0006bef75ec0 x15: 0000000000000001
>         x14: 0000000000000001 x13: ffff000440218080 x12: 071c71c71c71c71c
>         x11: ffff000440218080 x10: 0000000000001420 x9 : ffff8000823eb770
>         x8 : ffff8000823eb650 x7 : ffff8000823eb750 x6 : ffff8000823eb710
>         x5 : 0000000000000000 x4 : 0000000000000800 x3 : 0000000000000001
>         x2 : 0000000000000000 x1 : 00000000ffffffff x0 : ffff0004437d6800
>         Call trace:
>          mv88q2xxx_config_init+0x28/0x84 (P)
>          mv88q2110_config_init+0x98/0xb0
>          phy_init_hw+0x64/0x9c
>          phy_attach_direct+0x118/0x320
>          phy_connect_direct+0x24/0x80
>          of_phy_connect+0x5c/0xa0
>          rtsn_open+0x5bc/0x78c
>          __dev_open+0xf8/0x1fc
>          __dev_change_flags+0x198/0x220
>          dev_change_flags+0x20/0x64
>          ip_auto_config+0x270/0xefc
>          do_one_initcall+0xe4/0x22c
>          kernel_init_freeable+0x2a8/0x308
>          kernel_init+0x20/0x130
>          ret_from_fork+0x10/0x20
>         Code: b907e404 f9432814 3100083f 540000e3 (39400680)
>         ---[ end trace 0000000000000000 ]---
>         Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x=
0000000b
>         SMP: stopping secondary CPUs
>         Kernel Offset: disabled
>         CPU features: 0x000,00000070,00801250,8200700b
>         Memory Limit: none
>         ---[ end Kernel panic - not syncing: Attempted to kill init! exit=
code=3D0x0000000b ]---
>
> Fix this by using a generic probe function for both mv88q211x and
> mv88q222x devices that allocates the PHY private data structure, while
> only the mv88q222x probes for LED support.
>
> Fixes: a3783dbf2574 ("net: phy: marvell-88q2xxx: Add support for PHY LEDs=
 on 88q2xxx")
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks, this fixes the crash during boot on Gray Hawk Single
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

