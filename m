Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71C73192D2A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2020 16:45:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727386AbgCYPpY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Mar 2020 11:45:24 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:47979 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727488AbgCYPpY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Mar 2020 11:45:24 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200325154522euoutp0218097ae1fc561d9945ab42070b0b31e3~-loxBg4xN1736117361euoutp02b
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2020 15:45:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200325154522euoutp0218097ae1fc561d9945ab42070b0b31e3~-loxBg4xN1736117361euoutp02b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1585151123;
        bh=sIv1WoDiv7/UvS7VpN4mBqOLTms/HS05UTcywIaNFNg=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=BmnqIQpt2bjscdHWp2atrho94645/iiAY675eQZsTWpwaEfi0+MAHjD8D6HYNce0f
         K8WCmuSK7Qe+dE6sCRhljj7Nku6QL710aQdXIoxslPiHV3X0rcnIqaRLNpw/8kPikZ
         7c5A32pbFEqeSpHL3BSPxu77HUncgSR0YCAel5gU=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200325154522eucas1p2bbbff4fb38ccaa10a4354ba35324b703~-lowvY-Gw2902729027eucas1p26;
        Wed, 25 Mar 2020 15:45:22 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id EF.56.61286.29C7B7E5; Wed, 25
        Mar 2020 15:45:22 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200325154522eucas1p1cd06922826b5ceafc772b7f047a18abc~-lowYACN71522715227eucas1p1F;
        Wed, 25 Mar 2020 15:45:22 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200325154522eusmtrp1351f884fb0fa614f79a16e168cc63300~-lowXbvCe2573025730eusmtrp15;
        Wed, 25 Mar 2020 15:45:22 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-d2-5e7b7c922dd8
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 1E.40.07950.29C7B7E5; Wed, 25
        Mar 2020 15:45:22 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200325154521eusmtip10cabe83b3572be6a998218f12d687e08~-lov9zk7F3186531865eusmtip1K;
        Wed, 25 Mar 2020 15:45:21 +0000 (GMT)
Subject: Re: [PATCH 04/40] libata: move ata_{port,link,dev}_dbg to standard
 dev_XXX() macros
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Hannes Reinecke <hare@suse.de>, Jens Axboe <axboe@kernel.dk>,
        Tejun Heo <tj@kernel.org>, linux-ide@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <787989d3-b969-df37-3da2-f4405476bd55@samsung.com>
Date:   Wed, 25 Mar 2020 16:45:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVMLBOOau9YAGo5WoQUwdU7nKZY2Yy_YEQqbypKojcczg@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfSyUcRzf73kej8fN2c/R7jsa8ygtG7KsXWlWmz9uvWyxSsuiwxMWh3uc
        95q31YXtisU6elOoUzrvl0ijmFnmZVmRKVnIrhX5g4XcPSz/fb6fl9/3+9l+DCmpsnJiYpXJ
        nEqpiGNpEdXSszzgVZyVGbbv60MPWe2ElpZ9H+sgZO2VxYSsxzhFyJrnfhKylZp36AgtH3mv
        ljfob9Dyrm4Nkjf2Z8oXG1xOWZ0XHY7i4mJTOJVPwEVRzMqaiU7M904r0Y+T2eg3W4BsGMB+
        8PbvIFGARIwEP0GgHZ6hheEPgtHsT5vKIoL6vnlqK/JtNpcShBoEkx/akTCYEEyszBNmlwMO
        g8LmgQ2BYRyxF1QsW14i8XMEukfPSLOHxofg1nU9MmMxDoCcjhkLpvBuaB7RWjw78DlY+NJt
        JXjsoe/OtOUKGxwEIyPVFkxiKYxN3ycE7AqtpgrSvAyw3hpq8g2bZwfCkr6WFLAD/Ohtshbw
        TugvKaKEQB2CVc3sZroVQU3JGi24/OHzwAptrkPivfCizUegj8LUeidlpgHbwUeTvXCEHRS3
        lJECLQbNNYng9gBDtYHeWlvw8il5E7G6bdV02+rottXR/d/7AFF6JOXUfHw0x/squVRvXhHP
        q5XR3pEJ8Q1o4/P0r/UuGNHScEQXwgxibcWGg5lhEitFCp8e34WAIVlHcSOXFiYRRynSMzhV
        QrhKHcfxXciZoVipeH/l3AUJjlYkc5c5LpFTbakEY+OUjcLPehpz+tgJedzVpqxJXehptSYw
        aaj0dSdbaNTuynPY4z/uZ5t3uyW3/4Tbyc7yV8PlZzS892Cq33GvK+6l08qkjnvskNvdwXJt
        9ZvOX/XSY0WVq4Xrde6RIRmXDC66iGqTbFIbWhUcHDQ859sU8vhAY5lrm7NrwGhhqr3NYBbD
        UnyMwteTVPGKfxkCJsU4AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRmVeSWpSXmKPExsVy+t/xu7qTaqrjDK4s4bNYfbefzeLZrb1M
        FnsWTWKyOLbjEZPF1pfvmCx+LT/K6MDmcflsqcemVZ1sHocOdzB6bD5d7fF5k1wAa5SeTVF+
        aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexq9/b9kKWvQq
        Jq+6zdzA+FGpi5GTQ0LAROLxiyaWLkYuDiGBpYwSWyd8Zeti5ABKyEgcX18GUSMs8edaFxtE
        zWtGiS0HnzCCJIQF4iS6t55jBKkXEdCVmPOTCaSGWWAto8SKy1uhGh4wSVxZuYcNpIFNwEpi
        YvsqsGZeATuJxr3PwWwWAVWJrZf7mUFsUYEIicM7ZkHVCEqcnPmEBcTmFAiUuHx5GZjNLKAu
        8WfeJWYIW1zi1pP5TBC2vMT2t3OYJzAKzULSPgtJyywkLbOQtCxgZFnFKJJaWpybnltspFec
        mFtcmpeul5yfu4kRGGfbjv3csoOx613wIUYBDkYlHt4NltVxQqyJZcWVuYcYJTiYlUR4N6dW
        xAnxpiRWVqUW5ccXleakFh9iNAV6biKzlGhyPjAF5JXEG5oamltYGpobmxubWSiJ83YIHIwR
        EkhPLEnNTk0tSC2C6WPi4JRqYHRwqJvN9/rUwq38E8IS3tqrZiwznM/vVzVha0amyw+xttp/
        8dl2hk/ebb+3v/GjeXh/89v3AZethffK/k+vUdsxv6Xz0f8LspMnTrCYLqB1/uPkw4U/l7oL
        Fll/929WN78Tx+jszHJPfmade4cTC0dGv4HJ3qebb4gaRyrcssk/2L1zzv+sCUosxRmJhlrM
        RcWJAFjDW1DJAgAA
