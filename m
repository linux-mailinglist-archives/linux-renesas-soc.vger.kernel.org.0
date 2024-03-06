Return-Path: <linux-renesas-soc+bounces-3514-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 871C987366E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Mar 2024 13:31:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B482F1F21200
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Mar 2024 12:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D87082863;
	Wed,  6 Mar 2024 12:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="QxQExzBL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF8E823BC
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Mar 2024 12:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709728245; cv=none; b=o0+gHCen2k2EzNer6HF1CYuw5HBatDsiNrZufLNUupSMRyGEb/d32YntzbDrS9/pdfbLiYr6Dg6gtIky7+in+wEOYn+7O9mqDxTXcUOPKqCGXbvoB2JanbEGpCpEuQRR+Qnpf3daLgD/DkKd+ajlfGE0y/5bLyqQflDU+J4rO8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709728245; c=relaxed/simple;
	bh=PTcII2kQV2pmaV0bp5yVc1A3TkusgNPV9AvWwya2aM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+eMgYZy1GmViG/78c0pCYMxqpfqYOXKYSUkVHf4RUudxQc0317a575bRuWfyMZRjftVcjxNGPemz5hNcDQeAnhnxBwhL7ibeWEghQKO9mHhi85jcMWciURZtiSAp9AuvUIKjzn8qvTMTR0ouVX3MGWKbfHQlULWXwEhOXPwPas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=QxQExzBL; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51336ab1fb7so5747702e87.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Mar 2024 04:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1709728240; x=1710333040; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FWwYydqmepf5IjC8UK5UPiYxznThwpO9On1HRbhq+ho=;
        b=QxQExzBLlSRev0RIX7Ljc8LtvdR/VLPbDslsHYt7v/XVD5QDPrDllTvjlaB8TUNvOP
         O9xFlrlt34yHyZe3ooJxYCaYXeeeleoDPveXOWZEIsjWyBjyOhhTshEXQDEuAH/wz+OS
         DmultETQ5tVLlbgjeO6gBjlOcVaSsoU835ekuwwm180/Xgnt9oIovXRR9NwDuKh+VfGT
         PHdauLue2e/yTETgiZXNp/K1hZ0knnxAz5YltRoSxmcrdwM3UmMv4acYAQFX8iAj56QN
         U83J+00/h2pXrFRqjREWK+uU85BQw53VbS+31BiAPz8edQnIU7bfGk8lqXs1G7TPl/Ls
         BAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709728240; x=1710333040;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FWwYydqmepf5IjC8UK5UPiYxznThwpO9On1HRbhq+ho=;
        b=svzOVtlp4I2oSrpXaND36ZgI84Q/HIeJaQZke9pgb25PoeG3OIEQ4Yko/9eJlqhLJE
         vqbGID4foOxa2HVI7MDMX8f69kCYxdoR6Dw685KzVj1toBk+EojkV9MCJzfQXnwnEO70
         VtuzbqLTQNXUYM9ea5s8uqSCXcHDfgki/FmXq3EYoK0+MLDWp9FJ+2spVKTGGUbEr2xW
         Rue79Uo0Tdwgw0G3+gYJQ/SuL2uZ4jz+0qyE+e7KCXtxUXhUxFGczy3gSCyuxDWeEtzf
         1n/61osIjVyYjqzAoDUeKobwjHr+vh4lK/nYiKUBQEaip3QwUbF992p1u+vhsleRevv0
         oDvw==
X-Forwarded-Encrypted: i=1; AJvYcCVV7BVJEAkytGS/dEYgcPwZZC5Un73IXja4aHKKCBFWErcGdut/KPAtxQHnvY7F82tsU67sF32qo1ReAlHLD7xR2tCCesko3ZRKi34yqfg616E=
X-Gm-Message-State: AOJu0YxzS0nvH6TVwZAf8ZS/1QI22goFsfgciK3eDubd+CKidNBhmIwA
	ZsI2LYFzfr0qYzXQKbM7jerBapsaR0G1Vzp1zft6NJsGrzXVNeNqZyWFs3uRI3M=
X-Google-Smtp-Source: AGHT+IFzQxkuAqjr7PtbZ+hs10zWX5jwQjG+s5deSaQKkphYRc/ItJqyZozL2B6+P0S18GrP9IEDhA==
X-Received: by 2002:a19:f016:0:b0:513:1551:f0 with SMTP id p22-20020a19f016000000b00513155100f0mr3119939lfc.42.1709728239546;
        Wed, 06 Mar 2024 04:30:39 -0800 (PST)
Received: from localhost (h-46-59-36-113.A463.priv.bahnhof.se. [46.59.36.113])
        by smtp.gmail.com with ESMTPSA id c8-20020a056512074800b005130d251b57sm2624706lfs.166.2024.03.06.04.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 04:30:39 -0800 (PST)
Date: Wed, 6 Mar 2024 13:30:38 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: r8a779h0: Add thermal clock
Message-ID: <20240306123038.GA3396349@ragnatech.se>
References: <befac3e8342cd552f580d34be863ef84403c541f.1709722056.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <befac3e8342cd552f580d34be863ef84403c541f.1709722056.git.geert+renesas@glider.be>

Hi Geert,

Thanks for your patch.

On 2024-03-06 11:52:04 +0100, Geert Uytterhoeven wrote:
> Add the module clock used by the Thermal Sensor/Chip Internal Voltage
> Monitor/Core Voltage Monitor (THS/CIVM/CVM) on the Renesas R-Car V4M
> (R8A779H0) SoC.
> 
> Based on a patch in the BSP by Cong Dang.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in renesas-clk for v6.10.
> 
> Changes compared to the BSP:
>   - Rename "thermal" to "tsc2:tsc1".
> ---
>  drivers/clk/renesas/r8a779h0-cpg-mssr.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> index 71f67a1c86d80f4c..5c48e645f0c3197d 100644
> --- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> @@ -192,6 +192,7 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] = {
>  	DEF_MOD("pfc0",		915,	R8A779H0_CLK_CP),
>  	DEF_MOD("pfc1",		916,	R8A779H0_CLK_CP),
>  	DEF_MOD("pfc2",		917,	R8A779H0_CLK_CP),
> +	DEF_MOD("tsc2:tsc1",	919,	R8A779H0_CLK_CL16M),
>  };
>  
>  /*
> -- 
> 2.34.1
> 

-- 
Kind Regards,
Niklas Söderlund

