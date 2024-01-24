Return-Path: <linux-renesas-soc+bounces-1745-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B6D839DF6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 02:09:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A4D3B216F4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 01:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9346710E3;
	Wed, 24 Jan 2024 01:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O1wMluka"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B19E137B;
	Wed, 24 Jan 2024 01:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706058563; cv=none; b=CZXRTkvWS5eWlgKXBFqkjp8WuEIk/8PU+90AJDTRWMW3aqlzzXkYlG/53O+ZDbmA8rTJZCdmAWunQEUGfeLldhoPp5dp1aphm/hEhQ1XX6n0eD+Iy+rRDFibpaA4kXs3AWnITr4BVfTwPmdBbCUPh9b330xvYEp9SzLlsP9OewI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706058563; c=relaxed/simple;
	bh=hh+BQBDKz7XNgSUhocwrdf0ZJxAtOsRrIA4Y4xBDuAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gQDwPlhIK0JfTYKNKaSnyuf6qo27OHBCNSqcWQ1Mdp3mvEdy+vv9uAX2XTgFf5JXj31H0idI5dI9ZLf/Nt/n4ayOWsjY+Bk3uROwBPkoLu3sJiCkMEK8M+n+QhgsJV2NPXDbckSI6Mlx8v/YjdZn7XRGf87BxQ5aWJC2APEO2s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O1wMluka; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6AFFC433F1;
	Wed, 24 Jan 2024 01:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706058563;
	bh=hh+BQBDKz7XNgSUhocwrdf0ZJxAtOsRrIA4Y4xBDuAQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=O1wMluka/uXixVJQrH8yD4sb19h30O5qLKpQjZqIHtk8baGxHk2vaVkE2bBabxq8I
	 +wFON6A1OCvMdCoDOBX+/ae1aN0Dw8VVbJZD6yhp1bA0fmluco84DThmnVde1kVS6r
	 fPdYkpFfvtEaEisL/OUfgHgzeavfq9VVzpXrq41neRffd8DmqmJVDY1ZS/voQME25c
	 EOBXU/YNK0c4YfyuDFFojhURVfHPLO7g7dkeWOMj02FWbJG8xv3FUpkGOGO2Xj4t/Z
	 a4plablGfJkvdF/wBTjYNdITaWqVGx9vutOD4exYFHRhUk57JX2NVaj2dlKpydkcKQ
	 YRmf8pqGyxiXg==
Date: Tue, 23 Jan 2024 17:09:21 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Sergey Shtylyov
 <s.shtylyov@omp.ru>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Nikita Yushchenko
 <nikita.yoush@cogentembedded.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven
 <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH net-next 1/2] ravb: Add Rx checksum offload support
Message-ID: <20240123170921.51089d41@kernel.org>
In-Reply-To: <20240123151924.373917-2-biju.das.jz@bp.renesas.com>
References: <20240123151924.373917-1-biju.das.jz@bp.renesas.com>
	<20240123151924.373917-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 23 Jan 2024 15:19:23 +0000 Biju Das wrote:
> +static void ravb_rx_csum_gbeth(struct sk_buff *skb)
> +{
> +	__sum16 csum_ip_hdr, csum_proto;
> +	u8 *hw_csum;
> +
> +	/* The hardware checksum status is contained in sizeof(__sum16) * 2 = 4
> +	 * bytes appended to packet data. First 2 bytes is ip header csum and
> +	 * last 2 bytes is protocol csum.
> +	 */
> +	if (unlikely(skb->len < sizeof(__sum16) * 2))
> +		return;
> +
> +	hw_csum = skb_tail_pointer(skb) - sizeof(__sum16);
> +	csum_proto = csum_unfold((__force __sum16)get_unaligned_le16(hw_csum));
> +
> +	hw_csum -= sizeof(__sum16);
> +	csum_ip_hdr = csum_unfold((__force __sum16)get_unaligned_le16(hw_csum));
> +	skb_trim(skb, skb->len - 2 * sizeof(__sum16));
> +
> +	/* TODO: IPV6 Rx csum */
> +	if (skb->protocol == htons(ETH_P_IP) && csum_ip_hdr == TOE_RX_CSUM_OK &&
> +	    csum_proto == TOE_RX_CSUM_OK)
> +		/* Hardware validated our checksum */
> +		skb->ip_summed = CHECKSUM_UNNECESSARY;
> +}

sparse does not seem to be onboard:

drivers/net/ethernet/renesas/ravb_main.c:771:20: warning: incorrect type in assignment (different base types)
drivers/net/ethernet/renesas/ravb_main.c:771:20:    expected restricted __sum16 [usertype] csum_proto
drivers/net/ethernet/renesas/ravb_main.c:771:20:    got restricted __wsum
drivers/net/ethernet/renesas/ravb_main.c:774:21: warning: incorrect type in assignment (different base types)
drivers/net/ethernet/renesas/ravb_main.c:774:21:    expected restricted __sum16 [usertype] csum_ip_hdr
drivers/net/ethernet/renesas/ravb_main.c:774:21:    got restricted __wsum
-- 
pw-bot: cr

