Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C8CA3AE466
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 09:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbhFUH4q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 03:56:46 -0400
Received: from mga01.intel.com ([192.55.52.88]:29911 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229618AbhFUH4q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 03:56:46 -0400
IronPort-SDR: H/YQgShm9N09fNoC+sCVqxZ4Nx+cSxoJzniiOsXRDE6EA95NiamVMxvvL5FqoHrnuMK5dBElQR
 R4ZJ2grZPCig==
X-IronPort-AV: E=McAfee;i="6200,9189,10021"; a="228339714"
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; 
   d="scan'208";a="228339714"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2021 00:54:32 -0700
IronPort-SDR: ePunD3aphre132Ee0xHHXqV5EuQ660HRoOOItg4ledEjyfdzsq1+kYisl0blsZbPURZ4uTtV+G
 Zoa9oPb8DbTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; 
   d="scan'208";a="405542812"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.79]) ([10.237.72.79])
  by orsmga006.jf.intel.com with ESMTP; 21 Jun 2021 00:54:30 -0700
Subject: Re: [PATCH] mmc: disable tuning when checking card presence
To:     Ulrich Hecht <uli@fpond.eu>, Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20210618082317.58408-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFqkW9uwtJyWPFKggi2AJMtO4NJLW-6hviWgGSfoHyDm1A@mail.gmail.com>
 <bbfbed66-5058-1263-159c-dabd345286c8@intel.com>
 <563832257.373371.1624260736936@webmail.strato.com>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <5adc8601-23c7-4378-94e2-cb3641d9039c@intel.com>
Date:   Mon, 21 Jun 2021 10:54:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <563832257.373371.1624260736936@webmail.strato.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 21/06/21 10:32 am, Ulrich Hecht wrote:
> 
>> On 06/21/2021 9:15 AM Adrian Hunter <adrian.hunter@intel.com> wrote:
>> Can we clarify, is the only problem that the error message is confusing?
> 
> AFAICT there are no ill effects of the retune failing apart from the error message.
> 

So maybe the simplest thing to do is just amend the message:
e.g.

diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
index 4e52eb14198a..5cbf05e331c4 100644
--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -936,13 +936,22 @@ int mmc_execute_tuning(struct mmc_card *card)
 		opcode = MMC_SEND_TUNING_BLOCK;
 
 	err = host->ops->execute_tuning(host, opcode);
-
 	if (err)
-		pr_err("%s: tuning execution failed: %d\n",
-			mmc_hostname(host), err);
-	else
-		mmc_retune_enable(host);
+		goto out_err;
+
+	mmc_retune_enable(host);
 
+	return 0;
+
+out_err:
+	if (mmc_card_is_removable(host)) {
+		if (err != -ENOMEDIUM)
+			pr_err("%s: tuning execution failed: %d (this is normal if card removed)\n",
+			       mmc_hostname(host), err);
+	} else {
+		pr_err("%s: tuning execution failed: %d\n",
+		       mmc_hostname(host), err);
+	}
 	return err;
 }
 


