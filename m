Return-Path: <linux-renesas-soc+bounces-19555-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F745B05CEB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Jul 2025 15:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 470AD7BD8C7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Jul 2025 13:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34BD2E8E1A;
	Tue, 15 Jul 2025 13:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MhoH53pH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAABD2E2F10
	for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Jul 2025 13:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752585994; cv=none; b=ITDvvqawnxVeT3IWtuL8nQYI1j2e8c7CsEIw7XIiLdpgSL3ej6yZ1vxd/vH8AHEpu81EU7sU8cEekT/GM+R832pS25gfVoUcUyWf9+hzkNFUD5ATS4kxbVI9JBpXsV/ykA4bDr8T4TT8ioXw2ZDXugB6+BNbOQDMPXjOZ9sgtdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752585994; c=relaxed/simple;
	bh=WsPqDkkR0w0NChv6i3skLUOm50mr+MhFYwPfQ2zF7hU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KV4fIqU6VV1dLJnF10z/u/LDeoazjqPXVP7RKgyfXuDxRO6/D64FySTnan9twAxVOv06SmAp8JHwKfr+58PbFSgca4lhg+MAJLtvJCKoFlX00xxfCHHCjvVmDixzz8kokcHEYZoN0B2LO9HLfrodunZVQ3WBbTchhgNdFW/4Zi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MhoH53pH; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a54700a46eso3373744f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Jul 2025 06:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752585990; x=1753190790; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VvPKW23vcGHWbJZ7ulKit+LygcP46v08cpOClJit2gQ=;
        b=MhoH53pHIJrJbX8BlEjunSGwZ+hzVoWJCZZqS67xlw8v0Ohe9+eLWEV71ASxlWTKTi
         XgmwTPzgqoFNyAyDhogL5gkWp1k0M9GmpNlAveztgqsG75TBh1pnGo4XkzfDIEO5bpAZ
         zPfVNNWHA1Ax9OEjCmocRKbGiOuvVfo/jTlDjM4GjMIMeX8mzyZwIGZfdjKC1q6VpLOi
         5wUhuQfuYUgrmno0ZCA7UbBv4TLoq8sXO7JGALeeZcb7HswAy9LV6wtJYtaIv83tq5F7
         o3yBJlameDJZ7BKzJT3Tm3PiKaf2xGg2sVDOb3aCIg9F6xtkKxHRnkb5wSO7wud5wjX+
         n3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752585990; x=1753190790;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VvPKW23vcGHWbJZ7ulKit+LygcP46v08cpOClJit2gQ=;
        b=KCZvOdD673QO0PM/cIxbi7hws2pUvJTlc4NfbEVOBJDoQXrDQPwpYfUUGgv1RFGvTY
         A7A5lTQ1zfqHn/bwWX9ZLQNOgPu54OtAgzfXeRsOn0UvG8KpY3K7AcuuRiSFkQPBH5+Y
         Jx5QvOF4ZjOOJS6QbB2J1yBlChONf4HU0v5mh7lHy8kucb7++MJUajcHlmiYQEfp2Kvp
         kQo/5kRaKTrxSBr7awR4YfapPJ96IEVe5MpDZtJjaWl6sdQ9boo+ZbiZCgS0r8JiWgcQ
         mN57EMvDcoeaORtx8PM4rOIWUa5dHnNzI+l3eU5mSnlDJ7BWiADxZGTrsV0J0L7fjJ6D
         RdFg==
X-Forwarded-Encrypted: i=1; AJvYcCWofNmbtEvK6QeLdURc8Yvz5sju8AYiJZ40XP6yV6EtxxYrkqAUvnfj2mFoDL2ZcGz741O6aONqB1q/PhsxGoWk+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YytVbLvp8XKXDGOCQyRByTDT2zEHAk9Igrt3WHqpZYP+XIaZRD9
	mg5YAho5gsn1AdqZT1QY5hfr7UeC2DQTO0KFrFwUDzQiDjWY5W4h7bWk0ljczZcMw3U=
X-Gm-Gg: ASbGncsLtxtJKecfaJoKxlZLwbJV11SaXnH/Wn0Xnp5rCPUZYpL9Kmv4tInOgiInwgw
	TKifg+dGtAjjxQit+AVnfxRoM221xB80vDVTEglTyU2G19CIrZcjH3MDDriD2/AeCPAJ1ca5y9h
	PtHD4Ow+jjQ/zHWsNV5d1EY3KIULmeco/a3kPpIpK+K1HjBZz7o5xw5/Z5xla0Qybu84Beatsqc
	vFfmWdFj4IAZhUg9R92Hg3KTccopqDqX/NeWaD04oK2VtRAn9d+db60CsbjRhSRisjSsLfv7gnH
	QAWGnlptS3+EhVpIZQhuVMMAHXck3dixFSZjok0DQGAZCSAWMwn5d6CbGAj/Uzx9vJB3OxMseKq
	KUMU2DNKttb6YV16LfISIxFYvwOf9NwcRfltIv2maNrbH8nCL7fG6javvBikP
X-Google-Smtp-Source: AGHT+IE407KS8uKPTJWroRm8IILV/e+TMXBeoa0EGQKc6WbP+vL8QbjAW05nEN1glpgEAbE4/IV9fQ==
X-Received: by 2002:a5d:6f01:0:b0:3b6:463:d85d with SMTP id ffacd0b85a97d-3b60463d8eemr6451671f8f.11.1752585989943;
        Tue, 15 Jul 2025 06:26:29 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e0d872sm15337925f8f.60.2025.07.15.06.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 06:26:29 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:26:27 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-pm@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] thermal: Constify struct thermal_zone_device_ops
Message-ID: <aHZXAw08359qCBz2@mai.linaro.org>
References: <5bba3bf0139e2418b306a0f9a2f1f81ef49e88a6.1748165978.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5bba3bf0139e2418b306a0f9a2f1f81ef49e88a6.1748165978.git.christophe.jaillet@wanadoo.fr>

On Sun, May 25, 2025 at 11:40:04AM +0200, Christophe JAILLET wrote:
> 'struct thermal_zone_device_ops' are not modified in these drivers.
> 
> Constifying these structures moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   28116	   5168	    128	  33412	   8284	drivers/thermal/armada_thermal.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>   28244	   5040	    128	  33412	   8284	drivers/thermal/armada_thermal.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

