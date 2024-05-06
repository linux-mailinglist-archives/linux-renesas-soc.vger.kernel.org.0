Return-Path: <linux-renesas-soc+bounces-5188-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD1E8BD3FE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2024 19:44:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 313671F235D2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2024 17:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FACB157A43;
	Mon,  6 May 2024 17:44:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA2E157499;
	Mon,  6 May 2024 17:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715017453; cv=none; b=XdASZ33QLuexj+kGNe25WznXyAbeYUJqiXIfEDG2XmU0tb4vVY2sA2pZd+vvXbC5DiHxWb01FUdjSHbkPbbaSs6ftnTvwK+dfOoHEH8/y27qJZl0jZk8VFm8iLllnYWTJblDNpghILNcSBaB2j0Uo4ZcJcTOu5/DX+PvOgGE1yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715017453; c=relaxed/simple;
	bh=c30XX7NvoV4VcckRnZbuzcL5VIyGxucgGGUkFlYpBEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KGZCQGLZ8JKDhHvRwiPEpNMF72vk3J3pGItsiN+PfFnHyl1klIQBM0TS2DTZ8xGi5kAdfLHr4DQzBAmHaPJe+CplOZXcGJ6x+lVQ9M+cWZJtXVWaS6LV4+NqYJWLltFtKmEsaCHx+/0ADzFF7iUqdrYwNdRJRVB48thd/AXroGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6202ad4cae3so19832447b3.2;
        Mon, 06 May 2024 10:44:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715017448; x=1715622248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jNJqSJ4Rj3GMpFRsgXMo9e9pnssxfStf7+AxtszDick=;
        b=uDlUi+VWqoR8U6OW2ovAK5wfiADq7Ply8Iu9CXVhT2Bkuxv7SKv7zQfwKHE5QLQMD3
         X9mYieEl3Ez1CwSe2CXWieCwxpjeNnftgrW5QD97vIyWiq/8YtQMx0IY26+7eSL81Vh1
         +gYSC+no/sxHekzOOOqEAmoGSTJbCT+Gb5FB4kNwjiwMzxpBdCWokjTorJs2q2YMdN9O
         VuBrL48/0MUWWV3thhWXzTfBEk2Me08Gq23yQcQrMsUrbiuwEwujHFiaLS5shMurew/p
         0RlPDiFrXIXLrVwYsrDU8iUNi9SmLPiE6GGtCuKyLzWnYXV+H092V/W6e3F4bwk65Kbd
         1lSA==
X-Forwarded-Encrypted: i=1; AJvYcCXlxitmJUDpZJsObd/+Bj3EoMb3bpWJLDMfXQFpWDCQE4ImO4izhY4zhi9yGS0cZCU7ksocvMJL//Yw5KQB6k0m7R6SgUwd+cNgXYqygFNd6ZF3pLwnrwu6gp8OM43EV4tQCtnvvl0h55k=
X-Gm-Message-State: AOJu0Yxt5RXzCusLZWYx9bxGAW6/k9xYoiuF4Cshy0fkYBFFu3yvfmGM
	xo3xirWn8ai3sWivl+PFMw7eW3R90kPqtvOmeoU6zQ5m5/BN0bJ8mPZh7D0c
X-Google-Smtp-Source: AGHT+IFANWO3Z1dqKfePGv4unfKao93j9o3qYBq7/F27texzvV1EZW75BKoM9Imy7DeC0tbXjhDpFg==
X-Received: by 2002:a0d:eaca:0:b0:617:d365:dc17 with SMTP id t193-20020a0deaca000000b00617d365dc17mr10406315ywe.26.1715017448490;
        Mon, 06 May 2024 10:44:08 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id s20-20020a819f14000000b0061893c5bcf0sm2238896ywn.15.2024.05.06.10.44.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 May 2024 10:44:08 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dcc71031680so2295882276.2;
        Mon, 06 May 2024 10:44:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXWqX9dxvKVI6dQdMn/mb+vT0kQNY6aUB5ZnP7/xw85ktmEuRcK2FS30oEav/LI40e3oVTtz/xY4komQRc9MR3rvddW+IVZxJwHHbg9ATdmjA2InjxdRl4aSj1eV2SltfbIhyYNioXckvI=
X-Received: by 2002:a25:df86:0:b0:de6:d19:837a with SMTP id
 w128-20020a25df86000000b00de60d19837amr11652344ybg.34.1715017448152; Mon, 06
 May 2024 10:44:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240414135937.1139611-1-niklas.soderlund+renesas@ragnatech.se>
 <5fd25c58-b421-4ec0-8b4f-24f86f054a44@lunn.ch> <20240503102006.GI3927860@ragnatech.se>
 <e3ce12b0-fb5d-49d7-a529-9ea7392b80ca@lunn.ch> <20240503133033.GJ3927860@ragnatech.se>
 <d5f6f31a-6ecc-48a9-a2ca-9d22fc6acb21@lunn.ch> <20240506140533.GD720810@ragnatech.se>
In-Reply-To: <20240506140533.GD720810@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 May 2024 19:43:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXm1by7P3LV22v5fQyVo1dNOzjaB=1dcqwP7qM+MqOhtA@mail.gmail.com>
Message-ID: <CAMuHMdXm1by7P3LV22v5fQyVo1dNOzjaB=1dcqwP7qM+MqOhtA@mail.gmail.com>
Subject: Re: [net-next] net: ethernet: rtsn: Add support for Renesas Ethernet-TSN
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Andrew Lunn <andrew@lunn.ch>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Mon, May 6, 2024 at 4:05=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2024-05-06 03:51:45 +0200, Andrew Lunn wrote:
> > What PHY is this? Does it have C22 registers? Can it be identified via
> > C22 registers 2 and 3?
>
> The PHY in question is mv88q2110 (drivers/net/phy/marvell-88q2xxx.c),
> unfortunately I do not have a datasheet for it so I can't tell you much
> about it.
>
> <snip>
>
> >
> > So i would drop the compatible. See if C22 is sufficient to get the
> > correct driver loaded.
>
> - Remove C45 compatible; Remove C45 read/write in driver
>
>   The PHY is identified as "Generic PHY", and the correct PHY driver is
>   not used. I can't test more than that as the generic PHY driver do not
>   implement some quirks I need to get the link up.
>
> - Remove C45 compatible; Keep C45 read/write in driver
>
>   The correct PHY driver is used and everything works.

Does it still work after kexec, or after device unbind/rebind?
According to [1], the PHY node has a reset-gpios property, so you may
need to specify the exact PHY model to identify the PHY model at any
time, regardless of the state of the PHY reset line.

Perhaps that issue does not happen when using the mdio subnode, cfr. [3]?

[1] https://lore.kernel.org/all/20240122160441.759620-3-niklas.soderlund+re=
nesas@ragnatech.se/
[2] 722d55f3a9bd810f ("arm64: dts: renesas: Add compatible properties
to KSZ9031Ethernet PHYs")
[3] 8da891720cd407ed ("dt-bindings: net: renesas,ethertsn: Create
child-node for MDIO bus") in net-next (next-20240405 and later).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

