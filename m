Return-Path: <linux-renesas-soc+bounces-8689-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CD36296B389
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2024 09:53:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D87BB27963
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2024 07:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBF3916F8E7;
	Wed,  4 Sep 2024 07:52:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA70316F84F;
	Wed,  4 Sep 2024 07:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725436332; cv=none; b=I1l3sjjakERGwDjY7Wd5P/KQ9LdZ1oT1hKNQU5CJ/8EvULRB2LfcOMy4Eoso2syWKFp2cx64DQf7Suoza9vnYAyWLLk26pZYurKnpsMgKRtXDZ4mougYj5rvrYiIOQjHHH06LXWmceNFH404427hRQzsF4OMMWqSidpPSBU7fgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725436332; c=relaxed/simple;
	bh=amT75xLOjwlpe1UDEECVviOWRFV6v//nAgX0pxBHSl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KsI2/qbGw90OQE9aLqGq1ghUYt6zux6oE5yVR9tbrioLhTspJEi+/Pj6DRaFTtJqL44BCGJjikrop6R0lPkoCWboar6G2ZWNr3XitOt+qCWIEfFtKgDKVkKJmfpJtL95eg4zv5iiZK0So9dbZg9EpqDc5Wu0uWfwRB5xHSv2a88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6d5893cd721so35687467b3.0;
        Wed, 04 Sep 2024 00:52:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725436329; x=1726041129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xje1uU/8bjiS8VRarchCtZnAH6EZvV7NY7k7sgbF1l8=;
        b=ML8T5zeZqMomWSpsBF7wdoa9VKdYAif8PTyXWsl60PNxb/KdtJ6ycyLLOJHYkoLRjY
         vynbMBVhhyScjcwNOX6/NmW6DHUcARyOcfYB3vcy/Y1979hrKo2L16ea16Rhoa0W6Xfc
         4DmQc2Mk+VnY0c8GZRobeXTd/rDlL2Ic/W90anG0QN+nqudPs5xOYj5t6W6iIwbiGbRW
         aNMRZdeIg2rmi+LCOBHbINXH4CtMJG4a48zLI/IDqOLY/SNloGApfMonkvAgjiACSWL0
         oO2Bs3zajpb21D589WZuxcYrgU0yd6jHtEoWdSov+I10ha+oEe605DCv8TWmVs6agv7t
         Swnw==
X-Forwarded-Encrypted: i=1; AJvYcCVeKCFYA1MTF35+otKY9KT33uNnB1OlkMkSsJjIq1FWZSAFDU79XJSQoYj2t9LoPfqViKU3V3ja@vger.kernel.org, AJvYcCWrjTghiTC9x8OWRuHx4DOP2oq82eObO0QjDK3wiURiDmzNQKsaUKrab0LDMtRSbJQVKlHcoDfNFNRj8PdZ2UI0EQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAF3B3YYFgCgNX0TuzOtC9LwCaXYHkVBah4tFFaDcRqrPITmdQ
	ZM+YzGiLQGV4/CcuGm2JFeASmR/+yDRDk6NaMvdStlYARGCXq30WVXTDaE+U
X-Google-Smtp-Source: AGHT+IG9jsKQi8Gipkl7goY3wmjcufHHJAUUb3H6toVqTD3bJEdD5pU4aYL+7OM6Ar9bGvauKycWlQ==
X-Received: by 2002:a05:690c:660f:b0:64b:7859:a92f with SMTP id 00721157ae682-6d40dd7215bmr180228397b3.5.1725436328876;
        Wed, 04 Sep 2024 00:52:08 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2d438e15dsm22682557b3.66.2024.09.04.00.52.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 00:52:08 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6d5893cd721so35687167b3.0;
        Wed, 04 Sep 2024 00:52:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWVev+9ITkmEoVv8iCErgLBaV4K7pjsVkAiqq4Vsd4H+ZyV1TmgR6qP2iSg3A9kLWSZQR6G3ImDXjaZxpRWMxGohQ==@vger.kernel.org, AJvYcCWbckvVW9GrjmzpCtKda3bEhyn9cL58CFxiTcpa6p2UUotHULLwABBDtdcQb6FeCBb/38wLrXCN@vger.kernel.org
X-Received: by 2002:a05:690c:dca:b0:6b3:a6ff:7688 with SMTP id
 00721157ae682-6d40dd702ffmr188806017b3.3.1725436328197; Wed, 04 Sep 2024
 00:52:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240903171536.628930-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240903171536.628930-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Sep 2024 09:51:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXajVM9=jLMayyC=RziqHz9HLZRcg864qw1NN2txUcKpQ@mail.gmail.com>
Message-ID: <CAMuHMdXajVM9=jLMayyC=RziqHz9HLZRcg864qw1NN2txUcKpQ@mail.gmail.com>
Subject: Re: [net-next] net: phy: Check for read errors in SIOCGMIIREG
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 7:16=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> When reading registers from the PHY using the SIOCGMIIREG IOCTL any
> errors returned from either mdiobus_read() or mdiobus_c45_read() are
> ignored, and parts of the returned error is passed as the register value
> back to user-space.
>
> For example, if mdiobus_c45_read() is used with a bus that do not
> implement the read_c45() callback -EOPNOTSUPP is returned. This is
> however directly stored in mii_data->val_out and returned as the
> registers content. As val_out is a u16 the error code is truncated and
> returned as a plausible register value.
>
> Fix this by first checking the return value for errors before returning
> it as the register content.
>
> Before this patch,
>
>     # phytool read eth0/0:1/0
>     0xffa1
>
> After this change,
>
>     $ phytool read eth0/0:1/0
>     error: phy_read (-95)
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

