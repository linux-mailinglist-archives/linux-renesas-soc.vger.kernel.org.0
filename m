Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCB62694073
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Feb 2023 10:13:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230222AbjBMJNF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Feb 2023 04:13:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230242AbjBMJNE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2023 04:13:04 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73DA9B452;
        Mon, 13 Feb 2023 01:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676279583; x=1707815583;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Yypa7epJSsAj/Y8+3WLkA1i/hLUEILpbdZUE5IksfAw=;
  b=kkt6t8DBdewUUO+ODwPKSqoIufxEY1NQImcUOJ+1AxYGgIZ0GuZ6w9h4
   r+VL1cIT9fTW7nShYEKdI4gs2xKwLVHbuP4GIfeswwIj4/t3cGXsrWsPe
   dyQVZQVdCbErKtapHSgWoRDJIAQ7h+fU8Zx6GUjiMq8dI/iaNl3WiAi4y
   RMaiQUGJL4UZEJrm8rEymN49dRrLa9poip5zeXir/0BtjP8lbpLmDj+fq
   HDQXabORkcwcqZiqvzTCDU+KxK+/1NPyXDwQN6cmBGFQ6wCWRdDfKKEUr
   8xJKLtTDA9gY+Z+Izsjuy4+azilq6IEY+kDSdJtalRly5vWEwKTg67jfc
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="318872708"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="318872708"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 01:13:02 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="792654053"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="792654053"
Received: from hdevries-mobl.ger.corp.intel.com ([10.249.36.140])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 01:13:00 -0800
Date:   Mon, 13 Feb 2023 11:12:57 +0200 (EET)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to struct
 serial8250_em_hw_info
In-Reply-To: <OS0PR01MB5922A860B77A9BC0C9E5E3AC86DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Message-ID: <8585f736-cf3b-b63c-753f-892d4051ada3@linux.intel.com>
References: <20230210203439.174913-1-biju.das.jz@bp.renesas.com> <20230210203439.174913-4-biju.das.jz@bp.renesas.com> <56b431df-be7f-474c-8cf5-30c2eaa2745a@linux.intel.com> <OS0PR01MB5922A860B77A9BC0C9E5E3AC86DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 13 Feb 2023, Biju Das wrote:

> HI Ilpo,
> 
> Thanks for the feedback.
> 
> > Subject: Re: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to struct
> > serial8250_em_hw_info
> > 
> > On Fri, 10 Feb 2023, Biju Das wrote:
> > 
> > > As per HW manual section 40.6.1, we need to perform FIFO reset + SW
> > > reset before updating the below registers.
> > >
> > > FCR[7:5], FCR[3:0], LCR[7][5:0], MCR[6:4], DLL[7:0], DLM[7:0] and
> > > HCR0[6:5][3:2].
> > >
> > > This patch adds serial_out() to struct serial8250_em_hw_info to handle
> > > this difference between emma mobile and rz/v2m.
> > >
> > > DLL/DLM register can be updated only by setting LCR[7]. So the
> > > updation of LCR[7] will perform reset for DLL/DLM register changes.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > v2->v3:
> > >  * Replaced readl/writel()->serial8250_em_serial_in/out() in
> > serial8250_rzv2m_
> > >    reg_update() to avoid duplication of offset trickery.
> > >  * Added support for HCR0 read/write in serial8250_em_{serial_in,
> > > serial_out}
> > >  * Added UART_LCR macro support in serial8250_em_serial_in() to read
> > > LCR
> > >  * Reordered serial8250_em_{serial_in, serial_out} above serial8250_rzv2m_
> > >    reg_update().
> > >  * Replaced priv->info->serial_out to info->serial_out.
> > > v1->v2:
> > >  * Added serial_out to struct serial8250_em_hw_info
> > > ---
> > >  drivers/tty/serial/8250/8250_em.c | 67
> > > ++++++++++++++++++++++++++++++-
> > >  1 file changed, 66 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/tty/serial/8250/8250_em.c
> > > b/drivers/tty/serial/8250/8250_em.c
> > > index 69cd3b611501..a90a5cc4234a 100644
> > > --- a/drivers/tty/serial/8250/8250_em.c
> > > +++ b/drivers/tty/serial/8250/8250_em.c
> > > @@ -19,10 +19,14 @@
> > >
> > >  #define UART_DLL_EM 9
> > >  #define UART_DLM_EM 10
> > > +#define UART_HCR0 11
> > > +
> > > +#define UART_HCR0_SW_RESET	BIT(7) /* SW Reset */
> > >
> > >  struct serial8250_em_hw_info {
> > >  	unsigned int type;
> > >  	upf_t flags;
> > > +	void (*serial_out)(struct uart_port *p, int off, int value);
> > >  };
> > >
> > >  struct serial8250_em_priv {
> > > @@ -46,6 +50,7 @@ static void serial8250_em_serial_out(struct uart_port
> > *p, int offset, int value)
> > >  		fallthrough;
> > >  	case UART_DLL_EM: /* DLL @ 0x24 (+9) */
> > >  	case UART_DLM_EM: /* DLM @ 0x28 (+9) */
> > > +	case UART_HCR0: /* HCR0 @ 0x2c */
> > >  		writel(value, p->membase + (offset << 2));
> > >  	}
> > >  }
> > > @@ -55,6 +60,7 @@ static unsigned int serial8250_em_serial_in(struct
> > uart_port *p, int offset)
> > >  	switch (offset) {
> > >  	case UART_RX: /* RX @ 0x00 */
> > >  		return readb(p->membase);
> > > +	case UART_LCR: /* LCR @ 0x10 (+1) */
> > >  	case UART_MCR: /* MCR @ 0x14 (+1) */
> > >  	case UART_LSR: /* LSR @ 0x18 (+1) */
> > >  	case UART_MSR: /* MSR @ 0x1c (+1) */ @@ -64,11 +70,68 @@ static
> > > unsigned int serial8250_em_serial_in(struct uart_port *p, int offset)
> > >  	case UART_IIR: /* IIR @ 0x08 */
> > >  	case UART_DLL_EM: /* DLL @ 0x24 (+9) */
> > >  	case UART_DLM_EM: /* DLM @ 0x28 (+9) */
> > > +	case UART_HCR0: /* HCR0 @ 0x2c */
> > >  		return readl(p->membase + (offset << 2));
> > >  	}
> > >  	return 0;
> > >  }
> > >
> > > +static void serial8250_rzv2m_reg_update(struct uart_port *p, int off,
> > > +int value) {
> > > +	unsigned int ier, fcr, lcr, mcr, hcr0;
> > > +
> > > +	ier = serial8250_em_serial_in(p, UART_IER);
> > > +	lcr = serial8250_em_serial_in(p, UART_LCR);
> > > +	mcr = serial8250_em_serial_in(p, UART_MCR);
> > > +	hcr0 = serial8250_em_serial_in(p, UART_HCR0);
> > > +	/*
> > > +	 * The value of UART_IIR and UART_FCR are 2, but corresponding
> > > +	 * RZ/V2M address offset are different(0x08 and 0x0c). So we need to
> > > +	 * use readl() here.
> > > +	 */
> > > +	fcr = readl(p->membase + ((UART_FCR + 1) << 2));
> > 
> > I don't get the meaning of that comment. It doesn't seem to match what your
> > code does as the code seemingly has nothing to do with IIR (and none of you
> > changelogs refer to IIR either)?
> 
> The generic macro UART_IIR and UART_FCR in linux/serial_reg.h has a value of 2.
> 
> The RZ/V2M register offset don't match with standard ones, we are doing remapping
> inside case statements in serial8250_em_serial_in() and serial8250_em_serial_out().
> 
> Currently IIR is already present in serial8250_em_serial_in(), so no issue.
> 
> But when I tried to add UART_FCR in case, it gives the compilation error.
> You cannot have same case values inside switch.
> 
> > 
> > Is the only reason for this that serial8250_em_serial_in() currently lacks
> > case UART_FCR: ? Why cannot that just be added there?
> 
> Yes, It gives build error. 

Ok, thanks for explaining. I guess adding case UART_FCR_EM: with 
the correct value has a risk colliding with UART_LCR reads? I'm actually a 
bit surprised serial8250_em_serial_in() doesn't map LCR at all.

One option would be to just invent some big (bogus) number for UART_FCR_EM 
and correct the offset in serial8250_em_serial_in() into 0x0c. And just
add a comment to the define that you cannot use the correct value to avoid
overlapping with existing register defines.

-- 
 i.

