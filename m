Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A08CC76252
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2019 11:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726001AbfGZJrg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Jul 2019 05:47:36 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:59646 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbfGZJrg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Jul 2019 05:47:36 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 5CBD63C04C1;
        Fri, 26 Jul 2019 11:47:33 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id wfjjAcg0THXO; Fri, 26 Jul 2019 11:47:27 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id AE3BC3C009E;
        Fri, 26 Jul 2019 11:47:27 +0200 (CEST)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Fri, 26 Jul
 2019 11:47:27 +0200
Date:   Fri, 26 Jul 2019 11:47:24 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Ulrich Hecht <uli+renesas@fpond.eu>,
        "geert@linux-m68k.org" <geert@linux-m68k.org>,
        "horms@verge.net.au" <horms@verge.net.au>,
        "khiem.nguyen.xt@renesas.com" <khiem.nguyen.xt@renesas.com>,
        "dien.pham.ry@renesas.com" <dien.pham.ry@renesas.com>,
        "takeshi.kihara.df@renesas.com" <takeshi.kihara.df@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "Wischer, Timo (ADITG/ESM)" <twischer@de.adit-jv.com>,
        "Maik.Scholz@de.bosch.com" <Maik.Scholz@de.bosch.com>,
        "Dirk.Behme@de.bosch.com" <Dirk.Behme@de.bosch.com>,
        "Rosca, Eugeniu (ADITG/ESM1)" <erosca@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v2 2/5] arm64: dts: r8a7795: Add cpuidle support for CA53
 cores
Message-ID: <20190726094724.GA14913@vmlxhi-102.adit-jv.com>
References: <1547808474-19427-1-git-send-email-uli+renesas@fpond.eu>
 <1547808474-19427-3-git-send-email-uli+renesas@fpond.eu>
 <20190726091325.GA13111@vmlxhi-102.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190726091325.GA13111@vmlxhi-102.adit-jv.com>
User-Agent: Mutt/1.12.1+40 (7f8642d4ee82) (2019-06-28)
X-Originating-IP: [10.72.93.184]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jul 26, 2019 at 11:13:29AM +0200, Rosca, Eugeniu (ADITG/ESM1) wrote:
[..]
> The culprit BSP commits are:
> https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/commit/?id=3c3b44c752c4ee
> https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/commit/?id=902ff7caa32dc71c
> 
> Further narrowing it down, it turns out the CA57 cpuidle support is
> not responsible for generating the issue. It's all about the CA53 idle
> enablement. The reference target is H3-ES2.0-Salvator-X (the problem
> originally emerged on M3-based customer HW).
[..]

Small amendment to the above (based on vanilla testing):

 Version                              Issue reproduced?
                                      (H3-ES2.0-Salvator-X)
 v5.3-rc1-96-g6789f873ed37              No
 v5.3-rc1-96-g6789f873ed37 + [1]        No
 v5.3-rc1-96-g6789f873ed37 + [2]        No
 v5.3-rc1-96-g6789f873ed37 + [1] + [2]  Yes

[1] https://patchwork.kernel.org/patch/10769701/
("[v2,1/5] arm64: dts: r8a7795: Add cpuidle support for CA57 cores")

[2] https://patchwork.kernel.org/patch/10769689/
("[v2,2/5] arm64: dts: r8a7795: Add cpuidle support for CA53 cores")

-- 
Best Regards,
Eugeniu.
