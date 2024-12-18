Return-Path: <linux-renesas-soc+bounces-11541-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DD89F6822
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 15:21:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E213B16CB3B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 14:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0F911B423A;
	Wed, 18 Dec 2024 14:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LqvzIN7w"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1549970819;
	Wed, 18 Dec 2024 14:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734531655; cv=none; b=Unn/X1GEzYbN1VZautTi4ouGWM2B+dXLxT3cr2IDfvFJ9J7qRfeFdogYJVjLl11Sx3tieYENdU6InbaA1DhIFcHx5YjVCTIZ3ddFE5sBhxtolXCRZa515j+8DtVHGghmrGND3D0EqCWr04/larzZmtbvKnSHhtMpwMtGIYruLq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734531655; c=relaxed/simple;
	bh=w3gF/r4BB1ATsGbLCnA93cumxvQTXrlpcz/mT/97FSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XbUK4XnsycnFDGYnCpHx9CUphd6j1ea/IofhTSw8/h1SHwh52EYbP58pYHhovcb+iQgbRX4mhdwbAXT99fp6euFA0ZDej3GWC6nE9Q/3y5dcTwB0mycnaFhkwbrwRfSYT5UMGCm8ETsTfv+NLYNhnRiSGdNYSR+RY/uqoWDfm84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LqvzIN7w; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-385df53e559so5293983f8f.3;
        Wed, 18 Dec 2024 06:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734531652; x=1735136452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/+y/YSUxPtfDmBJdtycZ9jo8pi4P6L+XpuOz8AqooA=;
        b=LqvzIN7wqhuzzCzKFNIBEhM1RZcWi+W24tx6OftV+0R5/+jsgj9lmgVbEzgVcL2xN4
         bC8kQ1OdXoOT39h/mjAZ1Znm+hw3kB2QFYvHejJlz8ytuL4fFDqh3YRtzYDU6QGRfOYJ
         8Z2PylBY7kHhe0yueCxjN/NnOl3l4Ll3CSm1FOeTEE5aCfS92PrnDi05a604jqBZTvdO
         RHweV8MQHOQeNenF/AOSBlvGfap04/Xq6UzGceSPehDKQ/1hmUDAbBIxlNwkZCxcutN/
         kPUh9LXOnRfzOP53MrjN0iO4DfygcXogkDidb79CO7qz66XRgBR6woKXxvp35EitY/8J
         CaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734531652; x=1735136452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s/+y/YSUxPtfDmBJdtycZ9jo8pi4P6L+XpuOz8AqooA=;
        b=s62eac0qXd/8v1yTSl0XVL8DC9E+xmdDfQiJCc1vHgOGKifPMHWKt7fxO8zZ+bz8ZA
         5vL/spNMYT34DNZe+rmn7Ps9FPg32UfmkFtz9NnxZ5nQHyApwiRwHh/AMRBEK2eRkBpt
         Saio1BgLMhfyQDp/f1QgpwRgtEH+Z1etKdfbuXSml08JjihAyt6pdw+k9+gL/uW504Fl
         q8qsBp/ev80g02dJKjAccZM9dJUbYk1odIMBEzyxX+j68F3EWzY8AlMJUKwE51AwgPyv
         ABhr9AGqtVjhqp7OtJaOIX3E6KLY+qFfe0QiNWirjGrFeYx8BoMCv+w6Tw0t/KdbPYhu
         KEsg==
X-Forwarded-Encrypted: i=1; AJvYcCUXohMUj9ZbVGhWW82Swr5jcNzb7T9e2W5e6K/Kk3Z1atdP9KE5H7pUJyzbvNPAvzN/sKVUjV5RV/KK00jv@vger.kernel.org, AJvYcCXji+BS3jaH4lzqJsifDj7Vke+KEIMK64FUvDMABg2NSfbxDwPzxTNp4ZOo70qPRZbe7YpxEHLX3CA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFh1BTTRqmXiNKd55L4u7JUhWxNlijRK4bz/h0K/DrEarhncig
	IZPnaoavigbJx4zXDSxmwb8np8oIpi/JbOmi3mlAwBZ1ynQxVYTm
X-Gm-Gg: ASbGncss35sRKKmhwSVennAKpGh+Mvh6Rq911RZh7DmjIGsRxEf8VGdqxy30GlBW0xv
	/xjSrx93cKpYBVyomUh3/pJeydwFV/fAnBJMhnJlt3uDugX5MD0HsZ1XibPN2epTSLNaNsHF1U9
	X8OF13nhjT34HjZfCI0z1b4c0gm4XKArUSJeoxEZ7Hm2o1zwRAF58E7FwkyLFNRXfls6hkzP9BJ
	FDJGNPbxibFBTh9WJj/mVXBLcaqTVF9peCqg7kxHWWdRYDVFrnKHr8jIEIuR4oTr/ANjj9h33u8
	lxPi69qAmw==
