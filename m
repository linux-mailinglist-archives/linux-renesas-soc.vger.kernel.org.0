Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D866E543B1E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jun 2022 20:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234029AbiFHSNT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jun 2022 14:13:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234030AbiFHSNR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jun 2022 14:13:17 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10E7252B26
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jun 2022 11:13:16 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-2ff7b90e635so217957627b3.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Jun 2022 11:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oASOQxiwZkKBmNrwD+mjf5/Mw7WuCScPHsJov+hN7M0=;
        b=d7cx/yUe5qcjbfEHIrT7M0dd9LR2w/yp1q1Jfmkhmao/ejoPKNlcUoWALLu8wPlOSO
         zvKTRq/53937UVcvG2D9Jeqi4PiN+OV2YDoN5QByuGvucnXNYu3ur8ST7GkivBmTnekd
         lnYnKjwQlF96GNVi8Mzu7A5/uqgCQohR3bpCsdYfnQz50lDgG4tOQQwWR+edHdcuiBaA
         RseUKrtSyLxjJSla/oJ7c1zjUhiq7CjFF1xP0xBPYeSZQSC7DHZoGZG1/j5RTzE+LySt
         t69YK6f1KGLSf7PS2gRXf57mZ9tmwRCwlEdm70wzKTApy5tLx6tIVwzyUbbEbQ1RE148
         BBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oASOQxiwZkKBmNrwD+mjf5/Mw7WuCScPHsJov+hN7M0=;
        b=wL4ndjjB+qYUbSEoA9JlbQXNQj2CwhzX1kuzfX2KSbQWDZMcH13DE/Lh4xYBgt8mJ4
         wykW4EKukaS0qZ35ItSxgjMdvJ/kR3yN4vrTVBm7GAeZS9RKz5ojQWByOJxsUJjyXLlH
         fBs3ef3qAZUybQscSU0Now2chRb7UtzYr10385kWQgUOkcb1orZHa+DmhUkU7ILyAoWH
         OLDsMISTN6L0uq0xkUgQ1kzjXA8OtVwKnnZUO4pJBSlADbZ6Ox/0vOryPTiT+CllOoFL
         R8QqGp9EvnAoNqu/m84OCKQRNhDshItW+KJP6vA5885NA3LyldpexyIIxf9o4eHmaGSo
         qCAw==
X-Gm-Message-State: AOAM531PFs43ldGjv0742y+8oiCMReoqIJj1VyHtp54DZ4StYjLG2UAC
        IqyS24WjLq/Tfvpw5ZBYK3+biwKuIfDXykQTm1cGOQ==
X-Google-Smtp-Source: ABdhPJyHaqIfcBpRh26D0MSAyZR4sHuCKs3ad8It2nwBQIAPmQEiglzgfhS2hFdQppZVkbpXtNSWLDfDm6UnLM81tn8=
X-Received: by 2002:a0d:c984:0:b0:30c:c95c:21d0 with SMTP id
 l126-20020a0dc984000000b0030cc95c21d0mr40477048ywd.218.1654711994634; Wed, 08
 Jun 2022 11:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220601070707.3946847-1-saravanak@google.com>
 <CAMuHMdXkX-SXtBuTRGJOUnpw9goSP6RFr_PTt_3w_yWgBpWsqg@mail.gmail.com>
 <CAGETcx9f0UBhpp6dM+KJwtYpLx19wwsq6_ygi3En7FrXobOSpA@mail.gmail.com>
 <CAGETcx8VM+xOCe7HEx9FUU-1B9nrX8Q=tE=NjTyb9uX2_8RXLQ@mail.gmail.com> <CAMuHMdXzu8Vp=a7fyjOB=xt04aee=vWXV=TcRZeeKUGYFFZ1CA@mail.gmail.com>
