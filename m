Return-Path: <linux-renesas-soc+bounces-9732-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E996799DEE7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 08:58:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 65014B244C6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 06:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF08B19E990;
	Tue, 15 Oct 2024 06:58:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5D818BBAB;
	Tue, 15 Oct 2024 06:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728975502; cv=none; b=D4FqU0lYlmJWHm56aX8MOoP0TgDlbYbYx1JRuU1n8eJo25fl05dOC/hTwvdxxITS8X46gnmSYKcP4Wu/7sQQ+tomHJyzW81YEfpSUbU8fKl+A98ALQGbtYnzU+21cFOmuNBCSIjyHvnzdOZ1aDJtaHr6w/qIWEQilqaGbEaZr5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728975502; c=relaxed/simple;
	bh=P9MrTrTcqFC6kqabqOk1UqStUxOy6sPc0vuL+9AyT6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nnitznuoW0LMeUV+WdEf4rRwiB1zefmIYmdAprtHU/EMUuOYou8VtBlelNXkYTtdGY7iJR+FcFYA6OwkF2wVY76IGrqiiR0aF2/LYUmw3ssm3MbW3LBn4t92CCg5AdlVuyvimQ0lDZhistjr1oFSN4if1kXvNo5+QwCVROyoX4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e2e41bd08bso51771397b3.2;
        Mon, 14 Oct 2024 23:58:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728975498; x=1729580298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9ZJm1Xd625FdxJzOYOI4sM0DLZMI3AC9koPfqu1w8M=;
        b=pGLB8ns1wYzgGuXQYWHly3Orx5R6pJj9gc3V8HqN79JBDNb4/iJaYKVg1+8ngjulHp
         IqMzYdX7CJz0kf/SdKX3GPaQqaH/4aPp940Nb8igkPXr2OgKiMH5UCSIB5w/kD4Dhjgx
         /hDWC4By8eo6GgocTCzdHjxm3Byz8tGbTv8TSM1VUiApKAYYe9zEFxS+g9YP5BxI549X
         ZZiXWA9Q4J46BMcGpNVOZ+gfgNVnj21S1dn4TDxlIbR4oBst6s8ReVyhW1yBTB3pv6sF
         i27oqGzbOmu/Zxk2piesKhuKni+7YPgG/gboWdP6em6dF1U0WJrTy8E490Et7fZGk2bt
         IYIg==
X-Forwarded-Encrypted: i=1; AJvYcCWwHoy4m672zZAEeaOgWWnk6YUl6rJSuLo0EsUvWySZRG198MWsyAEZ3AjTPD3vZ8iZXysSbIjTTiVImM4GeN6tWuY=@vger.kernel.org, AJvYcCXTuQSIO9s2dyXtiuTKu4WkjdseHEZWv/wj3GWCgCECcW7pPdX6XdLVbXdeTRunCwR+krathl9T@vger.kernel.org, AJvYcCXxCgvafcve027yo36vBs49wAxK4fbnQ6pEOETzYO1Ml8GeJ4jV+txc9EVm5TLtGRGSxxodDyrwoSibPlk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEm8kEAM5J7C3pyumoRkJItB6CMVz/dJG6PgdCgJH7TQNRmR+z
	sAeRRZH7RxAV95sK8Hby0zC2lLvF1WaCI0hraG/DcxrzrIDRnh7ez8tuZJc9
X-Google-Smtp-Source: AGHT+IHA+MH43tB9UIrPwzv6bPmRwFFpteWXQmDwBJ2qbk1WkYfI2P/4GdyDgpNMpJ7vr/9CvqDp8g==
X-Received: by 2002:a05:690c:6711:b0:6db:deb7:d693 with SMTP id 00721157ae682-6e364347ac3mr83851867b3.22.1728975497593;
        Mon, 14 Oct 2024 23:58:17 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e3c5b52391sm1583577b3.58.2024.10.14.23.58.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 23:58:16 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e29267b4dc4so3016641276.0;
        Mon, 14 Oct 2024 23:58:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU8X0M8jE7t1zVHJkI0CQqwJ5KJIxeavmCJmXr73zzhFmwYGs79mSLTrov6ocDM1bDLDdHljZcUwM06LzQ=@vger.kernel.org, AJvYcCVfswXD1ae6qDfJ7ucfBlOwCs61xfBPlloirAtYyPSl4nytSMAyYsOO0tUpHzIPRKOVrze3aMYLRQR5PSgbYLRS8eM=@vger.kernel.org, AJvYcCWHp95jxOj8KRerAX/6ZjXohF/9rCbm8QZGk2PsvAFzgsb6iTHVsiorVT+SSVzQjYlrRMcksgxk@vger.kernel.org
X-Received: by 2002:a05:6902:705:b0:e24:cae9:4e39 with SMTP id
 3f1490d57ef6-e2931ddba31mr7343624276.51.1728975496145; Mon, 14 Oct 2024
 23:58:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014144250.38802-1-wanghai38@huawei.com>
In-Reply-To: <20241014144250.38802-1-wanghai38@huawei.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Oct 2024 08:58:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVsagE1HMf5aLD_ZrubocY_DqX-UrTLxiFOMT+kwVhysg@mail.gmail.com>
Message-ID: <CAMuHMdVsagE1HMf5aLD_ZrubocY_DqX-UrTLxiFOMT+kwVhysg@mail.gmail.com>
Subject: Re: [PATCH net] net: ethernet: rtsn: fix potential memory leak in rtsn_start_xmit()
To: Wang Hai <wanghai38@huawei.com>
Cc: niklas.soderlund@ragnatech.se, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, andrew@lunn.ch, zhangxiaoxu5@huawei.com, 
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wang,

On Mon, Oct 14, 2024 at 4:43=E2=80=AFPM Wang Hai <wanghai38@huawei.com> wro=
te:
> The rtsn_start_xmit() returns NETDEV_TX_OK without freeing skb
> in case of skb->len being too long, add dev_kfree_skb_any() to fix it.
>
> Fixes: b0d3969d2b4d ("net: ethernet: rtsn: Add support for Renesas Ethern=
et-TSN")
> Signed-off-by: Wang Hai <wanghai38@huawei.com>

Thanks for your patch!

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

Does the same apply to the skb_put_padto() failure path below?

drivers/net/ethernet/renesas/rtsn.c-    if (skb_put_padto(skb, ETH_ZLEN))
drivers/net/ethernet/renesas/rtsn.c-            goto out;

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

