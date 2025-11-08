Return-Path: <linux-renesas-soc+bounces-24362-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5852EC42EB4
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 08 Nov 2025 15:57:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1AA8E4E690D
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Nov 2025 14:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4866C1E47B7;
	Sat,  8 Nov 2025 14:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="X3+/1ntP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB581F7910;
	Sat,  8 Nov 2025 14:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762613869; cv=none; b=Fl8SuM4TWXg/w4JGI2O0K81fZHFmWvVKMWpz64qSbvhFEgKc31oNKnAImBWCxv4MS0197+XNP9YpdvuJc11JQqFGZPjqirfKHdr9JFE1JxvlKsanv75BVNpGTYz98TWT7KipVy9ivN/AwSzWDX5HqKajFWEz2424cMoR20pXdG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762613869; c=relaxed/simple;
	bh=8HlDZj4Jp7gn8u+9Z14GdJCiPGrKol8DDr4U05JS4bI=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=ihq5yJy0qAka30qW03yO+GZQxVHukijd7VS7aPqQ6/nuxLfMqMYoJlqbIFk8yXBNmi25jA5Zb0T0CLsW//+lmNEwgPvvY5pEox2q09Ja3MKG1hz8hiYkzsf7WnlDAE7zdWdFH8Tpn8FCpk7/t2a2GCRu/tm7WSiKULgSqXrnmZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=X3+/1ntP; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=dCqeDCHVTC0aJCIbqAO3XCT0AXxUyonF5z42GFLUBzk=; b=X3+/1ntPtv5AqOsrrJKVPTy2/w
	91S4tWzHAZp4/UdZhK/V82I1cqfw1A8X9dT3SiWcGVQZFF7Jial6nQDHjIRw8G1+bd6rMmgx0eJWy
	+/MOLLoInivmDPnQEzhRx/KcqkI7iQKVaKDr/i/wOuV/cmk7fkR0McvpF0knev2A7Jg0=;
Received: from modemcable061.19-161-184.mc.videotron.ca ([184.161.19.61]:32796 helo=debian-lenovo)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vHkNk-0006C6-Ry; Sat, 08 Nov 2025 09:57:37 -0500
Date: Sat, 8 Nov 2025 09:57:35 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Biju Das
 <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
 Nghia Vo <nghia.vo.zn@renesas.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Message-Id: <20251108095735.fbd3db3e3d24f3f7baacb1b6@hugovil.com>
In-Reply-To: <TYCPR01MB832759A2410465D46E7095DC8AC3A@TYCPR01MB8327.jpnprd01.prod.outlook.com>
References: <20251105222530.979537-1-chris.brandt@renesas.com>
	<20251105222530.979537-2-chris.brandt@renesas.com>
	<20251107113058.f334957151d1a8dd94dd740b@hugovil.com>
	<OS3PR01MB83195AF3F1964548E1512FBE8AC3A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
	<20251107140750.00bf68e4b2f5354015e65ad4@hugovil.com>
	<OS3PR01MB8319E496A32EDBF5719BAB478AC3A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
	<20251107171809.6033526ffe5e57ec72bd4f96@hugovil.com>
	<TYCPR01MB832759A2410465D46E7095DC8AC3A@TYCPR01MB8327.jpnprd01.prod.outlook.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 184.161.19.61
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -1.8 NICE_REPLY_A Looks like a legit reply (A)
Subject: Re: [PATCH v4 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

On Fri, 7 Nov 2025 23:25:40 +0000
Chris Brandt <Chris.Brandt@renesas.com> wrote:

> Hi Hugo,
> 
> On Fri, Nov 7, 2025 5:18 PM, Hugo Villeneuve wrote:
> 
> > > > +				if (params->pl5_intin < PLL5_INTIN_MIN ||
> > > > +				    params->pl5_intin > PLL5_INTIN_MAX)
> > >
> > >
> > > And if you want the same behavior as before, shouldn't the comparison be with "<=" and ">=" ?
> 
> > I didn't see an answer to my question/comment about comparison with "<=" and ">=" ?
> 
> The hardware manual says:
> 
> INTIN		20 to 320
> 
> So, both 20 and 320 are valid values.
> 
> Meaning I only want to 'continue' (ie, skip)   if ( x <=19 || x >= 321 )
> 
> or rather
> 
> if ( x < 20 || x > 320 )
> 
> So the original code of...
> 
> +				params->pl5_intin = (foutvco_rate * params->pl5_refdiv) /
> +						    (EXTAL_FREQ_IN_MEGA_HZ * MEGA);
> +				if (params->pl5_intin < PLL5_INTIN_MIN + 1 ||
> +				    params->pl5_intin > PLL5_INTIN_MAX - 1)
> +					continue;
> 
> ....was wrong.
> 
> I forgot to mention that in the patch.     :)

Hi Chris,
thank you, that is clearer now.

Hugo.

> 
> Thanks,
> Chris
> 
> 


-- 
Hugo Villeneuve <hugo@hugovil.com>

