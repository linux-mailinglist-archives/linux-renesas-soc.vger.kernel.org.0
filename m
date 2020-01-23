Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 094D6146D3E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2020 16:46:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbgAWPqx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Jan 2020 10:46:53 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:40768 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbgAWPqx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Jan 2020 10:46:53 -0500
Received: by mail-oi1-f196.google.com with SMTP id c77so3302603oib.7;
        Thu, 23 Jan 2020 07:46:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RftF1ldwzLppC9Ac3+m4A9Jal0SaT1mPfGz1y7gPc6I=;
        b=KBD8K+BYpyOuPfZcgjmjRGasEQykuDYA36NX5ECXDbY4UqgZSB38bZ4/F+hzNi9mNg
         AbNifunFfO/S3PS52PgAYtRTrVdWezPlFxrB3NAFAT3dwH76gCN7O5k9/7LeC0e8EKmD
         qndSLiVi+TznrOGO/H3LdnFJW0dn+GPCzsH//mfbAogO9kMoNEMEltZ6XMpBrsG5alKc
         k657YjaFal+frGKx2h6xjXU42QYnXlmOCBY5BYjrrBsSunAUUps+np551yqqQJYlU8gm
         XVCjV1T2uqM5WeHVf/I2lRC2h8UQJ4NbwmGiIJDNIBtVuO+w7s6ce3sTKXs+ql8NnnHy
         44Dg==
X-Gm-Message-State: APjAAAUjL9h8UJwkoo4I0y29yS9sG0sKl4d+Uura76A/ymodjckQrTFo
        y5izIZHkACYpWnMa4ZEceH09NRM5goR9frnHjFxQEAxD
X-Google-Smtp-Source: APXvYqwVon4o8+3XZRgb1s1P9ZASZtrfJ8l/BcEXdtO5DQhrgn0rpFRLl3oxTASw5GCYgM+eLvqvyMsOT+/c48L83DY=
X-Received: by 2002:aca:1a06:: with SMTP id a6mr10421340oia.148.1579794411477;
 Thu, 23 Jan 2020 07:46:51 -0800 (PST)
MIME-Version: 1.0
References: <20200116101447.20374-1-gilad@benyossef.com> <CAMuHMdUhR83SZyWX9Du9d3Sp4A48x_msKaOHGsa88EQKStEDQg@mail.gmail.com>
 <CAOtvUMfDnoFu8V7sYvhgsstX6fuUk3foq+9FJ6SbUKEFnq-zMw@mail.gmail.com>
In-Reply-To: <CAOtvUMfDnoFu8V7sYvhgsstX6fuUk3foq+9FJ6SbUKEFnq-zMw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 Jan 2020 16:46:40 +0100
Message-ID: <CAMuHMdUZbbNX-vsa4TmU7DNKAz2Qo3SR1pHXDOsO4Rh5G8ygZw@mail.gmail.com>
Subject: Re: [PATCH 00/11] crypto: ccree - fixes and cleanups
To:     Gilad Ben-Yossef <gilad@benyossef.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Ofir Drang <ofir.drang@arm.com>, Hadar Gat <hadar.gat@arm.com>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Gilad

On Thu, Jan 23, 2020 at 12:44 PM Gilad Ben-Yossef <gilad@benyossef.com> wrote:
> On Wed, Jan 22, 2020 at 6:51 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Thu, Jan 16, 2020 at 11:25 AM Gilad Ben-Yossef <gilad@benyossef.com> wrote:
> > > A bunch of fixes and code cleanups for the ccree driver
> >
> > Thank you!
> >
> > I wanted to give this a try, but it looks like CCREE is no longer working
> > on R-Car H3, both with/without this series.
> >
> > E.g. with renesas-devel[*] and renesas_defconfig +
> > CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=n, I get the following crash:
>
> Thank you for the bug report Geert!
>
> My R-Car board is on loan at the moment to another project. I didn't
> see this on our internal test board.
> I will track down my R-Car board and reproduce this - hopefully
> beginning of next week and will get back to you.

In the mean time, I've bisected this failure to commit cdfee5623290bc89
("driver core: initialize a default DMA mask for platform device").
However, this looks like a red herring, and seems to be only an exposer
of an underlying problem.

What's happening is that cc_map_aead_request() receives a request with
cryptlen = 0.  Due to DRV_CRYPTO_DIRECTION_ENCRYPT, the length to map is
increased by 8.  This seems to works fine if there is sufficient space
in the request's scatterlist.  However, if the scatterlist has only a
single entry of size zero, cc_map_sg() tries to map a zero-length DMA
buffer, and the BUG)() is triggered.

