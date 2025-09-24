Return-Path: <linux-renesas-soc+bounces-22335-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9C9B9A26F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 16:05:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0880D1897E92
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 14:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE5520A5F3;
	Wed, 24 Sep 2025 14:04:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF76420B7EE
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 14:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758722697; cv=none; b=sfairtwMjdvb4h0CyIbTofCG8/q/ECi60VbMi5Ru2ataDY+XVzcfricvKodGLtHJykhAjRmVhlAcGEFzY2MKKQpTQOp2nxtmivSRGIsJc1cGVq19p1wv5gmG9W+wtBbXy28nglOYpBlajBy+fOEGGS1e+nJx7H8xZNIkEy3v5As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758722697; c=relaxed/simple;
	bh=RAQppiXjWIWyTOC11PHSe910HHT72uEJpzqGu/pPfgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dJSRmff3nbHRT81P0rfgjtABHpFM++532nMDe795kxetFn6PhyBbdExbkbrussMKumF6+RkOefvaMkgARcwe3j1mjaefBhV+kszGSNb0R9euQZl/Z+19Ji6WwdQS9+m+5norE/fe0f7+1JpAbuwwQm/8XfGn2BC0sj2q5izhNa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-73f20120601so33845057b3.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 07:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758722694; x=1759327494;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=43BZO3RAppnebCnCAQY4LIb5j3YiQqsMBJqVptEFktE=;
        b=wxLcxD3D65i5v7IXWvS1MV2J6dnqKMn0YKAzNWRU4DhZIweK7Haeq2Ac8bmAeEAo4g
         3BkWKRZBtpXEwOTMI/Z5qIfvyjnuSACmGqRvfXnqS3zR4/GYyfWnslFvWDti/S1ytSfs
         zu4a2VvWIO+QaqN5zeMAI+4H9R5Yf8G7y+NWEisyf0IyrZ+lszC/rv02NNyMTQsC5JfM
         mlhrxxTN+Rf+FE2yeh7EXIujd3wsjTkr7reph//pcyhIe/7kLSacyHNlOcm8PRSSVKP5
         LYdt+l0Dq4a1W6nhm+a2UXggQCBctrEXwcGPBwQLyjdCQj13ZlhAzSWCzOVG9frITdcm
         a3HQ==
X-Forwarded-Encrypted: i=1; AJvYcCXM+0NjfmEMDgnLkks/5xgztN+gBf5Iw8gmN8+ZbJ6WeeOM+5nb+kgCeqGHOrkT7AG7RtM99MoZgN+ROEUJFNII/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGQCu2YHovMK/lMMB4pA4UsTGgb/rpRKfLCw5M0b+J81McF+zU
	gzb1kZgxPyhnd2kikkY5q7LiJ6KXTMuX/fKBTLvSLOogxEV002Fo/h2ll1ojis2J
X-Gm-Gg: ASbGncu7L7NLTd+vvE5fsVjv387PLf/FPY9ARpHaQRMbO9WivkZBuh0LYT3zmlX4rGn
	8ngVlH7Lp4fj2ZbdA563x411tFWXF5gJTlMMkK8NenBSE99vqjOCeBQZtH/1Af78rXdB5Xvf98S
	QqhY8iqQ+WDCaw+mo3Ef2PN6ESRDNPA9qZhlNzlEd/WEKnJym4Rm99/Gj7UyAhZvULT8gjBNTLG
	pK8YcEOvpMLjrW3osMNnDr2Ddq5tgfOytdZsvOB8qRw/RClRMmqQrGz/MeOQy5MauQUVh6R1pnr
	G4PWAuhVtvn+mwODZ6SKQRuptn4UNGmxxl/JEXhL1k2LkNG3LfkdVU4sbENx94wmuHXbq6AoK+C
	tWimFo2TI++WbtiNkOgCDcOBCWC1PdDRzrzcv7CsX4UzjfZY80KiPTrB7FgYW
X-Google-Smtp-Source: AGHT+IGvO5wmszNK711Zk8F1Zw+bSQpISvbvTPQNW6u/WXwaJPG2ABgzzVHJB+1LIFg6IdnWoplsIg==
X-Received: by 2002:a05:690c:9a13:b0:724:bf14:f63d with SMTP id 00721157ae682-7589a7631a8mr52587187b3.22.1758722694322;
        Wed, 24 Sep 2025 07:04:54 -0700 (PDT)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com. [74.125.224.44])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-73971887fe8sm48219507b3.50.2025.09.24.07.04.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 07:04:54 -0700 (PDT)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6354f14b881so1246410d50.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 07:04:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVOPFe7kN49PepDBK39f/VLDAw0hd/C9ihvcQ3LvLL+z86Nm1ubHoDeugQIuQzBMbV6n25W9xrkFiSXw8g8hrEJBg==@vger.kernel.org
X-Received: by 2002:a05:690e:d4b:b0:635:4ed0:5717 with SMTP id
 956f58d0204a3-63604666409mr5129283d50.49.1758722693635; Wed, 24 Sep 2025
 07:04:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909113840.122785-1-john.madieu.xa@bp.renesas.com> <20250909113840.122785-4-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250909113840.122785-4-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Sep 2025 16:04:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXfN2qK-Yd=ZAaLek=UMkLK+NzdU5aFr0ET3o9m8RB4pA@mail.gmail.com>
X-Gm-Features: AS18NWC4NdZL83Kq7qZvbj_wBXjrH_GSLKGUTwSbCh3zlppgYZIteZzcvWX4tWU
Message-ID: <CAMuHMdXfN2qK-Yd=ZAaLek=UMkLK+NzdU5aFr0ET3o9m8RB4pA@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] arm64: dts: renesas: r9a09g047: Add TSU node
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: catalin.marinas@arm.com, conor+dt@kernel.org, daniel.lezcano@linaro.org, 
	krzk+dt@kernel.org, lukasz.luba@arm.com, magnus.damm@gmail.com, 
	mturquette@baylibre.com, p.zabel@pengutronix.de, robh@kernel.org, 
	rui.zhang@intel.com, sboyd@kernel.org, will@kernel.org, 
	biju.das.jz@bp.renesas.com, devicetree@vger.kernel.org, john.madieu@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	rafael@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Sept 2025 at 13:39, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add TSU node along with thermal zones and keep it enabled in the SoC DTSI.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

