Return-Path: <linux-renesas-soc+bounces-4049-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 154CA88C82C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Mar 2024 16:56:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 803FA1F816CD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Mar 2024 15:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B9F912D772;
	Tue, 26 Mar 2024 15:55:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991A113AD03;
	Tue, 26 Mar 2024 15:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711468507; cv=none; b=Io85kPCaKdex7OMsTbxTRqokXyqG4W+D0gYe/vGsn2B4g2VDGTCd1XogZh+KssGSo+b3jg6LMP98fLe+WE8jtQaSKf+NgyHubKzZJj7PtWn3ElCzHCPJXKJA8UPuzeaMs/1Z9nwK/QyC403ADlr2MVmh4S3CdFN/aXEU+ghI0uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711468507; c=relaxed/simple;
	bh=rJDyfJ3XSrGmNiRiW+65lbXsRSEddzB5+6+feUOvWYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gk9RyI1e5UwmJm00bfzYpphcr3qfkfLuhkDNSOrvQ0TeKI+TeONvGxIi4Ey+zmufQm31Ewg+m7LQw08LgCc+DYQIldtIZHZ5rH4adkrSN69tqnpb7t0MfUkSTNuw9+y5AjTZKzV+bOxczXmS/IkpIzvWKrHqN3g126nGzW40+Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-609fb19ae76so66132997b3.2;
        Tue, 26 Mar 2024 08:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711468503; x=1712073303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dj0Lc6+e0UNvbyLGtpCNAT0/T8goedOmII803HBAXng=;
        b=dDwt1rH3Po62MmTCjehvKESstE1HoicCJLRa94fvR4kLCD+TtFEwP5nt0+lPPfJL+v
         PJpAdEIgIoMIwoq94Et2FekIslI/2tokXtyVBGLRfftXWnXp5Svwjg+sMwtqCjXh3fKB
         h8HP4DG05DKDn2a9xAZPsTMfzwAw1rfK/fvTCdn7c+wz7WQLd4J+orA/wDImIZDTCyZF
         oeiSR9rkT0kLWkrMnqsb4K64D4hEeA82LDnwI8uspVyPVI4tMlfl+6VXQ9lcETdcK3fa
         z5o0dAw77aUAHElnbODQdbLhcscT9HJFFZe1zRaciZp0CKn+XUUGJ2GmaJBqQsC8v8Uh
         390w==
X-Forwarded-Encrypted: i=1; AJvYcCWnVSnh81WhZAc6+HqmB4ngCMJNPC+ZD3bj+hA6eUdIiIB7BRvNtIulFcqG0yvKzeH4jj3vtQPIjZK2MCGno2gg0Q+0tfwd1WTvmyOz60sg59iHFxuzkHH4GuvINu5zaEHxd6VDaWPAn/Nf1n4q
X-Gm-Message-State: AOJu0Yy8h3lMlr74aPW0qm8F6hsE1nMICYsQlbuRlSwIYPeBBa8b6Xft
	tmUI/UdVWrqTp4dn/Ye/99Z2LzH1LMeU9wvHEwNcn2a4u7Oj/yVK/Y3JX7ieS7g=
X-Google-Smtp-Source: AGHT+IEbwp1CeFFJXgx9A2wQqnumn4tMMViP8fOt9qt6YE+CwCTmgVwSCoZw5J/iGASD/Fz942nnMA==
X-Received: by 2002:a25:800b:0:b0:dcb:ce4a:bc2b with SMTP id m11-20020a25800b000000b00dcbce4abc2bmr33791ybk.51.1711468502650;
        Tue, 26 Mar 2024 08:55:02 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id p5-20020a257405000000b00dc6d6dc9771sm1522254ybc.8.2024.03.26.08.55.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Mar 2024 08:55:02 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dbed0710c74so4784003276.1;
        Tue, 26 Mar 2024 08:55:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWVmwzmz4sFXYpwtAPpzJX2KOlbJZJ/+PASFoBIpbp4JlwJhMIX/it9hMU9YLpiTbMjJbFc7/DWIWXOMz64ImbgCtrVYJ0Uhyaa/hq3oJrEmjY1IFGBn6VMDeBv0xXlsJnshLKZrB2XNT0AoyIu
