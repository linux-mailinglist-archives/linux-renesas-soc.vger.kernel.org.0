Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB9E6BF61D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2019 17:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727147AbfIZPoH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Sep 2019 11:44:07 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:40931 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726984AbfIZPoH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Sep 2019 11:44:07 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 6B2BD3C0579;
        Thu, 26 Sep 2019 17:44:05 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id vE5FwvmGo7cr; Thu, 26 Sep 2019 17:43:59 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 6FF253C04C0;
        Thu, 26 Sep 2019 17:43:59 +0200 (CEST)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Thu, 26 Sep
 2019 17:43:58 +0200
Date:   Thu, 26 Sep 2019 17:43:56 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Balasubramani Vivekanandan <balasubramani_vivekanandan@mentor.com>
CC:     <fweisbec@gmail.com>, <tglx@linutronix.de>, <mingo@kernel.org>,
        <peterz@infradead.org>, <linux-renesas-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH V3 1/1] tick: broadcast-hrtimer: Fix a race in bc_set_next
Message-ID: <20190926154356.GA29221@vmlxhi-102.adit-jv.com>
References: <alpine.DEB.2.21.1909261144250.5528@nanos.tec.linutronix.de>
 <20190926135101.12102-1-balasubramani_vivekanandan@mentor.com>
 <20190926135101.12102-2-balasubramani_vivekanandan@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190926135101.12102-2-balasubramani_vivekanandan@mentor.com>
User-Agent: Mutt/1.12.1+40 (7f8642d4ee82) (2019-06-28)
X-Originating-IP: [10.72.93.184]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Sep 26, 2019 at 03:51:01PM +0200, Balasubramani Vivekanandan wrote:
> When a cpu requests broadcasting, before starting the tick broadcast
> hrtimer, bc_set_next() checks if the timer callback (bc_handler) is
> active using hrtimer_try_to_cancel(). But hrtimer_try_to_cancel() does
> not provide the required synchronization when the callback is active on
> other core.

[..]

> diff --git a/kernel/time/tick-broadcast-hrtimer.c b/kernel/time/tick-broadcast-hrtimer.c
> index c1f5bb590b5e..f070f9734792 100644
> --- a/kernel/time/tick-broadcast-hrtimer.c
> +++ b/kernel/time/tick-broadcast-hrtimer.c

[..]

FWIW, the patch seems to fix the very first commit adding hrtimer
broadcast, i.e. v3.15-rc1 commit 5d1638acb9f62f ("tick: Introduce
hrtimer based broadcast"), so maybe adding a Fixes: tag could be
relevant/beneficial for the stable trees?

-- 
Best Regards,
Eugeniu
