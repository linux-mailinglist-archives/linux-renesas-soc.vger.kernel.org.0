Return-Path: <linux-renesas-soc+bounces-1880-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC7E83D997
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jan 2024 12:47:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FA7F2840F6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jan 2024 11:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB5F6C8DE;
	Fri, 26 Jan 2024 11:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="dyfaE2yP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5AB18AF4
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jan 2024 11:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706269629; cv=none; b=X8z1r1C0lELyZSFi72kPsbOEcjFcC/qVKXo1eVzwYz6v6ldnGue2NrELvRGFNue/TzXW4Wbk7cDbYwe9uQzGnFyfqrMfc/oRxqVFrdV+5aoGka+wzJt3wL0O3WOrnvaKiON5UX6pr7scg5drBVWUdtLeHzKVKTLIYfk1qNpirh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706269629; c=relaxed/simple;
	bh=Fzn5aTU/wBPSf1zUPenkIbOxudnMpZQHdKHrGpDg/wU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MpJxqswJxUg1m80pqMR+NOHQWIFZzJYDVGRGVjcP2zuRpzKIugWK/yp20fU31jjsdMVONt+uKvCgB+EVsvYtvAS0TfuYn9b2UqBgNi1Gadot21PjhU6E5YXyDq931fK2XtlfddXx4AhqnFmHOqUpK9clY+vYQVfzI7YfZGxyFfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=dyfaE2yP; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51005675963so849575e87.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jan 2024 03:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1706269624; x=1706874424; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zdv2ygQ7vo9GRUoJgp1DUlGW5BXGV7G2ipRGNGIcfKw=;
        b=dyfaE2yPlLnb/ATfvSbMlCzTWdcee2aW/FpzSexb7e1ETuTfK9r7LuS7LM23zRZ8DV
         S5eBO8UzyqcR8i99A+16SwDD5HekMFxeEk02YaUx6BPq9noRfgwQHmGvX4sYQsDYOlO4
         SoIdaV5MD+3+xmwF61I0lE1GnBGU3NktHO1mKYLXke13M9VCMG7sa37b+LooXJAOd7rg
         937wYa5ktp6YVEt4hm4jp187cDkefJGEIqYG8i2K0Vnn5Iy7fUG92i877fBuEE3Hb4jx
         zbcec6y60jXyp+QLyghtMU6ucWXhHV1n/gyJuBU9+PEDe0IjomEbOuZXtikKNR9m0/94
         3gVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706269624; x=1706874424;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zdv2ygQ7vo9GRUoJgp1DUlGW5BXGV7G2ipRGNGIcfKw=;
        b=xG1JR5FsOy6H2BK+FwcksnMsnDAu1qUZEOkE5GY6jdUCAoB1r+iw9rJdy8IO12hIkm
         3Pa1S/9DtaeB3aQHg7R0+mhtL4AjX3CuZTHwGa+jUCGQSBGaK1TryDvtm4D0pVJvUMth
         joadsHlS7zYAil4dDTVD8aeHe967IYDlG0lbKkRPC0ZGbe1ys/Zw5KxSMMhdYPEeT34c
         bGwNOvSCX0f0PKPNF9lvIPJ7Z7Vy7+XWe4uwQZ9x5jaqnOHmZPX5lLczBfnPMRddi4Yn
         D2KiKNYM+NgYIFSgJ/TmdrMHBKe1rYLBdcWmTlHNzpbEe6Y1J11MEmFzJDEkvvYXE7qg
         T8qA==
X-Gm-Message-State: AOJu0Yyo2HIATVm6PdHlOC7vIsU7rXhspCIZWvxv6/3aDxScelEy5lSs
	mVHBMc6ryi1rsULajEsTCb5b4aoygwXQXwnBojNtEAJVx91Al/1X8RNl+c0i7L8=
X-Google-Smtp-Source: AGHT+IH5PTVbhhKlKF/N6kMO4xf1LaALEvFmrmh+1O0PQzvy2Nwj0QL5nVvE3oPial+rWupUyvXzPA==
X-Received: by 2002:a05:6512:4026:b0:510:d4a:d360 with SMTP id br38-20020a056512402600b005100d4ad360mr571601lfb.2.1706269624515;
        Fri, 26 Jan 2024 03:47:04 -0800 (PST)
Received: from localhost (h-46-59-36-113.A463.priv.bahnhof.se. [46.59.36.113])
        by smtp.gmail.com with ESMTPSA id z11-20020a19f70b000000b0050e2782e86dsm156057lfe.184.2024.01.26.03.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 03:47:04 -0800 (PST)
Date: Fri, 26 Jan 2024 12:47:03 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, Cong Dang <cong.dang.xn@renesas.com>
Subject: Re: [PATCH] clk: renesas: r8a779h0: Add PFC/GPIO clocks
Message-ID: <20240126114703.GB2046261@ragnatech.se>
References: <a7d8f4111b87decb825db5ed310de8294f90b9f9.1706266196.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a7d8f4111b87decb825db5ed310de8294f90b9f9.1706266196.git.geert+renesas@glider.be>

Hi Geert,

Thanks for your work.

On 2024-01-26 11:50:56 +0100, Geert Uytterhoeven wrote:
> From: Cong Dang <cong.dang.xn@renesas.com>
> 
> Add the module clocks used by the Pin Function Controller (PFC) and
> General Purpose Input/Output (GPIO) blocks on the Renesas R-Car V4M
> (R8A779H0) SoC.
> 
> Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Changes compared to the BSP:
>   - Change parent clock from CL16M to CP.
> 
> To be queued in renesas-clk for v6.9.
> ---
>  drivers/clk/renesas/r8a779h0-cpg-mssr.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> index 1259b8544980f07a..219941047291d34d 100644
> --- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> @@ -177,6 +177,9 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] = {
>  	DEF_MOD("hscif1",	515,	R8A779H0_CLK_SASYNCPERD1),
>  	DEF_MOD("hscif2",	516,	R8A779H0_CLK_SASYNCPERD1),
>  	DEF_MOD("hscif3",	517,	R8A779H0_CLK_SASYNCPERD1),
> +	DEF_MOD("pfc0",		915,	R8A779H0_CLK_CP),
> +	DEF_MOD("pfc1",		916,	R8A779H0_CLK_CP),
> +	DEF_MOD("pfc2",		917,	R8A779H0_CLK_CP),
>  };
>  
>  /*
> -- 
> 2.34.1
> 
> 

-- 
Kind Regards,
Niklas Söderlund

