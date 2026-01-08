Return-Path: <linux-renesas-soc+bounces-26420-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B56F1D030BC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 14:32:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 92D2830F9C27
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 13:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AFBC3D300A;
	Thu,  8 Jan 2026 13:04:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA538399005
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 13:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767877462; cv=none; b=qo5mtKAOKE0TJWGYZgCHayTg35nLTammf3PpCGd5cBtvTvjlbeLr/+TMWDfRBFN2mzOfedWxJGZMMucjkadL0fFy3qMQgXtRaxpEzmYK6i+YrquBOtUpQdC4MOWzGEg7lcpyrlBQClSbajnvSXu5FXp46xquj1WiWg8l/NfFqqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767877462; c=relaxed/simple;
	bh=XZvwqS+jsAeIhALYdAWVKBMPWdSDj9aad1HrDxmlGGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gJs2x8MQcBQijJDh6qn99omzJLXUTRRkREx3aAPErTo6vPKSjxuBz8JvBjhOaFvFaeYxJDWGEfLCLhTGlzsYMu58WPWZLktbQkdkxWhoahV0l25f5cLlAuqsbKVpvNqzs0bvWaf5UkIdOg+h/jn7fddnCS1E8eaXMy4tXwePm+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-93f6bd3a8f4so951298241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 05:04:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767877459; x=1768482259;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SrO9zRt37GOdI5DNpGPAMnrfJ6NBOxJta+Tmw2fjNH8=;
        b=kEAtBk7Zd9Vk0f6xqk8jmebuqZTLa1NevcynXOBG/XcZ1HdHtq+D/4mqY7DT06Qvb7
         ARZyPkXmBpb4x6RBFYITDdx3IZ/MlTgEPseBXQLz6EyGbS7HzoNlggD9htnRPFzPEc7D
         C7x8i2XUuaSw9HJb2yz8kyABINdyGmh+8DHBNwDcf0ZSW9VrH68BdgnG9q6Jw4b99nk/
         DZ3+DgDx4qpxUpXhiMYDxLfq60m3bZft7IpUQsKlbDSpSjyZjr+4nbVEpLDO58xA85cP
         K6YMJTNhJIj5+IWhy+iQ0qI7MZeqq9xzJnhuqom05Ig5Wggu7Exw6pvNEGYAV458ep0D
         1Tpw==
X-Forwarded-Encrypted: i=1; AJvYcCUr3PPh5kyIWnfh4HfmT5Er3fTmwv3BaG2Ec9/SaaXPmo5/6kjxdLUAOiegoCvES50je2xr148KvX6TcC/6v+CMSg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9h3bwP+dQ1j/4asawX4hpfPmOF5BO6vrR5PzEQN2MlCn7xqCA
	oyGvDgB3zcfgqGgUvpxXkwTIIybJecw3d5bQrjRRard/h4rGRzpRJ0lxsRjbjugl
X-Gm-Gg: AY/fxX6675191OpoOetfBhDkwzDwWxSKAqtHU4AQEOb+zq26XNrvOmVj3GxTfOoGaAQ
	XqRdEoYsMS/x9+6iW0+z4eApmsm/StsQ+NocVQ67OEOuYIs10ve0CnBV3PqyXu1QavLP6D7l8mD
	Pgoj+n7qlUtrkPLpzuyEmS4fg8QsAzuP32EeMefnX9SkQqqql6y7hSpP+olgMQsrpK/QbfTKP0R
	k7wWp0j2EyuKmFwWh4hYPJF7L3E6KnIXGa9ijDmXEk/7u0TF6s/0cqOjzpH9sZ8WvNKzju+HsB8
	0Q7bvr178vzxTqXPYdnb6d3S+LlRK+lzNpywRpVSvoADTwtMhXrtkYEOotjJsXT55LI5+57IIA1
	AdFQeqZ806mIYC9LiFoi8PEWZQEYpE9epBupPdzjKW0eJynszgvBxmFHO1y/zKo2ISK1CaxRiqo
	g5pUYK2lGPK27sqKwMth+phrhTS7pQ6ESd0Orv5FepQx7RyAheQuts
X-Google-Smtp-Source: AGHT+IEYmOMkiFz7SuTDQfj4X7uXtMUz5RCpdQXXy6pYDlRuTZADYJEMGKsqPJSsBEj+ZwyknkzNyQ==
X-Received: by 2002:a05:6102:c0e:b0:5db:fe0d:7fd5 with SMTP id ada2fe7eead31-5ecb6863b6emr1929861137.10.1767877458019;
        Thu, 08 Jan 2026 05:04:18 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ecdaf1bab4sm5272950137.2.2026.01.08.05.04.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 05:04:17 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-560227999d2so1131908e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 05:04:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWhqT883MHsNIn/E8zxsp6L/1y+RTiptj6bsJaA7wGMHec1bJEaRmhmv7hL7TLHC2+OQGHdxg7vuMBeAGIcSVHLVg==@vger.kernel.org
X-Received: by 2002:a05:6122:459a:b0:55b:74ac:72cf with SMTP id
 71dfb90a1353d-56347ffe7d5mr1958171e0c.17.1767877457238; Thu, 08 Jan 2026
 05:04:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222164238.156985-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251222164238.156985-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251222164238.156985-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 14:04:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWCskceV-qQiUsPtzy8U_c-rsoFzUHfm3fsrq3CkXtg_A@mail.gmail.com>
X-Gm-Features: AQt7F2omPZfOymJvVL-98Gc9JkTT2LJ5zulg4drLZ1sGbSGINVgaTY7EjNWfHWk
Message-ID: <CAMuHMdWCskceV-qQiUsPtzy8U_c-rsoFzUHfm3fsrq3CkXtg_A@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g056: Add RSCI nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Dec 2025 at 17:42, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add RSCI nodes to RZ/V2N ("R9A09G056") SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

> ---
>  arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 220 +++++++++++++++++++++
>  1 file changed, 220 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
> index 5740f04a6222..35cd6b70856e 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
> @@ -922,6 +922,226 @@ i2c8: i2c@11c01000 {
>                         status = "disabled";
>                 };
>
> +               rsci0: serial@12800c00 {

I will move these up (between rspi2 and i2c0) while applying, to
preserve sort order (by unit address, but grouped per type).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

