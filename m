Return-Path: <linux-renesas-soc+bounces-21965-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EE2B7F955
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 15:53:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15C7E17A12C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 08:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63138303A35;
	Wed, 17 Sep 2025 08:05:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F57C308F1F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Sep 2025 08:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758096347; cv=none; b=rnB+H7qBmN56Y6F2pqjbLgxzD6ZOGjGLKKozZ3nw5feqTMp76YuG6VuuzPK7ebeVjX+3yxDMt5z9GfNpkf8vU0K2UxmqrFu6JhZJR8qboBU6tcvkxf+BC+jQWkMVRmIe4hQZek1h+4FNFNzVMpCARVLDU95f0Ow/H3hHJJTQRlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758096347; c=relaxed/simple;
	bh=Ec9ei6B/8ewo89UcVD8Q7X1+MZiGXpFbC8JM3y5kSV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MX+1fbdt0gAxzjKDdoghJZLVNiI571eE8KdqlbEoB/WHjEpPdhbJU3g5gND5Ml6Y+0UuRC6yKdKQqB0ZJWbz3YSmuvY+NWTvREEXM1kogM0KFgZlIZ+nlqLnX5Y7XXR3Thsv2T2BdJDOxEX9IwxVG2ADb69uoFQhraujDJhc9eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b07c2908f3eso762311666b.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Sep 2025 01:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758096343; x=1758701143;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sHmK1DphSWWRr1U++nog5qIJKFnFzeb4vk8JecyOkhQ=;
        b=nSMREu71qcy6/nCSp+Y66RsccPlNC7MmE84WHB8Gx7Nu5Iy+Qn4kfzFkcLQ41X8P+l
         EYKm0m2LkZEaoREF2Js8I8lvH5Mvir37hnvUb30XOLKNHv03+7dBVyu9shKFipchWCsT
         4okE852mfDVe0MEvSURNvBmUGrHFVqVScFjJ/djjnAIdIyPPLLqzqYmh5K9pnaSQFL9/
         ppeqMtLXpTpxBAA/EmhP4OsH6CzuVDNaaTLGnWe89xqyAgoHO6k+IAxWSpXmSayq/sWP
         a/yMZULYmKjyiWcGLKs3EJO1SQfsWQV4yU9MBIYxZc8W/GZMn3rygxTuSONQJIyuPmX0
         fWUA==
X-Forwarded-Encrypted: i=1; AJvYcCUKtSLMTNfWnXdstZJCV7PhZhSWTFLac+PQuHrCpD5F/r3amIxl2fFL91fYORiOUFzwsdf8cOTqJxQ7M048UNdj8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz23sXiXmmCpn7/0ZamdB65gu8dabJwopbgyAARzZ+ohvUIYqzg
	ib9u/3Wq60rt185XC2g6cXS44JQ9cW6Z3GYSJotAmVB8PiEuPlZ/wGYvwaYxRXyeJpc=
X-Gm-Gg: ASbGncsslX1bul2fEQxEU7UZZEB18CPXLvxmsm8czV8QXoeHMnbmFy+hZQ1JIuLQ0zt
	0XYJaDr4qgxE7w17lgEg+LONP1YZn9yj/AaFQZzMbaLyNt1/q986TEQjs2CKj2PwzVtCOmDwoJr
	EGiVXhQ9I3yBUKsCVMMYpLD247cr6m7jwFoS0O655IgMYK1aWvlFAvxUEE4lu4cjo4Zijgj4rYj
	siTtsltwvifJL1pZamyrLDXszHIQo5YE7h+3L6Q6Encz/+oa2SFnbsa91hmL1j8Mlr7uvhC3tJk
	SYPvT337+oM6MZQv6UMAIjWe5ytxSKEgWrFF9iDEqHWH/YOYlfrUHQi2ER8B7r1RXBy0R2VLMIo
	zhxK7m5J+B42gBcAShZueesNQlO5H6aoSYOPxA5rypzBcIj5vJNcy9vr72dhW
X-Google-Smtp-Source: AGHT+IF5DP4w1ebbMQ+BbpHFsE5+O5vnqZzpDb6D2CbbHv/xOF4Il+0jsoeDXLXALR4Sw1kB8YoI9w==
X-Received: by 2002:a17:907:3e1f:b0:b04:2b28:223d with SMTP id a640c23a62f3a-b1bb6048f2cmr144332666b.20.1758096343176;
        Wed, 17 Sep 2025 01:05:43 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07e1aed5ffsm924937966b.81.2025.09.17.01.05.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 01:05:36 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b07d01fd4fbso720631066b.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Sep 2025 01:05:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVLQmmJ7aZN4FZd3oUw8RYw/hoMCVagXuY7DNmhADUFHY5MGrVWXYZwjRtWnqW0RkxvxOo6py4zF3+vgfy9TtUi9w==@vger.kernel.org
X-Received: by 2002:a17:906:9f8e:b0:b04:6e94:f317 with SMTP id
 a640c23a62f3a-b1bbbe68575mr139964666b.34.1758096335970; Wed, 17 Sep 2025
 01:05:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250916162335.3339558-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250916162335.3339558-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Sep 2025 10:05:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXhUHAMtOx1RVtva5iGmJhKy1DyvNJdjNMj=OxmL_ydFQ@mail.gmail.com>
X-Gm-Features: AS18NWBJ_DPCNXyZLdkJ7u6e0yw3d9zcREiBtm4I2Y3XsgBeWPU4BTw3RRIOiqE
Message-ID: <CAMuHMdXhUHAMtOx1RVtva5iGmJhKy1DyvNJdjNMj=OxmL_ydFQ@mail.gmail.com>
Subject: Re: [PATCH net-next] net: pcs: Kconfig: Fix unmet dependency warning
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Linux Kernel Functional Testing <lkft@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Sept 2025 at 18:23, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Fix the Kconfig dependencies for PCS_RZN1_MIIC to avoid the unmet direct
> dependency warning when enabling DWMAC_RENESAS_GBETH. The PCS driver is
> used on multiple Renesas SoCs including RZ/N1, RZ/N2H and RZ/T2H, but the
> existing condition only allowed ARCH_RZN1, ARCH_R9A09G077, or
> ARCH_R9A09G087. This conflicted with the GBETH/GMAC driver which selects
> PCS_RZN1_MIIC under ARCH_RENESAS.
>
> Update the dependency to ARCH_RENESAS || COMPILE_TEST so that the PCS
> driver is available on all Renesas platforms.
>
> Fixes: 08f89e42121d ("net: pcs: rzn1-miic: Add RZ/T2H MIIC support")
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Closes: https://lore.kernel.org/all/aMlgg_QpJOEDGcEA@monster/
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

