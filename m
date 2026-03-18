Return-Path: <linux-renesas-soc+bounces-29725-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPUBI31humnFUgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29725-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 09:25:33 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A112B7E35
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 09:25:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E2D143027C84
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 08:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A19B37DEA7;
	Wed, 18 Mar 2026 08:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zgva8rw/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3FF37D132;
	Wed, 18 Mar 2026 08:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773822236; cv=none; b=WYzqsFshLm5QDuQrz3QGgll/hiMMUcKZiE2IpNjuAvIyZIPxaBbmch791mKYG/woME6w+z6NFn8bmRxdneUEUnRElETtlWJhYK9HhJuh9UfAfZ4UJ5bEmJdRrn5CrJHaj23IEUDoFyGVUtK+4dQ81Xf9UITShEn5hHJaN5vTlLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773822236; c=relaxed/simple;
	bh=Le0U2Y1VQsiAeth5ZUAWVvNLY7ryaX06wNoqTJ2H5Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XtDKC2BI1HG+9nenKhOsk9ug1PvtspsROCPHjBRs0UOMyN7OGjayKD7xuMy8rqP6QStwE7+CDmaJA9JaN3uhl+yJxeCFIkDwYfIOBlNZxJZzXdzejSD9pkHsC9y7//KdkYZjaTQGnDUv29MwvoG7mfAP58q+dLLXaYIvPQBISJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zgva8rw/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7026C19421;
	Wed, 18 Mar 2026 08:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773822235;
	bh=Le0U2Y1VQsiAeth5ZUAWVvNLY7ryaX06wNoqTJ2H5Rg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zgva8rw/5k/0Dh4QnHBpUHyuL6bnuEHy7r79/4mlQJt3zl9VOXKviytWvtq7JmKUS
	 yOIxb3crr5caAEILYo7vTxqKjk1GIjrvtRH5MVi8aVMrTiVOdGQus1NAFhYl2eicVa
	 PMN7ANS7yv37dqjJFTualnG+UOBrOuEDsbIp+z/uo1cxrd3tSE6veTSScPW4Hx9UM1
	 wFTjqMYEosUfwfXk1T0JovH8kQsTFy0U+/zANK0YwHXX1/JD0jg1QKYa5aicU5I60E
	 lKS8JUsvFwPtSyjwDMzJ93FXPSZu84fd0QCoGc/PuUSvOLTgPZYOH27LnnesgLrr/H
	 BDS8nl/xxr7aw==
Date: Wed, 18 Mar 2026 09:23:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dawei Liu <dawei.liu.jy@renesas.com>
Cc: "linux@roeck-us.net" <linux@roeck-us.net>, 
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"corbet@lwn.net" <corbet@lwn.net>, "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, 
	"geert+renesas@glider.be" <geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>, 
	Grant Peltier <grant.peltier.jg@renesas.com>, Linda Xin <linda.xin.jg@renesas.com>, 
	"tabreztalks@gmail.com" <tabreztalks@gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: hwmon: isl68137: Add compatible
 strings for RAA228942 and RAA228943
Message-ID: <20260318-neon-blazing-swallow-f7b60a@quoll>
References: <20260316053541.3903-1-dawei.liu.jy@renesas.com>
 <20260318021921.75-1-dawei.liu.jy@renesas.com>
 <20260318021921.75-4-dawei.liu.jy@renesas.com>
 <TYWPR01MB11935C44C0ACE3F319FC2ABC8D54EA@TYWPR01MB11935.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TYWPR01MB11935C44C0ACE3F319FC2ABC8D54EA@TYWPR01MB11935.jpnprd01.prod.outlook.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29725-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[roeck-us.net,vger.kernel.org,kernel.org,lwn.net,linuxfoundation.org,glider.be,gmail.com,renesas.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 93A112B7E35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 05:43:00AM +0000, Dawei Liu wrote:
> Hi Krzysztof,
> 
> I've updated the commit message in v2 to clarify the compatibility,
> as you suggested in your v1 review. The commit message now reads:
> 
>   "Both RAA228942 and RAA228943 are PMBus command compatible with the
>    RAA228228/RAA228244/RAA228246 family and use the same 2-rail non-TC
>    driver configuration."
> 
> Could you please review this v2 dt-bindings patch and provide your
> Acked-by if it looks good to you?

Why do you ping few hours after sending a patch? No, I will not Ack it
becuse I have bunch of other patches to do and pinging after few hours
makes a very bad impression. I have two weeks to respond to your patch.

Considering that recently some Renesas contributors did not review patches
still on the list but sent a fix to them, I find your request even less
appropriate. Start reviewing patches on the list.
(above is of course not a request to Renesas maintainers)

> 
> Best Regards
> Dawei Liu
> 
> -----Original Message-----
> From: Dawei Liu 
> Sent: Wednesday, March 18, 2026 10:20 AM


Best regards,
Krzysztof


