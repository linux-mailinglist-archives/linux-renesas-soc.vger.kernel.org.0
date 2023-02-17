Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17DBC69AAAE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Feb 2023 12:46:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbjBQLqK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Feb 2023 06:46:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbjBQLqJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Feb 2023 06:46:09 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1492A5BD86;
        Fri, 17 Feb 2023 03:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676634369; x=1708170369;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Zm+4EKQx2z3zuZBraOYmSAbExRUhjUIrY4EO7Lm6hNM=;
  b=WY1vzqDOuhkat/0NkTh6eadagq0YMrRUNBlVYX4wzcb2RohoaUAwZUvh
   b0M8HdiyzkwFUM1Vr82jaTTa21sbdQweOxh6EcdeNPIOlUe8ThgRtnaue
   PCboebDV9A+Z81sTgU7l/n9ngU7A44PruM/nBgo/Nbdx7q1ETjo2dA1mg
   ODWNzo+hXkvs1MhjNSrO5mSPFTTblxVqHoeRC8W8SypLDSuwywuX4GXKT
   vhUUwtvGHoGGZ3+9V3w7Fv/ApulXbGXy/pc0j2i9PlFPRaQvPn43kK/ga
   cv0usSAvTsupxEKmdPzohhUbi3iQzAFapCDcG69I8bK/AY0wYxbY8xemn
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="320075309"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="320075309"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 03:46:08 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="670515919"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="670515919"
Received: from aleste1x-mobl2.ger.corp.intel.com ([10.252.41.242])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 03:46:06 -0800
Date:   Fri, 17 Feb 2023 13:46:03 +0200 (EET)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?ISO-8859-15?Q?Niklas_S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 5/6] serial: 8250_em: Use pseudo offset for UART_FCR
In-Reply-To: <20230217114255.226517-6-biju.das.jz@bp.renesas.com>
Message-ID: <a893f031-b08a-638a-70e0-3e6e37e9954c@linux.intel.com>
References: <20230217114255.226517-1-biju.das.jz@bp.renesas.com> <20230217114255.226517-6-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1507882132-1676634368=:3134"
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1507882132-1676634368=:3134
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 17 Feb 2023, Biju Das wrote:

> UART_FCR shares the same offset with UART_IIR. We cannot use
> UART_FCR in serial8250_em_serial_in() as it overlaps with
> UART_IIR.
> 
> This patch introduces a macro UART_FCR_EM with a high value to
> avoid overlapping with existing UART_* register defines.
> 
> This will help us to use UART_FCR_EM consistently in serial8250_em_
> serial{_in/_out} function to read/write FCR register.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> ---
> v4:
>  * New patch. Used UART_FCR_EM for read/write of FCR register.
> ---
>  drivers/tty/serial/8250/8250_em.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_em.c b/drivers/tty/serial/8250/8250_em.c
> index 499d7a8847ec..4165fd3bb17a 100644
> --- a/drivers/tty/serial/8250/8250_em.c
> +++ b/drivers/tty/serial/8250/8250_em.c
> @@ -19,6 +19,13 @@
>  #define UART_DLL_EM 9
>  #define UART_DLM_EM 10
>  
> +/*
> + * A high value for UART_FCR_EM avoids overlapping with existing UART_*
> + * register defines. UART_FCR_EM_HW is the real HW register offset.
> + */
> +#define UART_FCR_EM 0x10003
> +#define UART_FCR_EM_HW 3
> +
>  struct serial8250_em_priv {
>  	int line;
>  };
> @@ -29,12 +36,14 @@ static void serial8250_em_serial_out(struct uart_port *p, int offset, int value)
>  	case UART_TX: /* TX @ 0x00 */
>  		writeb(value, p->membase);
>  		break;
> -	case UART_FCR: /* FCR @ 0x0c (+1) */

8250_port wants this to remain in place, I think. Otherwise it's attempts 
to set UART_FCR will end up into wrong destination.

-- 
 i.


>  	case UART_LCR: /* LCR @ 0x10 (+1) */
>  	case UART_MCR: /* MCR @ 0x14 (+1) */
>  	case UART_SCR: /* SCR @ 0x20 (+1) */
>  		writel(value, p->membase + ((offset + 1) << 2));
>  		break;
> +	case UART_FCR_EM:
> +		writel(value, p->membase + (UART_FCR_EM_HW << 2));
> +		break;
>  	case UART_IER: /* IER @ 0x04 */
>  		value &= 0x0f; /* only 4 valid bits - not Xscale */
>  		fallthrough;
> @@ -54,6 +63,8 @@ static unsigned int serial8250_em_serial_in(struct uart_port *p, int offset)
>  	case UART_MSR: /* MSR @ 0x1c (+1) */
>  	case UART_SCR: /* SCR @ 0x20 (+1) */
>  		return readl(p->membase + ((offset + 1) << 2));
> +	case UART_FCR_EM:
> +		return readl(p->membase + (UART_FCR_EM_HW << 2));
>  	case UART_IER: /* IER @ 0x04 */
>  	case UART_IIR: /* IIR @ 0x08 */
>  	case UART_DLL_EM: /* DLL @ 0x24 (+9) */
> 

--8323329-1507882132-1676634368=:3134--