X-Google-Smtp-Source: AGHT+IEG3STtRHw+ncLc1DbtulvKP7OjyY10VgRPs0+i1Bs5Rmn0XyXuwSpqZlcaS/5mLuwJ5uqslA==
X-Received: by 2002:a05:6000:4916:b0:386:37f5:99e7 with SMTP id ffacd0b85a97d-388e4d64938mr3055400f8f.33.1734531651992;
        Wed, 18 Dec 2024 06:20:51 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:9516:68be:c7cd:69f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c801ac68sm14107033f8f.51.2024.12.18.06.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 06:20:50 -0800 (PST)
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
Subject: [PATCH 1/5] clk: renesas: rzv2h: Fix use-after-free in MSTOP refcount handling
Date: Wed, 18 Dec 2024 14:20:41 +0000
Message-ID: <20241218142045.77269-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241218142045.77269-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241218142045.77269-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Avoid triggering a `refcount_t: addition on 0; use-after-free.` warning
when registering a module clock with the same MSTOP configuration. The
issue arises when a module clock is registered but not enabled, resulting
in a `ref_cnt` of 0. Subsequent calls to `refcount_inc()` on such clocks
cause the kernel to warn about use-after-free.

[    0.113529] ------------[ cut here ]------------
[    0.113537] refcount_t: addition on 0; use-after-free.
[    0.113576] WARNING: CPU: 2 PID: 1 at lib/refcount.c:25 refcount_warn_saturate+0x120/0x144
[    0.113602] Modules linked in:
[    0.113616] CPU: 2 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc3+ #446
[    0.113629] Hardware name: Renesas RZ/V2H EVK Board based on r9a09g057h44 (DT)
[    0.113641] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    0.113652] pc : refcount_warn_saturate+0x120/0x144
[    0.113664] lr : refcount_warn_saturate+0x120/0x144
[    0.113675] sp : ffff8000818aba90
[    0.113682] x29: ffff8000818aba90 x28: ffff0000c0d96450 x27: ffff0000c0d96440
[    0.113699] x26: 0000000000000014 x25: 0000000000051000 x24: ffff0000c0ad6480
[    0.113714] x23: ffff0000c0d96200 x22: ffff800080fae558 x21: 00000000000001e0
[    0.113730] x20: ffff0000c0b11c10 x19: ffff8000815ae6f0 x18: 0000000000000006
[    0.113745] x17: ffff800081765368 x16: 0000000000000000 x15: 0765076507720766
[    0.113760] x14: ffff8000816a3ea0 x13: 0765076507720766 x12: 072d077207650774
[    0.113776] x11: ffff8000816a3ea0 x10: 00000000000000ce x9 : ffff8000816fbea0
[    0.113791] x8 : 0000000000017fe8 x7 : 00000000fffff000 x6 : ffff8000816fbea0
[    0.113806] x5 : 80000000fffff000 x4 : 0000000000000000 x3 : 0000000000000000
[    0.113821] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000c0158000
[    0.113837] Call trace:
[    0.113845]  refcount_warn_saturate+0x120/0x144 (P)
[    0.113859]  rzv2h_cpg_probe+0x7f8/0xa38
[    0.113874]  platform_probe+0x68/0xdc
[    0.113890]  really_probe+0xbc/0x2c0
[    0.113901]  __driver_probe_device+0x78/0x120
[    0.113912]  driver_probe_device+0x3c/0x154
[    0.113923]  __driver_attach+0x90/0x1a0
[    0.113933]  bus_for_each_dev+0x7c/0xe0
[    0.113944]  driver_attach+0x24/0x30
[    0.113954]  bus_add_driver+0xe4/0x208
[    0.113965]  driver_register+0x68/0x124
[    0.113975]  __platform_driver_probe+0x54/0xd4
[    0.113987]  rzv2h_cpg_init+0x24/0x30
[    0.113998]  do_one_initcall+0x60/0x1d4
[    0.114013]  kernel_init_freeable+0x214/0x278
[    0.114028]  kernel_init+0x20/0x140
[    0.114041]  ret_from_fork+0x10/0x20
[    0.114052] ---[ end trace 0000000000000000 ]---

Resolve this by checking the `ref_cnt` value before calling
`refcount_inc()`. If `ref_cnt` is 0, reset it to 1 using `refcount_set()`.

Fixes: 7bd4cb3d6b7c ("clk: renesas: rzv2h: Relocate MSTOP-related macros to the family driver")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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


