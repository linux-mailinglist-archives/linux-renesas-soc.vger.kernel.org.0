Return-Path: <linux-renesas-soc+bounces-5988-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85614901AC7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 08:00:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F30C9B23D8B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 06:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50DB53B784;
	Mon, 10 Jun 2024 05:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="OX5FfR/X"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AE339AF9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jun 2024 05:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717999062; cv=none; b=fjOJTDoRcg+3i3hyrLEaBYdQAbmi2Ju+N6KY1TV0L+oqdj5G5pwLEBaf9ngu72kb78oLsA+o+iHi0djyYNtBu4iDaJxoT34NRanhuferVFA3DzXp/JRg+bMNod9n0GX4iXQdvP/rh8DC6bOn3q59B1UYfHzcpSNNuEVk3/aaqFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717999062; c=relaxed/simple;
	bh=H9e1DtrBKyasjGaY6GRjDrdJMaI7XGOcU8lHh4uKUgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C2iriPK6C/cWzXnXaGVf3HAtSBcNDMCMSnNBSYrJzs14JP6pkP8bilFvqUtQ1SwW3MlQPKmltG8FtSCNA4x+UySZNZpvjo/w8Q5UiJtISDayKDAL7EE5VyU7Ox0LhWU2ui1WvrStUrZ2aAJeRjERJhvUINh1ffSE4418Xf8r4RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=OX5FfR/X; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-35f275c7286so220010f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 09 Jun 2024 22:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1717999059; x=1718603859; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FC/HmJJiWdO+PsgBiIdzngU/gSiU+MnAOVhV61bqZaM=;
        b=OX5FfR/X5NI7YtAupgZVf6dCXy7GZnyRCkiiasrFCP+Yq9CrZ9MymBm+o5Nash7v9f
         QfumGyi5Lac5R1sDTeSHORYcOT16s+b3s98mbow9mGSDGe1jZXbi2ODTebYnCk5NU7pn
         LPxKFknCoG392FM7VmHVHtAEFt5ynz+U7D7Mm59MYQKdJ2VNfQnDWR2j95s06gWGe9VU
         Ripnkk4d+9XWFbmncqwQmAwmuBEY5YravRq+vNztcAIBGMUutW03MgoLo5HR/3cLpcR5
         iF1nOltiloOOiBJHCW9NWqfUbTMgw9CHl6WBGGLnIlbwaV1HPjP+pHGa1MpddFS5W8nI
         56oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717999059; x=1718603859;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FC/HmJJiWdO+PsgBiIdzngU/gSiU+MnAOVhV61bqZaM=;
        b=ivt0XsWwiGKrInSj2r3phLrxucQnrRQeD4mNQLk3evLJ+CG78cZR+RxrWMW5MST+Zx
         Pl+jDPpjSrNfwSic2XWD174K5QOMnkf0+76wLnOGQT6fI4uaiYvdvRJcgSuFvybryDpm
         9aIvPGa6S8sKcC7VcGaGqdG8MlibxlHGOWmuzhvP4iVvpirZPPl7qiVyX7NzaaNVbNU0
         7eju4j+NudRiRbTZy1abCs5UCBbL22R2bIrHf4i249vTmAwwbjRdkZdg4wZu3v1fuZAy
         P3aYrfsW53dLHx44By8/XpV3iy1ZP0M2JFkl8ocWpQTLFSv2xgWnRk+t/Tlfxt7uZCHp
         jmnA==
X-Gm-Message-State: AOJu0YwWF9U8Y63PjiVm1WEoPpsIhxXOiYIQNuPyfCi6q8tGbL4j/Rjo
	xW1JxBMn974SkdZ95TCfxEC4mxzibo6o5+NzXVqjsfFDpuzgGq6bHgKKbkQykvc=
X-Google-Smtp-Source: AGHT+IEtjY19VU7Eq089Pqm61jMuYTQI/xyPIM77aNuSXET+VPetxzvIJkA3ZyLcTqGk+vK8y9ETnw==
X-Received: by 2002:a5d:634e:0:b0:35f:1384:de4d with SMTP id ffacd0b85a97d-35f1384e1e3mr3120844f8f.37.1717999059053;
        Sun, 09 Jun 2024 22:57:39 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5d29e57sm10097602f8f.2.2024.06.09.22.57.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Jun 2024 22:57:38 -0700 (PDT)
Message-ID: <b139a965-607a-4245-91b7-11ef9fd97082@tuxon.dev>
Date: Mon, 10 Jun 2024 08:57:37 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/15] pinctrl: renesas: pinctrl-rzg2l: Pass pincontrol
 device pointer to pinconf_generic_parse_dt_config()
Content-Language: en-US
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240530173857.164073-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240530173857.164073-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 30.05.2024 20:38, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Pass pincontrol device pointer to pinconf_generic_parse_dt_config() in
> preparation for passing custom params.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S

> ---
> v2->v3
> - Included RB tag
> 
> RFC->v2
> - No change
> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> index e60049b66203..ea1a08d272a1 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -532,7 +532,7 @@ static int rzg2l_dt_subnode_to_map(struct pinctrl_dev *pctldev,
>  		return -EINVAL;
>  	}
>  
> -	ret = pinconf_generic_parse_dt_config(np, NULL, &configs, &num_configs);
> +	ret = pinconf_generic_parse_dt_config(np, pctldev, &configs, &num_configs);
>  	if (ret < 0)
>  		return ret;
>  

