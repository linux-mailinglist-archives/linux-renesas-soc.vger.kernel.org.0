Return-Path: <linux-renesas-soc+bounces-11777-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0269FFDC4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2025 19:19:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43DE41617AB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2025 18:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2442F1917FB;
	Thu,  2 Jan 2025 18:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZX8ZCzB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493D613AA5D;
	Thu,  2 Jan 2025 18:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735841932; cv=none; b=F63OCBiLP8H4kg+S5gt89agJun6VC/UdnQ2sqrCv6YKzmtmEhNmGxs9BcXiEo4YPBEYUhby+yfEhpmMcvqSTfaT3ksjavNHAGXOyQxqoaoLpzU8PZbRkDJkrWKLpFEDrHxZARMkM07wPXMY4+As9ZP0AAWkyiPxStHN7pAEjP18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735841932; c=relaxed/simple;
	bh=JmLk4ljuZ7xiX8bADf4dNc7I5vAM/pMGBhfwySLwVe4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mODfTUOo1AATfkts+MffI6lR/gECl1Ov67RpYWCbdKuO4AAuuAHWxB9QVPqe9Qd/z3wf2PrPgSVXg2hKCJj24YLtMS2aV9CSw2KLC2sbsUMYdLSuXtqh+7IoM9i2R6ZD2qlXVl3OGRe8DI7wAXDqgosAI+GOOgoV8baDSIK1bmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZX8ZCzB; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-436a03197b2so31697795e9.2;
        Thu, 02 Jan 2025 10:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735841928; x=1736446728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8F8nI85CSoBO0AFHab1AQK0sPA9I8Q3LIq61hfLXVI=;
        b=MZX8ZCzBzvxBWq217A2ryjrebekNoy8hE4SiYUgTFca1oKuQBKvXXYdRy8Rk2jR30F
         oxGJ8P4LYU6guXOUD3uHtrYR/WKav6Py0aMb4yTvTRclWxyMrSQXJY+wW6k78fvBefDI
         JUWEy4x02jhMUzXJwTrrfbYRYmODCoIX0plurse3qvGbnYcjg4rSE1Nr7k9+wMvsgZbW
         6oEhF0Ac9rsBwOw1xlD1S7rQHHPOxGGMIyUnpInIcvYvjAv1BOQOGK9pvNARByEjpF7/
         opE2GWIAfBaBb/aOBx4qwBa0u8GzuyBxXzpXAL4JdUKyzb5q4Jm2Rgimj+3l745HJ6aE
         PV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735841928; x=1736446728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E8F8nI85CSoBO0AFHab1AQK0sPA9I8Q3LIq61hfLXVI=;
        b=MqVr1NG4B4auOGKYV/1NVwZllXLjrIyoxPzuO77JWay+DCx1YRplOzbE1M82M0r7Cq
         EP7P/u1GqFTBwirm+yiIViIrtDuPudvpCDDr+PYCq8aQq/J5dgIc1WiSbFdDWCQ2v60b
         10UcXMOLgDGTMrgfdUxOFplwm7lcKjPNymwqx4sewp5VsI8i8P6M1TZbRMyGZv2UjOVZ
         zQOEOZVbUSrzOkFTL9gFR47dtyhiQiILFds8uIslNLRIgizMqgSGPhHEHpelANK5ux5j
         Okj1q1vq11/S80v82s1VIRPvVhKPfwhSEu5YhbhRd5h2Htl2cUcgtubi79j59n9a/QZ4
         kqjA==
X-Forwarded-Encrypted: i=1; AJvYcCUFmYpcZMb3SPSMyu0lZPXNyStTlBarvcvwjDnyveBkkELKx8vAphzgw3oqVJm6T0vzcbt9pAlcRSw=@vger.kernel.org, AJvYcCWrRvPeyRFEqJIXwcW/hYhcRaLjhYHNtI3KcP6Zg//CkZcgcWCgTj3X1ESakbf/pti/sgayXTzDZOL/dnqo@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+amZreZT/CTErI41G7ZuinmCjQr/kXKDAtpI8LNPARAa6HEI1
	PXRUvZUttLGvB3Zvb3FyhYj01ZxxyBu/6Ja7PxgHoCZTtWvoPuAh
X-Gm-Gg: ASbGncuopX63xIJYzVbA2x7pCslXynlM2hrmckRGhHoOPNtST/WrpGLoT9d2npoAZiA
	YZrSpuz2IgmtAkOhTeGNl+IMBQS8Osd2e53MMFhuI0XgUq8DgHg5Bj1zhJcoxzVoYqckGG+0xR3
	/IYjT4Of4sdN28zPBB+CCyyonnlM+3/TbrgFD4A8Akq8+r3sFm/XSgbGAMko4qn6tynDGkOzh/I
	o7ZFGVTZDi4Oei4pas9oVuh9vq2mAPKESmpB81koEQ5zP6c6N/s6ekNtMNQhIYn/I1d8fo+J4LZ
	6TlleI4f0g==
