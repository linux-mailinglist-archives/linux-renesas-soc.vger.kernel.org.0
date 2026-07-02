Return-Path: <linux-renesas-soc+bounces-34638-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v9SYJS8tRmqHLAsAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34638-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 11:19:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54ACA6F528A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 11:19:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm1 header.b=kt9C4ymv;
	dkim=pass header.d=messagingengine.com header.s=fm2 header.b="f KG2+iN";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34638-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34638-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A60CD30D2765
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jul 2026 08:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BBF147A0B8;
	Thu,  2 Jul 2026 08:46:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AA83EC2F8;
	Thu,  2 Jul 2026 08:46:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782981968; cv=none; b=AdoXTTK+a+48PDXfHSuH0IX0OxbBPxbNR/JA6tyFQ6IzvngRwdpg+5t8qSqfSMLZW+oPdtXwuxoasPTsmjsVd4rEUqeoQXeqXBZa0iE0eMe4CCMA96e/QrGvg1qEYCtmioZWXrY79udOaUcZZPk6alxcP8nsFbUsW3O6LR9Z248=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782981968; c=relaxed/simple;
	bh=2ny8V9pHFxRFcjHGeKUUazvPQRZL9gVeCXjgGusNNwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nzj/RqL1F3frnGdStd1Oh39jpX63rsLvyHjHB3J4i2aC3Jjlz9xM3dIOqpi16+ZINfjJ4VsOPN1+e73ipqoBE2TvGlxgyUWD4x9ZVAPicq56Y5r2sBILE7IimnJqw7AJ4rJkJV5xXpVZ6l0ttHgmXHyVRB485K09FXZWqVmEVi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=kt9C4ymv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fKG2+iN6; arc=none smtp.client-ip=202.12.124.147
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id E65E51D00115;
	Thu,  2 Jul 2026 04:46:03 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 02 Jul 2026 04:46:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1782981963;
	 x=1783068363; bh=qPbEkvbSQ9M/zT2/WjgXMdML4p0u+/D/eLKyD0UTemA=; b=
	kt9C4ymv0e3xqolPMI/99ofUvnsrX1iWSEPAF94HtTTLx51AXn0TWQ71kkBRBi90
	KYRrfovsjhsyYnbw0jrWZpF7gNSBHaYL1VHn1r8nIJkJ3uvmZXq+nxT3gx+LeSGm
	lcIMWXJoRg4Oh6ZeMWMLXMZwxW3v41n7rOonw2Ekhzy8Fj3PB1mwib3sUIFI47oX
	XgPSGkRiVzmBpa1ym6xuPYJV8QB6LxTpyG+kny+rylRUqPl+Gzv/kiuxLRQM/ccq
	/ohj9ZM8x7C85PIRi8ycXgOX6oLk/o9pqynHy8QDKzYbQFhu4oWAEAfn2xTprIp4
	7tBFMjP0xhHRG6KYo/l3fQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1782981963; x=
	1783068363; bh=qPbEkvbSQ9M/zT2/WjgXMdML4p0u+/D/eLKyD0UTemA=; b=f
	KG2+iN6wvkvjtVBbTiSdY2hfqcZtemrOlxmD9/zqCvAxTtbbgz1pzQrZZDpoM3e0
	mO3gzU7B1Xig60o43kSr28NUWnGdysHyRaod6cGRG9leSWEDTMeM5glaWZhpfR+y
	0agni8+MI/W8xGtWP8vLPR75nFuwmkAcE5Z3SsOHXzWyZ4SxH7ZOa5amUzmaf8cx
	UZUwEPX5yuMumhRWb/8sOBBDU6+5B8JQTvn6/t1/OeNcv3J4ccAJ4D+YgxQWNoxL
	fHqObr7VCODToiQc/imSBWqFYFSRE9+THmDlnyNXJmPTKXDP+u2WnSq4/stezlIV
	uroMV9XvD+KrE8z+D9Few==
X-ME-Sender: <xms:SyVGamtTcA799OrdPQzlgYptCwoCnPbeRFxpNe9E0KIHaEj3tHHI3g>
    <xme:SyVGap_k76AgNTpdSsqc21iiFsxDp3ahxIUtpWuE7_ZxpjENcX5ffSJB1YaiGyIFX
    efjmcK9EAQ77DmWViK0WKNj7iK8O-eDAubOuejY2Wyk6pedwvJ9NJ4>
