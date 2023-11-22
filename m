Return-Path: <linux-renesas-soc+bounces-64-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9875B7F3C36
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 04:10:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9AF11C20E1D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 03:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3BD184C;
	Wed, 22 Nov 2023 03:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="vKUKMa3+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0CE790;
	Tue, 21 Nov 2023 19:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=OfQW1qmxZhQKpIIT2kztQGdLO0jGEZxstvdJgCDv2TU=; b=vKUKMa3+tHTGIkn/4AcfqSu/2Y
	8tXrAsgKUNJ2FiSUBLQt3kULa0WV2niwYB5cMpdYKXz8n+KQgk12vjum/Y0kfqp9H9f17yOo4P924
	dVDme704hHTODGxvcektN3uvQbua00GQtQS5l64Q9RNnL4Gj9f5z++6HnFL5JwNvmnL0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r5ddD-000onm-Ch; Wed, 22 Nov 2023 04:10:27 +0100
Date: Wed, 22 Nov 2023 04:10:27 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net v2 1/3] net: rswitch: Fix type of ret in
 rswitch_start_xmit()
Message-ID: <bafaaae9-3650-4c38-9d23-a54b73a56937@lunn.ch>
References: <20231122012556.3645840-1-yoshihiro.shimoda.uh@renesas.com>
 <20231122012556.3645840-2-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122012556.3645840-2-yoshihiro.shimoda.uh@renesas.com>

On Wed, Nov 22, 2023 at 10:25:54AM +0900, Yoshihiro Shimoda wrote:
> The type of ret in rswitch_start_xmit() should be netdev_tx_t. So,
> fix it.
> 
> Fixes: 3590918b5d07 ("net: ethernet: renesas: Add support for "Ethernet Switch"")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/net/ethernet/renesas/rswitch.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
> index 43a7795d6591..abaaa1112588 100644
> --- a/drivers/net/ethernet/renesas/rswitch.c
> +++ b/drivers/net/ethernet/renesas/rswitch.c
> @@ -1505,7 +1505,7 @@ static netdev_tx_t rswitch_start_xmit(struct sk_buff *skb, struct net_device *nd
>  	struct rswitch_device *rdev = netdev_priv(ndev);
>  	struct rswitch_gwca_queue *gq = rdev->tx_queue;
>  	struct rswitch_ext_desc *desc;
> -	int ret = NETDEV_TX_OK;
> +	netdev_tx_t ret = NETDEV_TX_OK;
>  	dma_addr_t dma_addr;

To keep with reverse christmas tree, ret needs moving up a bit.

   Andrew

