Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A459018D74
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 May 2019 17:57:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726611AbfEIP5g (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 May 2019 11:57:36 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:53826 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbfEIP5g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 May 2019 11:57:36 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x49FvGPP027849;
        Thu, 9 May 2019 10:57:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1557417436;
        bh=/nK4v/rXZbjA+CJzACVkSB/BxokCaylpclLxpBzH4BY=;
        h=From:Subject:To:CC:References:Date:In-Reply-To;
        b=f8IIe6G9nEO2+h/tijYerw8stbv05TIhl8lyZwJw/79Qarm5YJWmeHElQTYNonCHB
         Gm4fkKTaGBp81JCbNWVRBuR8LsemS0Dpd0fEXpzX00yHU+X1wSpnS+LKgEyeczzwtk
         /b23ldjLKv31j9fjiQCmQsHiWPFD/XkKHA8nfOQg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x49FvGeG019441
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 9 May 2019 10:57:16 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 9 May
 2019 10:57:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 9 May 2019 10:57:16 -0500
Received: from [172.22.216.122] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x49FvEaF109386;
        Thu, 9 May 2019 10:57:14 -0500
From:   Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
To:     <Tudor.Ambarus@microchip.com>, <geert@linux-m68k.org>
CC:     <linux-renesas-soc@vger.kernel.org>, <jonas@norrbonn.se>,
        <linux-mtd@lists.infradead.org>, <marek.vasut+renesas@gmail.com>
References: <20190320071605.4289-1-jonas@norrbonn.se>
 <CAMuHMdVH85iFJngkU6W61ybwR2j3YQ7=cugPxgC57hUgBOc5KA@mail.gmail.com>
 <1f33e1e5-d7bf-76a0-c4d3-ecbc35fbfd4f@microchip.com>
 <CAMuHMdU83vLeVSqMZuJwR4yd382mau-OE1saMAOC2+6HodsHvg@mail.gmail.com>
 <fac5fa6d-95e9-cfb0-4d5a-6b16d4470190@norrbonn.se>
 <CAMuHMdUEdNr5rgCdaGAFJ-WK4oL2DC419smk+QYOJ7qJvkWA8A@mail.gmail.com>
 <a9ad3641-1eb8-782c-9dfd-0db41256d3f1@microchip.com>
 <ad49240c-2073-4045-c11c-fb6bad231321@microchip.com>
 <CAMuHMdVcp--qRo3m8kSQ=++Vx33kvxBWEHFVHfh-j=pq1x-GPQ@mail.gmail.com>
 <898831ba-b8bb-7c2b-e623-2e6c26da91b5@microchip.com>
 <CAMuHMdXFwFAPzYPKqj+FZgSq01VAD0izS3ELyOg1YBwTAQ_QkQ@mail.gmail.com>
 <8b004a57-0fd9-04fe-d031-1d98d890f826@microchip.com>
 <CAMuHMdXghAWmNJLUq_uOUVPrrNTAcFq=QqCGjLU51FchvOu3=g@mail.gmail.com>
 <6a8d9a6c-5281-88d2-51ae-e2afad847a8f@microchip.com>
 <CAMuHMdVBguF4ZQHTqwr6GAJKuUcvBGu-5p0GeYRmZ3dG8tXa2g@mail.gmail.com>
 <7649e84f-debb-cec8-d6d6-d33d9dce4259@microchip.com>
Message-ID: <1d2929b4-3228-437a-b2d7-2126e2e47880@ti.com>
Date:   Thu, 9 May 2019 21:27:13 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <7649e84f-debb-cec8-d6d6-d33d9dce4259@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tudor,

On 09/05/19 4:01 PM, Tudor.Ambarus@microchip.com wrote:
[...]
>>
>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>
>>> +static int spi_nor_clear_block_protection(struct spi_nor *nor)
>>> +{
>>> +       int ret;
>>> +       u8 sr, cr, sr_cr[2] = {0};
>>> +       u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
>>> +
>>> +       ret = read_cr(nor);
>>> +       dev_dbg(nor->dev, "CR = %08x\n", ret);
>>> +        if (ret < 0) {
>>> +                dev_err(nor->dev, "error while reading CR\n");
>>> +               return ret;
>>> +       }
>>> +       cr = ret;
>>> +
>>> +       if (cr & CR_QUAD_EN_SPAN) {
>>> +               /* disable quad if already set, must do it with 16-bit WRR */
>>> +               ret = write_sr_cr(nor, sr_cr);
>>> +               if (ret) {
>>> +                       dev_err(nor->dev, "error diasbling quad mode\n");
>>
>> disabling
>>
>>> +                       return ret;
>>> +               }
>>
>> renesas_spi e6b10000.spi: DMA available
>> renesas_spi e6b10000.spi: registered master spi0
>> spi spi0.0: setup mode 3, 8 bits/w, 30000000 Hz max --> 0
>> m25p80 spi0.0: bfpt.dwords[1] = ffffffff
>> m25p80 spi0.0: bfpt.dwords[2] = ffffffff
>> m25p80 spi0.0: bfpt.dwords[3] = ffffffff
>> m25p80 spi0.0: bfpt.dwords[4] = ffffffff
>> m25p80 spi0.0: bfpt.dwords[5] = ffffffff
>> m25p80 spi0.0: bfpt.dwords[6] = ffffffff
>> m25p80 spi0.0: bfpt.dwords[7] = ffffffff
>> m25p80 spi0.0: bfpt.dwords[8] = ffffffff
>> m25p80 spi0.0: bfpt.dwords[9] = ffffffff
>> m25p80 spi0.0: bfpt.dwords[10] = 00000000
>> m25p80 spi0.0: bfpt.dwords[11] = 00000000
>> m25p80 spi0.0: bfpt.dwords[12] = 00000000
>> m25p80 spi0.0: bfpt.dwords[13] = 00000000
>> m25p80 spi0.0: bfpt.dwords[14] = 00000000
>> m25p80 spi0.0: bfpt.dwords[15] = 00000000
>> m25p80 spi0.0: bfpt.dwords[16] = 00000000
>> m25p80 spi0.0: failed to parse BFPT: err = -22
>> m25p80 spi0.0: spi_nor_init_params sfdp parse failed, ret =-22
>> m25p80 spi0.0: SR and CR before quad_enable:
>> m25p80 spi0.0: SR = 00000000
>> m25p80 spi0.0: CR = 00000002
>> m25p80 spi0.0: SR and CR after quad_enable:
>> m25p80 spi0.0: SR = 00000000
>> m25p80 spi0.0: CR = 00000002
>> m25p80 spi0.0: s25fl512s (65536 Kbytes)
>> m25p80 spi0.0: mtd .name = spi0.0, .size = 0x4000000 (64MiB),
>> .erasesize = 0x00040000 (256KiB) .numeraseregions = 0
>> 3 fixed-partitions partitions found on MTD device spi0.0
>> Creating 3 MTD partitions on "spi0.0":
>> 0x000000000000-0x000000080000 : "loader"
>> 0x000000080000-0x000000600000 : "user"
>> 0x000000600000-0x000004000000 : "flash"
>> renesas_spi e6b10000.spi: registered child spi0.0
>> renesas_spi e6b10000.spi: probed
>>
>> And /dev/mtd0 reading works fine.
>> Thanks!
>>
> 
> I'm glad that it worked, thanks for the help. I'll do a patch to fix this case,
> but probably it will qualify for -next. Is -next ok for you?

I think this fix should be forwarded to v5.2-rc1 (or -rc2 at least) as
patch in question ("spi-nor: s25fl512s supports region locking") is part
of SPI NOR pull request for v5.2-rc1 and therefore would end up in
mainline v5.2-rc1 during the merge window.

-- 
Regards
Vignesh