X-ME-Received: <xmr:SyVGaolNGyiQ_OMNq2Ve40shh5GZNgd9Y0PMapLQUNgaXFnOYfXj23nVwgZW_J5aWVVbMGfwS01gw1cypObwHseuzHVkzks>
X-ME-Proxy-Cause: dmFkZTGUvYukco99tdyEf6Pig8Ia48ABtTUDTTrIlD90kcgg2VUB44vCc6AZmcmLkkhRXw
    JXPz1Xm1crDBMvLAcvBPZjULP/0up2fiwsGfDjG9S5iZLQvn0nkJgrh5JwYpBaUO5DO01q
    O1txjYZEMeJ8JGF8riIQ3rTZLAi7kv+p+HUqr/Z1ywAyg+ICN5TbfC7+0kZi463r0H4l5W
    fttkMkm4X7+1JpYMGGpfZ3Aftm59zij5cfGx7sdIgPtY/ay6+8uI/L78JIHxA8iqdwXt/J
    y40Va4tt0L4+ErGK9lzpcHt2MXqnyhhP6lIRaL0YWrSqMJZFFClouXzI2PuMzcT3bsieQa
    EmtR35bUt9QEJhVEnTvmnzRTZBNXQAASSm6X3ZMhW8HVs3Nrq/4QvKRoMb93yrZROUdt8d
    xNQRNxUGzK4hYrbMW74gvlmIYSYpbGzbc/RAfcl/zuJdOOkb6KsZeFrnNG9XUBgVy3uv8n
    zEjqTt6qvtUlJzTQ8nMwgJMZAm2zOIMcAQKNZ8f38pvghD02SN4nR1FggJvmp18YBI26Rb
    kSGXcjvywe/A7Q+r8lo91DvIL/ynZ3ExPMZnc5OFqYLlFKnSMK4gmDC4Zr9U7hUMJsuon3
    1fQfCAbOSDccLI2MpK1Yx9NKHWL9SwVP7qI/4vAmlaygjDXhRkRsT2p7FegQ
X-ME-Proxy: <xmx:SyVGahNl-7QZRHt-aQEgA3Q5VMBTioya7YL98YhLuMh1MkxmPWWn_A>
    <xmx:SyVGavJYXGOGgn0Ro1vrEdBwfV6ErKkxUB9BC1JhW_zz0nf405cHUg>
    <xmx:SyVGakHJi129A08anRdFGYxe7d89Z3cGylneavctGQ1D-gEPnNT9TQ>
    <xmx:SyVGaoAc7i_uP2WpZ1tC7Pb8sWXs4LTAdqwlcPtrOAFj02JKuT33Vw>
    <xmx:SyVGaiJmspg1L7U_j9ZbJku9BfTiaPNtA_Adbx_ItKjSPekx5BiLLhUi>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Jul 2026 04:46:02 -0400 (EDT)
Date: Thu, 2 Jul 2026 10:46:01 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"DavidS. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v3 2/3] ptp: Add driver for R-Car Gen4
Message-ID: <20260702084601.GB3906710@ragnatech.se>
References: <20260701090607.1108208-1-niklas.soderlund+renesas@ragnatech.se>
 <20260701090607.1108208-3-niklas.soderlund+renesas@ragnatech.se>
 <89720193-e8ad-4bb3-b6d2-3253413b18ab@linux.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <89720193-e8ad-4bb3-b6d2-3253413b18ab@linux.dev>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm1,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-34638-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vadim.fedorenko@linux.dev,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:richardcochran@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,messagingengine.com:dkim,vger.kernel.org:from_smtp,ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 54ACA6F528A

Hi Vadim,

Thanks for your feedback.

On 2026-07-01 22:47:16 +0100, Vadim Fedorenko wrote:
> On 01/07/2026 10:06, Niklas SÃ¶derlund wrote:
> > Add driver for the gPTP timer found on R-Car Gen4 devices. The timer is
> > system-wide and shared by different Ethernet devices on each Gen4
> > platform. The operation of the timer is however not completely in
> > depended of the systems Ethernet devices.
> > 
> >    - On R-Car S4 is gated by the RSWITCH Ethernet module clock.
> > 
> >    - On R-Car V4H is gated by the RTSN Ethernet module clock.
> > 
> >    - On R-Car V4M is gated by its own module clock, the system have
> >      neither RTSN or RSWITCH device. But the module clock is the same as
> >      RTSN on V4H and the documentation referees to it as tsn (EtherTSN).
> > 
> > The gPTP device do have its own register space on all three platforms.
> > But on S4 and V4H it will share its clock and reset property with
> > RSWITCH or RTSN, respectively.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> [...]
> 
> > +static int ptp_rcar_gen4_adjfine(struct ptp_clock_info *ptp, long scaled_ppm)
> > +{
> > +	struct ptp_rcar_gen4_priv *priv = ptp_to_priv(ptp);
> > +	s64 addend = priv->default_addend;
> > +	bool neg_adj = scaled_ppm < 0;
> > +	unsigned long flags;
> > +	s64 diff;
> > +
> > +	if (neg_adj)
> > +		scaled_ppm = -scaled_ppm;
> > +	diff = div_s64(addend * scaled_ppm_to_ppb(scaled_ppm), NSEC_PER_SEC);
> > +	addend = neg_adj ? addend - diff : addend + diff;
> > +
> > +	spin_lock_irqsave(&priv->lock, flags);
> > +	iowrite32(addend, priv->base + PTPTIVC0_REG);
> 
> how are you so sure that addend will always fit into s32? It looks like
> it may go over in some cases, no?

Indeed, if the adjustment is more then 32ns per tick it will go over. 
The register is defined as,

        /* Default timer increment in ns.
         * bit[31:27] - integer
         * bit[26:0]  - decimal

I will add a check for this clamping the value before writing it to the 
register.

> 
> > +	spin_unlock_irqrestore(&priv->lock, flags);
> > +
> > +	return 0;
> > +}
> 

-- 
Kind Regards,
Niklas Söderlund

