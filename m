Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80977FC5E8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Nov 2019 13:08:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbfKNMIJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Nov 2019 07:08:09 -0500
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:55409 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbfKNMIJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Nov 2019 07:08:09 -0500
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id DD47E3C009C;
        Thu, 14 Nov 2019 13:08:05 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id JyTmefpBvXvn; Thu, 14 Nov 2019 13:08:00 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 6B1353C04C0;
        Thu, 14 Nov 2019 13:08:00 +0100 (CET)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Thu, 14 Nov
 2019 13:08:00 +0100
Date:   Thu, 14 Nov 2019 13:07:57 +0100
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
CC:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v2 2/2] phy: Renesas R-Car gen3 PCIe PHY driver
Message-ID: <20191114120757.GA20979@vmlxhi-102.adit-jv.com>
References: <04384ce6-b696-715d-2072-345654e3fccf@cogentembedded.com>
 <9e69a1ea-b52b-4295-c898-e1ac4df26f97@cogentembedded.com>
 <20191104132743.GA13342@vmlxhi-102.adit-jv.com>
 <48467080-9c49-fd64-c39a-6e379f21b639@cogentembedded.com>
 <20191106121051.GA6564@vmlxhi-102.adit-jv.com>
 <dffb5706-035a-98fc-fa24-98d550a45454@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dffb5706-035a-98fc-fa24-98d550a45454@cogentembedded.com>
User-Agent: Mutt/1.12.1+40 (7f8642d4ee82) (2019-06-28)
X-Originating-IP: [10.72.93.184]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sergei,

On Wed, Nov 13, 2019 at 02:51:48PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 11/06/2019 03:10 PM, Eugeniu Rosca wrote:
> 
>    Sorry for a late reply -- I'm on vacation.

No worries. Please, enjoy your vacation :)

> [...]
> >>>> This PHY is  still  mostly undocumented -- the only documented registers
> >>>> exist on R-Car V3H (R8A77980) SoC where this PHY stays in a powered-down
> >>>> state after a reset and thus  we  must power it up for PCIe to work...
> >>>
> >>> Indeed, this [1] PCIE PHY driver looks entirely V3H-focused and looking
> >>> at the "Table 54.5 PCIE Controller Phy Register Configuration" in Rcar3
> >>> HW User’s Manual Rev.2.00 Jul 2019, _all_ except one PCIE PHY register
> >>> (PHY_CLK_RST) exist on V3H and no other Rcar3 SoC.
> >>>
> >>> So, except PHY_CLK_RST, this driver appears to be doomed to R8A77980.
> >>> Ironically, PHY_CLK_RST is exactly the register we now need to manage
> >>> to implement "Internal Reference Clock Supply" (HW man Chapter 54.3.14).
> >>
> >>    Do you have in mind a working approach to switch internal/external clocks?
> >> phy_set_mode()?
> > 
> > Thanks to Andrew (CC), the approach is to implement a new binding
> > "use-internal-reference-clock" and, based on its setting in DT,
> 
>    So boolean prop... should be OK.
> 
> > write the appropriate value (0) into the PHY_REF_USE_PAD bit of
> > PHY_CLK_RST register, just as described in Chapter "54.3.14 Internal
> > Reference Clock Supply" of R-Car3 HW manual. We don't employ the
> > generic phy_set_mode().
> > 
> > If you are fine with this approach, then we will try to find some time
> > to push Andrew's patches to you in the following days.
> 
> >>> Just to avoid any surprises on our side, do you see any issues in
> >>> extending the driver to the whole R-Car3 family, even if only for the
> >>> sake of controlling the non-V3H PHY_CLK_RST register?
> >>
> >>    Depends on the previous question...
> 
>    Wait, I don't see why we should support all the family. The PCIe PHY
> registers don't exist on each member of the family, according to the
> manual. Please continue using the chip spoecific "compatible" prop.

Given the "phy-rcar-gen3-pcie.c" driver name, I would expect that
enriching its behavior with Gen3 non-V3H functionality is legitimate.
Hope to see your review comments when the series is submitted. TIA.

> 
> >>> [1] 2ce7f2f425ef74 ("phy: Renesas R-Car gen3 PCIe PHY driver")
> 
> MBR, Sergei

-- 
Best Regards,
Eugeniu
