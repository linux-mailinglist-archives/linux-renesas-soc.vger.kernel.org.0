Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7DEE524660
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 May 2022 09:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347633AbiELHC4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 May 2022 03:02:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350711AbiELHCn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 May 2022 03:02:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9E8AA4A3CD
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 May 2022 00:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652338958;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5dnSgXgDqm6uywdT7uNCvIvTgOmlGJ/1yy1mRaIg9zk=;
        b=YbVDF+nBBNnl7Nfj+vXBjIpEYPyKjEzlTTGAd77im8Qc7qvuzSaoRjntN8KHYDKIlFOD1w
        uSVmgjXN7LSbm4ZVhRBLfZqQ9E2MEperCvDTCnwRKE9j5QHDZqrFPL49h94fzvhYRglFep
        N517VqTagub/4O5Mntk5CWNHFE04vDQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-MO0RP2VcN-S7a3iWhYiK5w-1; Thu, 12 May 2022 03:02:36 -0400
X-MC-Unique: MO0RP2VcN-S7a3iWhYiK5w-1
Received: by mail-wm1-f70.google.com with SMTP id z23-20020a05600c221700b003942fd37764so3972111wml.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 May 2022 00:02:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=5dnSgXgDqm6uywdT7uNCvIvTgOmlGJ/1yy1mRaIg9zk=;
        b=jbUe8ANBe42yT37WiwKdCZHm9qcAv9eh/MVQwRebMTlCXtXLOBeNDnyUvMWWt8UNDy
         xeZG/JoviLTvSE/ZQ53dRYCFSuDpLA0+Hlosd1MH/ta8e04VO74WQTBXNB61Khn2n8wr
         uPn0lltD84jKJAuqBFyHzMWIDHEwZsJwjKVmlhnJuv5l7sVzuO3lrv9A1LVXoi6EMb+7
         GGr9nX95J5CkE1iXcm5B6E1WOAotaJBxZ17IFkLge57Thod3xjp+seRWq/bvGM4alAZp
         q+gry/ltwm9EoDvU/3X5YbK6aJJ7owQBXEIT+tGTac6RO4NhMHDzOor++8gNy7U516hs
         SEGw==
X-Gm-Message-State: AOAM530K2+TQo3xE1ImHVLK8o/+JkcZrvVdTlMXlZNf6n3NylJMoMfpk
        HXG3QgwNM744+M5L+zxRubp7B4FwY/7l/uVeQuyp7N97feBaIH9r4wKC3AT+T+590beNMUdA76X
        d8agpV5JuD6lLO3Ejofg2GB5cWd0OumA=
X-Received: by 2002:a5d:47ca:0:b0:20c:72c9:d3be with SMTP id o10-20020a5d47ca000000b0020c72c9d3bemr25478411wrc.114.1652338954444;
        Thu, 12 May 2022 00:02:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzA/sRB+d1I+yqn5MiN+ckHAMIh91n67y2w7zcSYVVJ6ZulnL1r7Bzm8OHowDH45toQlJDbQA==
X-Received: by 2002:a5d:47ca:0:b0:20c:72c9:d3be with SMTP id o10-20020a5d47ca000000b0020c72c9d3bemr25478391wrc.114.1652338954210;
        Thu, 12 May 2022 00:02:34 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-113-89.dyn.eolo.it. [146.241.113.89])
        by smtp.gmail.com with ESMTPSA id h15-20020a5d6e0f000000b0020c5253d8besm3475713wrz.10.2022.05.12.00.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 00:02:33 -0700 (PDT)
Message-ID: <041789819aa163907ef27fed537dfca16d293f4d.camel@redhat.com>
Subject: Re: [PATCH v3 4/5] ravb: Use separate clock for gPTP
From:   Paolo Abeni <pabeni@redhat.com>
To:     Phil Edworthy <phil.edworthy@renesas.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Date:   Thu, 12 May 2022 09:02:32 +0200
In-Reply-To: <20220510090336.14272-5-phil.edworthy@renesas.com>
References: <20220510090336.14272-1-phil.edworthy@renesas.com>
         <20220510090336.14272-5-phil.edworthy@renesas.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 2022-05-10 at 10:03 +0100, Phil Edworthy wrote:
