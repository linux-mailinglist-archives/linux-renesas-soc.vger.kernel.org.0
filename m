Return-Path: <linux-renesas-soc+bounces-14132-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 825C0A562A7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Mar 2025 09:37:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F5613AEFDB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Mar 2025 08:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E4AC1E1DE4;
	Fri,  7 Mar 2025 08:37:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBE61DF990
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Mar 2025 08:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741336642; cv=none; b=ar7DPYyNBYsPi5VEw7baKtf8wMGoG5tw6E7oBBL4phb5DclHVgXEPcmioaCa0pF1EGW/V9LPPgwT3upOymq6oQJRZXbSfMzMvZhvucDn4svcmvM44csuNDm9eE/dTjEZ3kM/tP7QNFE1y/L3jj/SIwNDAv95SrMkwhmu8j36kYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741336642; c=relaxed/simple;
	bh=wozOb12B6nsqr7duCI9EmjW1x8txwnegL2T+DuCKdmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B67Jg4aLkFpz2ka3qwrk7Zbf/+PlNA8CB6mwTcJWFZBEcGL0j2Cxzg9xqkpFQOvZnhJI9Nvu5hx0PhBMISudpETWgXViCQncG1KQvLTwpzhZG5jL/p+HMYhLTMQSwK15VK+2q6euWB6aL1/cljMIJjNKt1Ax/JA6K+ahpzY2LhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5239b9120f9so1498432e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Mar 2025 00:37:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741336639; x=1741941439;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T01ZZrOM2KMF/6XjxwGMeXsKpEWIOsZ2ycC2d0IdIqk=;
        b=ww9GgBx6oy4p/kAZsLukOKmdUy4fjTZG+PhHJeokltm2YKjsDqxjWJF9GeinZffkTG
         fhWOaU/+vIFHMUjNEoBnchMI02Vg/Pg+aTBlVgfXyTsdgT5L/aASRN0XOZf2SjAq5jFd
         Tb2aRDKGW+r+7YY8QIkJZJIJs8O9Vmar8Q4mhOKoXFBQAUKxavPwgLwQvNjG9ENR0a2r
         n3D2vec8lE5DJ9HZmzQXlzUR4SenG8AEMIXaKOjDQyFYsA+8M1nY15VbKroqqcCq2lDL
         3hRNRS6DXcIJi6qVxDmFDJNNuTCNP0dwTP+ail2d3f+32l6KGeKk4YjYgfOoL5R2wYlY
         PMOw==
X-Forwarded-Encrypted: i=1; AJvYcCWGbtnTcwaJewAdU6U40qQFu8cs1OUQUVK+y28sUxV3HO+N78xZG3XtQ1Kq//jCMCeIH/jcx1mFKWczdQM8xm5liw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7Q/G6eNyp3sq3G330j5Nxwz3dE3E3noY/R0O5T2DDYfndogWZ
	Bpk/8IXKaYIWmK+yrWBWLK4HQlF+eHKl80u0iwsqkpXj9Pnhu5GWc4A0csAR5VQ=
X-Gm-Gg: ASbGncvf9LvM2Y8a6cjz6mYAKHyE8TmZkIs9dHBTi3SAhdkSzZi7ksNMPt+UfW3Z1w0
	JihnOjCoyWiDzdfd5JRA8IOIvL9JcxM8qp1/EeFci1nzm3MVokFdQuRbS92YD+rKL/oxAZ9hyHE
	T6a/rzVji9VS8XZK4j1XucJToMwjEM4T294m22zAGj5mC3Fcn4SNRpw6C5BdX3pN8RcrNC8r5Fc
	PNYDT6HaiCcsCuiJUWSFdj1keExteuiao3w/Ozh4TBGuXwuGevT4oQfSONIj6QWb/JlEy+rSlq6
	Yb8GrG0VrWvaAkfgvSt12Zco0RSz/r+TYu/ucmFGCJQkzvU6RRCqU2Q64L1F58fI1oneFnGcmr/
	WcQbW0Ik=
X-Google-Smtp-Source: AGHT+IHCDYg2ctXaZzFYEXP1ubd3oDb/a4xlDncOlo4jBNXDLjMJygr0JUXgjGatPyntG4vKiAhWVQ==
X-Received: by 2002:a05:6122:c86:b0:516:1ab2:9955 with SMTP id 71dfb90a1353d-523e410223fmr2134204e0c.6.1741336638720;
        Fri, 07 Mar 2025 00:37:18 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-523d8ac1ec7sm452765e0c.11.2025.03.07.00.37.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 00:37:18 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86d3ac0fec0so857911241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Mar 2025 00:37:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWTmfmaiBiNxu2pUpsHhQP3WvqXZodGLdLmrxt1iKtcyY8YCQ2tTBJBWdzSIXz+z714Fx2lXQglSeaRgvxMf1iuEw==@vger.kernel.org
X-Received: by 2002:a05:6102:c0b:b0:4bb:d394:46d7 with SMTP id
 ada2fe7eead31-4c30a5a75bbmr1067727137.6.1741336638109; Fri, 07 Mar 2025
 00:37:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306170924.241257-1-biju.das.jz@bp.renesas.com> <20250306170924.241257-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250306170924.241257-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Mar 2025 09:37:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVcGD2xnzHHV8w9UGm2BqqANLG8SBR=2QRfpwVeRDn=tw@mail.gmail.com>
X-Gm-Features: AQ5f1JoTRGIeIM1mIcjyVDZeDN3EgC4aKHclOG4YdZVeM4Wf3q4z99iSXcaUNxM
Message-ID: <CAMuHMdVcGD2xnzHHV8w9UGm2BqqANLG8SBR=2QRfpwVeRDn=tw@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] memory: renesas-rpc-if: Move rpc-if reg definitions
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 6 Mar 2025 at 18:09, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Move rpc-if reg definitions to a header file for the preparation of adding
> support for RZ/G3E XSPI that has different register definitions.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/memory/renesas-rpc-if-regs.h

> +#define RPCIF_DRENR_CDB(o)     (u32)((((o) & 0x3) << 30))

scripts/checkpatch.pl says:
ERROR: Macros with complex values should be enclosed in parentheses

And indeed, you misplaced the cast, outside the (double) parentheses.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

