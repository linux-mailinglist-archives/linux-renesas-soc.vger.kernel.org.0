Return-Path: <linux-renesas-soc+bounces-11171-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 121F59EB6F3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 17:48:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6C53168613
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 16:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C98F42343C0;
	Tue, 10 Dec 2024 16:46:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DC722FE1E;
	Tue, 10 Dec 2024 16:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733849206; cv=none; b=XQB0cnHc38+GbB2scAjo6vR3jhHFaVr8SmRkj4NRZ3cyEYdtH5x2t+YaomTnJADca2WrTByHb6X/L/Mo0Q2A11kXttJN579SVYmtc/sn2TDsB/7O+Hb4CoDqWd/EtUiWLZz98z0uHiHLFL8Dw01k5l5Pfevz7fxQukeQ8TLeWIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733849206; c=relaxed/simple;
	bh=DJk+/1n29bnMlMcMpqUE3uVrUKg4L15UDqwG/070HJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tfReV6fCJduLcVwUzTyEV8k3DlYMWTRaDQEUYAsZHPiLc/W/mDAbF9T+Uj8Qw3dOsa5VZdTU9csbVALs+vLHbuVZbxd/9tUg8kK26v9uXgQ1ps/aH+Y/I9OfGUwJQ3VJCSc5KXkkBfhKxvJcs60pn6MJbytpyRyfnMLSVQAvd/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-85b95896cefso1134962241.2;
        Tue, 10 Dec 2024 08:46:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733849203; x=1734454003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e5ypiX1Rzkjkw7s0415yKyTYKuFCQkAs79zCPKtYbJ8=;
        b=IPDjADHd+PcfPmmOs2/BJEjk1E5nDcpFKxow4Wzk24cJ+/mqEDcio2R85IUE61y1sX
         IBdRQLkVdNfxNT6/ZNU2INXamxue2yRJpZMCp7y48ZPPpsBPPhl9qGyHsY/4IWi4O4Pl
         91oQzIMks1Asta5qTsRePvFtnIDxb+bGm/KFoPyb/vFynqt+xixzHsv6f4hlZJ1d5+H3
         2W0TNBRXcq+XCvQ8SvAMQUjPcHg3Ja8Fz0DrLlowNYb9FBRzs58/Z/75tgc+0c29X2Va
         Qe5NTq1ooy2NYfNCIQFdS2LQGBLDyetidNWLrd/qAJyIJllyulxzAMBnjlRkNoDCFYtM
         JJTg==
X-Forwarded-Encrypted: i=1; AJvYcCVykEj+mCwnInK3pDMaYDOWT/xYvb4h+O+48oVuYbcEhCAKtADSxG4lpFSyh4ddFuvEGd14DK9Jg1CN@vger.kernel.org, AJvYcCWALIoBC+JIKji6qHlOYal6sp8AiKCys60utwYPRZ3+IdvhRXBC1NOvO6h08j7NIKzlCLOdp0wU3k/Mej3c4OhDow4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvArlNHZhXkX9RQ6kjMmpUsJfZJHC0jnoN6EZnSGvuXP+3QtKF
	0H3bR1gHpSxZUX0CF8BUgdahkjX4vGK7oXN8yvnx4eRQImFlPeReZMic0+t+
X-Gm-Gg: ASbGnctDky+Q6w9bY8nbjtDCZ87TcUIAgWE49XP0l3XaCOWdRZsFL3nTlEYp5gGNMxt
	iLZDzyBq+C+y9S/HKf0mzYjQEFx4wXysNbSEFX+A8yDcKy0ojCadKwLIHW3hwqIlfyYUrolib8K
	0PhJxR9hrmuLj21qv+w8G8iZ09CZOjXlkyzIh8X2M1ntYfu6KbEsNsYZbiQaiBw+Bng9ifddqKN
	oWp3LA3kioKwV5YRt2N1wvFWmStmr4N0o4fBrulp1Lis3r6unNed/mMSlk5yQ/RiiZ/FRCk6PNg
	i1i3bVCVGdsfGSc8PX/a
X-Google-Smtp-Source: AGHT+IE05VBox6RjDMmmbwjxl9SXWuUm0UHEoj+9FSY7FtdQW4mMSKaM53ZkfgIPcKp4uLvfN7yd5A==
X-Received: by 2002:a05:6102:2912:b0:4af:ad76:fec8 with SMTP id ada2fe7eead31-4b11605532fmr6089291137.5.1733849203602;
        Tue, 10 Dec 2024 08:46:43 -0800 (PST)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4afd95c33f2sm1005593137.9.2024.12.10.08.46.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 08:46:43 -0800 (PST)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5162571e761so842498e0c.2;
        Tue, 10 Dec 2024 08:46:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWA4lvU36j3d39ljJW38w+ZhKhxmWnCT57ui6p9MUSr30/Zb75bW6X99n2u274b2JmLMN3SRBVU649fknBt+Z3oj5c=@vger.kernel.org, AJvYcCWx74eUTsz7hcjQcvlXjRqFx4eJqJnlKrN5s7gux/IhssiSgYnKkVBj1RdpXIGCzGxs+XmA6LgmHuAr@vger.kernel.org
X-Received: by 2002:a05:6122:895:b0:516:2833:1b8d with SMTP id
 71dfb90a1353d-5188858f8ccmr6063362e0c.11.1733849203046; Tue, 10 Dec 2024
 08:46:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241209125504.2010984-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20241209125504.2010984-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Dec 2024 17:46:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUFH37aFitS4=723pyThTsUyn6i1Vb=KHKiSvXDtrkmAg@mail.gmail.com>
Message-ID: <CAMuHMdUFH37aFitS4=723pyThTsUyn6i1Vb=KHKiSvXDtrkmAg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: gray-hawk-single: Add video capture support
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 9, 2024 at 1:55=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The Gray-Hawk single board contains two MAX96724 connected to the using
> I2C and CSI-2, record the connections. Also enable all nodes (VIN, CSI-2
> and ISP) that are part of the downstream video capture pipeline.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.14.

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