> RZ/V2M has a separate gPTP reference clock that is used when the
> AVB-DMAC Mode Register (CCC) gPTP Clock Select (CSEL) bits are
> set to "01: High-speed peripheral bus clock".
> Therefore, add a feature that allows this clock to be used for
> gPTP.
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> ---
> v3:
>  - No change
> v2:
>  - Added Reviewed-by tags
> ---
>  drivers/net/ethernet/renesas/ravb.h      |  2 ++
>  drivers/net/ethernet/renesas/ravb_main.c | 15 ++++++++++++++-
>  2 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
> index e505e8088445..b980bce763d3 100644
> --- a/drivers/net/ethernet/renesas/ravb.h
> +++ b/drivers/net/ethernet/renesas/ravb.h
> @@ -1031,6 +1031,7 @@ struct ravb_hw_info {
>  	unsigned err_mgmt_irqs:1;	/* Line1 (Err) and Line2 (Mgmt) irqs are separate */
>  	unsigned gptp:1;		/* AVB-DMAC has gPTP support */
>  	unsigned ccc_gac:1;		/* AVB-DMAC has gPTP support active in config mode */
> +	unsigned gptp_ref_clk:1;	/* gPTP has separate reference clock */
>  	unsigned nc_queues:1;		/* AVB-DMAC has RX and TX NC queues */
>  	unsigned magic_pkt:1;		/* E-MAC supports magic packet detection */
>  	unsigned half_duplex:1;		/* E-MAC supports half duplex mode */
> @@ -1042,6 +1043,7 @@ struct ravb_private {
>  	void __iomem *addr;
>  	struct clk *clk;
>  	struct clk *refclk;
> +	struct clk *gptp_clk;
>  	struct mdiobb_ctrl mdiobb;
>  	u32 num_rx_ring[NUM_RX_QUEUE];
>  	u32 num_tx_ring[NUM_TX_QUEUE];
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index 8ccc817b8b5d..ef6967731263 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -2495,11 +2495,15 @@ MODULE_DEVICE_TABLE(of, ravb_match_table);
>  static int ravb_set_gti(struct net_device *ndev)
>  {
>  	struct ravb_private *priv = netdev_priv(ndev);
> +	const struct ravb_hw_info *info = priv->info;
>  	struct device *dev = ndev->dev.parent;
>  	unsigned long rate;
>  	uint64_t inc;
>  
> -	rate = clk_get_rate(priv->clk);
> +	if (info->gptp_ref_clk)
> +		rate = clk_get_rate(priv->gptp_clk);
> +	else
> +		rate = clk_get_rate(priv->clk);
>  	if (!rate)
>  		return -EINVAL;
>  
> @@ -2721,6 +2725,15 @@ static int ravb_probe(struct platform_device *pdev)
>  	}
>  	clk_prepare_enable(priv->refclk);
>  
> +	if (info->gptp_ref_clk) {
> +		priv->gptp_clk = devm_clk_get(&pdev->dev, "gptp");
> +		if (IS_ERR(priv->gptp_clk)) {
> +			error = PTR_ERR(priv->gptp_clk);
> +			goto out_release;
> +		}
> +		clk_prepare_enable(priv->gptp_clk);
> +	}
> +

I guess you need to a conditional

	clk_disable_unprepare(info->gptp_ref_clk)

in the error path? And even in ravb_remove()?

>  	ndev->max_mtu = info->rx_max_buf_size - (ETH_HLEN + VLAN_HLEN + ETH_FCS_LEN);
>  	ndev->min_mtu = ETH_MIN_MTU;
>  

