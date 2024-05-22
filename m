Return-Path: <linux-renesas-soc+bounces-5429-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C50058CBD8A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 May 2024 11:13:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA0411C21921
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 May 2024 09:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE4AA80023;
	Wed, 22 May 2024 09:13:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962FD7D408;
	Wed, 22 May 2024 09:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716369196; cv=none; b=pv9QVTbBOX389DOR+9ROGacvdNC/ytBF2WtQiWQDI7UHhTysGC4YZjWHa7uXha8V8vKhYziXPq59y4kgWT+jSAjkbP+KZuI3kYYFxEsAG6cVjISeTsWfoE85UhkyoSiBsIWrAkbmXj7TJU3Gc1VD2rP0KOhEgg623KPRv+r6yNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716369196; c=relaxed/simple;
	bh=NpDkl4C/aLxNfziyVKJNZYBrRPMqBmz2L19eYuqK2zs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NbZ39XfVr/6oc4pAizJeepLwXnzhleQB4yM6Wk4ULicJHiFn9gwrm6BKw3soaQyf/+uvgrl4BFoGmYVJLQ3iILSCyerHFbmoRlMrP5dfbxZlvUrQqN3BAio2J3RJT/5OlEabNeowyO5KyR4ZD4JIrnQ92Qizs13TYp0GeJjqNgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-df4dce67becso816130276.2;
        Wed, 22 May 2024 02:13:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716369193; x=1716973993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y+vSIey2mm84TJxOyNrO7CZJLSbx18JBAUyIQbFjOoc=;
        b=dhdkJ33+Auh8UvyMV0a3SgIs0hkQxJ5G/TX1V1LpafK80ZBQoe8vYvWVzCWDA5JbG6
         W1s0B7Co3aLooOzHknvzDkc+Tcbyadk1s5A2v+nDLEa6FdnDjl7NyytTqq9Cth8tcPLR
         gE4hIpBFPzmLOtMKlXS10V246haxl09z119VTPjY/Tc9u7WaoCuwCtcuVWVHsAL8MDRh
         Wp1vPyjYUHMYbxiOfZDCZOv5RsYRTD4k+U+5V+KJvGMrxwAZflRoayAqovo6rosEYuLo
         TGnuDkcDiE2OE96kHmLeJoitzWO3NV3RDvsEOmndcOUzIDZIJQ3OdCB7t964TiBL2xTQ
         qgBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXE+tg6md5Oweb/+RyH12lauI03bGISSeLmFt52ZlbFXq+fHyq976Wls0HKJjYjHoD04hPbw8qtvEuRgP76f4uUUYhoSA4bD255pXu5xq5ZYNx4Q7B+MfQ/FgoC2o/1KfS1k4Cy4EK3QA==
X-Gm-Message-State: AOJu0Yyl+waAn5+YdtOK9xZricYUrOOG0A4wpi++SXR/3Wp0xhf0gdIw
	tW2oQf8evlIJpiPm7tjhxjdqUKv0tSjuD5yygog/60lbYxT64bZIfM+2SW1a
X-Google-Smtp-Source: AGHT+IH/FR2r405wasBLoYUxpNArUb57kZyAqOMcRsQa+uNXkZ+5JqLa0AWdtDCpXEuA+266We/8sg==
X-Received: by 2002:a25:8002:0:b0:de5:4ab8:317f with SMTP id 3f1490d57ef6-df4e0bc89d0mr1521203276.20.1716369192973;
        Wed, 22 May 2024 02:13:12 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-df443e64338sm2812577276.32.2024.05.22.02.13.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 02:13:12 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6203f553e5fso45753247b3.1;
        Wed, 22 May 2024 02:13:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXuUburJZEu64jD0O6VG1rpU5Me9N6oh4sWpAzCAdcIbhlGjIe+GGdSmYDHd35zZP2eBx7e2Qm94cJDcjXlamXC6tpgqhmJZaBaPCWn4UrH8kGgE68mQdkCuUgyXhFiTAydj7nQn8caNg==
X-Received: by 2002:a05:690c:f88:b0:615:ecc:91c0 with SMTP id
 00721157ae682-627e465c79dmr17494947b3.20.1716369192153; Wed, 22 May 2024
 02:13:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240515091925.24353-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240515091925.24353-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 May 2024 11:13:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWPBp+5zmech9hJbAvmhi5O38z-hTW1oBQjbf5Uw_jqsQ@mail.gmail.com>
Message-ID: <CAMuHMdWPBp+5zmech9hJbAvmhi5O38z-hTW1oBQjbf5Uw_jqsQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: gray-hawk-single: add aliases for
 I2C busses
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 11:19=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> They are numbered like this in the schematics, so keep the names in
> Linux the same.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.11.

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

