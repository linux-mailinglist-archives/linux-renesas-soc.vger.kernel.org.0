Return-Path: <linux-renesas-soc+bounces-2021-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F70B8425DD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 14:11:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89AF11F2BA74
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 13:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 875796A33B;
	Tue, 30 Jan 2024 13:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c9KmOoLe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42A26A32D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jan 2024 13:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706620312; cv=none; b=DVscA1J3kwAuNMyZo8dq9Xhq7aJ7vWDa8N3Nyrmt+UsBEd2VLxLzLXmSUlj1tfIH6mf15tNWM+Ry5qaDer7BJK5UbETsYcIcGbWK6LqP+66NZ9Ffu7bylB4tBK/lL/5n4so95J1Oi8vmVMzMv6rrr5EncjcxT0sl7kCPk7lrA40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706620312; c=relaxed/simple;
	bh=fdsM/RQGHBnGYEyW8iJ1J7nomMb3JP2gqVVCMYkIC8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B6wRxXGyyWPlQlhNSR2MAEEZBJcQHPhcyqZ8LMoeRqmw8naSBb1/Aiou0iezJvKfGe8572wWw7Rm7BSGtM7JICaTHvmUJc7kOBIvrwzP1YQ0Ep7dJbhoK3ux4+EZhDUd/ZAUgnFzAFwHYjETW4J1sN2WNbE3k7l1lRKIsbhHcAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c9KmOoLe; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dbed179f0faso3827478276.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jan 2024 05:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706620310; x=1707225110; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0XyRMME8pDr6DjGIF4jnfi9KerBGa4nDHBbrYJypaqI=;
        b=c9KmOoLeJ4q66kthJuKqgJYyv+BhlYmzp/N74YURr7Otx9tPfBfEzqPK5WJWUZYvZc
         lPlEW10tZT3HKUH80A6wwMIMMbnd00Pn5GH/tnhOh8zYgVYhN8ZlXAWSAVEZe+7GnDV/
         UMce7tGhf2bqvUkVirUpQMq+fu0xcPfPpv0eMUWkEl46qQ4r5FxYS408PNh4o3S+XZNc
         XlxLsIcNxB4aaQBu99YFlso4D6P2fkN9SYBCkWRxZ+Nqtn7AwOlNEsfj+RpA8n8fp0At
         CrIFuEkn7sSgYTKFLRI+VlzDWzkvoK28cUEFRx4k5Fe0SsF4Q8h3RW/K5SaiF0NjUART
         iejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706620310; x=1707225110;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0XyRMME8pDr6DjGIF4jnfi9KerBGa4nDHBbrYJypaqI=;
        b=whC2NX2bikHps+3PYt0Jrozs5I99yaFPgb4fflhYnNnG4evhdudjyqQO9DW52LDdh4
         7xMUUA9wfVeKpTLNnzTwwwRTE2cLMvYO0rQ6xXYf+Bm28xCTJ4d12D6uvWnvWuD0MBZ3
         0Am0xh05+I/mZEUEcbPWmQb9eqa3/hvjdak5IKZuYGvhzcLiZDu337iRlHlC8WEbep/V
         n4t3CMgCTvUVo/vOS/bWvKwNeiBma/Z/r4qlNdR/9G2VRspK/it+FeKkHytWgxZMUFra
         RYYZviwPXjdrmcb33qVu1FzQdDtJfb/S/FCh79BnT8HEBzGMtjTeADksHWXoZJrd2DIA
         E9oQ==
X-Gm-Message-State: AOJu0Yy1FQ7sAL5bl/Vvo7N8XgKbkwPgTp1Exz5LVyj/JYvTRiZVse8h
	30ERtIj1fwjT3iCAQLu/m3YpThyl6nUw3DzZ7jKX02ITX/ltgcj5wM7GMQQAFJJG0GB6R6xryAs
	tVp47tR1s3t40viSUXiUjIYKl2Sp3Ptj3nB/qnA==
X-Google-Smtp-Source: AGHT+IGVYj01HQ2hq/JifyqWz/KVsf0C8m1IL/EZ4Kf9P5M0gEI5mykk+pshRrPwk2n8TLJtoS1gjHQYx7sx4HZyEhw=
X-Received: by 2002:a25:2d13:0:b0:dc6:18ba:9b51 with SMTP id
 t19-20020a252d13000000b00dc618ba9b51mr673573ybt.41.1706620309734; Tue, 30 Jan
 2024 05:11:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1706194617.git.geert+renesas@glider.be>
In-Reply-To: <cover.1706194617.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 30 Jan 2024 14:11:14 +0100
Message-ID: <CAPDyKFpxaEUHvKKb+spxV6HG2P2gLx5qM1mLPxJie+PdkmTL4w@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] arm64: renesas: Add R-Car V4M and Gray Hawk
 Single support
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Cong Dang <cong.dang.xn@renesas.com>, Duy Nguyen <duy.nguyen.rh@renesas.com>, 
	Hai Pham <hai.pham.ud@renesas.com>, Linh Phung <linh.phung.jy@renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jan 2024 at 16:34, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