X-CMS-MailID: 20200325154522eucas1p1cd06922826b5ceafc772b7f047a18abc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200324132651eucas1p2e1570d1edf07101d29addd27df69d0e7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200324132651eucas1p2e1570d1edf07101d29addd27df69d0e7
References: <20200303093813.18523-1-hare@suse.de>
        <20200303093813.18523-5-hare@suse.de>
        <CGME20200324132651eucas1p2e1570d1edf07101d29addd27df69d0e7@eucas1p2.samsung.com>
        <alpine.DEB.2.21.2003241414490.21582@ramsan.of.borg>
        <49e11382-5fa7-f858-97de-feb1e6033f33@samsung.com>
        <CAMuHMdVMLBOOau9YAGo5WoQUwdU7nKZY2Yy_YEQqbypKojcczg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


On 3/25/20 4:34 PM, Geert Uytterhoeven wrote:
> Hi Bartl,
> 
> On Wed, Mar 25, 2020 at 3:56 PM Bartlomiej Zolnierkiewicz
> <b.zolnierkie@samsung.com> wrote:
>> On 3/24/20 2:26 PM, Geert Uytterhoeven wrote:
>>> On Tue, 3 Mar 2020, Hannes Reinecke wrote:
>>>> Use standard dev_{dbg,info,notice,warn,err} macros instead of the
>>>> hand-crafted printk helpers.
>>>>
>>>> Signed-off-by: Hannes Reinecke <hare@suse.de>
>>>> Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>>>
>>> This is now commit ad9f23bd12e1d721 ("libata: move
>>> ata_{port,link,dev}_dbg to standard dev_XXX() macros") in
>>> linux-block/for-next.
>>>
>>> This patch causes an intriguing change in boot messages, adding a space
>>> at the beginning of each printed line:
>>>
>>>      scsi host0: sata_rcar
>>>     -ata1: SATA max UDMA/133 irq 117
>>>     + ata1: SATA max UDMA/133 irq 117
>>>
>>>     -ata1: link resume succeeded after 1 retries
>>>     + link1: link resume succeeded after 1 retries
>>>
>>>     -ata1: SATA link down (SStatus 0 SControl 300)
>>>     + link1: SATA link down (SStatus 0 SControl 300)
>>>
>>> It turns out dev_driver_string(&link->tdev) returns an empty string, as
>>> its driver field is NULL, so __dev_printk() prints the empty string and
>>> the device name, separated by a space.
>>>
>>> At first I thought this was a bug in rcar-sata, lacking some setup that
>>> was harmless before, but it turns out other drivers (e.g. pata-falcon)
>>> show the same issue:
>>>
>>>      scsi host0: pata_falcon
>>>     -ata1: PATA max PIO4 cmd 0xfff00000 ctl 0xfff00039
>>>     + ata1: PATA max PIO4 cmd 0xfff00000 ctl 0xfff00039
>>>
>>>     -ata1.01: NODEV after polling detection
>>>     -ata1.00: ATA-2: Sarge m68k, , max PIO2
>>>     -ata1.00: 2118816 sectors, multi 0: LBA
>>>     -ata1.00: configured for PIO
>>>     + dev1.0: ATA-2: Sarge m68k, , max PIO2
>>>     + dev1.0: 2118816 sectors, multi 0: LBA
>>>     + dev1.0: configured for PIO
>>
>> I'm more worried about change of ATA devices and ATA links names
>> (unfortunately we cannot change the ones used in libata-transport.c
>> as they are a part of ABI exposed through sysfs).
> 
> True.
> 
>> One way to improve the situation is to use transport classes names
>> for dev_printk() when no other means are available, please see/try
>> the patch below (compile tested only). It also includes fixup for
>> extra space issue (change to __dev_printk()).
> 
> Thanks for the suggestion!
> 
>> --- a/drivers/base/core.c
>> +++ b/drivers/base/core.c
>> @@ -1225,7 +1225,8 @@ const char *dev_driver_string(const stru
>>         drv = READ_ONCE(dev->driver);
>>         return drv ? drv->name :
>>                         (dev->bus ? dev->bus->name :
>> -                       (dev->class ? dev->class->name : ""));
>> +                        (dev->class ? dev->class->name :
>> +                         (dev->tclass ? (&dev->tclass->class)->name : "")));
> 
> Aren't "dev->class->name" and "(&dev->tclass->class)->name"
> exactly the same, as the first member of struct transport_class is
> a struct class object?

struct class is embedded in struct transport_class but it doesn't
have to be the same class as pointed by dev->class (for ATA dev->class
should be NULL).

> (If they're not the same, and I need more coffee, I'm still afraid this is
>  too fragile.  Then there is no guarantee the pointer points to a real
> transport_class object, so this might cause a crash.)

I see, we can't do unnamed union optimization in <linux/device.h> but
otherwise it should be OK, no?

>> --- a/drivers/ata/libata-transport.c
>> +++ b/drivers/ata/libata-transport.c
>> @@ -289,6 +289,7 @@ int ata_tport_add(struct device *parent,
>>         ata_host_get(ap->host);
>>         dev->release = ata_tport_release;
>>         dev_set_name(dev, "ata%d", ap->print_id);
>> +       dev->tclass = &ata_port_class;
> 
> Can't you just do dev->class = &ata_port_class.class...
> 
>>         transport_setup_device(dev);
>>         ata_acpi_bind_port(ap);
>>         error = device_add(dev);
>> @@ -418,6 +419,7 @@ int ata_tlink_add(struct ata_link *link)
>>                 dev_set_name(dev, "link%d", ap->print_id);
>>         else
>>                 dev_set_name(dev, "link%d.%d", ap->print_id, link->pmp);
>> +       dev->tclass = &ata_link_class;
> 
> ... and dev->class = &ata_link_class.class...
> 
>>
>>         transport_setup_device(dev);
>>
>> @@ -669,6 +671,7 @@ static int ata_tdev_add(struct ata_devic
>>                 dev_set_name(dev, "dev%d.%d", ap->print_id,ata_dev->devno);
>>         else
>>                 dev_set_name(dev, "dev%d.%d.0", ap->print_id, link->pmp);
>> +       dev->tclass = &ata_dev_class;
> 
> ... and dev->class = &ata_dev_class.class...
> 
>> --- a/include/linux/device.h
>> +++ b/include/linux/device.h
>> @@ -29,6 +29,7 @@
>>  #include <linux/device/bus.h>
>>  #include <linux/device/class.h>
>>  #include <linux/device/driver.h>
>> +#include <linux/transport_class.h>
>>  #include <asm/device.h>
>>
>>  struct device;
>> @@ -608,7 +609,11 @@ struct device {
>>         spinlock_t              devres_lock;
>>         struct list_head        devres_head;
>>
>> -       struct class            *class;
>> +       union {
>> +               struct class            *class;
>> +               struct transport_class  *tclass;
>> +       };
>> +
>>         const struct attribute_group **groups;  /* optional groups */
>>
>>         void    (*release)(struct device *dev);
> 
> ... and drop all changes to device.h?

That would have unintended consequences that we don't want
(driver core code checks dev->class existence not only in
dev_driver_string())..

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