X-Google-Smtp-Source: AGHT+IFPD1EWDqDdGpCCElpuTOvOSEJPb4ISn6eD8ISWuPe+ZEUB9gfQDHHQlAPbXHD1tjVDqjgQrg==
X-Received: by 2002:a05:600c:68d7:b0:434:f270:a513 with SMTP id 5b1f17b1804b1-4366d357401mr372196745e9.29.1735841928270;
        Thu, 02 Jan 2025 10:18:48 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:84e9:7adb:b646:c9c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6cbbsm493291925e9.3.2025.01.02.10.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 10:18:47 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 1/6] clk: renesas: rzv2h: Fix use-after-free in MSTOP refcount handling
Date: Thu,  2 Jan 2025 18:18:34 +0000
Message-ID: <20250102181839.352599-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250102181839.352599-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250102181839.352599-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Avoid triggering a `refcount_t: addition on 0; use-after-free.` warning
when registering a module clock with the same MSTOP configuration. The
issue arises when a module clock is registered but not enabled, resulting
in a `ref_cnt` of 0. Subsequent calls to `refcount_inc()` on such clocks
cause the kernel to warn about use-after-free.

[ 0.113529] ------------[ cut here ]------------
[ 0.113537] refcount_t: addition on 0; use-after-free.
[ 0.113576] WARNING: CPU: 2 PID: 1 at lib/refcount.c:25 refcount_warn_saturate+0x120/0x144
[ 0.113602] Modules linked in:
[ 0.113616] CPU: 2 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc3+ #446
[ 0.113629] Hardware name: Renesas RZ/V2H EVK Board based on r9a09g057h44 (DT)
[ 0.113641] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[ 0.113652] pc : refcount_warn_saturate+0x120/0x144
[ 0.113664] lr : refcount_warn_saturate+0x120/0x144
[ 0.113675] sp : ffff8000818aba90
[ 0.113682] x29: ffff8000818aba90 x28: ffff0000c0d96450 x27: ffff0000c0d96440
[ 0.113699] x26: 0000000000000014 x25: 0000000000051000 x24: ffff0000c0ad6480
[ 0.113714] x23: ffff0000c0d96200 x22: ffff800080fae558 x21: 00000000000001e0
[ 0.113730] x20: ffff0000c0b11c10 x19: ffff8000815ae6f0 x18: 0000000000000006
[ 0.113745] x17: ffff800081765368 x16: 0000000000000000 x15: 0765076507720766
[ 0.113760] x14: ffff8000816a3ea0 x13: 0765076507720766 x12: 072d077207650774
[ 0.113776] x11: ffff8000816a3ea0 x10: 00000000000000ce x9 : ffff8000816fbea0
[ 0.113791] x8 : 0000000000017fe8 x7 : 00000000fffff000 x6 : ffff8000816fbea0
[ 0.113806] x5 : 80000000fffff000 x4 : 0000000000000000 x3 : 0000000000000000
[ 0.113821] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000c0158000
[ 0.113837] Call trace:
[ 0.113845]  refcount_warn_saturate+0x120/0x144 (P)
[ 0.113859]  rzv2h_cpg_probe+0x7f8/0xa38
[ 0.113874]  platform_probe+0x68/0xdc
[ 0.113890]  really_probe+0xbc/0x2c0
[ 0.113901]  __driver_probe_device+0x78/0x120
[ 0.113912]  driver_probe_device+0x3c/0x154
[ 0.113923]  __driver_attach+0x90/0x1a0
[ 0.113933]  bus_for_each_dev+0x7c/0xe0
[ 0.113944]  driver_attach+0x24/0x30
[ 0.113954]  bus_add_driver+0xe4/0x208
[ 0.113965]  driver_register+0x68/0x124
[ 0.113975]  __platform_driver_probe+0x54/0xd4
[ 0.113987]  rzv2h_cpg_init+0x24/0x30
[ 0.113998]  do_one_initcall+0x60/0x1d4
[ 0.114013]  kernel_init_freeable+0x214/0x278
[ 0.114028]  kernel_init+0x20/0x140
[ 0.114041]  ret_from_fork+0x10/0x20
[ 0.114052] ---[ end trace 0000000000000000 ]---

Resolve this by checking the `ref_cnt` value before calling
`refcount_inc()`. If `ref_cnt` is 0, reset it to 1 using `refcount_set()`.

Fixes: 7bd4cb3d6b7c ("clk: renesas: rzv2h: Add MSTOP support")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3
- Included RB tag from Geert

v1->v2
- Updated commit description
- Updated fixes tag commit header
---
 drivers/clk/renesas/rzv2h-cpg.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 668a2880b2d3..23c89b0de38a 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -565,8 +565,12 @@ static struct rzv2h_mstop
 			continue;
 
 		if (BUS_MSTOP(clk->mstop->idx, clk->mstop->mask) == mstop_data) {
-			if (rzv2h_mod_clock_is_enabled(&clock->hw))
-				refcount_inc(&clk->mstop->ref_cnt);
+			if (rzv2h_mod_clock_is_enabled(&clock->hw)) {
+				if (refcount_read(&clk->mstop->ref_cnt))
+					refcount_inc(&clk->mstop->ref_cnt);
+				else
+					refcount_set(&clk->mstop->ref_cnt, 1);
+			}
 			return clk->mstop;
 		}
 	}
-- 
2.43.0


