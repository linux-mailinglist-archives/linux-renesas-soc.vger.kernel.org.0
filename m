Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FCCC69AAED
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Feb 2023 13:00:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbjBQMA2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Feb 2023 07:00:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbjBQMA1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Feb 2023 07:00:27 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB5DE644D2;
        Fri, 17 Feb 2023 04:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676635226; x=1708171226;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=QHzf2w0VmJpptgHR8mvf8UJREC75hhkXhPev1DzraSI=;
  b=T3Q9/njap4Kr45MVlFQY4ZOMK8ivqIpKSXPl140R6UWMIKMqGoL7UWqu
   WxrtjRYcKkDM4zvyZjUJ+/RzTRYU8YTToWfCw64ypb0CQPc18hrkhmkjY
   yHDWnGxT/h6dfQ0Wclh81KO5dtFO3sv4Jz7zhrY2u92/Ai8iWNOr0qWgV
   XmOoomn4dmEyO85vVjuopjScqAy0/ArNZuff0AA2VBU9eW6oYIuPgblC4
   nPDg+SEQX2cuDcm37j+JFhsP5DYGOrO9A8+5chAwhqIGeYLxUMHmyQbA/
   eADQVegAo4OH9k3/1dbPkP5OWdrGZSPfwRtGPJbrGJoiIhHOBJqtIyz9K
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="315685710"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="315685710"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 04:00:26 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="794383610"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="794383610"
Received: from aleste1x-mobl2.ger.corp.intel.com ([10.252.41.242])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 04:00:23 -0800
Date:   Fri, 17 Feb 2023 14:00:21 +0200 (EET)
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
In-Reply-To: <OS0PR01MB5922EA33B354EB2B31680AB686A19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Message-ID: <1e8b1e7-5f3e-61be-dd65-8d5da7ca14d2@linux.intel.com>
References: <20230217114255.226517-1-biju.das.jz@bp.renesas.com> <20230217114255.226517-6-biju.das.jz@bp.renesas.com> <a893f031-b08a-638a-70e0-3e6e37e9954c@linux.intel.com> <OS0PR01MB5922EA33B354EB2B31680AB686A19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-935927437-1676635226=:3134"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-935927437-1676635226=:3134
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Fri, 17 Feb 2023, Biju Das wrote:

> Hi Ilpo,
> 
> Thanks for the feedback.
> 
> > Subject: Re: [PATCH v4 5/6] serial: 8250_em: Use pseudo offset for UART_FCR
> > 
> > On Fri, 17 Feb 2023, Biju Das wrote:
> > 
> > > UART_FCR shares the same offset with UART_IIR. We cannot use UART_FCR
> > > in serial8250_em_serial_in() as it overlaps with UART_IIR.
> > >
> > > This patch introduces a macro UART_FCR_EM with a high value to avoid
> > > overlapping with existing UART_* register defines.
> > >
> > > This will help us to use UART_FCR_EM consistently in serial8250_em_
> > > serial{_in/_out} function to read/write FCR register.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > > ---
> > > v4:
> > >  * New patch. Used UART_FCR_EM for read/write of FCR register.
> > > ---
> > >  drivers/tty/serial/8250/8250_em.c | 13 ++++++++++++-
> > >  1 file changed, 12 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/tty/serial/8250/8250_em.c
> > > b/drivers/tty/serial/8250/8250_em.c
> > > index 499d7a8847ec..4165fd3bb17a 100644
> > > --- a/drivers/tty/serial/8250/8250_em.c
> > > +++ b/drivers/tty/serial/8250/8250_em.c
> > > @@ -19,6 +19,13 @@
> > >  #define UART_DLL_EM 9
> > >  #define UART_DLM_EM 10
> > >
> > > +/*
> > > + * A high value for UART_FCR_EM avoids overlapping with existing
> > > +UART_*
> > > + * register defines. UART_FCR_EM_HW is the real HW register offset.
> > > + */
> > > +#define UART_FCR_EM 0x10003
> > > +#define UART_FCR_EM_HW 3
> > > +
> > >  struct serial8250_em_priv {
> > >  	int line;
> > >  };
> > > @@ -29,12 +36,14 @@ static void serial8250_em_serial_out(struct uart_port
> > *p, int offset, int value)
> > >  	case UART_TX: /* TX @ 0x00 */
> > >  		writeb(value, p->membase);
> > >  		break;
> > > -	case UART_FCR: /* FCR @ 0x0c (+1) */
> > 
> > 8250_port wants this to remain in place, I think. Otherwise it's attempts to
> > set UART_FCR will end up into wrong destination.
> 
> Oops, next patch has this change.
> 
> +	case UART_FCR:
> +		serial8250_em_reg_update(p, UART_FCR_EM, value);
> 
> I just need to keep UART_FCR for this patch and 
> remove it from "serial8250_em_serial_out_helper" on the next patch

IMHO, the extra layer + _helper seems pretty unnecessary. I don't see any 
useful thing it achieves over just having to serial_out functions.

-- 
 i.

--8323329-935927437-1676635226=:3134--
