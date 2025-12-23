Return-Path: <linux-renesas-soc+bounces-26056-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 965E8CD9245
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 12:42:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F552303D9C2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 11:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C0ED3093B5;
	Tue, 23 Dec 2025 11:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h1rQc7Pp";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="seSVI+AC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226B02D5A19
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 11:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766490111; cv=none; b=HMi0xkQ7EA6/qGN8usUAsP2IPXmGA4Rx028YAJnmnqKapUbU0V8O9FaqKi3DrVAQba+dNKzF3E3QxV6V9yiUol/FIQEerLJuSrgdG3o2R08SaUiEWF2hlyVgiK0neNnVrjL2lrG7dQm7NVhMveJEM/rfCbFvALJJGAnEgPpViUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766490111; c=relaxed/simple;
	bh=7ZK0bTfGxrRAgf5VD4ybvgyLxH2fzuAcw+Dy5S3bJ1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FRI4yoELArDQEUD5r1dRlytUgZIiF//jnA/nekxNg5UgXtWz8nPURpgv7QLwK7OSxNQqfmuqEEQhhjAMhPUk1zSPdP/Z3CF0m6SNVsFQDQCuVaX10m8v8153m2Yh1lDo7J/2WXY4E5gFjROmCTT96p0fyINNdwn7WwvGFleQVRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h1rQc7Pp; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=seSVI+AC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766490109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6sLHyZjdhjDBt6Tlyx92GjgIeB1OFSYRftB7W+PXVHI=;
	b=h1rQc7Pplv9q5iItizuIk6J+84wY2O997HU4JYrlk8B9zAlYneXcMFqFaYxytGUY/ABEn7
	mIH2jDM4AwTP5qqSYo/A671D+kLV5wKuCxbIjJe0YKlcOm2tlrj9N04ogtRWKKeI7MDHTX
	0o8hdHPrwpDxmN4lbV25LIEJCtFWoVA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-_JBb9unzOgKIeQ8NB-L0TA-1; Tue, 23 Dec 2025 06:41:48 -0500
X-MC-Unique: _JBb9unzOgKIeQ8NB-L0TA-1
X-Mimecast-MFC-AGG-ID: _JBb9unzOgKIeQ8NB-L0TA_1766490107
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4325b182e3cso1423019f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 03:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1766490107; x=1767094907; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6sLHyZjdhjDBt6Tlyx92GjgIeB1OFSYRftB7W+PXVHI=;
        b=seSVI+ACyGL7TdCjJR1I/w5XAHNhRIrOlVc5Fjb+mMTexnmxxpHojS0e0UdSkP/qH9
         CGXSF9enJ69Hh0pTpK9uYxzsqbq1TyFP2onme/cX0fd+YwCZ+a0iorGPo1CZU5NrYX/l
         ACGOr0/Gmws2G7LginlgNmpUmoVFFya7ZHr1C1MwUi1j1GTcA0MqYrtO7tewypgXbuOi
         wwA2+AeVyCvgoxdDlotOVRzcTScuyKIf1iFGoKPvYqyfGmOvdCvlX74wJnnc2t8BohuC
         /vREkhZpMiXsZbuxgjuzCb6zjRpC4DI9FkYqHIxRbpMEO8C4auySCjNrYz1EWO+D2gnH
         Xf6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766490107; x=1767094907;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6sLHyZjdhjDBt6Tlyx92GjgIeB1OFSYRftB7W+PXVHI=;
        b=JbzqcNHkW3iKcIB1sMNWazNCmI3Cb5nYx5nIGiE9C7YACXQn1BzeouV7buO6gAUdEz
         2akrZb/Tfi1M49Y2PPogxfv6A+ixl5juEnc2G3WNlerqRBpTd4G7nT30fbkKFTp+yLNW
         ti63JiC5TFswLfveHlVNxlDs4aSAD+qvJ3/dXz4ED6VXm7yFlspmwGrcivh0T8Du8jv9
         6EckpwWDm7v8BLigPtxpCg/1o/V7klqK98vyAQvVjDGslfv55pPmv2mnu8VKqSWCFPi4
         YkD9/e9tWF368Ny4JHlsd3EjmHLxJ5WO+y4hlDfhHrUc3T9f9iEHKzLKKePJosyGJyKB
         z0oA==