I noticed commits 04e6d25c5bb244c1 ("crypto: caam - fix zero-length
buffer DMA mapping") and 07586d3ddf284dd7 ("crypto: caam/qi2 - fix
zero-length buffer DMA mapping") fixed other issues related to
zero-length DMA buffers.  But this one seems to be different, and a bit
more complex.

Adding "if (!req->cryptlen) return 0;" to the top of cc_proc_aead() fixes
the crash, but makes the tests fail:

    cc_proc_aead:1946: cryptlen is zero!
    alg: aead: ccm-aes-ccree encryption test failed (wrong result) on
test vector 9, cfg="in-place"
    cc_proc_aead:1946: cryptlen is zero!
    alg: aead: gcm-aes-ccree encryption test failed (wrong result) on
test vector 0, cfg="in-place"

Do you have a clue?
Thanks!

> > ccree e6601000.crypto: ARM CryptoCell 630P Driver: HW version
> > 0xAF400001/0xDCC63000, Driver version 5.0
> > alg: No test for authenc(xcbc(aes),cbc(aes)) (authenc-xcbc-aes-cbc-aes-ccree)
> > alg: No test for authenc(xcbc(aes),rfc3686(ctr(aes)))
> > (authenc-xcbc-aes-rfc3686-ctr-aes-ccree)
> > ------------[ cut here ]------------
> > kernel BUG at kernel/dma/swiotlb.c:497!
> > Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
> > CPU: 7 PID: 189 Comm: cryptomgr_test Not tainted 5.5.0-rc7-arm64-renesas #463
> > Hardware name: Renesas Salvator-X 2nd version board based on r8a77951 (DT)
> > pstate: 80000005 (Nzcv daif -PAN -UAO)
> > pc : swiotlb_tbl_map_single+0x30c/0x380
> > lr : swiotlb_map+0xb0/0x300
> > sp : ffff800012313430
> > x29: ffff800012313430 x28: 0000000000000000
> > x27: 0000000000000000 x26: 0000000738e7e000
> > x25: ffff0006fa5f8010 x24: 0000000000000000
> > x23: ffff800011aed000 x22: 0000000000000000
> > x21: 0000000000000000 x20: 00000000000e8000
> > x19: ffff80001105e000 x18: ffffffffffffffff
> > x17: 0000000000000007 x16: 0000000000000001
> > x15: ffff800010f5f908 x14: ffff800092313cf7
> > x13: ffff0006ff0b4000 x12: 0000000000000001
> > x11: 0000000000000003 x10: 0000000000200000
> > x9 : 0000000000000000 x8 : 0000000000000001
> > x7 : ffff800011aed9e0 x6 : 0000000000000000
> > x5 : 0000000000000000 x4 : 0000000000000000
> > x3 : 0000000000000000 x2 : 0000000000000000
> > x1 : 0000000074000000 x0 : 0000000000000000
> > Call trace:
> >  swiotlb_tbl_map_single+0x30c/0x380
> >  swiotlb_map+0xb0/0x300
> >  dma_direct_map_page+0xb8/0x140
> >  dma_direct_map_sg+0x78/0xe0
> >  cc_map_sg+0x10c/0x1a8
> >  cc_map_aead_request+0x160/0x990
> >  cc_proc_aead+0x140/0xef8
> >  cc_aead_encrypt+0x48/0x68
> >  crypto_aead_encrypt+0x20/0x30
> >  test_aead_vec_cfg+0x20c/0x848
> >  test_aead+0xb8/0x140
> >  alg_test_aead+0x94/0x178
> >  alg_test+0x108/0x3f8
> >  cryptomgr_test+0x40/0x48
> >  kthread+0x11c/0x120
> >  ret_from_fork+0x10/0x18
> > Code: f9402fbc 17ffffa0 f9000bb3 f9002fbc (d4210000)
> > ---[ end trace 272124cd4e3fd6f0 ]---
> > note: cryptomgr_test[189] exited with preempt_count 1
> > ------------[ cut here ]------------
> >
> > FWIW, the same happens on R-Car H3 ES1.0.
> > I haven't tried investigating when it stopped working.
> > I stopped running the crypto manager tests when they were broken by
> > CONFIG_HARDENED_USERCOPY_PAGESPAN=y.
> >
> > Do you have a clue?
> > Thanks!
> >
> > [*] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
