Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36F0F192CA7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2020 16:34:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727720AbgCYPe3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Mar 2020 11:34:29 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42188 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727439AbgCYPe3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Mar 2020 11:34:29 -0400
Received: by mail-ot1-f68.google.com with SMTP id z5so2056679oth.9;
        Wed, 25 Mar 2020 08:34:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qm4OmflLJeAW0L4Mi6PVSTuH/EY6mqG692GI+ZIxrdc=;
        b=NjcQBgTVE9HSXhuBHlA8/rdWF5JWfL2k8qX6ht1VieKgkQ7wuNIVdCk96B5ocf4yCg
         +mt58nzSLcO7siJ8cvLmSgLiLY5glqsgENXshhS0TTVyhAT2TmsuTCUVYEaaWYxzfNoz
         yLvfXTgNbLEqUJIrKxvcaqiFdY/Wv2oq65Prx6pvaXY1J5D3oY/M0Rcw8GemsvQ9zpGC
         a9UVjopIhOJ3d//pY8Kt54VAD2ZahhY7IUjmFqjquPAeK3qqMB1aOj+SxeQSkY4qMFhz
         NADav+3LbB1NPkl+U+bs1sdASxBPrajxIF2IDSbM5ZBtJfbf9ODP0+FAcp3LEZAFKc5T
         vNow==
X-Gm-Message-State: ANhLgQ0PBS+5ZCrhuStsCWI2JTiw1cug4r7HDXAmNtMJt3i2FBuwW0Cj
        LesYCDPEn7mQd1lPilVRnJ0T312/HhTzkAXKoncapi3i
X-Google-Smtp-Source: ADFU+vuIiwNWRr8W4mKt1R6BFn1WSF0LG/+FNkI0NNLI4huSvAKr6T2fr4iqCMAe5KS3w0QiXGKibhYIrtKkq/jyY+k=
X-Received: by 2002:a9d:5c0c:: with SMTP id o12mr2870419otk.145.1585150467089;
 Wed, 25 Mar 2020 08:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200303093813.18523-1-hare@suse.de> <20200303093813.18523-5-hare@suse.de>
 <CGME20200324132651eucas1p2e1570d1edf07101d29addd27df69d0e7@eucas1p2.samsung.com>
 <alpine.DEB.2.21.2003241414490.21582@ramsan.of.borg> <49e11382-5fa7-f858-97de-feb1e6033f33@samsung.com>
In-Reply-To: <49e11382-5fa7-f858-97de-feb1e6033f33@samsung.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 25 Mar 2020 16:34:15 +0100
Message-ID: <CAMuHMdVMLBOOau9YAGo5WoQUwdU7nKZY2Yy_YEQqbypKojcczg@mail.gmail.com>
Subject: Re: [PATCH 04/40] libata: move ata_{port,link,dev}_dbg to standard
 dev_XXX() macros
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     Hannes Reinecke <hare@suse.de>, Jens Axboe <axboe@kernel.dk>,
        Tejun Heo <tj@kernel.org>, linux-ide@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Bartl,

