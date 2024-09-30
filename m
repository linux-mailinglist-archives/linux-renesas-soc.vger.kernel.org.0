Return-Path: <linux-renesas-soc+bounces-9190-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E7A98A6F8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 16:28:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 260921C21D61
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 14:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172811917C7;
	Mon, 30 Sep 2024 14:27:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB15191484;
	Mon, 30 Sep 2024 14:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727706476; cv=none; b=iTOeTtuXEVYBaAqMvyDL5cZQ1J1rASYTsf3l6N9sBv/sbnNE6Qm3Yc3CayC509TxH6uOcu4lAXixtmDG4oC5LsTFCt6qU0kpnpl3ySDy/qqRCNBowrm39NcbhPfKPKLtPlUVeZznc+VfB5HN8r9QLi7e8yGfcIVrW5vdehuSfEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727706476; c=relaxed/simple;
	bh=oPTIw5YfsovYjrnxs4UQ84cLGGp8sPG7eUb3P5w4wd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qUwwOpNQZB4q82R1PEHLz5yGvkujhvUB9pX0NabapFSUGkYASrYXTHPceZ2F2W+1h99HTK1jBUHKMGGUQtiR5vRpOj+NSOcOgDG61b6be96a4Gs+O3z58NnsriaTXZmCB3LZEYhruhwt+lvQkZNV4g3dQXZAdMhLN4GzTbtpHl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e1651f48c31so4298322276.0;
        Mon, 30 Sep 2024 07:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727706473; x=1728311273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qIwcknFjfAOkd16gzyHHjbVxkGkOzmZX89V7ikbQToA=;
        b=hgsxn2tr2U/wBLsDzVwyypzoaoq7tlITrmqNfLyPnyydl8rhcbuNe7PAsHxw9EwaAk
         cj8NYp8ecKg/VhAGgBTeWkFiJWBMOVAOBjosceA3d4cMCef3qyydwOyYPPynAZhytXoX
         V/w1adBRjJ8d5k9DEjDoJgYGSfGrKishJOwbVQcwuCzDK4jJpbHhimYz1vLxYsK/7TlD
         RKwx/kv88zjOeTtNLbcdHIs7yinc7UhKQ+VewIPPf+rA9NUUUCT74Lt/0dn3fqkhKn7h
         caLEfBpMIRKkdK6kvpHcCqSLQDaC2lKMvplJGQ7/j4dt1AwbeW7AK2nZ9bJNbUYf1FQN
         loJw==
X-Forwarded-Encrypted: i=1; AJvYcCWI8+mVJO8lhUErn2FllmgbyjaSWEfbH5BZjAcH3kRWFqLjrBg3nH7dknETit1C8nirquObpVUfMKC/@vger.kernel.org
X-Gm-Message-State: AOJu0YwAz6ES2UUZrcWMn1ABh8HoH0Mz/u//SOYJare8tff3OJj73suA
	Am42zzZXGOvlQuieL8K//d0V5RxaylLDJh+NEHPXshwisVZKfdsakH67oW3L
X-Google-Smtp-Source: AGHT+IE5cTK46SBaiOLOOnwrwnk3Yxz64sgNo4ZJWWOUIcAIJj/n2eSv5Fbn1Y+wkjzcxJFjWOHl9w==
X-Received: by 2002:a05:6902:230b:b0:e26:486:5be with SMTP id 3f1490d57ef6-e2604b1527dmr8021034276.11.1727706472720;
        Mon, 30 Sep 2024 07:27:52 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e25e3ef8ee8sm2361150276.1.2024.09.30.07.27.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 07:27:52 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6db4b602e38so34916577b3.1;
        Mon, 30 Sep 2024 07:27:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXkxxI+iUSLNUKS9bilqhnr7UnfH7+VGKtgWKCBsq4twEPiX/ihDI5AsD5oQFxA9yCslU5VOdnijJF9@vger.kernel.org
X-Received: by 2002:a05:690c:3691:b0:6dd:c2e4:d245 with SMTP id
 00721157ae682-6e2475498a3mr101009707b3.14.1727706472256; Mon, 30 Sep 2024
 07:27:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927095414.10241-6-wsa+renesas@sang-engineering.com> <20240927095414.10241-7-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240927095414.10241-7-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Sep 2024 16:27:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXUpFAt4BX9ApxehohLpsjn_OHBsFHJeGxbPfafF3Dekw@mail.gmail.com>
Message-ID: <CAMuHMdXUpFAt4BX9ApxehohLpsjn_OHBsFHJeGxbPfafF3Dekw@mail.gmail.com>
Subject: Re: [PATCH 1/4] ARM: dts: renesas: marzen: use interrupts-extended
 for gpio-keys
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 11:54=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Using the inherited interrupt-parent is discouraged. Use
> interrupts-extended to fully describe the interrupt.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.13.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

