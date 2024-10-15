Return-Path: <linux-renesas-soc+bounces-9734-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC83F99DFA6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 09:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 322F0B2240C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 07:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 893F51ABEB8;
	Tue, 15 Oct 2024 07:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GTCcg14r"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F1018A6D9
	for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Oct 2024 07:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728978567; cv=none; b=EIyp90f5nV0vFmhweSiA1KumhE2hqcz7MegAYvLfGTHUaCbrRzw2Bv7WTbvyTsdq5T+lWityR333kaLgmypuspA3WI/dDDLfll2KxAAnS3GNm9ye4MqR1DcPczdhejtO1S9wLEDOP7GNLC7rxq26J2Dkf2G5yis79Pw0TQlY0gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728978567; c=relaxed/simple;
	bh=1gbWcAskLtuIcyihhu9c+7AfMGCc9qrTqDcakMl2d+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tmyjLlwXNxT21WAqjmBZakbPTssQvdYP28JUL5P3qOO8yJjtcfbos0GGM7+BiM6K4zgV5XzYG9IWAUjaJDRwtJJoBTf3NI4PWdhbSbinjydQYErZmJE2sxRagl5sZx1tTEdKM6geGxpOYe/1akzBFeXY3f80EJawFQYg3vrNGF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GTCcg14r; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c957d8bce2so2579168a12.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Oct 2024 00:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728978563; x=1729583363; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0icc/AUQ8WVT9pXXaqfsQ+O84Dh7jPoXBxzIImpUACo=;
        b=GTCcg14rHhLxuY0wtwMLls1VHqF8SEfFaSDJanyI/VaANG99hlebvaY61UVYWK1+rk
         CC90qtqs0TUPOlRl4cvNgwXXVBcOQTTB7Sp8oekhfAr3uHWCPqbXl6tCP4hU3OzuUMI+
         EmtZbXFmkx9/QkTWf03H+FY1WqAClHR6HF6XJQeMe39205yYtOHat+Hel63w6WiyT5OY
         ZLKM6ci2sqrPW4S6/MCNK0VPtgSOzor4lBuqDgqGfUqFqtf+f3n7cX6iCQmth4MUe1jf
         A09IJpuLKqzu96hL9B0MPVCDaILmGdPjmFTdFuuxheCZ41alamsHzt7FS/Pz0TrQiB7f
         SJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728978563; x=1729583363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0icc/AUQ8WVT9pXXaqfsQ+O84Dh7jPoXBxzIImpUACo=;
        b=N6txo3ZXiTi1dnsLFRKfk6q8y47CKKLmAkM4aR3YLrDxF7EJokjJtlZ0iqW5fH8Ugy
         0lsjrjhpASA9SLJM25kYNR8PGz9CvRf1pDp5Ut0u+/H1fo29C9l9xUOgPiIkHc26xOr0
         PEkDArNT9WMHzLN4dLcb3BuIp+Mo3atnh25KEEr703eWC2Axx6XXP9enlRzqb//khlIQ
         OI+o+ZYk+YnO9ROtCHiQBS4mm/qvzNJuJBwTDCuNU3Rck+mYHIawSNzZ1tA0vFPXUI8O
         naQTBjVOyCSzDiXTFRFraFwq0gveQFgBY/GE4XSV/766PN10f76fM2q1NzV/PcpuBFOg
         wMgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyZ7lElnQlM+U6AYHgWpOYHuDuPA6svABucCkGaw0fdoW7svqYLr/JZsGxc36jbrGCUSC0JQdxXpSGqki3MAypqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZDg6ICer3lyPWA0Y9soA5+T7X843LxdxVhmHwffvMfQ6u2W1b
	mRVfZ4c4eM7MsDx9au498URHL8d1A8MHMLCDCycsk8s23RIRP8rZl003ydoW6MTgAFXw8D6D/bB
	4hwNTJ+te6bldI7LFjjkzyQ3bcgrljHL2GYbY
X-Google-Smtp-Source: AGHT+IEUPCLq2fMi1HPzgRwWyYlbPVHtF7hRqZjN4RQ4wB4rew35OMAVkyEDQ/mvrIfOIMfqQ0lMowiG4CPB+1QSuyw=
X-Received: by 2002:aa7:d38c:0:b0:5c8:8cf5:e97a with SMTP id
 4fb4d7f45d1cf-5c95ac6353bmr13764361a12.33.1728978562972; Tue, 15 Oct 2024
 00:49:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014144250.38802-1-wanghai38@huawei.com>
In-Reply-To: <20241014144250.38802-1-wanghai38@huawei.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 15 Oct 2024 09:49:11 +0200
Message-ID: <CANn89i+LwDrV4km4iymw4yXU+kVMAvhmLUk2x_bmKXD_Bphi5w@mail.gmail.com>
Subject: Re: [PATCH net] net: ethernet: rtsn: fix potential memory leak in rtsn_start_xmit()
To: Wang Hai <wanghai38@huawei.com>
Cc: niklas.soderlund@ragnatech.se, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, andrew@lunn.ch, zhangxiaoxu5@huawei.com, 
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 4:43=E2=80=AFPM Wang Hai <wanghai38@huawei.com> wro=
te:
>
> The rtsn_start_xmit() returns NETDEV_TX_OK without freeing skb
> in case of skb->len being too long, add dev_kfree_skb_any() to fix it.
>
> Fixes: b0d3969d2b4d ("net: ethernet: rtsn: Add support for Renesas Ethern=
et-TSN")
> Signed-off-by: Wang Hai <wanghai38@huawei.com>
> ---
>  drivers/net/ethernet/renesas/rtsn.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/ethernet/renesas/rtsn.c b/drivers/net/ethernet/r=
enesas/rtsn.c
> index f9f63c61d792..6b3f7fca8d15 100644
> --- a/drivers/net/ethernet/renesas/rtsn.c
> +++ b/drivers/net/ethernet/renesas/rtsn.c
> @@ -1057,6 +1057,7 @@ static netdev_tx_t rtsn_start_xmit(struct sk_buff *=
skb, struct net_device *ndev)
>         if (skb->len >=3D TX_DS) {
>                 priv->stats.tx_dropped++;
>                 priv->stats.tx_errors++;
> +               dev_kfree_skb_any(skb);
>                 goto out;
>         }
>

Note this is dead code for this driver. This condition should never be
hit with checks in upper layers,
because TX_DS is bigger than device max mtu.

Reviewed-by: Eric Dumazet <edumazet@google.com>

