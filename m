Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E0483AE3F1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 09:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbhFUHRp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 03:17:45 -0400
Received: from mga09.intel.com ([134.134.136.24]:7739 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229597AbhFUHRp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 03:17:45 -0400
IronPort-SDR: Evwn95OQ7tnohquUHxVdaep0xLjYq4mBIra6Vkg4GeN5NGpipJVGNCaxNYQfeOKUKKiuCJE8eD
 Fn+BykNjwixg==
X-IronPort-AV: E=McAfee;i="6200,9189,10021"; a="206739224"
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; 
   d="scan'208";a="206739224"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2021 00:15:30 -0700
IronPort-SDR: uaKlk9fvtXZqJwh5czcYOgo38SBnGxOWNUVj3S92KA1bPIrARpPMVmgfh/3Vat4E8CVrFlJzMW
 qnAKdp2VA1Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; 
   d="scan'208";a="405533862"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.79]) ([10.237.72.79])
  by orsmga006.jf.intel.com with ESMTP; 21 Jun 2021 00:15:28 -0700
Subject: Re: [PATCH] mmc: disable tuning when checking card presence
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>
References: <20210618082317.58408-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFqkW9uwtJyWPFKggi2AJMtO4NJLW-6hviWgGSfoHyDm1A@mail.gmail.com>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <bbfbed66-5058-1263-159c-dabd345286c8@intel.com>
Date:   Mon, 21 Jun 2021 10:15:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFqkW9uwtJyWPFKggi2AJMtO4NJLW-6hviWgGSfoHyDm1A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 18/06/21 1:42 pm, Ulf Hansson wrote:
> + Adrian
> 
> On Fri, 18 Jun 2021 at 10:23, Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
>>
>> When we use the alive callback, we expect a command to fail if the card
>> is not present. We should not trigger a retune then which will confuse
>> users with a failed retune on a removed card:
>>
>>  mmc2: tuning execution failed: -5
>>  mmc2: card 0001 removed
>>
>> Disable retuning in this code path.
>>
>> Reported-by: Ulrich Hecht <uli+renesas@fpond.eu>
>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> ---
>>  drivers/mmc/core/core.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
>> index 54f0814f110c..eb792dd845a3 100644
>> --- a/drivers/mmc/core/core.c
>> +++ b/drivers/mmc/core/core.c
>> @@ -2088,6 +2088,9 @@ int _mmc_detect_card_removed(struct mmc_host *host)
>>         if (!host->card || mmc_card_removed(host->card))
>>                 return 1;
>>
>> +       /* we expect a failure if the card is removed */
>> +       mmc_retune_disable(host);
>> +
> 
> Some controllers require a retune after it has been runtime suspended.
> 
> In the above path, when called via the bus_ops->detect() callback, it
> could be that the controller may have been runtime suspended and then
> got resumed by the call to mmc_get_card().
> 
> I think we need something more clever here, to make sure we don't end
> up in that situation. I have looped in Adrian, to see if has some
> ideas for how this can be fixed.

Can we clarify, is the only problem that the error message is confusing?

> 
>>         ret = host->bus_ops->alive(host);
>>
>>         /*
>> @@ -2107,6 +2110,8 @@ int _mmc_detect_card_removed(struct mmc_host *host)
>>                 pr_debug("%s: card remove detected\n", mmc_hostname(host));
>>         }
>>
>> +       mmc_retune_enable(host);
>> +
>>         return ret;
>>  }
>>
>> --
>> 2.30.2
>>
> 
> Kind regards
> Uffe
> 

