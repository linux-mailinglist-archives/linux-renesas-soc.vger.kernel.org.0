Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2514E3AE390
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 08:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbhFUG6k (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 02:58:40 -0400
Received: from mga17.intel.com ([192.55.52.151]:4157 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229506AbhFUG6j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 02:58:39 -0400
IronPort-SDR: 8RvWH8QcAjzRaQLl+Uq+TURmFApJpx8U+11A3Vs462sQiQldNlwvZU1SUBQSwU/ehEZ25KmTlM
 TBS5zezkcb5Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10021"; a="187164684"
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; 
   d="scan'208";a="187164684"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2021 23:56:26 -0700
IronPort-SDR: J0Yq2EiawLCzV/eM/hArCOVWTAyX1EptHsHmjSzOZN2hHQIzwbb72iMmJ/NAmx2LFCVJHU/yeS
 QGhAOPhDB1hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; 
   d="scan'208";a="405527476"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.79]) ([10.237.72.79])
  by orsmga006.jf.intel.com with ESMTP; 20 Jun 2021 23:56:23 -0700
Subject: Re: [RFC PATCH] mmc: disable retuning when tuning
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20210618073950.46154-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFqNcAomh145-MH8LMKnGDi3zCFASMh-U5DK-xM1rwJqHg@mail.gmail.com>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <0979048f-b477-c65e-0f53-8bef284ba3f4@intel.com>
Date:   Mon, 21 Jun 2021 09:56:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFqNcAomh145-MH8LMKnGDi3zCFASMh-U5DK-xM1rwJqHg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 18/06/21 1:45 pm, Ulf Hansson wrote:
> On Fri, 18 Jun 2021 at 09:39, Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
>>
>> It might be that something goes wrong during tuning so the MMC core will
>> immediately trigger a retune. In our case it was:
>>
>>  - we sent a tuning block
>>  - there was an error so we need to send an abort cmd to the eMMC
>>  - the abort cmd had a CRC error
>>  - retune was set by the MMC core
>>
>> This lead to a vicious circle causing a performance regression of 75%.
>> So, disable retuning while we tune. Let the tuning complete and see then
>> if it worked out or not.
>>
>> Reported-by Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> ---
>>
>> Hi Ulf, this patch is marked as RFC because I think this is a generic
>> issue. Lots of things could happen in the driver callback which cause a
>> retune, so I'd think it makes sense to deactivate it globally here. If
>> you think this is a driver specific issue, just let me know. I can
>> provide a small patch to create the issue for SDHI hardware, created
>> by Shimoda-san. We couldn't think of an easy way to reproduce it with
>> the fault injector, sadly. Let me know if you want to see that patch.
> 
> This certainly makes sense to me! We should probably tag this (or
> something along this change) for stable.
> 
> However, I would like to get some input from Adrian about this as
> well, so I have looped him in.
> 
> Kind regards
> Uffe
> 
>>
>>  drivers/mmc/core/core.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
>> index b039dcff17f8..54f0814f110c 100644
>> --- a/drivers/mmc/core/core.c
>> +++ b/drivers/mmc/core/core.c
>> @@ -927,6 +927,8 @@ int mmc_execute_tuning(struct mmc_card *card)
>>         if (!host->ops->execute_tuning)
>>                 return 0;
>>
>> +       mmc_retune_disable(host);

mmc_retune_disable() is not meant for temporarily preventing re-tuning.
It is meant for exiting a transfer mode that requires re-tuning.

I would prefer something like below:

diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
index b039dcff17f8..f6d97bffc559 100644
--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -937,11 +937,14 @@ int mmc_execute_tuning(struct mmc_card *card)
 
 	err = host->ops->execute_tuning(host, opcode);
 
-	if (err)
+	if (err) {
 		pr_err("%s: tuning execution failed: %d\n",
 			mmc_hostname(host), err);
-	else
+	} else {
 		mmc_retune_enable(host);
+		host->retune_now = 0;
+		host->need_retune = 0;
+	}
 
 	return err;
 }


Would that work?

>> +
>>         if (host->cqe_on)
>>                 host->cqe_ops->cqe_off(host);
>>
>> --
>> 2.30.2
>>

