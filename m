Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CDF0192B95
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2020 15:56:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727544AbgCYO4H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Mar 2020 10:56:07 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:39093 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727402AbgCYO4G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Mar 2020 10:56:06 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200325145603euoutp01845ee3caf7e884f75dbcf0d37f909424~-k9tFO9yr1693216932euoutp019
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2020 14:56:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200325145603euoutp01845ee3caf7e884f75dbcf0d37f909424~-k9tFO9yr1693216932euoutp019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1585148163;
        bh=VUFhQedQu32v6Pezr60u78vC4yFT/1zFtECxP+7+x4w=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=KLcgsWaV381f4WkYfzYNzcvuPvCCOnYEMCaB46QkKh9ZorBOhBUf1dESkuGxhkcOT
         Xk94EnsegN68OSvvYhhR2ClGPl4YsRF5xGzE/7ncW2YA7iHz8+vbHxy25m+GO5MDP8
         q3HT5BrhN1P/TZqW4JYt0ewVZ6K3iPlLYDOJRNQc=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200325145603eucas1p2812a499e6416d01d306b9701b7ef6924~-k9s1c5wV2745527455eucas1p2u;
        Wed, 25 Mar 2020 14:56:03 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 1D.3F.61286.3017B7E5; Wed, 25
        Mar 2020 14:56:03 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200325145603eucas1p20b2ce37f006c6c33ec88799450cddd4a~-k9siVPgP3126631266eucas1p2C;
        Wed, 25 Mar 2020 14:56:03 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200325145603eusmtrp2568742f9921ee04522fc156fca6f9d3a~-k9sYmV9z1169011690eusmtrp2M;
        Wed, 25 Mar 2020 14:56:03 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-11-5e7b7103e1f6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id C5.99.07950.3017B7E5; Wed, 25
        Mar 2020 14:56:03 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200325145602eusmtip23d7c704987152216e7ecaaed6006b959~-k9sD4rRi1692116921eusmtip2G;
        Wed, 25 Mar 2020 14:56:02 +0000 (GMT)
Subject: Re: [PATCH 04/40] libata: move ata_{port,link,dev}_dbg to standard
 dev_XXX() macros
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Hannes Reinecke <hare@suse.de>, Jens Axboe <axboe@kernel.dk>,
        Tejun Heo <tj@kernel.org>, linux-ide@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <49e11382-5fa7-f858-97de-feb1e6033f33@samsung.com>
