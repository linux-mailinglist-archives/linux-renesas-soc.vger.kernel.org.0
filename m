Return-Path: <linux-renesas-soc+bounces-28870-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJNKB/1iqWmB6gAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28870-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 12:03:25 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F01210400
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 12:03:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B2535302C2A7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 11:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5AE370D6F;
	Thu,  5 Mar 2026 11:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m4jmbjm9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266DB30B53A;
	Thu,  5 Mar 2026 11:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772708601; cv=none; b=jj7zpKXX/ZJbC9utGq/98ruM46x0Ntkr8jyXgxWd3QyQN+dT5qzdUJuI+396mNI4Ao85wJaACmbWE+jwv5jatkoY2ZSD2rgglYFsRwi/8PN4TgIKOmCwY6hGgY06hHLIjJdK1MLnnoiHUsNOLlFLVc9EWEIpChfEQm7Y+WPtz+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772708601; c=relaxed/simple;
	bh=XkhFu5R2j+knEY1vxGe51F80Ek3LROgWQvuDZnuGOxc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iNQHBAISM4k7GA2TbM0qq85bIxJHa/A+OYgGUyAH6l0WzOnNjIQOuJbxvdddv2OJ9whxkn41hzdl0NxkATGGGtrJYSn/uQkFu98nK5VpJnTQa8gtqlBeyzMmtUhflNN0rjI1dd/yljLrevbBzMcFjc+eZRrlV+uSjZUeQqeLeSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m4jmbjm9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B800EC116C6;
	Thu,  5 Mar 2026 11:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772708600;
	bh=XkhFu5R2j+knEY1vxGe51F80Ek3LROgWQvuDZnuGOxc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=m4jmbjm9//kg42GLG2DHrlf4HdVzDN0wdhmf9oJwoJ/uVazQXm4jHgL3GIdTnB4nX
	 cYD7oyukkmFP2YPh6VjlxjPcuJGZPfFzOotMuP8NNek/onH2iqDGgH/m9SHha5bSCD
	 GkLs4uhjFIpLJMKVJ3GaW3k6saBPcDn8sZxzd+WRieoGFvvc+f31LiE4vQJfCyS5UC
	 7mQ+xQkqC5Q4jgtoykMnMFjCM+Mbxiulr1Uh0L9j6Dci5/82N/JU0wvyI8l7u2j2xq
	 Fx2l5d9DCOJnPO8xJ4zfsH6vFRyPrOgmOTYlUbni6EsPPpP1+jjNpKHBu5TRFsnRF5
	 081LWgCO+6G5Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vy6UA-0000000GPSf-1Z57;
	Thu, 05 Mar 2026 11:03:18 +0000
Date: Thu, 05 Mar 2026 11:03:17 +0000
Message-ID: <86qzpy7d3e.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Kevin Hilman <khilman@baylibre.com>,	Jerome
 Brunet <jbrunet@baylibre.com>,	Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,	Peter Griffin
 <peter.griffin@linaro.org>,	=?UTF-8?B?QW5kcsOp?= Draszik
 <andre.draszik@linaro.org>,	Tudor Ambarus <tudor.ambarus@linaro.org>,	Alim
 Akhtar <alim.akhtar@samsung.com>,	Frank Li <Frank.Li@nxp.com>,	Sascha Hauer
 <s.hauer@pengutronix.de>,	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,	Dinh Nguyen <dinguyen@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,	Konrad Dybcio
 <konradybcio@kernel.org>,	Thierry Reding <treding@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,	linux-amlogic@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: dts: Drop CPU masks from GICv3 PPI interrupts
In-Reply-To: <24685144-c1bb-4084-80de-40989efbf4a1@oss.qualcomm.com>
References: <cover.1772643434.git.geert+renesas@glider.be>
	<ee2980af-e37c-4b4d-86c2-32467d2af454@oss.qualcomm.com>
	<CAMuHMdUCqozRx_WJesymXmP_PYo4Bf=oed=4fXycVOVk5g8D4Q@mail.gmail.com>
	<24685144-c1bb-4084-80de-40989efbf4a1@oss.qualcomm.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: konrad.dybcio@oss.qualcomm.com, geert@linux-m68k.org, neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, peter.griffin@linaro.org, andre.draszik@linaro.org, tudor.ambarus@linaro.org, alim.akhtar@samsung.com, Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, dinguyen@kernel.org, andersson@kernel.org, konradybcio@kernel.org, treding@nvidia.com, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Rspamd-Queue-Id: B0F01210400
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[linux-m68k.org,linaro.org,baylibre.com,googlemail.com,samsung.com,nxp.com,pengutronix.de,gmail.com,kernel.org,nvidia.com,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-28870-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maz@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Thu, 05 Mar 2026 10:02:01 +0000,
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
> On 3/5/26 10:55 AM, Geert Uytterhoeven wrote:
> > Hi Konrad,
> > 
> > On Thu, 5 Mar 2026 at 10:33, Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >> On 3/4/26 6:10 PM, Geert Uytterhoeven wrote:
> >>> Unlike older GIC variants, the GICv3 DT bindings do not support
> >>> specifying a CPU mask in PPI interrupt specifiers.  Hence this patch
> >>> series drop all such masks where they are still present.
> >>
> >> I'm having trouble finding where that's used on pre-v3 even.. does
> >> that actually get processed on the older iterations?
> > 
> > I had noticed the same, and had asked maz on IRC.
> > His answer:
> > 
> >    "so far, we have never seen a GICv{1,2} system that didn't have all
> > of its PPIs
> >     connected to the same set of devices."
> 
> lol, that's fun!

For some definition of fun. If you want to get a top-class headache,
have a look at what that means to handle a single INTID being routed
different drivers based on the *affinity* of the interrupt.

HW people who come up with these contraptions should be spanked
repeatedly and preferably asymmetrically.

	N,

-- 
Without deviation from the norm, progress is not possible.

