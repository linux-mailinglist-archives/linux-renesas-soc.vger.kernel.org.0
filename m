Return-Path: <linux-renesas-soc+bounces-13881-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EA508A4B512
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 23:02:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 660203A9FC0
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 22:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43F1E1D5CC5;
	Sun,  2 Mar 2025 22:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ez4M9s/t"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB7E2AE96;
	Sun,  2 Mar 2025 22:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740952964; cv=none; b=EaL+stgKO6uAX3iwMvAiLZTaS5V8krZNW8Mzjr77K61bjzAtE2o0KZ3GChoTQ+B6+4cyPeW+asCddoh4umexRStY99bGrc3hrDPz/SBuh61boEy1ARt7LR+HcB7Z4dXq3eiI66Hgeb9hnDRKefYQhlRV5UoyXc0K3bfXdB8SxXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740952964; c=relaxed/simple;
	bh=KH5JszRKmU5TT/u6jheUA2cvRxsZb+VYGm/ULpbieeU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cuht3upA59lJUSu5rL6WYbLge7dB5FzJ3WrnYNVKDk4PI7/8Riuf/sKtHZHbeW8JIGzbshd3MDzFX6pPkFrKf7KzdaR4wMxqMp2iQxKywv00pzl+9CzpbuP3XagBQ7Y4fZB+5bYpmyJ9SUfMZBeRzvATcptFGhljrH7VVonaokE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ez4M9s/t; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-51eb1a6954cso1567919e0c.0;
        Sun, 02 Mar 2025 14:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740952961; x=1741557761; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4o7NU/pDwXmJG1nln3D4KJpk/5AsulXf0XfkA2BzZAE=;
        b=Ez4M9s/twlLEB4iI81Al5yBrKSkFwiImDqWy699zz3y8eGSx9VOJt/LVg5ugEpUciF
         13yFAEmWU689B4rHu0hl/+ZTgUOm3zItiFwmKWMi9lpkbO4Pid2g7RCHLAOHjoz3Kf3C
         FzEfwGzhn2OC4qHE5sY13Q70Abn+qHDFQFAZ9Rt7G0KgGa+B54PkCmCEKSYdjGEWWx41
         6aPMCSqeeoipBWBlLb67qkh9QNdCCjjTG0BKR5F+PXOSFf0xaM04H/K/74X9sGrWuRx4
         UqzUxaGDmPON09TibqDlgMuTUKIW49dUUTUyoKVykHDKHXeRHo0p+76slTC8uRxlqQBK
         V3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740952961; x=1741557761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4o7NU/pDwXmJG1nln3D4KJpk/5AsulXf0XfkA2BzZAE=;
        b=qaN9BMOZOoK62bahxL3UB4ZoeWRrqcekkDKTzkLELo7wM3htJGDoC/btYjatlN/0dR
         u9g5kBL91xHRaVqJzbxvmeBmLBCr9aSuPmbfn8ChP2lNtdxrMjLGmHm0GNjdIREGGitj
         yF07zNDH1CZUt+SHd1oeXV8U0qur7/NhJg8282bG2VXP7ub9g0mP2y+inw6R+0pqW1zA
         WfHSce12fZbmFAbFGH2GCKASefeywGegWH5fV4VXXaYsP339KT1RGFApKArUeW8jT6Oa
         2IKaDZ/BSqDYxApF/Oc1TYNVHcBFRc2iM8LHYfSUeNiBS5eadHPASTRZw1+El3s8k3lQ
         63NA==
