Return-Path: <linux-renesas-soc+bounces-16053-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CF8A8B640
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 11:59:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE11B7A7FB7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 09:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93827238C36;
	Wed, 16 Apr 2025 09:58:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41FF1E1E09;
	Wed, 16 Apr 2025 09:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744797492; cv=none; b=kfKkvKZePjBmnZuLfrsWsFhYxrVuPQkbRbG7YwCVP3xp/7jUzg/XjHjdZ4jNjgYNFhwuwcYm0y3Yhjajzq7gjLFYEL5LPBwu35eN5ccTw65gpaiYwwzhtRZrV5vDTW/jArrkJJ5xOxbdEcIzuhsw09Jea7oQ2OfKBeo+gDHwHJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744797492; c=relaxed/simple;
	bh=fPQV6Zrf45QWwPH+r/A+nqMSDUivJCAqrV7haz7+hmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h2eD4KrtSwRGqW+5ZbIxD8yHlymeK2Pup8UF0AEDlyLvSq3Fy1Hqq7knxUUyVAQKq0qjnON/05GFbrcvynecarLFPv740ffRDCEIjDoBQwm/QApBgVdEXQyZ+9O/Hj1Y/CkTGrkf4Cwbr0sKQ3+SXWe+eqlyl6R5HkOOOueoHoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-86f9c719d63so2530554241.1;
        Wed, 16 Apr 2025 02:58:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744797489; x=1745402289;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ouJf3MYk72N/i8oJ/ztDvKdHGpn0rQl4+9Q3B3GCOh0=;
        b=AJnUGm+eAdYkbvSRS/67ywTcaj9GN6HnZMVIFCTGWFIjKLykzl+iVw+IugPtxmgoHV
         t48IXnEuPLUE/3/UEoOQ12vR4hHZaClce8njfmUCuNND7dp7CPIv4T3BUeFhhsPZM6G8
         /qTfdRyZLWPovo52Y6rAwteQ8Jk2GOQwC/7mYRJS35GzQAregyj1Gu+k/HG89lbLGU0c
         IqWOcUQcol9UIg9QMrTpf2JjLIFrlFgVRLyqFZYcSljfIubkv65QPwGouijhUpntld4A
         dAxlLM1yuZhBroLM0OSYJG0aYGWuE6DGRzqP6kw1CE6QXZDu4CYKVvFc74B1m0F/urEY
         3NBA==
X-Forwarded-Encrypted: i=1; AJvYcCUhkEXiowjLTS1XMwCUlwHb0mZ0PFPGMdQ44F7kUanjyZPl0DjTj+JXWHe1/cr9Tx2eBtMpmZmLrr0WcRPI@vger.kernel.org, AJvYcCUiz5XhmMCKesUCZeEvVhc3iV+yJE3isitG3rcG6K+vPgvuQfMsMZHObhwgFSLvy4l2p2WGadNvQm+Yb6Go9egauig=@vger.kernel.org, AJvYcCUq5GjX20FC2wWhiWezmmODnTaYBlfDHfPWx/wlLFw535potCPukGQDDLp62fbuY4N7PABO3AfbeWJg@vger.kernel.org, AJvYcCVKFrGagzoCEUN8DKy3YVeoLvM2GL+HhUnEB7I71Ucc+e1vCoI9sNkNOeZUnR+aGqMAP8pCdVne3A+A@vger.kernel.org
X-Gm-Message-State: AOJu0YzeGipgpkJj7K5qZzmn7XqNFAodit+7Itg9Tm6vMNQRW5WKVTGs
	FlxW8DLbzjzYwX84wUlULAQjgsr3AqYbIDOCR/J71+Q5scbQQV0VNKH9e9gS
X-Gm-Gg: ASbGncuog1ok/Ess3c7GfcACgwbpkTzHXfH8ZKDXv5X+d/k83gFlfXm9lgammV9ujkU
	ql5Bjy/Z8fY0wjaiwjXCKZVtg7vhfhcwoOc10PuuFuCWmP3Av27x2sqFwzOZI3SkJrYcM/Bzkx0
	dCHOOn+sO1nkiBEUn7Fdpila4P36GlA6+cs1mzhh54SWSnQGa8Mzkw3TgXuo3j5sVsM5ufbKgVJ
	vHJBTSbs1dVDIySfb3MBtkz8nq0KA/fISrkEwLCxv4l+w/rTS4yR/ZicBnDCu6aMyq6uEE3xPDF
	30FEoVKavyI/QuZ7TZ7OScMg/JinD4LAqbxTpgZFOuHinWtzS7JwRykEM/2CJDwGA/i9pn0YoHQ
	qcq/UtsEAigBobw==
X-Google-Smtp-Source: AGHT+IFVrs4e1n//liZR5r49dEiexvP54IDaDMMYsGfAHbl1S24CRf7DRh0WxBYUzKBvlnhKQQW8NA==
X-Received: by 2002:a05:6102:299b:b0:4c3:6393:83f4 with SMTP id ada2fe7eead31-4cb591bbdcbmr289243137.2.1744797488868;
        Wed, 16 Apr 2025 02:58:08 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c9c97a2b38sm2983717137.15.2025.04.16.02.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 02:58:08 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-86f9c719d63so2530541241.1;
        Wed, 16 Apr 2025 02:58:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVKxxqC35p/hTWvzgME7pkpHQDhakKyocmwAkjlDeErTeYj7wMhh3fnECcP1qwz0WgiWk84fMLCTxiK@vger.kernel.org, AJvYcCVV3gsOInrMpQ4MN9T3SDziQt+hVpWNjWCNRjrVP6OKe946CMY4q6kk0YHikIh/EUEShQkfg4mYQAgDlo2nqt6IH9I=@vger.kernel.org, AJvYcCW68vDCXcBEsqLHLk7MZuRDgrn7yCtly+tlzXeuD7H48oMY4uEfpPoEF6frkLdVYGJwXmdv4B1j13b6yx1Q@vger.kernel.org, AJvYcCWjwHdvMnXGlNBNfJ7vCtt8SAwXYWpfcoJOXILTr8a2fzCVgt93PeqBzccvby/d1jWtGAqT62fB/8Pd@vger.kernel.org
X-Received: by 2002:a05:6102:2991:b0:4c3:9b0:9e6b with SMTP id
 ada2fe7eead31-4cb591e784bmr298458137.10.1744797488201; Wed, 16 Apr 2025
 02:58:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402131142.1270701-1-tommaso.merciai.xr@bp.renesas.com> <20250402131142.1270701-4-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250402131142.1270701-4-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Apr 2025 11:57:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWsBKhOwm40Ok3nws7JeM4eDkWVYmcFsZhXtUNQGjDjgw@mail.gmail.com>
X-Gm-Features: ATxdqUFyZ-mJMZ-2mTe6n41F3VRAkVfWYdC50jyu8XmVfrbKXl7Q0A8mKpeE88A
Message-ID: <CAMuHMdWsBKhOwm40Ok3nws7JeM4eDkWVYmcFsZhXtUNQGjDjgw@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: r9a09g047: Add Mali-G52 GPU node
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Apr 2025 at 15:12, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add Mali-G52 GPU node to SoC DTSI.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

