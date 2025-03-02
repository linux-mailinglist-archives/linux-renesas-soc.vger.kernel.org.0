Return-Path: <linux-renesas-soc+bounces-13873-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D85A4B4E5
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 22:21:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F3D216C79D
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 21:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 857481EB9FF;
	Sun,  2 Mar 2025 21:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vhz3YW7d"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24751BCA07;
	Sun,  2 Mar 2025 21:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740950480; cv=none; b=jtc30/Km+3OOJgnGBswSc0/2e+ijsQjGJpM/2O5J0m18TTbDXWYfWt8OnjHS/pUL23W7nt5nuO3L8DLa7fQBf2SudrpnFNIX/Y9W6hP8xjJrYEuAG2WytvveZj8yDdLTF95SaBv2RcNzDo3Z8fJFqIb0od06VS6a/LWDnkGYwtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740950480; c=relaxed/simple;
	bh=xTfRSqBHOFVG1tRwMCW1MlXki2Q/fygcJM02eKWoqNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gxe+sJZEDSyUzZPZmH+uPwJlyghEtrzen6BCeqBEYPu8R/LjFKANvdK5BonGZKpZVtYT7+FbcZ9RzDzDdvlZRE+hlUCnr5Kx2pVvXSzIFk7djBj4/vW6mAiqiyh6wg3WrJkoZso2MIqkSIGRW66TDR5i7y7i3lUQPQeXROZUgdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vhz3YW7d; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-52361a772e7so2127742e0c.1;
        Sun, 02 Mar 2025 13:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740950477; x=1741555277; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZ4XxuBTD+4sZmG7IOT/71c5zCQRO8QX30E8ggEGogA=;
        b=Vhz3YW7d5fwoF+QdjRvjEPjTZcj6/+fAyufISw+iTRVJgSPUJJq5hdFl/KDG5RiKQT
         MS0jimwqxrgJ2BRCfGdETr7ZI4kDhZC7brPNdfbpB8FAXRfCHJtZmuSw7YV22GcxoyCw
         rx0tohLBfaOwbEncBm1caoUnr0lQMwAlT0PwrbyAtQsr93gmRllpH6MOyv/Pp3wE3jHy
         e72Uz6Tx+zOtbOglfu0vYpvTclq+aEvWqfa3vQ2DsaH0dYS8Rurx5ju6C3SJuv3DhPFw
         5jOs4CNEsYO+Lt2sDJJTFT6CwDEiGhvYARN8qaKjdDwxPeO4vyQpmM0sqIIEvhIhQ3c2
         0pEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740950477; x=1741555277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bZ4XxuBTD+4sZmG7IOT/71c5zCQRO8QX30E8ggEGogA=;
        b=CBmPQXgX3uvzLXl3sIlEy2AEPAj3VbvFB4EhK+KiVOCmKpgFlWkaIccCMiq7KcLDg/
         pxUbgyTIkNEwkJbdbtVwwOSYMnBzTwtXBDIsN3hRFmNuFwInrJSyRxL76M/RX9Hhh+6H
         s9TiHlEXV09GINIZGwztYyJTwacAX45Z93igAWTtfoNsuJG7Cx1PHHYGKlY57JP8usFN
         p5eQe5ZyTBfkPlt1eJtAI8xlgyCkXwp9BSSuE7bbC0oBMc7EvKo1hXgWOnYeO5iTjsM8
         gFEl9C9b+uTqUe3OkGTZBZkq+6K4f8Uj9G47OVuy0tiOShmbss+QGTSHdQanH8WsOvtY
         N3ig==
X-Forwarded-Encrypted: i=1; AJvYcCV0M+xPTk5UaM+9iKp9qVSCZU4w8xiJzQKTigaq/HPpzrPyyPpwki+3v/Zj9xyOyc6hDRHk15ZmQFH6eMCMJMtYpDo=@vger.kernel.org, AJvYcCVOqhe+eYeFngF5UBSLZBc5zib5zf4F8qiHul7Y+yaZ+tFCHYwdY76TsEeLs7MzhKJ82a2/oBz2@vger.kernel.org, AJvYcCX2cTopOEEVkejrPZvV5wHa/l/WzTTs5jJiASGq2eQ5ttmtGWHrGTBGhMnrdzsvJXNnw2mHhzAbZvmY@vger.kernel.org, AJvYcCXj5AY8xZqH7yOij5Bdv3PDHsHqUcBJKneFmqZnoBsVqvfwpEbTDo15bxab7PgoHiWOF2Hum3Ls0S81CWOp@vger.kernel.org
X-Gm-Message-State: AOJu0YymxTThXsKa7A7naPiZXoI6mKI7Cmbq9VwzltQXupLbvGK71dMb
	N214sloOZYpdTxDe8IyIYOkkyT9vK9hRUo99hsKhmeslEkpRXJIrJ8uuEha1sdr8ROtAmkZ+y5b
	EdmOiv94TIYYVrLWDryuju7YtPqk=
