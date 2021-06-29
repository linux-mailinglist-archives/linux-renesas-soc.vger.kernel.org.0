Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1C13B761D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Jun 2021 18:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233868AbhF2QFq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Jun 2021 12:05:46 -0400
Received: from mga07.intel.com ([134.134.136.100]:28637 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234171AbhF2QE5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Jun 2021 12:04:57 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10030"; a="272031645"
X-IronPort-AV: E=Sophos;i="5.83,309,1616482800"; 
   d="scan'208";a="272031645"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2021 09:01:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,309,1616482800"; 
   d="scan'208";a="419645643"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.79]) ([10.237.72.79])
  by fmsmga007.fm.intel.com with ESMTP; 29 Jun 2021 09:01:00 -0700
Subject: Re: [PATCH] mmc: disable tuning when checking card presence
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulrich Hecht <uli@fpond.eu>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20210618082317.58408-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFqkW9uwtJyWPFKggi2AJMtO4NJLW-6hviWgGSfoHyDm1A@mail.gmail.com>
 <bbfbed66-5058-1263-159c-dabd345286c8@intel.com>
 <563832257.373371.1624260736936@webmail.strato.com>
 <5adc8601-23c7-4378-94e2-cb3641d9039c@intel.com> <YNBJq7Lrtlc/qExN@ninjato>
 <b5062770-ba5c-32d5-15f0-505a09bb4a2e@intel.com> <YNd4vIJjpaSmFD9t@ninjato>
 <CAPDyKFrA--dB1G4wNpo825EQcRDSVmT5mjVoMLK=ojU0k49JAA@mail.gmail.com>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <a7dc7105-1f9b-f394-76c2-4809e078abe6@intel.com>
Date:   Tue, 29 Jun 2021 19:01:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFrA--dB1G4wNpo825EQcRDSVmT5mjVoMLK=ojU0k49JAA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 29/06/21 5:16 pm, Ulf Hansson wrote:
> On Sat, 26 Jun 2021 at 20:58, Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
>>
>> Hi Adrian, Ulf, everyone,
>>
>>> With the code above, if the host controller knows the card has been
>>> removed, it can return -ENOMEDIUM from ->execute_tuning() to suppress
>>> the message.
>>
>> On second thought, I like the idea with -ENOMEDIUM. Because tuning can
>> still fail for reasons other than a removed card and we want to see an
>> error message then.
>>
>> So, I checked when/how to return -ENOMEDIUM for the SDHI driver but this
>> lead me to more questions. The few driver which return this error code
>> all follow a similar pattern:
>>
>> xxx_request()
>> {
>>         if (host->get_cd == 1)
>>                 submit_mrq
>>         else
>>                 cmd->error = -ENOMEDIUM
>>                 mmc_request_done()
>> }
>>
>> So, my first question would be if we can't apply this pattern in the
>> core before calling the .request callback? A lot of drivers are not
>> implementing this pattern although it seems useful. Is it required?
> 
> It's required for some sdhci variants, because issuing a command when
> a card has been removed can hang (or completes after quite a long
> timeout, I don't recall, Adrian?).

If the host supports SDHCI's own card detect then after the card is
removed requests will not start nor error, until the 10 second
software timeout.  The logic to check SDHCI card present predated
the use of GPIO card-detect but the same approach was copied, although
it should be possible to do without it.

> 
>> Recommended? Nice to have? However, I could imagine an answer for moving
>> it into the core is "no, that should be checked atomically"? E.g. sdhci
>> does it, but atmel-mci and s3cmci do not. If I just look at moving the
>> card detection call into the core, I don't really see the reason for
>> atomic. Am I missing something?
> 
> My main concern would be performance/latency, as we would introduce
> some overhead for every single request. So, no, we don't want this in
> the core in my opinion.

I agree.

I would get rid of it from SDHCI but it looked like we might need to
rely on ->card_event() which won't work because it claims the host,
which will wait for the block driver to release it, which will wait
for the request anyway. That was as far as I got, thinking about it.