X-Forwarded-Encrypted: i=1; AJvYcCUv5PeYl8EXE3puU/SQUI2DETG89jV0LVb+Y749NzalwlO+cc9JnoyvHRm1vHWP0sicqcrsqBvN@vger.kernel.org, AJvYcCV+4Mx5GCdn8y1F9zL1zrfRXG45r23+V7g+l/DCBXIaNB8n2VG8h7JAhmWumQZFvRJ6DRTxhSX3jKMr@vger.kernel.org, AJvYcCWovAFl04DrPGJtl4zD85Yg7zt81ddo9JHr7aZzOPgvhx8JxZpaC/ZRIq3tNFzkeevMeB/4WC1vfjfewwZbjO7mXVk=@vger.kernel.org, AJvYcCXYhxs/uTkyN2l3kMNRnt+4Vp7Z/FgxxwWUAVTvGs9KN29O7xhOLlZqmxCH77zuuc4AMaCmjmTwJZlXdf1q@vger.kernel.org
X-Gm-Message-State: AOJu0YyBGsIJpKRm9ZY9VuSUf7cyXf+NTkdo5W3cM+9GdF9VQTSMJ+Ep
	wkmCrMPlA4t5jG2v54NxYNG6T7/1vjD4n5CJQDbMKk2QStpTehG78V67jh5hWjdn2LIVnUKZNd9
	qeOtG+7kK7bDndXRpDIlmbFziDtc=
X-Gm-Gg: ASbGncs2z96lpjE3cGzXa4QERd11lbzxzc+WhvP/6mOD3NVIEG7nHeW0bZADeBO6qW9
	kDEQJ8yJSnRojfKcvTZ1POSSOdnliAMhr5M31qyEC+PGGsGocn5lI7Y0sI+bNqGjd1MEfEFOkFk
	uHaIHwRPF5+k6KYV5Bo4BR6MCEpQ==
X-Google-Smtp-Source: AGHT+IHaHwQBDCH2xkw+MZJe3rCw4CZ3uF5ykjKx8f/DQ3Bqq5OROCgix3qYNsKU1Xk1hchICCoOIcmiYwJLu2o1c7o=
X-Received: by 2002:a05:6122:2683:b0:518:773b:39f with SMTP id
 71dfb90a1353d-5235b747589mr7242946e0c.4.1740952961203; Sun, 02 Mar 2025
 14:02:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250302181808.728734-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z8SydsdDsZfdrdbE@shell.armlinux.org.uk> <CA+V-a8vCB7nP=tsv4UkOwODSs-9hiG-PxN6cpihfvwjq2itAHg@mail.gmail.com>
 <Z8TRQX2eaNzXOzV0@shell.armlinux.org.uk>
In-Reply-To: <Z8TRQX2eaNzXOzV0@shell.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 2 Mar 2025 22:02:15 +0000
X-Gm-Features: AQ5f1JotkAWLuW8Zsf6K55YVdVhdnqNspUbBfhFMKRQtavp3U8j0uogdAb0eFLg
Message-ID: <CA+V-a8vykhxqP30iTwN6yrqDgT8YRVE_MadjiTFp653rHVqMNg@mail.gmail.com>
Subject: Re: [PATCH 3/3] net: stmmac: Add DWMAC glue layer for Renesas GBETH
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Russell,

On Sun, Mar 2, 2025 at 9:44=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Sun, Mar 02, 2025 at 09:20:49PM +0000, Lad, Prabhakar wrote:
> > Hi Russell,
> > > What is the reason for setting this flag? If it's because of suspend/
> > > resume failures, does my "net: stmmac: fix resume failures due to
> > > RX clock" series solve this for you without requiring this flag?
> > >
> > Ive set this flag based on the configuration supported by this IP.
> > Unfortunately the platform which I am working on doesn't support s2r
> > yet so I cannot test suspend/resume path yet. But I do see an issue
> > when I unload and load just the glue module the DMA reset fails.
>
> Thanks for that feedback - that's a scenario I hadn't considered.
>
> I was trying to avoid having to disable LPI RX clock-stop on suspend by
> ensuring that it was enabled at resume time. I think that's valid, but
> you've brought up another similar scenario:
>
> - device is brought up, configures RX clock stop
> - links with media, negotiates EEE
> - driver is unloaded, link doesn't go down, but due to no traffic goes
>   into idle, so RX clock is stopped
> - driver reloaded, RX clock still stopped, reset fails
>
> I would like to solve that so we can get the power savings from
> stopping the clock, but still have reset work when necessary.
>
I would be happy to test the patches ;)

