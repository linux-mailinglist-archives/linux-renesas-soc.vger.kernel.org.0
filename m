Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C570B6922C1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Feb 2023 16:58:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232457AbjBJP6H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Feb 2023 10:58:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232053AbjBJP6G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2023 10:58:06 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 204ED12F30;
        Fri, 10 Feb 2023 07:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676044686; x=1707580686;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=UQWkLK1ZmvrtFzxNyuIwqPd+5TlcUGpoFqLRxLliS3E=;
  b=DpqkUfFmF82gUSBklBfX0l0YUXGi3A39kFkTeSC5j1dor4t2uQCK7/kx
   liDfHfAikIvVP7t+DrOSWwRo2gPJL5ikyhmn1HyrqNI/O/Rohe5OoBCSp
   bJIe4GEHYHYdny3vr1TzScSofe99DWUip9YIhCO+H/RM3RW67vZoUTzve
   TlwAfGIkz29vNwuwLHMTv0VOtsX9nCZf0VMnO1ceIOPielfJO/FLAf98B
   z4WTLsC2Ows4v3WECawz9n8XPUjuDlo5IN6OTURCIKImahdezaNa2OnQz
   JY3Dbv7c6SIUr3Y7p3+66I2RBtHzxv+K1debudgi5EFXuk6Rk6ejK0+wp
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="310080763"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="310080763"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 07:58:05 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="842053984"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="842053984"
Received: from tnemeth-mobl1.ger.corp.intel.com ([10.251.213.60])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 07:58:03 -0800
Date:   Fri, 10 Feb 2023 17:58:00 +0200 (EET)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-serial <linux-serial@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/3] serial: 8250_em: Update RZ/V2M port type as
 PORT_16750
In-Reply-To: <20230210154140.338352-3-biju.das.jz@bp.renesas.com>
Message-ID: <e1db071-963e-926-9119-9b405a1812cf@linux.intel.com>
References: <20230210154140.338352-1-biju.das.jz@bp.renesas.com> <20230210154140.338352-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 10 Feb 2023, Biju Das wrote:

> The UART IP found on RZ/V2M SoC is Register-compatible with the
> general-purpose 16750 UART chip. This patch updates RZ/V2M
> port type from 16550A->16750 and also enables 64-bytes fifo support.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2:
>  * New patch
> ---
>  drivers/tty/serial/8250/8250_em.c | 27 +++++++++++++++++++++++----
>  1 file changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_em.c b/drivers/tty/serial/8250/8250_em.c
> index b78c74755735..628a6846bfdc 100644
> --- a/drivers/tty/serial/8250/8250_em.c
> +++ b/drivers/tty/serial/8250/8250_em.c
> @@ -9,6 +9,7 @@
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/mod_devicetable.h>
> +#include <linux/of_device.h>
>  #include <linux/serial_8250.h>
>  #include <linux/serial_reg.h>
>  #include <linux/platform_device.h>
> @@ -19,9 +20,15 @@
>  #define UART_DLL_EM 9
>  #define UART_DLM_EM 10
>  
> +struct serial8250_em_hw_info {
> +	unsigned int type;
> +	upf_t flags;
> +};
> +
>  struct serial8250_em_priv {
>  	struct clk *sclk;
>  	int line;
> +	const struct serial8250_em_hw_info *info;
>  };
>  
>  static void serial8250_em_serial_out(struct uart_port *p, int offset, int value)
> @@ -95,6 +102,7 @@ static int serial8250_em_probe(struct platform_device *pdev)
>  	if (!priv)
>  		return -ENOMEM;
>  
> +	priv->info = of_device_get_match_data(dev);

On second thought, do you even need to store the info beyond .probe()?


-- 
 i.

