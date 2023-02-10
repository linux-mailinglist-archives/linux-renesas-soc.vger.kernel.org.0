Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01FEE691D69
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Feb 2023 11:59:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbjBJK7M (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Feb 2023 05:59:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232034AbjBJK7L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2023 05:59:11 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BAC95ACC8;
        Fri, 10 Feb 2023 02:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676026750; x=1707562750;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=O8bXsQb4w/Skhkys3z7+5CKQ+oX3S7PWShzRskTWV+g=;
  b=luBHg+ZJro08p634hYJQgAgpIFGxSa2g/dYbLcyo3WlIeBQnfpea/0NL
   N9RfSaDOx/qCQSyUU0EKMihMM7uL4zqhYUV8tVy87ddK22HeFKi2Q0H4u
   9QdBZ7orz2F8zvJXQrjJQ/P7mdKkjdo9aWszFaxkZt2xKtH0Y+URnQTyY
   dFPz+da/FGI6qEgxp7+X3L8n7m58RRtQAe6c819GcWxn5459PFv2+3Jf0
   QrkTC+QDO3Q7B9DzdrefXcylpJZMJYOb0fF+iCAcuymx9uZsB3YH0Pjoi
   txzJC9SGHZHQfK3Lb5RDuA7KAdmvcgL33Lt1FiLV8v/kT/VgbTMs8M9if
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="392794602"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="392794602"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 02:59:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="661375161"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="661375161"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 10 Feb 2023 02:59:05 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pQR7O-0050yn-33;
        Fri, 10 Feb 2023 12:59:02 +0200
Date:   Fri, 10 Feb 2023 12:59:02 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Eric Tremblay <etremblay@distech-controls.com>,
        Wander Lairson Costa <wander@redhat.com>,
        linux-serial <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/3] serial: 8250: Identify Renesas RZ/V2M 16750 UART
Message-ID: <Y+YjdghwT2msRriZ@smile.fi.intel.com>
References: <20230209132630.194947-1-biju.das.jz@bp.renesas.com>
 <20230209132630.194947-2-biju.das.jz@bp.renesas.com>
 <4470e054-ebe6-b3ca-ffd7-1c7c3ae09f1a@linux.intel.com>
 <OS0PR01MB5922AC5FF10FFF5F8590B8AA86D99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Y+VrOGR+7LbBMahz@smile.fi.intel.com>
 <OS0PR01MB5922C55E79014C84C742AE0886DE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OS0PR01MB5922C55E79014C84C742AE0886DE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Feb 10, 2023 at 07:14:54AM +0000, Biju Das wrote:
> > Subject: Re: [PATCH 1/3] serial: 8250: Identify Renesas RZ/V2M 16750 UART
> > On Thu, Feb 09, 2023 at 02:28:55PM +0000, Biju Das wrote:
> > > > From: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > > > Sent: Thursday, February 9, 2023 2:09 PM On Thu, 9 Feb 2023, Biju
> > > > Das wrote:

...

> > > > > +	[PORT_16750] = {
> > > > > +		.name		= "Renesas RZ/V2M 16750",
> > > > > +		.fifo_size	= 64,
> > > > > +		.tx_loadsz	= 64,
> > > > > +		.fcr		= UART_FCR_ENABLE_FIFO | UART_FCR_R_TRIG_10 |
> > > > > +				  UART_FCR7_64BYTE,
> > > > > +		.rxtrig_bytes	= {1, 16, 32, 56},
> > > > > +		.flags		= UART_CAP_FIFO | UART_CAP_AFE,
> > > > > +	},
> > > >
> > > > Eh, how can you reuse [PORT_16750] again in the initializer like that?
> > >
> > > Oops. Missed it. Is it ok to introduce PORT_RENESAS_16750_F64 instead
> > > as PORT_16750 is used by TI16750?
> > 
> > What the difference to the 16750 from TI that prevents you from using it?
> 
> Mostly it is identical.
> 
> The main difference is detection method, and we don't have UART_IERX_SLEEP bit in IER.
> 
> On TI, it sets bit 5 of the IIR when 64-byte FIFO mode is enabled when DLAB is set.
> 
> Whereas in our case DLAB does n't have any role for Identification, 
> 
> It set bit 5 of the IIR when 64 byte FIFO mode is enabled.
> and it clears bit 5 of the IIR when 64 byte FIFO mode is disabled.

So the question here is do these minor deviations affect the actual functionality?

Note, on Intel hardware we use directly TI16750 while we have no sleep
functionality available IIRC. Ilpo may correct me if I'm wrong.

> Other than that, when I use PORT_16750 type and capabilities in 8250_em driver and 
> add identification method for Renesas UART in 8250_port driver,
> 
> It detected as PORT_16750 UART, but I get below prints during autoconf which is confusing for the end user
> 
> [    0.214926] serial8250-em a4040000.serial: detected caps 00000900 should be 00000d00
> [    0.214975] a4040000.serial: ttyS0 at MMIO 0xa4040000 (irq = 24, base_baud = 3000000) is a TI16750
> 
> 
> Modification in 8250_em driver
> 
> +		    up.port.type = PORT_16750;
> +               up.port.name            = "Renesas RZ/V2M 16750";
> +               up.port.fifosize        = 64;
> +               up.tx_loadsz = 64;
> +               up.capabilities = UART_CAP_FIFO | UART_CAP_AFE;
> 
> Identification method in 8250_port.c driver
> 
> +       /*
> +        * No EFR.  Try to detect a Renesas RZ/V2M 16750, which only sets bit 5
> +        * of the IIR when 64 byte FIFO mode is enabled.
> +        * Try setting/clear bit5 of FCR.
> +        */
> +       serial_out(up, UART_FCR, UART_FCR_ENABLE_FIFO);
> +       status1 = serial_in(up, UART_IIR) & (UART_IIR_64BYTE_FIFO | UART_IIR_FIFO_ENABLED);
> +
> +       serial_out(up, UART_FCR, UART_FCR_ENABLE_FIFO | UART_FCR7_64BYTE);
> +       status2 = serial_in(up, UART_IIR) & (UART_IIR_64BYTE_FIFO | UART_IIR_FIFO_ENABLED);
> +
> +       if (status1 == UART_IIR_FIFO_ENABLED_16550A &&
> +           status2 == (UART_IIR_64BYTE_FIFO | UART_IIR_FIFO_ENABLED_16550A)) {
> +               up->port.type = PORT_16750;
> +               up->capabilities |= UART_CAP_AFE;
> +               return;
> +       }

What I don't like is increasing quirks in the 8250_port. Can't you simply use FIXED_PORT facility?
Again, look how 8250_mid is written.

-- 
With Best Regards,
Andy Shevchenko


