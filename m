Return-Path: <linux-renesas-soc+bounces-17360-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE67BAC0946
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 12:02:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 284D018974DC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 10:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4EF92356B9;
	Thu, 22 May 2025 10:01:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A5923496B;
	Thu, 22 May 2025 10:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747908109; cv=none; b=UqUl2hL9py+2vS3Rtz455e7L2MFy/gGEOz8Jl5v8MMRlZ/tysxAJ6uJ6i46R90QRr+CGnyAskoGmg9KnejHacwPcH+USO3V3jcJ4WwTgTDtzI5bBssuMxHkKNOlELScBhqffL6H39P1pOIQGmSRyrrr8HzsyvaayQlFVukC4wmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747908109; c=relaxed/simple;
	bh=kQnnG2m8teaM58yg7aKE2MfdHBA4zpCDZ3f6DCsDJvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t0Eg8RQ0mUOB5CsHjFFLkwyng5HyE9tEW2r/8YxpuSdFlr0xk7E8xHHoa8w5abbEH0ZFaaozTi9s4L6ZeFsZpeHYvza+tby8ctAZjveNEemgoHq2pUTr8cYWdenJ0gfvVUGHYdj0SvdQbXIAE1b0cNUHGYxuBZWFczq9lpmHHzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-70cb3121db1so48996967b3.3;
        Thu, 22 May 2025 03:01:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747908103; x=1748512903;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vayQSCavrQR6kcTCwkegI+bNpbK3gwD1wJ4KzTIND0k=;
        b=ENhmJh2dCb1xiVPF7SCfqXEwUI4tHEgCY8HeNPpPuJiXZKxoOQhWl/cmQ0ufeSg0ve
         Zq4xXxryfKwyEhKis2+0brU3cv/Xm/+hnjmJKEUdp82IX8SLZY61YeSDcMKqmnmR+TUg
         FcVO/qQcx4wgVjxcZGs7mP+4GlVoToKJ6o5r4EEJ5wKjtowORu4mkmYp3alVG9Pn741T
         sZOxxl19a7SVM3NOoGq75fTfeFRk2OQFNsznKpftHljnBCNe2YPgki4BgF1BEV0Vp25s
         HuOITodYCthIMO/WWGvCKxoq+B5YGYOk2X/VKv+kA5b35cC4l5s1IFspQaYIkqmFb45F
         xvJw==
X-Forwarded-Encrypted: i=1; AJvYcCUos4dH18/MhzrwMgGnU7sAf58J4Hc8vUYI4XXLwPImg94UPYD8styNzZ6A60hnkRLljmcSH1PJKmKJwFFbbSlVeuM=@vger.kernel.org, AJvYcCVwdnLtAogYllPMLIcPadNbQ1tWO7XeklYbY1CWDhz19yR0R1XR/s9zG0U9m0aSB381lW4DEbysLkJy@vger.kernel.org, AJvYcCWb8G/WXzsV7apJCYWmSU/e4yJVpq1cjpMUr+adS6VM4F+aPNzdyrvkBZEl7i9UjV1SJ6zLqVtL0j4S6+aJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxNSoFGmYA1r8Rp+3YEHmPQSqW22LOhBc+Law7PD6tNwwqFKf30
	QuY+iscF2p36JmapAhD1/Q15sSDoAjMa/wM3uxBhs7Cz5gzKYGY/nPvq2vuV4Eek
X-Gm-Gg: ASbGncvs9UwwE56h2jKkEn4bGwmHMCy1gYMyStWTgrjqQYQZSWTQixkc0dYnaNt+97y
	pOBcyPYFMiQiMrn9c0U0ss4lxkKI5T4BG9coAFoRNZd3MWHIAbv9zZrLIbBz5UiEe587bYYd/nT
	PINwm7gfR2KiteMtmgKaUlN/KUcCSx8Wr1GaG9QQdj3iYiO+/8tPHg0PfqsXErzqa1zeC11YPd9
	wjfhaYmrz3lg4sA5c3kL4g7XUOUBoTsK/zP9gaJAtYNOmbLwU2MeX2nXW/ekJ5koSD/jHS1fz3V
	nLpmkHcCVdmlotR7VtJbfSFBs2vtyYsqh5OLr3RUm0jSc5AJag/UL+m00TvS2sdEauMauYjtaaL
	/DglzlD58dYwUUsNOdg==
X-Google-Smtp-Source: AGHT+IFShyLGssQvXNgHphsQABQzIH/u0RhhQ6LaIYMYRt/o20Wr5eWdK7P0mTdWCXw2S+7YCFu4qA==
X-Received: by 2002:a05:690c:39a:b0:6fb:a696:b23b with SMTP id 00721157ae682-70ca7bb273bmr312020347b3.33.1747908103534;
        Thu, 22 May 2025 03:01:43 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70ca852d9d8sm29979217b3.109.2025.05.22.03.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 03:01:42 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e7c5d470a8bso4448183276.0;
        Thu, 22 May 2025 03:01:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUH+c8pKglK+QwizYkcl+sTQeZ3Ug78cBJ7p7HvKEG2Rn93qYq8UrL2xsrIgL2cY92E7yI1VCiBu9LArx1+HYI6X00=@vger.kernel.org, AJvYcCW4SxyntbheXG38SWsQa4CPCfEuIYVeS/MXSHbvgFjlWadMyQCOgNfgbyCNXpFasA1ZuW+VYTREy++QECrk@vger.kernel.org, AJvYcCWq/tgAQ5hY6Abx9kX0ukUthcNG5tuyh34zVp28kJC3cDVD5mqBtPSddBQeG/5l9A4tNEa/mlf9t/QG@vger.kernel.org
X-Received: by 2002:a05:6902:1089:b0:e79:330e:51a2 with SMTP id
 3f1490d57ef6-e7b6a52efd5mr30725555276.30.1747908102282; Thu, 22 May 2025
 03:01:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514101528.41663-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250514101528.41663-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250514101528.41663-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 May 2025 12:01:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdURsTDTSm=T-huJhQVYf1m5Ny6y_PdSvnCg_bEHKV6jTQ@mail.gmail.com>
X-Gm-Features: AX0GCFs1b2QcdFfpfSbRu3Pdkg0JMOK20a-bffT1cgIGpGDOz83YfJdniQvuY8E
Message-ID: <CAMuHMdURsTDTSm=T-huJhQVYf1m5Ny6y_PdSvnCg_bEHKV6jTQ@mail.gmail.com>
Subject: Re: [PATCH 06/10] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable
 RIIC controllers
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
> Enable the RIIC controllers 0, 1, 2, 3, 6, 7, and 8 which are populated
> on the RZ/V2N EVK.
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

