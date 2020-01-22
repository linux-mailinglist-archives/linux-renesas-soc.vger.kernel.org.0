Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2040145A3F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2020 17:51:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbgAVQvZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Jan 2020 11:51:25 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:39588 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbgAVQvY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Jan 2020 11:51:24 -0500
Received: by mail-oi1-f194.google.com with SMTP id z2so15091oih.6;
        Wed, 22 Jan 2020 08:51:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YgHrm/eRDAbATyHCYt7XJCqYc4ngWaOB9tO9AQpkPhI=;
        b=lb6sgzkcwUpkLL5f3YM0CGVZmIwwEUBgeSN8aEJyMW9UUo4nCBXLQcUpwf5Ct7p37R
         isp+DPrPNjxp8br6T+HRUwOBlLI9xmXKX3/oJN+EGqenyGaEWNOMPsGNcOjRoijwxiiA
         zrzxjKt5LMvx/hVSZSVWWPt/DwEDWHCmjI+XRNz47goY0KYetE2IfwMaCoGgHEgJcQId
         SAtxgwb3dP+0FYkpT5qq6BODOuQT4sN7jT0dV4tfnqPGCUqc4kO0MRpQGqWfId2IKWCX
         lVkPyhs5yfMxXwx5WJWmdYLLrMmcXRGfAla54eB2K0RY/zfdJjFE5L2v300QCIgG/Atv
         8AIQ==
X-Gm-Message-State: APjAAAXBnWi8Wz+YXXYUKLV/33kc/IK0hf+8qNnQ90bEWyD5LuSTS+/Z
        /BFXqHvtTm1tfF5cwdgpk5qXHvD7X44l/mbvNX4=
X-Google-Smtp-Source: APXvYqxJlZ2b+/l9ADmdxd7t0ZwxcdQXgEpClQjkpkvGxw4yF4ABAT0wA9LsJp3VbrjpyM8unQlXHu/sz0v0QhQbkNE=
X-Received: by 2002:aca:1a06:: with SMTP id a6mr7125489oia.148.1579711883817;
 Wed, 22 Jan 2020 08:51:23 -0800 (PST)
MIME-Version: 1.0
References: <20200116101447.20374-1-gilad@benyossef.com>
In-Reply-To: <20200116101447.20374-1-gilad@benyossef.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 22 Jan 2020 17:51:12 +0100
Message-ID: <CAMuHMdUhR83SZyWX9Du9d3Sp4A48x_msKaOHGsa88EQKStEDQg@mail.gmail.com>
Subject: Re: [PATCH 00/11] crypto: ccree - fixes and cleanups
To:     Gilad Ben-Yossef <gilad@benyossef.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Ofir Drang <ofir.drang@arm.com>, Hadar Gat <hadar.gat@arm.com>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Gilad,

On Thu, Jan 16, 2020 at 11:25 AM Gilad Ben-Yossef <gilad@benyossef.com> wrote:
> A bunch of fixes and code cleanups for the ccree driver

Thank you!

I wanted to give this a try, but it looks like CCREE is no longer working
on R-Car H3, both with/without this series.

E.g. with renesas-devel[*] and renesas_defconfig +
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=n, I get the following crash:

ccree e6601000.crypto: ARM CryptoCell 630P Driver: HW version
0xAF400001/0xDCC63000, Driver version 5.0
alg: No test for authenc(xcbc(aes),cbc(aes)) (authenc-xcbc-aes-cbc-aes-ccree)
alg: No test for authenc(xcbc(aes),rfc3686(ctr(aes)))
(authenc-xcbc-aes-rfc3686-ctr-aes-ccree)
------------[ cut here ]------------
kernel BUG at kernel/dma/swiotlb.c:497!
Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
CPU: 7 PID: 189 Comm: cryptomgr_test Not tainted 5.5.0-rc7-arm64-renesas #463
Hardware name: Renesas Salvator-X 2nd version board based on r8a77951 (DT)
pstate: 80000005 (Nzcv daif -PAN -UAO)
pc : swiotlb_tbl_map_single+0x30c/0x380
lr : swiotlb_map+0xb0/0x300
sp : ffff800012313430
x29: ffff800012313430 x28: 0000000000000000
x27: 0000000000000000 x26: 0000000738e7e000
x25: ffff0006fa5f8010 x24: 0000000000000000
x23: ffff800011aed000 x22: 0000000000000000
x21: 0000000000000000 x20: 00000000000e8000
x19: ffff80001105e000 x18: ffffffffffffffff
x17: 0000000000000007 x16: 0000000000000001
x15: ffff800010f5f908 x14: ffff800092313cf7
x13: ffff0006ff0b4000 x12: 0000000000000001
x11: 0000000000000003 x10: 0000000000200000
x9 : 0000000000000000 x8 : 0000000000000001
x7 : ffff800011aed9e0 x6 : 0000000000000000
x5 : 0000000000000000 x4 : 0000000000000000
x3 : 0000000000000000 x2 : 0000000000000000
x1 : 0000000074000000 x0 : 0000000000000000
Call trace:
 swiotlb_tbl_map_single+0x30c/0x380
 swiotlb_map+0xb0/0x300
 dma_direct_map_page+0xb8/0x140
 dma_direct_map_sg+0x78/0xe0
 cc_map_sg+0x10c/0x1a8
 cc_map_aead_request+0x160/0x990
 cc_proc_aead+0x140/0xef8
 cc_aead_encrypt+0x48/0x68
 crypto_aead_encrypt+0x20/0x30
 test_aead_vec_cfg+0x20c/0x848
 test_aead+0xb8/0x140
 alg_test_aead+0x94/0x178
 alg_test+0x108/0x3f8
 cryptomgr_test+0x40/0x48
 kthread+0x11c/0x120
 ret_from_fork+0x10/0x18
Code: f9402fbc 17ffffa0 f9000bb3 f9002fbc (d4210000)
---[ end trace 272124cd4e3fd6f0 ]---
note: cryptomgr_test[189] exited with preempt_count 1
------------[ cut here ]------------

FWIW, the same happens on R-Car H3 ES1.0.
I haven't tried investigating when it stopped working.
I stopped running the crypto manager tests when they were broken by
CONFIG_HARDENED_USERCOPY_PAGESPAN=y.

Do you have a clue?
Thanks!

[*] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
