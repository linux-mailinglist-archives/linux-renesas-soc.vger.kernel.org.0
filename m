Return-Path: <linux-renesas-soc+bounces-5154-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 762078BCA08
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2024 10:51:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 976BCB20C12
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2024 08:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EDAB1422B7;
	Mon,  6 May 2024 08:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEiBd/u8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C7A1422AD;
	Mon,  6 May 2024 08:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714985415; cv=none; b=gDXwMAEmkoB8FqvvLgtVcJutM+fnP+eplXgLSmx62NCNVO/5nToqZZu4bD0lmaYbdj+X9yYTpEUxEZEvud6Oq1oBRyKgikrcbJ1QxQa6AkO1fUWWcnQwjMFfXg0vS+cHPFxosGUUQ0sgjWSf8N2kkJr/GHvvvXnElZYRuUTbDEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714985415; c=relaxed/simple;
	bh=PVEtpu+l2zGGzojDwX0WQr6+h4fSUImOuCn79HwWJeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eb13zwdcPBSHbsf3XdmszaiSH8gN8AcQUdImgbeHmJPzYYh01RF2SLqEBPGqQjx/VxwewL9RmvpqUtjTVh1H8uApuP7T5CRT58tTjlpqUtxT3DAjbT8EIB95ALp6vX6ua/uJaQeC2EywUfXfeAKfF9o1R+TrgklDXAMGxnxRyZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEiBd/u8; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51ab4ee9df8so2037841e87.1;
        Mon, 06 May 2024 01:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714985412; x=1715590212; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0W3OM+PzsAuNXqvgrbwYe/sYHFhkCcz6xsmFOfCjwNc=;
        b=SEiBd/u8pmlvxUXZjrcU4UPetWt2M6K20xyF312lftD5ydDohCH3IJWKOy86vMk+oG
         tD0YqAEDYWneIjG6BuQsjQDaIkpDFswSzFTniEcVs+geQL/pHAiS9hGEy6lVVaDzTHXn
         EHQNYmFxzqWfUkUSM7sRsyVMvAqkmRNryWfqTzRQLVRuJjWsw6a2qKHeAc/ZZHqKSv5j
         nfTc9PHTo5kLi9vdjV6ac9ttLmgw65TzrLyOb91obntNsxWenT0AbIT+bctGqjwBRJVT
         2iLPA5/DXcjVnnXTS0UVrpeGr5d8aO/eSrltmGVUQoXkfv2Dgh9AwTsD9ByEsmSvXgVu
         yJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714985412; x=1715590212;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0W3OM+PzsAuNXqvgrbwYe/sYHFhkCcz6xsmFOfCjwNc=;
        b=doCGPtvzn8JY38X1I4I9rE7MygsKTzskocmse4x/akJytCBMjelbfGUETOEgCakget
         iQ7X8iyjDMZ0+N2fdkzy5q9+gQHjn+kclnqn2qJD1fUsyQsqM2mvlYFrf6BT27WKEP+M
         C35KJVQ13ZyQ//2Xk2ZFhFTVJ/gqHWmjAWPyzImnDTXT0h1YwQ4H0ggeJpZZoHbzEUFN
         3Zc5Gm0JNCXE5w2cxU61ZPdx2YJcOMLukWPhJm5RA7BBzyjer9Cyucy+O3MQq/NViuyo
         yyD4L3PnGqBdz3RlA81eKT21LWEPDV3XBmcUC0mRizxnhcyska/VYH8bEwpuXmxHuwYd
         HXNw==
X-Forwarded-Encrypted: i=1; AJvYcCVrLuxkIa45W8B1vHYSBuVYKrXfHnHg0qQzYbRqajN2t3rKh38Q8CLmzt+YNFI4kFwwQn9eEvsr2PM46/A71ENqjW/2u1pvO+OGvSyzMOo8HxaE15Xvik6nDEuxzvuUAF0ap/B3kqkXfnjbaFw8Prj41yXw4kWNFJpgUbqq+vQixYBvweanI43NyRJ8WpItKfy9Ju4YovjuQddxgJDmdF/DYZNV
X-Gm-Message-State: AOJu0Ywausg1AT+iw7Yt2RQ6ou8txgpoKd+aoqtxHCNK0erB3MCPpDXt
	bqdUGm/qsvcGWrGoo7zPfJj07wzYe+oatHvWFhWXWE5l4aLcmCB7
X-Google-Smtp-Source: AGHT+IEh+fGA+MGksiXkeu45MPOZ4U+YR5N+ndBcztXInjKnEGGz7Iui8cqavnJNkkCV9JKVT3Rxsw==
X-Received: by 2002:ac2:46e3:0:b0:51d:2a27:9574 with SMTP id q3-20020ac246e3000000b0051d2a279574mr5758742lfo.6.1714985411631;
        Mon, 06 May 2024 01:50:11 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id y6-20020a0565123f0600b0051e16048adesm1569125lfa.48.2024.05.06.01.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 01:50:11 -0700 (PDT)
Date: Mon, 6 May 2024 11:50:08 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v5 2/7] net: stmmac: Add dedicated XPCS cleanup
 method
Message-ID: <ljlbqz3o5btsufgc4jx3rqldmgvyl6k3raezcaur5g6qg44jje@ql2ws5ntt6eq>
References: <20240430-rzn1-gmac1-v5-0-62f65a84f418@bootlin.com>
 <20240430-rzn1-gmac1-v5-2-62f65a84f418@bootlin.com>
 <4wdcmcb2yxneynxtppestl6cp25z5xge3hfv7o47bxwpafn4cg@mtvc3ls2cxij>
 <ec3e6c1b-1a5e-f7c9-4782-bc8f01a67f5f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec3e6c1b-1a5e-f7c9-4782-bc8f01a67f5f@bootlin.com>

On Mon, May 06, 2024 at 09:07:41AM +0200, Romain Gantois wrote:
> Hi Serge,
> 
> On Fri, 3 May 2024, Serge Semin wrote:
> 
> > 
> > > +void stmmac_pcs_clean(struct stmmac_priv *priv)
> > 
> > Ideally it would have been great to have the entire driver fixed to
> > accept the stmmac_priv pointer as the functions argument. But this
> > would be too tiresome. Anyway seeing the PCS-setup protagonist method
> > has the net_device pointer passed I would implement the same prototype
> > for the antagonist even though it would require an additional local
> > variable. That will make the MDIO and PCS local interface-functions
> > looking alike and as if unified. That is the reason of why I made
> > stmmac_xpcs_clean() accepting the net_device pointer. 
> > 
> > Alternatively both stmmac_pcs_setup() and stmmac_pcs_clean() could be
> > converted to just accepting a pointer to the stmmac_priv instance.
>
 
> I think that adapting stmmac_pcs_clean() to take a net_device struct would be 
> more appropriate since it's the simpler of the two methods. I'll implement this 
> in the next version.

Awesome! Thanks.

-Serge(y)

> 
> Thanks,
> 
> -- 
> Romain Gantois, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

