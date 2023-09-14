Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B593C7A064F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Sep 2023 15:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239096AbjINNny convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Sep 2023 09:43:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239118AbjINNnx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Sep 2023 09:43:53 -0400
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA13B1FC7;
        Thu, 14 Sep 2023 06:43:49 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-d7f1bc4ece3so1029233276.1;
        Thu, 14 Sep 2023 06:43:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694699029; x=1695303829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZiptDfWO3OwfTjyJFpjGsOnaFbidC8Yv0wyXW7E/kKg=;
        b=rT4lYk22GQplPgvgkjZb7cDPnRTYfYrFuSz0bF7D9L+nKoejrUlqNBIrkohQ+WkW4b
         qDWT+joSeeTJMigUXku0Ktx8DSX6AYGJnbcrA2yKu7hc+r59NQ3ohJTnmg8Vt+6BPpYI
         bk4a9ZdGrDhbGSSTzI78uZjPcxh5z6lZyA1hsdHEIzrCctz32JkGYUAnDjeCl+l7jQq8
         /a0DzT4EbzLCOihvS6ZBcgnwfZXuX1jPpYtTxvVOZT/1H1nnQuNAGnn1W8fQfOrWOQ1d
         zbU8AQmvB3efjj+JAXCh2Jw0RvNiVHSTv1WcwSxvAzpJYzyr7U2DVMjHmY3XuPHcNa9Y
         Ubkg==
X-Gm-Message-State: AOJu0YzJIAKbrSug/SyHi4n5qAlC5gFc6s57RwULToOUNDoATlym2mcM
        HbLcSBU3klIjtCdCRkHuk38yaKI7MFusXw==
X-Google-Smtp-Source: AGHT+IGymgDYimFcXcqMDM093U3hqxeAi2iO9y6W80QmgJVZ3FK0v5kxq8n2rHUA5WlYsi81UlCBSg==
X-Received: by 2002:a5b:308:0:b0:d12:25d:fd60 with SMTP id j8-20020a5b0308000000b00d12025dfd60mr5449804ybp.9.1694699028570;
        Thu, 14 Sep 2023 06:43:48 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id l26-20020a25b31a000000b00d7745e2bb19sm335953ybj.29.2023.09.14.06.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 06:43:48 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d7e904674aeso1010563276.3;
        Thu, 14 Sep 2023 06:43:48 -0700 (PDT)
X-Received: by 2002:a25:24d5:0:b0:ce8:4567:a382 with SMTP id
 k204-20020a2524d5000000b00ce84567a382mr5547542ybk.1.1694699027800; Thu, 14
 Sep 2023 06:43:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230912005655.368075-1-dlemoal@kernel.org> <20230912005655.368075-4-dlemoal@kernel.org>
 <1e25e64-a6bc-49e8-62c8-101f3f6de113@linux-m68k.org> <CAMuHMdUy2T60au+kB7g=K1uP2NaebC-aTNdmqY_tKYP6-m-3rQ@mail.gmail.com>
 <472eebb7-d1d7-e1cb-4688-5266cc6e2a60@kernel.org>
In-Reply-To: <472eebb7-d1d7-e1cb-4688-5266cc6e2a60@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 14 Sep 2023 15:43:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUV5k3fj-wVzw6JJzcZNfdJBth5YNPCDW7h=RXEBJiB7A@mail.gmail.com>
Message-ID: <CAMuHMdUV5k3fj-wVzw6JJzcZNfdJBth5YNPCDW7h=RXEBJiB7A@mail.gmail.com>
Subject: Re: [PATCH v2 03/21] ata: libata-scsi: link ata port and scsi device
To:     Damien Le Moal <dlemoal@kernel.org>
Cc:     linux-ide@vger.kernel.org, linux-scsi@vger.kernel.org,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        John Garry <john.g.garry@oracle.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Paul Ausbeck <paula@soe.ucsc.edu>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Joe Breuer <linux-kernel@jmbreuer.net>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Damien,

