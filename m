Return-Path: <linux-renesas-soc+bounces-22317-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F961B99D3D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 14:27:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAF4D3A2E92
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 12:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 070652E7658;
	Wed, 24 Sep 2025 12:27:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C242DAFC0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 12:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758716862; cv=none; b=GdV2bHjsD97vJ9CiMcYnPnlyonb6qWHdp7dpabIFx8AwgU6PZSMRdf7i49Ip/nzxz+k+ghoImMleL8pcFpkidKYxPNeHPLqSYj4Nz/kSm/PfdmURLYm+WxwQRy+rflb//UgeOnFs97YV/LRLV32RVlNBGD7eC3eNMpkkymR5QlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758716862; c=relaxed/simple;
	bh=m4UMSJRwUb34SEoWabfjkvMgMST+WZDrebs6YW1/cBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g5ygFEqZIjWJO9ZevW+Myh+yn7YSpIlNTOV3/Mj86O0p3k5eQygFTszARaGHwCjtZfpBNgstjxLiteuqQKq9R894URdIqD8h0KNFvixFQG/jqEv46W8NkyMDrCzq9pXiJnBk6gYA3QOIgRM0kEXWxy6ALvRkTMsFm2K9J/St09k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5a2b3bb803bso1782888137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 05:27:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758716860; x=1759321660;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YrIcrX+WqLkK/OVX26j4zeOlHzZuccByNgRjxzFWguA=;
        b=dJ+oh2idSwq2dxMrYEuAVtC9c9dRUH6XO1aNN3s/1/hNMQJHb9UhyEgz+HU7AbU/Oe
         UARb/nYDOOsXC2BgZRH/jcjw32wGMEGM41wQgMu1qLVgTqGxG27Kg1uW9Y/IUk4/FHAo
         +ZJPZoTGHqRpmuTl3dW1w2hGiTTf9+NffqsTA8kTWy+gLTUBTu0fOPtiK9M2XOAJgITW
         vibdMeLx6BzJNegFwhNgWt6buCxxL4clNNQ9HpuCpaWt/B9gaBmSqHZwngcy1fr1MKHi
         oThxTfqHFlyaL3bDGMEgKPL9FnCCQ+GanZnCQYWJ7FxBNQMzfBdxrVMSpINSrVPgGNBq
         q4Fg==
X-Forwarded-Encrypted: i=1; AJvYcCVKvqsOggW/AN1sFSnWLSbmUF6RX9a0avmxM0+LhRPhCEzJsjeGKSs1CW7nGkMqPVFt+gbCzwPBZCfyHKNX1jiv3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb+fsHoJLWDAaXUGlgcsDmSq+PL34PJL/5t/YB9ipu9tWx2DDW
	tvK/pV8ZeDrMoZ8PlyeK0eRGJf7vMyNoMaPNX4ioNRUxVYdsdGuZaYnW+Srh6IAo
X-Gm-Gg: ASbGncuKGXhWDo3+fcYk9nGnRPZVzTFtzQ/BNEFNtls8paAsqs6RqxgOv64+so7xuAW
	EwcEH9J7eHFn9F6fadZGJGX40v9xGbLGWfQfkSTOMjxeLWg2qa2TmPFRgZFoKVj3eWw8I8jCxOi
	rXX5xDLjMPGhvF/A+8+PRcHgEvr6k1ewiRPMOp4lXDjQ7BKXwrwh0MHDdeql0jTRhwxCAQpwJLx
	JcM5JPZx1F7E2V86zKBAderBcoOMZCyVmvk0UoAhow/RazrdmrzBuXEm1l6FcAVOnn010cDrInV
	auEltwh1/XI1D/qqt9h6HUVOZA0uEk9K+i6DjoDWRZOgCv4zH/mNizy5GWoPVAh7GGqhIpKQzC5
	aiU2bO6SgGhN5d58xt8jU1Qt4PCKWxlacqBJkb3mEzPJu0qt5pE9c5/EP9esuPwz80stmQnA=
X-Google-Smtp-Source: AGHT+IHB1iwM+l1In51UugCqXT1j7FupVlCnX0vLCtyxei+Y9osabOfiqtQuO0WMIJOgo2ziu4rf/g==
X-Received: by 2002:a05:6102:1487:b0:51c:77b:2999 with SMTP id ada2fe7eead31-5a574fc85f5mr2627780137.2.1758716860018;
        Wed, 24 Sep 2025 05:27:40 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-579ed35f674sm4652091137.7.2025.09.24.05.27.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 05:27:39 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-89018ec3597so4222701241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 05:27:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXt8O3DsvV4LvrY2BbfhoBKjpjYbs66mS2EQA7PnIsI5GJYw1sx46o+ik5Nk01AWnd0/MJYcUSzhml430vEMRP+bA==@vger.kernel.org
X-Received: by 2002:a05:6102:32c2:b0:537:f1db:76cb with SMTP id
 ada2fe7eead31-5a579b1e1eemr2463960137.30.1758716859238; Wed, 24 Sep 2025
 05:27:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250916150255.4231-1-biju.das.jz@bp.renesas.com> <20250916150255.4231-9-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250916150255.4231-9-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Sep 2025 14:27:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUACU1tPKDgoOhgBW8KkDCxSEzqb7TnucYk2dW2jOet5g@mail.gmail.com>
X-Gm-Features: AS18NWCVenDuOrUB7TMiuq4fiv2syjlHZqz-8Xrb3HQqOfe_05Duah7vTFUtX5c
Message-ID: <CAMuHMdUACU1tPKDgoOhgBW8KkDCxSEzqb7TnucYk2dW2jOet5g@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] arm64: dts: renesas: r9a09g047e57-smarc: Enable USB3HOST
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Sept 2025 at 17:03, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Enable USB3.2 Gen2 Host controller(a.k.a USB3HOST) on the RZ/G3E SMARC EVK
> platform.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

