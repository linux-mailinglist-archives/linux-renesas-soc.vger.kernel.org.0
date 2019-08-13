Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8968B8DF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Aug 2019 14:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728568AbfHMMnf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Aug 2019 08:43:35 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41125 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728351AbfHMMnf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Aug 2019 08:43:35 -0400
Received: by mail-ot1-f68.google.com with SMTP id o101so18886435ota.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Aug 2019 05:43:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E+p+zmPurLbMEu2az+xH3AuHi82plJbCMSnO5w/IE6s=;
        b=uZtRHKtRoAgzJFrTTawfQw3GZqir6M4oyWngPT5SG47YcaXp4RdWkjTBUPLc0Wt7Hh
         tDbXTQEWZZEGSoieeTOhsPA/t02KgByVS+4yfFDA4xcIWKdaZawozp42fPNbAcNudiQJ
         i561Hh5GdDpkZGZv1p+LQYpqUbFOdsowgXOphj3R6VXEHmhrYe+/evX5YaE335zRvmKa
         kY0tghbq/1zJ3K1g8AF+MIgCEfC6b6AMFxG2unNsLwQLrSPLl9fApo7HwFUDOkvnUgzB
         jHAzaZrWJToJ7KIs2JrNGDkNsLaTUw2R/ORXk+T1ERs40HDpzOWg8TTXwpFFdvGCE7sl
         /AOg==
X-Gm-Message-State: APjAAAViQDJH5a4VFGlXkVist2YbC2VphHNJf2j9rnM5Q1uyAksTgdCp
        yG73zWOeT4PKGe2QXI/7WOm81A4I/lNXShe+mp0=
X-Google-Smtp-Source: APXvYqx1GQeKyaJsgXsivZqtT+ZWF3j7jl8KtNnj/46bOhi5OBabwhYF49mxUFMveHbU3gpyphWP34Gqnyc+EeluMJk=
X-Received: by 2002:a9d:459d:: with SMTP id x29mr20332510ote.39.1565700214109;
 Tue, 13 Aug 2019 05:43:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190807155524.5112-1-steve.capper@arm.com> <20190809164716.qtt7zizfbqyjukwe@willie-the-truck>
In-Reply-To: <20190809164716.qtt7zizfbqyjukwe@willie-the-truck>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 13 Aug 2019 14:43:23 +0200
Message-ID: <CAMuHMdWvkWGoNC5HbWoZwtpg5VXxTZqRZqQy4BLPgQXZJtKnsQ@mail.gmail.com>
Subject: Re: [PATCH V5 00/12] 52-bit kernel + user VAs
To:     Will Deacon <will@kernel.org>, Steve Capper <steve.capper@arm.com>
Cc:     crecklin@redhat.com, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>, bhsharma@redhat.com,
        maz@kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Will, Steve,

On Fri, Aug 9, 2019 at 6:47 PM Will Deacon <will@kernel.org> wrote:
> On Wed, Aug 07, 2019 at 04:55:12PM +0100, Steve Capper wrote:
> > This patch series adds support for 52-bit kernel VAs using some of the
> > machinery already introduced by the 52-bit userspace VA code in 5.0.
>
> Cheers, I've pushed this out on a for-next/52-bit-kva branch with one
> small patch on top and Catalin's tags added.

As of commit 14c127c957c1c607 ("arm64: mm: Flip kernel VA space"), the
kernel log is spammed with

    virt_to_phys used for non-linear address: (____ptrval____)
(__func__.6603+0x14d681/0x17fb3d)
    WARNING: CPU: 0 PID: 264 at arch/arm64/mm/physaddr.c:15
__virt_to_phys+0x28/0x58
    Modules linked in:
    CPU: 0 PID: 264 Comm: mdev Not tainted
5.3.0-rc3-rcar3-initrd-00002-g14c127c957c1c607 #38
    Hardware name: Renesas Ebisu-4D board based on r8a77990 (DT)
    pstate: 60000005 (nZCv daif -PAN -UAO)
    pc : __virt_to_phys+0x28/0x58
    lr : __virt_to_phys+0x28/0x58
    sp : ffffffc011953c80
    x29: ffffffc011953c80 x28: ffffff8078790140
    x27: 0000000000000000 x26: 0000000000000000
    x25: ffffffc010a539b9 x24: ffffffc010a86000
    x23: ffffffc010a539ba x22: 0000000000000001
    x21: 0000000000202038 x20: 0000000000000001
    x19: ffffffc010a539b9 x18: 000000000000000a
    x17: 0000000000000000 x16: 0000000000000000
    x15: 00000000000ca51d x14: 0720072007200720
    x13: 0720072007200720 x12: 0720072007200720
    x11: 0720072007200720 x10: 0720072007200720
    x9 : 0720072007200720 x8 : 0000000000000001
    x7 : 0000000000000007 x6 : ffffff8079824f00
    x5 : 0000000000000140 x4 : 0000000000000000
    x3 : 0000000000000000 x2 : 00000000ffffffff
    x1 : 0713abbc9281cf00 x0 : 0000000000000000
    Call trace:
     __virt_to_phys+0x28/0x58
     __check_object_size+0xd0/0x1e0
     filldir64+0x1d8/0x2b0
     kernfs_fop_readdir+0x64/0x200
     iterate_dir+0x68/0x144
     ksys_getdents64+0x88/0x154
     __arm64_sys_getdents64+0x18/0x24
     el0_svc_common.constprop.0+0x84/0xe8
     el0_svc_compat_handler+0x18/0x20
     el0_svc_compat+0x8/0x10
    ---[ end trace 6980a45f636e18be ]---

as soon as userspace starts.

As this commit cannot be reverted easily, I had to revert the full branch with
"git revert -m 1 6ce0dc725177e9856c9a67f2e2cabb3f7a3d90d7".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
