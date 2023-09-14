Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C8C179FD19
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Sep 2023 09:18:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230147AbjINHSM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Sep 2023 03:18:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230475AbjINHSM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Sep 2023 03:18:12 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38C55E4D;
        Thu, 14 Sep 2023 00:18:08 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03D4BC433C7;
        Thu, 14 Sep 2023 07:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694675887;
        bh=pHV0xAlB9G48OcMeZS58qvGiqojXj3S1FuPmY33vnFA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=uJygONfSib2mtauDAWndq5/wIp/nkporgCf2aCu7Hmxnr3xKjHapcqgGlfxp4QgKy
         q8IME4agNWBqvOnU1urB+BMQUkEf9urA9ywbyQpjuFhhsldLpdnjuptwbvMNCFrI//
         pMK28TB2TvQDsS3+BuAyba+xvpHZZT+cxspmGSl6hE9Q93trAip6sMVfX0uPio8u51
         9aGNGbQ+G0zZxld7PwJrZWhYB/SDcIpObGORtp3yYik41sl8QPBzFyz+zaJ0hQyqv6
         ZJIp5CYld/UC3opRkseJcfNJ3fBdugY54brj7KEHnDTMVCYoBkwtttfP9c2msC07xn
         5NcGuQhDwd6DQ==
Message-ID: <44b61fbd-65c1-bed6-73bc-10b9ef2e5856@kernel.org>
Date:   Thu, 14 Sep 2023 16:18:04 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 03/21] ata: libata-scsi: link ata port and scsi device
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-ide@vger.kernel.org, linux-scsi@vger.kernel.org,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        John Garry <john.g.garry@oracle.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Paul Ausbeck <paula@soe.ucsc.edu>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Joe Breuer <linux-kernel@jmbreuer.net>,
        linux-renesas-soc@vger.kernel.org
References: <20230912005655.368075-1-dlemoal@kernel.org>
 <20230912005655.368075-4-dlemoal@kernel.org>
 <1e25e64-a6bc-49e8-62c8-101f3f6de113@linux-m68k.org>
 <CAMuHMdUy2T60au+kB7g=K1uP2NaebC-aTNdmqY_tKYP6-m-3rQ@mail.gmail.com>
