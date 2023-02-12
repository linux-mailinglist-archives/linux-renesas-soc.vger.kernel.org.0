Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB11E6936F3
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Feb 2023 12:10:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjBLLKC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 12 Feb 2023 06:10:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjBLLKB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 12 Feb 2023 06:10:01 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B99A113DF;
        Sun, 12 Feb 2023 03:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676200200; x=1707736200;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MgWCkZpHoKNIFoIVXxMswoWyBB6eFiwGX6UlQSGmbGE=;
  b=Jzik+hxh7QtyHP0ghSyqCdMthE7f21CF0u3XNvCgsmyimknPgL2K6k/3
   Cnw4nRlLYgupi+fU/i+eQLBr3hAAaRBwQTqwKi9ZVo5R5pgsPoRE0ZE1b
   KVnoKnXaGOUYU9CONG5wlnaZ24TM0+9UitpiDhnov1MDFdaZH2SZhj6h6
   7XLPkuN+fmryygGkCoq+2WwBCnkLr65W7xpcaFt3RHoctrY9S/FPWvjZo
   WpxHCpVsxEW9wWTQOtFKZjXb5tn5AwUoAM5iTOM9ux98/TvUAq+msC9St
   DuuYtm59k9QFVN8uE9boqlc+H8zdDOOOZY4+ap+laDPksYcXJEhcL0yF3
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="311068038"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="311068038"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 03:10:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="811295773"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="811295773"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 12 Feb 2023 03:09:58 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1pRAF2-005pxY-1i;
        Sun, 12 Feb 2023 13:09:56 +0200
Date:   Sun, 12 Feb 2023 13:09:56 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to struct
 serial8250_em_hw_info
Message-ID: <Y+jJBER9x4wMS5U1@smile.fi.intel.com>
References: <20230210203439.174913-1-biju.das.jz@bp.renesas.com>
 <20230210203439.174913-4-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230210203439.174913-4-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Feb 10, 2023 at 08:34:39PM +0000, Biju Das wrote:
> As per HW manual section 40.6.1, we need to perform FIFO reset + SW
> reset before updating the below registers.
> 
> FCR[7:5], FCR[3:0], LCR[7][5:0], MCR[6:4], DLL[7:0], DLM[7:0] and
> HCR0[6:5][3:2].
> 
> This patch adds serial_out() to struct serial8250_em_hw_info to
> handle this difference between emma mobile and rz/v2m.
> 
> DLL/DLM register can be updated only by setting LCR[7]. So the
> updation of LCR[7] will perform reset for DLL/DLM register changes.

...

>  #define UART_DLL_EM 9
>  #define UART_DLM_EM 10
> +#define UART_HCR0 11

Can we continue using _EM suffix?

...

> +	/*
> +	 * The value of UART_IIR and UART_FCR are 2, but corresponding
> +	 * RZ/V2M address offset are different(0x08 and 0x0c). So we need to
> +	 * use readl() here.
> +	 */
> +	fcr = readl(p->membase + ((UART_FCR + 1) << 2));

So, what does prevent you to define above

#define UART_IIR_EM	3 // or whatever name it should have

and use again same helper here?

-- 
With Best Regards,
Andy Shevchenko


