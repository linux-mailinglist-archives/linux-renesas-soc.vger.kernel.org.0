Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7E079FCCE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Sep 2023 09:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232593AbjINHJF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Sep 2023 03:09:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232122AbjINHJE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Sep 2023 03:09:04 -0400
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9AF6CE5;
        Thu, 14 Sep 2023 00:09:00 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-592976e5b6dso7074747b3.2;
        Thu, 14 Sep 2023 00:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694675339; x=1695280139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3bPJRE7Dn9tq7+g0e7rhq+WGthyqvVeFUvuw6jaNTDs=;
        b=uzZXV9hCnonHbq9N6ArFkrsgTM1HG/3QVxaxPK451YodhmyPPkF591lSoF1e5B+lbP
         0k4W6K3JG13+bDvil8v41DN3ub2JoWgURARpF/szkeYcpcI4j7u99pE6bLwj6PlNHtpJ
         ifV/XssGnVjY4tEMZ/kbDHHIiZgR3qE8ZrE1LwWcsuT3us1rD6f99rwXL6tuedL6QLNR
         tdFQ+So2z1HMvXwYNq4FHVI0IB+e40LR89ixWZUc5ML9QSLE/9Sc01Jeuw7DtfO+Nxl5
         BrCyaWx1Q+u8hGIyOmKYC+aHuSc3t+AaJwQrdhQFIJLfc0xS4ZEJBj6R1gH3YWgynTS3
         rIqQ==
X-Gm-Message-State: AOJu0YwVBT7793eQXffGN1dmVbrPCdcpkC02wyj2tsczflxqwSIKxMFD
        zJDOJk9xjhXvjYkq419chKpSDtq8soJPvA==
X-Google-Smtp-Source: AGHT+IFAJr0rFWvsx6qy3Cb2Qxk+FIXM4o1SpbgfjQUvTuzQ6/0zmIqEfNMWjAj4BaQB5DyqsLM9Xw==
X-Received: by 2002:a81:9c44:0:b0:571:11ea:b2dd with SMTP id n4-20020a819c44000000b0057111eab2ddmr4777501ywa.32.1694675339567;
        Thu, 14 Sep 2023 00:08:59 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id y62-20020a0dd641000000b0059b24bd4f2asm198864ywd.57.2023.09.14.00.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 00:08:59 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-d7820f9449bso665955276.1;
        Thu, 14 Sep 2023 00:08:59 -0700 (PDT)
X-Received: by 2002:a25:e60a:0:b0:d78:123:5a97 with SMTP id
 d10-20020a25e60a000000b00d7801235a97mr4565755ybh.25.1694675338816; Thu, 14
 Sep 2023 00:08:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230912005655.368075-1-dlemoal@kernel.org> <20230912005655.368075-4-dlemoal@kernel.org>
 <1e25e64-a6bc-49e8-62c8-101f3f6de113@linux-m68k.org>
In-Reply-To: <1e25e64-a6bc-49e8-62c8-101f3f6de113@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 14 Sep 2023 09:08:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUy2T60au+kB7g=K1uP2NaebC-aTNdmqY_tKYP6-m-3rQ@mail.gmail.com>
Message-ID: <CAMuHMdUy2T60au+kB7g=K1uP2NaebC-aTNdmqY_tKYP6-m-3rQ@mail.gmail.com>
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

