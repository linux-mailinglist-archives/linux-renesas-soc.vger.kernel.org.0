Return-Path: <linux-renesas-soc+bounces-17408-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A82AC14A2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 21:17:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5CC43BB97F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 19:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3DC829A321;
	Thu, 22 May 2025 19:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="JqTEvhUB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42982698AF;
	Thu, 22 May 2025 19:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747941250; cv=none; b=GMVbg90WKN+ZnAEayx2QkjwYc16jT4my41ZbYU7dSmvN93/YAhUJDVt8BDjyV/MGGYlk1annUfeXf+hV6WgmquNO+fWh0Uke5w2cYkPaNJ8iMEyP9cYatyfkD87OK7Y39m6jdTIQjfioiFmV9cKWV6tK1JjXL/ctHZg2qlHaFjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747941250; c=relaxed/simple;
	bh=uOIMWrU2rICv7Ji4NNiHPMmMIXVbbabOTueK93k3Enw=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=fA8jRYqTuMWTWWFfZu8ORNwFpYBXNTqzVNrEFFEBql6w0C70NRuljl8cRXPKzNG2OnU02f7Z/bo86A8nGJ+wDGvmRYOK/u27USDtVXnkvu855BoZHqI4R5gqk/QA14K8jtGB0JqpEdoqa6wFYdVxXLLUgHOIzMEAXStybLImde8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=JqTEvhUB; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=frzJT8TDmbXbrl93CAqw5BX6Dez3V1DpAl1yjjO3Oxk=; b=JqTEvhUBq8f/oi1ZnB+V3xcL+b
	f3TcxATAKxx5ZqkdY+a8KHzrnCupe6F6WQ34T/SP3ftYh3q2UQgxgRK8bs/sIas7rrE9siwgTDjuS
	Dpbo9V1v/P+s+Pmb5Vk1Qm2AXQbKaLSzyrvsAi9KJV2aGFUPCuiu/G7R2Wjrzm92GTpc=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:33532 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1uIBMS-0000FR-VD; Thu, 22 May 2025 15:13:49 -0400
Date: Thu, 22 May 2025 15:13:48 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, Chris Brandt
 <Chris.Brandt@renesas.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Hugo Villeneuve <hvilleneuve@dimonoff.com>
Message-Id: <20250522151348.856a75a66cd87d8794500dc4@hugovil.com>
In-Reply-To: <TY3PR01MB113464412C75E0AC1928A4FBA8699A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250522143911.138077-1-hugo@hugovil.com>
	<TY3PR01MB113464412C75E0AC1928A4FBA8699A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
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
	*  0.1 URIBL_CSS_A Contains URL's A record listed in the Spamhaus CSS
	*      blocklist
	*      [URIs: hugovil.com]
	*  0.1 URIBL_CSS Contains an URL's NS IP listed in the Spamhaus CSS
	*      blocklist
	*      [URIs: hugovil.com]
	* -0.8 NICE_REPLY_A Looks like a legit reply (A)
Subject: Re: [PATCH v3 0/2] drm: rcar-du: rzg2l_mipi_dsi: add MIPI DSI
 command support
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

On Thu, 22 May 2025 18:40:29 +0000
Biju Das <biju.das.jz@bp.renesas.com> wrote:

> Hi Hugo,
> 
> Thanks for the patch.
> 
> > -----Original Message-----
> > From: Hugo Villeneuve <hugo@hugovil.com>
> > Sent: 22 May 2025 15:39
> > Subject: [PATCH v3 0/2] drm: rcar-du: rzg2l_mipi_dsi: add MIPI DSI command support
> > 
> > From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > 
> > Hello,
> > this patch series add support for sending MIPI DSI command packets to the Renesas RZ/G2L MIPI DSI
> > driver.
> > 
> > Tested on a custom board with a SolidRun RZ/G2L SOM, with two different LCD panels using the jd9365da
> > and st7703 drivers.
> > 
> > Tested short and long writes.
> > 
> > Tested read of 1 byte, 2 bytes and long reads.
> 
> I see tested-by tag for patch[1] and this patch series is conflict with that patch.

Hi Biju,
there is no conflict per se for the moment, as these are two separate
submissions. Chris's patch is not part of this submission.

I tested patch[1] by rebasing my series on top of Chris patch.

> Can this patch series work without patch[1]? If yes, no issue.

Yes it can.


> Otherwise, you need to rebase your patch on top of [1] to avoid merge conflict.

Eventually, if Chris's patch is accepted before my series, I
will rebase and resubmit then. Right now, it seems I cannot do it,
because submitting my serie based on an "not yet accepted" patch will
result in the kernel test robot complaining (and rightly so). Unless
there is a mean to specify that my serie depends on other
unapplied patch...

Ideally, it should have been easier if I could have integrated Chris's
patch into my serie, but he preferred to send his patch alone since
he felt that it could be accepted more rapidly like this.

Hugo.


> [1] https://lore.kernel.org/all/20250521210335.3149065-1-chris.brandt@renesas.com/
> 
> Cheers,
> Biju
> 
> > 
> > Thank you.
> > 
> > Link: [v1] https://lore.kernel.org/all/20250520164034.3453315-1-hugo@hugovil.com
> > 
> > Changes for V3:
> > - No code change, resending after fixing mail server config resulting in
> >   only cover letter being sent
> > 
> > Changes for V2:
> > - Change commit message prefix to "drm: renesas: rz-du: "
> > - Reorder variables in rzg2l_mipi_dsi_read_response()
> > - Remove unused macros
> > - Add missing bitfield include (kernel test robot)
> > 
> > Hugo Villeneuve (2):
> >   drm: renesas: rz-du: Implement MIPI DSI host transfers
> >   drm: renesas: rz-du: Set DCS maximum return packet size
> > 
> >  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 186 ++++++++++++++++++
> >  .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  54 +++++
> >  2 files changed, 240 insertions(+)
> > 
> > 
> > base-commit: c4f8ac095fc91084108ec21117eb9c1fff64725d
> > --
> > 2.39.5
> 
> 


-- 
Hugo Villeneuve

