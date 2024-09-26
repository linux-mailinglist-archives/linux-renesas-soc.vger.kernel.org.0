Return-Path: <linux-renesas-soc+bounces-9084-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB9D98737E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 14:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9CC08B27390
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 12:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20AB176ADF;
	Thu, 26 Sep 2024 12:22:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E4915B12B;
	Thu, 26 Sep 2024 12:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727353377; cv=none; b=QuKUnx467RjQChNdayBuN+8uva2i6/T0DJSs66GhrP2hGgsUHqjY9KfcBAXa9/VrPbVUfWOtJdNnB0RjJIMiR4LiGtUVw6ZM9fjIqUomplcuQXWnH26+CMlM5DNm/nJ5b8P4euaNrdhRxzwz/mvLsxtW+k7tN+6ubHj6OVVk1LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727353377; c=relaxed/simple;
	bh=FRBHS3eA6vMf1ONau73XJAMrgf/J5XZIaSJid7WyyuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EinrNHtTeekdb5y3nGcv3UYrgmhLkbMcypzXAOGNhpGN1Qvv+/y4PDfQDS/xqYDmdeALlT1mDdwQI8XA4bCER3eWSr+wvKTbWklViBOx3oEYZ/9X3kXfMwrz5rdUDiMNSxYxFbyYUa67lSj/EK275VVIyU0J06x5biZ82uGwf7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6dbc9a60480so7950387b3.0;
        Thu, 26 Sep 2024 05:22:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727353375; x=1727958175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pyksc3XbXUVJhwvdP3fx8GDOf5XqaOr4Iz31sAbeiSg=;
        b=f23KzBhSLPaQk6hYK8ocOq/Doz2k3xfJ/bgu0TCWa4fk2OCiBG6Rb/r6VyE5yO/MLx
         xMnoSMRX8kBFjTxE+QbiqjsxLcJDPL7fp2ykxTnoHvp7PGFa6GdffxNYLdWAZHtyz98p
         IKtiNxRIA3mG9sqzCxdDzRHdbyKOjnud+Bf517/vVJyhTN0Zl61nJfI7GKWv20FEC84E
         Lkb1M3Muoxdq2dguPA74orfu+We8ynU+3N7JaV3Ge+MuD5Mv1gm4VQlyTSadZOzk5lmv
         YygDDtoB1yjG9y+goXFEThOgopRoSJTLr5CQqI/FXLTQLYMF0qwIsGHg8cj1tV4JYNEx
         RS1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXduWPFD8QqxpLu6RZ1PhBCK4LaEmwNJsnc+xfv5pvdq9tVZJj/DDma9AHVRAnpdR50NTwX/S8GIm4u@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3ffmu49l7mTMab0bs7emSoe3+hx4hkI72sMM5QymocY3nyc8d
	8K1hOMf9WH+vuL5rhq+veGYYR2h33Vks7scKn3thseYxWvxrAjZ/3JmlBk1i
X-Google-Smtp-Source: AGHT+IFfe1vNuwQNxTjXGHIFPqg+8dBsRDvMvztsfSm+HOM2TYNf4uO4ti9mO8n2g+mAUSfcAD1HPA==
X-Received: by 2002:a05:690c:fd1:b0:6e2:937:8ec9 with SMTP id 00721157ae682-6e21d6c7260mr59687287b3.7.1727353374674;
        Thu, 26 Sep 2024 05:22:54 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e20d04a335sm9471027b3.47.2024.09.26.05.22.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 05:22:54 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6ddceaaa9ddso8514027b3.1;
        Thu, 26 Sep 2024 05:22:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU1iEog/U2C0BXTLnh3As1f8tSIAHtP7a0Zz7xX+yR6ikUBMeYIoH/xPQZaztfKe9rhfucRsLIqcyq1@vger.kernel.org
X-Received: by 2002:a05:690c:6511:b0:6e2:50a:f43b with SMTP id
 00721157ae682-6e2284c3d72mr38609867b3.35.1727353374139; Thu, 26 Sep 2024
 05:22:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240921114813.4124-7-wsa+renesas@sang-engineering.com> <20240921114813.4124-10-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240921114813.4124-10-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Sep 2024 14:22:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUOOY5RAptTkKgPc7=+ArYNFC6wu3h+xjJ49HTu9QNsTw@mail.gmail.com>
Message-ID: <CAMuHMdUOOY5RAptTkKgPc7=+ArYNFC6wu3h+xjJ49HTu9QNsTw@mail.gmail.com>
Subject: Re: [PATCH 3/5] ARM: dts: renesas: genmai: sort nodes
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 21, 2024 at 1:48=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> To make future additions easier.
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