From:   Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <CAMuHMdUy2T60au+kB7g=K1uP2NaebC-aTNdmqY_tKYP6-m-3rQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 9/14/23 16:08, Geert Uytterhoeven wrote:
> Hi Damien,
> 
> On Wed, Sep 13, 2023 at 12:27 PM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> On Tue, 12 Sep 2023, Damien Le Moal wrote:
>>> There is no direct device ancestry defined between an ata_device and
>>> its scsi device which prevents the power management code from correctly
>>> ordering suspend and resume operations. Create such ancestry with the
>>> ata device as the parent to ensure that the scsi device (child) is
>>> suspended before the ata device and that resume handles the ata device
>>> before the scsi device.
>>>
>>> The parent-child (supplier-consumer) relationship is established between
>>> the ata_port (parent) and the scsi device (child) with the function
>>> device_add_link(). The parent used is not the ata_device as the PM
>>> operations are defined per port and the status of all devices connected
>>> through that port is controlled from the port operations.
>>>
>>> The device link is established with the new function
>>> ata_scsi_dev_alloc(). This function is used to define the ->slave_alloc
>>> callback of the scsi host template of most drivers.
>>>
>>> Fixes: a19a93e4c6a9 ("scsi: core: pm: Rely on the device driver core for async power management")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
>>> Reviewed-by: Hannes Reinecke <hare@suse.de>
>>
>> Thanks for your patch, which is now commit 99626085d036ec32 ("ata:
>> libata-scsi: link ata port and scsi device") in libata/for-next.
>>
>> This patch causes /dev/sda to disappear on Renesas Salvator-XS with
>> R-Car H3 ES2.0.  Changes to dmesg before/after:
>>
>>       sata_rcar ee300000.sata: ignoring dependency for device, assuming no driver
>>       scsi host0: sata_rcar
>>      -ata1: SATA max UDMA/133 irq 184 lpm-pol 0
>>      +ata1: SATA max UDMA/133 irq 179 lpm-pol 0
>>       ata1: link resume succeeded after 1 retries
>>       ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
>>       ata1.00: ATA-7: Maxtor 6L160M0, BANC1G10, max UDMA/133
>>       ata1.00: 320173056 sectors, multi 0: LBA48 NCQ (not used)
>>       ata1.00: configured for UDMA/133
>>       scsi 0:0:0:0: Direct-Access     ATA      Maxtor 6L160M0   1G10 PQ: 0 ANSI: 5
>>      -sd 0:0:0:0: [sda] 320173056 512-byte logical blocks: (164 GB/153 GiB)
>>      -sd 0:0:0:0: [sda] Write Protect is off
>>      -sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
>>      -sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
>>      -sd 0:0:0:0: [sda] Preferred minimum I/O size 512 bytes
>>      - sda: sda1
>>      -sd 0:0:0:0: [sda] Attached SCSI disk
> 
> I see the same issue on SH/Landisk, which has CompactFLASH:
> 
>     -ata1: PATA max PIO0 ioport cmd 0xc0023040 ctl 0xc002302c irq 26
>     +ata1: PATA max PIO0 ioport cmd 0xc0023040 ctl 0xc002302c irq 26 lpm-pol 0
>      ata1.00: CFA: TS8GCF133, 20171204, max UDMA/100
>      ata1.00: 15662304 sectors, multi 0: LBA48
>      ata1.00: configured for PIO
>      scsi 0:0:0:0: Direct-Access     ATA      TS8GCF133        1204
> PQ: 0 ANSI: 5
>     -sd 0:0:0:0: [sda] 15662304 512-byte logical blocks: (8.02 GB/7.47 GiB)
>     -sd 0:0:0:0: [sda] Write Protect is off
>     -sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
>     -sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled,
> doesn't support DPO or FUA
>     -sd 0:0:0:0: [sda] Preferred minimum I/O size 512 bytes
>     - sda: sda1 sda2 sda3
>     -sd 0:0:0:0: [sda] Attached SCSI removable disk
> 
> and m68k/ARAnyM:
> 
>      atari-falcon-ide atari-falcon-ide: Atari Falcon and Q40/Q60 PATA controller
>      scsi host0: pata_falcon
>      ata1: PATA max PIO4 cmd fff00000 ctl fff00038 data fff00000 no
> IRQ, using PIO polling
>      ata1.00: ATA-2: Sarge m68k, , max PIO2
>      ata1.00: 2118816 sectors, multi 0: LBA
>      ata1.00: configured for PIO
>      scsi 0:0:0:0: Direct-Access     ATA      Sarge m68k       n/a
> PQ: 0 ANSI: 5
>     -sd 0:0:0:0: [sda] 2118816 512-byte logical blocks: (1.08 GB/1.01 GiB)
>     -sd 0:0:0:0: [sda] Write Protect is off
>     -sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
>     -sd 0:0:0:0: [sda] Write cache: disabled, read cache: enabled,
> doesn't support DPO or FUA
>     -sd 0:0:0:0: [sda] Preferred minimum I/O size 512 bytes
>     - sda: AHDI sda1 sda2
>     -sd 0:0:0:0: [sda] Attached SCSI disk
> 
> Reverting 99626085d036ec32 fixes the issue.

Yes. I can confirm this. I can recreate the issue, because I have a major
screw-up with that patch: the device_link_add() done in the new ->slave_alloc
operation for the scsi_host_template for the driver was in fact NOT set for
AHCI. So all my testing confirming that suspend/resume is OK was done *without*
that device link being created... That is embarrassing :)

The sata_rcar driver does get that slave_alloc method set through ATA_BASE_SHT()
-> ATA_SUBBASE_SHT(), and you get the problem. If I fix AHCI_SHT() macro to set
slave_alloc, I do get the issue as well: no scsi disk device is created after
the port scan. No clue why.

And I also now have no clue how suddenly the suspend/resume operations get
magically ordered correctly... I could recreate various issues before the
patches in for-6.7.

So going back to the beginning to sort things out. I probably "inadvertently"
fixed the issues with another change that has implications I am not seeing.

Will get back to you ASAP.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

-- 
Damien Le Moal
Western Digital Research

