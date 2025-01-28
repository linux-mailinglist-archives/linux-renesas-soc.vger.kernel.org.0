Return-Path: <linux-renesas-soc+bounces-12623-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C93AA20849
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 11:11:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D39A07A24FD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 10:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16322199FC1;
	Tue, 28 Jan 2025 10:11:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57F4156669
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 10:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738059061; cv=none; b=Ev9d5Q790CZVzzgVe1gzvCv5HG+k2Vz49MofNaeHnctiT6T5NF6nZ8+rDZvR0XRQww2sY3pXPkqTmIM9aLH5nlN/Q8e1hs9Qhyyh2MjyOTjTEE25V7TqS4tzl7DNniKl35MbQp89fRFqoKTgLzvNP2OKLqELPHLc0cPKpiEEMHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738059061; c=relaxed/simple;
	bh=smUno9HXHn8BQWv4yvNvrIongUMHtpdnhlRVbXpZRlk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YAOSCjH0Y7WjF0v8CiI04ugRPsSKlnMynbKgL6uck9Sp/yg3JCP4f6FBSFgOCf7FCfGHwBjZvUq/kePFYcfaPvNmFhnZPrBQrO8saIlBirLqxQUpgTAXnrTn2vMut08/abXr+dBLgHoNO8XNc0JnQATDyebdgL9AJMuNx4QBFHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4afefc876c6so1572428137.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 02:10:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738059056; x=1738663856;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/AAfq/RNvRQuRmMukdGgxMKHf9VpECc6Wyd77wR3+7g=;
        b=RQWMal4UMcTtz5Y6YtMVRiMMuX8TnP/8ThHFgMqByIZ8h2qolkJD2rKYErY+Oi/sDU
         7ZJzPDBmFpMshemyT5AqD01tYzJ4kRyG/NDcQFzoYnIbaaLAoxBRx3a9alnomLbpf2ec
         uBqeS0Ptt3mvIBLa1Onb2tZF3dqrZsK+Jz2oF9K57PisBYs6EWm1NCQuy9K7saFIzN52
         6fLplN2EciCCjOc2S71bP56qfn4svvTyQso7ZpY/zN6SMBTL5By2eczsKeemQqW9K7LP
         pwv6cVO+FQfnFy2DliG4I/OfOTeqRx9g+eSuthuskh9pf/1Uhas3jBmm7M34qWyulCYP
         Bikw==
X-Gm-Message-State: AOJu0YyzmA89VdjqVDqqS9QdoEp6hrT6IKxNiPnClkHrlDCiwd2W3ztL
	KW2C12YKirJwLP8qffoMBiCZ6+yZcLB2wvtopRWgoWUu8qy7GQXQ0TkLdVSKNJ8=
X-Gm-Gg: ASbGncvqkR7S1lcMHoQlkp4A+G6MuMGvH5eCDl6GRDwazEtMT4IUVG9HnrANKTbsFmA
	o3gi7cC8090EpSpR2AUQweg8tkf1gk1+L+q3ocSJJEmA2nyedjs3K05m/LGRU4eUwZxNbcpkMEr
	TAzi8/fuhGgRtNKUaDOkCRcDZMFmvRQCc1eFocOmMNxAW8Gyfn03FldGpCynM7pDl0FeVovmaW+
	hRYUEqVIPVAfEaWy8HrcjXPHbU/oK/ItUQe7q7Yf7igMklEZfYqhIRQEmfoJ4R/LXHoJbd0NyWq
	nHLF/QLbJj3vq43GDvJhSQkRhQRNtR29+liNhytFrL/Flf+S2a1ciZGq+V2ivBmr
X-Google-Smtp-Source: AGHT+IGwpyZvZZCIAYnC0swqDUAZ7GDvKrjFrbny9PNLF7BOJLrazu4nIS+fjwGnoHVewKepxuoxSg==
X-Received: by 2002:a05:6102:4bc9:b0:4b4:27dc:ffde with SMTP id ada2fe7eead31-4b690d14a2fmr39315958137.22.1738059055623;
        Tue, 28 Jan 2025 02:10:55 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b70999cefasm2086468137.27.2025.01.28.02.10.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 02:10:54 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4afde39e360so1412271137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 02:10:54 -0800 (PST)
X-Received: by 2002:a05:6102:3ed0:b0:4af:dcbe:4767 with SMTP id
 ada2fe7eead31-4b690bd612amr35553422137.10.1738059054548; Tue, 28 Jan 2025
 02:10:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250125125320.37285-4-wsa+renesas@sang-engineering.com>
 <20250125125320.37285-6-wsa+renesas@sang-engineering.com> <CAMuHMdXjTYa54Lz66JBgw5NXcJAP3BTnH2TOx987ma-EcDMdww@mail.gmail.com>
 <Z5ir-7cIM6YOlzgE@ninjato>
In-Reply-To: <Z5ir-7cIM6YOlzgE@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Jan 2025 11:10:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWfip+6wqkB+dK=F185WrVxofYs5irckxgDfEEuHOZ3pQ@mail.gmail.com>
X-Gm-Features: AWEUYZkQXyz-uBN1tjxLEVqAQZDgE5JSyEMj-kOv4nC6bhvMdYo3aHi44tHVskA
Message-ID: <CAMuHMdWfip+6wqkB+dK=F185WrVxofYs5irckxgDfEEuHOZ3pQ@mail.gmail.com>
Subject: Re: [PATCH RFT 2/2] drm/bridge: ti-sn65dsi86: Use per-client debugfs entry
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Tue, 28 Jan 2025 at 11:05, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > I gave it a try on Gray Hawk Single.
>
> Oh, we have such a board? Nice! That would help a lot.

We have several! ;-)

$ git grep ti,sn65dsi86 -- arch/*/boot/dts/renesas
arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi:
compatible = "ti,sn65dsi86";
arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts:
compatible = "ti,sn65dsi86";
arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts:
 compatible = "ti,sn65dsi86";
arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi:
compatible = "ti,sn65dsi86";

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