> I'm guessing that the "DMA reset fails" refers to this path:
>
> stmmac_open() -> __stmmac_open() -> stmmac_hw_setup() ->
> stmmac_init_dma_engine() -> stmmac_reset() ?
>
Yes.

> In other words, when the device is being brought back up
> adminsitratively?
>
> What happens if you (replace $if):
>
> # ip li set dev $if down
> # ip li set dev $if up
>
> Does that also fail without STMMAC_FLAG_RX_CLK_RUNS_IN_LPI set?
>
Logs without STMMAC_FLAG_RX_CLK_RUNS_IN_LPI flag set:
--------------------------------------------------------------
root@rzv2h-evk-alpha:~# ip li set dev eth1 down
[   33.606549] renesas-gbeth 15c40000.ethernet eth1: Link is Down
root@rzv2h-evk-alpha:~#
root@rzv2h-evk-alpha:~# ip li set dev eth0 down
[   37.356992] renesas-gbeth 15c30000.ethernet eth0: Link is Down
root@rzv2h-evk-alpha:~#
root@rzv2h-evk-alpha:~# ip li set dev eth1 up
[   43.974803] renesas-gbeth 15c40000.ethernet eth1: Register
MEM_TYPE_PAGE_POOL RxQ-0
[   43.983189] renesas-gbeth 15c40000.ethernet eth1: Register
MEM_TYPE_PAGE_POOL RxQ-1
[   43.991155] renesas-gbeth 15c40000.ethernet eth1: Register
MEM_TYPE_PAGE_POOL RxQ-2
[   43.999128] renesas-gbeth 15c40000.ethernet eth1: Register
MEM_TYPE_PAGE_POOL RxQ-3
[   44.072079] renesas-gbeth 15c40000.ethernet eth1: PHY [stmmac-1:00]
driver [Microchip KSZ9131 Gigabit PHY] (irq=3DPOLL)
[   44.094605] dwmac4: Master AXI performs fixed burst length
[   44.100138] renesas-gbeth 15c40000.ethernet eth1: No Safety
Features support found
[   44.107748] renesas-gbeth 15c40000.ethernet eth1: IEEE 1588-2008
Advanced Timestamp supported
[   44.116725] renesas-gbeth 15c40000.ethernet eth1: registered PTP clock
[   44.123352] renesas-gbeth 15c40000.ethernet eth1: configuring for
phy/rgmii-id link mode
root@rzv2h-evk-alpha:~#
root@rzv2h-evk-alpha:~# ip li set dev eth1[   47.207761] renesas-gbeth
15c40000.ethernet eth1: Link is Up - 1Gbps/Full - flow control off
^C
root@rzv2h-evk-alpha:~# ^C
root@rzv2h-evk-alpha:~# ip li set dev eth0 up
[   55.636722] renesas-gbeth 15c30000.ethernet eth0: Register
MEM_TYPE_PAGE_POOL RxQ-0
[   55.645139] renesas-gbeth 15c30000.ethernet eth0: Register
MEM_TYPE_PAGE_POOL RxQ-1
[   55.653111] renesas-gbeth 15c30000.ethernet eth0: Register
MEM_TYPE_PAGE_POOL RxQ-2
[   55.661073] renesas-gbeth 15c30000.ethernet eth0: Register
MEM_TYPE_PAGE_POOL RxQ-3
[   55.732087] renesas-gbeth 15c30000.ethernet eth0: PHY [stmmac-0:00]
driver [Microchip KSZ9131 Gigabit PHY] (irq=3DPOLL)
[   55.754612] dwmac4: Master AXI performs fixed burst length
[   55.760143] renesas-gbeth 15c30000.ethernet eth0: No Safety
Features support found
[   55.767740] renesas-gbeth 15c30000.ethernet eth0: IEEE 1588-2008
Advanced Timestamp supported
[   55.776705] renesas-gbeth 15c30000.ethernet eth0: registered PTP clock
[   55.783333] renesas-gbeth 15c30000.ethernet eth0: configuring for
phy/rgmii-id link mode
root@rzv2h-evk-alpha:~#
root@rzv2h-evk-alpha:~# [   58.855844] renesas-gbeth 15c30000.ethernet
eth0: tx_clk_stop=3D1
[   58.861989] renesas-gbeth 15c30000.ethernet eth0: Link is Up -
1Gbps/Full - flow control rx/tx

