Return-Path: <linux-renesas-soc+bounces-12221-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EBFA15420
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jan 2025 17:21:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF7921883302
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jan 2025 16:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2433F18A6A7;
	Fri, 17 Jan 2025 16:21:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10880166F29;
	Fri, 17 Jan 2025 16:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737130897; cv=none; b=RZMU+Y+OT+d3coMzRrHkMDcEtEieBWfssZfni9GlB9JmMv7eeJZ+T+IJQoPVQb8YAWcpKiAuMchanFHF5norj50VkrXb1rvH/1FVYh/iYwkCNk6AyL8wnSSdNKH0XXn1CtyGnMKqC67a2EvYCEBZH8+mS3Gu0FGIOediq2FQS18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737130897; c=relaxed/simple;
	bh=QcMf2/93SjeqtTWxsVdsEveatMJChgUO49iLcM7Tong=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gv2iVzkPaTu73+FBLGLxgt1bdgoa2Wsty+lj90aIqjLwgleWcueGVaZXgb4LomlMjzEidMjP/MTccO+qCQplylhmBvFWrJZrr1LgYZWFzQ01nhtXP3g42ZyvisAeKTPsXoVaMqV5Rl/CAiSMJWNV6B4sdhQOQfUNMDHoGaE6BG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6dd01781b56so29182566d6.0;
        Fri, 17 Jan 2025 08:21:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737130893; x=1737735693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6HUKBsh4fYv85GvGebzgzdsaLQQWXJ7jsYA+e9ZidOw=;
        b=tGXoT5Nz1iNKtmvlQMbK/hwWuLys5u949AZ84qoLnZ4yz6x/JWgrQyWACIr73XYC6Z
         S1ic+gW2hXkS6QfOZTtcetcjh+PQfJsSgCb9WBmCWn9k1F9dtgmJw5iZtCxeTPSTLSOr
         ufI0EJh/r15CE/ed6SutYIt+Nuq3dhVOOg7sALUtubzFerP+pEJJJV3YZxT5bdlsJepW
         QjcoVT8z6nU+F/KfACHrCwj+H0chmz8SvKqM/XdtrkUmwlbBIeJsFJfS40gTC0PUl/Kl
         nXhuM2JASQziIBtlSnUNX4ik0aIm/kR1B6HKbishXereRc7sKKtzFq6Fl0IGQqPOwRYA
         fbVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBsFKKA9PhyvRNwT4e8ifxp5tj4/E9knnIY+AlAAUwtuzH/VHeD7HYQmHjPR7+V7DixhYSjLiUa/w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUHe/dnWvd+BIgMLsqmLQJ4/FPTQqPL73CNYqSsMELJyBsYihB
	0gqE9rV5ll043sWlRS6qKKjEwvpVtI2G2uUJ2mAX17WUCzjwTrJl07i+hjqN
X-Gm-Gg: ASbGncsLNWtf8QVq1ybJF16o/nPMI3lslyto7CDQQfg3EAdVUwr6QuHIDRMiIQ4Fe1M
	UGqgVpwmM3O+zt41pjkzxMhwdYp3C7pe72TAkwOw2JpyOIjSkJBwHkRjVoMff7HVh1MFgQMIh4H
	8moXEuf6YcTApZzbZJ7hBWfMWaMQlA1qTEQ/lCz1IHIPISFpnVujxqc8TSKHXg2s1Fu+rpeTJhD
	pc0kNJp+tisPWN/lomvU5xm37pzHFMvgL97DMLVuOEBfTdN8eMIO1N4cN5WMdfIkgZQeUU27PSF
	Zf2dPkNUfTANYx1cytnfcu0=
X-Google-Smtp-Source: AGHT+IH8PPU496zUhun1zSdyclDRqmOEnaWm2yhSoALFHofNYwStS9sK4QJLavE8mfCQ9OWnip00zw==
X-Received: by 2002:ad4:5def:0:b0:6d4:1a6e:d343 with SMTP id 6a1803df08f44-6e1b2181095mr68981346d6.23.1737130893656;
        Fri, 17 Jan 2025 08:21:33 -0800 (PST)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com. [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46e1030e4absm12864081cf.43.2025.01.17.08.21.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 08:21:33 -0800 (PST)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b9ad0e84e6so248907285a.0;
        Fri, 17 Jan 2025 08:21:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUtvqJaFvAbjiTM0uLn1y04WHD4GE5cU+kUvfcuvxXbwjB2O4xm82C30cu3FTTOicP5gzSsWHrU9qg=@vger.kernel.org
X-Received: by 2002:a05:620a:3947:b0:7b6:e47a:8e1d with SMTP id
 af79cd13be357-7be6320c40dmr489091785a.31.1737130893324; Fri, 17 Jan 2025
 08:21:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114183005.2761213-1-niklas.soderlund+renesas@ragnatech.se> <20250114183005.2761213-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250114183005.2761213-3-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Jan 2025 17:21:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWtvmaobRYgvgFSyPbdf_2wZgYW0pvr2VJuJYG6wN_ARA@mail.gmail.com>
X-Gm-Features: AbW1kvYmpNauoFytEfnwL0dSIxN628Bd1BeCEZ5CnNGdq_K61CGU1ceZZGWdjxQ
Message-ID: <CAMuHMdWtvmaobRYgvgFSyPbdf_2wZgYW0pvr2VJuJYG6wN_ARA@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: renesas: r8a779g0: Add ISP core clocks
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 7:30=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add the ISP core modules clock for Renesas R-Car V4H.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.15.

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

