Return-Path: <linux-renesas-soc+bounces-25958-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A7302CD2EC7
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 20 Dec 2025 13:47:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 20F823001830
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 20 Dec 2025 12:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF2441E991B;
	Sat, 20 Dec 2025 12:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Y80MlP0f"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333911F872D
	for <linux-renesas-soc@vger.kernel.org>; Sat, 20 Dec 2025 12:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766234817; cv=none; b=M+L99dZhNPxe7uK/F3qefNKDDedTb97yMvmjCiWvJMHfi5nPTFdEZ9UDvSD9c+GxA0MlRhisds5Pcv3+7PTlapOkSdTBvVFO9/oWm1uc3tLCCcTUjTYRgtE0LIGMAluVw1bp1GJ+kTPbrEQDXY0MfJlnPL43nOnYCUb4Fk+o67o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766234817; c=relaxed/simple;
	bh=BMqWG7tVLRpE0d5CCcucZYfHD30N453xL0DULNwoUjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QiqbZ2rPprAA7vulJcWAFevLLDaZbnYdC2TtabLfwWB9fLR+JWBUax366uC6jGGr+bvAESzgGSfh6ckveaiJcZNAq6A76EIHGbH2gjYiJ3HTQ6xnVNYArkPjjgUoySqIaJQoa0x4T1kz+U8A7TuEHG4R90GQujlDDcjDNqPqNX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Y80MlP0f; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a0c09bb78cso18163935ad.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 20 Dec 2025 04:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1766234814; x=1766839614; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PnLeQHT6gKO5LrS+1ND5Ys5FEsU3x/z5LzPcGERhZEM=;
        b=Y80MlP0fmDp8tm4zieU3AulAPFsuZnuiz+9owEEQqyJqTATrexNsDnR76R4JpTFEyG
         D589R+STSY6H58P+zUmUonSEQOPIihahjMibqy7il6/G/yl9m5FxjuP0NO2VA7AJR2B4
         ANrZ8WfbRm5zJI7HsdBWwBZ3WNSlGT/WnjGTXCPCTszc2V5jcPB58ADfOEXna1r1d+QX
         dIUAZ7JjUtEZUv8/qoIzP4o7BuMRoBE0SjyeqSu2Zqv35Zf5ciVGE+QLao3y/wd8EPvh
         cfHz42rxGzucWgI6TZh4ZA0Jd7EkEkm+V18BwdgCNfCTBQsZqR73SD3ecY6HKLmygYGA
         m2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766234814; x=1766839614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PnLeQHT6gKO5LrS+1ND5Ys5FEsU3x/z5LzPcGERhZEM=;
        b=Aa7IWBtwHyLGJVM/OykMkbXZV5a73YL5Eto0xheBzTrla2q+STt/ZXeslWH4g7Z4aF
         hH9F9ImxzmbHRUHdMKP6S5+sjw98eNpp9hhWHbjJ0v9d0ZooLrfb+7owmjAO6YSnWBR3
         CSuf6QPtpA8FQxNnjZZ5WvGAgeLK4SeQeA3K2P6RSRJnwZmLdNrrYQjZ8MBSrC2XRx6Z
         wcpC8j+N6PvUImg0H8jGstvMDsHwUbhWiScMk1HnKN4wHvZJFWzZZ0YlY34hrgAiQj9I
         wTSX9B64f0vaNYXSN0eyn/JvLeaMNBPN8goABjS4HQD9AD2Ze564kqsJJiJy/5KETBKj
         VM3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWZjXrN4iLIOhykn6pYNWlhJ2bEkD0+CEmjcBnamMD40SpDK04XQswnSkNhXHOGD+O2VFGkPziNFrz++tN9C31snQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ9PNvEksGnYbUvIxP8iLT6dUyyoemClDGggl215CY6bxkd9Mc
	GXDZl5N+9LVOWDMFfnoM7iaO21oCFNKdMsFc4NmKQI+vIe0y8Y4WTaUd1QxcEcjC2C4iFUQbfru
	Y8WTYeCU8I1Euy9e5yczJVEIRfkCno8w=
X-Gm-Gg: AY/fxX4/NeFQlwkx029KPbtJn2FlRjEBHzYoPKvtkPzBIJkJ7/N7K94TBMo5XFQeidh
	74rUgCHBBnxI9uE/J9MibFShf/uMmoaIBLmQtAxK8KO1WaGD6NA2rgrxfnPuvAA7olCNyOAMPms
	AtVgWnWOIwMlDafThF/TUaCq9sVMDvV+jTg+lMTdfWABwkYTF98RqdZtbd+uZ5/Xy6BnHzfCgbh
	i5NI+HiJ8WzJKLN8tgkmIR0Vqq3SeSLtMN4MwTiUNbHWDsJJXRPl7BFKWNzSMPMtK5ACm/bgDsf
	MOwpHJXP6wpgXvqm8QPsQ/AKw5ps5QRlqJohXj8=
X-Google-Smtp-Source: AGHT+IGTZVFXf6rAC1bEGZmO7YaQs0mj72/Bxua6dbMs1yZR8CidcfGRl/4LVrNe9mb+pBaCXI6UiiHmEjBYB9UahrA=
X-Received: by 2002:a17:903:198e:b0:2a0:99f7:67b4 with SMTP id
 d9443c01a7336-2a2f0cbc904mr55199135ad.8.1766234813931; Sat, 20 Dec 2025
 04:46:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com> <20251219-qcom-sa8255p-emac-v6-1-487f1082461e@oss.qualcomm.com>
In-Reply-To: <20251219-qcom-sa8255p-emac-v6-1-487f1082461e@oss.qualcomm.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 20 Dec 2025 13:46:43 +0100
X-Gm-Features: AQt7F2qpxOToWQKPYlABMJwLqho0Xychdf9rQln23uKf9MMkpqj4U-v6YeXkrYo
Message-ID: <CAFBinCAXb87FKwA_=UEx5YTekevVUun1gieUfMux=oQAgjZS7w@mail.gmail.com>
Subject: Re: [PATCH v6 1/7] dt-bindings: net: qcom: document the ethqos device
 for SCMI-based systems
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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

On Fri, Dec 19, 2025 at 12:42=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Describe the firmware-managed variant of the QCom DesignWare MAC. As the
> properties here differ a lot from the HLOS-managed variant, lets put it
> in a separate file. Since we need to update the maximum number of power
> domains, let's update existing bindings referencing the top-level
> snps,dwmac.yaml and limit their maxItems for power-domains to 1.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  .../bindings/net/allwinner,sun7i-a20-gmac.yaml     |  3 +
>  .../bindings/net/altr,socfpga-stmmac.yaml          |  3 +
>  .../bindings/net/amlogic,meson-dwmac.yaml          |  3 +
Amlogic SoCs have up to one power domain, so for the Amlogic part:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

