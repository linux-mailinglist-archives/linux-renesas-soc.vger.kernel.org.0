Return-Path: <linux-renesas-soc+bounces-17359-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C157DAC093B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 12:01:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21CD71BC340A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 10:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BF44286425;
	Thu, 22 May 2025 10:01:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A8A265CD3;
	Thu, 22 May 2025 10:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747908078; cv=none; b=HuB64G23biCfeu4wegyuQj9omyKF1t3IRLCuLoILSrb55YllLGctNCRfKIpK0SPAE3e0RnOskJQlxQLUWK8q+DVCUfbFZURqMi62eKfH3p0e4ecBHQQ+qzs5vZnCDqzGlOBQi09Pw1yJsltu5h2je58A8qv9erPBXusq+49aFLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747908078; c=relaxed/simple;
	bh=O+ZykPvL20QxnpDZph15DoKzX2v0rKeJ68OxTA3doBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LYJ1ZzpdIcSXhaPI5802yhKoHXbupV6dM4zgovCb76nAWhypQwoxFkg6oMUg+TwODOQ2fwac/RreYS821nKkdTlwtqNyY9eqw/zHwWcIdhEk/K46dKN2O7D+Gml5K5ny+03p3j1KVjyfZ/6y/8q+Hb/XzCoUKTNSb46BbulGCPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-52eec011ff2so1431455e0c.1;
        Thu, 22 May 2025 03:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747908075; x=1748512875;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S63yXm7ey5VHw2+9ds7BlWtE6pf7cM+bMKIz42illeY=;
        b=mkEhpYeBK/Sh5jTdQRt+3kGMGfa8nvr9x00MT4DWkdDgjzpPhMLvefi79G4AJYBHsi
         DY4pU2aJAAkcSlOOOjLF8/C+8Z2/BG+9gUCZIt7jmqpbueY9amKxGesf432NYvLRgbEk
         MPhRZoyGRNU5HP4H25nYj9KdQwogxPtO9diZgkn41eo9o0H27JvuvfdO+QJeb8CQGQc0
         4WEvkkHH2hFfGGhAYRJLSLS+jE/YJujyUTiwccTdKlC8Yt/UHAn7iQ/7UdJVgx36e1NX
         0NyZ7M6JXYI2blMbxRIbwI5gqVkApxHcTPGtAZljTqzBFjRS1UGtFlst449pNBB7fRPb
         1FDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYShML+Ci+q6sM4ynbdCs1ueBjo1xBRBapHu4ykXliG/iiMIsR9CONpKX0DX78yPkA1GXIGYrecMTR@vger.kernel.org, AJvYcCVTU5PJ1+TMqKfT5XKy2oISnHx/81N1FLLQNkvwYBF7Z5QlbFn8eE5SNkHggWChQ77aEleHqQYE8lHnUCPffXdSrpw=@vger.kernel.org, AJvYcCWFWYtNdHCy7Yq5euYhlMBd6dQ7XItBDJJWmULOA4TM+2VnRQAlUuv8qqtKNSaFj083egYYxTBS82wGlYuG@vger.kernel.org
X-Gm-Message-State: AOJu0YzG0WTB3El9DTylUpDOdDbtQAFQQQPknFUFmNv/xNoYNFXkJ8iS
	31Lj9Hl8DuvdZtGNBlrJDw+7KzF9jwGZFX8Nc2a4PsR3wr6bJpAwTQA75PTxeZ63
X-Gm-Gg: ASbGncunFdgRRYLbTeX3T/dMNWziAGguMfM2t/rOUGCCUS5RDN8lo8Ths01DD57ro83
	InLwI07dlo55GzU7gR9uO95k7XibCKPVjD6oJcTeyQOYCF1SJbJPNAIpkC0sE6eiq+gtCwRIxrG
	3PBz4pGnJQVny2intnsV5IwuRnD+IVqFtY54Y9yPAbqDo2iLtg8kHpyGWBE08gwqGImaFLml7Wr
	oJFguBWklHRyRq9jsgd+OvhofOHbVVimCKujzl3Lsqp3h1Ylv6wvwA8I1RITvDHsX7h5Wik9tnD
	aghTF7dzvk6w2erEWnYz2z0j1g+oirsYCd5Ju9ybv6t1Tp1KqP6sT1uuIfr+8zRhCWJkUHHDPjT
	h/Z2/iaQVb/cLd2aC3g==
X-Google-Smtp-Source: AGHT+IHtcarjAgHfDnsF7BJzJOfGVHHFEjlDGmVgauCM16dSlRLv3YSQXAkkZiYbeEuQgoGYCDJB1Q==
X-Received: by 2002:a05:6122:3309:b0:524:2fe2:46ba with SMTP id 71dfb90a1353d-52dbcecf382mr21185064e0c.11.1747908075171;
        Thu, 22 May 2025 03:01:15 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dba94827fsm11544431e0c.20.2025.05.22.03.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 03:01:14 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-52eec011ff2so1431442e0c.1;
        Thu, 22 May 2025 03:01:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW7TCSGG57dOYh23iCEBXJqzaIAeO/icXtrr8E9enL7QiUgcgrBCtMKXVaNEz+Ew6zi60FVBRfiHEgd0oWA@vger.kernel.org, AJvYcCX+K/e11CPodnFfUPrG95727Rgoyz8LgCSWA/RSLIaB3rKBOFD1E94RSeIMu4dBmvrvtUTKaWwlBuPb@vger.kernel.org, AJvYcCXVi1OauDFJEJqEEVWSKkSy02qI4yDst6OjhNjniW82k251VhBTtJipYKoc+RGNAV/T+Hm+83jGrC5zOfppybr5wEg=@vger.kernel.org
X-Received: by 2002:a05:6102:54a2:b0:4dd:b75f:2e82 with SMTP id
 ada2fe7eead31-4e049ea35b3mr19767557137.15.1747908069410; Thu, 22 May 2025
 03:01:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514101528.41663-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250514101528.41663-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250514101528.41663-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 May 2025 12:00:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX12tcPxA+E6QHe9ADfrFfJqh5vn=V1O4ynpj0Mhoaqew@mail.gmail.com>
X-Gm-Features: AX0GCFv7-uDaI14mB4J_JekQl9NFA4vtfAOgEecOtQtR_Y2SRZ05AZRMtUjDR8c
Message-ID: <CAMuHMdX12tcPxA+E6QHe9ADfrFfJqh5vn=V1O4ynpj0Mhoaqew@mail.gmail.com>
Subject: Re: [PATCH 04/10] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable
 OSTM timers on RZ/V2N EVK
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
> Enable OSTM0-OSTM7 instances in the RZ/V2N EVK device tree so that all
> eight OSTM general timers are active and available.
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

