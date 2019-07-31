Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34FAC7C364
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2019 15:24:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727161AbfGaNYf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 Jul 2019 09:24:35 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:34446 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726259AbfGaNYf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jul 2019 09:24:35 -0400
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp06-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.24 AUTH)
        with ESMTPSA id h0a328v6VDOWZRD
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 31 Jul 2019 15:24:32 +0200 (CEST)
Date:   Wed, 31 Jul 2019 15:24:32 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc:     Joe Perches <joe@perches.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Message-ID: <625990202.318842.1564579472697@webmail.strato.com>
In-Reply-To: <20190731124555.14349-1-geert+renesas@glider.be>
References: <20190731124555.14349-1-geert+renesas@glider.be>
Subject: Re: [PATCH] serial: sh-sci: Use DEVICE_ATTR_RW() for
 rx_fifo_trigger
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.10.1-Rev16
X-Originating-IP: 85.212.153.30
X-Originating-Client: open-xchange-appsuite
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On July 31, 2019 at 2:45 PM Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> 
> 
> While commit b6b996b6cdeecf7e ("treewide: Use DEVICE_ATTR_RW") converted
> the rx_fifo_timeout attribute, it forgot to convert rx_fifo_trigger due
> to a slightly different function naming.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/tty/serial/sh-sci.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index d18c680aa64b3427..57638175639e0f3f 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -1092,9 +1092,8 @@ static void rx_fifo_timer_fn(struct timer_list *t)
>  	scif_set_rtrg(port, 1);
>  }
>  
> -static ssize_t rx_trigger_show(struct device *dev,
> -			       struct device_attribute *attr,
> -			       char *buf)
> +static ssize_t rx_fifo_trigger_show(struct device *dev,
> +				    struct device_attribute *attr, char *buf)
>  {
>  	struct uart_port *port = dev_get_drvdata(dev);
>  	struct sci_port *sci = to_sci_port(port);
> @@ -1102,10 +1101,9 @@ static ssize_t rx_trigger_show(struct device *dev,
>  	return sprintf(buf, "%d\n", sci->rx_trigger);
>  }
>  
> -static ssize_t rx_trigger_store(struct device *dev,
> -				struct device_attribute *attr,
> -				const char *buf,
> -				size_t count)
> +static ssize_t rx_fifo_trigger_store(struct device *dev,
> +				     struct device_attribute *attr,
> +				     const char *buf, size_t count)
>  {
>  	struct uart_port *port = dev_get_drvdata(dev);
>  	struct sci_port *sci = to_sci_port(port);
> @@ -1123,7 +1121,7 @@ static ssize_t rx_trigger_store(struct device *dev,
>  	return count;
>  }
>  
> -static DEVICE_ATTR(rx_fifo_trigger, 0644, rx_trigger_show, rx_trigger_store);
> +static DEVICE_ATTR_RW(rx_fifo_trigger);
>  
>  static ssize_t rx_fifo_timeout_show(struct device *dev,
>  			       struct device_attribute *attr,
> -- 
> 2.17.1
>

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