In-Reply-To: <CAMuHMdXzu8Vp=a7fyjOB=xt04aee=vWXV=TcRZeeKUGYFFZ1CA@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 8 Jun 2022 11:12:37 -0700
Message-ID: <CAGETcx_Nqo4ju7cWwO3dP3YM2wpCb0jx23OHOReexOjpT5pATA@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] deferred_probe_timeout logic clean up
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        David Ahern <dsahern@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        netdev <netdev@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.5 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URI_HEX,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 8, 2022 at 3:26 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Saravana,
>
> On Wed, Jun 8, 2022 at 6:17 AM Saravana Kannan <saravanak@google.com> wrote:
> > On Tue, Jun 7, 2022 at 5:55 PM Saravana Kannan <saravanak@google.com> wrote:
> > > On Tue, Jun 7, 2022 at 11:13 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Wed, Jun 1, 2022 at 12:46 PM Saravana Kannan <saravanak@google.com> wrote:
> > > > > This series is based on linux-next + these 2 small patches applies on top:
> > > > > https://lore.kernel.org/lkml/20220526034609.480766-1-saravanak@google.com/
> > > > >
> > > > > A lot of the deferred_probe_timeout logic is redundant with
> > > > > fw_devlink=on.  Also, enabling deferred_probe_timeout by default breaks
> > > > > a few cases.
> > > > >
> > > > > This series tries to delete the redundant logic, simplify the frameworks
> > > > > that use driver_deferred_probe_check_state(), enable
> > > > > deferred_probe_timeout=10 by default, and fixes the nfsroot failure
> > > > > case.
> > > > >
> > > > > The overall idea of this series is to replace the global behavior of
> > > > > driver_deferred_probe_check_state() where all devices give up waiting on
> > > > > supplier at the same time with a more granular behavior:
> > > > >
> > > > > 1. Devices with all their suppliers successfully probed by late_initcall
> > > > >    probe as usual and avoid unnecessary deferred probe attempts.
> > > > >
> > > > > 2. At or after late_initcall, in cases where boot would break because of
> > > > >    fw_devlink=on being strict about the ordering, we
> > > > >
> > > > >    a. Temporarily relax the enforcement to probe any unprobed devices
> > > > >       that can probe successfully in the current state of the system.
> > > > >       For example, when we boot with a NFS rootfs and no network device
> > > > >       has probed.
> > > > >    b. Go back to enforcing the ordering for any devices that haven't
> > > > >       probed.
> > > > >
> > > > > 3. After deferred probe timeout expires, we permanently give up waiting
> > > > >    on supplier devices without drivers. At this point, whatever devices
> > > > >    can probe without some of their optional suppliers end up probing.
> > > > >
> > > > > In the case where module support is disabled, it's fairly
> > > > > straightforward and all device probes are completed before the initcalls
> > > > > are done.
> > > > >
> > > > > Patches 1 to 3 are fairly straightforward and can probably be applied
> > > > > right away.
> > > > >
> > > > > Patches 4 to 6 are for fixing the NFS rootfs issue and setting the
> > > > > default deferred_probe_timeout back to 10 seconds when modules are
> > > > > enabled.
> > > > >
> > > > > Patches 7 to 9 are further clean up of the deferred_probe_timeout logic
> > > > > so that no framework has to know/care about deferred_probe_timeout.
> > > > >
> > > > > Yoshihiro/Geert,
> > > > >
> > > > > If you can test this patch series and confirm that the NFS root case
> > > > > works, I'd really appreciate that.
> > > >
> > > > Thanks, I gave this a try on various boards I have access to.
> > > > The results were quite positive. E.g. the compile error I saw on v1
> > > > (implicit declation of fw_devlink_unblock_may_probe(), which is no longer
> > > >  used in v2) is gone.
> > >
> > > Thanks a lot for testing these.
> > >
> > > > However, I'm seeing a weird error when userspace (Debian9 nfsroot) is
> > > > starting:
> > > >
> > > >     [  OK  ] Started D-Bus System Message Bus.
> > > >     Unable to handle kernel NULL pointer dereference at virtual
> > > > address 0000000000000000
> > > >     Unable to handle kernel NULL pointer dereference at virtual
> > > > address 0000000000000000
> > > >     Mem abort info:
> > > >       ESR = 0x0000000096000004
> > > >     Mem abort info:
> > > >       ESR = 0x0000000096000004
> > > >       EC = 0x25: DABT (current EL), IL = 32 bits
> > > >       SET = 0, FnV = 0
> > > >       EC = 0x25: DABT (current EL), IL = 32 bits
> > > >       EA = 0, S1PTW = 0
> > > >       FSC = 0x04: level 0 translation fault
> > > >       SET = 0, FnV = 0
> > > >     Data abort info:
> > > >       ISV = 0, ISS = 0x00000004
> > > >       EA = 0, S1PTW = 0
> > > >       FSC = 0x04: level 0 translation fault
> > > >       CM = 0, WnR = 0
> > > >     user pgtable: 4k pages, 48-bit VAs, pgdp=000000004ec45000
> > > >     [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
> > > >     Data abort info:
> > > >     Internal error: Oops: 96000004 [#1] PREEMPT SMP
> > > >     CPU: 0 PID: 374 Comm: v4l_id Tainted: G        W
> > > > 5.19.0-rc1-arm64-renesas-00799-gc13c3e49e8bd #1660
> > > >       ISV = 0, ISS = 0x00000004
> > > >     Hardware name: Renesas Ebisu-4D board based on r8a77990 (DT)
> > > >     pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > > >       CM = 0, WnR = 0
> > > >     pc : subdev_open+0x8c/0x128
> > > >     lr : subdev_open+0x78/0x128
> > > >     sp : ffff80000aadba60
> > > >     x29: ffff80000aadba60 x28: 0000000000000000 x27: ffff80000aadbc58
> > > >     x26: 0000000000020000 x25: ffff00000b3aaf00 x24: 0000000000000000
> > > >     x23: ffff00000c331c00 x22: ffff000009aa61b8 x21: ffff000009aa6000
> > > >     x20: ffff000008bae3e8 x19: ffff00000c3fe200 x18: 0000000000000000
> > > >     x17: ffff800076945000 x16: ffff800008004000 x15: 00008cc6bf550c7c
> > > >     x14: 000000000000038f x13: 000000000000001a x12: ffff00007fba8618
> > > >     x11: 0000000000000001 x10: 0000000000000000 x9 : ffff800009253954
> > > >     x8 : ffff00000b3aaf00 x7 : 0000000000000004 x6 : 000000000000001a
> > > >     x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000001
> > > >     x2 : 0000000100000001 x1 : 0000000000000000 x0 : 0000000000000000
> > > >     Call trace:
> > > >      subdev_open+0x8c/0x128
> >
> > After disassembling the code on my end (with slightly different
> > config) and looking at 0x8c from the start of the function, I'm pretty
> > sure the NULL deref is happening here inside subdev_open()
> >
> >         if (sd->v4l2_dev->mdev && sd->entity.graph_obj.mdev->dev) {
> >
> > sd->entity.graph_obj.mdev == NULL.
> >
> > And going by the field names, I'm guessing these are suppliers pointed
> > to by "remote-endpoint". Sadly fw_devlink can't extract any dependency
> > info from remote-endpoint because the devices generally point to each
> > other so a cycle is detected and the probe ordering isn't enforced
> > between the endpoints. We still need to parse remote-endpoint to
> > detect cycles created by a combination of endpoints/other properties
> > (there's a real world case in upstream).
> >
> > > >      v4l2_open+0xa4/0x120
> > > >      chrdev_open+0x78/0x178
> > > >      do_dentry_open+0xfc/0x398
> > > >      vfs_open+0x28/0x30
> > > >      path_openat+0x584/0x9c8
> > > >      do_filp_open+0x80/0x108
> > > >      do_sys_openat2+0x20c/0x2d8
> > > >     user pgtable: 4k pages, 48-bit VAs, pgdp=000000004ec53000
> > > >      do_sys_open+0x54/0xa0
> > > >      __arm64_sys_openat+0x20/0x28
> > > >      invoke_syscall+0x40/0xf8
> > > >      el0_svc_common.constprop.0+0xf0/0x110
> > > >      do_el0_svc+0x20/0x78
> > > >      el0_svc+0x48/0xd0
> > > >      el0t_64_sync_handler+0xb0/0xb8
> > > >      el0t_64_sync+0x148/0x14c
> > > >     Code: f9405280 f9400400 b40000e0 f9400280 (f9400000)
> > > >     ---[ end trace 0000000000000000 ]---
> > > >
> > > > This only happens on the Ebisu-4D board (r8a77990-ebisu.dts).
> > > > I do not see this on the Salvator-X(S) boards.
> > >
> > > Ok. I don't know much about either of these boards. Are they supposed
> > > to be very similar?
> > >
> > > > Bisection shows this starts to happen with "[PATCH v2 7/9] driver core:
> > > > Set fw_devlink.strict=1 by default".
> > >
> > > So in the series, by this point, the previous patches would have
> > > deferred probe timeout set to 10s (it can get extended on new driver
> > > additions of course) and once the timer expires suppliers without
> > > drivers will no longer block any consumers. The only difference
> > > fw_devlink.strict=1 should cause is iommus and dmas dependency being
> > > treated as mandatory till the timeout expires.
> > >
> > > In this instance, do you have iommu drivers and dma drivers compiled
> > > in or loaded as modules or not available at all? In all these case,
> > > the list of devices that would end up probing eventually should be the
> > > same with or without fw_devlink.strict=1. The only difference would be
> > > some reordering of probes.
> > >
> > > So this looks to me like improper error handling/assumption in the
> > > driver for this subdev device. I'm guessing one of the suppliers to
> > > this subdev has a direct/indirect dependency on iommus and this subdev
> > > driver is assuming that the supplier would have probed by the time
> > > it's probed.
> > >
> > > >
> > > > Adding more debug info:
> > > >
> > > >     subdev_open:54: file v4l-subdev1
> > > >     Unable to handle kernel NULL pointer dereference at virtual
> > > > address 0000000000000000
> > > >     subdev_open:54: file v4l-subdev2
> > > >     Unable to handle kernel NULL pointer dereference at virtual
> > > > address 0000000000000000
> >
> > How did you get these two "subdev_open" strings? And how/why the NULL
> > deref there?
>
> I added a debug print at the top of subdev_open():
>
>     pr_info("%s:%u: file %pD\n", __func__, __LINE__, file);
>
> The NULL deref is the actual issue.
>
> > > > Matching the subdev using sysfs gives:
> > > >
> > > >     /sys/devices/platform/soc/e6500000.i2c/i2c-0/0-0070/video4linux/v4l-subdev1
> > > >     /sys/devices/platform/soc/e6500000.i2c/i2c-0/0-0070/video4linux/v4l-subdev2
> > > >
> > > > The i2c device is the adi,adv7482 at address 0x70.
> > >
> > > I'm guessing the fix would be somewhere in this driver, but I haven't
> > > dug into it. Any guesses on which of its suppliers might have a
> > > direct/indirect dependency on an iommu/dma? You could also enable the
> > > debug log in fw_devlink_relax_link() and see if it relaxes any link
> > > where the supplier is an iommu/dma device. That might give us some
> > > hints.
> >
> > After spending way too much time on this looking at
> > drivers/media/v4l2-core, drivers/media/mc and
> > drivers/media/i2c/adv748x/ code, I'm guessing the ordering issue is
> > probably between "csi40:" device and the video-receiver@70 (the
> > "adi,adv7482") device.
> >
> > Based on your points about the sysfs, I was initially digging into
> > drivers/media/i2c/adv748x/adv748x-core.c. But then the parent of
> > video-receiver@70 is an i2c0 that has dmas dependencies. The csi40:
> > (referred to from video-controller) doesn't seem to have any iommu or
> > dmas dependency. So my guess is the csi40 gets probed first and then
> > assumes the video-controller is already available.
> >
> > Can you use this info to take a stab at debugging this further?
>
> Thanks for looking into this, there is indeed a cyclic dependency:
>
>     i2c 0-0070: Fixing up cyclic dependency with feaa0000.csi2
>     i2c 0-0070: Fixing up cyclic dependency with hdmi-in
>     i2c 0-0070: Fixing up cyclic dependency with cvbs-in
>
> > TL;DR is that I think this is some driver issue where it's not
> > checking for one of its suppliers to be ready yet.
>
> Setting fw_devlink_strict to true vs. false seems to influence which of
> two different failures will happen:
>   - rcar-csi2: probe of feaa0000.csi2 failed with error -22
>   - rcar-vin: probe of e6ef5000.video failed with error -22
> The former causes the NULL pointer dereference later.
> The latter existed before, but I hadn't noticed it, and bisection
> led to the real culprit (commit 3e52419ec04f9769 ("media: rcar-{csi2,vin}:
> Move to full Virtual Channel routing per CSI-2 IP").

If you revert that patch, does this series work fine? If yes, are you
happy with giving this a Tested-by?

-Saravana

>
> I am bringing it up with the multi-media guys in
> https://lore.kernel.org/all/20220124124858.571363-4-niklas.soderlund+renesas@ragnatech.se...
>
> Thanks!
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