>         Hi all,
>
> This patch series adds initial support for the Renesas R-Car V4M
> (R8A779G0) SoC and the Renesas Gray Hawk Single development board.
>
> As both driver code and DTS have hard dependencies on DT binding
> definitions, most patches in this series are supposed to go in through
> the renesas-devel and/or renesas-clk trees, using a shared branch for DT
> binding definitions, as usual.  For the PM domain patches (03, 04, 09),
> Ulf already offered to apply these to his pmdomain tree, and provide an
> immutable "dt" branch, to be pulled in my renesas-devel tree.

Patch 3,4 and 9 (I dropped the copyright line in patch9, as pointed
out by Niklas) applied for next, thanks!

Patch 3,4 are also available at the immutable dt branch for you to pull in.

Kind regards
Uffe



>
> Changes compared to v1[1]:
>   - Add Acked-by, Reviewed-by,
>   - Add vendor-prefix to DT binding definition header file names and
>     update include guards,
>   - Add "board" to compatible comment,
>   - Add missing CP core clock,
>   - Add SoC name to top-level comment.
>
> For testing, this series can be found at
> https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/v4m-gray-hawk-single-v2
>
> Thanks for your comments!
>
> [1] "[PATCH 00/15] arm64: renesas: Add R-Car V4M and Gray Hawk Single
>     support"
>     https://lore.kernel.org/linux-renesas-soc/cover.1704726960.git.geert+renesas@glider.be
>
> Cong Dang (1):
>   clk: renesas: cpg-mssr: Add support for R-Car V4M
>
> Duy Nguyen (6):
>   dt-bindings: clock: Add R8A779H0 V4M CPG Core Clock Definitions
>   dt-bindings: power: renesas,rcar-sysc: Document R-Car V4M support
>   dt-bindings: power: Add r8a779h0 SYSC power domain definitions
>   pmdomain: renesas: r8a779h0-sysc: Add r8a779h0 support
>   soc: renesas: Identify R-Car V4M
>   soc: renesas: rcar-rst: Add support for R-Car V4M
>
> Geert Uytterhoeven (6):
>   dt-bindings: clock: renesas,cpg-mssr: Document R-Car V4M support
>   dt-bindings: reset: renesas,rst: Document R-Car V4M support
>   dt-bindings: soc: renesas: Document R-Car V4M Gray Hawk Single
>   clk: renesas: rcar-gen4: Add support for FRQCRC1
>   soc: renesas: Introduce ARCH_RCAR_GEN4
>   arm64: dts: renesas: Add Gray Hawk Single board support
>
> Hai Pham (1):
>   arm64: dts: renesas: Add Renesas R8A779H0 SoC support
>
> Linh Phung (1):
>   arm64: defconfig: Enable R8A779H0 SoC
>
>  .../bindings/clock/renesas,cpg-mssr.yaml      |   1 +
>  .../bindings/power/renesas,rcar-sysc.yaml     |   1 +
>  .../bindings/reset/renesas,rst.yaml           |   1 +
>  .../bindings/soc/renesas/renesas.yaml         |   6 +
>  arch/arm64/boot/dts/renesas/Makefile          |   2 +
>  .../dts/renesas/r8a779h0-gray-hawk-single.dts |  52 ++++
>  arch/arm64/boot/dts/renesas/r8a779h0.dtsi     | 121 +++++++++
>  arch/arm64/configs/defconfig                  |   1 +
>  drivers/clk/renesas/Kconfig                   |   5 +
>  drivers/clk/renesas/Makefile                  |   1 +
>  drivers/clk/renesas/r8a779h0-cpg-mssr.c       | 241 ++++++++++++++++++
>  drivers/clk/renesas/rcar-gen4-cpg.c           |  10 +-
>  drivers/clk/renesas/renesas-cpg-mssr.c        |   6 +
>  drivers/clk/renesas/renesas-cpg-mssr.h        |   1 +
>  drivers/pmdomain/renesas/Kconfig              |   4 +
>  drivers/pmdomain/renesas/Makefile             |   1 +
>  drivers/pmdomain/renesas/r8a779h0-sysc.c      |  55 ++++
>  drivers/pmdomain/renesas/rcar-gen4-sysc.c     |   3 +
>  drivers/pmdomain/renesas/rcar-gen4-sysc.h     |   1 +
>  drivers/soc/renesas/Kconfig                   |  17 +-
>  drivers/soc/renesas/rcar-rst.c                |   1 +
>  drivers/soc/renesas/renesas-soc.c             |   8 +
>  .../clock/renesas,r8a779h0-cpg-mssr.h         |  96 +++++++
>  .../dt-bindings/power/renesas,r8a779h0-sysc.h |  49 ++++
>  24 files changed, 679 insertions(+), 5 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a779h0.dtsi
>  create mode 100644 drivers/clk/renesas/r8a779h0-cpg-mssr.c
>  create mode 100644 drivers/pmdomain/renesas/r8a779h0-sysc.c
>  create mode 100644 include/dt-bindings/clock/renesas,r8a779h0-cpg-mssr.h
>  create mode 100644 include/dt-bindings/power/renesas,r8a779h0-sysc.h
>
> --
> 2.34.1
>
> Gr{oetje,eeting}s,
>
>                                                 Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                                             -- Linus Torvalds

