Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E597C693FC1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Feb 2023 09:37:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbjBMIhq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Feb 2023 03:37:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbjBMIhp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2023 03:37:45 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D09749036;
        Mon, 13 Feb 2023 00:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676277464; x=1707813464;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=GZ2PIltjI/rTEe5yq2u2jVzwti8WbfsNV7x5A6O9GC8=;
  b=D9S5vt2ztmn9Sluy9UJsQcoVOv9v9eGqA85IRGGRrbT3M33mJeIjgCqE
   ZkpJKVRybKZ3+D0R6WqsLBuacAKwjY4ZY9QAGX9hLhrB1pKQsQe3kiBKq
   de9RDRpA/WbnI1BPiE5d8Sg5vp4jNS1dZCmbZWzTbFudDARyZpJIL1r3y
   T/SK7B8HS4fjzeMwxZ6r6FmV30p0zMiLmktb75rBgmxsOI3nw7M9MZ+0z
   LgOZ8G77wU2kgajUgvhGTyGoZYn9W1XPIBe9kBXmNfXRxcDCqkk7o+rm7
   O4gcvyedoSmRaHxqNx9WFLrYIYKENEC3bcnbLjP6oEV6Tc2S8z0Y57d1P
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="328548448"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="328548448"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 00:37:44 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="618577310"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="618577310"
Received: from hdevries-mobl.ger.corp.intel.com ([10.249.36.140])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 00:37:39 -0800
Date:   Mon, 13 Feb 2023 10:37:33 +0200 (EET)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Eric Tremblay <etremblay@distech-controls.com>,
        Wander Lairson Costa <wander@redhat.com>,
        linux-serial <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Update Renesas RZ/V2M UART Port type
In-Reply-To: <20230210203439.174913-1-biju.das.jz@bp.renesas.com>
Message-ID: <e02b1d40-70f3-c6e9-f527-c572ad289a@linux.intel.com>
References: <20230210203439.174913-1-biju.das.jz@bp.renesas.com>
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

> RZ/V2M specific register handling for the below restriction mentioned in
> hardware manual
> 
> 40.6.1 Point for Caution when Changing the Register Settings:
> 
> When changing the settings of the following registers, a PRESETn master
> reset or FIFO reset + SW reset (FCR[2],FCR[1], HCR0[7]) must be input to
> re-initialize them.
> 
> Target Registers: FCR, LCR, MCR, DLL, DLM, HCR0.

This information should appear in the changelog of 3/3!

-- 
 i.

> v2->v3:
>  * Dropped sclk from priv.
>  * Dropped unneeded clk_disable_unprepare from remove().
>  * Retained Rb tags from Geert,Andy and Ilpo as the changes are trivial.
>  * Replaced of_device_get_match_data()->device_get_match_data().
>  * Replaced of_device.h->property.h
>  * Dropped struct serial8250_em_hw_info *info from priv and started
>    using a local variable info in probe().
>  * Retained Rb tag from Ilpo as changes are trivial.
>  * Replaced readl/writel()->serial8250_em_serial_in/out() in serial8250_rzv2m_
>    reg_update() to avoid duplication of offset trickery.
>  * Added support for HCR0 read/write in serial8250_em_{serial_in, serial_out}
>  * Added UART_LCR macro support in serial8250_em_serial_in() to read LCR
>  * Reordered serial8250_em_{serial_in, serial_out} above serial8250_rzv2m_
>    reg_update().
>  * Replaced priv->info->serial_out to info->serial_out.
> v1->v2:
>  * Dropped patch#1 from previous series
>  * Replaced devm_clk_get->devm_clk_get_enabled() and updated clk
>    handling in probe().
>  * Added Rb tag from Geert.
>  * Added patch for updating Renesas RZ/V2M UART type from 16550a->16750
>    and also enables 64-bytes fifo.
>  * Used .data for taking h/w differences between EMMA mobile and RZ/V2M UART.
>  * Added serial_out() to struct serial8250_em_hw_info for the write register
>    differences between EMMA mobile and RZ/V2M UART.
> Biju Das (3):
>   serial: 8250_em: Use dev_err_probe()
>   serial: 8250_em: Update RZ/V2M port type as PORT_16750
>   serial: 8250_em: Add serial_out() to struct serial8250_em_hw_info
> 
>  drivers/tty/serial/8250/8250_em.c | 128 ++++++++++++++++++++++++------
>  1 file changed, 102 insertions(+), 26 deletions(-)
> 
> 
