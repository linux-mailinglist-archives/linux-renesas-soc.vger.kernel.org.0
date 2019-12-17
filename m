Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16BE7122E71
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2019 15:19:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728839AbfLQOTv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Dec 2019 09:19:51 -0500
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:53009 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728573AbfLQOTu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 09:19:50 -0500
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 3A2D23C057F;
        Tue, 17 Dec 2019 15:19:49 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id q6AQr8NZ-YPY; Tue, 17 Dec 2019 15:19:44 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 11ED73C00BB;
        Tue, 17 Dec 2019 15:19:44 +0100 (CET)
Received: from vmlxhi-102.adit-jv.com (10.72.93.66) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Tue, 17 Dec
 2019 15:19:43 +0100
Date:   Tue, 17 Dec 2019 15:19:43 +0100
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        <linux-renesas-soc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v2 2/6] arm64: dts: renesas: r8a77961: Add GPIO nodes
Message-ID: <20191217141943.GD27250@vmlxhi-102.adit-jv.com>
References: <20191216124740.16647-1-geert+renesas@glider.be>
 <20191216124740.16647-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191216124740.16647-3-geert+renesas@glider.be>
X-Originating-IP: [10.72.93.66]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Mon, Dec 16, 2019 at 01:47:36PM +0100, Geert Uytterhoeven wrote:
> Add device nodes for the GPIO controllers on the Renesas R-Car M3-W+
> (r8a77961) SoC.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - No changes.
> 
> Test procedure (with "arm64: dts: renesas: r8a77961: Add RAVB node"):
>   1. "ifconfig eth0 1.2.3.4",
>   2. "watch grep e6052000.gpio /proc/interrupts",
>   3. See interrupt count increase when Ethernet link goes up.

Reviewed-by: Eugeniu Rosca <erosca@de.adit-jv.com>
Tested-by: Eugeniu Rosca <erosca@de.adit-jv.com>

-- 
Best Regards,
Eugeniu
