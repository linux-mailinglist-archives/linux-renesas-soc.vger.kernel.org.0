Return-Path: <linux-renesas-soc+bounces-21922-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B069EB596F8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 15:06:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EAA9324E85
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 13:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F985315D2E;
	Tue, 16 Sep 2025 13:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fos5Uf5H"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EAC1A5B92
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 13:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758027921; cv=none; b=pl+oadVGzFFqTS1LGIHWIdnUuNEvGMCgg6wAqVfpVdMM3Ncx/mlHJYW4MXA7M3whv1nTdRcQKdiQ/NFeh2dgQaEiwGmjU6H6e8byn/hvLUwwbITP+lLgUPELFLFszT/DMhV1vhAH/E/CBan6BsikItwKGuyelCO7MKm0F8JLj9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758027921; c=relaxed/simple;
	bh=A3J/tFGOFdBX0jXW1C50S6raOvMVBUSgWZvi7Kanhlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HPYn4H8EBlA+KLDEMl4MR3l7HqklpMO303QwjehHYiLh6hTsjx1Dkv8epQiGUNMdUK/mZpXOdm9cMXjV5exY0LiihfDIauieArAoVWA3oT5pjhGvE6lL+jH38wEm+Uv3FMdDYQQbjR8C0JZtZhC7ZjfLY1okvLCIr7YLbA6+C98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fos5Uf5H; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5718ee49659so434512e87.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 06:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758027913; x=1758632713; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7/8TL00Hlar3x8JkbaIO/sy+q7FGgNPnwJ9JADaoRL4=;
        b=fos5Uf5HmtyHtL+lmjA3a2H9HrHhg8P/6Oolr9AJUDGP9OMkPBwjrxX4OljDwPgr6d
         EGU3mAK2k3oxuwsvYOcV9dbWMOzECSpFh5rGQAoVPBdCYGIzcxU1qmZg5zk4kcKy1o8m
         ObLceXCuhryPZVREmWltfaDyU3ZSF1AB8tcM7qcx3s+Gz+c2nfs8LaVe1SpP50rIkaBH
         5kjixBwE/ipFb5iKq7VUmS/Jj4sUhCRs8m+4ruHcLezKuG1xEXn3RG6EeIVEcmOnGCUs
         3gWXyvDwyTqCB2iiTAz4a69UtfssPH55UjmP+s5EQSAjGrj7AA9BVG9u3gT7Ox6W1DjG
         Y+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758027913; x=1758632713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/8TL00Hlar3x8JkbaIO/sy+q7FGgNPnwJ9JADaoRL4=;
        b=mxtryorDArKKp1Qw+r1q7bhxGdjipjSbhF7sb46UQ5rJ+eWr1hjzUp0Zh+FPhNQtLn
         A/1vF7bBqBUnJ9TSGao6FV6Zw3HnIZtqRTZ2D/ojzvv8OhBfHXjWsHEoHOZKsjzCKjDB
         pchirLBI8+en0bBCt9eUTJSlAPECFPW7rwHxACyqQN3ZENhskdio3CaZfij4wu/JAm/M
         9kHUX3RsIkIOpXCbPQZ6WbhbgOTlsovvdcq86fw00aDSfnxiVtAPxa3Fh2qwi7rr528+
         5ZgqwuTN3wtxljLRhvGn62N/twS6geTWzjTmXNVfpIkqAap4E7/wBDrb8tc98iVzAuci
         8jvw==
X-Forwarded-Encrypted: i=1; AJvYcCWSa9uXRKqWfhFE3Cp8FharTKBeLrFGKTMEBXcf49NKqES8TgQPn0HBVstwL3SJQkmH2iWkv5CzlqZRPGWoJwONQw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd87u9nGG9TCH+ES3roqX2TUZ+lfCJapw0+Kydk7YLG4knHMJH
	9ILGz8L1ml/o8QQ2Z1HrPfgewlbowbXg/OP5tL5p4IoTpr0x3Qd6h3rSQZpOqv6kqqk=
X-Gm-Gg: ASbGncuW9H0zNAPyLlbm3LyCuScGW+RnH4SUplcVaIkvOgfIK10mLMwxuWbWch5OWx7
	8FUnb7mnKb03hW3HpCSnQou/utSrRy1tJcwFId3treBjUA5NzUOyAQQED8Klj2M046hR+nmZJ8A
	rC8W/COuZRw178DsgOFblFXxjJn/Mil+P8ARZGRxRy0cxi2NY0MdujmFtJezs06W9EWFZJFYnGj
	4qSUyJLdzlPRPl0ys/QfXKU5MX0G5O5YqncwDfQ2SaF5ijjT+8cf+06GRXt3TQ/j+S7SkRffPSX
	F+fGrdChiUfPNbLeg02ZjwOrvYqsHmb/9Dr1sGV6CyjHGQh64oPLUNI8agQ/YlnGWDZaAiO3IPF
	QvOee+TMmi6SN5buJ2RCRrDXjte1G9ZpwUODIchz3F2Q0aq0EHA/vmFXzuLGQmnIoIw==
