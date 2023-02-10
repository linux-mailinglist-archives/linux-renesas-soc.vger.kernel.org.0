Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 830E869204C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Feb 2023 14:56:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232159AbjBJN4l (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Feb 2023 08:56:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231902AbjBJN4l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2023 08:56:41 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E9541CAE3;
        Fri, 10 Feb 2023 05:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676037400; x=1707573400;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=v8NE3/F8qgvoNCANg6oXXPOIUamxd7g40DX5qbhdbyQ=;
  b=AVPD3DT6Pwv0LgCkdjTHXKLyirOEwKDSPARggMSc/IoqpTXrsikurJY9
   SBRU1iWJCKpmyodOrKIl/FuljIf9Tez5mmReHHBYIFWkEoxHzrrJawWMH
   7PjVLvK5u8fwtY4Kd3fOXCRF8dqaRDR+RiZbejbxMDG5zA9uj8UIKjvm5
   M/nLQEal/SfkKT/3Rp/7k86IWcfLYLQ2Uq0wYgh6F7Hn3tOryEkihT0Hg
   PyxdhKvAk9XiFmYo4ACgMMZ5o/hpuyvSRTFmG4OB+mAAERJ8eXRPmCjHG
   CFIoRaodnX6CdH6j3Fjjfu5+T6VvXB8D/uHpO/Tx/1Jv/bIEdnQ9aM1H/
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="395029302"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="395029302"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 05:56:39 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="776930791"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="776930791"
Received: from tnemeth-mobl1.ger.corp.intel.com ([10.251.213.60])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 05:56:36 -0800
Date:   Fri, 10 Feb 2023 15:56:34 +0200 (EET)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 3/3] serial: 8250_em: Add serial8250_rzv2m_reg_update()
In-Reply-To: <OS0PR01MB5922F0B044AC56675BE5E6A786DE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Message-ID: <732c82a0-6421-6a65-f6ac-6ac846f9f4@linux.intel.com>
References: <20230209132630.194947-1-biju.das.jz@bp.renesas.com> <20230209132630.194947-4-biju.das.jz@bp.renesas.com> <CAMuHMdUXyM52qK1=yPq10i9n2apqO_Xvkvbvo6m5pYQebrJ7DQ@mail.gmail.com>
 <OS0PR01MB5922F0B044AC56675BE5E6A786DE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
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

On Fri, 10 Feb 2023, Biju Das wrote:

> Hi Geert,
> 
> Thanks for the feedback.
> 
> > Subject: Re: [PATCH 3/3] serial: 8250_em: Add serial8250_rzv2m_reg_update()
> > 
> > Hi Biju,
> > 
> > On Thu, Feb 9, 2023 at 2:30 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > As per HW manual section 40.6.1, we need to perform FIFO reset + SW
> > > reset before updating the below registers
> > >
> > > FCR[7:5], FCR[3:0], LCR[7][5:0], MCR[6:4], DLL[7:0], DLM[7:0] and
> > > HCR0[6:5][3:2].
> > >
> > > This patch adds serial8250_rzv2m_reg_update() to handle it.
> > >
> > > DLL/DLM register can be updated only by setting LCR[7]. So the
> > > updation of LCR[7] will perform reset for DLL/DLM register changes.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > 
> > Thanks for your patch!
> > 
> > > --- a/drivers/tty/serial/8250/8250_em.c
> > > +++ b/drivers/tty/serial/8250/8250_em.c
> > 
> > > @@ -111,6 +156,10 @@ static int serial8250_em_probe(struct platform_device
> > *pdev)
> > >         up.port.uartclk = clk_get_rate(priv->sclk);
> > >
> > >         up.port.iotype = UPIO_MEM32;
> > > +
> > > +       if (of_device_is_compatible(dev->of_node, "renesas,r9a09g011-
> > uart"))
> > > +               priv->is_rzv2m = true;
> > 
> > Please add an entry to serial8250_em_dt_ids[] instead, providing a feature
> > flag in of_device_id.data.
> 
> OK, will add a feature flag in next version.

> > > +
> > >         up.port.serial_in = serial8250_em_serial_in;
> > >         up.port.serial_out = serial8250_em_serial_out;

AFAICT, you don't need the feature flag at all. Just provide a different 
.serial_out function for this device that handles your special registers 
(and make that handler call serial8250_em_serial_out() when the write is 
into other regs than those special ones).


-- 
 i.

