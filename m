Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A179F418C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Nov 2019 08:53:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbfKHHxa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Nov 2019 02:53:30 -0500
Received: from hel-mailgw-01.vaisala.com ([193.143.230.17]:7757 "EHLO
        hel-mailgw-01.vaisala.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbfKHHxa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Nov 2019 02:53:30 -0500
X-Greylist: delayed 428 seconds by postgrey-1.27 at vger.kernel.org; Fri, 08 Nov 2019 02:53:28 EST
IronPort-SDR: zBtsGMriyjfKMyge+HeQTsVV1yaG4RkJt7Cmers/Qbx6qxDXgHyJCWqRjutbm0gL29f9vXlbQ3
 MBv02li61jFSHTQFQmRE14PoWmjJxozMHUpmPDWgpuoc4aD6klU4P8C5sxYNn96kj4mCkXEKnD
 fd2yK3qRSIvZRUisw50ipkLp0QrXOXvXQjEH6BUFTOLoeVSf3UPps+wq2sOjpOspgZpGRmor3F
 WX7vhRFt4UosIDDXEXeccxAOuDfJlRET+lG02ww8FP/tuC4n6zAwnvd9kHK/OY1CkAAQc7DEoD
 4O8=
X-IronPort-AV: E=Sophos;i="5.68,280,1569272400"; 
   d="scan'208";a="254656675"
Subject: Re: [PATCH v2 0/2] Add definition for GPIO direction
To:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        Ian Ray <ian.ray@ge.com>
Cc:     "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "andrew@aj.id.au" <andrew@aj.id.au>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
References: <cover.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
 <20191106120846.5bunrqj3uz4khih5@earth.universe>
 <ddcd02cc6c709837a28cae2cbfa672c506927659.camel@fi.rohmeurope.com>
 <20191106142441.GC32742@smile.fi.intel.com>
 <CACRpkdZ2F3zR2bdHgUV9GJX8iSojiM34BTWizTV_z+j7sS4jtw@mail.gmail.com>
 <2ca76ecb58b9e6377925d6790ff4f7722604f57b.camel@fi.rohmeurope.com>
 <20191107120859.zoml7cmxbtaetjsk@earth.universe>
From:   Nandor Han <nandor.han@vaisala.com>
Message-ID: <8722c9bd-6fc9-681a-d5e0-b8c7884ea69c@vaisala.com>
Date:   Fri, 8 Nov 2019 09:46:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20191107120859.zoml7cmxbtaetjsk@earth.universe>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 08 Nov 2019 07:46:15.0948 (UTC) FILETIME=[99AD64C0:01D59608]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 11/7/19 2:08 PM, Sebastian Reichel wrote:
> Hi,
> 
> On Thu, Nov 07, 2019 at 08:52:11AM +0000, Vaittinen, Matti wrote:
>> That reminded me.. I got 'unknown recipient' replies
>> <nandor.han@ge.com>: 550 5.1.1 No such user - pp
>> <semi.malinen@ge.com>: 550 5.1.1 No such user - pp
>>
>> from both Semi and Nandor - who seem to be the only maintainers listed
>> for XRA1403 GPIO EXPANDER in MAINTAINERS.
>>
>> XRA1403 GPIO EXPANDER
>> M:      Nandor Han <nandor.han@ge.com>
>> M:      Semi Malinen <semi.malinen@ge.com>
>> L:      linux-gpio@vger.kernel.org
>> S:      Maintained
>> F:      drivers/gpio/gpio-xra1403.c
>> F:      Documentation/devicetree/bindings/gpio/gpio-xra1403.txt
>>
>> Anyone knows new mail addresses or perhaps the separate entry
>> for XRA1403 should be removed?
> 
> +cc new mail address from Nandor Han
> +cc Ian Ray with valid GE mail address
> 
> -- Sebastian
> 

Thanks Sebastian.

Matti, I did review the gpio-xra1403 changes and LGTM.

According with the datasheet, 1 means direction input:

XRA1403 datasheet (https://www.maxlinear.com/ds/xra1403_100_092011.pdf)
```
  Setting these bits to ’1’ will enable the GPIOs as inputs.
```

Note: I will update also the maintainers list.

Nandor

