Return-Path: <linux-renesas-soc+bounces-19316-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C90CAFB2AF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 13:54:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0C233B6651
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 11:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980D0294A0A;
	Mon,  7 Jul 2025 11:54:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E106329A9CD;
	Mon,  7 Jul 2025 11:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751889259; cv=none; b=IPBtCoosZOGsJa8Y3+evAlNm/K3B42Inrtq3MFJk+uecciypoZLaSG7G+aCoPaBFvgm69wWL4Y0fRS4z0NRmJg1t/dB3oRYLHxT4C16diC/sgSO28V5UNk+5qgnbJKCNFrEzbU4qLJflNaHG0uWkDPTkxVUkpfwgTpuEe9+7yDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751889259; c=relaxed/simple;
	bh=39LPr17ACdwb6Fx3Y2TKqi/hC45TY5NRU9P5grwB8oU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C4Ohd6kVI7e5bVVM3bNy3LVwymrcEK4YdHICuSBCmO5Y8aX+1QCyv+wgC0hjeR9hqx07T9/sUE2/mJo8jJR31+PVu8CO6K1IZcAfB76kg/fwpyc/bM1OZBhsRT0rxI2FJlb8txXk1SG9H6ZcFEbmIcfQv5bEoEPCTltcbxOr6Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-528ce9731dbso877036e0c.0;
        Mon, 07 Jul 2025 04:54:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751889255; x=1752494055;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6bj8LVd3iBj6tYM9itj7dth7Drbx2NZZmmY2Uq/QUDk=;
        b=h8UqsmSD+PiJAILzjXyBdFm6rSlgk8hn0pf0/EW4YmbuHTNElD0zEDjB34osjUHHWv
         N4Sk9tjHTIDUwNIZKzTO2X6ZPC/Ut6WjRaaDkwJGBf/a9LJJRxZHK21ZFxaSc4+2bH/8
         xoN5fynY5uyXq9AEHxZKdbayYs61wjYQq4uIRqVh6VSQ3A+HkD+41lK9Ktz12D0cpBzC
         ucSksYmHfrfvZMqbgWDyFXcK5/jax9GquBxiwIDOiimWIaBHFGMigBZPC57U3F+OgeXV
         XVFOEapAx6BIzv/x67hXfPyX9fokrwesfAcrpG9+PgH/tgrg2QIEm+KUxzA1+TwOpfQI
         B90A==
X-Forwarded-Encrypted: i=1; AJvYcCU4pQZ3aYF5zitn4rdMtO9maBrC6jS5N9lbUaUqNJ+JGJ+lGsEaAvu5hROCtgmH9D8ZGLtzsDWVOzCHBNS4@vger.kernel.org, AJvYcCUJcFlik5KJj2gpl6JcP/FK18XmdUpSQqzyM931pvVpk20uwd/4pBVbZnAyF+t5xSAxGvrO1uvJn/KyskdIQqxmfe4=@vger.kernel.org, AJvYcCW2ZMrKnp7pfXyEumWf3JWTEZ46Ztl7fvLnLrTjrgrGR3DHppaD9g5WF3LOyd90gzJJwU6Vppj7gTo6@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhy22C8FNwGeEZqJ/fG0cFVh0AgPpdIrAcGs0SmDA2aPXB5lWV
	tUqyJccE2w39OQNlmdbhQDMiTvrzH+Fm6tvY+ueBV+QCNUSOdHSiEb29aHgb+hpq
X-Gm-Gg: ASbGncsECFxVUuQb+sw0neqI/pvf1oB7h2SeC70L0kTYJ5mHu7CvYn0emnB0O0ztpF3
	vRE/W0h3GOnIQUsklSgpD5SaLdqoxwokC/bDxucvcf3D1izHPDgMbzWcMs2UVxLgBXCJoVMy/1U
	ff4H/IqNvFeV7IYvJ8KSzGRnZILwl+oENj1KZTBCe6r+32WnGTMJQ31Je0/fLDTaWL2DAmVFS8C
	tBvLGyVcgPaa2MifJLVzpWZXNxA1SpvsZIem/16nSf/+HMVcvqlzO4kmk+uQRWcN7AM57XRr6/1
	bsh4F2GDB6VsF3BxHf1pYWlX4lrO4lf+HzGYhNod5W73Gnv5f5S2cQVK0qOK3V9X51d/+qTwBdA
	kSESGHK66l2k3ZrgoswUiwK8d
X-Google-Smtp-Source: AGHT+IF0HuV3PO1U7Kz3uINWqCpkPthljRJ0u7e5FSuLiurgVOnVndBbC5EcSmtv6rujSxyeHJ01eQ==
X-Received: by 2002:a05:6122:8c4:b0:530:72da:d13d with SMTP id 71dfb90a1353d-5347e3c228emr5901688e0c.1.1751889255439;
        Mon, 07 Jul 2025 04:54:15 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-534889ac18fsm930091e0c.27.2025.07.07.04.54.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 04:54:15 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-8815049d0a8so958235241.2;
        Mon, 07 Jul 2025 04:54:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUKBaadtt8AzlaavUD6GQHYNNKx9eNyWLoaY80aYRfQR/vdZ7dfuSbRbxLvhzXs6XNqz35hUYbQ8bNR0n8t@vger.kernel.org, AJvYcCVlgeU04ftXXPI71koI5fGSbxB22jzzfd2mSKaDw0kWbwE8KeSKJ/RkOwAW8YmpXQrGpSold7cfNH8VGPCwUwfHlAU=@vger.kernel.org, AJvYcCWQWtu1z0f6V4HzLCxLu7TUYhtSm2C6pi+G/U+EtV0IIRvz+gHRLxjYGxNH31JgfFoM9A+wHmkv4giD@vger.kernel.org
X-Received: by 2002:a05:6102:41a5:b0:4e2:df8d:dfeb with SMTP id
 ada2fe7eead31-4f2f1df683fmr6581192137.6.1751889254860; Mon, 07 Jul 2025
 04:54:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703235544.715433-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250703235544.715433-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250703235544.715433-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Jul 2025 13:54:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVqmD71zvTedO8r1v=gcLf2QQhQiy3KZ6pixM+7j1GLWg@mail.gmail.com>
X-Gm-Features: Ac12FXx0WFuBdOBxsv57dnaFzBp3glsE_LVd5RaXXGHg3gLnq4Slk6zkIRwEGC0
Message-ID: <CAMuHMdVqmD71zvTedO8r1v=gcLf2QQhQiy3KZ6pixM+7j1GLWg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Fix
 pinctrl node name for GBETH1
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Jul 2025 at 01:55, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Rename the GBETH1 pinctrl node from "eth0" to "eth1" to avoid duplicate
> node names in the DT and correctly reflect the label "eth1_pins".
>
> Fixes: f111192baa80 ("arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable GBETH")
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

