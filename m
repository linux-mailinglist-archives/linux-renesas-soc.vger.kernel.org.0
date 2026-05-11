Return-Path: <linux-renesas-soc+bounces-32393-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBi+CWL6AWrjmwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32393-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 17:48:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 97126511881
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 17:48:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F7ED3068E62
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 15:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 593FF402426;
	Mon, 11 May 2026 15:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gtTNE/CY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3286540244A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 15:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778514049; cv=pass; b=BTEzSmnCEPcPeVO6pLnfUxZOG+aD4u+7sgSGLiNLmOHK33rgEed4O9PI/siiz9OVaYcuZQ1AaP0KysWZ97yRE9ykosCcxl34cexcbo41lq87mYnJMfNpsvQ34Ds1l0whs3McmcjqJNmUx6bFGWN4b6OJEfjZkzCkLoxjDy/bwNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778514049; c=relaxed/simple;
	bh=iCAqFcT9NX3fZjkDKNrQDg8D+ochKGSkZTc2/qvY8WI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uWUvHTKdkypNMDbX8Kj8VLsUIQ/h0/e5y+AlKsaQKpj1Ve0E1mgLXEGUEjWH+7qtwRdHMO8uOr88a8EZby3WweRKMuVsTSDVW4YH7HRlNzivrnmPTP3FCZ88E7ZJx94clYI9Xy/VXy8aT4VZuD5UxWcQczd7OxxBmxYNchoXL1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gtTNE/CY; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-393d6025f99so38759121fa.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 08:40:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778514045; cv=none;
        d=google.com; s=arc-20240605;
        b=DPQjUr+YiX7zGvEKoPw16MfNpEQ96JfwRybvFkTW2T5ee1basnAA4h9XRNRsu2+rXo
         Cq/LzcXCkTnEhruN3wbWUfvW/3Y2871Hghmofwa1O3ZwYV4RrSgioMJr547/efWj1act
         Nv/hbtg67FGq3Jmiu+9/YD8XWMI82Zy++Gsgt3QFAo8xMyC2JqP1jBiRd+U+R590sFEQ
         DU7cJ3iQa9Pb7qAqerI0TuXgtDshQ12Qs2n2dufjawuNn51CS//xL4cq45X1leCO2MOb
         coarRVVvIYZxVOq8xfT3YD+Ztfr+HNZV1FO8EoYGqUtycQKviPpfELWPDeGNpX20C4uU
         Gy6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3JWMhWSTBa1St/FT9EYONC8eNpWkZ18pjlnscArsjYQ=;
        fh=el+tFLjpu+7h4yQ9+Ywx4lzyhNLuqT5FB+nUZJQDJBM=;
        b=acw8ajAv+UEL8C8w12M+dY76aQ7G2B8WxVf3VEPqkeAPj/wa1OjopPnroMl1fIO/Wv
         hPN7MmzsUhZEf3+5C7MNcxufHueM3UTil4brDlFC//zRB8F/Qy7oua9glOoYaj5Tbnyy
         +agdgtPN+7eMT2jMMDDv9MPIVHtBYGg07cPfbbkdvBH8R5htLQmsovgUGsuStSwpWKva
         p8g+eMYIpcD+yDgkb0pKcMBK7pvhVuVK9/wt19dxXrX8uejY9pKbIxf3xEZ664B6zTZ4
         MiHGvIqAR91GljymYmqB7j+bO0sjkZKPjFdM956Xc6JO3/cI6rAmWmUT8AtZurSKE/e+
         AvUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778514045; x=1779118845; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3JWMhWSTBa1St/FT9EYONC8eNpWkZ18pjlnscArsjYQ=;
        b=gtTNE/CY9GbJFWB/1LsKXb/Wpr5w7kInVcfUuphMLuS/53gvK4+hTQH9ixl7vdg/oP
         XB7SyPGemFLi3xo+Wq6zzry6vR45B/MSaFpHmXEoFGtBV4HeXo1kw6iHHnjipPU3DLKQ
         kv0q+U+LPkk5B07pyUx5P/dx/Dsx5uVcY3I5RDv+L7c0F9LfgfqOwnFihNGoqykti7Vz
         nyV9gPEgrCMFooYKB2BwtV3l+P/OqIwulxh3FyZn29Ms3TBl1dU9VLB2SsANOK1Q9QBa
         NClclIG6DxPy6T7sV/U4foTjBgGU1fV+W0WG53HeWYXAQ1Uj3zx/l/CGeCjHmVlmYbvp
         OrQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778514045; x=1779118845;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3JWMhWSTBa1St/FT9EYONC8eNpWkZ18pjlnscArsjYQ=;
        b=sGjVn/JwigLoObA1F+/JHADo0DzNPz/KfrSTmq96MEeH/2hnKVighXO8Jfes/0TERX
         u1xvxqPdhL7r9OTxqM29iMeGuquFZLqazw6OVIjb+hFiijHLu+6VwCki31HGS0OnD9Yu
         xki5aPY+tnAKDEuufNRggXGhhZi0C/fgkKPGrRu5ztTjDg3mlxog5Is9yLDWLXyMCarp
         n65yiEJTlNdTTrIu/F0UVRbHknjYKkPiIkLoRb+GhtHGo4M/qiMFGPTY9fkZrwI9Nt1Z
         QIlaxfbjIu635PQYzHYjn3vsf6XGbhlqm26uzN0BlO2A7EQyQgMl3O597hto8bsTVLXh
         U8eA==
