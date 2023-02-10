Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34C8E6922A4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Feb 2023 16:52:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232564AbjBJPwY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Feb 2023 10:52:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231954AbjBJPwX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2023 10:52:23 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB67C4B749;
        Fri, 10 Feb 2023 07:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676044342; x=1707580342;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=qUpgAiH+JCVRIJKren1kim03Bn8BaV6Vy8ou499xSOc=;
  b=QmXyHh7ka/PsizH71W+NacxwD1euGyqw/cXAlX+DoopjdzRdhGv/rRPp
   92wv13ilfiA64JllA1GqI5yt9Ox4r/Dob5CUIyY/ek7pWzzR1IT4iU6yI
   tF/YmHX5SShfNF+IFiZyyv/fVo/WSI3FIakVQgnTWkuKDtiv59v3H08Si
   gKT90gwe885+rc/ROF6UFzDumAcvCA7sCuHA2oGZW1F0Wjr+YrVbpjBFV
   77hm5xL0MPdr6xZgnhawhfXZ0JeeijwG7ylOIIhdFUfsSR9tR7lvQCIZg
   NqPu8or1e2Iz5AuLtd34JDUaKFl/Gwn6iyhNs2uaQsFLzS+QJzvut06hX
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="329077800"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="329077800"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 07:52:22 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="668094427"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="668094427"
Received: from tnemeth-mobl1.ger.corp.intel.com ([10.251.213.60])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 07:52:19 -0800
Date:   Fri, 10 Feb 2023 17:52:17 +0200 (EET)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] serial: 8250_em: Add serial_out() to struct
 serial8250_em_hw_info
In-Reply-To: <20230210154140.338352-4-biju.das.jz@bp.renesas.com>
Message-ID: <954bb490-b516-6624-5bb9-e82434fc95f0@linux.intel.com>
References: <20230210154140.338352-1-biju.das.jz@bp.renesas.com> <20230210154140.338352-4-biju.das.jz@bp.renesas.com>
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
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Added serial_out to struct serial8250_em_hw_info

Thanks, this looks much better. One additional comment below.

> ---
>  drivers/tty/serial/8250/8250_em.c | 59 ++++++++++++++++++++++++++++++-
>  1 file changed, 58 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_em.c b/drivers/tty/serial/8250/8250_em.c
> index 628a6846bfdc..1816362a3a3a 100644
> --- a/drivers/tty/serial/8250/8250_em.c
> +++ b/drivers/tty/serial/8250/8250_em.c
> @@ -19,10 +19,14 @@
>  
>  #define UART_DLL_EM 9
>  #define UART_DLM_EM 10
> +#define UART_HCR0 11
> +
> +#define UART_HCR0_SW_RESET	BIT(7) /* SW Reset */
>  
>  struct serial8250_em_hw_info {
>  	unsigned int type;
>  	upf_t flags;
> +	void (*serial_out)(struct uart_port *p, int off, int value);
>  };
>  
>  struct serial8250_em_priv {
> @@ -31,6 +35,40 @@ struct serial8250_em_priv {
>  	const struct serial8250_em_hw_info *info;
>  };
>  
> +static void serial8250_rzv2m_reg_update(struct uart_port *p, int off, int value)
> +{
> +	unsigned int ier, fcr, lcr, mcr, hcr0;
> +
> +	ier = readl(p->membase + (UART_IER << 2));
> +	hcr0 = readl(p->membase + (UART_HCR0 << 2));
> +	fcr = readl(p->membase + ((UART_FCR + 1) << 2));
> +	lcr = readl(p->membase + ((UART_LCR + 1) << 2));
> +	mcr = readl(p->membase + ((UART_MCR + 1) << 2));
> +
> +	writel(fcr | UART_FCR_CLEAR_RCVR | UART_FCR_CLEAR_XMIT,
> +	       p->membase + ((UART_FCR + 1) << 2));
> +	writel(hcr0 | UART_HCR0_SW_RESET, p->membase + (UART_HCR0 << 2));
> +	writel(hcr0 & ~UART_HCR0_SW_RESET, p->membase + (UART_HCR0 << 2));
> +
> +	switch (off) {
> +	case UART_FCR:
> +		fcr = value;
> +		break;
> +	case UART_LCR:
> +		lcr = value;
> +		break;
> +	case UART_MCR:
> +		mcr = value;
> +		break;
> +	}
> +
> +	writel(ier, p->membase + (UART_IER << 2));
> +	writel(fcr, p->membase + ((UART_FCR + 1) << 2));
> +	writel(mcr, p->membase + ((UART_MCR + 1) << 2));
> +	writel(lcr, p->membase + ((UART_LCR + 1) << 2));
> +	writel(hcr0, p->membase + (UART_HCR0 << 2));

Perhaps it would make sense to instead of using readl/writel() directly to 
call serial8250_em_serial_in/out() so all the offset trickery wouldn't 
need to be duplicated inside this function?

-- 
 i.

> +}
> +
>  static void serial8250_em_serial_out(struct uart_port *p, int offset, int value)
>  {
>  	switch (offset) {
> @@ -52,6 +90,23 @@ static void serial8250_em_serial_out(struct uart_port *p, int offset, int value)
>  	}
>  }
>  
> +static void serial8250_em_rzv2m_serial_out(struct uart_port *p, int offset, int value)
> +{
> +	switch (offset) {
> +	case UART_TX:
> +	case UART_SCR:
> +	case UART_IER:
> +	case UART_DLL_EM:
> +	case UART_DLM_EM:
> +		serial8250_em_serial_out(p, offset, value);
> +		break;
> +	case UART_FCR:
> +	case UART_LCR:
> +	case UART_MCR:
> +		serial8250_rzv2m_reg_update(p, offset, value);
> +	}
> +}
> +
>  static unsigned int serial8250_em_serial_in(struct uart_port *p, int offset)
>  {
>  	switch (offset) {
> @@ -119,7 +174,7 @@ static int serial8250_em_probe(struct platform_device *pdev)
>  
>  	up.port.iotype = UPIO_MEM32;
>  	up.port.serial_in = serial8250_em_serial_in;
> -	up.port.serial_out = serial8250_em_serial_out;
> +	up.port.serial_out = priv->info->serial_out;
>  	up.dl_read = serial8250_em_serial_dl_read;
>  	up.dl_write = serial8250_em_serial_dl_write;
>  
> @@ -144,11 +199,13 @@ static int serial8250_em_remove(struct platform_device *pdev)
>  static const struct serial8250_em_hw_info emma_mobile_uart_hw_info = {
>  	.type = PORT_UNKNOWN,
>  	.flags = UPF_BOOT_AUTOCONF | UPF_FIXED_PORT | UPF_IOREMAP,
> +	.serial_out = serial8250_em_serial_out,
>  };
>  
>  static const struct serial8250_em_hw_info rzv2m_uart_hw_info = {
>  	.type = PORT_16750,
>  	.flags = UPF_BOOT_AUTOCONF | UPF_FIXED_PORT | UPF_IOREMAP | UPF_FIXED_TYPE,
> +	.serial_out = serial8250_em_rzv2m_serial_out,
>  };
>  
>  static const struct of_device_id serial8250_em_dt_ids[] = {
> 

