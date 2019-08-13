Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCD398B9A7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Aug 2019 15:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728828AbfHMNKT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Aug 2019 09:10:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:43936 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728480AbfHMNKT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Aug 2019 09:10:19 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CCDCE2067D;
        Tue, 13 Aug 2019 13:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565701818;
        bh=9LdvigrXqTVGjESKoSw18FQNoRzVsSkMTQcfq9Hf+Z0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zX6Q/VqK0Q85bDA5YXVoTTZvQe/dFf0m0QRXdCQqJfgGivx51n7sTe6jX/t+eiFFt
         1zz5ai82eOyBanQz++0hypo9qOg7oVbgXdHpfSc6aFXKVIASWMtuM0UK+ile1Rk2l/
         x/o5c7FqoV3CZmCx+WfX8JPSHkxB1MUPKwMwHiLQ=
Date:   Tue, 13 Aug 2019 14:10:13 +0100
From:   Will Deacon <will@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Steve Capper <steve.capper@arm.com>, crecklin@redhat.com,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>, bhsharma@redhat.com,
        maz@kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH V5 00/12] 52-bit kernel + user VAs
Message-ID: <20190813131013.vpc5a2vlxwghizxa@willie-the-truck>
References: <20190807155524.5112-1-steve.capper@arm.com>
 <20190809164716.qtt7zizfbqyjukwe@willie-the-truck>
 <CAMuHMdWvkWGoNC5HbWoZwtpg5VXxTZqRZqQy4BLPgQXZJtKnsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWvkWGoNC5HbWoZwtpg5VXxTZqRZqQy4BLPgQXZJtKnsQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Tue, Aug 13, 2019 at 02:43:23PM +0200, Geert Uytterhoeven wrote:
> On Fri, Aug 9, 2019 at 6:47 PM Will Deacon <will@kernel.org> wrote:
> > On Wed, Aug 07, 2019 at 04:55:12PM +0100, Steve Capper wrote:
> > > This patch series adds support for 52-bit kernel VAs using some of the
> > > machinery already introduced by the 52-bit userspace VA code in 5.0.
> >
> > Cheers, I've pushed this out on a for-next/52-bit-kva branch with one
> > small patch on top and Catalin's tags added.
> 
> As of commit 14c127c957c1c607 ("arm64: mm: Flip kernel VA space"), the
> kernel log is spammed with
> 
>     virt_to_phys used for non-linear address: (____ptrval____)
> (__func__.6603+0x14d681/0x17fb3d)
>     WARNING: CPU: 0 PID: 264 at arch/arm64/mm/physaddr.c:15
> __virt_to_phys+0x28/0x58
>     Modules linked in:
>     CPU: 0 PID: 264 Comm: mdev Not tainted
> 5.3.0-rc3-rcar3-initrd-00002-g14c127c957c1c607 #38
>     Hardware name: Renesas Ebisu-4D board based on r8a77990 (DT)
>     pstate: 60000005 (nZCv daif -PAN -UAO)
>     pc : __virt_to_phys+0x28/0x58
>     lr : __virt_to_phys+0x28/0x58
>     sp : ffffffc011953c80
>     x29: ffffffc011953c80 x28: ffffff8078790140
>     x27: 0000000000000000 x26: 0000000000000000
>     x25: ffffffc010a539b9 x24: ffffffc010a86000
>     x23: ffffffc010a539ba x22: 0000000000000001
>     x21: 0000000000202038 x20: 0000000000000001
>     x19: ffffffc010a539b9 x18: 000000000000000a
>     x17: 0000000000000000 x16: 0000000000000000
>     x15: 00000000000ca51d x14: 0720072007200720
>     x13: 0720072007200720 x12: 0720072007200720
>     x11: 0720072007200720 x10: 0720072007200720
>     x9 : 0720072007200720 x8 : 0000000000000001
>     x7 : 0000000000000007 x6 : ffffff8079824f00
>     x5 : 0000000000000140 x4 : 0000000000000000
>     x3 : 0000000000000000 x2 : 00000000ffffffff
>     x1 : 0713abbc9281cf00 x0 : 0000000000000000
>     Call trace:
>      __virt_to_phys+0x28/0x58
>      __check_object_size+0xd0/0x1e0
>      filldir64+0x1d8/0x2b0
>      kernfs_fop_readdir+0x64/0x200
>      iterate_dir+0x68/0x144
>      ksys_getdents64+0x88/0x154
>      __arm64_sys_getdents64+0x18/0x24
>      el0_svc_common.constprop.0+0x84/0xe8
>      el0_svc_compat_handler+0x18/0x20
>      el0_svc_compat+0x8/0x10
>     ---[ end trace 6980a45f636e18be ]---
> 
> as soon as userspace starts.

Can you try the hack I posted here, please?

https://lkml.org/lkml/2019/8/13/555

Also, what .config are you using?

Will
