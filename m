Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A905D68EB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Oct 2019 19:58:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730863AbfJNR55 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Oct 2019 13:57:57 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:45096 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728941AbfJNR54 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Oct 2019 13:57:56 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 38C203C04C1;
        Mon, 14 Oct 2019 19:57:54 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id qTeVtNauLx1I; Mon, 14 Oct 2019 19:57:45 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id DD5213C003F;
        Mon, 14 Oct 2019 19:57:45 +0200 (CEST)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Mon, 14 Oct
 2019 19:57:45 +0200
Date:   Mon, 14 Oct 2019 19:57:42 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
CC:     <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH/RFC 17/19] arm64: dts: renesas: Add support for
 Salvator-XS with R-Car M3-W+
Message-ID: <20191014175742.GA10194@vmlxhi-102.adit-jv.com>
References: <20191007102332.12196-1-geert+renesas@glider.be>
 <20191007102332.12196-18-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191007102332.12196-18-geert+renesas@glider.be>
User-Agent: Mutt/1.12.1+40 (7f8642d4ee82) (2019-06-28)
X-Originating-IP: [10.72.93.184]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for the series. One question below.

On Mon, Oct 07, 2019 at 12:23:30PM +0200, Geert Uytterhoeven wrote:
> Add initial support for the Renesas Salvator-X 2nd version development
> board equipped with an R-Car M3-W+ SiP with 8 (2 x 4) GiB of RAM.
> 
> The memory map is as follows:
>   - Bank0: 4GiB RAM : 0x000048000000 -> 0x000bfffffff
> 		      0x000480000000 -> 0x004ffffffff
>   - Bank1: 4GiB RAM : 0x000600000000 -> 0x006ffffffff
> 
> Based on a patch in the BSP by Takeshi Kihara
> <takeshi.kihara.df@renesas.com>.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm64/boot/dts/renesas/Makefile          |  1 +
>  .../boot/dts/renesas/r8a77961-salvator-xs.dts | 31 +++++++++++++++++++
>  2 files changed, 32 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts

It is common practice in Renesas BSP to specify the SiP memory
split by suffixing the DTB names with '-{2,4}x{2,4}g' [1].

Has this ever been discussed on ML?

Here in particular, it would allow M3-W+ 2x4GiB Salvator-XS and
M3-W+ 2x2GiB (or any other DRAM split flavor of) Salvator-XS to
coexist in harmony, if the latter pops up at any point.

[1] (rcar-3.9.6) ls -1 arch/arm64/boot/dts/renesas/*dtb  | grep 'g.dtb'
arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-4x2g.dtb
arch/arm64/boot/dts/renesas/r8a7795-salvator-xs-2x2g.dtb
arch/arm64/boot/dts/renesas/r8a7795-salvator-xs-4x2g.dtb
arch/arm64/boot/dts/renesas/r8a7796-salvator-xs-2x4g.dtb

-- 
Best Regards,
Eugeniu
