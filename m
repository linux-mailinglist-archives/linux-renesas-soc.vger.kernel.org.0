Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA9E86EAAF9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Apr 2023 14:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231636AbjDUMxw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Apr 2023 08:53:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231617AbjDUMxu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Apr 2023 08:53:50 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A198AAD34;
        Fri, 21 Apr 2023 05:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682081629; x=1713617629;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=40yFO2isFfj0uBmtH69VPOZjEsJTEo1olV7IUMUdoNs=;
  b=jk7QBg4pMFhuquznAlYb0vMAKTUTBOBR7sxP9soWSsE5ZJIZ9lOUaCOc
   jCZuxfW4Mn9zgS6sLC6VYTQxUmLq459NcBlsqIujhtcIo1bko8qdqvMeO
   UwSn3yTEgUZEWcxrPkbNPXfz6XeyBgMEyz7HQA9ykYU2LUjUF5q1ByhYu
   OuBtMBR4Hur1dllfA2RlzsB2dvXz89GNjqob9XWUynPPX4T2a84U9TaQL
   f290AsyZ0ECOeK6y60Ms7GPgYqTdph2aE9oz0ZAbxF7jLe+BNlGSLmyRG
   zpBeMKzhAkks7UxlOURLEqR2nHVr7wYw8pArMZF37sjEq28GMcf3WwOv4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="408924037"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="408924037"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 05:53:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="724811655"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="724811655"
Received: from nram1-mobl.ger.corp.intel.com ([10.251.214.219])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 05:53:46 -0700
Date:   Fri, 21 Apr 2023 15:53:33 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-serial <linux-serial@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 5/5] tty: serial: sh-sci: Fix end of transmission on
 SCI
In-Reply-To: <CAMuHMdUQ05U9oiepVJsShg8xFoHTD6M7XczQ2=Qce+pE+0RPag@mail.gmail.com>
Message-ID: <1860434a-8915-3ea4-60e1-5f7d4598a16@linux.intel.com>
References: <20230412145053.114847-1-biju.das.jz@bp.renesas.com> <20230412145053.114847-6-biju.das.jz@bp.renesas.com> <CAMuHMdUQ05U9oiepVJsShg8xFoHTD6M7XczQ2=Qce+pE+0RPag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-352577639-1682080734=:1951"
Content-ID: <51b37d64-afdf-b262-3129-d2f41b4ba260@linux.intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-352577639-1682080734=:1951
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <97f35493-426e-62b5-86c9-6337f87dbc49@linux.intel.com>

On Fri, 21 Apr 2023, Geert Uytterhoeven wrote:

> Hi Biju,
> 
> On Wed, Apr 12, 2023 at 4:51 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > We need to set TE to "0" (i.e., disable serial transmission) to
> > get the expected behavior of the end of serial transmission.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Thanks for your patch!
> 
> > --- a/drivers/tty/serial/sh-sci.c
> > +++ b/drivers/tty/serial/sh-sci.c
> > @@ -847,6 +847,11 @@ static void sci_transmit_chars(struct uart_port *port)
> >                 } else if (!uart_circ_empty(xmit) && !stopped) {
> >                         c = xmit->buf[xmit->tail];
> >                         xmit->tail = (xmit->tail + 1) & (UART_XMIT_SIZE - 1);
> > +               } else if (port->type == PORT_SCI && uart_circ_empty(xmit)) {
> > +                       ctrl = serial_port_in(port, SCSCR);
> > +                       ctrl &= ~SCSCR_TE;
> > +                       serial_port_out(port, SCSCR, ctrl);
> > +                       return;
> 
> So nothing after the while loop should be done anymore?
> What about clearing SCSCR_TE in sci_stop_tx() (which is called after
> the while loop) instead?

Yes, this added fragment doesn't really seem to belong into the tx loop.

The right direction would be to aim towards converting the whole tx loop 
into using uart_port_tx_limited().

-- 
 i.

> >                 } else {
> >                         break;
> >                 }
> 
> So combined with my comments on patch 4/5, that would become
> 
> -    if (port->type == PORT_SCI)
> +    if (port->type == PORT_SCI) {
>              ctrl |= SCSCR_TEIE;
> +            ctrl &= ~SCSCR_TE;
> +    }
> 
> in sci_stop_tx().
--8323329-352577639-1682080734=:1951--