root@rzv2h-evk-alpha:~#
root@rzv2h-evk-alpha:~#

Logs with STMMAC_FLAG_RX_CLK_RUNS_IN_LPI flag set:
--------------------------------------------------------------
root@rzv2h-evk-alpha:~# ip li set dev eth1 down
[   30.053790] renesas-gbeth 15c40000.ethernet eth1: Link is Down
root@rzv2h-evk-alpha:~# ip li set dev eth0 down
[   35.366935] renesas-gbeth 15c30000.ethernet eth0: Link is Down
root@rzv2h-evk-alpha:~# ip li set dev eth1 up
[   40.448563] renesas-gbeth 15c40000.ethernet eth1: Register
MEM_TYPE_PAGE_POOL RxQ-0
[   40.456725] renesas-gbeth 15c40000.ethernet eth1: Register
MEM_TYPE_PAGE_POOL RxQ-1
[   40.464893] renesas-gbeth 15c40000.ethernet eth1: Register
MEM_TYPE_PAGE_POOL RxQ-2
[   40.472840] renesas-gbeth 15c40000.ethernet eth1: Register
MEM_TYPE_PAGE_POOL RxQ-3
[   40.543895] renesas-gbeth 15c40000.ethernet eth1: PHY [stmmac-1:00]
driver [Microchip KSZ9131 Gigabit PHY] (irq=3DPOLL)
[   40.566419] dwmac4: Master AXI performs fixed burst length
[   40.571949] renesas-gbeth 15c40000.ethernet eth1: No Safety
Features support found
[   40.579550] renesas-gbeth 15c40000.ethernet eth1: IEEE 1588-2008
Advanced Timestamp supported
[   40.588505] renesas-gbeth 15c40000.ethernet eth1: registered PTP clock
[   40.595135] renesas-gbeth 15c40000.ethernet eth1: configuring for
phy/rgmii-id link mode
root@rzv2h-evk-alpha:~#
root@rzv2h-evk-alpha:~# [   43.687551] renesas-gbeth 15c40000.ethernet
eth1: Link is Up - 1Gbps/Full - flow control off

root@rzv2h-evk-alpha:~# ip li set dev eth0 up
[   49.644479] renesas-gbeth 15c30000.ethernet eth0: Register
MEM_TYPE_PAGE_POOL RxQ-0
[   49.652719] renesas-gbeth 15c30000.ethernet eth0: Register
MEM_TYPE_PAGE_POOL RxQ-1
[   49.660681] renesas-gbeth 15c30000.ethernet eth0: Register
MEM_TYPE_PAGE_POOL RxQ-2
[   49.669059] renesas-gbeth 15c30000.ethernet eth0: Register
MEM_TYPE_PAGE_POOL RxQ-3
[   49.740011] renesas-gbeth 15c30000.ethernet eth0: PHY [stmmac-0:00]
driver [Microchip KSZ9131 Gigabit PHY] (irq=3DPOLL)
[   49.762518] dwmac4: Master AXI performs fixed burst length
[   49.768057] renesas-gbeth 15c30000.ethernet eth0: No Safety
Features support found
[   49.775655] renesas-gbeth 15c30000.ethernet eth0: IEEE 1588-2008
Advanced Timestamp supported
[   49.784609] renesas-gbeth 15c30000.ethernet eth0: registered PTP clock
[   49.791236] renesas-gbeth 15c30000.ethernet eth0: configuring for
phy/rgmii-id link mode
root@rzv2h-evk-alpha:~#
root@rzv2h-evk-alpha:~# [   52.871635] renesas-gbeth 15c30000.ethernet
eth0: tx_clk_stop=3D1
[   52.877777] renesas-gbeth 15c30000.ethernet eth0: Link is Up -
1Gbps/Full - flow control rx/tx


Cheers,
Prabhakar

