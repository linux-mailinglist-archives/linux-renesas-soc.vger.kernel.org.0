Return-Path: <linux-renesas-soc+bounces-8486-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E41A29641EF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 12:34:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 510F5B2555F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 10:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B78D1AC44C;
	Thu, 29 Aug 2024 10:24:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5518B191F77;
	Thu, 29 Aug 2024 10:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724927091; cv=none; b=J4fEEvnYXy5gwhiGxc7Gys+snJbljN2avs8fozLYmka7sYMwW0U7+RlV4CiswskNdxqy/QbwdRI04/d6UqIi+RqdL4XV5rwjklRqULdWBI+vp/v3O2kp4DlLSbh7p5sR4NUnve+Xz/j9EWt3q5iQW/UiiirQN0SwVzvyvi3H9F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724927091; c=relaxed/simple;
	bh=CrZuEFjs0oh/loGv98oYdzcd9BgLu2m5MLcI7KM5rkg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iodCEwUmbBNi8oFyx68A6kqQkx8qNF+ybpJbrpne4alr2slbfogDWvBRSNl1WRRHS7+fMywLLyawEjTgk2OpTrPSmW55T1II5uaxOTDqEm4Z1cAcJTzfKWvVnFcPmQ+hIaCPa+2LbNF5G1DznM3BbjYbhj65zmi7c7YggMD3Gos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6b99988b6ceso5964667b3.0;
        Thu, 29 Aug 2024 03:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724927089; x=1725531889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pBVnO5vvxjVG4RJOP3x4LvFPwIHgsUoA5vb+xybuyJw=;
        b=G58FQGMX5hy0DlYUb8L/7p//FSeRn5UhIWcMYH6UusE1pMy/fCTTAUv9B+cx/M7Sy6
         u6KYo9vtKeE2Aoce+M/CGEhRHIFlwgJkrrb7hq9cSJqUUHybL/Dwia0e866fjY2DNjFl
         52LTO402qqo4UeHLV9GTLYDLqhDkfjwM//qFrZ5D85Pa19E8EIDUJmtHrSxnJIyiv4oV
         mp7mXoWJMytFtbtVeD7ZIpKESdNSOQGGkITR0ojSDgQnrNVnE7xUp/Dr37omwsq0Owsp
         gxpXDk2JD8WUQ6qiFP64lz8UmWWKthhy1/LgEszCo7rTuqwCx0K/90gvRuACh8PWTlNL
         5dHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4BtbAflkx8Jd4/KU825dwcRQ8uxmYEXCT87beLPBWO6ut5e+OzFhZb99q9Xozv/iJs53D/pTyNcTKvitF@vger.kernel.org, AJvYcCVj+hgs9KhsPkapQStSM535FvpdqUzoE4s1hgzZsL2SWaBgreidXfdWoa1QgX8piMZJqXKUjEkx2ptadzs6Z8BQXzE=@vger.kernel.org, AJvYcCWmXzs3YUf3sD6pjGrbVhdMg+8BmDundOJerQ+Zq2VPwnoTw+cfiPUbfk43mFro+sfML0s7Fh3lP/nm@vger.kernel.org
X-Gm-Message-State: AOJu0YwzMNx3YArAkB1UB+lMt2lf7vWoERGT3UoiYMcgByhSmI0WqfJC
	hD5hqI1Hw8XFqSW90vNmP3rluMBEN8yKfIe1Lf0xsUHmxSWIfw2pS61PcttY
X-Google-Smtp-Source: AGHT+IFTRsgRubtqJUAYejSeX6BOcxx2HYBlN50lfF0VPE/2Ofx/jQgoM1k9FpNjhSe89g3RLZHGGw==
X-Received: by 2002:a05:690c:10c:b0:62c:e9f8:8228 with SMTP id 00721157ae682-6d2769e21fdmr20539127b3.25.1724927088581;
        Thu, 29 Aug 2024 03:24:48 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2d4485725sm1842607b3.74.2024.08.29.03.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 03:24:47 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6b99988b6ceso5964347b3.0;
        Thu, 29 Aug 2024 03:24:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUwa5l07QrrwA34Nlh+LzEUtwjlrxr4RWNzTXA4aIsDVdTpaKOwSyYC/J1hEZCnH5qma2Ssq8poXP0DwTcG@vger.kernel.org, AJvYcCVVj0nCTQs0iV9ZMXM40DKVXF9MrJ+faFlCa+29hZt8kp4peiDS4fcE3EDNjlm1UONgMbdI1Knb6g3s@vger.kernel.org, AJvYcCWJ5zAyf0X14VchhK7hyOJD/iGSZ5bw4nkNrUrz9L4+/fh+kL34fHEWAFib67eHTH34F3TFxpbJG5L1Jdc6vKuKDfQ=@vger.kernel.org
X-Received: by 2002:a05:690c:f8c:b0:64b:2665:f92c with SMTP id
 00721157ae682-6d275d3e359mr27822147b3.8.1724927086853; Thu, 29 Aug 2024
 03:24:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828124134.188864-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240828124134.188864-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240828124134.188864-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Aug 2024 12:24:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUNGBYCsxK60eTF7wSWS2LtAwOPO2-PvD_OMHx8dC8r9Q@mail.gmail.com>
Message-ID: <CAMuHMdUNGBYCsxK60eTF7wSWS2LtAwOPO2-PvD_OMHx8dC8r9Q@mail.gmail.com>
Subject: Re: [PATCH v4 5/9] arm64: dts: renesas: r9a09g057: Add RIIC0-RIIC8 nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 2:41=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add RIIC0-RIIC8 nodes to RZ/V2H(P) ("R9A09G057") SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4
> - Used hexadecimal values for clocks and resets
> - Sorted nodes based on nodes index

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.12.

> --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> @@ -201,6 +201,195 @@ ostm7: timer@12c03000 {
>                         status =3D "disabled";
>                 };
>
> +               i2c0: i2c@14400400 {

[...]

I'll move all of this below the scif node while applying.

>                 scif: serial@11c01400 {
>                         compatible =3D "renesas,scif-r9a09g057";
>                         reg =3D <0 0x11c01400 0 0x400>;

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