X-Google-Smtp-Source: AGHT+IENshuIe1ZzBTlZI8ErHAIWfYofEIxwEqD/DxJUwphDcoj5NYeMYiaSJpT5gnIx28eNAX2rmA==
X-Received: by 2002:a2e:bea2:0:b0:336:e445:92c5 with SMTP id 38308e7fff4ca-3513dd54c2amr23580931fa.3.1758027912735;
        Tue, 16 Sep 2025 06:05:12 -0700 (PDT)
Received: from monster (c-85-229-7-191.bbcust.telenor.se. [85.229.7.191])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f1b2a931fsm33599691fa.47.2025.09.16.06.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 06:05:10 -0700 (PDT)
Date: Tue, 16 Sep 2025 15:05:07 +0200
From: Anders Roxell <anders.roxell@linaro.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v3 3/3] net: stmmac: dwmac-renesas-gbeth: Add
 support for RZ/T2H SoC
Message-ID: <aMlgg_QpJOEDGcEA@monster>
References: <20250908105901.3198975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250908105901.3198975-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250908105901.3198975-4-prabhakar.mahadev-lad.rj@bp.renesas.com>

On 2025-09-08 11:59, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Extend the Renesas GBETH stmmac glue driver to support the RZ/T2H SoC,
> where the GMAC is connected through a MIIC PCS. Introduce a new
> `has_pcs` flag in `struct renesas_gbeth_of_data` to indicate when PCS
> handling is required.
> 
> When enabled, the driver parses the `pcs-handle` phandle, creates a PCS
> instance with `miic_create()`, and wires it into phylink. Proper cleanup
> is done with `miic_destroy()`. New init/exit/select hooks are added to
> `plat_stmmacenet_data` for PCS integration.
> 
> Update Kconfig to select `PCS_RZN1_MIIC` when building the Renesas GBETH
> driver so the PCS support is always available.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
> - Dropped passing STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP flag in stmmac_flags
>   as it is always set for all the SoCs.
> - Updated Kconfig to include RZ/T2H and RZ/N2H.
> 
> v1->v2:
> - No changes.

The following warning is seen when doing a defconfig build (make
defconfig) for arm64 on the Linux next-20250915 tag.

First seen on next-20250915
Good: next-20250912
Bad: next-20250915

Regression Analysis:
- New regression? yes
- Reproducibility? yes

Build regression: WARNING: unmet direct dependencies detected for PCS_RZN1_MIIC

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

This is the build warning:
WARNING: unmet direct dependencies detected for PCS_RZN1_MIIC
  Depends on [n]: NETDEVICES [=y] && OF [=y] && (ARCH_RZN1 [=n] || COMPILE_TEST [=n])
  Selected by [m]:
  - DWMAC_RENESAS_GBETH [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_STMICRO [=y] && STMMAC_ETH [=m] && STMMAC_PLATFORM [=m] && OF [=y] && (ARCH_RENESAS [=y] || COMPILE_TEST [=n])

WARNING: unmet direct dependencies detected for PCS_RZN1_MIIC
  Depends on [n]: NETDEVICES [=y] && OF [=y] && (ARCH_RZN1 [=n] || COMPILE_TEST [=n])
  Selected by [m]:
  - DWMAC_RENESAS_GBETH [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_STMICRO [=y] && STMMAC_ETH [=m] && STMMAC_PLATFORM [=m] && OF [=y] && (ARCH_RENESAS [=y] || COMPILE_TEST [=n])
I: config: PASS in 0:00:01.592356


By reverting this patch the warning disapears.


## Source
* Kernel version: 6.17.0-rc6
* Git tree:
* https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: next-20250915
* Git commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
* Architectures: arm64
* Toolchains: gcc and clang
* Kconfigs: lkftconfigs

## Build
* Build log: https://storage.tuxsuite.com/public/linaro/lkft/builds/32l4UF8KltAzu6kUpW3hXaYRWjZ/build.log
* Test details: https://regressions.linaro.org/lkft/linux-next-master/next-20250915/log-parser-build-clang/general-unmet-dependencies-warning-unmet-direct-dependencies-detected-for-pcs_rzn_miic/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/32l4UF8KltAzu6kUpW3hXaYRWjZ/
* Kernel config: https://storage.tuxsuite.com/public/linaro/lkft/builds/32l4UF8KltAzu6kUpW3hXaYRWjZ/config


--
Linaro LKFT

