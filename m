Return-Path: <linux-renesas-soc+bounces-22829-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50146BC93BD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Oct 2025 15:17:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 083953B6C57
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Oct 2025 13:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D041633086;
	Thu,  9 Oct 2025 13:17:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C6D2494D8
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Oct 2025 13:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760015862; cv=none; b=cWi4p3Dr9/VevXLqDMeew1gDlzrWxEN08KhmwliSjhAvtKmTi39yxguhrXZKJXRTT2xvmqwlp3MiECoe1L4PNFrqNALji4AvgFJMRg6XDEe1Ur5RsOfW3sVzFlgWrtfvPjaB4Zc230g1mzeI05ANbrRnwJqBQMZLe67HfSFLJ7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760015862; c=relaxed/simple;
	bh=Ltmobvy1f84KfY6EIOg6LAsOL7fbdFI22vqu7qYDFx0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jd+ziB9bh5p/XFL5U3DtNOBuWW9bGjR8Sow5VbWoPr6Uta5351lSzbGty0tY/p0HvUUEOrtJrbgIX2zNCKijzy9eBnN8B+ybvVV7BHycynr19DNSvaXwkx1i5fC7SREXRRQXHzkfqBP7XGU6IAIqCAvLyywF55YvxD+9GD4uJwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-8e936be1359so540801241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Oct 2025 06:17:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760015860; x=1760620660;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cZDDJZzAoOLlZiieGR0CA2H6w2gRSUvJq4uwBr2r9KY=;
        b=HXOs07Se4DJWD/jM4KDVgvfEqlgbquMi24pgTr3mTzfYU7Axb9gO5ysXWZFlsECLpF
         qAWdMDApNgqw1BzblyCnKeEa86Rf3USi0IkYlbD9FZz8NOpOI9BLAcHTnlYTPTtsN99S
         S69NFQAngmslLPUJIEe5DD5APlrPNv+bG72CWX//Lk/JXYWkIzpt5Zjj3x53bHgSkVJN
         Im04LA7dlJ02d5k0ZyIFFCOfJNer8cn4Tv19xagtt+i8iyt3ysDdHXdjrH8AhhNNZvmV
         dsDmzp3jP1xmxhE/PgXqnnPxqLKPNEIvqEHxAxC3y53BYeDpC3dHTbHQlNmthkZ/DtgS
         9Y6w==
X-Forwarded-Encrypted: i=1; AJvYcCX+8w5pRo9/+dBzEOSrclC6qX/D92S+6ZVqItwBbIfZ84R05X6HdgpJsE6vIAaq8WU/+LFNk16MupsbgpzQvqh8oQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7DeUXEsLtwZ7rwMq9g1qH3YeGoCPoiWi0602544nV+mUZvE2K
	CRlCVomphbsOP1LjyVwpzMAtJkqjkOv+LfuTK8iKwBXgM1ear+uW/zTgBVfW63jk
X-Gm-Gg: ASbGncuODBZBDYgznYqBFKRTOQGD7TanTXGpgccSoYW2afEj1PMule617jl9psU1CT8
	xAbjiH7zrtOzc+j8oFAapqhj8ko2JqNSeL+WBXfWqOPx00yvZagZwdtCD+5vipJsIBWMM8p/Mq4
	3TTl6eot6eGeiC6sgWFeifZskXLpHoW+TA8ixl2z4y4hWqn07z7DoTOoFsHF1beKtQpTt+VrAdB
	U343OdQRSdQREtOYTmBwFii7nzH2Les/vtXDq97mhMH/x1rXWOX4EJxUPemXbAodaT0b2aQ0u2s
	mrIipmaGs+zvgXcC2CSjRZ9saMD/EcFmeY031wvkJvIZAJ/FzxHi+EkJsryO02OEx6yroOB7sZI
	Pv3rMOvRONzWe/5FgMj/VHc+jlb20HpHHroOG8ps2E810rcSeET8wphKiSMHii24VAwhcuxorez
	hACqYzKCMf
X-Google-Smtp-Source: AGHT+IHVACvui49z5aA0xk5KbkF21MmWMiwNWQVf/pfMaXpnoeXZ9xZ1NPSbe5e64ArWOOD2iW3GXQ==
X-Received: by 2002:a05:6102:6c3:b0:5d5:f6ae:38f2 with SMTP id ada2fe7eead31-5d5f6ae3eddmr617478137.41.1760015859846;
        Thu, 09 Oct 2025 06:17:39 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5d39fb8e2sm2350794137.16.2025.10.09.06.17.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 06:17:39 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5c7fda918feso1144352137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Oct 2025 06:17:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX1EPxWF7JTcHrnrZFpwYVscFm2uZN+MrwWD9JuQX7FleWO0A/altUHwou8LMEWvP6NuVhUMRsQxVcTialfhPdxXA==@vger.kernel.org
X-Received: by 2002:a05:6102:290f:b0:5d5:f6ae:38f4 with SMTP id
 ada2fe7eead31-5d5f6ae3ec7mr514763137.43.1760015859180; Thu, 09 Oct 2025
 06:17:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007121508.1595889-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251007121508.1595889-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251007121508.1595889-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Oct 2025 15:17:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXTvANxZr5wYD2EG7WGkkqGw5B5O-3=bVuRv3ToE2mvkw@mail.gmail.com>
X-Gm-Features: AS18NWAFS_XUFRrNgdqk12yyHdAEMQhOLAy2yQ8EvwK3P_MM9bEB4ZpzZb7CSuA
Message-ID: <CAMuHMdXTvANxZr5wYD2EG7WGkkqGw5B5O-3=bVuRv3ToE2mvkw@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: renesas: r9a09g056: Add Cortex-A55 PMU node
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Oct 2025 at 14:15, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable the performance monitor unit for the Cortex-A55 cores on the
> RZ/V2N (R9A09G056) SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

