Return-Path: <linux-renesas-soc+bounces-12344-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89242A1969D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 17:36:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57A5E3A6286
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 16:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49D48215040;
	Wed, 22 Jan 2025 16:35:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F034212FBD;
	Wed, 22 Jan 2025 16:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737563758; cv=none; b=tDvFadLMXr/9nsNqzCPy6FzXbQn+Px76hSQ9oT32NyolPsuKrXBFBHGWRzYQ17r+6TYsG2FlDQAWEyU+8ZJQ9r5Q5/dAlO+MX26Aj/3dGL2B3C7P0svYaZWdtuDaIs3O21U/hG7BPkYSe20X8G4Qq/Qj6RlcWW1IlCLI4DDifCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737563758; c=relaxed/simple;
	bh=MH9F8SSDFt8/IzusNXm2rj2rfy+BTw2VykXUt0qkulU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=orapF7r5QjsQHB36Loibdjz1uaBkIQ05CyUDiREzRtR3Uw3IDKtfDUWFgotGLKMSoLG3xWhpP6ua/bovDvrc4EvYo7Cq+CSLi0lcPccPXAuSGG2i8UwEBLBBk0db8Ha4+m9f/iZl/J6Nh1DXVxaDKk7sDXDB8QQlOQJt/8PFxzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4b6398d477fso2009603137.0;
        Wed, 22 Jan 2025 08:35:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737563754; x=1738168554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0oibD9tJkj8BgoXkGLV7HewXPWtq++CgXf+dL5wi5o=;
        b=DT9Uv0LogCOqgEwHdBaQFqfqOeyFUfcSSDaH6Vmrgmcs3bjjMQfkJk19hX6T5qs043
         aPHqFzwSL4lnrumfaj2sycZwZQueGVUb7z2pQvKIktjjpjteZgr/VUDU+xmrGnTBVKLN
         7sAMBBuwXhXFBtywogKAaqTA9aNeCgR4Fl0f2+fGy/aQBzab0MSa5V5CQYWedabDNIZx
         t2c4VZWCc0T5a29xLwCecHPexGWUx4/LlfDpmRN/VOzKsHfwxozwHoUaACkmKhcw1BKR
         tUxxhj31rkJs4rrJu25mINzfxTyfeh0b8MjP4nAGqDrdyNXnSFxg1b5KJsSqEVhAR22X
         xufg==
X-Forwarded-Encrypted: i=1; AJvYcCWzvUWKUN6feTC5RADmTqV5iGdlLgdshLkhXRrAw0fSVOFcaIMMb9FvZXCS2R+/OLLFI/n+wBPBqnOX@vger.kernel.org
X-Gm-Message-State: AOJu0YwUjUxu25dZD+8S6HSxTUw3FAPHTJawhzv8fmyrKLHzmG/t/i/B
	88CDtGL3cnY6Gp5X9pu3M5kekmNfLl3RQ91WVVv2L9t7IVzZkIMqc/eAJ2Es
X-Gm-Gg: ASbGncsKOxU8tOPxTTaQzV48If2dMmlb3imDIOQE0f+4MfVsy9WkXqUx9TVXv0i/fmw
	a2VOQYYHAaR0RFoli94t7ct8+F0CD1IR/jqs4dCKfQI/rJZa0/FPl0+Q7MNUTxcOHPmuI9SRgBE
	APOpTxEIVrjasZzpb7cvhm/2Ln+GpuOQL/kUvxbfYAFLFs6UsAKbZIGWOhcIAv80aDW/gHbtcll
	CIGkabqiTIS2/CA6GwlUFs1zN6rtTT1VJ2GHgMrzjGb3RgOm6BVqpErisA7JZp9+FeRlN2j9kbU
	/Ei/0SKumOUwYjDebl+Ws85pD0ZdPIv6
X-Google-Smtp-Source: AGHT+IFu0NbeSBKsjKdyLHp3J0Mh3AAQljOrUvmBG10N4mXGD1m89xh4p4wjhAU/3OZfGods2hGiqA==
X-Received: by 2002:a05:6102:2ac2:b0:4b6:18b3:a4db with SMTP id ada2fe7eead31-4b690bc7e21mr15483983137.8.1737563754184;
        Wed, 22 Jan 2025 08:35:54 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b68a1ed335sm2752752137.2.2025.01.22.08.35.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 08:35:53 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4aff5b3845eso2453455137.2;
        Wed, 22 Jan 2025 08:35:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXbVF/3rkV4F1XznN2J8JnqZHM1FT/PXlaocFZPNytAFIZdHIc5hr7wu6O+7Wq9Ec3p9dJrJaIwFcGv@vger.kernel.org
X-Received: by 2002:a05:6102:508f:b0:4b2:5d65:6f0 with SMTP id
 ada2fe7eead31-4b690ce47fdmr16692555137.19.1737563753723; Wed, 22 Jan 2025
 08:35:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250107160127.528933-1-niklas.soderlund+renesas@ragnatech.se> <20250107160127.528933-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250107160127.528933-2-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Jan 2025 17:35:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVwAFN3e1aA6Kysf2a8sto0_0yLg=gMQ9C4-LbXS1K23w@mail.gmail.com>
X-Gm-Features: AWEUYZmW_PaiRF4Hvk5SukuK92X_M7CRn-OR4e1efENOduKY3UMqKEEVvy6k1Bc
Message-ID: <CAMuHMdVwAFN3e1aA6Kysf2a8sto0_0yLg=gMQ9C4-LbXS1K23w@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a779h0: Remove address- and
 size-cells from AVB[0-2]
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 5:01=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> When describing the PHYs connected to AVB1 and AVB2 mdio nodes will be
> needed to describe the connections, and each mdio node will need to
> contain these two properties instead. This will make the address-cells
> and size-cells described in the base SoC include file redundant and they
> will produce warnings, remove them.
>
> In an effort to keep all three AVB nodes style consistent add an mdio
> node to AVB0 already described and rename the phy node to better
> describe the PHY is connected to AVB0 before adding more PHYs.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

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

