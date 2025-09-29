Return-Path: <linux-renesas-soc+bounces-22460-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F31BA95B4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 15:31:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6053B3A7B24
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 13:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 620CD1F0E25;
	Mon, 29 Sep 2025 13:31:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C5E2B9B7
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 13:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759152703; cv=none; b=STKSlH51jwvSKkfiAgG43ytJs2hU9qvMMkJ/DCiE6ejfydUCYg293Y4i/WoxEwakjgiSoxxR8MLuXxBwVNEIvzp/8ooFfLbPBQ2UZzYMR/k45r40MKUfpg512CmfTtI10cH1L+E71cIp/2/TB0+AP/3fVDjB5F+dKxsJC2fl0mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759152703; c=relaxed/simple;
	bh=7KHIpDL9IZxvO6vMFR296dPXprOWslUH8R2HcPmutEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I9DQrAvVPb0jDVo4mPhVz2M9FTdKmNsoRHPzSQK/HN8zHsZZoLMisaIwI64K47jbiSOnXonXvJ/WVmly8BKNnSwc1yKM8hfdm5WHGJAWEBpd33I1rJn8cKxQSjVyGCZgvLblUHXeuoYP/QbUma8L32lpjHbs17JT0pBUzs79bnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-54aa30f4093so1790946e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759152700; x=1759757500;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iR/LPrxbJ/3y6Uc+Th02lti6vx4Oqhig/nLaruGHJGo=;
        b=ZzpFRhHCvPZAzLeQlA2/I7yc0gZdAknOWtkePSsks9tENX0xY4kycWCe9DIBwCiyo1
         rIkYm0hCJB0bwEVKF38dC/Nb7IIVC2GxQZvB8gudEAqQZfmV+by0g8mJ+lD18gLyScuK
         h6fZ+oELYa/qIBcGhLAB4XkQz6rHGKqwJhed8El/ku5myHwahwidl+Y0jqLQRTB5PIPZ
         ko1hqyBQqW6H+A5yp0r3/T+6OfTUvLe4pTekfSowyg0ZQxdTo1aOS6qkJs23y9+pzi7l
         /qcrUQvVGx+ZmpPcZeIGHn/1ywUnJxjyysBEhlGBbeiraS8hAYGqqVLJBwiVg2IAlyOh
         vvtA==
X-Gm-Message-State: AOJu0YxWpYXPvqqUWt3+MGPGlLPjyPfOgO/MEeucFwC4qhDYtPiISVB3
	matRHJcgiSk5DGKmsqiDgjGUz4xTW32YOBJhCx3sXSloj3MXc/SiiYgagqP1lxJ8
X-Gm-Gg: ASbGncuDnRLaKpEFmFxoNcSBM0GQc+XbO2VNdp6hlaXMksq6XWg/CF9UaEyx+LHa8Bz
	ZyoK4ZSzNjv2upBkEUwv+mcKP2fRwAVg/JyuKr4KmUIA/r84utMPPFtsI+CoYa5S9xpfB4eJHeC
	QzxreuFGOTiTxawOSdjFANJAscngySpS9OLRpLy350NfFgF8TwlitSf2C5I92c+r5vkRjZ1BiTA
	1BESwfPwN/jgEL4YML3WLiT3HODMHLftFn/a3Jt+lUwQoyxa72TQ1jUwEM5JREuXCfUIYw/PXZ1
	bbwHXXMHFaqTHJmk7qXhUHhxaeF3cccTMiKtw+EHwun7yJLJ9w6ahZdDYGFBzm3h41lyIMwg+rz
	eCUiMYizgdQH64u/1t6bFbVmnHzQCso3SJiAlRKDkSypIqEFu/tuw/3JljlEPcP4h
X-Google-Smtp-Source: AGHT+IGnQHuttkdMD9j/eG8ZkfsSfnL6APPiOmESeq8is7+utnblyRG7+sJgbxhIJ8vVkKGoeb0tlw==
X-Received: by 2002:a05:6102:e0b:b0:4e9:9281:85aa with SMTP id ada2fe7eead31-5acc33da9fdmr6662357137.1.1759152700130;
        Mon, 29 Sep 2025 06:31:40 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ae39eff1b3sm3368983137.15.2025.09.29.06.31.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 06:31:39 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-54a80b26f88so1930984e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:31:39 -0700 (PDT)
X-Received: by 2002:a05:6122:308e:b0:54b:c215:8c0 with SMTP id
 71dfb90a1353d-54bea03cc61mr5616139e0c.0.1759152699504; Mon, 29 Sep 2025
 06:31:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929093616.17679-2-wsa+renesas@sang-engineering.com> <CAMuHMdUjxcgcX2g=P7WyJfQOapMkf0skbUeJu-Yt-j9PKqO8AA@mail.gmail.com>
In-Reply-To: <CAMuHMdUjxcgcX2g=P7WyJfQOapMkf0skbUeJu-Yt-j9PKqO8AA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Sep 2025 15:31:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXmECY9EeH+vycup0UwLqK+xyY7QHjJUWTX0kFbUMw=AA@mail.gmail.com>
X-Gm-Features: AS18NWBL_GzV_k2NYmktPUSzXHZuV7br2ZMdlxbv2iOZS5df601XWFhrvJU41AA
Message-ID: <CAMuHMdXmECY9EeH+vycup0UwLqK+xyY7QHjJUWTX0kFbUMw=AA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: renesas: gose: remove superfluous port property
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Sept 2025 at 15:25, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, 29 Sept 2025 at 11:36, Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > 'bus-width' is defined for the corresponding vin input port already. No
> > need to declare it in the output port again. Fixes:
> >
> > arch/arm/boot/dts/renesas/r8a7793-gose.dtb: composite-in@20 (adi,adv7180cp): ports:port@3:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)

Adding

    from schema $id: http://devicetree.org/schemas/media/i2c/adi,adv7180.yaml#

so it's a little bit easier to find out what to pass to DT_SCHEMA_FILES=
for a reduced check.

> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

