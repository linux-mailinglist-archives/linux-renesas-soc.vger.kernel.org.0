Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C77B4199C2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 May 2019 10:36:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbfEJIgc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 May 2019 04:36:32 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42717 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727003AbfEJIgb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 May 2019 04:36:31 -0400
Received: by mail-lj1-f196.google.com with SMTP id 188so4364397ljf.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 May 2019 01:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=peFe4gmxhHbE/UlVUF4tP76Twm9IOkOLuvbvmcP5H9U=;
        b=MAYM7gTuGmyBHLXPLcxI/DS1wyGueQ061wkwjGJe2Ds58TbQbboW7S0SGlxFauI6/e
         2R8Umxve4eQ7jq1SjRTUr/ZiK6r7aetoUQH3OFVFNVgcAQd8eXHixRZ27LTOs5Agex8t
         gpgfQq8FTTcTI5rs+yLFLpQYOQfl+fUFIqdet+9cOG5RaR6lTRqktS2sMnqZV+SzJz74
         /F15w/5xYFabnjIbhc3unv8Ky9AGjoGT2b/Ak68ss1UXDdMP1pmMhMkXGWxR8878Au9o
         AJ7zF195CiRPlvOztMaAnyLb4lONcQWSvIK17e1uqU56j1G9RNxYShJ44rPB2FtW2vyY
         yEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=peFe4gmxhHbE/UlVUF4tP76Twm9IOkOLuvbvmcP5H9U=;
        b=dZrAVNpxmtNdgyz41mINAE2DDVF2F2cwgIpUoOVOc2pxUaSFX3Y1uKgGzUc2LOnd4s
         5ySnT9Rz08j6jLQ2xmpmmWhXnUV5rjPkAWs5IXSiInzJvWL0gH3FzKlEucBU94ZZdm7X
         NCKFlfuMY+Nn3GmuKUBjBIKBjZF8cMpLMxPMJisBIlUReGtYssJgo4AS9osk6GvGLP5a
         PnMrjf+cV6wZgo/UghV8+Hlq7JJWfQCjlb9mzBYXDGVCTw1QuKYjHT0+hddCGRwJxHsY
         HuFuAP1pv14CSN0xKx5UHsPYnc81xBFq1L+B/KaH7rbzlLEEJxUISKITm4Lll1mKQ9Xp
         Sz/w==
X-Gm-Message-State: APjAAAViAeZgbWXHCujZtHILhracDzpyGURJQlv18tg2xIlYWuWwe0iF
        yE0vk9eHGx2lCEQDnTev47ILLJJzUtk=
X-Google-Smtp-Source: APXvYqy+zQ74RlPu0J/m0h6WKbZ7PevcaZHniIlAw4ap9DtnxPkamNs5hKxX7jNh8Z5X84CdmWSXXQ==
X-Received: by 2002:a2e:9f41:: with SMTP id v1mr773947ljk.66.1557477389413;
        Fri, 10 May 2019 01:36:29 -0700 (PDT)
Received: from [192.168.0.199] ([31.173.83.158])
        by smtp.gmail.com with ESMTPSA id c7sm1248194lja.90.2019.05.10.01.36.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 May 2019 01:36:28 -0700 (PDT)
Subject: Re: [PATCH v2 05/15] phy: renesas: rcar-gen3-usb2: Check dr_mode when
 not using OTG
To:     Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20190509201142.10543-1-chris.brandt@renesas.com>
 <20190509201142.10543-6-chris.brandt@renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <e987df36-eca6-f05f-d1bf-7dc43fc9d4b4@cogentembedded.com>
Date:   Fri, 10 May 2019 11:36:17 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509201142.10543-6-chris.brandt@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 09.05.2019 23:11, Chris Brandt wrote:

> When not using OTG, the PHY will need to know if it should function as
> host or peripheral by checking dr_mode in the PHY node (not the parent
> controller node).
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v2:
>   * added braces to else statement
>   * check if dr_mode is "host"
> ---
>   drivers/phy/renesas/phy-rcar-gen3-usb2.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> index 1ebb08f8323f..5e5e5e938f80 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -391,6 +391,7 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
>   	struct rcar_gen3_phy *rphy = phy_get_drvdata(p);
>   	struct rcar_gen3_chan *channel = rphy->ch;
>   	void __iomem *usb2_base = channel->base;
> +	enum usb_dr_mode mode;
>   	u32 val;
>   
>   	if (channel->uses_usb_x1)
> @@ -408,6 +409,13 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
>   		if (rcar_gen3_needs_init_otg(channel))
>   			rcar_gen3_init_otg(channel);
>   		rphy->otg_initialized = true;
> +	} else {
> +		/* Not OTG, so dr_mode should be set in PHY node */
> +		mode = usb_get_dr_mode(channel->dev);
> +		if (mode == USB_DR_MODE_HOST)
> +			writel(0x00000000, usb2_base + USB2_COMMCTRL);
> +		else if (mode == USB_DR_MODE_PERIPHERAL)
> +			writel(0x80000000, usb2_base + USB2_COMMCTRL);

    Maybe a *switch* instead?

MBR, Sergei
