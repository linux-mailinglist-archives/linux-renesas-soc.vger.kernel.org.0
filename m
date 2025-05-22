Return-Path: <linux-renesas-soc+bounces-17350-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDF8AC07BD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 10:51:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F114F188CBE9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 08:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45E1624E4BD;
	Thu, 22 May 2025 08:51:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8AC231849;
	Thu, 22 May 2025 08:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747903876; cv=none; b=dbE9Ki8QlXspdFgWm7sNwnXQZHikomMIBWUBSoRY/F5olfql2IP6UzbmfH8bPJodZ6i0uOKeUCkjVZiVjoyapdZBcpBUQb/IoRA+q2+mtxBR1QidoFYR60c3YfdwZ2QjamQS9V4GEZf/g2MA/tOKAbTAFcG5MASenzT/TFFR9vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747903876; c=relaxed/simple;
	bh=PXs0nXCgQ8rBU8HMbxjPoWfVULj4RccEpiZbPUyj2Qs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gublueVY8uHCey9bXlhI68nUjuP4VOpgCdgBjTZOIROMriX5NKv7A7xmBO/S49OZCBa055y0aTKwcuUhE8k77cPwXcNVP9VijUoarjwawoEavcjBr+CP2vYjPmqTyuFxkoa582Jhzz8UL5SF8aa1rzFWDffYcSC2nVh2O4lRhlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-87beb9976e5so1212092241.3;
        Thu, 22 May 2025 01:51:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747903872; x=1748508672;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tiimu5tH07Aj+FycvxevJCkcuTBlAW8I7CVjocXv1xc=;
        b=EH18pPhToO3iaGI99evp8eBC67jg1v+zOUfdSGEh/ulTJWagYP8DEa8qM7806Z6dae
         BuhVjTv/tBykbiJsXr1b1rxjH+8YXTcDBoR10Sqc07+CGsTbZCwjBVdLqQGxE7lGLQRa
         lmWwmh9G+9RQKnHeoyL7qLitMiWhaBWecKFAuDXF/wvJv3hOpB3hSKnhQwsUBYHBC/B7
         Ckz5Wm0BxYme2g+s3Pe085CB9Bk08p9xrMC+nHj7fuLhmUB6zryyJu4A8vJgFY11eT8z
         Ki5h7EYhss9K5sM4g+YUzp+XXw3m6x5zL0tLt8zGENZEVakMTT/mZ7FO788V+3/jdsYP
         Q9Uw==
X-Forwarded-Encrypted: i=1; AJvYcCVL1YjT34bpgbUyKDPQHnYgb/TSr++qS7KyWQZSyFeLhH1lMawnixX0dOuoG4uxN89xsEeQ5JQu22Dy0+hK@vger.kernel.org, AJvYcCW4FJwXh/sLGfYKNwUWhzui1PrnOTxy8tfe38+KuA+QQ32GLIjdeKuE/cIKEddTaxS2WlT6QIlSa7c=@vger.kernel.org, AJvYcCWDecgXUuK8TDY0cUJ+CLFvduvhhmeamvputIUMfVSdMh0yFJFN9DYRIZXE2tPalK4YfJhtAKBjgLR8DkwCWOWEq/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuxUD4wgcJwb1EM6dLtK4erWMsO3XULeDLHNz2eklQBJ5cmMIk
	cFGVs3hjdk1UWjb+yLeS0651ZaeN4Q8NcaNvU/N9tNtpzt9Ha+evadX/KBt+RsTu
X-Gm-Gg: ASbGncsayux8oH82dCpgLhqo9ZwSY2KyjDauV9+aOVWRBknzGitPhgzE+tiXwVgDxHi
	qEe7d2bfmUm2nA8jUiVmlzptrRG1XUxnwDfk+ObOp9WKx4qKwL8wMqvLMKVY0mVE9RSoCjGaBP5
	oAFt39hyyA8W/DTYBOZpVhv0VzcITiKNXYf/ABJ5th5/RKiK9Dg9ZgR6eiR0Gs2eyvr55EmNPv9
	jmeN+ZK6ZkOTtS/v1qm36n/fk97cd1DIhBV0tbwFPaYcktHuUqNb1ytep03aZQDP3ecgq1yzJbs
	ZurtNk0Oh5+lsijXA6+TyiKQCaIOhYP0WKK/g69gPSvr730YF9HAXWhUsRaO/QBTIEkYDjhLXKw
	cBryGReFcTG4HgWBAkQ==
X-Google-Smtp-Source: AGHT+IEaMToFJpx75lmZK7oRC8x4EXwhflqF9QB8ck7KAWZeAOiuEdpK7GJEBvYAqpbwt2KJfWV8BA==
X-Received: by 2002:a05:6102:91a:b0:4c1:8928:cefb with SMTP id ada2fe7eead31-4dfa6b9ca16mr20044740137.12.1747903871720;
        Thu, 22 May 2025 01:51:11 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87bec155391sm9973258241.15.2025.05.22.01.51.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 01:51:11 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-52e728960c3so1722693e0c.2;
        Thu, 22 May 2025 01:51:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUvO4bWxEo48N35yzJw0pgsFVVkzdsnhzo1nGH88+S80zO7taum+Ly/prUanjPThcqoBSpC2j3j3cI=@vger.kernel.org, AJvYcCWBDuzz1Elc41PxMMj+Wym42YMIEyVIh6utodLt6WefjQjLwpl3mAaf+ZGMdnzOg4+j9jser5kbTwLIRb7ZEKsQd9E=@vger.kernel.org, AJvYcCXPnfd68xx4gBLQB66u8ywOmOn+NR0m8ge2iagH6OK+pVtaI0z5VqasAZGiG70lAHO+GAs2o3bf9F3Wiqrq@vger.kernel.org
X-Received: by 2002:a05:6122:3bd5:b0:520:5185:1c31 with SMTP id
 71dfb90a1353d-52dba94ac39mr22366617e0c.9.1747903870882; Thu, 22 May 2025
 01:51:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513154635.273664-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250513154635.273664-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250513154635.273664-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 May 2025 10:50:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVTaPNQ2QTX+T0dhZaxKCrxF3t2X+11fAT0Va214j6SyA@mail.gmail.com>
X-Gm-Features: AX0GCFvCfzFXjwq9jXS6l2tFB-QyakJZrXkldCCPJq3bFwGmUxvJmqCvm465bik
Message-ID: <CAMuHMdVTaPNQ2QTX+T0dhZaxKCrxF3t2X+11fAT0Va214j6SyA@mail.gmail.com>
Subject: Re: [PATCH 5/5] clk: renesas: r9a09g056: Add clocks and resets for
 Mali-G31 GPU
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 May 2025 at 17:46, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clock and reset support for the Mali-G31 GPU on the Renesas RZ/V2N
> (R9A09G056) SoC. This includes adding clock sources required for the
> module clocks.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

