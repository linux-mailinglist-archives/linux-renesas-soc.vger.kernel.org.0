Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88E08161E37
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2020 01:38:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbgBRAiZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Feb 2020 19:38:25 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:42494 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbgBRAiZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Feb 2020 19:38:25 -0500
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 19F741220;
        Tue, 18 Feb 2020 01:38:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1581986303;
        bh=t96zGplTNE1Od5PyAQYJfaxLCz9A1duSgDyDNJWWebc=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=lgUrIlK7CXLBIDD8jeHqVqMLVVhpPFWPVPN5lC+oF5xXEbcuMFly3HiCvV1WuJSA9
         +Z7lf00+1+SmCjvcvpIrL57P3fGB47CdaeHOcP754+1XcArU+2zNf1tidLzlEFcM/C
         aspwgjhkcsw0rtRaLqBfXN/YOI0WF4ehMRkwJFfo=
Subject: Re: [PATCH] i3c: master: no need to iterate master device twice
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i3c@lists.infradead.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20200214145853.24762-1-wsa+renesas@sang-engineering.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <1258dbb3-f9f3-0d3e-77e0-094e6f1bc633@ideasonboard.com>
Date:   Tue, 18 Feb 2020 00:38:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200214145853.24762-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On 14/02/2020 14:58, Wolfram Sang wrote:
> We already have the master device in a variable, reuse it.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
> 
> Found while refactoring of_i2c_get_board_info() and checking its users.
> 
>  drivers/i3c/master.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 7f8f896fa0c3..b56207bbed2b 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1953,7 +1953,7 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
>  	 * DEFSLVS command.
>  	 */
>  	if (boardinfo->base.flags & I2C_CLIENT_TEN) {
> -		dev_err(&master->dev, "I2C device with 10 bit address not supported.");
> +		dev_err(dev, "I2C device with 10 bit address not supported.");
>  		return -ENOTSUPP;
>  	}
>  
> 