On Wed, Mar 25, 2020 at 3:56 PM Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:
> On 3/24/20 2:26 PM, Geert Uytterhoeven wrote:
> > On Tue, 3 Mar 2020, Hannes Reinecke wrote:
> >> Use standard dev_{dbg,info,notice,warn,err} macros instead of the
> >> hand-crafted printk helpers.
> >>
> >> Signed-off-by: Hannes Reinecke <hare@suse.de>
> >> Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> >
> > This is now commit ad9f23bd12e1d721 ("libata: move
> > ata_{port,link,dev}_dbg to standard dev_XXX() macros") in
> > linux-block/for-next.
> >
> > This patch causes an intriguing change in boot messages, adding a space
> > at the beginning of each printed line:
> >
> >      scsi host0: sata_rcar
> >     -ata1: SATA max UDMA/133 irq 117
> >     + ata1: SATA max UDMA/133 irq 117
> >
> >     -ata1: link resume succeeded after 1 retries
> >     + link1: link resume succeeded after 1 retries
> >
> >     -ata1: SATA link down (SStatus 0 SControl 300)
> >     + link1: SATA link down (SStatus 0 SControl 300)
> >
> > It turns out dev_driver_string(&link->tdev) returns an empty string, as
> > its driver field is NULL, so __dev_printk() prints the empty string and
> > the device name, separated by a space.
> >
> > At first I thought this was a bug in rcar-sata, lacking some setup that
> > was harmless before, but it turns out other drivers (e.g. pata-falcon)
> > show the same issue:
> >
> >      scsi host0: pata_falcon
> >     -ata1: PATA max PIO4 cmd 0xfff00000 ctl 0xfff00039
> >     + ata1: PATA max PIO4 cmd 0xfff00000 ctl 0xfff00039
> >
> >     -ata1.01: NODEV after polling detection
> >     -ata1.00: ATA-2: Sarge m68k, , max PIO2
> >     -ata1.00: 2118816 sectors, multi 0: LBA
> >     -ata1.00: configured for PIO
> >     + dev1.0: ATA-2: Sarge m68k, , max PIO2
> >     + dev1.0: 2118816 sectors, multi 0: LBA
> >     + dev1.0: configured for PIO
>
> I'm more worried about change of ATA devices and ATA links names
> (unfortunately we cannot change the ones used in libata-transport.c
> as they are a part of ABI exposed through sysfs).

True.

> One way to improve the situation is to use transport classes names
> for dev_printk() when no other means are available, please see/try
> the patch below (compile tested only). It also includes fixup for
> extra space issue (change to __dev_printk()).

Thanks for the suggestion!

> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -1225,7 +1225,8 @@ const char *dev_driver_string(const stru
>         drv = READ_ONCE(dev->driver);
>         return drv ? drv->name :
>                         (dev->bus ? dev->bus->name :
> -                       (dev->class ? dev->class->name : ""));
> +                        (dev->class ? dev->class->name :
> +                         (dev->tclass ? (&dev->tclass->class)->name : "")));

Aren't "dev->class->name" and "(&dev->tclass->class)->name"
exactly the same, as the first member of struct transport_class is
a struct class object?

(If they're not the same, and I need more coffee, I'm still afraid this is
 too fragile.  Then there is no guarantee the pointer points to a real
transport_class object, so this might cause a crash.)

> --- a/drivers/ata/libata-transport.c
> +++ b/drivers/ata/libata-transport.c
> @@ -289,6 +289,7 @@ int ata_tport_add(struct device *parent,
>         ata_host_get(ap->host);
>         dev->release = ata_tport_release;
>         dev_set_name(dev, "ata%d", ap->print_id);
> +       dev->tclass = &ata_port_class;

Can't you just do dev->class = &ata_port_class.class...

>         transport_setup_device(dev);
>         ata_acpi_bind_port(ap);
>         error = device_add(dev);
> @@ -418,6 +419,7 @@ int ata_tlink_add(struct ata_link *link)
>                 dev_set_name(dev, "link%d", ap->print_id);
>         else
>                 dev_set_name(dev, "link%d.%d", ap->print_id, link->pmp);
> +       dev->tclass = &ata_link_class;

... and dev->class = &ata_link_class.class...

>
>         transport_setup_device(dev);
>
> @@ -669,6 +671,7 @@ static int ata_tdev_add(struct ata_devic
>                 dev_set_name(dev, "dev%d.%d", ap->print_id,ata_dev->devno);
>         else
>                 dev_set_name(dev, "dev%d.%d.0", ap->print_id, link->pmp);
> +       dev->tclass = &ata_dev_class;

... and dev->class = &ata_dev_class.class...

> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -29,6 +29,7 @@
>  #include <linux/device/bus.h>
>  #include <linux/device/class.h>
>  #include <linux/device/driver.h>
> +#include <linux/transport_class.h>
>  #include <asm/device.h>
>
>  struct device;
> @@ -608,7 +609,11 @@ struct device {
>         spinlock_t              devres_lock;
>         struct list_head        devres_head;
>
> -       struct class            *class;
> +       union {
> +               struct class            *class;
> +               struct transport_class  *tclass;
> +       };
> +
>         const struct attribute_group **groups;  /* optional groups */
>
>         void    (*release)(struct device *dev);

... and drop all changes to device.h?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
