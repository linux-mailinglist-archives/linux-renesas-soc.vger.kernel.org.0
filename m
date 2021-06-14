Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2043A71A9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Jun 2021 23:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231136AbhFNWBM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Jun 2021 18:01:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbhFNWBL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Jun 2021 18:01:11 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95380C061767
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Jun 2021 14:59:08 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 641C1734;
        Mon, 14 Jun 2021 21:58:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 641C1734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1623707930; bh=QvgES27n86KPd9I0ZT9pqgdnCHoghIgGrrGRyghhwfM=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=TX9D9cpQBvt7tuVZbAaARy8BqRcqAFqsqYNBO1T1oybzUO+5ykUGV/w/A0mzbFSH0
         7L/EDxVApRhC0Rvn4fvC5zjhJ9Vtq6Yj22qMgGTUVcP/8XwWtyyGZb93YuBo+qLkWS
         Fvxtmc4SunfdEq2JbBDfbBN/WNI/V3BBPXJ7Cb9JYk819qxd1G3f1xTIQ5AUyak4Jj
         6cUU8T3893FGyVvmGpnyjeGEmAWw0qJOsvUT8xhiiJ5dvLZjXrpqEdke0gNIWbVoP+
         Qi1kuBkAQ+zCeLkEX9uP4KtnkCaSwY+9OAIQTvdts19XGzt27JKpQfvWGui+vvb4dk
         rd6yZDoQQEOaw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: fault-injection: fix non-working usage of
 negative values
In-Reply-To: <20210603125841.27436-1-wsa+renesas@sang-engineering.com>
References: <20210603125841.27436-1-wsa+renesas@sang-engineering.com>
Date:   Mon, 14 Jun 2021 15:58:49 -0600
Message-ID: <87eed4152e.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Wolfram Sang <wsa+renesas@sang-engineering.com> writes:

> Fault injection uses debugfs in a way that the provided values via sysfs
> are interpreted as u64. Providing negative numbers results in an error:
>
> /sys/kernel/debug/fail_function# echo -1 > times
> sh: write error: Invalid argument
>
> Update the docs and examples to use "printf %#x <val>" in these cases.
> For "retval", reword the paragraph a little and fix a typo.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  .../fault-injection/fault-injection.rst       | 24 +++++++++++--------
>  1 file changed, 14 insertions(+), 10 deletions(-)

Applied, thanks.

jon
