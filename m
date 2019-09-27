Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEE26C0158
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2019 10:39:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726030AbfI0IjU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Sep 2019 04:39:20 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:44994 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbfI0IjU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Sep 2019 04:39:20 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id E188E3C057C;
        Fri, 27 Sep 2019 10:39:18 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ySfPiMUS__ql; Fri, 27 Sep 2019 10:39:13 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 7E9193C0579;
        Fri, 27 Sep 2019 10:39:13 +0200 (CEST)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Fri, 27 Sep
 2019 10:39:13 +0200
Date:   Fri, 27 Sep 2019 10:39:13 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Simon Horman <horms@verge.net.au>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Michael Dege <michael.dege@renesas.com>,
        <Andrew_Gabbasov@mentor.com>,
        "George G. Davis" <george_davis@mentor.com>,
        Tobias Franzen <tfranzen@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [RFC DO-NOT-MERGE PATCH] arm64: dts: renesas: R8A77961: Add
 Renesas M3-W+ (M3 ES3.0) SoC support
Message-ID: <20190927083913.GB8869@vmlxhi-102.adit-jv.com>
References: <20190821124441.22319-1-erosca@de.adit-jv.com>
 <CAMuHMdWdObHAesUvF1BLwnEFJ6dsdpwM2yPRdUFW4D1Rp6d-tQ@mail.gmail.com>
 <20190831080102.sudig7zyadiqdlst@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190831080102.sudig7zyadiqdlst@verge.net.au>
User-Agent: Mutt/1.12.1+40 (7f8642d4ee82) (2019-06-28)
X-Originating-IP: [10.72.93.184]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Sat, Aug 31, 2019 at 10:01:02AM +0200, Simon Horman wrote:
[..]
> +1
> 
> Your recollection of the decisions made around H3 and 4/5 digit identifiers
> matches mine. And I agree that in hindsight we may have been better to use
> a 5 digit identifier for H3 ES2.0.  So I think it would be a good idea to
> learn from this and use a 5 digit identifier for M3-W+. We can always
> register unused identifiers if the need arises.
> 
> For may the main drawback of this approach is that it is inconsistent
> with the one we took for H3, which may lead to confusion. But I think
> that we are better off to favour evolution over reuse in this case.
> Or in other words, it seems like a good opportunity to learn from
> our mistakes.

Thank you for casting your thoughts. Much appreciated.

-- 
Best Regards,
Eugeniu
