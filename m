Return-Path: <linux-renesas-soc+bounces-21266-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 903A9B41DB8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 13:55:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8C031BA6701
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 11:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 020172FC860;
	Wed,  3 Sep 2025 11:51:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0E62FC018;
	Wed,  3 Sep 2025 11:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756900280; cv=none; b=uDDFvrpKZsDQzgvD7YrYBa0PgGua7oQ2mSjbjaTi5l+YVKnTZEdm/VpT9IwdIwog3mF2NresvAbYo0sl4pNQSgmk/jMLfLeqaf22GEQvQ9cU1EdYR20m8MOYPhjsIMHU2iS3UMNwwBKBAKdJlSc9DlN46ZmiWPNpKJQ1zxVp5Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756900280; c=relaxed/simple;
	bh=Wyk5sA2sXyOIPeVHD8BL/VWjpiTsHXk4M9LgjYT0Gc8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OlTS3mt74m6OxxybpOs63NWwORAZuSJhvvoKnBxCYxUqstSIg8Jcr8FOr6sOxpPTa9RgA7V9TwQP+c0xQAsPIEd2NTpJjDahQA8SV4xzcTAj973eopu/+WGa+MJ7bnnbTmNDttpBfYhModbPnnJKz3wftB57dzJ2MRYCe/dGdN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-544a2cf582dso2634791e0c.3;
        Wed, 03 Sep 2025 04:51:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756900277; x=1757505077;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DhSwVQefKqWWG7DZhhLRRWYrWb1UmqLFFnhmMl4MkFM=;
        b=hA4l1vlDduiqyWQI4aFtnxoHbRa+5l2MWFZCG+4EBRADMc/ALMV7+ETzRhGU78XOBF
         bDmzB1WscXZC+IEuMNQGdKg0TxhVlaYBPaHa3X3C6gYgB4e+Wmm7DqvPGb8TZBSO7Wxe
         0OefHSh55owYdf17OYw/AOgkq2jahnWLCPWZUZy1wXoROxOe8nVquCc7yXO1gO636H1T
         Ml39tz4tyWY9/jcmpADDiYNm1NFmrpzPp4bqQjjPzbmof53Ma8QRpuIRwa/7Gf+OC1F/
         VuBa1kOhYYYafgA3PDe8W42wsWafp+a3imXza8rnSy/EwI3UCMCIF2odvQnG73i61fsQ
         i+Sw==
X-Forwarded-Encrypted: i=1; AJvYcCUsnibFvZZ6HMTEkxyeGgOH8a6BUcK0R87l7DwrzkfcIecF3oKh3Aw8kJwfQI+nXO22B+kYH9zFblskihRpUPY8T8E=@vger.kernel.org, AJvYcCWlt2gZKHrnBmbjr41eOWA6IwiinSBjKz5DFcpDuj62Ler9ta+QEtWfU6ytnsIOK/c2LqB72Je4d58/2Z1g@vger.kernel.org, AJvYcCXsxRcLIiUCSC5/lFgQhTfitM6RrA/XH0/NEJU9z8iQHfNe0ZYJ6pFHfJ3NOZs5Trcav/vKONGma+r9@vger.kernel.org
X-Gm-Message-State: AOJu0YyitnrUOv8jMIaxC8Obe6MO9rY60nW2RDOQzeGtEHNma7nrulYo
	nV1PuMGZy+QwZswu8sKV1fjWG+odKH1JGFDBgMXt/yCnCeb7u0IzJffVKOgBmGyp
X-Gm-Gg: ASbGncv8S0uxgnhm9nVbo20HRr1gtcV6+Kx8WGZwOOCSI/1m4C3a0VV9cpi+ex/i02E
	i3m1qq8x4FDSe6RT4OftM1xzIFMWf/4xqh8YTwzQFlmRiP1RTfcs7rVQVncaSHABfIsNthZiJmp
	Bym+gXTV0YKiPG96jgdaf91HdkmPGmH3O4g1FaUVS1oBdwijeCzNWJCUhhnm+kNDpgS0vW38lre
	OhOupREnqjNWhx/EFqoIIKhmBBgM4b/tN1s7sj14iAai7Vox+RUllpkgw14DS2sAmb/nNNks+p2
	x9ldyxVnzE57hO9uc48fJwtP1z7wx0xpDZ36kgs1FO8kGBoX6TBd3eEYnkFXDNL628w96kShjZW
	dqvNc0kaIq2qUY9EZsJAAdTHj6cT/3bzPongHob9YwbjqpK90HE0eW+4yEuDFUa01
X-Google-Smtp-Source: AGHT+IEcYRdot439kHITSpp2OwLDAUEUTwoZiLfvLk8u9ade86RZrJT+2dhdKnWA3hk9Jgbk5sHcUg==
X-Received: by 2002:a05:6122:21a5:b0:544:71fb:f49b with SMTP id 71dfb90a1353d-544a0252659mr5317899e0c.10.1756900277038;
        Wed, 03 Sep 2025 04:51:17 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5449131c808sm6567380e0c.13.2025.09.03.04.51.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 04:51:16 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-544ba28ae58so1743708e0c.1;
        Wed, 03 Sep 2025 04:51:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUCevqfED+8TBPfVXCZrz6MnV9s5Bt9EEmQGRrW1u2wZiD/EIFAMMgO6rDnP/n6ALc+iTAA4E5QQ8CWJtq/@vger.kernel.org, AJvYcCUJInncuAg7Y2HLemYraCLLdWu1vsLi2x7psEvfJeNi+5ey1rdL7W6X0oBRBmuvOHmF9HqUi/Hurv1/@vger.kernel.org, AJvYcCVVMSY/PdiKV4B6y/KAHIDkloUn8J3mnonropHzS/fjnelhZ2O2QJn6i/nHYnCe6KUV3PBzriob0oV5F4ctN+Z6jHg=@vger.kernel.org
X-Received: by 2002:a05:6122:ca0:b0:542:9c0b:c5be with SMTP id
 71dfb90a1353d-544a0196adamr4606512e0c.7.1756900276554; Wed, 03 Sep 2025
 04:51:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820200659.2048755-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250820200659.2048755-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250820200659.2048755-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Sep 2025 13:51:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXMEBpB=Ce2dFoCUXwPKJndtajO=LR2Hn+Zxitj3jJQoQ@mail.gmail.com>
X-Gm-Features: Ac12FXzCduQXyrfmknkU-Po7HDGr1QrNHPA1AtEV_L_DawBnVFY3tlBed97Du28
Message-ID: <CAMuHMdXMEBpB=Ce2dFoCUXwPKJndtajO=LR2Hn+Zxitj3jJQoQ@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] arm64: dts: renesas: rzt2h/rzn2h: Enable MicroSD
 card slot
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
> Enable MicroSD card slot which is connected to SDHI1 on the RZ/T2H and
> RZ/N2H EVKs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Added alias for mmc1
> - Dropped sd1-prefixes

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

