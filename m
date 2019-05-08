Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5266517D9F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2019 17:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727133AbfEHP7G (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 May 2019 11:59:06 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:36628 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726703AbfEHP7G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 May 2019 11:59:06 -0400
Received: by mail-lf1-f67.google.com with SMTP id y10so8255886lfl.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 May 2019 08:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=D4tDI8tlLsvbZ7IxR+qMD+wAbYd3MY+S7ZR3jjkUEmg=;
        b=0AYB0WqhHteO8x7C6zgnenXbebeWGk1MzVTGXvdQqIim5JlCNkyeSyR81iHDabWImd
         ZRI3AshOafrAsfCctHw9TabnVGnry0cRl6X9DKj0FjtEoHbuNo0Xopg9f3cvbyjkBM6S
         +7w505lxuEj3giayIWKa/gSL4PTxoQKGoJBvdd2dxHbGt9ag1GEkFS3Uawnimc1ABcLs
         Zyc/zw+YyGubronE1pr9EUVzF8FfcSJtS/QJjzjqrvYbi0Bbe4+zcTtr3wEAQvzAa22z
         N4gtU48/SbHnYIjChpnMisnGJmM+2ptdgLk4zr8weQR+G2tfDugH7RslY0hRBl/g4Xkx
         2/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=D4tDI8tlLsvbZ7IxR+qMD+wAbYd3MY+S7ZR3jjkUEmg=;
        b=HTPwHOE+Kw1sg2kQT43XpsopxkiOpJjiFhQbFzdgmvDg9P9xApwi+Kk3o1hVzkk1uS
         GBDcaMHm4lqc7PT5DDVIKrrNXC5DxHc+qVuO4QcrrgtHyDy9M/DZu+A8a61cfWrTUS1J
         KoyXL/1nJJpom3gegXrQTAiEkccvoYzwRpdCPGK9ldFq7v0cW4qgOE6NttNPLQINYY0/
         1hjnjTm7CYmWUzUahsYOKn6yt62/LFwpYz8z+uUdu1ciGPe2uSiVhTVZc01U7Zk0uyhs
         rUINkiMS/AWgUL2gfRWDfe5GnjjBQQq5j/i/FTp14Yvw544mDAXD839BmO/0XuI5QEb8
         ZeVw==
X-Gm-Message-State: APjAAAWCyuXRL4MIXoDWl2iTm+JP9u2TiK92esf4K3RLGL8gUER2LUpq
        K4P8pYHg01bbvfkckjd/UcSzOA==
X-Google-Smtp-Source: APXvYqxqrWzjM77lxJkaDBxNKVASpMWaQcjEGGNDHPmRAymV58YFRd0Vu/eo16cZVgtCWOlXHQDQ6g==
X-Received: by 2002:a19:e619:: with SMTP id d25mr9994771lfh.66.1557331144272;
        Wed, 08 May 2019 08:59:04 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.83.184])
        by smtp.gmail.com with ESMTPSA id q6sm4090376lff.26.2019.05.08.08.59.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 May 2019 08:59:02 -0700 (PDT)
Subject: Re: [PATCH] ravb: implement MTU change while device is up
To:     Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-renesas-soc@vger.kernel.org
Cc:     netdev@vger.kernel.org, davem@davemloft.net, wsa@the-dreams.de,
        horms@verge.net.au, magnus.damm@gmail.com
References: <1557328882-24307-1-git-send-email-uli+renesas@fpond.eu>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <1f7be29e-c85a-d63d-c83f-357a76e8ca45@cogentembedded.com>
Date:   Wed, 8 May 2019 18:59:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1557328882-24307-1-git-send-email-uli+renesas@fpond.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 05/08/2019 06:21 PM, Ulrich Hecht wrote:

> Uses the same method as various other drivers: shut the device down,
> change the MTU, then bring it back up again.
> 
> Tested on Renesas D3 Draak board.
> 
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

   You should have CC'ed me (as an reviewer for the Renesas drivers).

> ---
>  drivers/net/ethernet/renesas/ravb_main.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

   What about sh_eth?

> 
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index ef8f089..02c247c 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -1810,13 +1810,16 @@ static int ravb_do_ioctl(struct net_device *ndev, struct ifreq *req, int cmd)
>  
>  static int ravb_change_mtu(struct net_device *ndev, int new_mtu)
>  {
> -	if (netif_running(ndev))
> -		return -EBUSY;
> +	if (!netif_running(ndev)) {
> +		ndev->mtu = new_mtu;
> +		netdev_update_features(ndev);
> +		return 0;
> +	}
>  
> +	ravb_close(ndev);
>  	ndev->mtu = new_mtu;
> -	netdev_update_features(ndev);
>  
> -	return 0;
> +	return ravb_open(ndev);

   How about the code below instead?

	if (netif_running(ndev))
		ravb_close(ndev);

 	ndev->mtu = new_mtu;
	netdev_update_features(ndev);

	if (netif_running(ndev))
		return ravb_open(ndev);

	return 0;

[...]

MBR, Sergei
