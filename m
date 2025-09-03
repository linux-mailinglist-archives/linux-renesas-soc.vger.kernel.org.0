Return-Path: <linux-renesas-soc+bounces-21279-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C14BCB42261
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 15:47:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B533B4E4FBB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 13:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D440F30BF74;
	Wed,  3 Sep 2025 13:47:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC7F30ACEA;
	Wed,  3 Sep 2025 13:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756907267; cv=none; b=FjSPsRjatrb1aY9pT4DDpx1kNW3fRnmB1XRfU68+/sTgO/XW6uOjyGvWb/UpKbpjKFziopW6LJsM8ocoIvG/1Uxez4KI4Wn3+ZwMMf4UgAvdDHENlKV8xTX8iRAAyZegSn5csiob+XJY2q6Z0tuRPPIzDr9uamJo1XO8ovdnMoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756907267; c=relaxed/simple;
	bh=+aIEvRz96pG/rWgZPTWZU8F4KJkk2PAPAif7c1zrzKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ik1qM52jVoAVa3rGFA6Faz5QDJQ4dhbl6f9UdntjBQv9q+s2+bUGo/QiLTEtTjs33AQnY3ol2Y52mAE/w8ykul0nKbSk65fkKoApSvThFrcdAw6aVCEoWtfazZFgnGCUIsz8YwzaksbUL21ZQ5+PBoZUNSTBspb8MpAHYdvez0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-544bac3caf2so660333e0c.0;
        Wed, 03 Sep 2025 06:47:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756907264; x=1757512064;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c1BtAlNfdBNrmtyMejkFRvl8J4TdOP8bGgfOa98i5TY=;
        b=AGM787fHBCxHTxXRhra3HE5kuuGfWYt+sVUtYoz6zIcRi51Zv3THYBDq3fHs36dg32
         DkLg/NiO5KOyXCDIu8PQFVwzhMYe1UOfDu86xTRjEdqo3rWgVvKZGxQiVDPJmPEhozlf
         22Ahw7MfIiO6oZP6Bvfw0B0pMDi0bfyR1rvf5I1JBrVMEmUBG2KwWXa0V3LMcRAEQzL8
         My6EUgZLV9GS1DZ15OfVRhdViQTW6adLOYFEdQ0T/j+dL41J23sYRehkew4u3lROxnL/
         KNtIb5nm0GZReGxNwJYgOrpIPbUVfy4e73f8fSFj9CzBOSZGi3cLsanMOfjIqekFQXLy
         Aaiw==
X-Forwarded-Encrypted: i=1; AJvYcCUa8aFvKzTwiouZ4/w6BbaKbgpvLhIbQUhT8dMgFNTPsHTC1LOLs9Nu1m2fZPgDJsl08YgUbR8nwDzSQKUceWNKE78=@vger.kernel.org, AJvYcCVctnEypXZfDtJE33pzwVW45TS/+9uMzQAkRDWSLvLmzYcXqBCZaFn3omdJazxo/JppP0dgWnCz4gY+u2hm@vger.kernel.org, AJvYcCXiMJY5DFfY9qrlTmnvv+CPXWLRJubvzik71Nwr36QtIQuHeFsm9NkFbU9AthWpP+F4fU+xqmJIM+lJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzO5NOyki5XpE2Dk5w1WEKy6THA/BU+Ct4duu3MOqJAvexdRzEA
	LvYGLKscf/12tR8YmrYhAT2rUzK3haRCh01gFnyR2yrwiHbvvQ+7tM8+wEnEZgK7
X-Gm-Gg: ASbGnctjX08MnBLbpReYrAcr0YviICV2oaU1sR15k+bqIxE4JJbxGN4kBT5slbC6xt1
	zG4Q8O8EIHVrzpLGyLZ8lzqUQuOfdb5DTfGZMLmgRBprxk4vJTdRhp1iasH4RdFihqCivQGYP3o
	leGVYIHE/7+mH5stypOtu1tJFHJ6trWw4dGCId9McYLhI0+YIyjMrXKnwsI8JU6yj3kns/L0Voy
	w+1PN6VJE+vq2IRlujqDW5H9pH+Oa0ENqB/QjhXsHDEdVo2psRYd3buTd/K9kQBbLLhF60vphZd
	HORlQsy0Uw1Wk50SoxGexYRiSatvXEAq1L+/QBkdyAkRpErXPzqUD/s/vRamzuJtJmu48fFmSMr
	a6zlsi9Z+xw+1e+zr3ikwLIa8vFz+LTGGxqdjgbOX/Wmkt3124/pGAhA+qssv
X-Google-Smtp-Source: AGHT+IG+skzSwblB/onKuoHMB3txsR2536BKMAlUXQzjtsNdZJMdE1paQsqe+m8znqBub/SRMfm9CA==
X-Received: by 2002:a05:6122:3b08:b0:539:237c:f95d with SMTP id 71dfb90a1353d-5449e5efd11mr5126398e0c.0.1756907264571;
        Wed, 03 Sep 2025 06:47:44 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-544912c7cbcsm6947701e0c.2.2025.09.03.06.47.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 06:47:44 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-528d157a48cso531126137.0;
        Wed, 03 Sep 2025 06:47:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUkS4OGH7YVkYmNcJBKPcVLmsB0e+FBoiDmPNSal5axqUt/MTVNApnSKYRi+/XmkMZPolD5bV3IgGnKSZX0@vger.kernel.org, AJvYcCV7Cf4SJAmNz6ClN7H78bfddiga+fEBphys1KNc10Iy3vrZ1sajfbuYuM2mVuxEy+XN+OIIXuBAyyaQrBFl3qwCpFQ=@vger.kernel.org, AJvYcCVOGYaV+ivCon+Nbl/g5D19VWRvmIxL0xNKa89cXoydWogCgAoTI/Et0B6wYzW3DCSCwnX+A91n4uFk@vger.kernel.org
X-Received: by 2002:a05:6102:6213:20b0:4fb:fbdb:283c with SMTP id
 ada2fe7eead31-52aedbfdacemr5177326137.13.1756907263484; Wed, 03 Sep 2025
 06:47:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821161946.1096033-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250821161946.1096033-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250821161946.1096033-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Sep 2025 15:47:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWC8LMvihq-t=+YEfaUNJyfUK0NXsr+rCe1W7Os6ymQdA@mail.gmail.com>
X-Gm-Features: Ac12FXxUHRqb268-w_80icrYBatNkcf2nXjOZMLs8qj1YY0RroAd_gw6UC6VZBw
Message-ID: <CAMuHMdWC8LMvihq-t=+YEfaUNJyfUK0NXsr+rCe1W7Os6ymQdA@mail.gmail.com>
Subject: Re: [PATCH 1/6] arm64: dts: renesas: r9a09g077: Add WDT nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Thu, 21 Aug 2025 at 18:19, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add WDT0-5 nodes to RZ/T2H (R9A09G077) SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

