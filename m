Return-Path: <linux-renesas-soc+bounces-8489-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEA6964204
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 12:36:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37FE5B21CD1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 10:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FF581946CA;
	Thu, 29 Aug 2024 10:27:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB98118E342;
	Thu, 29 Aug 2024 10:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724927276; cv=none; b=PGzHLQ3wYTKEGPht43qj4Czv+KNuNl4alC1N3ZH1P2IQCJWeBeCPj3hDKl04noFVUynSwSwJqyed58/E2xyDzGx8acGDAp4IoKqnbOHMB3WfxdKGWICotbZeDanLXZLTaaDcTjs32vMDf/kEch/Fsg23DZvJVGaOvGqxxFxF230=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724927276; c=relaxed/simple;
	bh=Jc0VJlApwmqjK+FWC0QFRS3O9Y38keJUn3ga9VpmoPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=avtqJAMfzWLsBYJxXOaePx5VdfFf4H5EPGr7DV5Alg8/ZZxoCrAQ1qSrEea9tbcVxSZWGK8kXTXwdjxAE8+1948WUcYW3QlL3RK1qyeyq8gEvct7gBkA6VId4FeDb0QY3xjLjpxtVG9OtxOWX3LwVhBg24R/0dkQFETUzmJWKN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6c91f9fb0acso4928257b3.2;
        Thu, 29 Aug 2024 03:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724927273; x=1725532073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NbC1XJqIf5U8+GKImXQ1mwpcEuN+jtHd7D5wtMBJnrE=;
        b=nY3C4L5vXb5Is4YSGCGTtlTylz9w+Tw5iExj62Mm0paxmnuT+7+8d6h8+RLW6Uvlsq
         PtghjB0/8O6CjrrwXGmoqLlL1STq3mCoK+0gxvvhzfOYyCc728xQ7YXf8JCizM3B6jDN
         PtdlQfwb9t0LnsVop2YUEpzK/+E929wspQPvezPE+MA58RtLcuc/HkAWHTlSJnziq0va
         cYSd1NFw6RcLZIvZIpI8gRpv5N8aCRlOZWzvZZ9RUvFFPYLGF7jOfCFASa/Oyd6QBHZy
         aL/yflAXNmG4h68K3EwlvsUN6FPvLY2HsjBQ6gz6IZLrPO3dwntUrvA+CTt+YsAGMziM
         VboQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDUgLDG+ZiGaANYU8gTvUj5HsHcD6c8LiYQkazXhC5hfCD2XY+y7KOB2F2xfCMq1lXptGmLtgUHTuGZCxs@vger.kernel.org, AJvYcCW2F/5RCi+rP9Xfb7LTp7dYDkac5Sg5DxOTsHP5zD/XGgkmtxIMyWSA5Ed5MAR6+8bQBQgAOpzBeA0bN43fjjTwMC4=@vger.kernel.org, AJvYcCWyNBtJCMwnxsJJ8UmEdgeIV/noMS9O3AG7VCwP00IFws1V/WTSXyCsdieJ8PB5t7q0hDV3SV/ZG2Y6@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7V7FpxJhteqysLoONlnVqlj1e2Im56shvMus2ni0I8fXk3amT
	Y4rVVywzt/tFgH9lwlT86eiprLKsMemdJZcxFsSYdcM9MpklZ8b3k8YrN116
X-Google-Smtp-Source: AGHT+IEdRebsp4MrLXQQN0mcV5QghV9MzGNnjCc1glzTO9e7KIPrROsWBufLnohi4tCy452fqZveDw==
X-Received: by 2002:a05:690c:55c4:b0:6b0:407a:e3af with SMTP id 00721157ae682-6d277c6f2d5mr24345017b3.34.1724927272928;
        Thu, 29 Aug 2024 03:27:52 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2d57decc6sm1869217b3.90.2024.08.29.03.27.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 03:27:52 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6c91f9fb0acso4927787b3.2;
        Thu, 29 Aug 2024 03:27:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUDsRQ86hmy5UlRx8QQWauQcixzfgwcvavv/G7PmNxUiJJrC2e1zmJH9TVHUbyXyv7wQ1LOHjRU1uQIsiAq1/bicYc=@vger.kernel.org, AJvYcCUyNVMGRUUmnTCN/FvvITkXMRubKoOdy/2EyKUCQQO20tJFPdDyUzt9IoTYZmoa38iLz0r3AHp7XiRoTpnk@vger.kernel.org, AJvYcCWHxT7RbdwCB5U8/+q7+7ldpxMoieTVKHgzGsoytrXTGliCtAun0MUHq6nQ5ynGJy8wrl/DsBj2icQ8@vger.kernel.org
X-Received: by 2002:a05:690c:660f:b0:64b:2f31:296b with SMTP id
 00721157ae682-6d275f28ef3mr24614547b3.4.1724927271864; Thu, 29 Aug 2024
 03:27:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828124134.188864-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240828124134.188864-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240828124134.188864-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Aug 2024 12:27:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVj21hyZraX2rgs2be+NLSF-Lbz_O6_-kcp-hvJp4VMhA@mail.gmail.com>
Message-ID: <CAMuHMdVj21hyZraX2rgs2be+NLSF-Lbz_O6_-kcp-hvJp4VMhA@mail.gmail.com>
Subject: Re: [PATCH v4 8/9] arm64: dts: renesas: r9a09g057h44-rzv2h-evk:
 Enable OSTM, I2C, and SDHI
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 2:41=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable OSTM0-OSTM7, RIIC{0,1,2,3,6,7,8}, and SDHI1 (available on the SD2
> connector) on the RZ/V2H EVK platform.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4
> - Updated commit header
> - Added clock-frequency for i2c nodes

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.12.

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

