Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73F60EE117
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2019 14:27:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727891AbfKDN1y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Nov 2019 08:27:54 -0500
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:46415 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727236AbfKDN1y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Nov 2019 08:27:54 -0500
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 898223C04C0;
        Mon,  4 Nov 2019 14:27:52 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 4eVQyz9cHzbA; Mon,  4 Nov 2019 14:27:46 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id D684C3C00BF;
        Mon,  4 Nov 2019 14:27:46 +0100 (CET)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Mon, 4 Nov 2019
 14:27:46 +0100
Date:   Mon, 4 Nov 2019 14:27:43 +0100
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
CC:     Kishon Vijay Abraham I <kishon@ti.com>,
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v2 2/2] phy: Renesas R-Car gen3 PCIe PHY driver
Message-ID: <20191104132743.GA13342@vmlxhi-102.adit-jv.com>
References: <04384ce6-b696-715d-2072-345654e3fccf@cogentembedded.com>
 <9e69a1ea-b52b-4295-c898-e1ac4df26f97@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9e69a1ea-b52b-4295-c898-e1ac4df26f97@cogentembedded.com>
User-Agent: Mutt/1.12.1+40 (7f8642d4ee82) (2019-06-28)
X-Originating-IP: [10.72.93.184]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Sergei,
Cc: Geert, Shimoda-san, Marek

On Sun, Jun 10, 2018 at 09:24:13PM +0300, Sergei Shtylyov wrote:
> This PHY is  still  mostly undocumented -- the only documented registers
> exist on R-Car V3H (R8A77980) SoC where this PHY stays in a powered-down
> state after a reset and thus  we  must power it up for PCIe to work...

Indeed, this [1] PCIE PHY driver looks entirely V3H-focused and looking
at the "Table 54.5 PCIE Controller Phy Register Configuration" in Rcar3
HW User’s Manual Rev.2.00 Jul 2019, _all_ except one PCIE PHY register
(PHY_CLK_RST) exist on V3H and no other Rcar3 SoC.

So, except PHY_CLK_RST, this driver appears to be doomed to R8A77980.
Ironically, PHY_CLK_RST is exactly the register we now need to manage
to implement "Internal Reference Clock Supply" (HW man Chapter 54.3.14).

Just to avoid any surprises on our side, do you see any issues in
extending the driver to the whole R-Car3 family, even if only for the
sake of controlling the non-V3H PHY_CLK_RST register?

[1] 2ce7f2f425ef74 ("phy: Renesas R-Car gen3 PCIe PHY driver")

-- 
Best Regards,
Eugeniu
