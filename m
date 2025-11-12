Return-Path: <linux-renesas-soc+bounces-24524-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A314C54BE4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 23:50:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76A1A3AD5DB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 22:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1EA42DBF47;
	Wed, 12 Nov 2025 22:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="ZFEtY/YR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0F523ED6A;
	Wed, 12 Nov 2025 22:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762987794; cv=none; b=H3G2gL+v/jywP9vOhQXkffsTiMbgLaQtIVCyRv0SmVVEyJUNIxkdTWPn7RZ2JfSJQeAlyq5M6wIcQ9nYfHsPueboOlyy8cakejzIsHHapDhJ+k4W8M48CX61dAcq4uM1E2JJMiEzay+JT5zQq5jhVezqr+FkyO6ElF9uHIQZ7qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762987794; c=relaxed/simple;
	bh=NjxPeGLCBXpLu+61v+33yTerJ8wkf9w7wh18YxqCtq4=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=n+mblD3aketcl2KfevF9aYcxtubj5OkcDiXxkYxxKGo4h4jwPZOs/cYPuErAB3W4PskvnjLoF4QXiOET/3jtCYl4DpBwDrs71mzAI/OznOeOW5M76//e7uq8UZ+B5DHtk/FjmUrRl8XFHlRYBwSo2nfrGGt+bqbDLzYO/YxHWy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=ZFEtY/YR; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=rsmMeMMiuH0Pq/mWdMLj2Zy/6l7vJ2cJn1NWyyr+Rzk=; b=ZFEtY/YRQMTfQLCzXadjnLD7TO
	2M2LgqSqxcVminMlQGegPw3zmk6z3pn6uYyrnnJKDbrXrF7ZJg2e1t+bBpYkk6dLGAD2zrPV1Mfej
	sYsiOSvmhGy/BJqgkYWXlDew4+OqI1ukcZOFbriKuhsjt8HiN5YFdRd8bG5mYza/hs8M=;
Received: from [70.80.174.168] (port=39896 helo=pettiford)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vJJef-0003jx-K0; Wed, 12 Nov 2025 17:49:34 -0500
Date: Wed, 12 Nov 2025 17:49:32 -0500
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
Message-Id: <20251112174932.c1ae526d6cda33d1e3856a95@hugovil.com>
In-Reply-To: <OS3PR01MB8319A5873CD10A7D86F0094E8ACCA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20251105222530.979537-1-chris.brandt@renesas.com>
	<20251111120148.943a0e193a65469a53a0cbc8@hugovil.com>
	<OS3PR01MB8319C8A2BD72FC7787ACFEFA8ACFA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
	<20251111132246.eef0faf1177691a07a1df47e@hugovil.com>
	<TYCPR01MB83273CEE6D5B665179456A2A8ACFA@TYCPR01MB8327.jpnprd01.prod.outlook.com>
	<20251111220347.167dba316bea7effb6e0f849@hugovil.com>
	<OS3PR01MB8319A5873CD10A7D86F0094E8ACCA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
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
	* -0.7 NICE_REPLY_A Looks like a legit reply (A)
Subject: Re: [PATCH v4 0/2] Remove hard coded values for MIPI-DSI
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

Hi Chris,

On Wed, 12 Nov 2025 19:06:35 +0000
Chris Brandt <Chris.Brandt@renesas.com> wrote:

> Hi Hugo,
> 
> On Tue, Nov 11, 2025 10:04 PM, Hugo Villeneuve wrote:
> > You still haven't provided the base-commit. There is a ton of branches in renesas-devel.git, so it is not easy to determine the branch/commit you used for your patchset.
> > By providing base-commit, you will save everyone a lot of trouble.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git
> master branch
> base-commit: dd30a345f284e0d9b1755e3538f8257cf4deb79f
> 
> 
> > I tried to apply your patches on branch renesas-geert/master, using base-commit: 211ddde0823f
> 
> That is what I have been using. I just updated this morning to v6.18-rc5
> 
> 
> > The problem seems to be that dsi_div_ab_desired is not properly initialized, because the number of lanes is uninitialized (0) at this time, and therefore
> > rzg2l_cpg_dsi_div_set_divider() gets called with its first parameter as zero.
> 
> Hmmm.
> There are 2 ways to set the number of lanes: Device Tree or hard coded in the panel driver.
>
> What I do not understand is that by the time rzg2l_mipi_dsi_host_attach() is called, the number of lanes should have already been set.

Let me know if there is something specific you wantme to test for this.

> 
> On your system, where is the number of lanes defined? In the panel driver when it is probed?

For all my panels, it is set in the device three like this:

...
	port@1 {
		dsi0_out: endpoint {
			data-lanes = <1 2 3 4>;
			remote-endpoint = <&panel_in>;
		};
	};
...


> I am testing with 3 different systems, and I have not seen this issue.

I have 3 different panels, all using different druivers/IC, but I
tested only one (ilitek-ili9881c driver).

> 
> > Like I said, it also happens on 6.17.7 stable tree. If I remove your patches, everything is fine.
> 
> Things are hard coded in the existing driver.
> They work for you today because you are using the same number of lanes as the Renesas eval board.
> I'm trying to fix support for lanes = 3,2,1
> 
> 
> Thank you,
> Chris
> 


-- 
Hugo Villeneuve

