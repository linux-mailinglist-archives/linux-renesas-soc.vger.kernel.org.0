Return-Path: <linux-renesas-soc+bounces-21263-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29980B41DA3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 13:54:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2C7E6826AD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 11:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA2452FC03B;
	Wed,  3 Sep 2025 11:49:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AF22FC001;
	Wed,  3 Sep 2025 11:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756900195; cv=none; b=gVKEt4TqIbmX0xVMXCONuINltIfWk7J44gw1LqrIzIiYJOyWYqAlaCLSK+/MwSQ17R3pxW+CUcIt1cPD05nkouIb50LlN14UDmMzLYfTovlGaKMBnm4rAyttIJ2P6MZZe9EEpvrdhKQjFPtZpz8pOeF8k4SF5sbgte09sp8FR2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756900195; c=relaxed/simple;
	bh=Qes8FzJruzuRxR8TKQTN1qXNfTR73yaIMnjowD04PSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DEXZe4xc8z7pnl25ItSVUNGghkmFwKb9uCMPMTm2T51aIFnD1LtgzMNiKWa71dUtZ4+HvxK6u9lsam9cR3at0OfE5mqRDimF+wFCaIr5Fw840v5pOhKR6ATpCI//zZdvFlPOEh9HwmxqFX+FXbFpQTQP8Wq/5qXn0LJERKqLGOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-544ad727e87so2744355e0c.2;
        Wed, 03 Sep 2025 04:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756900193; x=1757504993;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H07mWBBV0V7BHaVY5nXN+dGLqsNHDmluC1ZO2d5xxdk=;
        b=wniE9LJ4K20ixwVS9F0eqrUtK2XOEsGc4VqWtpl+X9ggL0bNYYrtkJUnsFl3YJRaij
         bESLh0dD2YPrgOdEqWxf7Pjbfwvm6SHBFD6Li7b2PXdrwSS7EhNmPPisldzT3cnvQRIz
         TQwBUz33jYapCkepSuI2xx3Im8lpAkihIGsOfP4lTcGxKrP3GcvzbvvhJ2He+kQ56qkC
         5AsHj3jVeRZxpwguVXOQNEVMRxhJVe2GX4x+dKiVaAj8F+LpeZeeUFeiToU+SvWe/b2X
         JrHU1IuEM/5Y7xpu4iVnM2N4LDGsno+YGpT+FybesA6zd9QY/U45bAtBnvpgZ68Brbm3
         xxtg==
X-Forwarded-Encrypted: i=1; AJvYcCVnOML+l5zWOpabq19vTowSw5CKaYVM7WFsjwKiwYHbnp1h18a74D9ZEX0xBQ64RMtiZYI0RH7uaLh0@vger.kernel.org, AJvYcCWSlyrBAqbseWXFtU7T2njYFPOu4jZyqll8br9aeNFPQrBKan/fhfi5xNZwldXgO6z/3k45mkf4QmIBw84fjmWZi7o=@vger.kernel.org, AJvYcCXfvFH7V+9oc8Zp98hMglgefwPRHM1spgTEbM+MauPnL/K3XylSqc0uNdfctXJKo4rCFKrjBiurCqkgqphk@vger.kernel.org
X-Gm-Message-State: AOJu0YzPL6ZDL1KOsa44X7ArKzq+quVPERYq7RXxIbWwnY1dAWq97rgG
	0YMKGn2Z82ZecuYCrYr8uDMk5Amuf+KrjE/aOzsUb8umdjaIgNmDZVclnCDDnr08
X-Gm-Gg: ASbGnctLQQUtjyFZ4FMQEZHa+V+F6Or52RPg3zIU/pXZlGyY+U6BHkC+FHqWZ9yeAv4
	4rGzE5mP6+koK3rSpJK1Hlh7c0SRNJPArHwmLOQzxIov+c+uUaP2Akfxb+gQl1OpWqTTqESF9Ka
	tkLGkfgpS12BKH4tF9UmRfWSM7twir3/3kYT2GrFDYB+YrVE18KEIbHhtjCaQ4OKAXt8aCTXzFC
	UztIgaTzgeU9Fe1nX/jEgmrwKA030cSE8Q5qYThDoHmqtwEhkhnm3ciuq9YWoSEaNM5oJ+lC3c4
	EhMfooxs0zQaHKi5mXQKuvmePscwUS+eaXb9oJqPgRUvEejtVZ8r3erud6NrizA83y+t+iMKbLV
	02/+sEaBmpZveetjzDMIsjAxbjdEy3hHN00MPIsALh5Kxy/dJ0dxfge9Z9L8F6cIkduyck0U=
X-Google-Smtp-Source: AGHT+IFA/mbzUU3pTF90iAjCKrOsD/CDGn9juQi+pEmdPLDt2EYV1JqNY0ETW02vI/tSLw2cXa4LWA==
X-Received: by 2002:a05:6122:1687:b0:537:b126:bf07 with SMTP id 71dfb90a1353d-544a013465dmr4588222e0c.1.1756900192856;
        Wed, 03 Sep 2025 04:49:52 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54491464aebsm6764552e0c.14.2025.09.03.04.49.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 04:49:52 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-89018ec3597so4433263241.0;
        Wed, 03 Sep 2025 04:49:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0uksPWfac1jfYZZK+GU/WEUzhyFJd6hC+bQcQkbrDtRr+E9XFIHxpVdFUG8+FAeaO8CUB5eQzXCHFqKIm@vger.kernel.org, AJvYcCVh39TGoWZucX2lL7Kfki937TOo4u7Ub4finrsAm1yphIkiEIwz+TdP+LOWMnZyP8XQIPATjJ/IOzBO@vger.kernel.org, AJvYcCXSQhy5A0ZkUfm5ekLLFnP7fdcjKl4jA7NmjGIcEr0ejRlBV6kBCjRd1oXEElxaF4iP9l7h+04GWL4+uScqpHsOcBM=@vger.kernel.org
X-Received: by 2002:a05:6102:4447:b0:52f:12b3:4505 with SMTP id
 ada2fe7eead31-52f12b34fcamr3000837137.23.1756900192118; Wed, 03 Sep 2025
 04:49:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820200659.2048755-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250820200659.2048755-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250820200659.2048755-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Sep 2025 13:49:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUc0sVD1Rscpzto3Ni4-X=viMqa7Ak0=uOZ=RcyJbFsHQ@mail.gmail.com>
X-Gm-Features: Ac12FXxCv3OxXj4BFhzYol3Dcx-gcAVyYdQGQbT-fmrl6YVf_-C5sk2E6voq5_M
Message-ID: <CAMuHMdUc0sVD1Rscpzto3Ni4-X=viMqa7Ak0=uOZ=RcyJbFsHQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] arm64: dts: renesas: r9a09g087m44-rzt2h-evk:
 Enable I2C0 and I2C1 support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Aug 2025 at 22:07, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable I2C0 and I2C1 on the RZ/N2H evaluation board.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Replaced RZN2H_PORT_PINMUX with RZT2H_PORT_PINMUX
> - Corrected switch settings for I2C1

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

