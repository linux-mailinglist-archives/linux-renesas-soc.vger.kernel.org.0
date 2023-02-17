Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 736DE69ADB6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Feb 2023 15:15:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbjBQOPX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Feb 2023 09:15:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230093AbjBQOPU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Feb 2023 09:15:20 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E8B46CA34;
        Fri, 17 Feb 2023 06:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676643290; x=1708179290;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HUK/OpozWeyqdfwcKz7LTVTi7r/UmDSFfWXIZ12l98Y=;
  b=OEuZ9vgjH1CJSEuxyz6YouJzBNtkqNvwTwJ/oz4+bg1hJprUxZwe2umf
   zTu3Xro1emNu1Ia/qLBP7EZ+S0MUWqnQkmGfmnIwTUmedvI6H03PYQuah
   JZjv/9meupQv2unRQSb32u4VtXHdXEPU57fwANWRl40+iVhuzmzd2mpLt
   eDlw69zX6AHxJkVRAmFvaBZ5QznA06+l6NZt8ITT1OqcalI7uMUqrlM9N
   /UIsQvmmmT0gpFdEa0RNIqSYCMTaT4sUe9ybKQOfW/fat1f4rmXpRYS8I
   sXDXDBaFB+E6oa3toMN8+NRPc8nZOFZFWYCm5nkIsXmYYI8/pF6v1PVSQ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="315707751"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="315707751"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 06:14:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="663878175"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="663878175"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 17 Feb 2023 06:14:03 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1pT1Uv-008EuO-2n;
        Fri, 17 Feb 2023 16:14:01 +0200
Date:   Fri, 17 Feb 2023 16:14:01 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 6/6] serial: 8250_em: Add
 serial8250_em_{reg_update(),out_helper()}
Message-ID: <Y++LqQIHuO8BGTm2@smile.fi.intel.com>
References: <20230217114255.226517-1-biju.das.jz@bp.renesas.com>
 <20230217114255.226517-7-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217114255.226517-7-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Feb 17, 2023 at 11:42:55AM +0000, Biju Das wrote:
> As per RZ/V2M hardware manual(Rev.1.30 Jun, 2022), UART IP has a
> restriction as mentioned below.
> 
> 40.6.1 Point for Caution when Changing the Register Settings:
> 
> When changing the settings of the following registers, a PRESETn master
> reset or FIFO reset + SW reset (FCR[2],FCR[1], HCR0[7]) must be input to
> re-initialize them.
> 
> Target Registers: FCR, LCR, MCR, DLL, DLM, HCR0.
> 
> This patch adds serial8250_em_reg_update() and serial8250_em_serial_
> out_helper to handle it.
> 
> DLL/DLM register can be updated only by setting LCR[7]. So the
> updation of LCR[7] will perform reset for DLL/DLM register changes.
> 
> EMMA mobile has the same register set as RZ/V2M and this patch is tested on
> EMEV2 board. So, there is no harm in applying the same restriction here as
> well as the HW manual for EMMA mobile is not updated for a long time.

...

> +	serial8250_em_serial_out_helper(p, UART_FCR_EM, fcr | UART_FCR_CLEAR_RCVR |
> +				 UART_FCR_CLEAR_XMIT);


I would put it like

	serial8250_em_serial_out_helper(p, UART_FCR_EM, fcr |
							UART_FCR_CLEAR_RCVR |
							UART_FCR_CLEAR_XMIT);

...

> +	switch (off) {
> +	case UART_FCR_EM:
> +		fcr = value;
> +		break;
> +	case UART_LCR:
> +		lcr = value;
> +		break;
> +	case UART_MCR:
> +		mcr = value;

Missing break; statement.

> +	}

...

> +	switch (offset) {
> +	case UART_TX:
> +	case UART_SCR:
> +	case UART_IER:
> +	case UART_DLL_EM:
> +	case UART_DLM_EM:
> +		serial8250_em_serial_out_helper(p, offset, value);
> +		break;
> +	case UART_FCR:
> +		serial8250_em_reg_update(p, UART_FCR_EM, value);
> +		break;
> +	case UART_LCR:
> +	case UART_MCR:
> +		serial8250_em_reg_update(p, offset, value);

Missing break; statement.

> +	}

-- 
With Best Regards,
Andy Shevchenko


