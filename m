Return-Path: <linux-renesas-soc+bounces-23077-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7B0BDF2CF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 16:54:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 48B674F029B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 14:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 830532D5948;
	Wed, 15 Oct 2025 14:54:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CE12D3EEA
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 14:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760540050; cv=none; b=CZXhA8lWZalGz3gMc4lWgQv3RQ3426pL5VqGl3Jw+wPqeTLkfhbaEN093B3/obSf6HNPfw26/PfDtw/d567SQno34Yh4n5z8gwoSeA4T7moLBARcVS9DbDQNgnDw/PNjnP/CgLkgmDn52IJc2i0QtcCVZsc5oPo2DmsBSR7wfH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760540050; c=relaxed/simple;
	bh=6OUsLxRkye/V5CLq7E3pRBp04R4Pl/s8hSmjTBcuHj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XNEifFbquZDLS+HJCTEAXSKj2ZGs2ydH6Zq0N1PvoQoTUHBOvFIfHZPuYG8dF6OlS+0vTRIeCRo1xC9sxDQIOIWQUg4D5zDT0Xp+eO79qOq51yahInRjYdxOx5X3gW/vkaMW/5DJRfCAAm0mVAH5nfiub7ieDBNevFAXhcP+pB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-54bbe260539so2602004e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 07:54:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760540046; x=1761144846;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=buS4UytUzJOTO4hyhwviAO+sxk7bCqxVtv+iDQgoWO0=;
        b=ikq6Y+F4t6/+Id0zo1ayUB6qVv5WkQQKWA8QFQa+YGZ9upyJ6ce5diE+t9+09gWt8+
         pwTmMx/fKxHIusoQDY5r+eJbjMOpBgJt1Xq0qQtMLNctbhv7hw/DmUNd5ecURCA08+ia
         0uIHGfQNjjzUgsunlib0F7p0fx2fA72P2x+USs+pW6B2CT3wj4cDiNcV6+auOYqaXpD0
         OROyXDWUDKVmF39dVsNZwKEOPtY1V5WtwZqKAw6YAoxi+JU1u8mSA57eWCjLey/liL7g
         0bhGakLKb7ZRF8qT83L2geZaj6jTA5h5qT22NSjsb0EpTxobXjC32Vr6uWxHlPVPz94g
         yo7g==
X-Forwarded-Encrypted: i=1; AJvYcCVMYXy03YAGFwWD+XGM20eoPvC9pZRmySBD3UWWpA4p0mMWLo/K4LP+OtSWXXUXlOb8kzKkQgiyXvcRxpsXr8kv9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhhvW2dcs2Ga+nitToC6Msx8FcMWustUh0j2Iuo4jy4pN8wH8T
	BFWWAA59/sARS+me2wbVH1nxSwsZd8+kFzTj5oY/xwDaD+dNl24V/hu0ckOpURBw
X-Gm-Gg: ASbGncs0dzjzxOOAt9l+8sTRa8+vTOHxE8CqQnOj5xlZTrBROaCH7RQX97Ro98ywu8F
	bDOrM0RzYh+GbIXXhdR8jb4InYPJLfA0KQPfFM4PVyhv5S6T/KCNjehcMbdNyuxHEamG3Jt3nPu
	14nBFElLpGIlxjC39kjEzINfPmrrXLjS7tX7kBI9H18Kd4HVC4jn9DVG1NcoF4Oc0qqHAlGmdxI
	qyuQ7PFacDgRsvG5T9D/P87jOc+sF8SkpsF7zhitc97W3BBcaPRlzQ6vmN1mg5yCtsywLY1p+76
	JrnmL/SWC2nuDhCl4Mf5JKbIKZVqOBulD1WCf5bTA5DEN8PeDLFZKDNCG2daKkS+rbOWxX8QZCg
	f+av8WNTclDhe/fUkl//+1IiUu2Dah4zVS31GBFw+SHcMr7QfcjYXVj5WKmDlVcqtX/Jt+Hn0HE
	/+m/JECCY4IVl2qQ==
X-Google-Smtp-Source: AGHT+IEs7Gz5DWvwD/97wfRrdO/Xb8ZKFBTR8UVw+3zIXrVeNZjvHHUW3jjqoMadKw5gYcyuM6uXNw==
X-Received: by 2002:a05:6122:91b:b0:545:ef3e:2f94 with SMTP id 71dfb90a1353d-554b8aa8d4fmr8754022e0c.1.1760540045766;
        Wed, 15 Oct 2025 07:54:05 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-554d8109b5csm5130607e0c.25.2025.10.15.07.54.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 07:54:05 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5838680e242so1966477137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 07:54:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXkRlCw+Ahsbs65MvWHrvYZhHKwL/DmqPFR+5WwBgkxMLHeLUk6aJFVFSi2gGW3yy0B+2g64QJW9CFL/KCECnqwaA==@vger.kernel.org
X-Received: by 2002:a05:6102:390b:b0:5d6:fce:4443 with SMTP id
 ada2fe7eead31-5d60fce44d4mr4420342137.43.1760540044664; Wed, 15 Oct 2025
 07:54:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015141014.156437-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251015141014.156437-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Oct 2025 16:53:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWq4dbpsRYBVeQLpAVZ0Zk44vwPJTShMi8jZpuH0miYgQ@mail.gmail.com>
X-Gm-Features: AS18NWCxkT4sRPfN_bOCrKffa15VtUEJklYqD4ElIKofei39YrIIER48YuJxXBM
Message-ID: <CAMuHMdWq4dbpsRYBVeQLpAVZ0Zk44vwPJTShMi8jZpuH0miYgQ@mail.gmail.com>
Subject: Re: [PATCH] thermal/drivers/rcar_gen3: Document Gen4 support in
 driver comment
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pm@vger.kernel.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Lukasz Luba <lukasz.luba@arm.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Zhang Rui <rui.zhang@intel.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

Thanks for your patch!

On Wed, 15 Oct 2025 at 16:10, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The R-Car Gen3 thermal driver supports both R-Car Gen3 and Gen4 SoCs.

And RZ/G2 (the ones that do not fall under "RZ/G2L"), cfr. what you
actually added in the comment.

> Update the driver comment. No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> --- a/drivers/thermal/renesas/rcar_gen3_thermal.c
> +++ b/drivers/thermal/renesas/rcar_gen3_thermal.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - *  R-Car Gen3 THS thermal sensor driver
> + *  R-Car Gen3/Gen4 and RZ/G2 THS thermal sensor driver
>   *  Based on rcar_thermal.c and work from Hien Dang and Khiem Nguyen.
>   *
>   * Copyright (C) 2016 Renesas Electronics Corporation.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

