Return-Path: <linux-renesas-soc+bounces-33868-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1ehrLFiFKmqtrgMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33868-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 11:52:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 094B9670967
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 11:52:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=RJ01i4F7;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="H +VOIoa";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33868-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33868-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EF4C32B5704
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 09:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C2F3C4B6A;
	Thu, 11 Jun 2026 09:47:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4C23C4175;
	Thu, 11 Jun 2026 09:47:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781171270; cv=none; b=a/e2v/1JB/12zIkD+8VCElkiUmVRPDV5tzoKN6Cfd1h1izOK0JCMniu5VAUT0fbqepASUCt4vQb1nbBW3Kn4fEEkfHxwp+ooXe88PADKZd9tIttzcKMf9Bg3lYwqKAQGYJOiGb5vBx9GqvYBGQTPtP7sjxa6VJRTdygObv/kQC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781171270; c=relaxed/simple;
	bh=9spieezN/P5yA3PdDpEuoB6NBOOA4SVc5M9BZNlJyWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pBFHrLmcAQrMvsI6e3Qk6PaT1Ra2Hf1dNYx86kN8Lkn77jqTt6T9PdAbWpranHkTx6gK0mR/dSw5u9vlalklQASBeX3HCUX6qJ+2L3bBztWjS6RvG2KysTr1tpmghbPRb3HkO75Xw2WoYr3xvdYEYg6qgIIIipCtbYSNY/ThXCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=RJ01i4F7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=H+VOIoa1; arc=none smtp.client-ip=202.12.124.158
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3550C7A0145;
	Thu, 11 Jun 2026 05:47:47 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 11 Jun 2026 05:47:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781171267;
	 x=1781257667; bh=UZ2O6D9TYuSc3XK/tGr/NEv5TCWienlMRXuMasKrb3w=; b=
	RJ01i4F7M6T3NtQbcPpC9m1v53MeVxZalQe5mlgdsR5exsjqrJosyf9l3THwbm5b
	6xEpOzIu85GFVOWvgGsrLJcRRRLU2MYRJexMGELllcsc43ubuF6Hp6Jpx/YrkSy5
	ExASw6fgV8XOKbeT/p9OPnuHQAmka8NPpDJyRMA6TWcgCCe0aJ9jXfu/hNhutkY8
	7ikAGGlTJU6F2Xxst+HZ9I3JC1djRv2TKjcQHmCVIZ/t9d1BhbR7h+TBVNVzeWIA
	x7LI+lRblZYVryar1Ki6OT0FzdXJBQVQiVK/2/gtjih0NQqWnBbqnW1lkbLz6KGx
	qfpsInWIruD/+9jZhZrOXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781171267; x=
	1781257667; bh=UZ2O6D9TYuSc3XK/tGr/NEv5TCWienlMRXuMasKrb3w=; b=H
	+VOIoa1uDfmQaRubfyPh39kpBBRvWYAFMxB8FHMOaSGKeUMIkpPU4GT2oB6L+V5D
	l2T++99L5tmIExAy1SKs6NYw4JmmVQb/sGgWb4y6QVG+nWCOpbToUjlbaxCPCtu/
	+jfmffCmYDmp415jL0gahqIGKfoNn/jL7VFd8Pd/6FTzhEop4KgE85OtMb/P0b+b
	M1V+CLgAOE+StLpclJx4CYK52OS4RYdo6kYLivxEGN/Zirdkh3snaqp4wjd8JIFr
	fe+uBec9+BpbzI0qCE/WlH1tYZDbOMGWX035oFLsZUBqMaBviDYR8yzJ/oV9Rcpx
	9skHkH9l0GBNSzlc+PolQ==
X-ME-Sender: <xms:QYQqakDSdxbv_5i1gNbWKEvW2MR_QtsN2ggOm8hn8F4ezi2tfqgU-Q>
    <xme:QYQqaifELtSd_NtVjk_xBz0quXvKdhtlGSRpQef7u7pirneiQuSI0pSGoytXkL5Oy
    vm5E5pPwwGQltqCwTYqAnUyLQTJ9wIuCphgmUa4Ra6k3-x9Jc-J1g>
