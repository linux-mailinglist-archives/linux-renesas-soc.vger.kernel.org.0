Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE632541BB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Aug 2020 11:15:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727823AbgH0JPs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Aug 2020 05:15:48 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34173 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbgH0JPr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Aug 2020 05:15:47 -0400
Received: by mail-ot1-f67.google.com with SMTP id k20so3855016otr.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Aug 2020 02:15:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Koh9RhQPUMJKsghiVe4TuSRAJF84YtidkMObrLj/6tY=;
        b=ZuTUEnVhWRbKepXyzW9xVf4BLfpPe0rQ85RJxsKTuVCW27S0E7A+BDUTgJAa6OoezK
         HxRyj+3mn5RQnE+MnZLbgsqyjZd5L6nDVF1BKVgzj1ntQRHJtSVMvATSqJc1wJxEpFe9
         vfQNDDeHH0JCs5IP26jX+oeZYPB3TTfzEoaEbF9fmsuq1yKVzCARaQi6lxFaGcNFetYO
         +oV1lchGsRNTVzbVyBVA0ugDCAUKwrFmh7RCl7AGfU9ZQADzDnf/9AebEqwlTeiplNdw
         FDHl3JKSY4w//O0pOK0FYsbC0esyVb6rEoWeuGYfwMyIP94A0lIjqti4mQHMLlFqrGEN
         EeTA==
X-Gm-Message-State: AOAM530FQsVgWfHRzsGux8Z3fU85ZzR+rltZNadb+j6uFhIKN3+sh7gZ
        bNgy1pqtLiFjMPWSnXr1B4fmf/day1d8xyg+pLU=
X-Google-Smtp-Source: ABdhPJx2n4wfbtdBsj3RxcNX2MzoyCN9v1bdAcFk0Iz20tEIjWOy36pdItnmd9zrUx5l9eNdGKBRvXy4VF2y3bpUW5w=
X-Received: by 2002:a9d:32e5:: with SMTP id u92mr11727725otb.107.1598519746970;
 Thu, 27 Aug 2020 02:15:46 -0700 (PDT)
MIME-Version: 1.0
References: <1593163942-5087-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdU0OEA7seCDadrSsNYXHQJOuSRrm8O439PK_pf3NoLxsg@mail.gmail.com>
 <TY2PR01MB3692FBE296EC373130842219D86E0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdXh1Hh6H35Mp8hBJBykUucRNwxTmW+U9SHM+xhrcwasDA@mail.gmail.com>
 <CAMuHMdX93Q9WhKLqv_wNPzArbc68NcbVN8jJ9MDKxAcicpBQ5Q@mail.gmail.com>
 <TY2PR01MB36922D383DD83EB2DE22F84FD86A0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdUdAYQ2pOtpeLFc6oXXppdytiPPa-SPmfDFO8Yg5Cwr8w@mail.gmail.com>
 <CAMuHMdU8BCxm8O0Ch8oJ18Est8Gv6VCucLEM7HtoFjsqKjS=kQ@mail.gmail.com> <TY2PR01MB36920F6F4CF5B9EC4925F335D85F0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB36920F6F4CF5B9EC4925F335D85F0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 Aug 2020 11:15:36 +0200
Message-ID: <CAMuHMdV_gPbcYQZ38S-g4td-fTd0a=ticVvdGPO+SESt84UMOg@mail.gmail.com>
Subject: Re: E1000 s2idle crash (was: Re: [PATCH/RFC v4 0/4] treewide: add
 regulator condition on _mmc_suspend())
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut@gmail.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Mon, Aug 17, 2020 at 2:00 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Tuesday, August 11, 2020 10:50 PM
> > On Mon, Jul 6, 2020 at 1:14 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > I moved the E1000E card to an R-Car Gen2 board (r8a7791/koelsch), and
> > s2idle crashes in a similar way:
> >
> >     Unhandled fault: asynchronous external abort (0x1211) at 0x00000000
> >     pgd = ceadf1f8
> >     [00000000] *pgd=80000040004003, *pmd=00000000
> >     Internal error: : 1211 [#1] SMP ARM
> >     Modules linked in:
> >     CPU: 0 PID: 124 Comm: kworker/u4:6 Not tainted
> > 5.8.0-koelsch-00539-gce07c9ba6e9f601c #867
> >     Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
> >     Workqueue: events_unbound async_run_entry_fn
> >     PC is at rcar_pcie_config_access+0x10c/0x13c
> >     LR is at rcar_pcie_config_access+0x10c/0x13c
> >     pc : [<c04a4ab4>]    lr : [<c04a4ab4>]    psr: 60000093
> >     sp : e67b3e00  ip : 00000000  fp : 00000000
> >     r10: 00000000  r9 : 00000000  r8 : e7369800
> >     r7 : 00000000  r6 : e67b3e40  r5 : e7369640  r4 : 000000cc
> >     r3 : f0900000  r2 : f0900018  r1 : f0900020  r0 : 00000000
> >     Flags: nZCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment user
> >     Control: 30c5387d  Table: 648fe480  DAC: fffffffd
> >     Process kworker/u4:6 (pid: 124, stack limit = 0x0dcce627)
> >     Stack: (0xe67b3e00 to 0xe67b4000)
> >     ...
> >     [<c04a4ab4>] (rcar_pcie_config_access) from [<c04a4be0>]
> > (rcar_pcie_read_conf+0x28/0x80)
> >     [<c04a4be0>] (rcar_pcie_read_conf) from [<c048a4e0>]
> > (pci_bus_read_config_word+0x68/0xa8)
> >     [<c048a4e0>] (pci_bus_read_config_word) from [<c0490030>]
> > (pci_raw_set_power_state+0x18c/0x270)
> >     [<c0490030>] (pci_raw_set_power_state) from [<c0492e20>]
> > (pci_set_power_state+0x98/0xcc)
> >     [<c0492e20>] (pci_set_power_state) from [<c0492ea0>]
> > (pci_prepare_to_sleep+0x4c/0x6c)
> >     [<c0492ea0>] (pci_prepare_to_sleep) from [<c0496c84>]
> > (pci_pm_suspend_noirq+0x228/0x244)
> >     [<c0496c84>] (pci_pm_suspend_noirq) from [<c0509d88>]
> > (dpm_run_callback.part.5+0x44/0xac)
> >     [<c0509d88>] (dpm_run_callback.part.5) from [<c050b38c>]
> > (__device_suspend_noirq+0x74/0x1a4)
> >
> > > Why haven't we seen this before?
> > > I can reproduce the issue on v5.5 (first version that supported M3-W+,
> > > but needs backported DTS for PCIe support) and later.
> >
> > On Koelsch, I could easily reproduce this on v4.10 and later[1].
> >
> > As this time no firmware is involved, I guess Linux itself needs to
> > become aware of this issue, and handle it in a similar way like ATF
> > on arm64[2]?
>
> I agree. But, I'm not sure how to implement a similar way on arm32 though...
> Maybe, we should unbind a PCI device before R-Car Gen2 is suspended?

Unbinding PCI devices before suspending the system means that e.g.
Wake-on-LAN will no longer work.  Unless WoL-enabled devices are
not unbound.

However, it seems Wake-on-LAN is enabled by default on E1000E.
Hence even if WoL is enabled, the PCIe device will send an L1_Enter_PM DLLP
request, triggering the issue.



Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
