Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65E28DF60
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2019 11:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727688AbfD2JZi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Apr 2019 05:25:38 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:54407 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727072AbfD2JZi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 05:25:38 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 01CC33C00DD;
        Mon, 29 Apr 2019 11:25:36 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id AywQ3HUwqqks; Mon, 29 Apr 2019 11:25:28 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 7A7AE3C003F;
        Mon, 29 Apr 2019 11:25:28 +0200 (CEST)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 29 Apr
 2019 11:25:28 +0200
Date:   Mon, 29 Apr 2019 11:25:25 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Simon Horman <horms@verge.net.au>
CC:     Spyridon Papageorgiou <spapageorgiou@de.adit-jv.com>,
        <magnus.damm@gmail.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <linux-renesas-soc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <tfranzen@de.adit-jv.com>,
        "George G. Davis" <george_davis@mentor.com>,
        Joshua Frkuska <joshua_frkuska@mentor.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: Re: [PATCH] arm64: dts: ulcb-kf: Add support for TI WL1837
Message-ID: <20190429092525.GA1808@vmlxhi-102.adit-jv.com>
References: <20190411124102.22442-1-spapageorgiou@de.adit-jv.com>
 <20190425111245.GA7258@vmlxhi-102.adit-jv.com>
 <20190426095012.xzyzevvmom4fzdcd@verge.net.au>
 <20190429081747.irznig7yrvztuc5x@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190429081747.irznig7yrvztuc5x@verge.net.au>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.93.184]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Mon, Apr 29, 2019 at 10:17:48AM +0200, Simon Horman wrote:
> Hi again,
> 
> I have been able to solicit a limited private review of this patch and
> have gone ahead and applied it for inclusion in v5.2.

Thank you. In case of any concerns/reports/fixes applicable to this
patch, we would appreciate if you CC ADIT people. We will then reply
with best possible latency, since we are interested in having a working
WiFi/BT on ULCB-KF.

-- 
Best Regards,
Eugeniu.
