Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4AE237A450
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 May 2021 12:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbhEKKI7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 May 2021 06:08:59 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:29960 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231416AbhEKKI6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 May 2021 06:08:58 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1620727671; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=X3Xjne8RvmLRXs6P8qSQY1+JkwLUsku2pdjMA/S+5+BHMxKgASX6lws0u2Xd0rKv3x
    XWLQNjMxWzSENyzF8ANt9+jkDMGmRoqdIYhKcE/g36plPb3gc0EyhEd2PUqIVbwAoM3g
    KijZfaYNG97gJPesGAENKU5ACQ8rgyqp5RzUSoy1yTp0So9ei0j5WQds9owx6w/Em2Hb
    wZFyPf5Qs3Bd2nJGkO3NCyLgwuDy7hfKDVRG9Ttj+lrCASYHPiBpQ5ahsNR7TAkDEibS
    vS+HYy4Aoz4mnKzMgZpiN0D1tPPKfs1Qx4EkRu590Rzs9xn3oILwrJD97fRirwfMnpUe
    m6pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620727671;
    s=strato-dkim-0002; d=strato.com;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=4pslrDftx0Hdb3brI/L/wdGy5h+2gdgtEccq8OHzqTw=;
    b=lYWpUTBIV0984hBwvWKn61wzQJ0HgnSgfS9RVFntpc0TJ50IwUg72yBBJPYS5DcZkq
    q9ZjHBhNySz3BHvQJfcTzugcGo2iABzHwwPTzUXeNO+qlLdiHpu/cs/x/bqIIlTqW55O
    sOLd+yU8/fGYHrLE442kM4kGWAFswu/rVEd29Z1DsWii6fErYRWTcnWh16kKVWZrGgUK
    6Ixa+5LtfP9NiKnLnboy2E6WPHfBJrcE/IJAbicrODb4RRZEqLw3H/iF83aF7tnxNpWn
    DyP6SheSBn1Fvy+x3TNi4pctF9o/62P+1kfHdfoIKvQ68+Aah0PACI7yCVbUQ1IYwqsi
    nqoQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620727671;
    s=strato-dkim-0002; d=fpond.eu;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=4pslrDftx0Hdb3brI/L/wdGy5h+2gdgtEccq8OHzqTw=;
    b=Ns4RjhqLAZsvvC1po9XW+TPYiV83wkGyFalWg5Uwv05jMFmp0BK4HDjGO2CJ7A7wTD
    RVwfwzXpunGBcQd5X+0mqqSQ+Wr5fgYGmu2NuWGQo4AZ0G/LfNooiyZDhpOLYLDZTFb7
    nDMgy56uHJyVZbOcHkE0LLl9pr0VdMOH2dVs4KHrZ3LeUovG0hQAwJxmUHPkIvZ7x5SW
    GtOU7Vx4vDkWVQ/skM7aaGwQNgn8S2a4maZ990hVniy2VAG1g9rU+SVAgpWkttC/TPE/
    sDyfKizRpJh/DO19mbOGFK9zKPWk5gj3C1UsZb8T93BaXhwfYJQV4tA/z3NWekn5GxEV
    2GyA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fCv/x28jVM="
X-RZG-CLASS-ID: mo00
Received: from oxapp06-01.back.ox.d0m.de
    by smtp-ox.front (RZmta 47.25.6 AUTH)
    with ESMTPSA id v052c3x4BA7p0IZ
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Tue, 11 May 2021 12:07:51 +0200 (CEST)
Date:   Tue, 11 May 2021 12:07:51 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linh Phung <linh.phung.jy@renesas.com>
Cc:     linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Message-ID: <1158014321.1245232.1620727671192@webmail.strato.com>
In-Reply-To: <5eff320aef92ffb33d00e57979fd3603bbb4a70f.1620648218.git.geert+renesas@glider.be>
References: <5eff320aef92ffb33d00e57979fd3603bbb4a70f.1620648218.git.geert+renesas@glider.be>
Subject: Re: [PATCH] serial: sh-sci: Fix off-by-one error in FIFO threshold
 register setting
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.4-Rev22
X-Originating-Client: open-xchange-appsuite
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On 05/10/2021 2:07 PM Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> 
>  
> The Receive FIFO Data Count Trigger field (RTRG[6:0]) in the Receive
> FIFO Data Count Trigger Register (HSRTRGR) of HSCIF can only hold values
> ranging from 0-127.  As the FIFO size is equal to 128 on HSCIF, the user
> can write an out-of-range value, touching reserved bits.
> 
> Fix this by limiting the trigger value to the FIFO size minus one.
> Reverse the order of the checks, to avoid rx_trig becoming zero if the
> FIFO size is one.
> 
> Note that this change has no impact on other SCIF variants, as their
> maximum supported trigger value is lower than the FIFO size anyway, and
> the code below takes care of enforcing these limits.
> 
> Reported-by: Linh Phung <linh.phung.jy@renesas.com>
> Fixes: a380ed461f66d1b8 ("serial: sh-sci: implement FIFO threshold register setting")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Compile-tested only.
> 
> The BSP contains a different patch[1], which masks the value to write by
> 0x7f.  This is IMHO incorrect, as it would set the trigger value to zero
> when 128 is requested.
> 
> [1] "serial: sh-sci: Using mask when writing to HSRTRGR"
>     https://github.com/renesas-rcar/linux-bsp/commit/9915223f41c7d680aaaed12971601dc038ce76a3
> ---
>  drivers/tty/serial/sh-sci.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index ef37fdf37612f82f..4baf1316ea729931 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -1023,10 +1023,10 @@ static int scif_set_rtrg(struct uart_port *port, int rx_trig)
>  {
>  	unsigned int bits;
>  
> +	if (rx_trig >= port->fifosize)
> +		rx_trig = port->fifosize - 1;
>  	if (rx_trig < 1)
>  		rx_trig = 1;
> -	if (rx_trig >= port->fifosize)
> -		rx_trig = port->fifosize;
>  
>  	/* HSCIF can be set to an arbitrary level. */
>  	if (sci_getreg(port, HSRTRGR)->size) {
> -- 
> 2.25.1

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
