Return-Path: <linux-renesas-soc+bounces-27163-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHbbNI00cGlzXAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27163-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 03:06:05 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DA54F7E4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 03:06:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3D02AB6E6B4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 02:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 810AA31985C;
	Wed, 21 Jan 2026 02:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XCLtweSp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6463033D1;
	Wed, 21 Jan 2026 02:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768961129; cv=none; b=pu2BBJliul28h5FbtW8A+xqGu4tbcia9UOB01C2ivGabQk3Ze9rCOg44AAFcwxVsavT92bqvE+0fOA9Dx+x+Ei4HTzNJT6iOLE/9hE0m7vOccnCCoiZzvx47wFW63aExfEV0ZYvtkwTMZALb8c/q2CRHAG0/EB0NnaTvKN5qIRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768961129; c=relaxed/simple;
	bh=ilN4HPAMj6+h3erNVdSiAUhOdMjO3QbTUbLpJ8T6sfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ExWn+39IDINqDr6/BEGz+YUtSSsGMeoYHyR4/CKUqenJdMZBIVfZ40KfHuiugSIkRkG/QsE3ztUYrc5XF+vwBI6GqlfgCHZlnyzV0Mxi+b5WRkIHD+tVqKPD1ryhI9HpmdT2gwzVp31UrvrWGvuLziKz0KL5MAqV/dzDi0DLwYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XCLtweSp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F0CDC16AAE;
	Wed, 21 Jan 2026 02:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768961128;
	bh=ilN4HPAMj6+h3erNVdSiAUhOdMjO3QbTUbLpJ8T6sfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XCLtweSplCNXPwSs9uPWVo9gyIfyeEJ7s8mu+QV0Tj2/1Wd7jnexVVhh3Hu4yMahp
	 w1akrc4iImGxGCzDXYr7IhAhER61UjpsABfDYwsGkop13VPaYi0bQBkbSuyPRoFXuA
	 6z/B4vE6lDcX61tskOaO/a4Js1/R0FRkgJ16nHEvTwjEYWAVK+VKMIVjVqEGMvxHIV
	 /ndUC1ozccQb1zsr/XdzHGhcBe5cu0pkcA/6LfTLcnQG23memqFFFbTU+7YTfcN7VZ
	 LuwuQDCihOxUKI24mGZPweUa3SHtpjcVvaIWs5aZsrZYS7dzP/566RlcMXCm0EPcWf
	 vF+N5h2JmRblQ==
Date: Tue, 20 Jan 2026 20:05:27 -0600
From: Rob Herring <robh@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	arm-scmi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,no-completion-irq property
Message-ID: <20260121020527.GA1659809-robh@kernel.org>
References: <20260117010241.186685-1-marek.vasut+renesas@mailbox.org>
 <aW5hmb9tyw1Gv388@pluto>
 <aW5jwtoYCFs-Pzpk@bogus>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW5jwtoYCFs-Pzpk@bogus>
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-27163-lists,linux-renesas-soc=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[broadcom.com:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,infradead.org:email,mailbox.org:email]
X-Rspamd-Queue-Id: 84DA54F7E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jan 19, 2026 at 05:02:58PM +0000, Sudeep Holla wrote:
> On Mon, Jan 19, 2026 at 04:53:45PM +0000, Cristian Marussi wrote:
> > On Sat, Jan 17, 2026 at 02:02:28AM +0100, Marek Vasut wrote:
> > > Document new property arm,no-completion-irq . This optional property
> > > is intended for hardware that does not generate completion interrupts
> > > and can be used to unconditionally enable forced polling mode of
> > > operation.
> > > 
> > > With this property set, such implementations which do not generate
> > > interrupts can be interacted with, until they are fixed to generate
> > > interrupts properly.
> > > 
> > > Note that, because the original base protocol exchange also requires
> > > some sort of completion mechanism, it is not possible to query SCMI
> > > itself for this property and it must be described in DT. While this
> > > does look a bit like policy, the SCMI provider is part of the
> > > hardware, hence DT.
> > > 
> > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > > ---
> > > Cc: Conor Dooley <conor+dt@kernel.org>
> > > Cc: Cristian Marussi <cristian.marussi@arm.com>
> > > Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> > > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > > Cc: Rob Herring <robh@kernel.org>
> > > Cc: Sudeep Holla <sudeep.holla@arm.com>
> > > Cc: arm-scmi@vger.kernel.org
> > > Cc: devicetree@vger.kernel.org
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > Cc: linux-renesas-soc@vger.kernel.org
> > > ---
> > > V2: s@mean@&t and limit poll transport to mailbox/shmem only
> > > V3: - Reformat the commit message, expand property description to
> > >       explicitly spell out this is hardware description.
> > >     - Rename property from arm,poll-transport to arm,no-completion-irq
> > > V4: - Update first paragraph of commit message and property description
> > >     - Add RB from Rob
> > > ---
> > >  .../devicetree/bindings/firmware/arm,scmi.yaml         | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > > index be817fd9cc34b..d06cca9273c48 100644
> > > --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > > +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > > @@ -146,6 +146,13 @@ properties:
> > >        this platform. If set, the value should be non-zero.
> > >      minimum: 1
> > >  
> > > +  arm,no-completion-irq:
> > > +    type: boolean
> > > +    description:
> > 
> > Shouldn't these two points have to be swapped as per Sudeep and Rob
> > suggestions ?
> > 
> >     description:
> > 	....
> >     type: boolean
> > 
> 
> I was just referring to the points covered under the `description` and not
> the order of `type` and `description`. I am not sure if there is any such
> requirement as well.

There isn't. The only preference is to be consistent within a file of 
description either first or last.

Rob

