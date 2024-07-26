Return-Path: <linux-renesas-soc+bounces-7557-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7227C93D56C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2024 16:55:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6BF5B229F8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2024 14:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 784F31D545;
	Fri, 26 Jul 2024 14:54:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F0D14A82;
	Fri, 26 Jul 2024 14:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722005690; cv=none; b=e3i1PyxAwEUnAeCnENjRYldW3W+jo1DSFOQTAHQ6UAEVbgHC6KqrarXdpMa6SouH9+QDtrzvZ16TNSz+1VYyY6YOWa10hYCenVghvhRGT0gPdmaMKx8k2qnwxxDU/O15f5+mkR1Nc9MSj1jn4/y16dA53iYXst9QuQj4vavMfM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722005690; c=relaxed/simple;
	bh=+0aUcO5CSUBprkdsZtY2K18NshvbYINLi5yqqJqafAM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uBo+UZ6odRgj1h99Li2mhVk2ISW+oTECgQHP+lNmUfekiUXhvnBx+ECgK/p31Kmi3QSq1M1zQUdJ1XF0lpJ3tTiUQpHeurLgpZQoza5P0JYqd3qe843tALClfsNXO3Pvk4uaMxY5SoiYbCumAe97VncbtVWiqOy3W0WtJYTZoBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-65f9e25fffaso22210397b3.3;
        Fri, 26 Jul 2024 07:54:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722005687; x=1722610487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i5XAGsGJDErL21c3oTRiz2cwW6EJXcM+HixopBltRNQ=;
        b=auZmmX5miJvZzdIhyimn2WFDUPFyPA/p4tvjBPRCl+IMck5HzORGLAEgYYOPlT3JOX
         2bngoWSaobn4fHCBNIYgp7/1VuBmATpAlFD5A7NWJm0yZBfTOe091wjlJfSyY9RquzNl
         eVO3yTAZDdhV1jiFGOudufOqkZltw/PIO6ll0RXKVr+J3XzT+M+AtENHdsm+CpZtcWDf
         6LFRRKAAOX/J70ZP1zOCnFJcn0twZeAGTr3ChsY0gmYaOvoa9+p+XV/t9fXeR7B/sD99
         7vAad2Za37vNw5wELFWnYawTsXkjpV2s5rUiW0qS/HcqPDSNfkXOO1sUIqmZ2ScmxZg9
         xKpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbgtaUUrKg4AFC/714tWQyEy+rzeYNGDFW2r8Pm1XiEDJ+x/f4+QW7Wyi6GA551Fx3e0cvmrh2Sb/EhC/cI7zrw20DYb1dOy/JXihpB/kXdRkfySjkNA9cbLoTT957Ke8GwgvQE2XIoq7gb7t4MWtREmI+7t0gqJ5gfK6NrczqBqLpMuqiRZe/VNKiMvEkNPdHmo5rDrlhhGbGGIhye0fKM5+Tv7C/
X-Gm-Message-State: AOJu0YyMXAqk3kli+fkJ9vcIDXTjprS4mNPr7kDjouqdIgV1lrBZuTjv
	tKtegkwvAyy1UFKfdA1BlVPH/TKTUeyR6nU1u04HPJVD58uRyxukWdjNmtLq1y0=
X-Google-Smtp-Source: AGHT+IEumWLEJ35QXp4rCuKUKZgGnxz/SvAxXq4jfv9ok2JEtouEz2ACy0CjWM8aepGuVUm+PTjPtA==
X-Received: by 2002:a81:8104:0:b0:644:4b82:bb0a with SMTP id 00721157ae682-67a053e0c7amr642887b3.2.1722005687211;
        Fri, 26 Jul 2024 07:54:47 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6756795e78esm9205417b3.43.2024.07.26.07.54.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jul 2024 07:54:47 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-66108213e88so20482747b3.1;
        Fri, 26 Jul 2024 07:54:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUMO5a+HUz4qdceyhAESPLjkFzQy/P0umLgYrGnfoQkPtgdjDIrdJE0f+1iUbjiguHJylKnXx2FI6JlHFhevkJ6K0L7Tk7TvdCh9rm+crgGGplEshuh5OfeAILGhvpbREJ3CpZiLSzQCEZLaVW+WafASS/uep9sH1QFocSS5HJzAaTyaNzON41LRAtuvie1UwwL+/yBjoZwbOdzAX9nnxp9uvAEDjL3
X-Received: by 2002:a81:94c5:0:b0:64b:2f31:296b with SMTP id
 00721157ae682-67a053e0c61mr675507b3.4.1722005686758; Fri, 26 Jul 2024
 07:54:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240715125438.553688-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240715125438.553688-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240715125438.553688-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Jul 2024 16:54:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWO-w6Lb6L1rLHwjJrs7WsNrdaYJxcuxPLABhSSCFOq5w@mail.gmail.com>
Message-ID: <CAMuHMdWO-w6Lb6L1rLHwjJrs7WsNrdaYJxcuxPLABhSSCFOq5w@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: clock: renesas: Document RZ/V2H(P)
 SoC CPG
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2024 at 2:56=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document the device tree bindings for the Renesas RZ/V2H(P) SoC
> Clock Pulse Generator (CPG).
>
> CPG block handles the below operations:
> - Generation and control of clock signals for the IP modules
> - Generation and control of resets
> - Control over booting
> - Low power consumption and power supply domains
>
> Also define constants for the core clocks of the RZ/V2H(P) SoC. Note the
> core clocks are a subset of the ones which are listed as part of section
> 4.4.2 of HW manual Rev.1.01 which cannot be controlled by CLKON register.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> v3->v4
> - Included RB tag form Krzysztof
> - Changed reset and clock values to hex
> - Renamed __DT_BINDINGS_CLOCK_R9A09G057_CPG_H__ to
>   __DT_BINDINGS_CLOCK_RENESAS_R9A09G057_CPG_H__

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

