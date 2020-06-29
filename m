Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF2B920E156
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2020 23:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731396AbgF2Uyb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Jun 2020 16:54:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731318AbgF2TNT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Jun 2020 15:13:19 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C65C2C0068BC
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2020 04:49:33 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id t18so2367008otq.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2020 04:49:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eAltZ05f8fVkZXm0bUQuhx6MIO2x12H5beaeCAbA5dQ=;
        b=iN3x2x+mF8tcZAxq+YCOvIkR+AKIGaYLncs18xXnM5ejOQ4v2FumovwYlM2RmzpbgW
         ugMgv0DUGl0b2xW+bJIm+sL5u3rEeoKLzBEOMSkR9SpKODkOSELv7jvygXzwFriD5TCv
         PI4I8DArmrERA7QKPQ/0MXh4uO9ACP1cMUhsUfQHrBKTwvhM9DQcMUymML/Q+nD9jEue
         wWOmN0QKtCPcghild7OMIjR+NkGjDU0hTTitrymLhLkFWu+RA0PuK3dihDF7Y2DPYokn
         mSVYNvZQrj0i5A2w5W0NIl/1LetSgC8xo9LWgdsk2KuLTiBZ9LeLDKNlBTL/rrgiKmwi
         9+Ag==
X-Gm-Message-State: AOAM5307zJiqoULLO4YChnSuNxtb0wkKc3Sfrpyc8XDVwGFScjxVM1ZF
        YK23m2V9NXwE6+dRor7yiYMdL5RxR8RIWIby2aY=
X-Google-Smtp-Source: ABdhPJykhmys+OEr55fIKpepMspu36NxczTviy/NGrdQ6uIBGNIkCFLjTyj5J+v8CHZF4mA9eVVIC/G8xfL+I9T68UU=
X-Received: by 2002:a9d:2646:: with SMTP id a64mr12118558otb.107.1593431373141;
 Mon, 29 Jun 2020 04:49:33 -0700 (PDT)
