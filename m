Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 093C519665
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 May 2019 04:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbfEJCAG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 May 2019 22:00:06 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:64910 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726799AbfEJCAG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 May 2019 22:00:06 -0400
X-UUID: b758b69594e44c8cb2c3c23ad694a496-20190510
X-UUID: b758b69594e44c8cb2c3c23ad694a496-20190510
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1714720852; Fri, 10 May 2019 10:00:01 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 10 May
 2019 09:59:59 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 10 May 2019 09:59:59 +0800
Message-ID: <1557453599.10179.280.camel@mhfsdcap03>
Subject: Re: [PATCH v2 08/15] usb: renesas_usbhs: move flags macros
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Chris Brandt <chris.brandt@renesas.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Date:   Fri, 10 May 2019 09:59:59 +0800
In-Reply-To: <20190509201142.10543-9-chris.brandt@renesas.com>
References: <20190509201142.10543-1-chris.brandt@renesas.com>
         <20190509201142.10543-9-chris.brandt@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MTK:  N
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 2019-05-09 at 15:11 -0500, Chris Brandt wrote:
> Move flags macros to header file so they can be used by other files.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  drivers/usb/renesas_usbhs/common.c |  7 -------
>  drivers/usb/renesas_usbhs/common.h | 10 ++++++++++
>  2 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
> index 249fbee97f3f..efb26ffd9809 100644
> --- a/drivers/usb/renesas_usbhs/common.c
> +++ b/drivers/usb/renesas_usbhs/common.c
> @@ -44,13 +44,6 @@
>   */
>  
> 
> -#define USBHSF_RUNTIME_PWCTRL	(1 << 0)
> -
> -/* status */
> -#define usbhsc_flags_init(p)   do {(p)->flags = 0; } while (0)
> -#define usbhsc_flags_set(p, b) ((p)->flags |=  (b))
> -#define usbhsc_flags_clr(p, b) ((p)->flags &= ~(b))
> -#define usbhsc_flags_has(p, b) ((p)->flags &   (b))
>  
>  /*
>   * platform call back
> diff --git a/drivers/usb/renesas_usbhs/common.h b/drivers/usb/renesas_usbhs/common.h
> index 3777af848a35..1ca94b8f5508 100644
> --- a/drivers/usb/renesas_usbhs/common.h
> +++ b/drivers/usb/renesas_usbhs/common.h
> @@ -339,4 +339,14 @@ struct usbhs_priv *usbhs_pdev_to_priv(struct platform_device *pdev);
>  #define usbhs_priv_to_dev(priv)		(&priv->pdev->dev)
>  #define usbhs_priv_to_lock(priv)	(&priv->lock)
>  
> +/*
> + * flags
> + */
> +#define USBHSF_RUNTIME_PWCTRL	(1 << 0)
BIT(0)?
> +
> +#define usbhsc_flags_init(p)   ((p)->flags = 0)
> +#define usbhsc_flags_set(p, b) ((p)->flags |=  (b))
> +#define usbhsc_flags_clr(p, b) ((p)->flags &= ~(b))
> +#define usbhsc_flags_has(p, b) ((p)->flags &   (b))
> +
>  #endif /* RENESAS_USB_DRIVER_H */