Date:   Wed, 25 Mar 2020 15:56:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2003241414490.21582@ramsan.of.borg>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKKsWRmVeSWpSXmKPExsWy7djP87rMhdVxBmdWK1isvtvPZvHs1l4m
        iz2LJjFZHNvxiMli68t3TBa/lh9ldGDzuHy21GPTqk42j0OHOxg9Np+u9vi8SS6ANYrLJiU1
        J7MstUjfLoEro3PtHLaCK9oVV3btYWtgvK/cxcjJISFgIvF3z0mWLkYuDiGBFYwSK460s0M4
        Xxglds15ygbhfGaUaLu0nh2m5UvfaajEckaJF0tXMUM4bxklfvx4xghSJSwQJ9G99RyQzcEh
        IqArMecnE0gNs8BcoEnPu5hBatgErCQmtq8Cq+cVsJNY8XUfG4jNIqAqcfbfA7C4qECExKcH
        h1khagQlTs58wgJicwo4Stw73wkWZxYQl7j1ZD4ThC0v0bx1NthBEgLr2CVmvW9ihTjbReL1
        y21MELawxKvjW6DekZH4v3M+E1QDo8TfjhdQ3dsZJZZP/scGUWUtcefcLzaQd5gFNCXW79KH
        CDtKPPq/nwUkLCHAJ3HjrSDEEXwSk7ZNZ4YI80p0tAlBVKtJbFi2gQ1mbdfOlcwTGJVmIXlt
        FpJ3ZiF5ZxbC3gWMLKsYxVNLi3PTU4sN81LL9YoTc4tL89L1kvNzNzECE8/pf8c/7WD8einp
        EKMAB6MSD+8Gy+o4IdbEsuLK3EOMEhzMSiK8m1Mr4oR4UxIrq1KL8uOLSnNSiw8xSnOwKInz
        Gi96GSskkJ5YkpqdmlqQWgSTZeLglGpgbFS/JJPRJfTi5cwz6oLrv/+4a1sadDREV6/9DsNx
        Jq4LdX0Ped78KXu+WoznSFV12OlTRVN9pmS/2ZBtvI8nXt3xkdj27Sezf6x7vyryaZK5v/5J
        FpVamYgPhUvTdCRfzo2eE3v82d+TE8x/dk6O/L2ooCMrhG3en5OCOeI3GnObw1Yyb8nqVWIp
        zkg01GIuKk4EAHKfpjg4AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRmVeSWpSXmKPExsVy+t/xe7rMhdVxBl/uMlusvtvPZvHs1l4m
        iz2LJjFZHNvxiMli68t3TBa/lh9ldGDzuHy21GPTqk42j0OHOxg9Np+u9vi8SS6ANUrPpii/
        tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEvo3PtHLaCK9oV
        V3btYWtgvK/cxcjJISFgIvGl7zRbFyMXh5DAUkaJSb0fmLsYOYASMhLH15dB1AhL/LnWBVXz
        mlFi1tHvTCAJYYE4ie6t5xhB6kUEdCXm/GQCqWEWmMso0d3UygTR8IRR4nPvBmaQBjYBK4mJ
        7asYQWxeATuJFV/3sYHYLAKqEmf/PQCLiwpESBzeMQuqRlDi5MwnLCA2p4CjxL3znawgNrOA
        usSfeZeYIWxxiVtP5jNB2PISzVtnM09gFJqFpH0WkpZZSFpmIWlZwMiyilEktbQ4Nz232Eiv
        ODG3uDQvXS85P3cTIzDOth37uWUHY9e74EOMAhyMSjy8Gyyr44RYE8uKK3MPMUpwMCuJ8G5O
        rYgT4k1JrKxKLcqPLyrNSS0+xGgK9NxEZinR5HxgCsgriTc0NTS3sDQ0NzY3NrNQEuftEDgY
        IySQnliSmp2aWpBaBNPHxMEp1cC44GPMptnKNX3zVp92vFL0Va3Azi++c63gx7K7UrNmr0i7
        yTe7Z4Vhx6FNMpEtdQsW/HlTZvKkLy1yesCOydf/P2XYWfIm7DW/9KV7/u/tf7l9ltNpddm3
        WkRI/K1mlswpq+I6/Vl/nl35xMJn8qAw5Rb7xgsiG6dPfVxyYH9ruGSR+cfHnPNtlFiKMxIN
        tZiLihMB4TqG4MkCAAA=
X-CMS-MailID: 20200325145603eucas1p20b2ce37f006c6c33ec88799450cddd4a
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
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


