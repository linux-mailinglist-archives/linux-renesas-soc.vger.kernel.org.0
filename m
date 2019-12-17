Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD1EC1232A5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2019 17:38:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728238AbfLQQic (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Dec 2019 11:38:32 -0500
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:54143 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727766AbfLQQic (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 11:38:32 -0500
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 2422A3C057C;
        Tue, 17 Dec 2019 17:38:30 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id iZfVHM76q697; Tue, 17 Dec 2019 17:38:25 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 116B13C00BB;
        Tue, 17 Dec 2019 17:38:25 +0100 (CET)
Received: from vmlxhi-102.adit-jv.com (10.72.93.66) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Tue, 17 Dec
 2019 17:38:24 +0100
Date:   Tue, 17 Dec 2019 17:38:21 +0100
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        <linux-renesas-soc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v2 4/6] arm64: dts: renesas: r8a77961: Add SYS-DMAC nodes
Message-ID: <20191217163821.GA16268@vmlxhi-102.adit-jv.com>
References: <20191216124740.16647-1-geert+renesas@glider.be>
 <20191216124740.16647-5-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191216124740.16647-5-geert+renesas@glider.be>
X-Originating-IP: [10.72.93.66]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Mon, Dec 16, 2019 at 01:47:38PM +0100, Geert Uytterhoeven wrote:
> Add device nodes for the System DMA Controllers (SYS-DMAC) on the
> Renesas R-Car M3-W+ (r8a77961) SoC.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Group interrupt specifiers.
> 
> Test procedure (with "arm64: dts: renesas: r8a77961: Add i2c nodes"):
>   1. "hd /sys/devices/platform/soc/e60b0000.i2c/i2c-?/?-0050/eeprom",
>   2. See dma-controller interrupt count in /proc/interrupts has
>      increased.
> ---

Reviewed-by: Eugeniu Rosca <erosca@de.adit-jv.com>

Thanks!

-- 
Best Regards,
Eugeniu