X-Forwarded-Encrypted: i=1; AFNElJ+rS4eXqVOqIB15tFfvzjr0fnEet6yUn9WJJpmdkU8Gy+zRAeEUsX8kWvhzUJyDQOS/DRp7c5/fXFGE56Apg0jIPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRQa5Xul4tmwFTQo5BZ+GCwBwPiBxdlVoCv1hn9X3SQ9huLASB
	NT0s/cUMTCw+dkwjxvZp8w0w0kyWY9zgTuGVguvSxZAEsigPIpZazqnLAhpPZ5jTnikB3m3O9zY
	NM3+uNmUw1/HVdG+0W/a7pCjF3QhSEb8f14CDEwDe3A==
X-Gm-Gg: Acq92OGp8h+JfObmbSVLKg15lWmu5/cB6fuJO/deQXO6JFQIHhTcLHC9lnQ7LrKJYUz
	qh0D+DwfwdIOONdpM4PF9dPGX+CMZ+bI5fH/f5MnESfJdpqs6kL2t/I88tVDivvmbgFO3vV67dl
	w4DqVUeJ6hUYYrcqlgmAewXCPxMu0huxmHZhRZ+7XFTu/NClTb179k5qLfYU+BlevHo+VOZBV/S
	hrG8NAsxCdHYfmzDB5yqPc/9CR1eg9lK+iX/xStxyx7D/c+NwY+8sng4kzZjWng0hNGE5TypOwt
	jtQIf8Z+
X-Received: by 2002:a05:6512:1081:b0:5a7:4912:1a50 with SMTP id
 2adb3069b0e04-5a8e0f2ec60mr10052e87.20.1778514045188; Mon, 11 May 2026
 08:40:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org> <20260504144534.43745-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504144534.43745-3-marek.vasut+renesas@mailbox.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 11 May 2026 17:39:53 +0200
X-Gm-Features: AVHnY4LEtYRDfcFkDKKMsfq944FdAC52H0vJFxs1kLbNHgSvbuAlOvG-QOqCQEs
Message-ID: <CAPDyKFpO5RyaSGRZibAsygRcfs_En-TohTOrO6a7dUdVdzcuxA@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] mmc: renesas_sdhi: add R-Car M3Le compatibility string
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Brian Masney <bmasney@redhat.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 97126511881
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32393-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[lists.infradead.org,redhat.com,kernel.org,glider.be,renesas.com,gmail.com,baylibre.com,sang-engineering.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,glider.be:email]
X-Rspamd-Action: no action

On Mon, 4 May 2026 at 16:46, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
>
> Add support for the SD Card/MMC Interface in the Renesas R-Car M3Le
> (R8A779MD) SoC. R19UH0260EJ0100 Rev.1.00 , Dec 25, 2025 Notes 7.70.
> indicates that HS400 mode is not supported.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Cc: Brian Masney <bmasney@redhat.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Ulf Hansson <ulfh@kernel.org>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: - New patch
> ---
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index f6ebb7bc7ede1..b716a518f2650 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -285,6 +285,7 @@ static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
>         { .compatible = "renesas,sdhi-r8a77970", .data = &of_r8a77970_compatible, },
>         { .compatible = "renesas,sdhi-r8a77990", .data = &of_r8a77990_compatible, },
>         { .compatible = "renesas,sdhi-r8a77995", .data = &of_rcar_gen3_nohs400_compatible, },
> +       { .compatible = "renesas,sdhi-r8a779md", .data = &of_rcar_gen3_nohs400_compatible, },
>         { .compatible = "renesas,sdhi-r9a09g011", .data = &of_rzg2l_compatible, },
>         { .compatible = "renesas,sdhi-r9a09g057", .data = &of_rzg2l_compatible, },
>         { .compatible = "renesas,rzg2l-sdhi", .data = &of_rzg2l_compatible, },
> --
> 2.53.0
>

