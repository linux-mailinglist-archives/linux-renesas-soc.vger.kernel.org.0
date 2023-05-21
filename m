Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 360A470AD63
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 May 2023 12:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbjEUKId (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 21 May 2023 06:08:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230521AbjEUKHR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 May 2023 06:07:17 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 663CFE1;
        Sun, 21 May 2023 03:03:00 -0700 (PDT)
Received: (Authenticated sender: herve.codina@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 055B0240007;
        Sun, 21 May 2023 10:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1684663377;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=P8r9NJbk4qZsebDC6iKmw/phyNT0VMoU31SIufOtdaY=;
        b=n3BPvLjbXtZsTuhihgGPMP0u37RLKnAXjsi7DtKuY1mkD/KaK6Dr1+gxwMz7YczElkT5/P
        u0LOv8vO2H6XqQl+580gKLl+6rSO/YLVHpEEh4Y2WUZrRd45OT3gppylD1/PL7tpZNdT1o
        PsCjiigElFWjJEuuBvULYeUGS/veGNPZWIc9SJsSwLVfXzxIin74WWzffSz+Y82gWLlaP3
        JTQyTkeznIt2EBtkjTIASeZzzepT0o2k3Xa/5Rk0EDziseg2jjhyVxyuN10o3FL/e/4lna
        uyrvDpUit/hbx5V6ef71095VfznioPyG5crKki+1/dxtRrZ+/iK13Rl8CSGa5g==
Date:   Sun, 21 May 2023 12:02:56 +0200
From:   Herve Codina <herve.codina@bootlin.com>
To:     Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 40/97] usb: gadget/renesas_usbf: Convert to platform
 remove callback returning void
Message-ID: <20230521120256.0eae651f@bootlin.com>
In-Reply-To: <20230517230239.187727-41-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
        <20230517230239.187727-41-u.kleine-koenig@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 18 May 2023 01:01:42 +0200
Uwe Kleine-König <u.kleine-koenig@pengutronix.de> wrote:

> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart from
> emitting a warning) and this typically results in resource leaks. To improve
> here there is a quest to make the remove callback return void. In the first
> step of this quest all drivers are converted to .remove_new() which already
> returns void. Eventually after all drivers are converted, .remove_new() is
> renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/usb/gadget/udc/renesas_usbf.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/renesas_usbf.c b/drivers/usb/gadget/udc/renesas_usbf.c
> index 84ac9fe4ce7f..6cd0af83e91e 100644
> --- a/drivers/usb/gadget/udc/renesas_usbf.c
> +++ b/drivers/usb/gadget/udc/renesas_usbf.c
> @@ -3361,15 +3361,13 @@ static int usbf_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int usbf_remove(struct platform_device *pdev)
> +static void usbf_remove(struct platform_device *pdev)
>  {
>  	struct usbf_udc *udc = platform_get_drvdata(pdev);
>  
>  	usb_del_gadget_udc(&udc->gadget);
>  
>  	pm_runtime_put(&pdev->dev);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id usbf_match[] = {
> @@ -3385,7 +3383,7 @@ static struct platform_driver udc_driver = {
>  		.of_match_table = usbf_match,
>  	},
>  	.probe          = usbf_probe,
> -	.remove         = usbf_remove,
> +	.remove_new     = usbf_remove,
>  };
>  
>  module_platform_driver(udc_driver);

Acked-by: Herve Codina <herve.codina@bootlin.com>

Thanks,
Hervé

-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