X-Forwarded-Encrypted: i=1; AJvYcCWI2/3343msbCEFGpdDVohK2OqM85VbWaTrniXrZEz/2/GPvyXwK0FlzYTjLQKgUS891dgdd+lE+KFXQSMO9PyOxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzndxuWIYEx/t8tMD7q3GvSDkdffFKCN+ZefIPftlLORQA9Kws
	xYdjFhkIl63cTiKTv9V3glLz6K4pabK0atd3PkBwa6E3WiLYrGYK2C0oPePBpCEOb5cPk5zdHE7
	Nu4wIhEN4DEN/Q9RdjUBi0zlQwt4YxEZ+Q0XGTYOxHs55bGApYt+b80a4qVEILZk5sVm+QDTT
X-Gm-Gg: AY/fxX5uWYOTZ43xdntaxZ00aelrHXQvt5YZSW+6z5QIW3xcKaGgf/fnVUCElPP+Zv+
	GLG57KTW2cW4h50oAobQJuii/t//Sj6WggkkBrM7hXgXNBPB75EAX2iNlUWczWpIx7Le34K6kVy
	VgYN3lgqHSkWYlf0HbyeVnh4rzaNu0CAM7NA6wA8g5TzatBYfpqPRC5GrN6vQnSRCWfe0qzDc9b
	W2+YxKb49askZh54zZFVz6dzPEnDenxCJJoZCjTuT0ZzVk0O2I60NjCO58WWR26dEaLwQTvPZ8i
	aVIolUQNk7CL1+UJts8K3Arsmv2gXnQHumLun/9ggySVvewq6fsxj3hWABWSCNEJJbQSJE08Ucd
	iBCrzy/sIYn5U
X-Received: by 2002:a05:6000:2886:b0:42b:4247:b077 with SMTP id ffacd0b85a97d-4324e501629mr16143572f8f.41.1766490106825;
        Tue, 23 Dec 2025 03:41:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPhaXEvdC/d9UBYntc4O15i4YttaJ4C4olbdEgTOb9sXo4XaU7wPfNoTNX8sKpU6s3I2QtjQ==
X-Received: by 2002:a05:6000:2886:b0:42b:4247:b077 with SMTP id ffacd0b85a97d-4324e501629mr16143448f8f.41.1766490105967;
        Tue, 23 Dec 2025 03:41:45 -0800 (PST)
Received: from [192.168.88.32] ([216.128.11.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea227casm27605658f8f.15.2025.12.23.03.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 03:41:45 -0800 (PST)
Message-ID: <51c7048a-52dc-47e1-97c3-2aa0d6555643@redhat.com>
Date: Tue, 23 Dec 2025 12:41:41 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] net: stmmac: qcom-ethqos: add support for SCMI
 power domains
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Vinod Koul <vkoul@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Keguang Zhang <keguang.zhang@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>,
 s32@nxp.com, Romain Gantois <romain.gantois@bootlin.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Minda Chen <minda.chen@starfivetech.com>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Shuang Liang <liangshuang@eswincomputing.com>,
 Zhi Li <lizhi2@eswincomputing.com>,
 Shangjuan Wei <weishangjuan@eswincomputing.com>,
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
 Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>,
 Samin Guo <samin.guo@starfivetech.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Swathi K S <swathi.ks@samsung.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
 linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/19/25 12:42 PM, Bartosz Golaszewski wrote:
> Add support for the firmware-managed variant of the DesignWare MAC on
> the sa8255p platform. This series contains new DT bindings and driver
> changes required to support the MAC in the STMMAC driver.
> 
> It also reorganizes the ethqos code quite a bit to make the introduction
> of power domains into the driver a bit easier on the eye.
> 
> The DTS changes will go in separately.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Quite unusual SoB chain... I think it would be better if you could stick
to one or the other; also the subj prefix should include the target tree
(net-next in this case); finally...

## Form letter - net-next-closed

The net-next tree is closed for new drivers, features, code refactoring
and optimizations due to the merge window and the winter break. We are
currently accepting bug fixes only.

Please repost when net-next reopens after Jan 2nd.

RFC patches sent for review only are obviously welcome at any time.


