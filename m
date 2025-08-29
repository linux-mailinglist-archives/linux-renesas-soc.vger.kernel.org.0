Return-Path: <linux-renesas-soc+bounces-21068-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CEDB3B945
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Aug 2025 12:53:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DD79580C16
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Aug 2025 10:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 096023101A7;
	Fri, 29 Aug 2025 10:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Z+nz1taA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2CA31065B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Aug 2025 10:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756464796; cv=none; b=blgEQuZLRpxIHwsBsD8M2E+L3aSa2ZMou7pSBRKO/W9Q5SmVUm7TyZLc9Wx73NLnKc1mHSyidhsIGRcdDd5xjPpqwrzI44HMdSeqkXf6Cc279CRaPAaxRaxohs4lqGynsLeG/MtWg+ylNiNMyp2WaI9VcbaHtaLPbS0DtL/8LMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756464796; c=relaxed/simple;
	bh=WQdwzz6q9eAjbBzKBHklBItXSbQR9QZQCqps1gmAqJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lvfafpE8e4chwvKSs48bgWBDdDOwsOWRQOlOPECbcIKOSxtIKU78oEfj+l7sm0TYVYnwCZI7QlFd4mmiY34RR+d0UZ0VkboFtFbAlUbaVlQiUdM2mLnHm8+99ek0d7vpoPSfaIkCKl//RDCedahBVNsjZxttPif7GwdeCQw/mi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Z+nz1taA; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=E2se
	b6RdzeP44v6HWYjoVuEzf39+ad3i9v38SGIR650=; b=Z+nz1taA3zHfqbeUagJY
	jvBend6sl1lhVZAyvWeeMCtt1l8k/VcROV4s4iVGxJC52/p2BsPBz4eQxfKJJJ5f
	Dfcu/WFDnjSvOK8n0xP/AMOSTXOKllyjoGPtFTk7oPbwqSZy+V6aeyqOgCM9USIO
	3WdH0Oiflcr22+8JYkgLkOL+7Ul7rSu/6Fx3T20ucjY7wsJittD3XkR98SDIMpWI
	yvJlpLBmTmKT4sp3+qgNvVwcn2byqPbzMWGak27TXFqfED6s/5STlT3aNl0Wk6uw
	8Z5ovYCpoLdvMunoGsDoSznB4DXchatRH4l/JcW7foTcpCc7jF+LtPytuvL0fBUy
	gw==
Received: (qmail 1425040 invoked from network); 29 Aug 2025 12:53:12 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Aug 2025 12:53:12 +0200
X-UD-Smtp-Session: l3s3148p1@3KsB1H49CucgAwDPXwOZADQgI+b4m0Li
Date: Fri, 29 Aug 2025 12:53:12 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	geert+renesas@glider.be, magnus.damm@gmail.com,
	yoshihiro.shimoda.uh@renesas.com, biju.das.jz@bp.renesas.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 0/7] Add initial USB support for the Renesas RZ/G3S SoC
Message-ID: <aLGGmI8bpKNVaSAa@shikoro>
References: <20250819054212.486426-1-claudiu.beznea.uj@bp.renesas.com>
 <aLAZprjeKtk4pusw@shikoro>
 <ae53d367-2ee5-49aa-82ba-86f9e84d4d25@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae53d367-2ee5-49aa-82ba-86f9e84d4d25@tuxon.dev>

Hi Claudiu,

> I just checked it on latest linux-next and all good on my side. Would it be
> possible that you don't have commit 2da2740fb9c8 ("soc: renesas: rz-sysc:
> Add syscon/regmap support") in your tree?

Yes, I added it and it made the error go away, but still no USB. I
switched to linux-next as of today, did neither help.

> This is how my tree looks like:

Mine is similar, except for a newer -next.

Let's try your config file next?

Thanks for the support,

   Wolfram


