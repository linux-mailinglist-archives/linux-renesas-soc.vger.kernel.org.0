Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E05FE69AC0D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Feb 2023 14:03:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbjBQNDV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Feb 2023 08:03:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbjBQNDU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Feb 2023 08:03:20 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B71046143;
        Fri, 17 Feb 2023 05:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676638999; x=1708174999;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=IivhgqXhfkqnz3wEeLe3aDqxja2OcvnxD60kFA01J1o=;
  b=ggKwaEmO102X/xX/ZPdbpM1JSynYVdJCAdLV5eM105HIkcqTZWzVtrnq
   Ucub0xmGa1uqAzSwD/aisawfrVivv6RYnOFWwgjy4ifek/a/WZZrXEXNL
   be71zl0seMdLjez/CUGYBDZueazIbgtwqMLEkFC5bUQGpN3DwRuXRyoHe
   2te7+C4cWTD9MagmzCx/X4Hq3wDpnSQlc0tpAgIafIh/fyw3ji6GJ6pYs
   4K0+mxUl+r6dOo6KWkUN51UZ3N3iMLiMI1ImUfBLPV9eMb1rQtcae4jPF
   IDeQhjVSVOSpTmf3iqy5lw/SuJi2qynVHgk7f+6noJGz87JB9eKTRRp22
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="311613706"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="311613706"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 05:03:19 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="672577627"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="672577627"
Received: from aleste1x-mobl2.ger.corp.intel.com ([10.252.41.242])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 05:03:16 -0800
Date:   Fri, 17 Feb 2023 15:03:14 +0200 (EET)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?ISO-8859-15?Q?Niklas_S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 5/6] serial: 8250_em: Use pseudo offset for UART_FCR
In-Reply-To: <OS0PR01MB59224C91EE2092455083317886A19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Message-ID: <cbf1de8-4b49-fc18-695c-542b75b1ee96@linux.intel.com>
References: <20230217114255.226517-1-biju.das.jz@bp.renesas.com> <20230217114255.226517-6-biju.das.jz@bp.renesas.com> <a893f031-b08a-638a-70e0-3e6e37e9954c@linux.intel.com> <OS0PR01MB5922EA33B354EB2B31680AB686A19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <1e8b1e7-5f3e-61be-dd65-8d5da7ca14d2@linux.intel.com> <OS0PR01MB5922B4904BB49D53968AE42D86A19@OS0PR01MB5922.jpnprd01.prod.outlook.com> <b75da8c8-6f91-c227-6fdb-6b4fdbe6d3c@linux.intel.com>
 <OS0PR01MB59224C91EE2092455083317886A19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-273400355-1676638998=:3134"
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-273400355-1676638998=:3134
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT

On Fri, 17 Feb 2023, Biju Das wrote:

> Hi Ilpo,
> 
> Thanks for the feedback.
> 
> > Subject: RE: [PATCH v4 5/6] serial: 8250_em: Use pseudo offset for UART_FCR
> > 
> > On Fri, 17 Feb 2023, Biju Das wrote:
> > 
> > > HI Ilpo,
> > >
> > > > Subject: RE: [PATCH v4 5/6] serial: 8250_em: Use pseudo offset for
> > > > UART_FCR
> > > >
> > > > On Fri, 17 Feb 2023, Biju Das wrote:
> > > >
> > > > > Hi Ilpo,
> > > > >
> > > > > Thanks for the feedback.
> > > > >
> > > > > > Subject: Re: [PATCH v4 5/6] serial: 8250_em: Use pseudo offset
> > > > > > for UART_FCR
> > > > > >
> > > > > > On Fri, 17 Feb 2023, Biju Das wrote:
> > > > > >
> > > > > > > UART_FCR shares the same offset with UART_IIR. We cannot use
> > > > > > > UART_FCR in serial8250_em_serial_in() as it overlaps with
> > UART_IIR.
> > > > > > >
> > > > > > > This patch introduces a macro UART_FCR_EM with a high value to
> > > > > > > avoid overlapping with existing UART_* register defines.
> > > > > > >
> > > > > > > This will help us to use UART_FCR_EM consistently in
> > > > > > > serial8250_em_ serial{_in/_out} function to read/write FCR
> > register.
> > > > > > >
> > > > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > > > Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > > > > > > ---
> > > > > > > v4:
> > > > > > >  * New patch. Used UART_FCR_EM for read/write of FCR register.
> > > > > > > ---
> > > > > > >  drivers/tty/serial/8250/8250_em.c | 13 ++++++++++++-
> > > > > > >  1 file changed, 12 insertions(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/drivers/tty/serial/8250/8250_em.c
> > > > > > > b/drivers/tty/serial/8250/8250_em.c
> > > > > > > index 499d7a8847ec..4165fd3bb17a 100644
> > > > > > > --- a/drivers/tty/serial/8250/8250_em.c
> > > > > > > +++ b/drivers/tty/serial/8250/8250_em.c
> > > > > > > @@ -19,6 +19,13 @@
> > > > > > >  #define UART_DLL_EM 9
> > > > > > >  #define UART_DLM_EM 10
> > > > > > >
> > > > > > > +/*
> > > > > > > + * A high value for UART_FCR_EM avoids overlapping with
> > > > > > > +existing
> > > > > > > +UART_*
> > > > > > > + * register defines. UART_FCR_EM_HW is the real HW register
> > offset.
> > > > > > > + */
> > > > > > > +#define UART_FCR_EM 0x10003
> > > > > > > +#define UART_FCR_EM_HW 3
> > > > > > > +
> > > > > > >  struct serial8250_em_priv {
> > > > > > >  	int line;
> > > > > > >  };
> > > > > > > @@ -29,12 +36,14 @@ static void
> > > > > > > serial8250_em_serial_out(struct uart_port
> > > > > > *p, int offset, int value)
> > > > > > >  	case UART_TX: /* TX @ 0x00 */
> > > > > > >  		writeb(value, p->membase);
> > > > > > >  		break;
> > > > > > > -	case UART_FCR: /* FCR @ 0x0c (+1) */
> > > > > >
> > > > > > 8250_port wants this to remain in place, I think. Otherwise it's
> > > > > > attempts to set UART_FCR will end up into wrong destination.
> > > > >
> > > > > Oops, next patch has this change.
> > > > >
> > > > > +	case UART_FCR:
> > > > > +		serial8250_em_reg_update(p, UART_FCR_EM, value);
> > > > >
> > > > > I just need to keep UART_FCR for this patch and remove it from
> > > > > "serial8250_em_serial_out_helper" on the next patch
> > > >
> > > > IMHO, the extra layer + _helper seems pretty unnecessary. I don't
> > > > see any useful thing it achieves over just having to serial_out
> > functions.
> > >
> > > Without helper, it will become cyclic right??
> > >
> > > serial8250_em_serial_out() needs to call serial8250_em_reg_update()
> > >
> > > serial8250_em_reg_update() will call serial8250_em_serial_out() for
> > writes??
> > 
> > With your most recent code, yes it seems to happen. But why did you remove
> > the separate serial_out for RZ. There wasn't any cyclicness when it called
> > serial8250_em_serial_out().
> > 
> > I'm a bit lost now, are you saying that this change is needed for all
> > devices 8250_em supports (which is different from what you initially
> > presented in the early versions of this patchset)?
> 
> Yes, That is correct. Please see the discussion thread related to this[1].
> 
> Geert pointed out that UART register sets between RZ/V2M and
> EMMA mobile SoC are almost identical.
> 
> "According to R19UH0040EJ0400 Rev.4.00 it is available on EMEV2, and the
> layout looks identical to RZ/V2M."
> 
> Niklas tested previous patch series on EMEV2 board and 
> It detected port type as 16750 and done read/write test
> with 64-bytes fifo enabled.
> 
> EMMA mobile SoC is very old and hardware manual
> is not updated for long time related.
> 
> So we guess it is safe to apply this restriction for this SoC
> aswell, since there is no regression.

Okay, fair enough.


-- 
 i.

--8323329-273400355-1676638998=:3134--
