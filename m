Return-Path: <linux-renesas-soc+bounces-24555-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92172C57A7F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 14:29:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 785844A7F30
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 13:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A7735292B;
	Thu, 13 Nov 2025 13:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ngVkrRun"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C9B351FC1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 13:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763039943; cv=none; b=rj00AFLfogN0OsNjWPoU17FVprmoOM4k0qoz/pTo12L/9NXpn6bI9Mjt9LQ+wrSqmhU9tMGGsbuAST9QtqI5i6fvEQzklJaxvJpWnRBSMJpuChkuT+j2mc1uTMLB34zB7KLAH4dBNAc3O9ap3D6BgtYcuXjGSU1Q1qwAqvfLf6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763039943; c=relaxed/simple;
	bh=dZ2FevfKGBfSlzInaPvMVB0Ytsg/HnbfQojoImKv34o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KiwybQRc+O3t13QG1YRDDFlCc8t3woHX6uWgxHKd9WzveHgAySnuPgFSYB7eiXzP/6B7/ZwVggRdSMKiBsyR/FZdjcb6ybL5/5UpmdEqEISDy4YfWwfsZ8vRU1OMRLYE1y7dJEOrUIZeNHWRw7ZkyXjKXML5DFkX5ywHRaQQJRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ngVkrRun; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-594270ec7f9so736689e87.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 05:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763039940; x=1763644740; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZfCaucUzkZTNK+50YPVLfmUuvxNRaVom6NqjpdOeAc=;
        b=ngVkrRuni8C0ZzIICR4M1qJk0YSAc2BqN7tfoFD3K8miMEl3AUoeZTHyH3JTQqVne6
         0oIe8sCSeQwTobVSMIdt2ef8RLM5qHSU1lYqNBttR0bvsXU8vCs1bqZLP1kDftPQ/GDb
         t+JTcOKbGgfUFW9xHu2SLEEkIDrU51eaJ1bQfv3tadkzbSwl/i/KM2aFVsvr/ksSaVEW
         Ija4F7f+3Ey+Zt7u6v1C54rFyngfipxqqC72siJWrM/BI8Sh9H/fAdtE46iAMG5DtuOK
         WqgdBxKGG3OYy2YWVqE2iLqhQAEKzzM9UweJ+FUj+IQBQvPRye4/iWDTbRjQzESkqQqu
         WZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763039940; x=1763644740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VZfCaucUzkZTNK+50YPVLfmUuvxNRaVom6NqjpdOeAc=;
        b=YZP8puq4xfKHrVa3bnwUi3xgpKlN4wquPlMWRCZ960V5wPQ0E1eDKva49rnw4B0sg1
         Jf8Oq12rnVo0mrk5kc+QxD8anO1hJL4iriEYvfPgV0mGRVjmQ2BdCZw3gq8iWZWA5ngv
         vJ7pKZZPnAxh3Wma/+2eDfmASICQ4Zmt7Wt/lD5+t36KArsBngt7kan0PZRP27s3bn9v
         GQ65jV4wWHgbKFVZ6aoQXmXtQsE4ftftDy/BKjNIul7+swVPZTC3apWBAUsK1kgcmVjX
         hr1V1o0346YzqpooLF74lhdUpXSI/jA6K2m+o7rNFtjNQqyIy3zhRyLZRDeTw8RIqHed
         JlTw==
X-Forwarded-Encrypted: i=1; AJvYcCVhhh89EoEOwjkZG+CQyQdCfv7t2rVPZazsQlU3CKago67NyBmi9XYyZihfbPGv7l4vmU7f/B3gDGCp6Cs3Nn0aNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YywBeO2djnlG9HpZjXuJhMxmYsE8BnLhe8SaASVcIo/RfllCchT
	HHh68xjP8hn9MUt/Sz7o1pliRb0FrTyaJedbPwEBaeR+PgFfv+3JpwGsVt2HjWZEQCgTmuwLa5z
	f3ifV4MIi1qo8AJ9rUh/jjxqJrh3+Zcb9oQmRheMMow==
X-Gm-Gg: ASbGncvZ21mJYjxH2HBfCfG+BYx6HOoJgwaq7CfpwbTdkV0WP+QwNZ5vYcENtJDhp9d
	2/VuwRjy2MMDi58bWIDT1+z4xNwdymw418TpNoo9Yn79uuTmFrq/zbddespfWXLOzB38ZF7ihAt
	9QXywvm4bU3njud4eSMoJkxujLxeRIb4mZs9YAxfoKu+Mdd8XRlIU5WSQ/PbmQ04pv1LIbA8Z+H
	jdzX0D6XxCc67m7JlocdVGMTL50H9v1esmb3uBEd5YeQYhFqi0fTX3ypdaSq/dijDUrv4yKm9/W
	Tm41DkWR5BPYFaz+
X-Google-Smtp-Source: AGHT+IHeVzTuj43c2XKQpZBw2ErEf3YOWTRFAtQ1vaZEEtKBTkEs3tR1Hd50SIgH+QjYllZZcXodcrSS9KZ8vRhrh3k=
X-Received: by 2002:a05:6512:3152:b0:595:7b24:d36e with SMTP id
 2adb3069b0e04-5957b24d58cmr1396653e87.7.1763039939830; Thu, 13 Nov 2025
 05:18:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-2-01d3e3aaf388@linaro.org> <21a3d269-76e6-4da9-aa25-bfd1fb6dfb07@oss.qualcomm.com>
In-Reply-To: <21a3d269-76e6-4da9-aa25-bfd1fb6dfb07@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Nov 2025 14:18:48 +0100
X-Gm-Features: AWmQ_bkdL6yYgjauNyydNchJ2jLFj9s46UQ7WB4-Hc5rFElcxZ0Jmq78mNjUwDc
Message-ID: <CAMRc=MexMn_GSC2EtMek5hDRLjGYA5HKM8ge9vrxw1pYDqPJgw@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] net: stmmac: qcom-ethqos: use generic device properties
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Matthew Gerlach <matthew.gerlach@altera.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Romain Gantois <romain.gantois@bootlin.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Heiko Stuebner <heiko@sntech.de>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Minda Chen <minda.chen@starfivetech.com>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Shuang Liang <liangshuang@eswincomputing.com>, 
	Zhi Li <lizhi2@eswincomputing.com>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	"G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	Linux Team <linux-imx@nxp.com>, Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>, 
	Samin Guo <samin.guo@starfivetech.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Swathi K S <swathi.ks@samsung.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 7, 2025 at 11:49=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/7/25 11:29 AM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > In order to drop the dependency on CONFIG_OF, convert all device proper=
ty
> > getters from OF-specific to generic device properties and stop pulling
> > in any linux/of.h symbols.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
>
> [...]
>
> > -     if (of_property_read_bool(np, "snps,tso"))
> > +     if (device_property_present(dev, "snps,tso"))
>
> This is a change in behavior - "snps,tso =3D <0>" would have previously
> returned false, it now returns true
>

This property is a boolean flag, it cannot have a value.

Bartosz

> although it seems like it's the plat driver clunkily working around
> not including the common compatible and inlining parts of the common
> probe functions..
>
> Konrad
>

