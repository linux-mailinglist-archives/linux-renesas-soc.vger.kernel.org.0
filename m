Return-Path: <linux-renesas-soc+bounces-17361-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7A4AC094B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 12:03:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9669E3BB60D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 10:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7892B23496B;
	Thu, 22 May 2025 10:02:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A51286425;
	Thu, 22 May 2025 10:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747908134; cv=none; b=RKO/5dmJNTVC216pixXUgbl7alfzx9sf8mwNY9Dn4yoNGzL1JNu6HY6lgjufKq3AvrdPpvDk3Xa1Tw2bG74R6FDNyKwLB25u16N9e+SWr51ydyDeLTQSzPOJpJUaaJSqYOJZY0B9HLm1kLGbr6pnCHBei8yIJ8LdvARpTEm/pL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747908134; c=relaxed/simple;
	bh=fZ9y3hmqHMHfycjUXDg/5bgo2BzWqUP6d+vWzI6T8BI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OsEl26K2sERXvxksKqrx6CrOHSfStLURnCa/MN+m/JyqBXMW8KgHFuZdhFnMoCqE/ryPw8kMz0xP0hYNvqU5zD9Gfw/vP1W6MtXNgsnU6k2nvtSTZ8Vx8Y5A+wHkae3DTw96cUg0DyMra3ADKMDE36J79bSBzpIwDlkHiux/Fzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4766cb762b6so82607941cf.0;
        Thu, 22 May 2025 03:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747908131; x=1748512931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mfR82G7+YiGDpU75XIz+KkBWh2FDLbvSmizcDxpCYhQ=;
        b=AbeR8iViFshosHElua0+5NiR5kdNBJGUUPywK9I5KfjzxmRL/2GV6Z0zdw2pPrnYVL
         ibserqwsZYkZHuHXB3ND95v60afg+c1eGz8rRYo/w+7GHzeCk6xuGpzjt2Ny3ZVZ7wnr
         OZ1AmvN7USHp5DY/RChWc+T9M7FsUaG5BN8bz+FGV+bVTUsYeKIMlLSAGZZabsEgsRQ0
         hwjadc4NiXFQQ2I8rexgcK3u5afEyyt+HyW3cDM869eVJMiosI9FQHWDJI9YzVWlEG24
         k8GNYp2DMCEmdNQGrdrnjsGvFJGlDLvFh3BdVVOdr+t9vOhai7aSrkg9npxVhtetJq+9
         fR0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVT+GGmBaX2zv81657XL+T2s6bPRWuLUbj8DMvWKZ6O7wX250mrxGZTEH2DPQlzbOzazKGiBU7jMEIiG0Tn7WEtpQY=@vger.kernel.org, AJvYcCWKbg31hYpE4s/qUaFGEO/Wq3yjOiwIJJ5TmzgRr880vWak3HGKNwOdZZmQb8+QHFoZUXFUCNr5p6Zg@vger.kernel.org, AJvYcCXweNmwzOEPsuCr620jDm532BzToh3cmE6aa9no9eOkpIj787BsARdpurAeYp1dZnVJAhIYnFbLwvwNbZBM@vger.kernel.org
X-Gm-Message-State: AOJu0YzY6qnfgEDW+wpxkqXgnNAfHUiLPyRoPkso9r477PkB1XqARAJz
	khCA1D2ntEvkPT5dvT7YGV9/gacHZF8fwzvZ1zlLQpZK37TYjoCu3HN4t19O//sz
X-Gm-Gg: ASbGncv7U4AiFWYHXExmmCR/r6jjj2yanaLrCwMDXXD7RpOs4QgBx2JfgTn9XRrh9KC
	Je0hcuYTtkksrOOn1emXfGbxPdRHI7nMdcwwqYpXkIFNEoz2WugjGY5k+GDtWCn9YKUXkcjEWMl
	LHPEpF4qIRjbXtvBDjxU0nY4gmhkarGVO/d4rsJFBXF23qyQJUt2/iSviGpdx5IRpZTRrD38dQA
	fntYTAGQRkYFgjYddLJqHX9TrdUYM4ConPP8M1uyjpcjmaznZf7iifuzQ/9xFa+Zc3qZyAnIQNe
	w3bBk0SZg6klyNpovm4C7AMuqGsDWGsu89g7Z+NR59KBNk971KAAdTMTPpTtcH2OQ4SQ7sUfMPF
	Utt0PObnFytTNqyLBNjneW+J5aGUS
X-Google-Smtp-Source: AGHT+IGOntJ+n7HzDp6Zgn+tY3B/GVERWIg0xfuwbngw3FcSSbluvZ9TofbYTBxqdcGJPpDasZs2Xg==
X-Received: by 2002:ac8:5cca:0:b0:494:7121:23f6 with SMTP id d75a77b69052e-494ae4427d5mr409974481cf.5.1747908130887;
        Thu, 22 May 2025 03:02:10 -0700 (PDT)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com. [209.85.222.170])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae4fdb4fsm95948291cf.64.2025.05.22.03.02.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 03:02:10 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c9376c4dbaso844932485a.0;
        Thu, 22 May 2025 03:02:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWcxFoD7shTR6az5c1uJxiiE0tmgqz1w1ROEfka5Fm3Tb8FtdU4IgPh2pobhqAhiHkg6mewsUrGu2SFN2nKKhv+zpA=@vger.kernel.org, AJvYcCWodWKYX5a8Io08npUEyDTZlJAGJPOS8yR0GyDPMGdyVDdkXf8HWHAH0vCSTn3FnPtKNXWFqCk+bM01@vger.kernel.org, AJvYcCXFvs9knUniQkE9Q6MD0v8jjuycqIyLrKFlYmQQU3OZ6qbqh1uk7f2QA/O/1T8i/2IUcELuqtnm4U8P6xI2@vger.kernel.org
X-Received: by 2002:a05:620a:4009:b0:7cd:4760:bb29 with SMTP id
 af79cd13be357-7cd4760bc08mr3400216885a.21.1747908129138; Thu, 22 May 2025
 03:02:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514101528.41663-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250514101528.41663-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250514101528.41663-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 May 2025 12:01:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVH=dTN6gN5fwGLV6SCWON0oBvpYmgBekW+4WYbR_X2RQ@mail.gmail.com>
X-Gm-Features: AX0GCFuji_9TJcJ0xx3EBpnikTknP2N6XJYMQAX4eN5yckyNIelOJRJSNfw_nIE
Message-ID: <CAMuHMdVH=dTN6gN5fwGLV6SCWON0oBvpYmgBekW+4WYbR_X2RQ@mail.gmail.com>
Subject: Re: [PATCH 08/10] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable WDT1
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 May 2025 at 12:15, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable WDT1 hardware block on the RZ/V2N EVK.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

