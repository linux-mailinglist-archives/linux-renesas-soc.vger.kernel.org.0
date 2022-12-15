Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E8C664D91E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Dec 2022 10:56:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229820AbiLOJ4x (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Dec 2022 04:56:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbiLOJ4o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Dec 2022 04:56:44 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60C8E1A818;
        Thu, 15 Dec 2022 01:56:43 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id bf43so1531609lfb.6;
        Thu, 15 Dec 2022 01:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xdC+NqVZ5HkfusI624+eIJZSW53fh0N64m6gDUGd2ds=;
        b=A8O4jEmI7cHdY5M+1FPkeI9jrWdn5WyiiyhgrKpHVPEMUzWdQOH2DC3thJcNBifQkH
         ywNpYrvefS9oDO7L/T9jvB+/aAK6hgK88ekehcOdNgdHE6Ca1iLZWLCOt6CrK77Gbrbl
         lOfPcq+Y1vtvAMeKBNdXh7lD6svIiXgE7RiQ4iimvpWqRDRCd0bCoF5m89rbQYfhiqbX
         QeqLLy3fzvZhxuuuCjYBpU1swUVagsX2nlk5DisV3FF0Tw/3qeqo6qNhjmx18iW3v0+d
         t29659iQXls+xB7/YBcJn1clgY4iLy4W72qLNVfZrOAhWsOOFVsAdVeRTXo196Y59hqC
         /iJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xdC+NqVZ5HkfusI624+eIJZSW53fh0N64m6gDUGd2ds=;
        b=S/9WVpEut+RRgu6Fgdq/Y8Spdv7Av7S4iPUDN6b8ywaOIqz7I3WENJE2rMlR38z7xT
         hDRboC9sF6lG6ZHNgUst66Z14lnV1Gs8WDYRKlVR0FRFGSwUEGP0UQSG90+Gpcq2YczW
         BsCp/OWgZNX9Dnleru8cEcEHaJjUr8m5S+/1OeXNB8dqqePfqFN0PKnIIybbm0KyF5J/
         4RqYK57vM1JrQZHT7ApXi2h69PKZ3Z7MKvIkTz2byA8knwutN11/OcmMZ5YFp635mvkX
         /lqZw6OG8V18dP7FM5Ykox1GUs57ravf8fqbTGrVOqRvAOkWWJUUUwn0+8+5t5viMQcR
         RbNQ==
X-Gm-Message-State: ANoB5pns+YH0QvKYvXDZKq/0AarR75EG5lrP1sJjQ6a8U1k1+lSHBA/c
        pTriHtjq2WzlVIBZaTsArb/f2TKUbo4=
X-Google-Smtp-Source: AA0mqf4XIzErzxRe9OK1/TvUKe+oVZKnbWxG0h1eOtaDL8coq7jSizBNxBQcHnpB1z8cfundW01feQ==
X-Received: by 2002:a05:6512:1145:b0:4b5:39fa:6dc with SMTP id m5-20020a056512114500b004b539fa06dcmr7008978lfg.18.1671098201296;
        Thu, 15 Dec 2022 01:56:41 -0800 (PST)
Received: from [192.168.1.103] ([178.176.75.188])
        by smtp.gmail.com with ESMTPSA id v14-20020a19740e000000b0048b365176d9sm1114163lfe.286.2022.12.15.01.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 01:56:40 -0800 (PST)
Subject: Re: [PATCH 2/4] usb: typec: hd3ss3220: Fix NULL pointer crash
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Biju Das <biju.das@bp.renesas.com>, linux-usb@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20221209155623.29147-1-biju.das.jz@bp.renesas.com>
 <20221209155623.29147-3-biju.das.jz@bp.renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <6408543e-29ac-ecae-b871-8ab9349cd0f5@gmail.com>
Date:   Thu, 15 Dec 2022 12:56:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20221209155623.29147-3-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 12/9/22 6:56 PM, Biju Das wrote:

> The value returned by usb_role_switch_get() can be NULL and it leads
> to NULL pointer crash. This patch fixes this issue by adding NULL
> check for the role switch handle.
> 
> [   25.336613] Hardware name: Silicon Linux RZ/G2E evaluation kit EK874 (CAT874 + CAT875) (DT)
> [   25.344991] Workqueue: events_unbound deferred_probe_work_func
> [   25.350869] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   25.357854] pc : renesas_usb3_role_switch_get+0x40/0x80 [renesas_usb3]
> [   25.364428] lr : renesas_usb3_role_switch_get+0x24/0x80 [renesas_usb3]
> [   25.370986] sp : ffff80000a4b3a40
> [   25.374311] x29: ffff80000a4b3a40 x28: 0000000000000000 x27: 0000000000000000
> [   25.381476] x26: ffff80000a3ade78 x25: ffff00000a809005 x24: ffff80000117f178
> [   25.388641] x23: ffff00000a8d7810 x22: ffff00000a8d8410 x21: 0000000000000000
> [   25.395805] x20: ffff000011cd7080 x19: ffff000011cd7080 x18: 0000000000000020
> [   25.402969] x17: ffff800076196000 x16: ffff800008004000 x15: 0000000000004000
> [   25.410133] x14: 000000000000022b x13: 0000000000000001 x12: 0000000000000001
> [   25.417291] x11: 0000000000000000 x10: 0000000000000a40 x9 : ffff80000a4b3770
> [   25.424452] x8 : ffff00007fbc9000 x7 : 0040000000000008 x6 : ffff00000a8d8590
> [   25.431615] x5 : ffff80000a4b3960 x4 : 0000000000000000 x3 : ffff00000a8d84f4
> [   25.438776] x2 : 0000000000000218 x1 : ffff80000a715218 x0 : 0000000000000218
> [   25.445942] Call trace:
> [   25.448398]  renesas_usb3_role_switch_get+0x40/0x80 [renesas_usb3]
> [   25.454613]  renesas_usb3_role_switch_set+0x4c/0x440 [renesas_usb3]
> [   25.460908]  usb_role_switch_set_role+0x44/0xa4
> [   25.465468]  hd3ss3220_set_role+0xa0/0x100 [hd3ss3220]
> [   25.470635]  hd3ss3220_probe+0x118/0x2fc [hd3ss3220]
> [   25.475621]  i2c_device_probe+0x338/0x384
> 
> Fixes: 5a9a8a4c5058 ("usb: typec: hd3ss3220: hd3ss3220_probe() warn: passing zero to 'PTR_ERR'")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> This issue triggered on RZ/G2E board, where there is no USB3 firmware and it
> returned a null role switch handle.
> ---
>  drivers/usb/typec/hd3ss3220.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
> index 2a58185fb14c..c24bbccd14f9 100644
> --- a/drivers/usb/typec/hd3ss3220.c
> +++ b/drivers/usb/typec/hd3ss3220.c
> @@ -186,7 +186,10 @@ static int hd3ss3220_probe(struct i2c_client *client,
>  		hd3ss3220->role_sw = usb_role_switch_get(hd3ss3220->dev);
>  	}
>  
> -	if (IS_ERR(hd3ss3220->role_sw)) {
> +	if (!hd3ss3220->role_sw) {
> +		ret = -ENODEV;
> +		goto err_put_fwnode;
> +	} else if (IS_ERR(hd3ss3220->role_sw)) {

   No need for *else* after *goto*.

[...]

MBR, Sergey
