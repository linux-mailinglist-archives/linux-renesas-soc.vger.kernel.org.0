Return-Path: <linux-renesas-soc+bounces-22836-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA77BC9BAF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Oct 2025 17:18:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BD68420020
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Oct 2025 15:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E051D63FB;
	Thu,  9 Oct 2025 15:18:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1DC34CDD
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Oct 2025 15:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760023117; cv=none; b=VSgsp1fbEG2ixEbDgf1jsEgmsxa8DRkPu+xzhkQY2rd+GGwjrMa/82PA7bu1Q1t1CBDJfbN3hWV6LQW9wd6ivYn92X0Louvsega3K2D48OaE4k5w0u/AuVgmkCvMMa87xnXCa8Gl6w6gl+uQvehD9zMnJ89NG/h1qsJkNoIR9tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760023117; c=relaxed/simple;
	bh=k8sKIXVbebvapbPiAiig6INW0PFARtsSFfEQsQ5e2yE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OIKg4PzgRc4VHRFWlEjxBlxrjIphneUbAeC6iNsqMjmyXN4OL2P9856h2V9PggStvO8uZyqw6UjK8jllV9cqrMDuHczLEWiAVxvjkKYvUjpBj91s6rJ4arbmc4Rn58YwtaofM5w7lN7bwEYfPpAyC9OM0fmkCKgARaf8YV/sszI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-8c0e2d1efd5so335753241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Oct 2025 08:18:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760023115; x=1760627915;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+v4U7mwsla1m2LNZvOQWh16q48gBGZybSJTeno9Yj/A=;
        b=WERU+bF/Rr9OGe2SFSLhECZf8Ls5rvSbASe05a9LE+yclm8P/hOq4QwYlIsgykpSGl
         hnUQ+BVt8NvFsWlQTDLSxnl2FEbMEfQorwUct4t9m/xha+vISvMJkPDpptLqbCSKJJGW
         eJhTkZC4EaLswH7WmLywnfzcTkh3yyhyj5X2aFAX1FeQT+oZGQo4BqniV6P/5qcYqg5b
         RD/kwtehirZ9z2gZF3Swe70dzv14RLX+C50AYlxb07OBiVGuqoJWjQ9SMzsn4lw/KJFj
         t5+m/3vKCQGP9Rt6drfuehvGU409S9FJFrsMdSqRE3ihg51VtslvwDnaG2p2/iGsI0qf
         wHKA==
X-Gm-Message-State: AOJu0Yz3AsMSxqQAzsTtpay1NoVv1QvYua0pJ9bA2KuV1hGwbdV2D+4O
	Qnm8d+5enO4fs8ioY3dW+r8tqvZa6v8/AGS6QmSBMgkqylHaVCBYYHHchBcAPPP0
X-Gm-Gg: ASbGncsUE1OosRx9ss7jUW2/kuPgZcp3MTKTWtdIGmtgS1bGW3Mn+zecUVry2TtNKFQ
	qythOf/DaAapXd8W1aqQWh6r9M9Sxlh8693FCCLiodZvbDfG0d6YBy27GkW8BmOQ93yEB5xqMgg
	eEdpYWtPRAsNCCIgNqcFhokVvFz8IInDbDULUruBMV3xr3OyUI4qKQKu0Ztw6Ahpk76vc8+i4ef
	qiq7wPzhCrsjbTNirx80ENMUcxxXvOVv0YP4z34dlPNZ9VitaMsj5U6JsAm2qeF3/DPhpG9jSJo
	+lHzhKG8WM4Hh9KuitaX9hfnOL7fpItveRAEuqwg8KTDxGPXNmYyomuHhONq5szkfUWR1Z8EbKG
	nDV10tCvqGDR4Rh3p8h8ZrwyMorzRQjpgRs3UEdS9udVNR1XWkq1dsyM705okyDJrAsp5INGJiV
	0uSryk4+n4BzY3htaxh3g=
X-Google-Smtp-Source: AGHT+IGZTK7pNc8EzbU3DsSmf5+B6T8JIYl76A5Fu97Rlo6x/N4zX/v/AUTucoElTz1TyCinAlZzHg==
X-Received: by 2002:a05:6122:318d:b0:54a:910a:872d with SMTP id 71dfb90a1353d-554b8cef3c3mr3239041e0c.13.1760023114957;
        Thu, 09 Oct 2025 08:18:34 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523cf65458sm5377050e0c.24.2025.10.09.08.18.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 08:18:34 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-8e1d6fd99c1so354170241.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Oct 2025 08:18:34 -0700 (PDT)
X-Received: by 2002:a05:6102:6202:20b0:5d5:f3c4:bda1 with SMTP id
 ada2fe7eead31-5d5f3c4c16dmr1008026137.28.1760023114539; Thu, 09 Oct 2025
 08:18:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250923161709.3110-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250923161709.3110-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Oct 2025 17:18:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU+0iL0fjMM+_vPxsOmPXW72X0_=X2A=ZA9gRf367UB1Q@mail.gmail.com>
X-Gm-Features: AS18NWAsf3LSZ9p7awAoyWuAhPYszSm_a94Q--QmnePbABWHS8PoBRWo4ys5kmI
Message-ID: <CAMuHMdU+0iL0fjMM+_vPxsOmPXW72X0_=X2A=ZA9gRf367UB1Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: eagle-function-expansion: add eMMC support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Sept 2025 at 18:17, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Add pinmuxing and configuration of the MMC-capable SDHI instance to make
> use of the eMMC.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

