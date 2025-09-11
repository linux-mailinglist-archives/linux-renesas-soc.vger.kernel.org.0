Return-Path: <linux-renesas-soc+bounces-21783-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20901B537AD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 17:27:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3218E1883760
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 15:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D38D34DCE4;
	Thu, 11 Sep 2025 15:27:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAC8337683
	for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Sep 2025 15:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757604437; cv=none; b=d4ZGXk6h4mbN+nhr/NUHKLsxTcVkfWbDejN+2nnwhWofBtixQqOYwRnwZx306TL3nLkmQau4MZlq2X6piZfeZIcffZsH9qI7PNQI1LNMx4slsGA31SEhHBpJXvQ+qz/24hO2Q5xkUJxps/Iu6c3qelWJeb9WQlJ4OEqGugoaQr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757604437; c=relaxed/simple;
	bh=QP8zVxm3a3UK1G9l3fTpfk+VR1gAC1g6wpjwqtTIoMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L8DUYG5Hrk25WFLd7873iDOXUrNbyXzaCHU3uw26OLAcd2+abO5s8tZYerbCc8mQXbJ+/JJM1EnoqopaVTIj969GICyIBRzd3El8g4i6XNmIEY+fM0f8D5D12DqADsDbL7VqYYruYW2Ia70TOSOw/slaXXt1iqYV3OqJXYhvaoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5448c576e3bso288820e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Sep 2025 08:27:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757604434; x=1758209234;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lPc2XsAxmYi3h6MxGsxCl43YcyPTx0afvcilP6Ob1WA=;
        b=Qb1tgbKZO7+GI8+JGC38/sLBX2l8YchWwUf6D/Xyan9z/68CdJHWq0qgpyg8SFY60n
         8LZBg9ZHJm4dm9JOVOevWSqgHmOORBdT/yECQQrGmL1ctJMVsSCCAIoXZ8PVWs4r5fpZ
         a5/uHTiGKUMLtIFz9BSnQD3VTrg2XQ7FI6+DH+XzEJio1APxT6Mo9B5Xy09SghHXVOwd
         el7FC/HQK6J+QhI9pNfIJHlHWrqaFOGcA6cKUUe51nO/mEg0QQw8oEy16wK7Jyka5zGH
         7ihyQ5mMJZlgjBMf5sUWbbMMwQo9mBtW9FUcZC11I6zpldLTb0bSRBC0TLhLR5QRdo8D
         P0dA==
X-Forwarded-Encrypted: i=1; AJvYcCXBAcIgQw4zqzN4hjtHicOb1fw9ddTuF27MiCmirXjmGF+1BGCBNXvl8pVlTLofWPEAkRZ1vLqQazN7BKVltbc6ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsdRHCpd1Lhd4kpYtYOsf8T2BwmvNuDztbXWsIGiIDxY8WxqYw
	//RrwYn3joXC+qXdjpS5NjL0RCAe39FWi3X1na2RKZH4K8SnW0E0Ko5ocoP09VNf
X-Gm-Gg: ASbGncu/9c0ift2DSI63UDSUxz601ylkPFFanaMSwWvfEP64HAV5HfohP58QuktM2yZ
	glMHqKvmlh1GLOaj52EU1JuIdnbnSRllM4qnmoZIcNH3663UB3MR8b6/6sZH9k3Xx6sndk1SFE8
	b105s9wq7aFLA9lix4CRYYlI56KA9sMPP+W587Byh23AqOTlNozes5GWM38WDirSE/DYkYMwCuY
	YTrEzueTsqYV0hfKa7vcesfNjuhwgGE3x3tcchXFgCBzpFZLYKDxXJq9vrapIkNWa3R8Uz3hL4s
	dxkHNDafGVHODA9RIHfVQNNiJmpS/iIfPbPSCqtG8pe6PELb21ynTV9Jqldp90QIqx8tZh8lodF
	kq8eW8W5SABedMWitXHTWYqfvR94NHa0cxj7ZRqRHZpqRcPRCiWCxBHSm8wH3
X-Google-Smtp-Source: AGHT+IEpdXb1qdc9a6L1hwobBw4zEDGbiBwjC6Yq1c8t5UHy1ng9gxYmUGGZj6z5wUCeuapoeEgITA==
X-Received: by 2002:a05:6122:8c06:b0:531:236f:1295 with SMTP id 71dfb90a1353d-5473aabff31mr5141556e0c.5.1757604434463;
        Thu, 11 Sep 2025 08:27:14 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8ccd3bd595csm307602241.10.2025.09.11.08.27.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 08:27:14 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-52e6037a484so189936137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Sep 2025 08:27:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWemvs75hjSdSPgcptsqYnqR3BS+5Bb5OK0Wv3WJTBiVs0lAnAv5DuKy32F9ylRuLnwdc9QXdp7hVxGH7BykAZe/A==@vger.kernel.org
X-Received: by 2002:a67:e705:0:b0:522:2b10:7d07 with SMTP id
 ada2fe7eead31-53d160d3c64mr6513188137.30.1757604433799; Thu, 11 Sep 2025
 08:27:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250817145135.166591-1-biju.das.jz@bp.renesas.com> <20250817145135.166591-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250817145135.166591-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Sep 2025 17:27:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXHzk30U09bLOzwMD6SsP_jVJ60r7feDGiaP=9VFgsYVA@mail.gmail.com>
X-Gm-Features: AS18NWCEx-CGg4oNyhEX62psOpxj-1sWUL_xztZ7vzAgM6MsdT2-vWQYD8op1dY
Message-ID: <CAMuHMdXHzk30U09bLOzwMD6SsP_jVJ60r7feDGiaP=9VFgsYVA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g047e57-smarc: Fix gpio
 key's pin control node
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 17 Aug 2025 at 16:51, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Adding pin control node to the child won't parse the pins during driver
> bind. Fix the issue by moving it to parent node.
>
> This issue is observed while adding Schmitt input enable for PS0 pin on
> later patch. Currently the reset value of the PIN is set to NMI function
> and hence there is no breakage.
>
> Fixes: 9e95446b0cf9 ("arm64: dts: renesas: r9a09g047e57-smarc: Add gpio keys")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