On Thu, Sep 14, 2023 at 3:18 PM Damien Le Moal <dlemoal@kernel.org> wrote:
> On 9/14/23 16:08, Geert Uytterhoeven wrote:
> > On Wed, Sep 13, 2023 at 12:27 PM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> >> On Tue, 12 Sep 2023, Damien Le Moal wrote:
> >>> There is no direct device ancestry defined between an ata_device and
> >>> its scsi device which prevents the power management code from correctly
> >>> ordering suspend and resume operations. Create such ancestry with the
> >>> ata device as the parent to ensure that the scsi device (child) is
> >>> suspended before the ata device and that resume handles the ata device
> >>> before the scsi device.
> >>>
> >>> The parent-child (supplier-consumer) relationship is established between
> >>> the ata_port (parent) and the scsi device (child) with the function
> >>> device_add_link(). The parent used is not the ata_device as the PM
> >>> operations are defined per port and the status of all devices connected
> >>> through that port is controlled from the port operations.
> >>>
> >>> The device link is established with the new function
> >>> ata_scsi_dev_alloc(). This function is used to define the ->slave_alloc
> >>> callback of the scsi host template of most drivers.
> >>>
> >>> Fixes: a19a93e4c6a9 ("scsi: core: pm: Rely on the device driver core for async power management")
> >>> Cc: stable@vger.kernel.org
> >>> Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
> >>> Reviewed-by: Hannes Reinecke <hare@suse.de>
> >>
> >> Thanks for your patch, which is now commit 99626085d036ec32 ("ata:
> >> libata-scsi: link ata port and scsi device") in libata/for-next.
> >>
> >> This patch causes /dev/sda to disappear on Renesas Salvator-XS with
> >> R-Car H3 ES2.0.  Changes to dmesg before/after:
> >>
> >>       sata_rcar ee300000.sata: ignoring dependency for device, assuming no driver
> >>       scsi host0: sata_rcar
> >>      -ata1: SATA max UDMA/133 irq 184 lpm-pol 0
> >>      +ata1: SATA max UDMA/133 irq 179 lpm-pol 0
> >>       ata1: link resume succeeded after 1 retries
> >>       ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
> >>       ata1.00: ATA-7: Maxtor 6L160M0, BANC1G10, max UDMA/133
> >>       ata1.00: 320173056 sectors, multi 0: LBA48 NCQ (not used)
> >>       ata1.00: configured for UDMA/133
> >>       scsi 0:0:0:0: Direct-Access     ATA      Maxtor 6L160M0   1G10 PQ: 0 ANSI: 5
> >>      -sd 0:0:0:0: [sda] 320173056 512-byte logical blocks: (164 GB/153 GiB)
> >>      -sd 0:0:0:0: [sda] Write Protect is off
> >>      -sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
> >>      -sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
> >>      -sd 0:0:0:0: [sda] Preferred minimum I/O size 512 bytes
> >>      - sda: sda1
> >>      -sd 0:0:0:0: [sda] Attached SCSI disk
> >
> > I see the same issue on SH/Landisk, which has CompactFLASH:
> > and m68k/ARAnyM:

> > Reverting 99626085d036ec32 fixes the issue.
>
> Without reverting, can you try this incremental update ?
>
> diff --git a/drivers/ata/ahci.h b/drivers/ata/ahci.h
> index 4bae95b06ae3..72085756f4ba 100644
> --- a/drivers/ata/ahci.h
> +++ b/drivers/ata/ahci.h
> @@ -398,6 +398,7 @@ extern const struct attribute_group *ahci_sdev_groups[];
>         .sdev_groups            = ahci_sdev_groups,                     \
>         .change_queue_depth     = ata_scsi_change_queue_depth,          \
>         .tag_alloc_policy       = BLK_TAG_ALLOC_RR,                     \
> +       .slave_alloc            = ata_scsi_slave_alloc,                 \
>         .slave_configure        = ata_scsi_slave_config
>
>  extern struct ata_port_operations ahci_ops;
> diff --git a/drivers/ata/libata-scsi.c b/drivers/ata/libata-scsi.c
> index 7aa70af1fc07..5a0513452150 100644
> --- a/drivers/ata/libata-scsi.c
> +++ b/drivers/ata/libata-scsi.c
> @@ -1093,6 +1093,7 @@ int ata_scsi_dev_alloc(struct scsi_device *sdev, struct ata_port *ap)
>          * consumer (child) and the ata port the supplier (parent).
>          */
>         link = device_link_add(&sdev->sdev_gendev, &ap->tdev,
> +                              DL_FLAG_STATELESS |
>                                DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE);
>         if (!link) {
>                 ata_port_err(ap, "Failed to create link to scsi device %s\n",
> @@ -1164,6 +1165,8 @@ void ata_scsi_slave_destroy(struct scsi_device *sdev)
>         unsigned long flags;
>         struct ata_device *dev;
>
> +       device_link_remove(&sdev->sdev_gendev, &ap->tdev);
> +
>         spin_lock_irqsave(ap->lock, flags);
>         dev = __ata_scsi_find_dev(ap, sdev);
>         if (dev && dev->sdev) {
>
> This solves the issue for me. If you confirm it works for you, I will squash
> this into 99626085d036ec32.

Thank you, /dev/sda is back into business on R-Car SATA, Landisk, and
ARAnyM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
