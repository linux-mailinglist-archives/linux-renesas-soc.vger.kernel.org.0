Return-Path: <linux-renesas-soc+bounces-8136-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E05C795CB53
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 13:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 430CCB21367
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 11:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 586D0187336;
	Fri, 23 Aug 2024 11:24:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C661E89C;
	Fri, 23 Aug 2024 11:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724412256; cv=none; b=mzctsttSlxS0d88V85CYGOooln/b/HYhb8l5uuWG2Fjk6nWzkw7mDVNhXSe2Ey3E4XzkTgv7AYMvgobs5eK3k3KjprDc9U5GwfWGm7AuH2vcRp1bNjdb7Hy0sHvc6qM7ASR2dsAVfmR6Tlnoza78/yUOvL93xEXvJ46SY+/mOUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724412256; c=relaxed/simple;
	bh=Vyx/TlcmDNCHy0FXHrijGVUjSihnYDxjMgJaB2QEmhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iOezKp6MLAP0J9gTOD1IeRlYS1VfrjzPjwsFri5i4t7OcUdz6gFNIRjxbUGOE6D2UfOL5xqnTNBB1h9OQjqCU3r30GMTqxoq7PhMC89f2dH271lKuL+25bsNeHxLLVVEA/9kuMsTgTvmGBmsPtrVtIVKAAybPr8eCXN1mMrCLGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-691bb56eb65so16923317b3.0;
        Fri, 23 Aug 2024 04:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724412253; x=1725017053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dj5VovZ20bk+QpLNOLkrMw84voMi0CVYaIroeUtSYtE=;
        b=EWz2V1lUxfp//+jJ6s9CfhOt3EvHbG3aqGUlelvY4DP7qmbI0VBfRrxhzBo6iARGkp
         KPGu/lbaOQAiPD853WE1+ecaYQiqMCvM6Fh7+flT8StDu48EqfPTA8omrY/wVEViYjP3
         eLEpQF8C+q5L/OdRSAhTRhcUshVIobbesZp/8w27waVDxcO6cY8BaCzO/RoAurgngTPS
         4kKp3vmJ4ON0WC71fbfwXPYyIDRHEbsBVKVqkjACduWNCwY039IyQ3dMRMs7VREFnBfV
         jRuDfq/gdWZy2o4IV/2Kc6tH34eyTKopH9mDGu5nVepMuGGUyNXG6ZQgAvRFaPJ0Iq9y
         r9Ng==
X-Forwarded-Encrypted: i=1; AJvYcCV/bm3f3N7g7KL6qY4hGJeh8g+rAs0uyeNLEHDppdq8rB52zLgLXs/kJRA4TippAGmkL2XHc360eyqWVJjUhtQSZ00=@vger.kernel.org, AJvYcCXJETkj6xJm2wt7VRFk6PyMiX5at65ZREJF5pbRwF66re1ligDQ+TVQqNPaWVJn5o5eIT2x8lxz37Ii@vger.kernel.org, AJvYcCXsLNCpnBEH5MAnID9Krtc0o9HyNEavl43WV5Fa7f4pAp1A3OM4ORiM3sUhiTOJfaOikFYGahIxlV0nbLMQ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpm49/ahTQZLuxJYZCoMqP4P+C1jXb8k48/Foaa0gCQhMOUXQq
	KmFqtyFvYbgxjCIWmapx2vPoFAfrgRVP5mq4YLxykXAJr65cxTFygZKmjV+G
X-Google-Smtp-Source: AGHT+IGahmQMjaCOt34Do1O0gLmbCxGtXuqdtk1WktGE6WVeKMVzc7OdF94n4MLQ8x10lQiTlW2LzQ==
X-Received: by 2002:a05:690c:f94:b0:6ae:1e27:c993 with SMTP id 00721157ae682-6c625390575mr22003937b3.7.1724412252865;
        Fri, 23 Aug 2024 04:24:12 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39d3a9a93sm5142737b3.89.2024.08.23.04.24.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2024 04:24:12 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6b59a67ba12so18175217b3.1;
        Fri, 23 Aug 2024 04:24:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVN+NxRpppJsVKSUJn3GIw3ykYs++xHfQaKnxQSeqsbWesF7Vr4/9pn4gy5BokFxjQxeXntRm2o7WNRy+it3RCn9Ds=@vger.kernel.org, AJvYcCVWovh2PF5kD3AXeXlJMAoejdHz3AHamsHBmR2CH8RPbCqjm/OSoOnoc26XqM6oNVprmFG8TMzwLUsiMyo3@vger.kernel.org, AJvYcCVcL+1BZve9EREOI1GZiXiBeU6S3llN5jRo2QyobzBKYKTwPUbu83pzsmFfZHnvYst7ZmrHyZdO/f+2@vger.kernel.org
X-Received: by 2002:a05:690c:6611:b0:64b:7500:2e9 with SMTP id
 00721157ae682-6c6253900fdmr21154827b3.9.1724412252461; Fri, 23 Aug 2024
 04:24:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730122436.350013-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240730122436.350013-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Aug 2024 13:24:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWB+v7WCn3YqfPaShCHvPEcwu9vrXVugFpyc9vyMJZApg@mail.gmail.com>
Message-ID: <CAMuHMdWB+v7WCn3YqfPaShCHvPEcwu9vrXVugFpyc9vyMJZApg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] arm64: dts: renesas: Correct GICD and GICR sizes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Tue, Jul 30, 2024 at 2:26=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> This patch series aims to correct GICD and GICR sizes on RZ/G2L(LC),
> RZ/G2UL, RZ/V2L and RZ/G3S SoCs. These SoCs are equipped with GIC-600.
>
> GIC-600 supports MBI by default, so GICD size is set to 128kB.
> On RZ/G2UL and RZ/G3S SoC despite being single core the GICR size is set
> to 256kB as dumping the GICR_IIDR register shows it has two instances of
> GICR.
>
> v1->v2
> - Dropped changes for single core
> - Updated commit message

Thanks for your series!
I have to trust you on this, and will queue this series in
renesas-devel for v6.12, with s/kB/KiB/g.

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

