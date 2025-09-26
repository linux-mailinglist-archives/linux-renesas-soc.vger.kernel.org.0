Return-Path: <linux-renesas-soc+bounces-22411-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A42BA3591
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Sep 2025 12:30:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D057F1C04D07
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Sep 2025 10:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2EF2F3C00;
	Fri, 26 Sep 2025 10:30:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2ED2741D1
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Sep 2025 10:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758882638; cv=none; b=kQkAv2Frx7LAZOUIAnC7lae/7ddBAFNmCBo10XuVj4rTwojWxxVU6ss51MYHEr95dVE6/uc05ONkeiXxDJV2t7rE6kBKnniVCRbI/mVXXC9uJS/xDXsPV87phRDC4jkqzTaj+DV6eue+0obodBvqvtIaC5AsINsi+wjsw56MuLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758882638; c=relaxed/simple;
	bh=meSxc8wrYtkbVLWzjZPTLzds/Hd25Wzn0pY931UcZts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KqoPROiIjUv9/CkJNoREhR+mBAhPblf8SaGcHfWAX9cpEhTwXN0VAxAeA7hd6tw490B0Z4WiE7n6R/a+0iMFZ6eoiLOgnfnu5qv7O1m3BNogiM+x9JP2GfGy9nJVav9RxM4V5R+wyGHXlic6bXEgGR458p441XKNvipkf3IoBXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-59c662bd660so825327137.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Sep 2025 03:30:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758882635; x=1759487435;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=udD672uKdPtCim7NmlDurpPdZYBL+0mV4DdXmMjUq+o=;
        b=cbO+JdetsgcE0vCwMVtNdBMuzP8YMjCGehmwxfGjBNxttAVaAh5ry/D3vqLLLR0XmI
         80H4sh/XG0ykgZl9LIwuZpVRvyDja07550A/aKBGJzL2lOTMIUvqkeUeJ2t0n+/NNbG3
         7P00o/w5IILYYl9OAoYdF/pmRMinaYxA4esQ/mWhjJj2O4jZDQilJgYpdfsMrEmL5TVa
         XVOTfe1oLVQ6c49NxAcSLiyMp+L+W8AP7x7mH09PWig6FvP2bEucuydsju/VB6VUc5ph
         MQMUkrdVmumcwCyvPHEDTOOIzuT5/pzqb673MYIFClJA0m/gPIKITj+6gfIVD+pHO5fX
         s60w==
X-Forwarded-Encrypted: i=1; AJvYcCV6XoL1E9tavdaHq2Fn0t+2pqEi4hou5iiEcAI67kP8P0eD7HFX8MFjyk6jrzcaamZCmWOV2Eej0rZHneTS55EQbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyY8XmO1xIkBwhU21n75cj2ftDvlHDysGcR0zqrpqJGb28VnhlU
	GhP91IU6rHFuwZOxK0fW+fCVRGVKvBYNGnuGG1TulXtw8NMj69iYngogVMRbuELH
X-Gm-Gg: ASbGnctTFrikHHjsM7ap17FreyqxFXVWe7x02aXt/lBMf9fXtFPbLf/5z9JmynbrOy/
	x/bpzkVP7UogG5WLAnSkJFpuuHRa88//FFwMz74loZl+Hsi2OyXTTOQU1fuD0h2SAKXWvowUguo
	ArLcwbTuKEq9zVfC8mdVajmpalwFPVU8b17wW9Dkxk/c6ukYHrvT5aSWUVS6iMmPqCCfGSi+7J+
	h1V291ZQCx5lg16eZi2elX1sXuePSabnQVprsizF1Y0XFpgMEcHomXMWBZ4JHnFl0uSBKlafrRs
	/fL+t4s+tWXm90+/7RZHOIyW+j06DEBk9WoVF2Ftkxo1Bh8lFAvuaXVo+oR0ect9BQeVv1CFE7F
	EyrFgf8pJDm9kX1T5pQoTjWqla3G3HSBThvmMhEyV5IeL+jZxFQjm1a08MWgMyca/zCJztTDAFj
	Jjp1sNfg==
X-Google-Smtp-Source: AGHT+IHoeM7WhuJb+FnL2sBYfLcJSc+2BCzpNeth7t+yf39L2ofO66T+LboUZsfxTNzaxniEGMg2yg==
X-Received: by 2002:a05:6102:370d:b0:52a:4268:7618 with SMTP id ada2fe7eead31-5accf20b16fmr2524279137.27.1758882635305;
        Fri, 26 Sep 2025 03:30:35 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ae302edafasm1172932137.4.2025.09.26.03.30.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 03:30:34 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-59c662bd660so825314137.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Sep 2025 03:30:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWf4Z6f4s2mFsP81ZwtLDTogBi/ujlB0oJK9nZx1W1oethlTy/zhXuLlhw3kI945n1OhRsaf1x/pbBYSuCey/474w==@vger.kernel.org
X-Received: by 2002:a05:6102:6d2:b0:538:f3d5:fc12 with SMTP id
 ada2fe7eead31-5acd0935270mr2716797137.32.1758882634619; Fri, 26 Sep 2025
 03:30:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250923144524.191892-1-biju.das.jz@bp.renesas.com> <20250923144524.191892-8-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250923144524.191892-8-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Sep 2025 12:30:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXM+CBd0=dqG3DnfU5NAup5AH+T_w35MFi3B6T0iWAqQA@mail.gmail.com>
X-Gm-Features: AS18NWD7sjtTfJ_M9h0NGs84Fgd5nzj22GGL5o6mTQegvldoQrfGgdyuYCG0Z6c
Message-ID: <CAMuHMdXM+CBd0=dqG3DnfU5NAup5AH+T_w35MFi3B6T0iWAqQA@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] arm64: dts: renesas: r9a09g047: Add GPT nodes
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Sept 2025 at 16:45, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The RZ/G3E SoC has 2 GPT's.  Add GPT nodes to RZ/G3E ("R9A09G047") SoC
> DTSI.
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