On 3/24/20 2:26 PM, Geert Uytterhoeven wrote:
>     Hi Hannes,
> 
> On Tue, 3 Mar 2020, Hannes Reinecke wrote:
>> Use standard dev_{dbg,info,notice,warn,err} macros instead of the
>> hand-crafted printk helpers.
>>
>> Signed-off-by: Hannes Reinecke <hare@suse.de>
>> Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> 
> This is now commit ad9f23bd12e1d721 ("libata: move
> ata_{port,link,dev}_dbg to standard dev_XXX() macros") in
> linux-block/for-next.
> 
> This patch causes an intriguing change in boot messages, adding a space
> at the beginning of each printed line:
> 
>      scsi host0: sata_rcar
>     -ata1: SATA max UDMA/133 irq 117
>     + ata1: SATA max UDMA/133 irq 117
> 
>     -ata1: link resume succeeded after 1 retries
>     + link1: link resume succeeded after 1 retries
> 
>     -ata1: SATA link down (SStatus 0 SControl 300)
>     + link1: SATA link down (SStatus 0 SControl 300)
> 
> It turns out dev_driver_string(&link->tdev) returns an empty string, as
> its driver field is NULL, so __dev_printk() prints the empty string and
> the device name, separated by a space.
> 
> At first I thought this was a bug in rcar-sata, lacking some setup that
> was harmless before, but it turns out other drivers (e.g. pata-falcon)
> show the same issue:
> 
>      scsi host0: pata_falcon
>     -ata1: PATA max PIO4 cmd 0xfff00000 ctl 0xfff00039
>     + ata1: PATA max PIO4 cmd 0xfff00000 ctl 0xfff00039
> 
>     -ata1.01: NODEV after polling detection
>     -ata1.00: ATA-2: Sarge m68k, , max PIO2
>     -ata1.00: 2118816 sectors, multi 0: LBA
>     -ata1.00: configured for PIO
>     + dev1.0: ATA-2: Sarge m68k, , max PIO2
>     + dev1.0: 2118816 sectors, multi 0: LBA
>     + dev1.0: configured for PIO

I'm more worried about change of ATA devices and ATA links names
(unfortunately we cannot change the ones used in libata-transport.c 
as they are a part of ABI exposed through sysfs).

One way to improve the situation is to use transport classes names
for dev_printk() when no other means are available, please see/try
the patch below (compile tested only). It also includes fixup for
extra space issue (change to __dev_printk()).

We should probably consider reverting the commit if the approach
with using transport classes names is not feasible (we should not be
confusing users with names like "dev1.0" instead of "ata1.00" etc.,
sorry for not catching this earlier).

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics


---
 drivers/ata/libata-transport.c |    3 +++
 drivers/base/core.c            |   14 +++++++++-----
 include/linux/device.h         |    7 ++++++-
 3 files changed, 18 insertions(+), 6 deletions(-)

Index: b/drivers/ata/libata-transport.c
===================================================================
--- a/drivers/ata/libata-transport.c
+++ b/drivers/ata/libata-transport.c
@@ -289,6 +289,7 @@ int ata_tport_add(struct device *parent,
 	ata_host_get(ap->host);
 	dev->release = ata_tport_release;
 	dev_set_name(dev, "ata%d", ap->print_id);
+	dev->tclass = &ata_port_class;
 	transport_setup_device(dev);
 	ata_acpi_bind_port(ap);
 	error = device_add(dev);
@@ -418,6 +419,7 @@ int ata_tlink_add(struct ata_link *link)
 		dev_set_name(dev, "link%d", ap->print_id);
 	else
 		dev_set_name(dev, "link%d.%d", ap->print_id, link->pmp);
+	dev->tclass = &ata_link_class;
 
 	transport_setup_device(dev);
 
@@ -669,6 +671,7 @@ static int ata_tdev_add(struct ata_devic
 		dev_set_name(dev, "dev%d.%d", ap->print_id,ata_dev->devno);
 	else
 		dev_set_name(dev, "dev%d.%d.0", ap->print_id, link->pmp);
+	dev->tclass = &ata_dev_class;
 
 	transport_setup_device(dev);
 	ata_acpi_bind_dev(ata_dev);
Index: b/drivers/base/core.c
===================================================================
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1225,7 +1225,8 @@ const char *dev_driver_string(const stru
 	drv = READ_ONCE(dev->driver);
 	return drv ? drv->name :
 			(dev->bus ? dev->bus->name :
-			(dev->class ? dev->class->name : ""));
+			 (dev->class ? dev->class->name :
+			  (dev->tclass ? (&dev->tclass->class)->name : "")));
 }
 EXPORT_SYMBOL(dev_driver_string);
 
@@ -3784,10 +3785,13 @@ EXPORT_SYMBOL(dev_printk_emit);
 static void __dev_printk(const char *level, const struct device *dev,
 			struct va_format *vaf)
 {
-	if (dev)
-		dev_printk_emit(level[1] - '0', dev, "%s %s: %pV",
-				dev_driver_string(dev), dev_name(dev), vaf);
-	else
+	if (dev) {
+		const char *drv_str = dev_driver_string(dev);
+
+		dev_printk_emit(level[1] - '0', dev, "%s%s%s: %pV",
+				drv_str, strcmp(drv_str, "") ? " " : "",
+				dev_name(dev), vaf);
+	} else
 		printk("%s(NULL device *): %pV", level, vaf);
 }
 
Index: b/include/linux/device.h
===================================================================
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -29,6 +29,7 @@
 #include <linux/device/bus.h>
 #include <linux/device/class.h>
 #include <linux/device/driver.h>
+#include <linux/transport_class.h>
 #include <asm/device.h>
 
 struct device;
@@ -608,7 +609,11 @@ struct device {
 	spinlock_t		devres_lock;
 	struct list_head	devres_head;
 
-	struct class		*class;
+	union {
+		struct class		*class;
+		struct transport_class	*tclass;
+	};
+
 	const struct attribute_group **groups;	/* optional groups */
 
 	void	(*release)(struct device *dev);
