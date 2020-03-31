Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9168A1995ED
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2020 14:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730358AbgCaMD6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 31 Mar 2020 08:03:58 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:38265 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730343AbgCaMD6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Mar 2020 08:03:58 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id C76CD3C0579;
        Tue, 31 Mar 2020 14:03:55 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ctrubKkXli8i; Tue, 31 Mar 2020 14:03:50 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 576853C00C0;
        Tue, 31 Mar 2020 14:03:50 +0200 (CEST)
Received: from lxhi-065.adit-jv.com (10.72.94.51) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 31 Mar
 2020 14:03:50 +0200
Date:   Tue, 31 Mar 2020 14:03:46 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        <linux-renesas-soc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77961: Add SCIF and HSCIF nodes
Message-ID: <20200331120346.GA27351@lxhi-065.adit-jv.com>
References: <20200327125926.22927-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200327125926.22927-1-geert+renesas@glider.be>
X-Originating-IP: [10.72.94.51]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Many thanks for your contribution.

On Fri, Mar 27, 2020 at 01:59:26PM +0100, Geert Uytterhoeven wrote:
> Add the device nodes for all SCIF and HSCIF serial ports on R-Car M3-W+.
> Add the missing DMA properties to the already-present SCIF2 node.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Eugeniu Rosca <erosca@de.adit-jv.com>

Boot-testing the M3-W+ Salvator-XS on renesas-devel-2020-03-23-v5.6-rc7:

* before the patch, I get:
e6e88000.serial: ttySC0 at MMIO 0xe6e88000 (irq = 103, base_baud = 0) is a scif

* after the patch:
e6550000.serial: ttySC1 at MMIO 0xe6550000 (irq = 26, base_baud = 0) is a hscif
e6e88000.serial: ttySC0 at MMIO 0xe6e88000 (irq = 104, base_baud = 0) is a scif

-- 
Best regards,
Eugeniu Rosca
