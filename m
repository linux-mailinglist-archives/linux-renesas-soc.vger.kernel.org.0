Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC36D122AD7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2019 13:01:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbfLQMB1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Dec 2019 07:01:27 -0500
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:51715 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbfLQMB1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 07:01:27 -0500
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id DB4273C057F;
        Tue, 17 Dec 2019 13:01:24 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 0TeibO5qeoXj; Tue, 17 Dec 2019 13:01:19 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id D400A3C00BB;
        Tue, 17 Dec 2019 13:01:19 +0100 (CET)
Received: from vmlxhi-102.adit-jv.com (10.72.93.66) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Tue, 17 Dec
 2019 13:01:19 +0100
Date:   Tue, 17 Dec 2019 13:01:16 +0100
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        <linux-renesas-soc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v2 0/6] arm64: dts: renesas: r8a77961: Add more device
 nodes
Message-ID: <20191217120116.GA11814@vmlxhi-102.adit-jv.com>
References: <20191216124740.16647-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191216124740.16647-1-geert+renesas@glider.be>
X-Originating-IP: [10.72.93.66]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Mon, Dec 16, 2019 at 01:47:34PM +0100, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This patch series broadens support for the R-Car M3-W+ (aka R-Car M3-W
> ES3.0) Soc (R8A77961), by adding more device nodes to its DT source
> file, up to what can be tested reasonably using remote access.
> For your convenience, it is available in the topic/r8a77961-v2 branch of
> my renesas-drivers git repository at
> git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git.

I only see below r8a77961.dtsi commit on topic/r8a77961-v2:
8e4529f2ac8293 ("arm64: dts: renesas: Add Renesas R8A77961 SoC support")

It looks like the patches are from one of below branches?
 - topic/r8a77961-extra-v2
 - topic/topic/r8a77961-extra-v1

> Changes compared to v1:
>   - Group SYS-DMAC interrupt specifiers.
> 
> This has been tested on a Salvator-XS development board.
> More details can be found in the individual patches.
> 
> To be queued in renesas-devel for v5.6.
> Thanks!
> 
> Geert Uytterhoeven (6):
>   arm64: dts: renesas: r8a77961: Add RWDT node
>   arm64: dts: renesas: r8a77961: Add GPIO nodes
>   arm64: dts: renesas: r8a77961: Add RAVB node
>   arm64: dts: renesas: r8a77961: Add SYS-DMAC nodes
>   arm64: dts: renesas: r8a77961: Add I2C nodes
>   arm64: dts: renesas: r8a77961: Add SDHI nodes

Thanks for your time and for the helpful minimal test-cases, which
can be reused in future bring-ups.

-- 
Best Regards,
Eugeniu
