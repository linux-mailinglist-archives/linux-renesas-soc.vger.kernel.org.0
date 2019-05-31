Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8117630F46
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 May 2019 15:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbfEaNuH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 31 May 2019 09:50:07 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:54467 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbfEaNuH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 May 2019 09:50:07 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 0CC603C014A;
        Fri, 31 May 2019 15:50:05 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id CkYQQFDmMpHh; Fri, 31 May 2019 15:49:58 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 71AAC3C0022;
        Fri, 31 May 2019 15:49:58 +0200 (CEST)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 31 May
 2019 15:49:58 +0200
Date:   Fri, 31 May 2019 15:49:55 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Simon Horman <horms@verge.net.au>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Spyridon Papageorgiou <spapageorgiou@de.adit-jv.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tobias Franzen <tfranzen@de.adit-jv.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH] arm64: dts: ulcb-kf: Add support for TI WL1837
Message-ID: <20190531134955.GA28755@vmlxhi-102.adit-jv.com>
References: <20190411124102.22442-1-spapageorgiou@de.adit-jv.com>
 <CAMuHMdVfDd_1gHnX=WvkHnF33fG2sWy7F5bTh-DghoKSt-vLCA@mail.gmail.com>
 <20190531093702.4pdbamghomqdhhuq@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190531093702.4pdbamghomqdhhuq@verge.net.au>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.93.184]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Fri, May 31, 2019 at 11:37:02AM +0200, Simon Horman wrote:
> Hi Spyridon,
> 
> please respond to Geert's review below and
> if appropriate provide an incremental patch.
> 
> Thanks in advance,
> Simon
> 

Spyridon is on vacation, so I will handle the open points.

-- 
Best Regards,
Eugeniu.
