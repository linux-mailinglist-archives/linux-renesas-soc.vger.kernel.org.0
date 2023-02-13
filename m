Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12859694535
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Feb 2023 13:07:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbjBMMHN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Feb 2023 07:07:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbjBMMHJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2023 07:07:09 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B5651A4A1;
        Mon, 13 Feb 2023 04:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676290011; x=1707826011;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Zr2mLcaaL914JIKCIkb6KBR4+Lt/OPVvMOM7MFZ4Yr0=;
  b=XvaZM2g8VcS03+V+9bGD+voR04r7969Sv6VE46lvM/+IsldoE/LEMpuH
   yBvS1UjKCyamOvTIviktuQIq89NAtOe4+620d+gJ0skaXTPuLns55KjSd
   Bwn8ZTiQypCE8uyUBBFF+M/U7fLL2wJ5rrfXMEW/V+21AI3HKwLpASAFn
   dKhWdm7PQskpFT9Boj7AFSUmA5E4MNxNPLJMyMjsYUm34dvyQdNRPAw+a
   uMYvDvz2wP7HFGX/ig46GWHhGAqYgIeUx8oViBa/pBjtEKfJWO5sApxR2
   FWzfgTm9jqwbPkYiLcK+FsI1WrJDGjM6+vZDlKhjuX/vulk5jALcGC8Hi
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="395487001"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="395487001"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 04:05:36 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="757559525"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="757559525"
Received: from hdevries-mobl.ger.corp.intel.com ([10.249.36.140])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 04:05:28 -0800
Date:   Mon, 13 Feb 2023 14:05:25 +0200 (EET)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
cc:     Jiri Slaby <jirislaby@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        =?ISO-8859-15?Q?Niklas_S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-serial <linux-serial@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to struct
 serial8250_em_hw_info
In-Reply-To: <OS0PR01MB59227AE1C2A89B75DFBF8F8286DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Message-ID: <c2e6e9c4-9342-45df-401e-8dffa881e8@linux.intel.com>
References: <20230210203439.174913-1-biju.das.jz@bp.renesas.com> <20230210203439.174913-4-biju.das.jz@bp.renesas.com> <56b431df-be7f-474c-8cf5-30c2eaa2745a@linux.intel.com> <OS0PR01MB5922A860B77A9BC0C9E5E3AC86DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <cc7f4d69-7e68-0d0a-4b89-c4e16dff716b@kernel.org> <56c8fdab-a037-ea00-d83e-f75c92566d92@kernel.org> <f10bcddd-2905-3f63-dd0a-8424798932dc@kernel.org> <OS0PR01MB592210E15CD943F1987316F086DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <283b2e79-e992-dc35-2a79-feccc93103fb@kernel.org> <OS0PR01MB5922139BA73BBBE2556161DA86DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com> <4cfed9ad-bf89-7b1-40cd-7def4c64f1@linux.intel.com>
 <OS0PR01MB59227AE1C2A89B75DFBF8F8286DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 13 Feb 2023, Biju Das wrote:

> Hi Ilpo,
> 
> Thanks for the feedback.
> 
> > Subject: RE: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to struct
> > serial8250_em_hw_info
> > 
> > On Mon, 13 Feb 2023, Biju Das wrote:
> > 
> > > Hi Jiri Slaby,
> > >
> > > Thanks for the feedback.
> > >
> > > > Subject: Re: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to
> > > > struct serial8250_em_hw_info
> > > >
> > > > On 13. 02. 23, 10:31, Biju Das wrote:
> > > > > So looks like similar to other macros, UART_FCR_EM (0x3) is sensible
> > one.
> > > > >
> > > > > UART_FCR_RO_OFFSET (9)
> > > > > UART_FCR_RO_EM (UART_FCR_EM + UART_FCR_RO_OFFSET)
> > > > >
> > > > >
> > > > > static unsigned int serial8250_em_serial_in(struct uart_port *p,
> > > > > int
> > > > > offset) case UART_FCR_RO_EM:
> > > > > 	return readl(p->membase + (offset - UART_FCR_RO_OFFSET << 2));
> > > >
> > > >
> > > > Please send a complete patch as a reply. I am completely lost now.
> > >
> > > Please find the complete patc.
> > >
> > >
> > > From e597ae60eb170c1f1b650e1e533bf4e12c09f822 Mon Sep 17 00:00:00 2001
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > > Date: Tue, 7 Feb 2023 15:07:13 +0000
> > > Subject: [PATCH] serial: 8250_em: Add serial_out() to struct
> > > serial8250_em_hw_info
> > >
> > > As per RZ/V2M hardware manual(Rev.1.30 Jun, 2022), UART IP has a
> > > restriction as mentioned below.
> > >
> > > 40.6.1 Point for Caution when Changing the Register Settings:
> > >
> > > When changing the settings of the following registers, a PRESETn
> > > master reset or FIFO reset + SW reset (FCR[2],FCR[1], HCR0[7]) must be
> > > input to re-initialize them.
> > >
> > > Target Registers: FCR, LCR, MCR, DLL, DLM, HCR0.
> > >
> > > This patch adds serial_out() to struct serial8250_em_hw_info to handle
> > > this difference between emma mobile and rz/v2m.
> > >
> > > DLL/DLM register can be updated only by setting LCR[7]. So the
> > > updation of LCR[7] will perform reset for DLL/DLM register changes.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > >  drivers/tty/serial/8250/8250_em.c | 70
> > > ++++++++++++++++++++++++++++++-
> > >  1 file changed, 69 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/tty/serial/8250/8250_em.c
> > > b/drivers/tty/serial/8250/8250_em.c
> > > index 69cd3b611501..c1c64f48ee7e 100644
> > > --- a/drivers/tty/serial/8250/8250_em.c
> > > +++ b/drivers/tty/serial/8250/8250_em.c
> > > @@ -17,12 +17,23 @@
> > >
> > >  #include "8250.h"
> > >
> > > +#define UART_FCR_EM 3
> > >  #define UART_DLL_EM 9
> > >  #define UART_DLM_EM 10
> > > +#define UART_HCR0_EM 11
> > > +
> > > +#define UART_FCR_R_EM	(UART_FCR_EM + UART_HCR0_EM)
> > 
> > It's easy to lose track of all this, IMHO this would be simple:
> > 
> > /*
> >  * A high value for UART_FCR_EM avoids overlapping with existing UART_*
> >  * register defines. UART_FCR_EM_HW is the real HW register offset.
> >  */
> > #define UART_FCR_EM 12
> 
> I will change it to #define UART_FCR_EM 14 
> 
> And will add the below unused HW status registers in the driver.
> 
> #define UART_HCR2_EM 12 (@30)
> #define UART_HCR3_EM 13 (@34)
> 
> Is it ok?

It's okay, that number is pseudo one anyway so the actual number doesn't 
matter. One could just as well pick some large number such as 0x10003 or
so if the collision with real regs is a concern.

-- 
 i.

