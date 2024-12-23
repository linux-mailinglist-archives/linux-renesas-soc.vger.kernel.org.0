Return-Path: <linux-renesas-soc+bounces-11690-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AFA9FB395
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Dec 2024 18:37:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1836218852DC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Dec 2024 17:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C9AE1BBBEE;
	Mon, 23 Dec 2024 17:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Clq8l3iM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802DE1B87F3;
	Mon, 23 Dec 2024 17:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734975445; cv=none; b=D/l2dV1Pkz8b2LXkGX4azOyq+8WBiy1UWbN86VpEi3Drppq8mZA6lgFZdALDQbEJLQlSUs9AkZDVvuNNm/f2GfQaay7oZPQlX16J9ZhLsC4+z+OCMwRQkExUcU3TWHSTCgS1YeLtgP002poW+SHXZBVisEcnMM0tNjs/RthyI8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734975445; c=relaxed/simple;
	bh=QVNhDYuqFebvL2wvEIGQR8f64T2/sgo4ndiSAKl6c9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DBgm+QRtQqMvNt2hnIFWgtrMuqDAh5DzzcV7XKIRYmRt10nDW/WT8CMvXyb8xOLQG+HC+vF6iP8ieCKoKGsR5p22BXoLUDwHzi/Y4sJIK0HgN1/sGbbljv+yC8ZRPJS6IZnrcbNMit1iTWsuqnG2s6C7M+DW39VazrnJGHcpXZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Clq8l3iM; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2f441791e40so3551087a91.3;
        Mon, 23 Dec 2024 09:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734975443; x=1735580243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tn+tVG1j9zn69req4OvxARbCuyNDZJQkqFDwjzKES0=;
        b=Clq8l3iMMO8lh6oBPc5ZshWB0IZXCCqGuZ/ZTPVj8YX5/oa4UIHEyeVrO5YMXe+3mf
         s5evHqGjWZm00avZL+hkzQtfA1ARoIygqoxaOhWFkwzzdO59iXULCCNQohLaEAfIKxgc
         zEm8rjejyy8mqEA8RZMlWrGLTqz1chVlYMgENmYDgXqB49UgvWymB53BPmuVbCjmQkrD
         EazS/K/7/riQ8lDndb/uNxSSMuVLrc2WE0B8/zxpW7Vq/t2W2a9dKjaF0ygASGsAKZ3L
         w+jVajGuBo5Ml5Vos3iXrSAhN4Urjoc8cAnVzQJjDXnC4PnGxoEA4GPRX6YarI8uH/qI
         o6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734975443; x=1735580243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9tn+tVG1j9zn69req4OvxARbCuyNDZJQkqFDwjzKES0=;
        b=WL0qYutnwFMlWJZG7+niGOKFrPLF3yw2TIxMN0ZpiXTJHhd0adLR4jPQ1VkpfG5cTF
         afkUWEbAs1mV9fbJNR+4arnTRyg9/kpvV583ImNbMzrApAsynDofdz5BRp7vqoWlX/a0
         92yt+zr/V7OSqS66meKTLkPLCZMW0Odske6kDEkPjnrS1ZEUAo6cF1/w3qICeCr3ksOn
         bujVzrC/FvfbxBE12zveeK/ISwdJGhXFls7Fqe1fkQ+Rtxttg9ZgQxkBLUELAWbDZS/K
         3WSFaaG/nSZ9TKTnm8T2S3lhWQQFW3AMlXjBp1h5HXtIadjugMukRTrSUjg4TKx7LVf7
         0IIg==
X-Forwarded-Encrypted: i=1; AJvYcCU6YXzp64lFAImLvfkjLu5U9d7gAvF0MJrA5gkhVWLnRWkcSFNRj8IcMNEI/b5VuZr4cpZggi5aAkU=@vger.kernel.org, AJvYcCUDmWSgoAwsFJO8+a1cSr98PBSxdT7N8QYeEZPZF2+zuYtiNgqUUjIHFUklITymUWthxoT7EFuvzVB10kEF@vger.kernel.org
X-Gm-Message-State: AOJu0YyHymMfTNM5qop3V25V5aihRSgNlhvHSRRGFXtMurwsNQTzj+JH
	lWtMXcbpH9yDMOXM56sG8PcqxihtV76GhjQI2KLTF+rt7VTV8HpQ
X-Gm-Gg: ASbGnctL3ddKYb+wdrR8gEXpI/tJRvF0JZjpfrdtuK4ljEPT/EYkiscV9FB/JxU2JGC
	/+7VGvgKIcmUOwX5rWwveTxBs2taC7fAhlsubLM3Vy5dvk7/6LK2/Cl2MIR8Mm2zgnUJC8v10sX
	IBjvMQ1Rw/P2naXFN9tPjPjqpNUP+ufz9nqsPJE+V3Ffvz88nVusYZU5bQ/OC6Akmrsk66m9FHE
	GnBkGtk/DFziS34b9+xdLijXnomLhtdnJrOSpRs5JuzMDqzjkIm5CmLfOGbc6FmeBZBJ4ahQfOJ
	7Enc7cM=
X-Google-Smtp-Source: AGHT+IHfE5/CcQHckgC/mBXTiWmT5t3XA8ENtXOABykBD98PlyQfEiR2vfIKphRB9qDJazXaPLMntw==
X-Received: by 2002:a17:90b:2f04:b0:2ee:f80c:687c with SMTP id 98e67ed59e1d1-2f452eea767mr16773762a91.31.1734975442702;
        Mon, 23 Dec 2024 09:37:22 -0800 (PST)
Received: from prasmi.. ([2401:4900:1c07:689d:b086:b856:9280:38c3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed52cec5sm10664032a91.7.2024.12.23.09.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 09:37:22 -0800 (PST)
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
Subject: [PATCH v2 1/6] clk: renesas: rzv2h: Fix use-after-free in MSTOP refcount handling
Date: Mon, 23 Dec 2024 17:37:03 +0000
Message-ID: <20241223173708.384108-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241223173708.384108-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241223173708.384108-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
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


