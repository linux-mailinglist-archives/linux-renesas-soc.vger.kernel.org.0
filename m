Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2645E3B338E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Jun 2021 18:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232261AbhFXQJN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Jun 2021 12:09:13 -0400
Received: from mga11.intel.com ([192.55.52.93]:60575 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232131AbhFXQJD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jun 2021 12:09:03 -0400
IronPort-SDR: DPRquJrvhgtI5ot/wsQPTq0z6LA/EjkjktQvlO8cWqq91gLJ4WuZZDypm7AoyM2VhiJqhyQTCF
 mfHnwBvJmHTg==
X-IronPort-AV: E=McAfee;i="6200,9189,10025"; a="204496095"
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; 
   d="scan'208";a="204496095"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2021 09:06:42 -0700
IronPort-SDR: 2YJhgaeXRUIK4z5GnFC1FH84EaTwiaLMqs7UxE3g3kkcuPXOKYf8PcesXiHY+RzhbCU/HocWlN
 RL/ld5em7rhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; 
   d="scan'208";a="487818293"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.79]) ([10.237.72.79])
  by orsmga001.jf.intel.com with ESMTP; 24 Jun 2021 09:06:37 -0700
Subject: Re: [PATCH 0/3] mmc: avoid vicious circle when retuning
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
References: <20210624151616.38770-1-wsa+renesas@sang-engineering.com>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <1741203b-c37e-fbc0-ef0b-bfd34f402e7d@intel.com>
Date:   Thu, 24 Jun 2021 19:06:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624151616.38770-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 24/06/21 6:16 pm, Wolfram Sang wrote:
> See patch 1 for a description of the problem. This series implements the
> alternative approach suggested by Adrian (thanks!). It also adds some
> documentation and a minor cleanup which I came up with while working on
> the fix. Patch 1 can go to stable as is, the rest built on top of that.
> 
> This series fixes the performance issue which we saw when injecting CRC
> errors on Renesas R-Car Gen3 hardware.
> 
> Looking forward to comments!

Looks good to me.  For all 3 patches:

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> 
> 
> Wolfram Sang (3):
>   mmc: core: clear flags before allowing to retune
>   mmc: host: add kdoc for mmc_retune_{en|dis}able
>   mmc: host: factor out clearing the retune state
> 
>  drivers/mmc/core/core.c |  6 ++++--
>  drivers/mmc/core/host.c | 13 +++++++++++--
>  drivers/mmc/core/host.h |  6 ++++++
>  3 files changed, 21 insertions(+), 4 deletions(-)
> 

