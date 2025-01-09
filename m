Return-Path: <linux-renesas-soc+bounces-11978-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 426E6A07480
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 12:19:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D0CF3A303F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 11:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 668ED2165F7;
	Thu,  9 Jan 2025 11:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="iWroFgmD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDB7216381;
	Thu,  9 Jan 2025 11:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736421592; cv=none; b=VhPiJ04cCYPRTyHC8pqtKhZVHrfzGZFqm2Evr+RPUNX8ahuLZYaZK5jQ9n0p7B66uMONoYomfm+UtlE61MgxAi+JELscG0uFJgMJxT0MV9Mas4GCsEw7REQJKzB8edRbV6ywIym2w/QxMcznLXuPef2e8jWFe1KmTWCQH8PGIPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736421592; c=relaxed/simple;
	bh=MYB0yAjxoyhbDi50XtUpsGNrWVikNTnxxJs1VA0CsbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IWkPmLYaNF7PTIfSA6G+37hbezfhtBZpltJ4uURT5MIU2QQfhTH0XRDrRBaIi6AUHxqYGQRrVF4UStHrEw8On0wOAjV4zdjH7VHoC2ID7hmRimGqsvs3u3IRBMQYTn6cqz4H5gphlpvFdWhHmLmPYR/WM6i4zox8Wu6mQq4k/pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=iWroFgmD; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736421588;
	bh=MYB0yAjxoyhbDi50XtUpsGNrWVikNTnxxJs1VA0CsbI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=iWroFgmDaUTpLUd/8EIbk7IAg3CIGCAnaZsv3NRCD2+VrnXKIHLbosH5aqXEeg/V4
	 yNHSOKSWXGqYFCCWhbMN0eZxPnY5zChZnn0zqfM3+IATOdJtsZizNWaQ4n39DTvm99
	 /CJd9kPdfpxcl21X70waImqyrCXSNCqU2Wo0nam5Lfde3eVl5K8+oGZkGcctX+Pwej
	 ndy+AF9omDIwmBdKM3UBdV6kjg6pMpUaMbUeLte6MN8VzlrV3ChckLSvjfKLNjyrHn
	 sdmVt41fdGmTLwovY5X6D5TxKeVN//bqIgE9QRKqV0u55jZtEhSqh2sEv/o3LnbXiE
	 MqyM3xsDLnwFg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E98C317E1569;
	Thu,  9 Jan 2025 12:19:46 +0100 (CET)
Message-ID: <1e442fd4-1361-40d5-a152-adb16704a982@collabora.com>
Date: Thu, 9 Jan 2025 12:19:46 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: usb: Correct indentation and style in DTS
 example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Justin Chen <justin.chen@broadcom.com>, Al Cooper <alcooperx@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Benjamin Bara <benjamin.bara@skidata.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
 Tianping Fang <tianping.fang@mediatek.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20250107131015.246461-1-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250107131015.246461-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 07/01/25 14:10, Krzysztof Kozlowski ha scritto:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

For iTE IT5205:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