MIME-Version: 1.0
References: <1593163942-5087-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdU0OEA7seCDadrSsNYXHQJOuSRrm8O439PK_pf3NoLxsg@mail.gmail.com> <TY2PR01MB3692FBE296EC373130842219D86E0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB3692FBE296EC373130842219D86E0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 29 Jun 2020 13:49:22 +0200
Message-ID: <CAMuHMdXh1Hh6H35Mp8hBJBykUucRNwxTmW+U9SHM+xhrcwasDA@mail.gmail.com>
Subject: Re: [PATCH/RFC v4 0/4] treewide: add regulator condition on _mmc_suspend()
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Mon, Jun 29, 2020 at 12:04 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Friday, June 26, 2020 7:13 PM
> > On Fri, Jun 26, 2020 at 11:32 AM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > Note that v5.8-rc2 with r8a77951-salvator-xs seems to cause panic from
> > > PCI driver when the system is suspended. So, I disabled the PCI
> > > devices when I tested this patch series.
> >
> > Does this happen with current renesas-devel and renesas_defconfig?
> > (it doesn't for me)
>
> Yes. I enabled PM_DEBUG and E1000E though.
>
> > Do you have any PCIe devices attached? (I haven't)
>
> Yes. (Intel Ethernet card is connected to the PCI slot.)
>
> < my environment >
> - r8a77961-salvator-xs
> - renesas-devel-2020-06-26-v5.8-rc2
>  + renesas_defconfig + PM_DEBUG + E1000E
> - initramfs

Doesn't fail for me on R-Car H3 ES2.0, so it needs the presence of a
PCIe card.  Unfortunately I haven't any (added to shopping wishlist).

Is this the board in Magnus' farm?
I do have access to that one.

> ~ # echo mem > /sys/power/state
> [  374.072298] PM: suspend entry (deep)
> [  374.075994] Filesystems sync: 0.000 seconds
> [  374.083159] Freezing user space processes ... (elapsed 0.001 seconds) done.
> [  374.091570] OOM killer disabled.
> [  374.094823] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> [  374.227534] e1000e: EEE TX LPI TIMER: 00000000
> [  374.354388] SError Interrupt on CPU0, code 0xbf000002 -- SError
> [  374.354390] CPU: 0 PID: 633 Comm: kworker/u12:4 Not tainted 5.8.0-rc2-arm64-renesas #57
> [  374.354392] Hardware name: Renesas Salvator-X 2nd version board based on r8a77961 (DT)
> [  374.354393] Workqueue: events_unbound async_run_entry_fn
> [  374.354395] pstate: 40000085 (nZcv daIf -PAN -UAO BTYPE=--)
> [  374.354396] pc : rcar_pci_read_reg+0xc/0x20
> [  374.354397] lr : rcar_pcie_config_access+0xe4/0x1c0
> [  374.354398] sp : ffff8000148aba80
> [  374.354399] x29: ffff8000148aba80 x28: 0000000000000000
> [  374.354402] x27: ffff800011fb0000 x26: 0000000000000000
> [  374.354404] x25: 00000000000000cc x24: 0000000000000000
> [  374.354406] x23: ffff8000148abb54 x22: 0000000000000000
> [  374.354408] x21: ffff0006b484f800 x20: 0000000000000000
> [  374.354411] x19: ffff0006b3a14580 x18: 0000000000000000
> [  374.354413] x17: 0000000000000000 x16: 0000000000000000
> [  374.354415] x15: 0000000000000000 x14: 000006e45d8ca55e
> [  374.354417] x13: 0000000000000330 x12: 000000000000016d
> [  374.354419] x11: 0000000000000000 x10: 0000000000000000
> [  374.354421] x9 : ffff800012059120 x8 : ffff800011fb0948
> [  374.354423] x7 : ffff8000105075a8 x6 : 0000000000000000
> [  374.354425] x5 : ffff8000148abb54 x4 : 00000000000000cc
> [  374.354427] x3 : 0000000000000000 x2 : ffff800013700018
> [  374.354429] x1 : 0000000000000020 x0 : 00000000ffffffff
> [  374.354432] Kernel panic - not syncing: Asynchronous SError Interrupt
> [  374.354433] CPU: 0 PID: 633 Comm: kworker/u12:4 Not tainted 5.8.0-rc2-arm64-renesas #57
> [  374.354434] Hardware name: Renesas Salvator-X 2nd version board based on r8a77961 (DT)
> [  374.354435] Workqueue: events_unbound async_run_entry_fn
> [  374.354437] Call trace:
> [  374.354438]  dump_backtrace+0x0/0x1d8
> [  374.354439]  show_stack+0x14/0x20
> [  374.354439]  dump_stack+0xe8/0x130
> [  374.354440]  panic+0x168/0x380
> [  374.354441]  nmi_panic+0x6c/0x70
> [  374.354442]  arm64_serror_panic+0x74/0x88
> [  374.354443]  do_serror+0x88/0x1a0
> [  374.354444]  el1_error+0x84/0x100
> [  374.354444]  rcar_pci_read_reg+0xc/0x20
> [  374.354445]  rcar_pcie_read_conf+0x38/0xb0
> [  374.354446]  pci_bus_read_config_word+0x84/0xe0
> [  374.354447]  pci_read_config_word+0x28/0x40
> [  374.354448]  pci_raw_set_power_state+0x108/0x2a8
> [  374.354449]  pci_set_power_state+0x5c/0x150
> [  374.354450]  pci_prepare_to_sleep+0x60/0x98
> [  374.354451]  pci_pm_suspend_noirq+0xe4/0x278
> [  374.354451]  dpm_run_callback+0x88/0x3c0
> [  374.354452]  __device_suspend_noirq+0x68/0x1f0
> [  374.354453]  async_suspend_noirq+0x20/0xa8
> [  374.354454]  async_run_entry_fn+0x44/0x108
> [  374.354455]  process_one_work+0x2a0/0x718
> [  374.354456]  worker_thread+0x40/0x458
> [  374.354457]  kthread+0x150/0x158
> [  374.354457]  ret_from_fork+0x10/0x18
> [  374.354484] SMP: stopping secondary CPUs
> [  374.354485] Kernel Offset: disabled
> [  374.354486] CPU features: 0x200022,21006004

The failure mode looks like the PCI card is accessed while the PCI host
bridge has been suspended.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
