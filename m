Return-Path: <linux-renesas-soc+bounces-4094-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E405788D847
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Mar 2024 09:01:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 987492A3669
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Mar 2024 08:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 878792D611;
	Wed, 27 Mar 2024 07:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bky9xrGB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969BA4EB29
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Mar 2024 07:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711526292; cv=none; b=tSqrFHq4I/KtKLv/CvTQ5ZO86MXkZI2tRjmLEpBDdkIaw5Z+2iypNZp+04y46JPgAggtNXd6VVMdYAWiIlXsqmoRgpluvpJzTf1SfLfESqQX8zZA0BTQcDhXRCQ2hu31q5UKZXvrUfRFPKUg/O14n1nYM8Vcj07o3er6kUXPHZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711526292; c=relaxed/simple;
	bh=AdvzqVk7O5Om9zYVogxzKc5FzxJiG73Lmt6jW0x/4ZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ILtd5DI6Sl3LKtc5kf2Nhe4+0Fo4gho9hndcxW7kVfQY4lr08a4h7zmL6dy9I2/LOj8XXOu36KpG1y9HLXS8P06maSiWbgqteOYaYL/wr31xpvTYrNcKxXDpP1X754YXd2sFB1E5Zw7vgSR2QFJ4ESMIVbWrv0gxg6Py4wjs4TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bky9xrGB; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56c1922096cso3333081a12.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Mar 2024 00:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711526289; x=1712131089; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TDy5Illrx70H+5XvK63d5lpudD3g0VrV2VxsSwir7fI=;
        b=bky9xrGBNrfAkhg94g5H1u4pD7IqEDFi9mCnPvfnoXbHGRxw78DK3o1tBOpZuWBApd
         faaMRakLX79o71Vz8dzusuZ02cfxpMp4B7sGgmoJjvTxxu2XF6bQZma0gcU1EkyWhV0v
         IqB927ZYr+sz3ZTE7J+PnIQmKpDNiAUUeCqOzTWOwiQ305ZvbbnbgJtlT+D1OEuSKN5x
         IAgRzhWu/pEqFXPV6029rCr1ilkJp2s552UWlfmzDIQK89rZt9scULBjgqZtRY+3U6yQ
         D2U1cCjQgrRvwf+M6/5rqDI7MpPdG8n6HKViDz7h8fDo97mpOdFXHC28HRZQU/1NTmSt
         3VJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711526289; x=1712131089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDy5Illrx70H+5XvK63d5lpudD3g0VrV2VxsSwir7fI=;
        b=ON0nJSF/QOFwdZJQGsfa35jN9/AV+jIWhaNS5apHKwOKWrpPY8w5oiWHUET+es2edF
         kor1K8/y2VM8C4ErmlbfdwPAndY/PiQ2OZqUVcUK9I0YdKyECURIk0XIQQBguMhoTuf/
         dGSCVlNsA77gP/oKjTpCrGjGi8fe6/GnpqiMM+NUABCTfmu87klPT6GcqwHPeoaRTi5a
         G4dl0pmwLJLh9m1efgERxrCbaQH6pbsr3gwoqfd9W4NMwkx/crnI7e212TzGXV52PamI
         RjyEuq3XVrMgVf5usPrnaoiT2jH1D76GipTcHnIw3IqW2boxdAyiNs7Gj4i0q1iBx7lK
         ZjHA==
X-Forwarded-Encrypted: i=1; AJvYcCXjYSpfr/57uzZ8mD+v6m+vrHVS0gloW1tX8HFrCnf64RzLaONeNloGtizPU/9V4r4NCjIKTGtUtwRDpxMOcnCc1mptrFN6+p9UjsQKfDB8zaQ=
X-Gm-Message-State: AOJu0Yy68rWwQeeji47ZYqv0gCbJoWGWG//DgqNyPCCe6AbKQz707x9J
	VX4CKyxGC2jw43OuN8V2ozloDE5Z06xyGf3siyonbYicgtTBihkaQRVrqMdSZBI=
X-Google-Smtp-Source: AGHT+IGysvCehLKTeF+GjCKTXRvqk8xpwQLSopHP/oRxr76MQGD8YVIJzklfhmT5jk0MinBjuPZBbg==
X-Received: by 2002:a17:906:3c8:b0:a4d:fc15:4e36 with SMTP id c8-20020a17090603c800b00a4dfc154e36mr1365984eja.16.1711526288645;
        Wed, 27 Mar 2024 00:58:08 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id kz18-20020a17090777d200b00a46bdc6278csm5050261ejc.71.2024.03.27.00.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 00:58:08 -0700 (PDT)
Date: Wed, 27 Mar 2024 10:58:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [RFC PATCH 07/13] pinctrl: renesas: pinctrl-rzg2l: Validate
 power registers for SD and ETH
Message-ID: <a0d7e6f4-5f4d-4601-857a-c485cceffe3b@moroto.mountain>
References: <20240326222844.1422948-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240326222844.1422948-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240326222844.1422948-8-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Tue, Mar 26, 2024 at 10:28:38PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> On RZ/V2H(P) SoC, the power registers for SD and ETH do not exist,
> resulting in invalid register offsets. Ensure that the register offsets
> are valid before any read/write operations are performed. If the power
                                                            ^^^^^^^^^^^^
> registers are not available, both SD and ETH will be set to -EINVAL.
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Where does this happen?  It doesn't seem to be a part of this patchset.
-EINVAL seems weird here, but it's hard to judge without actually seeing
it.

regards,
dan carpenter


