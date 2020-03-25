Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22C0D192EAF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2020 17:54:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727275AbgCYQyN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Mar 2020 12:54:13 -0400
Received: from mx2.suse.de ([195.135.220.15]:46030 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726102AbgCYQyN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Mar 2020 12:54:13 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 8AAE9AC19;
        Wed, 25 Mar 2020 16:54:10 +0000 (UTC)
Subject: Re: [PATCH 04/40] libata: move ata_{port,link,dev}_dbg to standard
 dev_XXX() macros
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>,
        linux-ide@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20200303093813.18523-1-hare@suse.de>
 <20200303093813.18523-5-hare@suse.de>
 <CGME20200324132651eucas1p2e1570d1edf07101d29addd27df69d0e7@eucas1p2.samsung.com>
 <alpine.DEB.2.21.2003241414490.21582@ramsan.of.borg>
 <49e11382-5fa7-f858-97de-feb1e6033f33@samsung.com>
 <CAMuHMdVMLBOOau9YAGo5WoQUwdU7nKZY2Yy_YEQqbypKojcczg@mail.gmail.com>
 <787989d3-b969-df37-3da2-f4405476bd55@samsung.com>
From:   Hannes Reinecke <hare@suse.de>
Message-ID: <0dc64715-b3c1-c208-c032-6f1e10715757@suse.de>
Date:   Wed, 25 Mar 2020 17:54:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <787989d3-b969-df37-3da2-f4405476bd55@samsung.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 3/25/20 4:45 PM, Bartlomiej Zolnierkiewicz wrote:
> 
> On 3/25/20 4:34 PM, Geert Uytterhoeven wrote:
>> Hi Bartl,
>>
>> On Wed, Mar 25, 2020 at 3:56 PM Bartlomiej Zolnierkiewicz
>> <b.zolnierkie@samsung.com> wrote:
>>> On 3/24/20 2:26 PM, Geert Uytterhoeven wrote:
>>>> On Tue, 3 Mar 2020, Hannes Reinecke wrote:
>>>>> Use standard dev_{dbg,info,notice,warn,err} macros instead of the
>>>>> hand-crafted printk helpers.
>>>>>
>>>>> Signed-off-by: Hannes Reinecke <hare@suse.de>
>>>>> Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>>>>
>>>> This is now commit ad9f23bd12e1d721 ("libata: move
>>>> ata_{port,link,dev}_dbg to standard dev_XXX() macros") in
>>>> linux-block/for-next.
>>>>
>>>> This patch causes an intriguing change in boot messages, adding a space
>>>> at the beginning of each printed line:
>>>>
>>>>       scsi host0: sata_rcar
>>>>      -ata1: SATA max UDMA/133 irq 117
>>>>      + ata1: SATA max UDMA/133 irq 117
>>>>
>>>>      -ata1: link resume succeeded after 1 retries
>>>>      + link1: link resume succeeded after 1 retries
>>>>
>>>>      -ata1: SATA link down (SStatus 0 SControl 300)
>>>>      + link1: SATA link down (SStatus 0 SControl 300)
>>>>
>>>> It turns out dev_driver_string(&link->tdev) returns an empty string, as
>>>> its driver field is NULL, so __dev_printk() prints the empty string and
>>>> the device name, separated by a space.
>>>>
>>>> At first I thought this was a bug in rcar-sata, lacking some setup that
>>>> was harmless before, but it turns out other drivers (e.g. pata-falcon)
>>>> show the same issue:
>>>>
>>>>       scsi host0: pata_falcon
>>>>      -ata1: PATA max PIO4 cmd 0xfff00000 ctl 0xfff00039
>>>>      + ata1: PATA max PIO4 cmd 0xfff00000 ctl 0xfff00039
>>>>
>>>>      -ata1.01: NODEV after polling detection
>>>>      -ata1.00: ATA-2: Sarge m68k, , max PIO2
>>>>      -ata1.00: 2118816 sectors, multi 0: LBA
>>>>      -ata1.00: configured for PIO
>>>>      + dev1.0: ATA-2: Sarge m68k, , max PIO2
>>>>      + dev1.0: 2118816 sectors, multi 0: LBA
>>>>      + dev1.0: configured for PIO
>>>
>>> I'm more worried about change of ATA devices and ATA links names
>>> (unfortunately we cannot change the ones used in libata-transport.c
>>> as they are a part of ABI exposed through sysfs).
>>
>> True.
>>
>>> One way to improve the situation is to use transport classes names
>>> for dev_printk() when no other means are available, please see/try
>>> the patch below (compile tested only). It also includes fixup for
>>> extra space issue (change to __dev_printk()).
>>
>> Thanks for the suggestion!
>>
Well, the space can (should?) be fixed with a simple patch to 
__dev_printk() but just checking if 'dev_driver_string()' returns a 
value or not:

diff --git a/drivers/base/core.c b/drivers/base/core.c
index dbb0f9130f42..a84f170a1a1f 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -3635,10 +3635,15 @@ EXPORT_SYMBOL(dev_printk_emit);
  static void __dev_printk(const char *level, const struct device *dev,
                         struct va_format *vaf)
  {
-       if (dev)
-               dev_printk_emit(level[1] - '0', dev, "%s %s: %pV",
-                               dev_driver_string(dev), dev_name(dev), vaf);
-       else
+       if (dev) {
+               if (dev_string_string(dev))
+                       dev_printk_emit(level[1] - '0', dev, "%s %s: %pV",
+                                       dev_driver_string(dev), 
dev_name(dev),
+                                       vaf);
+               else
+                       dev_printk_emit(level[1] - '0', dev, "%s: %pV",
+                                       dev_name(dev), vaf);
+       } else
                 printk("%s(NULL device *): %pV", level, vaf);
  }

which actually makes sense on its own.
As for the name change, yes, I'm not that happy with it, either.

I'll see if we can do some transport class magic such that the
names do not change.

(And no-one is to mention 'cake' and 'eat it' ...)

Cheers,

Hannes
-- 
Dr. Hannes Reinecke            Teamlead Storage & Networking
hare@suse.de                               +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer
