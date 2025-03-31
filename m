Return-Path: <linux-renesas-soc+bounces-15196-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE24A76AF2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 17:43:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 398C13B413A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 15:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0CAB2206BF;
	Mon, 31 Mar 2025 15:19:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CF422156E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 15:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743434374; cv=none; b=h7qfu8ncvj+ChxQ3mRyCaknYW25ZMLu6HvVnBaJUpMh9u+f8IfBgsZgy0gCSP3EQi2Y5g1dLGk5tnZbog8GMVWBp2H7bUM5+z+qS8PD0/fMmtHk6AnRBoJT7Ohy5H6MpDtqdvva98iZTp6CVy94PMKVFUirHVh0MCMQPQHEBpg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743434374; c=relaxed/simple;
	bh=jVBfoh1SP/P3MKOXzSC/CJnBYLuNcw1LBiTL7tBJSoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WptT8bz+OaLIIjaf/FEsQCU2lQ0zGLY1Jznf5CPMvlncI4nSpDemoRreAmv7HfQ7TQZpO3j4Lm0Mud0/XTl7sivMYHLU1Ex3O3JeEAnOsswP4dY7pLANvjc8Br0jfwT8I0CvjUXoXSVDpDMR5JDZ+AddkcRxpVU/7yJhdkAObGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-86d377306ddso1755700241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 08:19:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743434370; x=1744039170;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TLTUL8dnYbcC9vuMzZOZiWpcNutzx+Sd9ECrfJLsgmQ=;
        b=rJjjqX2GFlSB/Ikyd03p0usmQnNonQo1Lh2dsEuUZztszMYRljuOmjBoADdX4JpcRL
         DLoT0MZz4zByoynHinJAR4GRYhASl2uqmRqowxPh7Ns5H6m8HCFAwYIcgDNYqO9SbOIV
         Wx/8MSxO5VC+jU7JYA4o3qcCQt84KPZFEL2FmG9fAUJdk/+sJ1Lv+awzpvbQpR0G30R9
         lt1zUJh0L1zqtSFd2BpRAgTOL8cJtVHUB3HIM2HvCdH3W28tCbaZLBqVyaBYTXs8cPOR
         cdZ1j3c39SgnoW0YBfJiyleEZ/18pABWRFt5xJXr1EfP6kSSsULzBgGbru/52jGTFf54
         V3qA==
X-Forwarded-Encrypted: i=1; AJvYcCULYwc09wSb59hzTdFLBVAmGK8vdZoY4uigC638OZ75eNkTjleM54HlFu26o6NoTX/8kAnYHozI5LOGG8NtEeyRFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxVcTDfwBcRj5BOHu0Lcs+gGXA1muT0vaPXTHHvg5djixEGdjW
	RHa+OkCIEIIXz9fHuRFdfGOzjHdqQYM+Rz1FtVhy/k/GPHyy0KJJDMVMN3rv
X-Gm-Gg: ASbGnctRPOrw25G5RWX5UsYcEJt71tTs/RCWHuG1y9O2TR0R/WenSZG86eMpyGYbUT3
	IdFBWaqF3ht3c4LxHU/yJ+chSjKQPTLALkzvwAV7IU1oL716hUU8XPdz48kOlyENqvB4lNn+I5H
	SLc9mAC9Lm2RpXlgtw/UjEhrbDWsu1XBkxUQp1sd22gsSXv0yoBJQOvIEGeyV62kniPpmwR6ZTC
	660zWa+XYks1+Kk6ANQURwI3dl5gzfyQFgbFkYvGPVK8Y9JjCAaIjU9GW7H4Sa/aWNjIdXSG+v5
	ODYEtMjdA9vNj/VZXqepOTlKuFqNmpqZReis8fMohls4DnTrBvw9Qq7yATQNt/u2PQWNTydlF2Z
	TuCR5U+k=
X-Google-Smtp-Source: AGHT+IHHek3fBC8eN7fYLvyTuKJmRD3joOZxLZmR9yMMssKKev8weJJr1JzGg06RO0ZVM/xDs7pTMw==
X-Received: by 2002:a05:6102:3f88:b0:4bb:eb4a:f9ec with SMTP id ada2fe7eead31-4c6d39af7cdmr5710624137.16.1743434369888;
        Mon, 31 Mar 2025 08:19:29 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-871a329bc3csm1575803241.19.2025.03.31.08.19.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 08:19:29 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-86d42f08135so1808821241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 08:19:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUMxLLw8NxSpfZI8GtoDIWw3EZHIk9fPEigZQwAiAerAa/+ACYfOwg5ymFGxc3OEVqz7PcMVUKtpp1i3hteIfytpA==@vger.kernel.org
X-Received: by 2002:a05:6102:3e12:b0:4bb:e5bf:9c7d with SMTP id
 ada2fe7eead31-4c6d39a7c99mr5291361137.17.1743434369042; Mon, 31 Mar 2025
 08:19:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327193318.344444-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250327193318.344444-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250327193318.344444-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Mar 2025 17:19:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUcrjNkJ=Ca9TM6snm7Jf7k9isQfrkEsrU7wSsXmBDeXg@mail.gmail.com>
X-Gm-Features: AQ5f1JoS7HBQ8YD2TqMX0jzLMmMovLGPzSbpazoqTSXVeGo5q-Bz116qCT7b2b4
Message-ID: <CAMuHMdUcrjNkJ=Ca9TM6snm7Jf7k9isQfrkEsrU7wSsXmBDeXg@mail.gmail.com>
Subject: Re: [PATCH RFC INTERNAL v2 3/4] arm: shmobile_defconfig: Drop
 individual Renesas SoC entries
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Mar 2025 at 20:33, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> ARCH_RENESAS is already enabled in shmobile_defconfig, which ensures that
> all ARM32 Renesas SoCs are enabled by default. As a result, explicitly
> listing individual Renesas SoC entries is redundant. Remove these entries
> to simplify the configuration.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

