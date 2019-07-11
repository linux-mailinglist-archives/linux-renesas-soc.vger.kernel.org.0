Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50CFE6513D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2019 06:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728294AbfGKEkc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Jul 2019 00:40:32 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:33565 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728286AbfGKEkb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Jul 2019 00:40:31 -0400
Received: by mail-pg1-f196.google.com with SMTP id m4so2292287pgk.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jul 2019 21:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=s0bvr757x/HKgrr4SbWQu6+ri+feUWUbw08Pt9QAMgg=;
        b=DYpUQkWdlDtQn6Fhy6+8tVMVE8yop90FkZt4Dtb69W5juQjpRM2mwMpVBKMc44Hyds
         O//APATsYeHnfMQEcPtYlljgmsP+mcWKGpYTxoeKL63s1iuHt7lIngrC+J+LH4ibuKZq
         S37m/GvoHuaxwaNzqwNza14matP7/YQlq+ZasImTcwEMj4EXtLcdNa0CUMyD6OTvYOCu
         ytJTSIkh6qimYgWl/UJprVq3v8vQGm9nttmtoYGteQcYp4zpqdfZkJC1OJX3We6vo7d5
         OjMUJXS0mRpNy3ZqWS+raPPQRsyfxzIIKvz7/YdV6ReaiAvXeqvetTolVo1diGiutqmk
         rtGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=s0bvr757x/HKgrr4SbWQu6+ri+feUWUbw08Pt9QAMgg=;
        b=qomlYrB7zQRXAj7qmmvtViGm48a1zW3k8887RGc/HS4uGgRXZ6sW5v0ZnksmAZ32iU
         uPOsjb3bVUXrKbi1hfpU2/9rA5A0obYOeGPlQAbsHu2IbBZHv5IgH2KW7RNEF4E+sfbp
         qPkapqPPOuCHafDzIMDPzwkHGiv50wPuRfZSZbYtawYw5Yy8VkQMi09aA708y52amYcX
         GXz1YBHK8Y44e5OCg06GeQb9o9MA6hgsmpx4wd5zqh/vx5Uvq8lrf3UVr4bWoptfbyPO
         t80LJ7xZI+HHMqBu4uckJyyGhs92yCGzFMAveYiAIRZX0QqLiidGA3egkmxDGNCyVJTJ
         QfWA==
X-Gm-Message-State: APjAAAUviVTOH+LOxJJD1UcF9psllejuVtHr/HaSTOK2/kKwyl6brrtR
        H7um3c7xG+eVh3ZbyXBV5YE=
X-Google-Smtp-Source: APXvYqwlQpsbmXVpeN6NqHngMcXHiN6TsPBlygpq4xNU3S/XaZ+hBwUMo6avXye+V8k/sqLQkWu2kA==
X-Received: by 2002:a63:6fc9:: with SMTP id k192mr2204626pgc.20.1562820031052;
        Wed, 10 Jul 2019 21:40:31 -0700 (PDT)
Received: from localhost (softbank126163157105.bbtec.net. [126.163.157.105])
        by smtp.gmail.com with ESMTPSA id v8sm3363164pgs.82.2019.07.10.21.40.29
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 10 Jul 2019 21:40:30 -0700 (PDT)
Date:   Thu, 11 Jul 2019 13:40:27 +0900
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: i2c: adv748x: Convert to new i2c device probe()
Message-ID: <20190711044027.GG1557@wyvern>
References: <20190710123719.3376-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190710123719.3376-1-kieran.bingham+renesas@ideasonboard.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thanks for your patch.

On 2019-07-10 13:37:19 +0100, Kieran Bingham wrote:
> The I2C core framework provides a simplified probe framework from commit
> b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new() call-back type").
> 
> Convert the ADV748x to utilise this simplfied i2c driver registration.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Looks good,

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/i2c/adv748x/adv748x-core.c | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
> index 097e94279cf7..ae2b6eb93e09 100644
> --- a/drivers/media/i2c/adv748x/adv748x-core.c
> +++ b/drivers/media/i2c/adv748x/adv748x-core.c
> @@ -677,8 +677,7 @@ static void adv748x_dt_cleanup(struct adv748x_state *state)
>  		of_node_put(state->endpoints[i]);
>  }
>  
> -static int adv748x_probe(struct i2c_client *client,
> -			 const struct i2c_device_id *id)
> +static int adv748x_probe(struct i2c_client *client)
>  {
>  	struct adv748x_state *state;
>  	int ret;
> @@ -806,13 +805,6 @@ static int adv748x_remove(struct i2c_client *client)
>  	return 0;
>  }
>  
> -static const struct i2c_device_id adv748x_id[] = {
> -	{ "adv7481", 0 },
> -	{ "adv7482", 0 },
> -	{ },
> -};
> -MODULE_DEVICE_TABLE(i2c, adv748x_id);
> -
>  static const struct of_device_id adv748x_of_table[] = {
>  	{ .compatible = "adi,adv7481", },
>  	{ .compatible = "adi,adv7482", },
> @@ -825,9 +817,8 @@ static struct i2c_driver adv748x_driver = {
>  		.name = "adv748x",
>  		.of_match_table = adv748x_of_table,
>  	},
> -	.probe = adv748x_probe,
> +	.probe_new = adv748x_probe,
>  	.remove = adv748x_remove,
> -	.id_table = adv748x_id,
>  };
>  
>  module_i2c_driver(adv748x_driver);
> -- 
> 2.20.1
> 

-- 
Regards,
Niklas S�derlund