X-Received: by 2002:a25:8802:0:b0:dcb:f733:88d8 with SMTP id
 c2-20020a258802000000b00dcbf73388d8mr65906ybl.11.1711468501748; Tue, 26 Mar
 2024 08:55:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240309155608.1312784-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240309155608.1312784-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 26 Mar 2024 16:54:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXBhpbH2=21e26BeuknpW08eoX_yG4UQg-Ep5TijY3Vfw@mail.gmail.com>
Message-ID: <CAMuHMdXBhpbH2=21e26BeuknpW08eoX_yG4UQg-Ep5TijY3Vfw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: white-hawk: ethernet: Describe
 avb1 and avb2
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Sat, Mar 9, 2024 at 4:56=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Describe the two Marvel 88Q2110/QFN40 PHYs available on the R-Car V4H
> White Hawk RAVB/Ethernet(1000Base-T1) sub-board. The two PHYs are wired
> up on the board by default, there is no need to move any resistors which
> are needed to access other PHYs available on this sub-board.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

When accidentally booting a kernel without CONFIG_MARVELL_88Q2XXX_PHY=3Dy,
I am greeted with the following warning splat (same for the second PHY):

-mv88q2110 e6810000.ethernet-ffffffff:00: attached PHY driver
(mii_bus:phy_addr=3De6810000.ethernet-ffffffff:00, irq=3DPOLL)
+Generic Clause 45 PHY e6810000.ethernet-ffffffff:00: attached PHY
driver (mii_bus:phy_addr=3De6810000.ethernet-ffffffff:00, irq=3DPOLL)
+rcar-du feb00000.display: adding to PM domain always-on
-mv88q2110 e6820000.ethernet-ffffffff:00: attached PHY driver
(mii_bus:phy_addr=3De6820000.ethernet-ffffffff:00, irq=3DPOLL)
+rcar-du feb00000.display: removing from PM domain always-on
+------------[ cut here ]------------
+_phy_start_aneg+0x0/0xa8: returned: -22
+WARNING: CPU: 2 PID: 55 at drivers/net/phy/phy.c:1262
_phy_state_machine+0x120/0x198
+Modules linked in:
+CPU: 2 PID: 55 Comm: kworker/2:1 Not tainted
6.9.0-rc1-white-hawk-02587-g577b6a49a6d4 #235
+Hardware name: Renesas White Hawk CPU and Breakout boards based on
r8a779g0 (DT)
+Workqueue: events_power_efficient phy_state_machine
+pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
+pc : _phy_state_machine+0x120/0x198
+lr : _phy_state_machine+0x120/0x198
+sp : ffffffc082dd3d10
+x29: ffffffc082dd3d10 x28: ffffff8440089c05 x27: ffffffc081090000
+x26: ffffffc080e03008 x25: 0000000000000000 x24: ffffffc0815603d0
+x23: ffffffc080e03008 x22: ffffff86bef98100 x21: 0000000000000004
+x20: 0000000000000001 x19: ffffff84435b3000 x18: 0000000000000000
+x17: 0000000000000000 x16: 0000000000000000 x15: 0720072007320732
+x14: 072d0720073a0764 x13: 0720072007320732 x12: 072d0720073a0764
+x11: 000000000000033a x10: ffffffc0810b9ac8 x9 : ffffffc081379ca8
+x8 : ffffffc082dd3a18 x7 : ffffffc082dd3a20 x6 : 00000000ffff7fff
+x5 : c0000000ffff7fff x4 : 0000000000000000 x3 : 0000000000000001
+x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffffff8440a98000
+Call trace:
+ _phy_state_machine+0x120/0x198
+ phy_state_machine+0x2c/0x5c
+ process_scheduled_works+0x314/0x4d4
+ worker_thread+0x1b8/0x20c
+ kthread+0xd8/0xe8
+ ret_from_fork+0x10/0x20
+irq event stamp: 16
+hardirqs last  enabled at (15): [<ffffffc080913144>]
_raw_spin_unlock_irq+0x2c/0x40
+hardirqs last disabled at (16): [<ffffffc08090d434>] __schedule+0x1cc/0x87=
0
+softirqs last  enabled at (0): [<ffffffc0800800f8>] copy_process+0x698/0x1=
924
+softirqs last disabled at (0): [<0000000000000000>] 0x0
+---[ end trace 0000000000000000 ]---

Is that expected behavior?
Thanks!

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

