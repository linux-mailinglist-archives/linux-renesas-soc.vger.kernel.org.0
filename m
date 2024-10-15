Return-Path: <linux-renesas-soc+bounces-9733-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0BA99DF96
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 09:47:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0887283D76
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 07:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23AC418B48A;
	Tue, 15 Oct 2024 07:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ckw0BXoP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534BD139578
	for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Oct 2024 07:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728978440; cv=none; b=jBYmQ5Ky0j7z4PdAQUYO2Q2mBKxoZSM20+aTqa8XeXBs7HRl+845YqPyCCj3eraRly7tB+qwO+dqrTtHjGlqBqv7Lo/K3UTv5nyPnDw2k3MZMkxMaYU5WqYLBv97dymUjCgWdPqLNlDdQPPdA7LkMHMIj5sqwDxj/1KLewwWUlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728978440; c=relaxed/simple;
	bh=+Ej1MNiBqld9sr/rde/khIhq0J381uRG4buKgfobWSU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DkF+CVRjm0wkJvLY1hxlyrdbH1Hyc1g/g4ymkEqqtP/9RViQDqwQceZuuRL3cl7zBKUAWsHMhZYSL1pcZFBfvDwdOn/xilBmRlaSFqo8pxa4NKk6XOHDsoVRS6I5PaRwfVsOTVviwEo5P6tcmLJQqG4mp2m/Cii/DOYq+baK0z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ckw0BXoP; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a99543ab209so775225366b.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Oct 2024 00:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728978437; x=1729583237; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NGTAwWYylrgHxys3J7g7Oj8BY+b7ECipEcgHj47PxZg=;
        b=ckw0BXoPwqSakKCCbSFQMVYHsVK4NLgJf2u0hZZa7aJuFVbuoRfeJt/TZzfXySaaCq
         UP1Az4aNkicI8l6K0PNLLrJWJled027jM9HgMNagQOOqc+rIRy/xBNAcPQxoRmNzQc17
         RsljHRjEdoDpG9lZjS2o+bkS2n4QHZPC+Hg2xCO+DZ+ijBOiwkxbPBCBGn1OrspTHtuS
         j8C4tkxj3KH1kPG1l9PhkN904TgKPlvMfryPnBEDuZedL0ht6Ctg4QCciXs0Hk6BYME6
         q4VxqsLE1n+wMAo0X7XEsj7gG8eEG8tTV1EHii7MnQJYTDvquSJtAj6QZ2WyxqORuK5N
         BIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728978437; x=1729583237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NGTAwWYylrgHxys3J7g7Oj8BY+b7ECipEcgHj47PxZg=;
        b=GzTMkrd2WHeP2Wt/tpbp07L2l4KBkGEPUeAQTgE7czmbIKhEv9olOk5/VHKuE7O54v
         ccCT+fD2eOCgd6COvn7zAmJR7+i9hf4a1Phjj/bpRA1SMiQG+GSv09FJStQHHD+l/6yp
         DZLrXeCwm3KcHUKxwMGSl7H4tnSgWKo3kgBsUtQjyVZHgr0uNRgY0RbXzYs5awN7uwoY
         0ll/rgX75t6P7l5fqCQpM/e4np8ujIEvzcs7HM207S/LYT7hpR2tnVhZa7zT3MfwwRhL
         ObM0h1YmJofK0Ys5hyETT/I7Hzk/+s28Wqe9pjjII8H3ksCKxsTUxP2W+eAFDAlBfcBy
         hnTg==
X-Forwarded-Encrypted: i=1; AJvYcCXHLG1VP7DGnWQxMHBxe+ZbisE8P0Kga/2gRypKntefMMfWs+cfu/k4WaojK/a7BTzEZnipponIt6XOfqr2jGE19w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdnCZEY4wE+olG1ke/+nsOutkmgWfX65qrsOVqYa6Vk1ZE5gWk
	RpoACbqO/pn/l+3+zdxQt2TAJR2vegOqDm1+cxrx5qQeOSI4LS6TJBwprpYSH00byviOLyhyahO
	r0lbaOk04CuzQh0R4dQa1yUO14s/x78g/sIDm
X-Google-Smtp-Source: AGHT+IHOWVLnPX4C3QWmkZye9E646q8g8t2prDsYgVCykbq1ehRGzgpHCukbcmwC4labaeZy8W5xKeFOMAJpBJdxCWE=
X-Received: by 2002:a17:906:6a14:b0:a99:ed0c:1d6 with SMTP id
 a640c23a62f3a-a99ed0c0ac9mr795036266b.49.1728978436290; Tue, 15 Oct 2024
 00:47:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014144250.38802-1-wanghai38@huawei.com> <CAMuHMdVsagE1HMf5aLD_ZrubocY_DqX-UrTLxiFOMT+kwVhysg@mail.gmail.com>
In-Reply-To: <CAMuHMdVsagE1HMf5aLD_ZrubocY_DqX-UrTLxiFOMT+kwVhysg@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 15 Oct 2024 09:47:03 +0200
Message-ID: <CANn89i+Srr=M5+f0PbLs1OrWtOPNYULopNS+6-dy6EYNX8Ua0Q@mail.gmail.com>
Subject: Re: [PATCH net] net: ethernet: rtsn: fix potential memory leak in rtsn_start_xmit()
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wang Hai <wanghai38@huawei.com>, niklas.soderlund@ragnatech.se, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, andrew@lunn.ch, 
	zhangxiaoxu5@huawei.com, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 8:58=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Wang,
>
> On Mon, Oct 14, 2024 at 4:43=E2=80=AFPM Wang Hai <wanghai38@huawei.com> w=
rote:
> > The rtsn_start_xmit() returns NETDEV_TX_OK without freeing skb
> > in case of skb->len being too long, add dev_kfree_skb_any() to fix it.
> >
> > Fixes: b0d3969d2b4d ("net: ethernet: rtsn: Add support for Renesas Ethe=
rnet-TSN")
> > Signed-off-by: Wang Hai <wanghai38@huawei.com>
>
> Thanks for your patch!
>
> > --- a/drivers/net/ethernet/renesas/rtsn.c
> > +++ b/drivers/net/ethernet/renesas/rtsn.c
> > @@ -1057,6 +1057,7 @@ static netdev_tx_t rtsn_start_xmit(struct sk_buff=
 *skb, struct net_device *ndev)
> >         if (skb->len >=3D TX_DS) {
> >                 priv->stats.tx_dropped++;
> >                 priv->stats.tx_errors++;
> > +               dev_kfree_skb_any(skb);
> >                 goto out;
> >         }
>
> Does the same apply to the skb_put_padto() failure path below?
>
> drivers/net/ethernet/renesas/rtsn.c-    if (skb_put_padto(skb, ETH_ZLEN))
> drivers/net/ethernet/renesas/rtsn.c-            goto out;

In case of error, skb_put_padto() frees the skb.

/**
 * skb_put_padto - increase size and pad an skbuff up to a minimal size
 * @skb: buffer to pad
 * @len: minimal length
 *
 * Pads up a buffer to ensure the trailing bytes exist and are
 * blanked. If the buffer already contains sufficient data it
 * is untouched. Otherwise it is extended. Returns zero on
 * success. The skb is freed on error.
 */
static inline int __must_check skb_put_padto(struct sk_buff *skb,
unsigned int len)
{
return __skb_put_padto(skb, len, true);
}