X-ME-Received: <xmr:QYQqatsq-sSd7xL_15hK3W7ecPt53edqEOjMnmmFukkNSC5Km3GcgnG6VXzPQ-WjlF738SnJVdvaIMC3btQszgx9pmsQ>
X-ME-Proxy-Cause: dmFkZTFSv3JB1Ni2NSAN7aIRmf1apyIuRnKdo8KEYWuccHfmeKPOVWKXC3OfaoSLzL2W7f
    nNOAnnyYfP8hapRVEhYpYVm5/Z2ckitiCKkSFw2fKP4q9G9hkaJy+1G5/Beuv5/YWp5smA
    vKG9SdCje210KdC3G6aLaRj+f5ORP48y9jT0dTAzqjlXpou2INuS5XE2SEJcfFsToQLfbB
    uviAh5Of/P9J2hQ04clNI9hwAbBscNWuVs+bg9B63kxHSfE1VWlAmuQ1asSufXWnRJuvwt
    NbJJv8FjFR+GluH5q6YvALo2YZQMDCabxEj7lE7VfO23Q8qkC3nPtAIObxqK+E+Bt2R7XO
    QcvFh1cYrMCCKveZG2bbon9kAS1WNVor1cidvPWgMmaeIy9VJrF1x9hFDpmQpemJJYBjZn
    F8HQG6l98wlvwkHf1GUWYZ2B5UbRBh6gV85gX/M8+tWhFU8Y+HCOVpj8akvrx7Ewc7M2vf
    95HcXLaaj9xuJiJmUZqAQyXL21czLEniKui4xhb4VK3Lw33MYs92qrXN+r9HNBbPlOHEmW
    8N1e7zbyRjbVDEuvlDimYlurEdu3Icq9lxVIvhxmeH1HX3nFyJldQ7A7zbyhK7Jkpd8Gdn
    a5ySNV0/R+oA6M1f+ZPJaX3prKoFrLF7ZxVZLkwK0cSTQ39DOuxcxz+j75Rg
X-ME-Proxy: <xmx:QYQqahLaji_soT2YGOOZS0-EiJUy8VumU02i_EKHqltp74Khcn1K-w>
    <xmx:QYQqana4FklhvInZfs59k1o8X4kgA6FpPhMtCGdiYcqtum_4QOXQNA>
    <xmx:QYQqavIpV4bNVlgSh1tH6yQmUzIWNn8QXsQlS0GS3Zyqe767rIapnQ>
    <xmx:QYQqaopng1QiEO4BgdkNqYi-_D5Rr3kfL17-P2MBfxgrY7mtJ-kHFw>
    <xmx:Q4Qqan6tOiRdTjReYsb2ShalPTv-QKourkashIn1X3L0K6OVill_mQj1>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Jun 2026 05:47:45 -0400 (EDT)
Date: Thu, 11 Jun 2026 11:47:43 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r8a77965-salvator-x: Enable GPU
 support
Message-ID: <20260611094743.GC69568@ragnatech.se>
References: <20260611005952.146825-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260611005952.146825-1-marek.vasut+renesas@mailbox.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,imgtec.com,glider.be,linux.intel.com,ffwll.ch,suse.de,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-33868-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut+renesas@mailbox.org,m:linux-arm-kernel@lists.infradead.org,m:conor+dt@kernel.org,m:airlied@gmail.com,m:frank.binns@imgtec.com,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:magnus.damm@gmail.com,m:matt.coster@imgtec.com,m:mripard@kernel.org,m:robh@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:devicetree@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 094B9670967

Hi Marek,

Thanks for your work.

On 2026-06-11 02:57:29 +0200, Marek Vasut wrote:
> Enable GPU on Salvator-X with R-Car M3-N.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

For the whole series,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Frank Binns <frank.binns@imgtec.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Matt Coster <matt.coster@imgtec.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: "Niklas Söderlund" <niklas.soderlund@ragnatech.se>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dts
> index f84c64ed4df7b..af8cfdccd2103 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dts
> @@ -30,3 +30,7 @@ &du {
>  	clock-names = "du.0", "du.1", "du.3",
>  		      "dclkin.0", "dclkin.1", "dclkin.3";
>  };
> +
> +&gpu {
> +	status = "okay";
> +};
> -- 
> 2.53.0
> 

-- 
Kind Regards,
Niklas Söderlund

