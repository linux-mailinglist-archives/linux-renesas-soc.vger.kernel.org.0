Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 709411F7E0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 17:41:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727354AbfEOPl0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 11:41:26 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:40235 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727454AbfEOPl0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 11:41:26 -0400
Received: by mail-lf1-f68.google.com with SMTP id h13so178007lfc.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 May 2019 08:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EqNptRPpkh+Mz1esaoA+w01X4hsIZLe8ln4Yj4kpUHM=;
        b=sf1BtMnk3C+GP71t3AAc1BHbg1OXwa/mNo0fP4jqkhzg2Lvv+YTriVRFdHob4roTnZ
         MWyE4aTdddpi9xbD1/Euk1FBAyJg3fZBn0J4uE7SS3N44mnGbF04vXPKzKZty6FLPt09
         aoizOYEGaqIMRyiDGDoUW5jGfyTB2KKeQOfz4aYSulmjk5PN8g7RbU1sa8K3OWYy3Vqu
         FqW4OR5r7e/IIY5gXslSbHbhih4B7wzKGmvcY2Zki/kXNbFSL+g5X3T8i4qALhbcLJxk
         b2Yx+OhUgqZm5gYyhhrfKQaAFG6oamjCrWkOrrPwjCVuovQ04s5VhnU9aVFHCxhPi0Jv
         a8Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=EqNptRPpkh+Mz1esaoA+w01X4hsIZLe8ln4Yj4kpUHM=;
        b=VFVFZCEhDkOwR6Ukccbk4aK2z9WeaONrwUqeveKktXj/8kanjp3R4h12niuo/i8g6I
         UQN1JuU6goUyVY0DZbLpvWaGqLNFxwqf6cHsfOVPWggbjKdhOfiSj8y4zfqBRyf2wmzM
         1hfkDyH76b9FT0RAWSxAiOa5ham1MIHru5Cv0reOfEzIGoW63zbm0WOELOOMidPJ+iqV
         q7iW8Fq2NNe9FJ/VWxHXC97094NmmKZShegIDd9N1DyILfhCQIvO3LOFRKkc66e4Ypsl
         sxwfImjqZZDdq2MMoP4+OwtJpKXAq6F82NDVVE0rnPkbdVV5+BDex/BRp/DpYo/H1UcW
         nqCA==
X-Gm-Message-State: APjAAAWYEiW0L/X6/jwWJ2aK6PRahfpeIXjCIAOdrgMuNQBbmcAUIB6R
        lyKwVUgkvewan80gSBhrvYuSYO7PP5Q=
X-Google-Smtp-Source: APXvYqxqsNHp3sR7YOUmeZzRszRgbklTV7wxcdZyV8FYCJVw3e3YwggdECvmL0axydK64oAAkc13eg==
X-Received: by 2002:a19:6a06:: with SMTP id u6mr21845212lfu.26.1557934883814;
        Wed, 15 May 2019 08:41:23 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.86.124])
        by smtp.gmail.com with ESMTPSA id u8sm437053lfi.83.2019.05.15.08.41.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 08:41:23 -0700 (PDT)
Subject: Re: [PATCH] net: sh_eth: fix mdio access in sh_eth_close() for some
 SoCs
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        davem@davemloft.net
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <1557898601-26231-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <0ab08e61-833d-1d9e-ef71-311964854d46@cogentembedded.com>
Date:   Wed, 15 May 2019 18:41:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1557898601-26231-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

   It's not "some SoCs", it's only R-Car gen2 and RZ/G1 SoCs.

On 05/15/2019 08:36 AM, Yoshihiro Shimoda wrote:

> The sh_eth_close() resets the MAC and then calls phy_stop()
> so that mdio read access result is incorrect without any error
> according to kernel trace like below:
> 
> ifconfig-216   [003] .n..   109.133124: mdio_access: ee700000.ethernet-ffffffff read  phy:0x01 reg:0x00 val:0xffff

   Not sure how RMII mode affects the MDIO transfers...

> To fix the issue, this patch adds a condition and set the RMII mode
> regiseter in sh_eth_dev_exit() for some SoCs.
> 
> Note that when I have tried to move the sh_eth_dev_exit() calling
> after phy_stop() on sh_eth_close(), but it gets worse.

   Ah, I was going to suggest changing the call order... what happens then?

> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/net/ethernet/renesas/sh_eth.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
> index e33af37..106ae90 100644
> --- a/drivers/net/ethernet/renesas/sh_eth.c
> +++ b/drivers/net/ethernet/renesas/sh_eth.c
> @@ -1596,6 +1596,10 @@ static void sh_eth_dev_exit(struct net_device *ndev)
>  
>  	/* Set MAC address again */
>  	update_mac_address(ndev);
> +
> +	/* Set the mode again if required */

   Should be "RMII mode", n ot just "Mode". We prolly need more detailed explanation...

> +	if (mdp->cd->rmiimode)
> +		sh_eth_write(ndev, 0x1, RMIIMODE);
>  }
>  
>  static void sh_eth_rx_csum(struct sk_buff *skb)

MBR, Sergei
