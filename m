Return-Path: <linux-renesas-soc+bounces-5774-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3568D81E7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2024 14:08:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE3DE28A094
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2024 12:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A07F2127B62;
	Mon,  3 Jun 2024 12:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eK8gc9go"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BB6127B57;
	Mon,  3 Jun 2024 12:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717416482; cv=none; b=F54+rcxBuzwX1NliwRTmaHKPZbYxnsZ4DWpWv/4/NaL8exohp+yg34fPVpwa3ztNSiSlpc093DALAwLuQDYioq+RwHamAqimce8VQXeI/qL3qtPI1tuS2JsxbpA+CmVoszMYnaAqwDIr0PfPbpUQOqj3BwJTEeJV/OzNeDHKmQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717416482; c=relaxed/simple;
	bh=t/kiuL7yysUaDv9h6Ko6pozdzy1YUywrInZQqgLCv44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iwfCWFKjHRarUOt6C+900sReiM4WRwhyCbd88Pc7yJt+5HV7GGEpTnt/OeWt2nOMfEYt39PVtZZMbPGsv0bzNXKeZax3xGPxy90pxT380d7RV0ChNHhBOMum9R1IZVrzgMlzUwk2efxb/tiHLQHXAXajMs6gzrigbd3dEZX596c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eK8gc9go; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5A04C32789;
	Mon,  3 Jun 2024 12:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717416482;
	bh=t/kiuL7yysUaDv9h6Ko6pozdzy1YUywrInZQqgLCv44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eK8gc9gom/rDp6a2ivWGEmPiZvktpCzm9yLbvH/8D3YAGF/LO5lCUbTvHL0Mn8vYH
	 vwC1mJnH5RaW9eaGocojBeBWvnDCCxcuMLJ0vBCVnY3ZdPUR9j9gq4du2znJsey57/
	 78IpPvjHjnlfABGh8mBVN/HcSbaVOcjP0b5ZqtezJze0cJIlMRZSbjxRh2GsdK70yy
	 sug3kyCGOBIMks0HnU8/u5A+QQoo33ESTsL/x7Vbunq4aJMOZMTQqS4Ww6ENO7YLQ+
	 kRNvR3sNNYwKDUpCSF91VjnGDC1+OliSl+R6dXzfxLjb0XaVnaZA4j/Kvz8d4rRjf4
	 zV1ukoFOwLe0Q==
Date: Mon, 3 Jun 2024 13:07:57 +0100
From: Simon Horman <horms@kernel.org>
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH v4 7/7] net: ravb: Allocate RX buffers via page
 pool
Message-ID: <20240603120757.GX491852@kernel.org>
References: <20240528150339.6791-1-paul.barker.ct@bp.renesas.com>
 <20240528150339.6791-8-paul.barker.ct@bp.renesas.com>
 <20240601101300.GA491852@kernel.org>
 <6165a9a3-15ec-4a40-901a-17c2be64daf1@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6165a9a3-15ec-4a40-901a-17c2be64daf1@bp.renesas.com>

On Mon, Jun 03, 2024 at 09:02:51AM +0100, Paul Barker wrote:
> On 01/06/2024 11:13, Simon Horman wrote:
> > On Tue, May 28, 2024 at 04:03:39PM +0100, Paul Barker wrote:

...

> >> @@ -298,13 +269,14 @@ static void ravb_ring_free(struct net_device *ndev, int q)
> >>  		priv->tx_ring[q] = NULL;
> >>  	}
> >>  
> >> -	/* Free RX skb ringbuffer */
> >> -	if (priv->rx_skb[q]) {
> >> -		for (i = 0; i < priv->num_rx_ring[q]; i++)
> >> -			dev_kfree_skb(priv->rx_skb[q][i]);
> >> +	/* Free RX buffers */
> >> +	for (i = 0; i < priv->num_rx_ring[q]; i++) {
> >> +		if (priv->rx_buffers[q][i].page)
> >> +			page_pool_put_page(priv->rx_pool[q], priv->rx_buffers[q][i].page, 0, true);
> > 
> > nit: Networking still prefers code to be 80 columns wide or less.
> >      It looks like that can be trivially achieved here.
> > 
> >      Flagged by checkpatch.pl --max-line-length=80
> 
> Sergey has asked me to wrap to 100 cols [1]. I can only find a reference
> to 80 in the docs though [2], so I guess you may be right.
> 
> [1]: https://lore.kernel.org/all/611a49b8-ecdb-6b91-9d3e-262bf3851f5b@omp.ru/
> [2]: https://www.kernel.org/doc/html/latest/process/coding-style.html

Hi Paul,

If Sergey prefers 100 then I won't argue :)

FWIIW, think what has happened here relates to the Kernel, at some point,
going from 80 to 100 columns as the preferred maximum width, while Networking
stuck with 80.

...






