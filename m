Return-Path: <linux-renesas-soc+bounces-24478-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AF6C4F6B4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 19:23:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E4DC434BD49
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 18:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD79C2BEC44;
	Tue, 11 Nov 2025 18:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="FXkiVCwz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E1728468C;
	Tue, 11 Nov 2025 18:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762885380; cv=none; b=AukzzZoGzeeDA5oanOwDZem9DCCw2GMSUxP2MGk1Har9M5754NRBxKQ1gleg7IRgYbZpKU1l1EbNpQZrHJUZKf7XEWJfbF0FTuQUqSKYkUX3NDxQxtzSVuMvxiPDkl4N+97TkEZJSinwRAgj+pUyADXIwgf7kudstFQb3w3ex6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762885380; c=relaxed/simple;
	bh=pg92DuQAodyiWy0CHUz1q/PjaF1nHMriHjTdPyjatQM=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=rWF2t0zE1VlsNoVSs1V+LtbQ9XvGYdV3n+i+DxBM5UHykQvJ9Q8nkhMM25fsOx7NmCnQFJcqEPaXFcvWrTCxAgxyVb9XUZAIIV1uN0UZa6CmewvjxlAjWgV0QDzDvKlAt10vIeRYN+gnLEdoQ8oIniQgddrublr5k33o3rA+KVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=FXkiVCwz; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=5qHmqOBWb1/TiqiYTrvztJmoHn0qb/fqgcYA800FKLA=; b=FXkiVCwzP8RiTKU36J1kGVZ/iz
	Xv1eMG612RumMXTA+CGCwjahkE8SV++l9fZA76RTpuJ93/XUmygM+W6sXLWgsqBB0Bo2yOtZWju5c
	/URepvfHcStwG4YqkEM2UaJ+JSkCI+wXRC2361YU6y1FCdKcziu6OPJaJfXp+ZaEOg7I=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:36212 helo=pettiford)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vIt0x-0008Sl-Oj; Tue, 11 Nov 2025 13:22:49 -0500
Date: Tue, 11 Nov 2025 13:22:46 -0500
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
Message-Id: <20251111132246.eef0faf1177691a07a1df47e@hugovil.com>
In-Reply-To: <OS3PR01MB8319C8A2BD72FC7787ACFEFA8ACFA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20251105222530.979537-1-chris.brandt@renesas.com>
	<20251111120148.943a0e193a65469a53a0cbc8@hugovil.com>
	<OS3PR01MB8319C8A2BD72FC7787ACFEFA8ACFA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
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
	* -1.9 NICE_REPLY_A Looks like a legit reply (A)
Subject: Re: [PATCH v4 0/2] Remove hard coded values for MIPI-DSI
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

On Tue, 11 Nov 2025 17:48:53 +0000
Chris Brandt <Chris.Brandt@renesas.com> wrote:

> Hi Hugo,
> 
> Thank you for testing.
> 
> On Tue, Nov 11, 2025 12:02 PM, Hugo Villeneuve wrote:
> > I just tested your patchset on kernel 6.17.7, and my display no longer works.
> >
> > Also tested on torvalds/master tree commit 4427259cc7f7, with similar
> > results:
> >
> >     rzg2l-cpg 11010000.clock-controller: hsclk out of range
> 
> I'm pretty sure you are using 4 lanes, and a 24-bit panel, but what is the vclk of your display?
> 
> I want to check out the math.
> 
> Thank you,
> Chris

Hi Chris,
I still don't know on which tree you based your patchset, just to be
sure that I am not missing anything.

Should it work on 6.17.7 stable tree or torvalds/master tree?

Hugo.

-- 
Hugo Villeneuve

