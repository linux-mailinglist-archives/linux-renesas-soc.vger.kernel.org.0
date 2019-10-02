Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1024C8B14
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2019 16:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbfJBOU6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Oct 2019 10:20:58 -0400
Received: from mga07.intel.com ([134.134.136.100]:36612 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726214AbfJBOU6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Oct 2019 10:20:58 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Oct 2019 07:20:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,574,1559545200"; 
   d="scan'208";a="391592758"
Received: from zhizhuan-mobl.ccr.corp.intel.com (HELO [10.255.28.55]) ([10.255.28.55])
  by fmsmga005.fm.intel.com with ESMTP; 02 Oct 2019 07:20:53 -0700
Subject: Re: [kbuild-all] Re: [PATCH] serial: sh-sci: Use
 platform_get_irq_optional() for optional interrupts
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        kbuild test robot <lkp@intel.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>, kbuild-all@01.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20191001180743.1041-1-geert+renesas@glider.be>
 <201910021701.JBV8khAI%lkp@intel.com>
 <CAMuHMdWQhvWOMjEpJrXV0nuKUc=wT6Zi_ZLjKco0Lkgeis8NyQ@mail.gmail.com>
From:   "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <26cf2dd9-2788-bc23-03c4-beb8ed68ef97@intel.com>
Date:   Wed, 2 Oct 2019 22:20:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWQhvWOMjEpJrXV0nuKUc=wT6Zi_ZLjKco0Lkgeis8NyQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your clarification. we are on vacation this week, and we'll 
take a look asap.

Best Regards,
Rong Chen

On 10/2/2019 7:28 PM, Geert Uytterhoeven wrote:
> Hi Kbuild test robot,
>
> On Wed, Oct 2, 2019 at 11:53 AM kbuild test robot <lkp@intel.com> wrote:
>> I love your patch! Yet something to improve:
>>
>> [auto build test ERROR on tty/tty-testing]
>> [cannot apply to v5.4-rc1 next-20191001]
> Strange, this patch applies to all of v5.4-rc1, tty/tty-testing, and
> next-20191001?
>
>> url:    https://github.com/0day-ci/linux/commits/Geert-Uytterhoeven/serial-sh-sci-Use-platform_get_irq_optional-for-optional-interrupts/20191002-171547
> Oh, this is still the old tty/tty-testing before it was rebased to v5.4-rc1,
> i.e. still based on v5.3-rc4.  That explains the build failure.
>
> That does not explain why you couldn't apply this patch to v5.4-rc1 and
> next-20191001, though.
>
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
>> config: sparc64-allmodconfig (attached as .config)
>> compiler: sparc64-linux-gcc (GCC) 7.4.0
>> reproduce:
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # save the attached .config to linux build tree
>>          GCC_VERSION=7.4.0 make.cross ARCH=sparc64
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kbuild test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>     drivers/tty/serial/sh-sci.c: In function 'sci_init_single':
>>>> drivers/tty/serial/sh-sci.c:2899:24: error: implicit declaration of function 'platform_get_irq_optional'; did you mean 'platform_get_irq_byname'? [-Werror=implicit-function-declaration]
>>         sci_port->irqs[i] = platform_get_irq_optional(dev, i);
>>                             ^~~~~~~~~~~~~~~~~~~~~~~~~
>>                             platform_get_irq_byname
>>     cc1: some warnings being treated as errors
> FTR, not reproducible on sparc on v5.4-rc1, current tty/tty-testing, and
> next-20191001.
>
> Gr{oetje,eeting}s,
>
>                          Geert
>

