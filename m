Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CED01146703
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2020 12:44:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbgAWLo5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Jan 2020 06:44:57 -0500
Received: from mail-vk1-f196.google.com ([209.85.221.196]:37868 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbgAWLo4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Jan 2020 06:44:56 -0500
Received: by mail-vk1-f196.google.com with SMTP id b129so887345vka.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jan 2020 03:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=benyossef-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nyiurIf26J2PnKEaG0CFQgYd31QfXbKBOura+Qp9DBM=;
        b=tFSNFy7TaEacy7bRpPIqB4cdCI5aO5jI7z4Cz85Gpq+te0ukUI1F9tsIluuVi7pitp
         IASLT0XUDz+7mt6+T5PWGQVi2TyP99a4j7wI8IeGOK8IJfM0ZvZqWOVzMwjZa/SZIlRO
         UhjSe3iGotRv80qlMo4mh8woMNVDkRC7+S8hpJpGFGUCPWKYGpkLj7gJgZcNHyTPTi8N
         n7IT5cBKS3ckzzajq3S2TmVlfBqFqJibhUuToaaVHHQOKdGG9sxZIVOt+He66nhFu/qM
         xZnIkhCjLDz+TZB9Knu+i4BqsL7fdf0Q7KTUfWx0IVfeUvdoCcw3oUaaDvSb5pG4gw22
         tC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nyiurIf26J2PnKEaG0CFQgYd31QfXbKBOura+Qp9DBM=;
        b=qPjB6XyuE5hwQXRdK/C0lN22Lpd5VnL3SCg5xvYont1m/yR935Kro6bUImZ4cwSo1h
         Ow/ssZY1Chsucx2bxSrWHJWkyc0Vr8ku79ddU55YwtJKyt4RQPGkmFX8AfL9kO+T9oVF
         EeOsYv5RE0UIfqzYuaMaPPdx1K7Rfe+khBr3HttQDLHoN3D6S79blEoc0pEhOGOh8Dpz
         GxUFhAdR/M1uVy59geLGT3piPHuAQ6pGCWN0qmqQICkjDLD4YCb4O1ggVLRO2gOM5AEl
         /MfUIUQ3ACGyrnn1Nl4VMyOIUKsxNOUze8yh6MZHjO2mMingyQn8QM2QkehVzJRgnf81
         2nIw==
X-Gm-Message-State: APjAAAVMbG6t6wBsyjgssiKBQC+FXGTMj4q7r7FQJZiF/kXYNbDcl/fK
        xR9RqkAQayGC4wr6aZNNd1Upq7t2qremfvTOk8tTxQ==
X-Google-Smtp-Source: APXvYqzNR8YxDD7XcoX4QE85sxHKmUMY554jZmO4LxS//U6VPPcRLCy7qBezxGpzkc27vKwsef+pT4RGYMyYwlw0Pz0=
X-Received: by 2002:a1f:7cc2:: with SMTP id x185mr9354470vkc.1.1579779895649;
 Thu, 23 Jan 2020 03:44:55 -0800 (PST)
MIME-Version: 1.0
References: <20200116101447.20374-1-gilad@benyossef.com> <CAMuHMdUhR83SZyWX9Du9d3Sp4A48x_msKaOHGsa88EQKStEDQg@mail.gmail.com>
In-Reply-To: <CAMuHMdUhR83SZyWX9Du9d3Sp4A48x_msKaOHGsa88EQKStEDQg@mail.gmail.com>
From:   Gilad Ben-Yossef <gilad@benyossef.com>
Date:   Thu, 23 Jan 2020 13:44:43 +0200
Message-ID: <CAOtvUMfDnoFu8V7sYvhgsstX6fuUk3foq+9FJ6SbUKEFnq-zMw@mail.gmail.com>
Subject: Re: [PATCH 00/11] crypto: ccree - fixes and cleanups
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Ofir Drang <ofir.drang@arm.com>, Hadar Gat <hadar.gat@arm.com>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Wed, Jan 22, 2020 at 6:51 PM Geert Uytterhoeven <geert@linux-m68k.org> w=
rote:
>
> Hi Gilad,
>
> On Thu, Jan 16, 2020 at 11:25 AM Gilad Ben-Yossef <gilad@benyossef.com> w=
rote:
> > A bunch of fixes and code cleanups for the ccree driver
>
> Thank you!
>
> I wanted to give this a try, but it looks like CCREE is no longer working
> on R-Car H3, both with/without this series.
>
> E.g. with renesas-devel[*] and renesas_defconfig +
> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dn, I get the following crash:
>

Thank you for the bug report Geert!

My R-Car board is on loan at the moment to another project. I didn't
see this on our internal test board.
I will track down my R-Car board and reproduce this - hopefully
beginning of next week and will get back to you.

Thanks again,
Gilad

> ccree e6601000.crypto: ARM CryptoCell 630P Driver: HW version
> 0xAF400001/0xDCC63000, Driver version 5.0
> alg: No test for authenc(xcbc(aes),cbc(aes)) (authenc-xcbc-aes-cbc-aes-cc=
ree)
> alg: No test for authenc(xcbc(aes),rfc3686(ctr(aes)))
> (authenc-xcbc-aes-rfc3686-ctr-aes-ccree)
> ------------[ cut here ]------------
> kernel BUG at kernel/dma/swiotlb.c:497!
> Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
> CPU: 7 PID: 189 Comm: cryptomgr_test Not tainted 5.5.0-rc7-arm64-renesas =
#463
> Hardware name: Renesas Salvator-X 2nd version board based on r8a77951 (DT=
)
> pstate: 80000005 (Nzcv daif -PAN -UAO)
> pc : swiotlb_tbl_map_single+0x30c/0x380
> lr : swiotlb_map+0xb0/0x300
> sp : ffff800012313430
> x29: ffff800012313430 x28: 0000000000000000
> x27: 0000000000000000 x26: 0000000738e7e000
> x25: ffff0006fa5f8010 x24: 0000000000000000
> x23: ffff800011aed000 x22: 0000000000000000
> x21: 0000000000000000 x20: 00000000000e8000
> x19: ffff80001105e000 x18: ffffffffffffffff
> x17: 0000000000000007 x16: 0000000000000001
> x15: ffff800010f5f908 x14: ffff800092313cf7
> x13: ffff0006ff0b4000 x12: 0000000000000001
> x11: 0000000000000003 x10: 0000000000200000
> x9 : 0000000000000000 x8 : 0000000000000001
> x7 : ffff800011aed9e0 x6 : 0000000000000000
> x5 : 0000000000000000 x4 : 0000000000000000
> x3 : 0000000000000000 x2 : 0000000000000000
> x1 : 0000000074000000 x0 : 0000000000000000
> Call trace:
>  swiotlb_tbl_map_single+0x30c/0x380
>  swiotlb_map+0xb0/0x300
>  dma_direct_map_page+0xb8/0x140
>  dma_direct_map_sg+0x78/0xe0
>  cc_map_sg+0x10c/0x1a8
>  cc_map_aead_request+0x160/0x990
>  cc_proc_aead+0x140/0xef8
>  cc_aead_encrypt+0x48/0x68
>  crypto_aead_encrypt+0x20/0x30
>  test_aead_vec_cfg+0x20c/0x848
>  test_aead+0xb8/0x140
>  alg_test_aead+0x94/0x178
>  alg_test+0x108/0x3f8
>  cryptomgr_test+0x40/0x48
>  kthread+0x11c/0x120
>  ret_from_fork+0x10/0x18
> Code: f9402fbc 17ffffa0 f9000bb3 f9002fbc (d4210000)
> ---[ end trace 272124cd4e3fd6f0 ]---
> note: cryptomgr_test[189] exited with preempt_count 1
> ------------[ cut here ]------------
>
> FWIW, the same happens on R-Car H3 ES1.0.
> I haven't tried investigating when it stopped working.
> I stopped running the crypto manager tests when they were broken by
> CONFIG_HARDENED_USERCOPY_PAGESPAN=3Dy.
>
> Do you have a clue?
> Thanks!
>
> [*] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.g=
it/
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds



--=20
Gilad Ben-Yossef
Chief Coffee Drinker

values of =CE=B2 will give rise to dom!
