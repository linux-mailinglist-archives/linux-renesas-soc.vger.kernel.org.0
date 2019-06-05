Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B00B3599A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2019 11:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbfFEJZT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jun 2019 05:25:19 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34435 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbfFEJZT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jun 2019 05:25:19 -0400
Received: by mail-lj1-f194.google.com with SMTP id j24so22508660ljg.1;
        Wed, 05 Jun 2019 02:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7rWHLrl9t6asB00nJyBgt2B48bwUF9nZQljQEHED7O8=;
        b=jBbVj2uu+G6EbGWBtUv3ILe3CKAmHU65jeIFUialus9mihlyjyH5b9bE8VJPlrA8oF
         wgvUYPwVRKMre9fRYDVpY0vWiHaXLZ8K1l8S6sNRLx2V6Fcj2nEPcjvFJ8jxn2iZODN6
         OZIh8yqjFzKYiBOp/rE171thsBHRvk3wmTYhiP1PfZ5NtlEq5tDoGCMNc4MA3p8a07yd
         otE9auPRbm6t2bphZzbFiXe3OxVrHNG3sdgE+inR314eGMkqcRxH06fmmSnlRGnVRF6t
         lnK/M7WLiPCUVq/O/4Pz3e0x0XbaSeslpuDHZa9SGKavZWyU6VA9nnVFPelCnNDblY7Y
         O4bA==
X-Gm-Message-State: APjAAAVFHM8AQL1GT/kA4mTQZEVARh4xCT8jQiRwp4CUeakY60xa1ufy
        8ES+68oWzTZ+mUW9rYi9ANaifQxZm8uaUjjyv74=
X-Google-Smtp-Source: APXvYqzQU8N2qZ5wGLc7xREri4uIkFOSmGa+9wlklQ/5UyzL6zyC0h9JKEO0oS4YKKuvodKz3w7w7nUnDTtVy86nhnQ=
X-Received: by 2002:a2e:2b8d:: with SMTP id r13mr7918047ljr.145.1559726717188;
 Wed, 05 Jun 2019 02:25:17 -0700 (PDT)
MIME-Version: 1.0
References: <1559710142-29161-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1559710142-29161-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Jun 2019 11:25:05 +0200
Message-ID: <CAMuHMdUqajM2yR72AYE5ppp-RJumfoG2+YArEzLiJvt55_1k4g@mail.gmail.com>
Subject: Re: [PATCH] phy: renesas: rcar-gen3-usb2: fix imbalance powered flag
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Wed, Jun 5, 2019 at 6:54 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> The powered flag should be set for any other phys anyway. Otherwise,
> after we have revised the device tree for the usb phy, the following
> warning happened during a second system suspend. So, this patch fixes
> the issue.
>
> [   56.026531] unbalanced disables for USB20_VBUS0
> [   56.031108] WARNING: CPU: 3 PID: 513 at drivers/regulator/core.c:2593 _regula
> tor_disable+0xe0/0x1c0
> [   56.040146] Modules linked in: rcar_du_drm rcar_lvds drm_kms_helper drm drm_p
> anel_orientation_quirks vsp1 videobuf2_vmalloc videobuf2_dma_contig videobuf2_me
> mops videobuf2_v4l2 videobuf2_common videodev snd_soc_rcar renesas_usbhs snd_soc
> _audio_graph_card media snd_soc_simple_card_utils crct10dif_ce renesas_usb3 snd_
> soc_ak4613 rcar_fcp pwm_rcar usb_dmac phy_rcar_gen3_usb3 pwm_bl ipv6
> [   56.074047] CPU: 3 PID: 513 Comm: kworker/u16:19 Not tainted 5.2.0-rc3-00001-
> g5f20a19 #6
> [   56.082129] Hardware name: Renesas Salvator-X board based on r8a7795 ES2.0+ (
> DT)
> [   56.089524] Workqueue: events_unbound async_run_entry_fn
> [   56.094832] pstate: 40000005 (nZcv daif -PAN -UAO)
> [   56.099617] pc : _regulator_disable+0xe0/0x1c0
> [   56.104054] lr : _regulator_disable+0xe0/0x1c0
> [   56.108489] sp : ffff0000121c3ae0
> [   56.111796] x29: ffff0000121c3ae0 x28: 0000000000000000
> [   56.117102] x27: 0000000000000000 x26: ffff000010fe0e60
> [   56.122407] x25: 0000000000000002 x24: 0000000000000001
> [   56.127712] x23: 0000000000000002 x22: ffff8006f99d4000
> [   56.133017] x21: ffff8006f99cc000 x20: ffff8006f9846800
> [   56.138322] x19: ffff8006f9846800 x18: ffffffffffffffff
> [   56.143626] x17: 0000000000000000 x16: 0000000000000000
> [   56.148931] x15: ffff0000112f96c8 x14: ffff0000921c37f7
> [   56.154235] x13: ffff0000121c3805 x12: ffff000011312000
> [   56.159540] x11: 0000000005f5e0ff x10: ffff0000112f9f20
> [   56.164844] x9 : ffff0000112d3018 x8 : 00000000000001ad
> [   56.170149] x7 : 00000000ffffffcc x6 : ffff8006ff768180
> [   56.175453] x5 : ffff8006ff768180 x4 : 0000000000000000
> [   56.180758] x3 : ffff8006ff76ef10 x2 : ffff8006ff768180
> [   56.186062] x1 : 3d2eccbaead8fb00 x0 : 0000000000000000
> [   56.191367] Call trace:
> [   56.193808]  _regulator_disable+0xe0/0x1c0
> [   56.197899]  regulator_disable+0x40/0x78
> [   56.201820]  rcar_gen3_phy_usb2_power_off+0x3c/0x50
> [   56.206692]  phy_power_off+0x48/0xd8
> [   56.210263]  usb_phy_roothub_power_off+0x30/0x50
> [   56.214873]  usb_phy_roothub_suspend+0x1c/0x50
> [   56.219311]  hcd_bus_suspend+0x13c/0x168
> [   56.223226]  generic_suspend+0x4c/0x58
> [   56.226969]  usb_suspend_both+0x1ac/0x238
> [   56.230972]  usb_suspend+0xcc/0x170
> [   56.234455]  usb_dev_suspend+0x10/0x18
> [   56.238199]  dpm_run_callback.isra.6+0x20/0x68
> [   56.242635]  __device_suspend+0x110/0x308
> [   56.246637]  async_suspend+0x24/0xa8
> [   56.250205]  async_run_entry_fn+0x40/0xf8
> [   56.254210]  process_one_work+0x1e0/0x320
> [   56.258211]  worker_thread+0x40/0x450
> [   56.261867]  kthread+0x124/0x128
> [   56.265094]  ret_from_fork+0x10/0x18
> [   56.268661] ---[ end trace 86d7ec5de5c517af ]---
> [   56.273290] phy phy-ee080200.usb-phy.10: phy poweroff failed --> -5
>
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Fixes: 549b6b55b005 ("phy: renesas: rcar-gen3-usb2: enable/disable independent irqs")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thank you, this seems to fix the warning, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

However, the other imbalance (phy-ee080200.usb-phy.6 enabling its
regulator during each system resume phase, but never touching it
otherwise) is still present.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
