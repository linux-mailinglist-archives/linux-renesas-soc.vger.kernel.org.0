Return-Path: <linux-renesas-soc+bounces-17268-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A443ABDFDA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 18:02:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1384B4A81CC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 16:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA25265CAA;
	Tue, 20 May 2025 16:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="mvgfASeI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A902609C8;
	Tue, 20 May 2025 16:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747756964; cv=none; b=JT9Mw+RY19PDMk+1+A77XX+5aBGQqVkTYfM5piNs/dDRNt7Och9AMoa3IfF3oo3BDb6lsdkwTKCV4Jvu1RpdH+xS9Npd6CttRdkWaZtjBJMjEWeN85bt/1L6tT/wiAO0OBWcNirCOvwwUNa6d9fjGRWKIiQugt/SUmWSFAp997c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747756964; c=relaxed/simple;
	bh=Ky4mm7JONyHRJ5jcxYj8A//mq8Qz549QB1FScTt3gaA=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=FbdLw+bsi6sT0jP1AIeDp9RSvIPCtAkmqEEOT0GrXUrVbas0q+TmhWseYxrTzfkdLNknXppRWlIQVmuFUjaRKrJhseHv2vNSUOH9nsVgFlE7AZFyjd2jxRalcRcveNvZ9mH017hV7iZPNYWREXVmSDsO6MyRZhPVwD6inolau6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=mvgfASeI; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=1OufIotovlGigTD54p6pedoorrnKdSpkh4Mjpalhh4g=; b=mvgfASeI45nbGYtbnnUaLztGk0
	W+/GxzFbNlwMJePCaijepUyL3qa23y3/x09svByhJ9zhKdjKxJ95M/ZEbSeM86cfwBTyyre9C+Z9s
	LBHeoDwjgFIA0MBPlqgZX6AZyoTaj17kzUYOicT+JeT78L5wuHoaiZ011+XzyczGewkQ=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:60204 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1uHPQA-0005Tt-BI; Tue, 20 May 2025 12:02:26 -0400
Date: Tue, 20 May 2025 12:02:25 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Conor Dooley <conor@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, Hugo
 Villeneuve <hvilleneuve@dimonoff.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Message-Id: <20250520120225.fe7983a91ad1452b734d42fa@hugovil.com>
In-Reply-To: <20250520-lens-dizziness-4d098c031b10@spud>
References: <20250520151112.3278569-1-hugo@hugovil.com>
	<20250520-fidelity-mooned-5d4262d0a7ef@spud>
	<20250520-lens-dizziness-4d098c031b10@spud>
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
	* -1.8 NICE_REPLY_A Looks like a legit reply (A)
Subject: Re: [PATCH v2] dt-bindings: display: bridge: renesas,dsi: allow
 properties from dsi-controller
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

On Tue, 20 May 2025 17:00:11 +0100
Conor Dooley <conor@kernel.org> wrote:

> On Tue, May 20, 2025 at 04:58:12PM +0100, Conor Dooley wrote:
> > On Tue, May 20, 2025 at 11:11:12AM -0400, Hugo Villeneuve wrote:
> > > From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > > 
> > > Allow to inherit valid properties from the dsi-controller. This fixes the
> > > following warning when adding a panel property:
> > > 
> > > rzg2lc.dtb: dsi@10850000: '#address-cells', '#size-cells', 'panel@0' do not
> > >     match any of the regexes: 'pinctrl-[0-9]+'
> > >     from schema $id:
> > >         http://devicetree.org/schemas/display/bridge/renesas,dsi.yaml#
> > > 
> > > Also add a panel property to the example.
> > 
> > I don't think adding the example should be in the same patch as a fix.
> 
> Or am I misunderstanding, and this is a new type of usage, rather than a
> fix?

Hi Conor,
it is more like a new type of usage.

-- 
Hugo Villeneuve

