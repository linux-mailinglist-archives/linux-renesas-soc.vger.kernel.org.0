Return-Path: <linux-renesas-soc+bounces-15534-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B85E6A7F47A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 07:57:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B2797A6577
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 05:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5915525F7A7;
	Tue,  8 Apr 2025 05:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z5rDNOzu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC8825F78A
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Apr 2025 05:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744091843; cv=none; b=cXRvdEU4Oq8L0jwGuTYa0vqCSSSko1Pg8kRVgravHl7gkRTljOzY23ygP+ropBAIpCwQvgjwLFKFuXUHbOpF+VjchVW6H3QYBGqz6pA4PzOZm+KU+UXxMtWWDYU6VasXm7pMoHpkEDKmA6e3m+MtmHML90H+kDlOk0ANx8vKXhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744091843; c=relaxed/simple;
	bh=8doy6BPiTFR/YKQpo3lR/yUwQX15c/frOMlav3ozNUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DdqmsNihdLMGg/q9hdTXdKmWEMH6DD3lYSPmvRBU+rPPnjFB5HDNYAcALW4noXyq0ljNqC+qpr7AcZxOVy+N7EGWzPwKrDjB2kAVGK/VWsGj545XpuU2gC+mXiA0bJ3N+mpV509jdQz5Hy0cRzHQMZiruj/gtWlJkOBCsdoaPws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z5rDNOzu; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3011737dda0so3804154a91.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Apr 2025 22:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744091841; x=1744696641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ntWAqYw/FbTf3Hq91IVHWRfD1c0otTEdS+CQ7J427hE=;
        b=Z5rDNOzuBQvyuDNrKy2P269s0ejKtK6vbzQo/y23vsVY9AKPkpowPYhA5tFknWCqAY
         B7sIQZbDXW05/zjt4SfDYqDz1DliHNyGLxRkqzUYO2EXT2DHol2D4VRapZR1bP2cTDne
         p2MydcPR29d1bIxXN1VKP+QVnfX6iuFhiwcQRDU9HGImPXbSMJPU8b/Ps8V7U7IafxCf
         B2DsQWdMj54gu7EKUVF+FxdAwOGYzsjPEVNVfQtiMf9cuaVNeQhEdEiBEd5u+9/IIVDu
         caPXVsvTU9x5gFQ/tRuIoQpLZIeKmG9SFRvxS4U53laRJmLiGpq3lMNg6oVJ+u7Xyb3k
         T5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744091841; x=1744696641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntWAqYw/FbTf3Hq91IVHWRfD1c0otTEdS+CQ7J427hE=;
        b=wFe/lGyFZ1/Oa2oFjGxvw3sX3VbJaMaSgtScaoIGYiaFl87YEdSNzBnsphFBnGPESj
         6qakHa9u8s0b7ol+dH0JGjvXsYUSVdHf7TD1yXJIuJLPSDAjCxpBSDnBEQQvfHIjBXJr
         IWD7I4F84JAzDBbXp7Yocja/vbHVg9MYm0ZV3t8jgfzOZxTPrlRqWy7C4AUoS9EMUwSk
         RaB7/7B9yLyBUAl4m0EdTwxv3hfDo370YGGotyxByVH8tkNm4gGjWK3+z4Uo7JK+xwEx
         3hMJsYZT2Ks6S8TBRHGhk/HLvOmxtjV1FEp/vYW7f7Z3bKV7j3ljbBj8Xv8qq7DhWUH9
         1e/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXDWISGXbu8EqRei3NaKrtw1aE0Rpck9DxN9HjoJaVJiK0eucSnrf4R3ZnH4B3FZotOYYTTgpahFrTdTjG24nk1Aw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQT9DBiw7gCGa7qdvptDWGaDsl+qLy0tqkvUqAnMp8/HXKvPn3
	UUUYLCfDd5vBDmQ4Rk21exSgBx5eMtcyu+4oedaUpSyXDKW9ins1jPtktgvWTWM=
X-Gm-Gg: ASbGncsEVnTsy0LGYszo1OH1lwnqnnMMF5Le1PcSj+6f5YR8g3//NEeNuHiNxzVQm0l
	X+JMsg6yCvR/EPJ4D3viUWQU+e++kD88AJAG7dHNs4WNEiJCzWSgl5yJvd6UXwNUKB44LwI1LdD
	2es6NAl+l6DeF2dgnJJMis921Zq9wQzXcouhgfkaWYoUahAGWX2FnqUfHgmajqCxpzjnliI3mzU
	c5XnM+vY+4gl6QTVDAuFHiczPxqcy5tiqPgIZ+WEEMRAlipK4D2BswK6FtjRRbpB8ChmU45g0nu
	c3eFvAEXdnT2ujxy+Tfh+qwI5eiU5IVyNTCbWyZXA1OFwg==
X-Google-Smtp-Source: AGHT+IHa7mNtQoh2kE0P3zD2ru6aZMt+A87LdNqpNKujZXMzxAW0s8D/vDJRFgVZKF/JyFi3WYplYw==
X-Received: by 2002:a17:90b:2d08:b0:2ee:9b09:7d3d with SMTP id 98e67ed59e1d1-306a4894cd0mr18110280a91.19.1744091840732;
        Mon, 07 Apr 2025 22:57:20 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30588a3140asm10075622a91.29.2025.04.07.22.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 22:57:20 -0700 (PDT)
Date: Tue, 8 Apr 2025 11:27:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
	Conor Dooley <conor@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mips@vger.kernel.org, imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 00/19] Arm cpu schema clean-ups
Message-ID: <20250408055718.4azlqljvo4qxhnu5@vireshk-i7>
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>

On 03-04-25, 21:59, Rob Herring (Arm) wrote:
>  .../bindings/cpufreq/cpufreq-mediatek.txt          | 250 ---------------------
>  Documentation/devicetree/bindings/opp/opp-v1.yaml  |  18 +-

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

