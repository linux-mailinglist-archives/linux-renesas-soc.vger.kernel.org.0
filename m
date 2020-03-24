Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77694191043
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2020 14:30:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729325AbgCXN0t (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Mar 2020 09:26:49 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:51326 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729379AbgCXN0s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Mar 2020 09:26:48 -0400
Received: from ramsan ([84.195.182.253])
        by albert.telenet-ops.be with bizsmtp
        id JDSm220085USYZQ06DSmt4; Tue, 24 Mar 2020 14:26:46 +0100
Received: from geert (helo=localhost)
        by ramsan with local-esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jGjZu-00061K-5Z; Tue, 24 Mar 2020 14:26:46 +0100
Date:   Tue, 24 Mar 2020 14:26:46 +0100 (CET)
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Hannes Reinecke <hare@suse.de>
cc:     Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-ide@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 04/40] libata: move ata_{port,link,dev}_dbg to standard
 dev_XXX() macros
In-Reply-To: <20200303093813.18523-5-hare@suse.de>
Message-ID: <alpine.DEB.2.21.2003241414490.21582@ramsan.of.borg>
References: <20200303093813.18523-1-hare@suse.de> <20200303093813.18523-5-hare@suse.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

 	Hi Hannes,

On Tue, 3 Mar 2020, Hannes Reinecke wrote:
> Use standard dev_{dbg,info,notice,warn,err} macros instead of the
> hand-crafted printk helpers.
>
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

This is now commit ad9f23bd12e1d721 ("libata: move
ata_{port,link,dev}_dbg to standard dev_XXX() macros") in
linux-block/for-next.

This patch causes an intriguing change in boot messages, adding a space
at the beginning of each printed line:

      scsi host0: sata_rcar
     -ata1: SATA max UDMA/133 irq 117
     + ata1: SATA max UDMA/133 irq 117

     -ata1: link resume succeeded after 1 retries
     + link1: link resume succeeded after 1 retries

     -ata1: SATA link down (SStatus 0 SControl 300)
     + link1: SATA link down (SStatus 0 SControl 300)

It turns out dev_driver_string(&link->tdev) returns an empty string, as
its driver field is NULL, so __dev_printk() prints the empty string and
the device name, separated by a space.

At first I thought this was a bug in rcar-sata, lacking some setup that
was harmless before, but it turns out other drivers (e.g. pata-falcon)
show the same issue:

      scsi host0: pata_falcon
     -ata1: PATA max PIO4 cmd 0xfff00000 ctl 0xfff00039
     + ata1: PATA max PIO4 cmd 0xfff00000 ctl 0xfff00039

     -ata1.01: NODEV after polling detection
     -ata1.00: ATA-2: Sarge m68k, , max PIO2
     -ata1.00: 2118816 sectors, multi 0: LBA
     -ata1.00: configured for PIO
     + dev1.0: ATA-2: Sarge m68k, , max PIO2
     + dev1.0: 2118816 sectors, multi 0: LBA
     + dev1.0: configured for PIO

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