X-Gm-Gg: ASbGncti5xSO0trTHgFCrhC7lqE2NJ1/OjT2BvJFDCqT0E0x/ZMq9pV3VIxZsEOvlnS
	LtFQC5zFiCM+ye69DBFFSh9NE4ueew0kOa/mUdDufStAq6M+07zc9rEf5zrSnuxDG9V+iP0a2JU
	YuzjmuBc6drqcSJ7zOSCcuPW6A5k0zUeNLBy0Uiv2AhOpY4kxJbY1wY+8clDw=
X-Google-Smtp-Source: AGHT+IHbEI4LGTzbYr7Cu1PQ83dnI3KkCuaGzCo5OdoQKnJpH1ludfdMSEbh20A9qCN+bd40I33I3ykrgRoJS2uVkKA=
X-Received: by 2002:a05:6122:7d3:b0:51f:a02b:45d4 with SMTP id
 71dfb90a1353d-52358fa7163mr6310070e0c.1.1740950477468; Sun, 02 Mar 2025
 13:21:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250302181808.728734-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <Z8SydsdDsZfdrdbE@shell.armlinux.org.uk>
In-Reply-To: <Z8SydsdDsZfdrdbE@shell.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 2 Mar 2025 21:20:49 +0000
X-Gm-Features: AQ5f1JrwOf4evJu0dRbr26Glrx9JrQB2_tvTSBkUIknESy1F3W1dkcJ7lek6Alw
Message-ID: <CA+V-a8vCB7nP=tsv4UkOwODSs-9hiG-PxN6cpihfvwjq2itAHg@mail.gmail.com>
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

On Sun, Mar 2, 2025 at 7:33=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Sun, Mar 02, 2025 at 06:18:08PM +0000, Prabhakar wrote:
> > +     gbeth->dev =3D dev;
> > +     gbeth->regs =3D stmmac_res.addr;
> > +     plat_dat->bsp_priv =3D gbeth;
> > +     plat_dat->set_clk_tx_rate =3D stmmac_set_clk_tx_rate;
>
> Thanks for using that!
>
Yep, it shortens the glue driver further.

> > +     plat_dat->flags |=3D STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
> > +                        STMMAC_FLAG_EN_TX_LPI_CLOCKGATING |
>
> I would like to know what value tx_clk_stop is in
> stmmac_mac_enable_tx_lpi() for your setup. Ideally, stmmac should
> use the capability report from the PHY to decide whether the
> transmit clock can be gated, but sadly we haven't had any support
> in phylib/phylink for that until recently, and I haven't modified
> stmmac to allow use of that. However, it would be good to gain
> knowledge in this area.
>
tx_clk_stop =3D1,

root@rzv2h-evk-alpha:~# ifconfig eth0 up
[  587.830436] renesas-gbeth 15c30000.ethernet eth0: Register
MEM_TYPE_PAGE_POOL RxQ-0
[  587.838636] renesas-gbeth 15c30000.ethernet eth0: Register
MEM_TYPE_PAGE_POOL RxQ-1
[  587.846792] renesas-gbeth 15c30000.ethernet eth0: Register
MEM_TYPE_PAGE_POOL RxQ-2
[  587.854734] renesas-gbeth 15c30000.ethernet eth0: Register
MEM_TYPE_PAGE_POOL RxQ-3
[  587.926860] renesas-gbeth 15c30000.ethernet eth0: PHY [stmmac-0:00]
driver [Microchip KSZ9131 Gigabit PHY] (irq=3DPOLL)
[  587.949380] dwmac4: Master AXI performs fixed burst length
[  587.954910] renesas-gbeth 15c30000.ethernet eth0: No Safety
Features support found
[  587.962556] renesas-gbeth 15c30000.ethernet eth0: IEEE 1588-2008
Advanced Timestamp supported
[  587.971420] renesas-gbeth 15c30000.ethernet eth0: registered PTP clock
[  587.978004] renesas-gbeth 15c30000.ethernet eth0: configuring for
phy/rgmii-id link mode
root@rzv2h-evk-alpha:~# [  591.070448] renesas-gbeth 15c30000.ethernet
eth0: tx_clk_stop=3D1
[  591.076590] renesas-gbeth 15c30000.ethernet eth0: Link is Up -
1Gbps/Full - flow control rx/tx

With the below diff:

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index aec230353ac4..68f1954e6eea 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1100,6 +1100,7 @@ static int stmmac_mac_enable_tx_lpi(struct
phylink_config *config, u32 timer,
        struct stmmac_priv *priv =3D netdev_priv(to_net_dev(config->dev));
        int ret;

+       netdev_err(priv->dev, "tx_clk_stop=3D%d\n", tx_clk_stop);
        priv->tx_lpi_timer =3D timer;
        priv->eee_active =3D true;

> > +                        STMMAC_FLAG_RX_CLK_RUNS_IN_LPI |
>
> What is the reason for setting this flag? If it's because of suspend/
> resume failures, does my "net: stmmac: fix resume failures due to
> RX clock" series solve this for you without requiring this flag?
>
Ive set this flag based on the configuration supported by this IP.
Unfortunately the platform which I am working on doesn't support s2r
yet so I cannot test suspend/resume path yet. But I do see an issue
when I unload and load just the glue module the DMA reset fails.

Cheers,
Prabhakar

