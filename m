Return-Path: <linux-renesas-soc+bounces-23062-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A18BDE7BB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 14:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D80864E9EE8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 12:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E0C71E515;
	Wed, 15 Oct 2025 12:32:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25617D531
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 12:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760531560; cv=none; b=BkaSp5MzWGB1J0SGFJ297T1jQzs3a+/eAlWyk4EeLyjc8HmvapdZqTPtDlBhLk4pE5/XcrdfKBSkFuMoNbIwUnD2X9FYzH8dMhxdyhiiPPEOaWv+rPNdSo+kXG57sMrhW8vGGRWHbjz4ahmk743Yklta89/G/jhY7mkyjLeTAyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760531560; c=relaxed/simple;
	bh=F3+IvQb4W9S8ixwOF5v64ZZca7g5rM9zG365bQdRABs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q49bByTS7/VK2pu/aUy2hA+a4/RD20ithMc+L3AXLz6zw0EUuIrijmn0SqDO3EBITFf3JifiqL07KTTWqCwO6CmP7biwcflKRdKg4ND3+GSY3178+NQM+eGHl3N+J+wL8rEB6jdXroJIkc6NQyBXmVUqKMEmSBDZb9ZBl11CqTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-59d576379b9so2529272137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 05:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760531557; x=1761136357;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jsq/YX5JWSVdrkyLs2k0CIlbdczOCem463f+BcrDR6U=;
        b=cudKuZbZo/7dri4eVrj2SdFwpSRex/gHsX8/nkB8WzalEA5PgCohZCcjwaDxgPSfhs
         vvxo3F6NsOjvnEJuR6fNAUmR9RT+UcA0rHn862QGPhSqrNobbVkUvKXrGtAZqVmj0NtD
         JRNYJh+h+fiMSC1wQzAp8bfUQr4LPGdMJ+eHAgEK5s7NpOXADwZsEvcFTHsxARhKC3Aa
         khRiPNJ6abwZ9Dr/+D2sozkNI6PVoSthJ6jRQkJV+quB3YXuz/fhZ86pHa5xpqoLf7kl
         K8+q81COTbM9RD72Ai2FO9Kf3b7kk+FWF+muvZomQFyYPS1hTRgiN2qH19cp1NTVAB4d
         WUfg==
X-Forwarded-Encrypted: i=1; AJvYcCW/bM8Sf13uOlOHtptgp0E2cr3h4vdR8z2nxJa4aMpREhs1WUsdfuHUVUBY5SGrLcpsicYlM1GWAH9VtS3u5oCS+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ/zC25V2PO0oKXS9L6jNhaYyIiWnPR1E8Ch3VUqrPuG6BqosX
	hdfEwyN2Y2gc7/t3j1NmwjogXpL1D8dk04QyR50CSw7OOhS3mQHPA11Ty5htspp6
X-Gm-Gg: ASbGncvzmFxpLfTE91YvULmKYk6M4MNZQAWwAw/wJxFqp+NqoB/1VnuCx4Ld0WNIXgT
	luGJStYpsYYCbnDVp57hCE6jfY4vq+gbabhLGPzpOv3vslnaqXwQibliO37vbjPLtlcIG+s4Sz+
	x73vr0PDgk/DRrCoM7O0UWYcG7X+NlLmukwA62Pzk+3/bslkJn1LZMgOmJjeg6w63QxFXI8ifIT
	BQfCnii3FSYbgMNHccZW5z3l7g8BTYrEHHtFnwsT4JqmgxHrmRJfx836wsflaPsk2atgbLl07qr
	j687yoIiV5J1LflDVMQ20/ibWWLgASsA+23WHAnqZ8WfCNAJc+YsjxzTsfagVHw+XRxHTbK3zsm
	P1YZUoI2Rr8xt9QK9fFyEmiTe6tVj4yg0gB6ufTR+x7fTrQRAIxRrkoFpDwrUXvbEhzC9YDYhAp
	yzzhp+/O52HHaHSQ==
X-Google-Smtp-Source: AGHT+IEw0FnKe5QQ5+sVwd3nXDGYCHUWP5gOudRoH+U+eVS23hiH7k2YeKBc3V/w46aHaJA0mKABXg==
X-Received: by 2002:a05:6102:6208:20b0:5d6:c3f:ce6a with SMTP id ada2fe7eead31-5d60c3fce87mr3797928137.23.1760531556602;
        Wed, 15 Oct 2025 05:32:36 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-930bf6cec14sm4410206241.8.2025.10.15.05.32.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 05:32:36 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-930989f9f81so1860187241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 05:32:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUbqX0OR14WrX6gEAsFWd42WtRQILu+x8tbYC6x4yftF1kcTxT/aS9mhIOhJIl6JnwjkT3UT+xm8q9kCtco7LVfkg==@vger.kernel.org
X-Received: by 2002:a05:6102:2928:b0:520:3f1a:c520 with SMTP id
 ada2fe7eead31-5d5e2215305mr10260146137.7.1760531555963; Wed, 15 Oct 2025
 05:32:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010-kakip_eth0-v1-1-0d8fdcbceb9a@ideasonboard.com>
In-Reply-To: <20251010-kakip_eth0-v1-1-0d8fdcbceb9a@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Oct 2025 14:32:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWZD1m6t8MnYTA83RV=h9G9o6M3KSZjO32rRjOpz6px+w@mail.gmail.com>
X-Gm-Features: AS18NWDeh4w0XkIwoEhkJhHpo06vBsxdw2ZvqMJlE0ZOyMbdKtJOMIMuKWhSl0Y
Message-ID: <CAMuHMdWZD1m6t8MnYTA83RV=h9G9o6M3KSZjO32rRjOpz6px+w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r9a09g057h48-kakip: Enable eth0
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

On Fri, 10 Oct 2025 at 13:11, Daniel Scally <dan.scally@ideasonboard.com> wrote:
> Enable the eth0 node and define its phy.
>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
> @@ -50,6 +51,33 @@ vqmmc_sdhi0: regulator-vccq-sdhi0 {
>         };
>  };
>
> +&eth0 {
> +       pinctrl-0 = <&eth0_pins>;
> +       pinctrl-names = "default";
> +       phy-handle = <&phy3>;
> +       phy-mode = "rgmii-id";
> +       status = "okay";
> +};
> +
> +&mdio0 {
> +       phy3: ethernet-phy@3 {
> +               compatible = "ethernet-phy-id0022.1640", "ethernet-phy-ieee802.3-c22";

The first compatible value corresponds to a Micrel KSZ9031 Ethernet
PHY, but according to the block diagram and the picture in the Kakip
H/W Quick Reference, the board has a Microchip LAN8830 instead?

The rest LGTM, but I don't have schematics to verify every detail.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

