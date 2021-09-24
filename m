Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 646804171EB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Sep 2021 14:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244404AbhIXMgb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Sep 2021 08:36:31 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:51811 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245237AbhIXMga (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 08:36:30 -0400
IronPort-SDR: uU89ZFB6Ed7Q5THICXc5nycibMV7v+B0X7hQZT8znO+97q08Y9hFmX+82pZaky/jET5QBNsYdc
 7TezG07UuxgQmsPTuZ2iR1rwSBso0dltigtB8/ihyenlemPHeltDDht57bdkxqZ0J45FPFdDBK
 8N8EiXOx0ChMMbrFlDJP42qycVdUll/0IVHifTWd2RjDMWMqWuFf3wWcJuq5HvyYBChzsMR51z
 CIXM+y71LbGuzS4BKz9EVWwm/NJJJCEBKay9yPBE9thLqf1lbM2ax52gHn834kt5CNh9P0SyHZ
 I5wku0RFjsyFoWyB9EOJmlP6
X-IronPort-AV: E=Sophos;i="5.85,319,1624348800"; 
   d="scan'208";a="66253282"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 24 Sep 2021 04:34:56 -0800
IronPort-SDR: xJHQK2n3h7tqvyXc7nOmtGNylGyAFjKdbX5O88VXREyZ7l1k5j0m/j/NZ01MKOFRLJ1FhjenPV
 KjBnYCCECG8mEUfphDr9+XsvOnFgeHaD6sQaehBZcLj1PhswpNEUDl07F3kydewKB688R+CJdv
 hASLtScXr/ce6aciQoBHrOS601zmrYkGO74orEvoG3FReKN0ab4ihXi6AlbNJSv2q6lYOuxt+u
 8ISj2Y2x6QW7qZn7WqUAooYxLfw88nJH8wVeLwzWRZib9mo8yjQiiWIVOgmQcp16XbEXJ+07pN
 CkQ=
From:   Andrew Gabbasov <andrew_gabbasov@mentor.com>
To:     'Krzysztof Kozlowski' <krzysztof.kozlowski@canonical.com>,
        <linux-renesas-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20210922184830.29147-1-andrew_gabbasov@mentor.com> <c6de6ec0-fd06-14bc-c483-52a2d0a4590a@canonical.com>
In-Reply-To: <c6de6ec0-fd06-14bc-c483-52a2d0a4590a@canonical.com>
Subject: RE: [PATCH] memory: renesas-rpc-if: Avoid unaligned bus access for HyperFlash
Date:   Fri, 24 Sep 2021 15:34:42 +0300
Organization: Mentor Graphics Corporation
Message-ID: <000001d7b140$91e0a180$b5a1e480$@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHXsTUXhFdr88sfGEGUtgyCIuCyuauzFHzQ
Content-Language: en-us
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-06.mgc.mentorg.com (139.181.222.6) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Sent: Friday, September 24, 2021 2:13 PM
> To: Gabbasov, Andrew <Andrew_Gabbasov@mentor.com>; linux-renesas-soc@vger.kernel.org; linux-
> kernel@vger.kernel.org; Sergei Shtylyov <sergei.shtylyov@gmail.com>; Geert Uytterhoeven <geert+renesas@glider.be>
> Subject: Re: [PATCH] memory: renesas-rpc-if: Avoid unaligned bus access for HyperFlash
> 
> On 22/09/2021 20:48, Andrew Gabbasov wrote:
> > HyperFlash devices in Renesas SoCs use 2-bytes addressing, according
> > to HW manual paragraph 62.3.3 (which officially describes Serial Flash
> > access, but seems to be applicable to HyperFlash too). And 1-byte bus
> > read operations to 2-bytes unaligned addresses in external address space
> > read mode work incorrectly (returns the other byte from the same word).
> >
> > Function memcpy_fromio(), used by the driver to read data from the bus,
> > in ARM64 architecture (to which Renesas cores belong) uses 8-bytes
> > bus accesses for appropriate aligned addresses, and 1-bytes accesses
> > for other addresses. This results in incorrect data read from HyperFlash
> > in unaligned cases.
> >
> > This issue can be reproduced using something like the following commands
> > (where mtd1 is a parition on Hyperflash storage, defined properly
> > in a device tree):
> >
> > [Correct fragment, read from Hyperflash]
> >
> >     root@rcar-gen3:~# dd if=/dev/mtd1 of=/tmp/zz bs=32 count=1
> >     1+0 records in
> >     1+0 records out
> >     root@rcar-gen3:~# hexdump -C /tmp/zz
> >     00000000  f4 03 00 aa f5 03 01 aa  f6 03 02 aa f7 03 03 aa  |................|
> >     00000010  00 00 80 d2 40 20 18 d5  00 06 81 d2 a0 18 a6 f2  |....@ ..........|
> >     00000020
> >
> > [Incorrect read of the same fragment: see the difference at offsets 8-11]
> >
> >     root@rcar-gen3:~# dd if=/dev/mtd1 of=/tmp/zz bs=12 count=1
> >     1+0 records in
> >     1+0 records out
> >     root@rcar-gen3:~# hexdump -C /tmp/zz
> >     00000000  f4 03 00 aa f5 03 01 aa  03 03 aa aa              |............|
> >     0000000c
> >
> > Fix this issue by creating a local replacement of the copying function,
> > that performs only properly aligned bus accesses, and is used for reading
> > from HyperFlash.
> >
> > Fixes: ca7d8b980b67f ("memory: add Renesas RPC-IF driver")
> > Signed-off-by: Andrew Gabbasov <andrew_gabbasov@mentor.com>
> > ---
> >  drivers/memory/renesas-rpc-if.c | 47 ++++++++++++++++++++++++++++++++-
> >  1 file changed, 46 insertions(+), 1 deletion(-)
> >
> 
> Thanks for the patch.
> 
> Please rebase and test on a recent Linux kernel. This looks like work on
> something slightly older or stable kernel, since you Cc not the address
> from maintainers.

The patch is already against the recent kernel versions.
Sorry for using wrong address, I have probably taken it from some
older mailing lists.

> The patch came slightly after Wolfram's and I wonder whether you hit
> similar issue:
> https://lore.kernel.org/lkml/20210922091007.5516-1-wsa+renesas@sang-engineering.com/

If I correctly understand, the underlying issue looks similar (improperly aligned
memory/register accesses), but the affected areas are different, even non-intersecting:
Wolfram fixes register access, affecting manual mode reads/writes, having problems
with QSPI devices, while my fix is related to external address space reads (mapped
memory access) with Hyperflash devices.

Thanks.

Best regards,
Andrew

