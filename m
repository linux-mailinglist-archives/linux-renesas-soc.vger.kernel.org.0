Return-Path: <linux-renesas-soc+bounces-26011-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B197CD6712
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 15:57:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52B0D305C4C1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 14:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F41EB2F549D;
	Mon, 22 Dec 2025 14:54:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACDD2E1746
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 14:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766415270; cv=none; b=exzdQA7QiYxRLANNX6pQfU3K8YTZnywaHDJGgym6QDH1elQALx3I63q+U61Jkh3pOl3WdZf+D5gXvNTR0CzaQgmNaLJXDvKAM8U8tIw/Ez0MfGN+dAuGeAMER2WQnXzKeaYsl9Mrdo8yh8klFR5xbQqpZ4i3gmi5dfxO0ImqhBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766415270; c=relaxed/simple;
	bh=W/crAT6LJo4Q3kHr6K4TRNPNZxeeFPpC48n0pdXsNEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PN3ihgKs3ouRwW894c3vyBfxut07Z9dl6CWPhxipJP9dmdAcSzwgpSDR9f9TJoXbmN4XzHoAUuqCFR5vEVsSjKlRTuw4g7UjxRFy47K3+MI1Etrl3nL9UbRaPrJLqVrF992fvo1ItQ4TWXr6dkWFnisgvEKdy9vhuwzWw8Zfxx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-93a9f6efe8bso1101474241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 06:54:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766415268; x=1767020068;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FdTNXu74m6lC+RoCxXIKV4XklNctrQtG+yWlvlzun/Q=;
        b=LXTQUUUV/rjt/ukLl+kMQWHlUs1Gxi/41bXBfsN4LQUjD6nVEBCA/tTN7jOxbhueRo
         6VzUam2nTtMAhyw2YQSKMB2oNfFiKmQl1dZRtKeObPeRu08dqbHcIv/cKftQGiiMkMWK
         hxgwTI5cIL18TNFQX6O3Em/wKe4KKMqHhxCzZ2dN6I6MPBezF01iq62+ntOVyarlsKoe
         c5CI3fBCW24SHqMMNy1u5Vv6A/jqBs2lYyjUysgtsJhrXykSIyg6qiaQmQefLAYMXyLM
         qtlc1x71Zarjt3aabu343savfcQgzKENGY1UUKBFDqCqjQmqGyLEP1QoNAJLt1xGl/Df
         4ICg==
X-Forwarded-Encrypted: i=1; AJvYcCVB1XRQ+7jrOSl3TMykw50mDzq3h4tQmtc5OIHV6Uo/Zy1R9WqJWtt5LNiU76x5mLhTedZFtqOQUKsJvE51CJYCjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFBZMHQLM6A2bqIv/Lw1dhoRDoWDHC4CjahxwLLBjOpoWVSAS5
	04dyuQ0g9ahW/nFoqLAsw+6Najl/XfANQ++8Xsu73iLASu+CGdr5ZfiPHzvxYEex
X-Gm-Gg: AY/fxX5M78T4YRQmoCIFqeCNwaS3lAG726wIcGEz701iJsWAXmE1cCm1T0NfHudbYlt
	gF8PzWTibXThbN+1HDEti+icgKrSdg4oDsCzg+ufjXQpDhQ9VsptEOSiOAPbRwluTJhmp1gZthg
	FsqATJ5bdDL4kkbRsbNEUyLbZrAHP3DAsxNSGIP/3L6N7L7NolQUasduE1Wp85t6QGcBJDcBv4j
	6+xPlYE1IXtnkc6u3Q5j07P3lKhNCF0odqI21QmD1jSDQ8Bp8tTu90XOVkjcLWLaDTLhlwK7/tM
	S1w7YPsQBapIJHjzbOhGtu+Wy+KDOIDYNn5QlTz2Pngmlte+rCu3xF1/m8gEFnjp+NQ14FpsnlK
	q7ICmYjNuE48vANZ7gMVuBXjJIt6tXvUzynfwgCIGFy4/YX/oM9uoZ/T4KvJ9kMsujjS2tUxPWt
	gBsX9qrQZdMjzFsyI6d1E6JaVwAaX0MEKnUnbgPzhhWsRl1G7K
X-Google-Smtp-Source: AGHT+IFCzC5XssBv2tH3fTmfggXywLfTQx58pJ6km0xQTabUezRUCdVKYL7/v2rBFpnyLHLYuO8lHw==
X-Received: by 2002:a05:6102:1614:b0:521:b9f2:a5ca with SMTP id ada2fe7eead31-5eb1a6570eamr2814889137.13.1766415268490;
        Mon, 22 Dec 2025 06:54:28 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5eb1aa8c125sm3475104137.6.2025.12.22.06.54.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 06:54:28 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-94240659ceaso1135128241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 06:54:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVd8dmj9/ZPFl7gezldQ5ypLzD9P9NNA2qCZmpkDl0Owh40wNoiTMxpMMOhkgAUpnsq/rD3x+kTk/MKTCh6gMf8Dg==@vger.kernel.org
X-Received: by 2002:a05:6102:2922:b0:59e:68dd:4167 with SMTP id
 ada2fe7eead31-5eb1a6171d7mr3065752137.7.1766415268040; Mon, 22 Dec 2025
 06:54:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251129185203.380002-1-biju.das.jz@bp.renesas.com> <20251129185203.380002-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251129185203.380002-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Dec 2025 15:54:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXPeU=e_Vbr_G=P3UjXgt0EOd3hpZ+pM+jqYoxV=98jJg@mail.gmail.com>
X-Gm-Features: AQt7F2pKNIqVrEWsDr5mq2QiOn6lFfp6Q_VuIAeMjfO6UauwedaSfqmkH0yZxiA
Message-ID: <CAMuHMdXPeU=e_Vbr_G=P3UjXgt0EOd3hpZ+pM+jqYoxV=98jJg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 rsci{2,4,9} nodes
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 29 Nov 2025 at 19:52, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Enable device rsci{2,4,9} nodes for the RZ/G3E SMARC EVK.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Rearranged pincrl entries order by port number.
>  * Updated the comments to reflect the board signals.
>  * Added missing pins CTS4N and RTS4N.
>  * rsci2 is guarded by macros SW_SER2_EN and SW_SER0_PMOD.
>  * rsci4 is guarded by macros SW_LCD_EN and SW_SER0_PMOD.
>  * rsci9 is guarded by macro SW_LCD_EN.
>  * Added uart-has-rtscts to rsci4.
>  * Dropped rsci{2,4,9} nodes from renesas-smarc2.dtsi as RZ/G3S does not
>    have RSCI interfaces.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

