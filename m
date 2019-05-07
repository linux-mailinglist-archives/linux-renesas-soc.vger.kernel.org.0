Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0137162A4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 13:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbfEGLOC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 May 2019 07:14:02 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:46368 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725844AbfEGLOB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 May 2019 07:14:01 -0400
Received: by mail-lj1-f194.google.com with SMTP id h21so13896178ljk.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 May 2019 04:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fr3vVn+oweMugLS8/jeaJuQnWyQkFbMOMxTckpCBdBk=;
        b=M+0buRHQVu6DimA19bSbeWMveoG1+aO/R/TFPANMunLbaA+fZWyo4H643NoWjoyTso
         Ckn3JKbpl5aBmaN8EDg/YhCGwxMl1EMB7GtW4hpaXU4OyEROXiwgaCAE1d0NXOm8mY8P
         UTdgPeQVgtlkCUSz/awJhqdrAO7jmmrfI67fvMBKeVbzKxKX89LSkBAXBy8pJCiPVi2c
         KcAD7DJU5JZIZBpx8PLzLZroeSgc1V4NkKSwRBRbwX/dltOaYoXIvXtdDUTZDI3B01Lm
         5P5eNqIOI9W0584Tx+2VvojIcWtC+hFZUA1iHm4XXZ97MD/MYS9gTFH+W5gg31ZdbaIo
         MgHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fr3vVn+oweMugLS8/jeaJuQnWyQkFbMOMxTckpCBdBk=;
        b=tgZ+OZEjRGn+H+ov32L7AMNC1UX6m/mxYksv1svbZZOVe0a+gjfeKGLL2sR6Ali5OL
         iWIaQ0cPMHjSNMjMJMxSAhDt4liIVLI6w0BzQaWYofmOCf27mKPqDku5hyb4vfpOeCoZ
         edHUFQB3LIoXL6PcAWsx6YmY04RGVy/6UDUZRq//WVXZmdx9LLzb4YiI3eabcK5CB9bK
         JKZeTAA3YLbFefTs3Dhfu6qBCtV/vHPt+b/DdpUde4/r9zwywDE3Em4/uS6ehd+roiRV
         iwpCfbSYXkAJyV9IC9j4N83ZJKQKYpzzHdGYuicNWwVQYPcpXosEcdYk4/RZAilZByYc
         T1RA==
X-Gm-Message-State: APjAAAW+1gtVyTQNDljZzs0VFi0TF8o9pPkZQZzPfbV4Ut4bAzZFc23p
        kvWnCq9ra1KPOrEcq1XiC6ZJmqgaGm6m+g==
X-Google-Smtp-Source: APXvYqyuU6WupvU+Etjx7HXolNuuS90yj0op6CzYncR+RcIZxcsJGFz25eXZaMtgXlnSQOUoY47n1Q==
X-Received: by 2002:a2e:8957:: with SMTP id b23mr5056705ljk.30.1557227639179;
        Tue, 07 May 2019 04:13:59 -0700 (PDT)
Received: from [10.42.2.174] (78-69-122-97-no54.tbcn.telia.com. [78.69.122.97])
        by smtp.gmail.com with ESMTPSA id o7sm1505603lfl.13.2019.05.07.04.13.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 04:13:58 -0700 (PDT)
Subject: Re: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>
Cc:     MTD Maling List <linux-mtd@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20190320071605.4289-1-jonas@norrbonn.se>
 <20190320071605.4289-3-jonas@norrbonn.se>
 <CAMuHMdVH85iFJngkU6W61ybwR2j3YQ7=cugPxgC57hUgBOc5KA@mail.gmail.com>
 <1f33e1e5-d7bf-76a0-c4d3-ecbc35fbfd4f@microchip.com>
 <CAMuHMdU83vLeVSqMZuJwR4yd382mau-OE1saMAOC2+6HodsHvg@mail.gmail.com>
From:   Jonas Bonn <jonas@norrbonn.se>
Message-ID: <fac5fa6d-95e9-cfb0-4d5a-6b16d4470190@norrbonn.se>
Date:   Tue, 7 May 2019 13:13:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdU83vLeVSqMZuJwR4yd382mau-OE1saMAOC2+6HodsHvg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 07/05/2019 12:50, Geert Uytterhoeven wrote:
> Hi Tudor,
> 
> On Tue, May 7, 2019 at 12:42 PM <Tudor.Ambarus@microchip.com> wrote:
>> On 05/07/2019 12:53 PM, Geert Uytterhoeven wrote:
>>> On Wed, Mar 20, 2019 at 8:16 AM Jonas Bonn <jonas@norrbonn.se> wrote:
>>>> Both the BP[0-2] bits and the TBPROT bit are supported on this chip.
>>>> Tested and verified on a Cypress s25fl512s.
>>>>
>>>> Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
>>>
>>> This is now commit dcb4b22eeaf44f91 ("spi-nor: s25fl512s supports region
>>> locking") in mtd/next.
>>>
>>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>>> @@ -1898,7 +1898,9 @@ static const struct flash_info spi_nor_ids[] = {
>>>>                          SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>>>>          { "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR) },
>>>>          { "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>>>> -       { "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>>>> +       { "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256,
>>>> +                       SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>>>> +                       SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | USE_CLSR) },
>>>
>>> Setting SPI_NOR_HAS_LOCK causes the QSPI FLASH on r8a7791/koelsch to fail
>>> probing.
>>>
>>> Before/after:
>>>
>>>      -m25p80 spi0.0: s25fl512s (65536 Kbytes)
>>>      -3 fixed-partitions partitions found on MTD device spi0.0
>>>      -Creating 3 MTD partitions on "spi0.0":
>>>      -0x000000000000-0x000000080000 : "loader"
>>>      -0x000000080000-0x000000600000 : "user"
>>>      -0x000000600000-0x000004000000 : "flash"
>>>      +m25p80 spi0.0: Erase Error occurred
>>>      +m25p80 spi0.0: Erase Error occurred
>>>      +m25p80 spi0.0: timeout while writing configuration register
>>>      +m25p80 spi0.0: quad mode not supported
>>>      +m25p80: probe of spi0.0 failed with error -5
>>>

In drivers/mtd/spi-nor/spi-nor.c you have:

static int spi_nor_init(struct spi_nor *nor)
{
         int err;

         /*
          * Atmel, SST, Intel/Numonyx, and others serial NOR tend to 
power up
          * with the software protection bits set
          */
         if (JEDEC_MFR(nor->info) == SNOR_MFR_ATMEL ||
             JEDEC_MFR(nor->info) == SNOR_MFR_INTEL ||
             JEDEC_MFR(nor->info) == SNOR_MFR_SST ||
             nor->info->flags & SPI_NOR_HAS_LOCK) {
                 write_enable(nor);
                 write_sr(nor, 0);
                 spi_nor_wait_till_ready(nor);
         }

         if (nor->quad_enable) {
                 err = nor->quad_enable(nor);
                 if (err) {
                         dev_err(nor->dev, "quad mode not supported\n");
                         return err;
                 }
         }

This is the only meaningful thing that I can see may have changed with 
this flag.  We now have an additional write_enable before quad_enable. 
What happens if you swap those two blocks above so that quad_enable is 
called first?

If it's not that, I can't see how the extra flags can have any effect.

Regards,
Jonas
