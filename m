Return-Path: <linux-renesas-soc+bounces-22621-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45567BB5FEC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Oct 2025 08:51:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E030E188D0A4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Oct 2025 06:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C8021ABA4;
	Fri,  3 Oct 2025 06:51:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350351F63CD
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Oct 2025 06:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759474263; cv=none; b=u12EyPtX8VXke6vjPhrqxzhao0zTu+9HBlp8hN/eN5yUivWDHTjUhyGvRAjQtxtCBbRIxnYCf5/Dhiy0Jq39OVJcg5bNOk8s8EioU8LI+KxqY6C3JgGp6337rEt6D/Unvv0cPetbfFVZQW0wLExkDMpehgzc8793z7bjqjkuptM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759474263; c=relaxed/simple;
	bh=dcVJSHkjM/b+CmIXXZsGHyQxX5J+FZ3NLyDZIV/u+Ak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GTEUSlW2SMWaFoSCuozHd2NzncluGT6vhBHsvXdgBVIt2Cj4SsCCkkyW6yojTjq4HuQjKJ70F4LwwxS07Vaak4D+PkQKe7ywasDo1/UCHoN+R9VdgNiMJaT4RiaUfmEewF8v2JK2SFBHibb6ESjAKf+c65VP2tlgB+MxGppooJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-890190da557so538935241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Oct 2025 23:51:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759474260; x=1760079060;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7QYI64cW+XHmj+sby6MngC+206bn5fsu3IzSbvpr/6s=;
        b=G0P3tTG1cfmmQv1iu0P5JxXmB7HiOLF3E2EAM4VtON9gmxbEEoqiqrR6+QZCbJsRPD
         mlLsp49ceuaeRGOVpfU3vFn2H92HOXKkSB0Q+U5ks4PvQHHGzGM+XiNofiCeljXDkRpj
         osEtvMnBr7354Bf9OmIHtbO1Z5DXCwvYsLlwHSkOT6sd6m3Ql/iajHKiBG7ux88XlzQU
         EIaUZEICo8N+OHnGadlf17k94tn6Cs41jiTWWz50KfJq3H4uehFAGG2HStZEqP4YutoM
         jxTElp8oJjQsO4GFWywabSHvbFjTqy/rjmWgt4rBbiUJu33VhWPQMKBL8fZ58xfIg/60
         op6A==
X-Gm-Message-State: AOJu0YzcH/zoaIQ3mL2YoEA4wOKJ37qEnwmhG77r7PTrrln+eADZGhb3
	mMwQv7w76LTDcRsquSrzbAjeC/GyJDQLRRK7VdvP76jK2Nyf1T5Sm7T2GTjt+LladKQ=
X-Gm-Gg: ASbGncunFGJWVDhz+yf3g939Y/viQnhpB3YnQpBEK5xGZsBEV1PfL+bBrG+W8uC/b05
	e0gDjn2JD337svcO5Nr3WPJm6MjCByq600i9C6NEkMoxDsDmLkIQQtkf/6RcBaulSvxSCx6tMzR
	3LFWl6PCDV2QYVNjY2s0/hnRRmfEpgbU2/HWi18Sbh9ZHXsHp4Gscvf7Lp73yvzNJk8YkuEIpB0
	3q6nHCguB7KihRQZvhLvUa3Adg9vsUdqkW4y7b0GIigdX/kl5y7ZJsvGwuHsp3mEbJpuOys/Q3X
	3oaK1kwCDS4fhvJ9Inrm5GW5xtn3CiooDebRp/OOu28T3tvm+96nI0m2pfQbiLvxGuUr1NBrEEs
	9jUl8beEujE4pWKDXcthZ3PnohxXuwWlqv32UWStwGZKpK4V2zK9+SmHq2RR3ZretcxrvoSQ9GB
	mitCo/M/wEnGFf2ajsgEIQvEdYTSyqGA==
X-Google-Smtp-Source: AGHT+IFqj1XaJEhXaU7MYJvrG93jRpjjMIF5ty56mFhALwVxkeedXjwQBZR7ftfpg/7yxY5wdszFTQ==
X-Received: by 2002:a05:6122:1812:b0:53f:8fcb:b630 with SMTP id 71dfb90a1353d-5524e8a6bc1mr640999e0c.4.1759474259695;
        Thu, 02 Oct 2025 23:50:59 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523ce1c31dsm1016230e0c.1.2025.10.02.23.50.59
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 23:50:59 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-574d36a8c11so722771137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Oct 2025 23:50:59 -0700 (PDT)
X-Received: by 2002:a67:e70f:0:b0:4c5:1c2e:79f5 with SMTP id
 ada2fe7eead31-5d41d0e7a0dmr687881137.16.1759474259285; Thu, 02 Oct 2025
 23:50:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251002142639.17082-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251002142639.17082-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Oct 2025 08:50:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUZke-=yvKTYdj_K2iRrtiQvw2_papQr92p7qFfMYt_qg@mail.gmail.com>
X-Gm-Features: AS18NWB3eHLy8T1jBKvTcs-a-FuOQsD2BAEeM1FO7vparrzr8v4t9PBKVzDwMXY
Message-ID: <CAMuHMdUZke-=yvKTYdj_K2iRrtiQvw2_papQr92p7qFfMYt_qg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: physmap: add 'clocks' and 'power-domains'
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 2 Oct 2025 at 16:26, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Physmap supports minimal PM since commit 0bc448b49e8a017e ("mtd: maps:
> physmap: Add minimal Runtime PM support"), so support it also when used
> in DT configurations.
>
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