On Wed, Sep 13, 2023 at 12:27 PM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Tue, 12 Sep 2023, Damien Le Moal wrote:
> > There is no direct device ancestry defined between an ata_device and
> > its scsi device which prevents the power management code from correctly
> > ordering suspend and resume operations. Create such ancestry with the
> > ata device as the parent to ensure that the scsi device (child) is
> > suspended before the ata device and that resume handles the ata device
> > before the scsi device.
> >
> > The parent-child (supplier-consumer) relationship is established between
> > the ata_port (parent) and the scsi device (child) with the function
> > device_add_link(). The parent used is not the ata_device as the PM
> > operations are defined per port and the status of all devices connected
> > through that port is controlled from the port operations.
> >
> > The device link is established with the new function
> > ata_scsi_dev_alloc(). This function is used to define the ->slave_alloc
> > callback of the scsi host template of most drivers.
> >
> > Fixes: a19a93e4c6a9 ("scsi: core: pm: Rely on the device driver core for async power management")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
> > Reviewed-by: Hannes Reinecke <hare@suse.de>
>
> Thanks for your patch, which is now commit 99626085d036ec32 ("ata:
> libata-scsi: link ata port and scsi device") in libata/for-next.
>
> This patch causes /dev/sda to disappear on Renesas Salvator-XS with
> R-Car H3 ES2.0.  Changes to dmesg before/after:
>
>       sata_rcar ee300000.sata: ignoring dependency for device, assuming no driver
>       scsi host0: sata_rcar
>      -ata1: SATA max UDMA/133 irq 184 lpm-pol 0
>      +ata1: SATA max UDMA/133 irq 179 lpm-pol 0
>       ata1: link resume succeeded after 1 retries
>       ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
>       ata1.00: ATA-7: Maxtor 6L160M0, BANC1G10, max UDMA/133
>       ata1.00: 320173056 sectors, multi 0: LBA48 NCQ (not used)
>       ata1.00: configured for UDMA/133
>       scsi 0:0:0:0: Direct-Access     ATA      Maxtor 6L160M0   1G10 PQ: 0 ANSI: 5
>      -sd 0:0:0:0: [sda] 320173056 512-byte logical blocks: (164 GB/153 GiB)
>      -sd 0:0:0:0: [sda] Write Protect is off
>      -sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
>      -sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
>      -sd 0:0:0:0: [sda] Preferred minimum I/O size 512 bytes
>      - sda: sda1
>      -sd 0:0:0:0: [sda] Attached SCSI disk

I see the same issue on SH/Landisk, which has CompactFLASH:

    -ata1: PATA max PIO0 ioport cmd 0xc0023040 ctl 0xc002302c irq 26
    +ata1: PATA max PIO0 ioport cmd 0xc0023040 ctl 0xc002302c irq 26 lpm-pol 0
     ata1.00: CFA: TS8GCF133, 20171204, max UDMA/100
     ata1.00: 15662304 sectors, multi 0: LBA48
     ata1.00: configured for PIO
     scsi 0:0:0:0: Direct-Access     ATA      TS8GCF133        1204
PQ: 0 ANSI: 5
    -sd 0:0:0:0: [sda] 15662304 512-byte logical blocks: (8.02 GB/7.47 GiB)
    -sd 0:0:0:0: [sda] Write Protect is off
    -sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
    -sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled,
doesn't support DPO or FUA
    -sd 0:0:0:0: [sda] Preferred minimum I/O size 512 bytes
    - sda: sda1 sda2 sda3
    -sd 0:0:0:0: [sda] Attached SCSI removable disk

and m68k/ARAnyM:

     atari-falcon-ide atari-falcon-ide: Atari Falcon and Q40/Q60 PATA controller
     scsi host0: pata_falcon
     ata1: PATA max PIO4 cmd fff00000 ctl fff00038 data fff00000 no
IRQ, using PIO polling
     ata1.00: ATA-2: Sarge m68k, , max PIO2
     ata1.00: 2118816 sectors, multi 0: LBA
     ata1.00: configured for PIO
     scsi 0:0:0:0: Direct-Access     ATA      Sarge m68k       n/a
PQ: 0 ANSI: 5
    -sd 0:0:0:0: [sda] 2118816 512-byte logical blocks: (1.08 GB/1.01 GiB)
    -sd 0:0:0:0: [sda] Write Protect is off
    -sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
    -sd 0:0:0:0: [sda] Write cache: disabled, read cache: enabled,
doesn't support DPO or FUA
    -sd 0:0:0:0: [sda] Preferred minimum I/O size 512 bytes
    - sda: AHDI sda1 sda2
    -sd 0:0:0:0: [sda] Attached SCSI disk

Reverting 99626085d036ec32 fixes the issue.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
