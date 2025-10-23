Return-Path: <linux-renesas-soc+bounces-23534-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEBBC02D72
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 20:04:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 899541883524
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 18:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE832D73B5;
	Thu, 23 Oct 2025 18:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="sJER2zOZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08A4236453;
	Thu, 23 Oct 2025 18:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761242626; cv=none; b=u0EUm6zZRDcKk88JCaYK5+XKJajgs5bM6qW71Ciz0CDgx8USFrXavLMK47eTisWtI6piyYB1PAJX0fbHFbXxoSpuL6IPivspMnxqZzU8Xh115hHBWQmgI86+B/rf4tejfuY4ECQIjDCs8X8YP9ckt2i8j/qXYwMFPrX9bgoGqrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761242626; c=relaxed/simple;
	bh=Kac+02gz9J/QVE4wR0wn1yxQquI+wjaq9kaythkJvFk=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=M2f1SLPFsExJaqogxOnQhQVIZ/XCKQNK5nXc/41jMFMq4gtABe0u4hIYgluxSOkb9hbZjkuVtfI5QNsmnOce2q8XfLLed+JJ0N+HmvaRjr2phMIXWr41orHlFeYxwwMPsF4CwRy6w+/ETxJa1YY2O14EghZGUTq0VLFlZEXIvWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=sJER2zOZ; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=hp7eKwrDarat7QwcY0nOsXfbV1YjGxT6oUWa1Um1LpU=; b=sJER2zOZ0yLztePoPq6DmjtvQY
	cgJv0yQDGWa5T+FEHtqwqN/E095GpntVgfPCLBQ1Pzu7m9RBnLNTcSS2TVjqrClA3ypwE1XaAEPCH
	z/WKb4WrkYF5Ahb+Pdjh1MksWYD1UIeRDuj7WQegXqUc6J6f9Cv9TZY0bJK50rMz/ReA=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:58996 helo=pettiford)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vBzel-0000Bk-AG; Thu, 23 Oct 2025 14:03:23 -0400
Date: Thu, 23 Oct 2025 14:03:22 -0400
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
Message-Id: <20251023140322.a4d6777f37dcb8177480538f@hugovil.com>
In-Reply-To: <OS3PR01MB8319C5F67878677D380EC53D8AF0A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20251022235903.1091453-1-chris.brandt@renesas.com>
	<20251022235903.1091453-2-chris.brandt@renesas.com>
	<20251022214906.eaf123bd740ac9e396a65570@hugovil.com>
	<OS3PR01MB8319C5F67878677D380EC53D8AF0A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -1.6 NICE_REPLY_A Looks like a legit reply (A)
Subject: Re: [PATCH v3 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

On Thu, 23 Oct 2025 16:47:17 +0000
Chris Brandt <Chris.Brandt@renesas.com> wrote:

> Hi Hugo,
> 
> On Wed, Oct 22, 2025 9:49 PM, Hugo Villeneuve wrote:
> 
> > > +	for (params->pl5_postdiv1 = PLL5_POSTDIV_MIN;
> > > +	     params->pl5_postdiv1 < PLL5_POSTDIV_MAX + 1;
> >
> > I think it would be easier to read/understand like this:
> >     params->pl5_postdiv1 <= PLL5_POSTDIV_MAX;
> >
> > > +	     params->pl5_postdiv1++) {
> > > +		for (params->pl5_postdiv2 = PLL5_POSTDIV_MIN;
> > > +		     params->pl5_postdiv2 < PLL5_POSTDIV_MAX + 1;
> >
> > Ditto
> 
> OK. I can agree with that.

If you do that, you can also probably put this if() on as single line
to improve readability:

    if (foutvco_rate <= PLL5_FOUTVCO_MIN ||
 foutvco_rate >= PLL5_FOUTVCO_MAX)

> 
> 
> > > +				params->pl5_fracin = div_u64(((u64)
> > > +						     (foutvco_rate * params->pl5_refdiv) %
> > > +						     (EXTAL_FREQ_IN_MEGA_HZ * MEGA)) << 24,
> > > +						     EXTAL_FREQ_IN_MEGA_HZ * MEGA);
> > > +
> > > +				params->pl5_fracin = div_u64((u64)
> > > +						     ((foutvco_rate * params->pl5_refdiv) %
> > > +						     (EXTAL_FREQ_IN_MEGA_HZ * MEGA)) << 24,
> > > +						     EXTAL_FREQ_IN_MEGA_HZ * MEGA);
> >
> > Remove second identical block?
> 
> Wow! How did that get in there????
> 
> Thanks !
> 
> I'll wait a little to see if there are any other comments, then I'll send V4
> 
> 
> Chris
> 


-- 
Hugo Villeneuve

