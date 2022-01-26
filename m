Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71AA449C5C4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jan 2022 10:05:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231424AbiAZJFT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Jan 2022 04:05:19 -0500
Received: from mga03.intel.com ([134.134.136.65]:50009 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231404AbiAZJFS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Jan 2022 04:05:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643187918; x=1674723918;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=6xFOt90IFugbUSpPBYPJ51z+ZHhtyvlH4wnsORv2oKk=;
  b=h1mCJEXQ15oRsQS5d904ajH8b+w/yY6R+Ev7/ZGQcL5aWry/1iJwkfqn
   GDhAA/55C/Zej/pbjpo/QMFPfvP30u4GW24h+BA6ijt35xwPJYY2w4fYx
   UO8JnWLiFQt4O2qstC48G23fSk4ICBul2G2zWPaUOZpfRoyadWuEFS/M1
   EZ7uOjAik5NJWZtRVMDX3mBwFedJR11LNO8HclAblmkkZhimuel1LmjGS
   IRLjcL6GQjZeYd6IKc3FU0+DMQG9+G3ctXxgrbTyVghkBMMH2mJwpVd35
   SDftsg0c7FwTHJ62oyZHuEaskeDUqiWNW5tzep1NRl88U14IwdC7i3OK6
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="246455126"
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; 
   d="scan'208";a="246455126"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 01:05:17 -0800
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; 
   d="scan'208";a="696155832"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.249.171.24]) ([10.249.171.24])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 01:05:14 -0800
Subject: Re: [geert-renesas-devel:master] BUILD SUCCESS
 4ccda2778be03d61d70b8c8da55ef54d69a7f3cd
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        kernel test robot <lkp@intel.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <61ef5253.dX1h+KToNxbVl4p8%lkp@intel.com>
 <CAMuHMdX5cyS-q7ayp-5cXySdO1yREBUMc8MT9bJJHuXZ_rGqxQ@mail.gmail.com>
 <CAMuHMdVJ0+Gn0Ute5m=R67R7ogkOiub+eMXDcFjzO=4QddV3jg@mail.gmail.com>
From:   "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <ed0e1353-1212-b8f9-a4a4-9e9eea583970@intel.com>
Date:   Wed, 26 Jan 2022 17:05:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVJ0+Gn0Ute5m=R67R7ogkOiub+eMXDcFjzO=4QddV3jg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org



On 1/25/2022 5:44 PM, Geert Uytterhoeven wrote:
> On Tue, Jan 25, 2022 at 10:44 AM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> On Tue, Jan 25, 2022 at 2:29 AM kernel test robot <lkp@intel.com> wrote:
>>> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
>>> branch HEAD: 4ccda2778be03d61d70b8c8da55ef54d69a7f3cd  Merge branch 'renesas-next' into renesas-devel
>>>
>>> elapsed time: 736m
>>>
>>> configs tested: 133
>>> configs skipped: 3
>>>
>>> The following configs have been built successfully.
>>> More configs may be tested in the coming days.
>>>
>>> gcc tested configs:
>>> arm                                 defconfig
>>> arm64                            allyesconfig
>>> arm64                               defconfig
>>
>> How come arm64/defconfig built successfully?
> 
> Sorry, allyesconfig.

Hi Geert,

Thanks for the warning, we did notice the below error, but the bot
failed to bisect out the first bad commit, so the report didn't list
the error.

We'll fix the bisection asap.

Best Regards,
Rong Chen

> 
>> It is supposed to fail due to a missing file:
>>
>>      In file included from arch/arm64/boot/dts/renesas/r9a07g054l2.dtsi:9,
>>                       from arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts:9:
>>      arch/arm64/boot/dts/renesas/r9a07g054.dtsi:9:10: fatal error:
>> dt-bindings/clock/r9a07g054-cpg.h: No such file or directory
>>          9 | #include <dt-bindings/clock/r9a07g054-cpg.h>
>>            |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
> 
