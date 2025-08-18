Return-Path: <linux-renesas-soc+bounces-20616-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0F5B2A1B9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 14:37:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3832956006A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 12:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A211E320381;
	Mon, 18 Aug 2025 12:24:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A33F320387;
	Mon, 18 Aug 2025 12:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755519888; cv=none; b=jJGq+hCeprhj2bKcCzA0udz2uQFHtao2Cg08V54aaPRJu9gCCQKhOzeNuipSHNR6T1GvWKfgE69aICBgKGMJj7MgIPnmdExALTaw1ww5tRxAaIh/EzeDw0ItElaXLdKEjJDPf7ut+NKol4iu0e/2VdUG7mIp3/pVIjkAxgzLlFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755519888; c=relaxed/simple;
	bh=jD+9ao0yR5Brq3o8Ck660aPVrU0peS4is3diwCooOI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AL/vbtfh/Xupltzkh/ZaY2BeXdVxWcacNzDWpbmfNW5aACBgUCCe0kRlFiM4zrgHLOhl18JDcGBIAAu+ydQ8hrDgXwIs/OhI5Bb1xiJUQ6u3tN0JQuQTeEtQJ0rweFtox+pyeF2Jex9TRgYKeyAqZMcs+VV9RSp+P/+8if5KTZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-50f8b94c6adso929411137.3;
        Mon, 18 Aug 2025 05:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755519886; x=1756124686;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AaJa7kce63JBMbdEnE+cWazL6nCQ8LgeQ2Dg4AesiNg=;
        b=bqBazImwRUm7wdH6Hof9uaTUvaGb2ac9p+ftUxsgGHseMW+675bHJevqdsKY+plDmd
         Pa/YjstK/uOh787b+oVRfchWYWtKEJBbwjSqT14VbW/Ac9AZPpp0ZJasSqAh1wth2oZK
         NeOdV4EiqpzD0QilSiiNSIRSBp9CwEND4ByH9qohWRe116qmYmotQZWXD0GwNS7WpZIK
         DdpT4xR53TmediUbasd4y/tzR2B3gXgXuz42Hkax1fVphiPo3u+y4lTzraTiYZX5deLH
         1kjvtsV+Zj7mBdqGU2wnVLKaZzo2r8albsX+fszFO1J63QMLj8k3EEtsDkoAFtW/x5FI
         Wx7g==
X-Forwarded-Encrypted: i=1; AJvYcCXD+hCFU8x+tsBC4D/MFOKvVXXVDtPQQIu8M1yckIhR8Rh8pWQSmPbxr7YZvAS9Hz40Weosp8LZwou2@vger.kernel.org
X-Gm-Message-State: AOJu0YxLAgJAOl7QumE+JgdVLf7WrhjSsCZY+bUIiFZkKEJA/qp8u+zp
	j4imXzxz05r6jTYTcB/WsZVnnKQgJ1xQuOuPFKL1Z6nVKH4sDTABL1Il3w+TlGAO
X-Gm-Gg: ASbGnct+5wgNI3CixfkBRM2s53FhpFJbXfmjHAEmYgEip6WUo9sMmzbsfUXNT3Y8c/B
	7uWA1I/HEU8fGTA6ducQCXjFCJhAzIIbRYOybF/SnFlfSy5eZ1r9RWJJbBVx5rwTEpbVZkrebq2
	VaVhLDAgmrISZPOWD1FEXuJBATdZ9wLlgqm2n5IIF31k4SzKBmEaY8XxN5n+ZMgOyVYNT4YhE7g
	ZFl/ab5jVL8QXWyvM0a63AvMfJUTXgQS7K2QjP6fwoibSwmoDvbBv+nPceRx7dQfMdreHV0veSf
	iQ2nbQPlOJRDjfUWawbzzhV91Op1F8QiC27X6S1IWuiztvWViHFWv4FuoxAwfJTsXDlUGSo/LfN
	60NRzFI8td/fES9Fqs756bsB5KtFlrmnehM4dKTGQwlYUhy7eKVA0wrieLRs9
X-Google-Smtp-Source: AGHT+IErfKwJlQMJYshveyZSE9fFhOVSOW5bmp0p7Day5WmxECjdpkv+pLp9Qr/5dvcmWvE5uRzr/w==
X-Received: by 2002:a05:6102:f11:b0:518:9c6a:2c04 with SMTP id ada2fe7eead31-5189c6a369dmr18071137.31.1755519885713;
        Mon, 18 Aug 2025 05:24:45 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5127f2269e4sm1954703137.10.2025.08.18.05.24.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 05:24:45 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-50f88cd722bso1161030137.1;
        Mon, 18 Aug 2025 05:24:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVWazysdx4K3i2pU0A8yIXwr2HOluwZOKJirWVrWxzjnzEqXrfwv1rD9+xzbnCTFJYh7HrXH+5tCx7S@vger.kernel.org
X-Received: by 2002:a05:6102:a49:b0:4fd:35ca:6df5 with SMTP id
 ada2fe7eead31-5126b2fcf15mr3545585137.7.1755519884929; Mon, 18 Aug 2025
 05:24:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250807151434.5241-6-wsa+renesas@sang-engineering.com> <20250807151434.5241-8-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250807151434.5241-8-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Aug 2025 14:24:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUyTPRrU=BDdtETj3i9hRct-R1HKpsrt5nFAJrdo1ZswQ@mail.gmail.com>
X-Gm-Features: Ac12FXypn69uphTYSUvkFCV9fJ3KT7NUTPKt5HMer-mcztbNA6d2HVd6VRfoXr8
Message-ID: <CAMuHMdUyTPRrU=BDdtETj3i9hRct-R1HKpsrt5nFAJrdo1ZswQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: renesas: r9a09g047: Add I3C node
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Aug 2025 at 17:14, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>
> Add the I3C node to RZ/G3E SoC DTSI.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -601,6 +601,41 @@ i2c8: i2c@11c01000 {
>                         status = "disabled";
>                 };
>
> +               i3c0: i3c@12400000 {

i3c
Please preserve sort order (by unit address).

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

