Return-Path: <linux-renesas-soc+bounces-16802-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 677CDAAF7C3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 12:27:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 216B61C202BB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 10:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C12EC20E70F;
	Thu,  8 May 2025 10:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a+KPeXe/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A891F91E3
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 May 2025 10:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746700054; cv=none; b=W1nWBZX0B04VuRRJ5Np8PVKLuKx+s+22XeRwYF+mPH+uCPFyNaS3zxzs6EcpbhaashYzhSYq68yEC4aLB78irmvXLYAYMx+vBpL+qf3rkSBJSin4xsuJ5MK9bzlzy3bIa/E3/oxeA/F4uRzWFVp2s/RmLwqsK3qLPbXxLkpW+bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746700054; c=relaxed/simple;
	bh=Wg1tIXtF7cdE4BVkY3U542fb6E3QI2pSyqedPkcT3kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kf3h+MTo8ME0cBOGPQC5t39ny5+026FK7dyHeYijNGKxjTtRi+OcmvmxBUhkgbLl8eY4czRMm9QAJOKk4nnXcqhH2bRdDEL+XEBHHS8zC/FMrTTT41ko87JLFaF8HrJ5mxaBIjcsaiiWqN+tomBRJNb4oUQHudxMDIjAQ6mvJt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a+KPeXe/; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a0b291093fso1180010f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 May 2025 03:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746700050; x=1747304850; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f3dXWdexBFnCh1V4T6e507rtdfn4YGQDtE6BBRQFdZA=;
        b=a+KPeXe/9DHnfAFy4D/68GYC154UdUqFm46xqzdxZSw1NuAOVYOYqvFyFT2cis9Uo9
         Gk29jFR8JpGHN4JL3WrXrKc7SiHR8RyP6qwn7TEprnt4r9OoKEbVGA5FMf7kolrzNNd8
         zFDC6v4Y6fSoPeOSmT2/T91UlFODPQm+pplA3GAoVRYMm1L9u9GnruP/LxucRcqK+a2Q
         pH4sfmg8IOERLd7ExCpgr4SLXilF8DGrGgt/dLbEnTor6BF983ZPG5NadqExVYcqk3Q9
         8PTpBjC77/lp2X9BE+VuIdmvk6esXs+4vyd6bocPfBapyQwhfHrQBY1tLZ8a0MVABN5V
         TXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746700050; x=1747304850;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3dXWdexBFnCh1V4T6e507rtdfn4YGQDtE6BBRQFdZA=;
        b=MDHC6LacDAvqbFgH3fIaZl5vSn3rnffrkMhX4/DauMk+2hI+RjAw37jhXuxCuaCaiL
         BbhtXjHUgIEQF58qbnhZbOR/f/CKeDSAtxwcWZwuj0EYfQEs+CG8zap6u/Y/Hl3zAgd0
         E9TjdS4ovnJCDy2xth8nCralZpUsYJrdg8eVM2MRdRDlY1t54InfRsX+IUXz+Ns3D4Iy
         pGTlF2DHk7Mh6QtvdwE7JFYn4MZmCE7ufBG+e209U4y3RZvo4QuTvyvYBDYXTnlvhTJE
         MxBhXMFwCEZ39Br1qoAJk/qvoHMUmiA5zqbHJOTlyyt0Ncvj8ZZ6pF0zE+/j3cKb5S0F
         BdDw==
X-Forwarded-Encrypted: i=1; AJvYcCXqgWdu/0LY5Gpd8av5dDK/2skuJyvFjxv30781wFfJrahqEd+H1/o7Gd3W5POIc6EEgWDUYnGoOkYph18FQ4+VGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLxydl56eW0wBBUjrpyQhitiBoqNsKwpVPRd8BdXloQ7hrZ93v
	TUVDi9re9dAQ88SYaQoF6p3yWLY3xNywH3TfqQeN8Nx3WHmf1RFTG/Ik+9fySmI=
X-Gm-Gg: ASbGncuF1ryozTgkNXobwicsPd6Ti2yBN37SbgPtq5rotW2ZOn5rmR+SrlRFKjDYBSW
	P3sLwgnD7fj+PfFw2TzJj4M6kmlGcC1cmYOpSIPx9R65XdguPEyXqiFWL++98e16IID0wWYk071
	ID6FW1VZLh3BLstd+l34ZikDIV/QqHctPqFVEwJz7azKMtDcj4XXF5NC+wPs3KuNcqF7LEmvGvG
	6eI0P1UZyf8NtQ0qfhxN0geik9si46hq5mQONQkeENfjOV7Rz+RvBf5x/LAvFG5a8gP6o57100d
	5Y3hb+DxXYRdl+nHP/xsnwR/Y1Af+hJJh7VRFIT8f7M1bw==
X-Google-Smtp-Source: AGHT+IGr7hK3xCuRso8I/G034nZ8utNO2zmismBg2hsAW4Uj0bzVouwQ2BDVypLguNpWtEPItYf4BA==
X-Received: by 2002:a05:6000:2ab:b0:38d:ba8e:7327 with SMTP id ffacd0b85a97d-3a0b990e086mr2368417f8f.8.1746700049750;
        Thu, 08 May 2025 03:27:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a0b47a8448sm5679359f8f.44.2025.05.08.03.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 03:27:29 -0700 (PDT)
Date: Thu, 8 May 2025 13:27:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] media: rcar_jpu: remove redundant case statement
 when c is zero
Message-ID: <aByHDZyu0pptFUlK@stanley.mountain>
References: <20250508100835.336240-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508100835.336240-1-colin.i.king@gmail.com>

On Thu, May 08, 2025 at 11:08:35AM +0100, Colin Ian King wrote:
> The case statement where c is zero is redundant because the previous
> while loop will only exit if c is non-zero or non-0xff, so c can
> never be zero by the time the switch statement is reaced. Clean up
> the code by removing it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/media/platform/renesas/rcar_jpu.c | 2 --
>  1 file changed, 2 deletions(-)
> 

   612  
   613          for (;;) {
   614                  int c;
   615  
   616                  /* skip preceding filler bytes */
   617                  do
   618                          c = get_byte(&jpeg_buffer);
   619                  while (c == 0xff || c == 0);

Unrelated to your commit, but get_byte() returns -1 for out of
bounds.  I wish there were a explicit check for that.  We end
up hitting one of the "return 0;" statements depending on if
we've found a JPEG_MARKER_SOI.

regards,
dan carpenter


