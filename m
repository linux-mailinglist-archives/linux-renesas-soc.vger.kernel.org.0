Return-Path: <linux-renesas-soc+bounces-2041-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2998428A2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 17:02:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A97E1C26FD9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 16:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21D908612D;
	Tue, 30 Jan 2024 16:01:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B9B1292C4;
	Tue, 30 Jan 2024 16:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706630494; cv=none; b=cHwLAeQwe0/b+bD4q45I9aF56XeIqLYgsVNkTUGmTYoGp+QQjJVuxMlaWZa6mGUGbSKu00152LSjAhjODTxGb/uyttVumGtW8CJ2CMuZqc1zlgSYmvCDhQwtb2pU6G0LW82JUl8YK6pqmxI1fCdHt3bLo6MoNzZsusFlawQq6oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706630494; c=relaxed/simple;
	bh=ZTNV1W1qAmrzT/dGlxHKt12m2eKUTDAPXjxJgYDpg4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VqYsnl2hfokk/IVBVw5Jq3ZM13ouQBUNHib4t+L6IKxxfYyzTn2Sry8Kcu2cuR5LrE/Z3+elknee+YVN2QBgOoscQxRO3Xno3TwSLv6WjYC6TX/XpjPZTjz+9Sqo5BXhD9M9IAJyHs2DPnugsesHUjvixnFj9mA+eoRqrHCnW9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3be6ff4f660so1009912b6e.3;
        Tue, 30 Jan 2024 08:01:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706630491; x=1707235291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pQ1TWcB+242L27kdrwmBA24HsLCo0a2icePVWwLdU3A=;
        b=HCqJsqVbIVlUDrsSBAMkXj+Kb8phs+wR7HSKQ0ZcyH5qI02Fsspz3qBJSgtujXDYyE
         FEoH0t0bocbHXODEsWuztvDjHArqg9Eoov3oXEYG+YDyOuUQ5Fbbnswc3lPOMzYJhtAi
         +aHbOm+qsyFHjoonvVDNFEfa/t1b4IEpkAVszp1/MS3sgNMTjaZik4G5TfT4Qld1oMwP
         IlBnwtqlHegCkYX3ASkL2wreH3t6Amh+IiTFcykp9jsYGdx87N4ufbLomUnGOUHBM0zJ
         56i0OTPxJrRVu4ZonFN2lacMhjOGKZ6ODbSCGFtyQjvSts76t9qd6mt22s4gIUUxI/2R
         ecUw==
X-Gm-Message-State: AOJu0Ywdky0YO4PoI9MOB7SmjIzZv1BRRQiV8oPaKOfqTZtjehFOFdRV
	TjkFHnkADJL6zVee37jc428FdgotJHadTQze0KmnitcufAxfmuWB21h0HkquQBE=
X-Google-Smtp-Source: AGHT+IGviXH0qXZ5bHPirIM1d6SQ+UpQCh34SARfw6O87izAqGOVainEur3CEIemUdRLCm3fbO8oWw==
X-Received: by 2002:a05:6358:7e16:b0:176:9e35:6b95 with SMTP id o22-20020a0563587e1600b001769e356b95mr9143525rwm.16.1706630491017;
        Tue, 30 Jan 2024 08:01:31 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id g83-20020a0ddd56000000b005ff86af15desm3273382ywe.90.2024.01.30.08.01.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 08:01:30 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-602d222c078so43021987b3.0;
        Tue, 30 Jan 2024 08:01:30 -0800 (PST)
X-Received: by 2002:a81:c50b:0:b0:603:d3f1:1c2b with SMTP id
 k11-20020a81c50b000000b00603d3f11c2bmr4192060ywi.24.1706630490147; Tue, 30
 Jan 2024 08:01:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240126133116.121981-1-biju.das.jz@bp.renesas.com> <20240126133116.121981-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240126133116.121981-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jan 2024 17:01:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXysobyfuY7u9dcUstFb=tYznKA6pA8-TCL1wx-BQVB9g@mail.gmail.com>
Message-ID: <CAMuHMdXysobyfuY7u9dcUstFb=tYznKA6pA8-TCL1wx-BQVB9g@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: renesas: r9a07g043u: Add CSI and CRU nodes
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 2:31=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Add CSI and CRU nodes r9a07g043 (RZ/G2UL) SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * No change.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.9.

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

