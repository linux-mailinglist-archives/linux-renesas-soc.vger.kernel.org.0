Return-Path: <linux-renesas-soc+bounces-29189-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAARMlZDsWlCtAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29189-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 11:26:30 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D592621A9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 11:26:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5B71B30AF38C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 10:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 522A43C9436;
	Wed, 11 Mar 2026 10:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HSNjnK8F"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC5F3BF68A;
	Wed, 11 Mar 2026 10:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773224485; cv=none; b=VwqyFVQ9XryfpzGyWMyfapbWQciC04IrTnzKbWBQ/aw3y57T3qdDyMGwMowTXlIPqGvICG2TpuHnvv70hDjsrFgbLxOIgRSuV0GHG5cCY+WvOcxS18msu1JAn3eR0K8CI/cUb84DYqXproNEpvcWZJedo9Q/Yukg6kA83TKBLX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773224485; c=relaxed/simple;
	bh=NYEzxXwCjjB9jXQZwWbzlfrhqRkrR5nBQe83EMGp9ms=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pI/VuRt7niZThEw4cJliSYKPfS0YcCCWlmqARZ2E4zhHjP69QLxiMh+2DpwSsSgKekItXeT8bOK5ud7kTbf4L2o1LmkINHYE92G8o+zMVb5Mg6GCOq3LzBnZ+VlAWxNy2HMra/AZ2/i8VAwWLvX8seJVHyqbsBB16fXyAp00VX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HSNjnK8F; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 941031A2CD1;
	Wed, 11 Mar 2026 10:21:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6434760004;
	Wed, 11 Mar 2026 10:21:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB43510369CA2;
	Wed, 11 Mar 2026 11:21:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773224474; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xc3f0j/XZyXDLXf8euWdBo9aYc/Z1fnksBlM+sWhSNo=;
	b=HSNjnK8Fqi6KDQimKyif2DCt8Ml4ODd2Ae5YBZn/WMno6Hymu3jP+ZoewoqkS4OlASSJMN
	joffF+yugKol6KHMmOV7vAzWwEb0g2qlpkPMrAhbDp8frIMLHtDQnTgtYnHhhaTlpEYzJV
	wEp8SpYh4sx5NZ8Kln2BKaC0jS7FNGNEqYcOWFflPG2fYyyHkSxis/5ka3pE9BoHTAZuzL
	vE6AY+hjNDPLtDnIhVeHPT6xeBfB0+yBrmoBkABd3CqjEcxHXk/+A4PZQG15nZ0VG4ss8A
	pyXV1I0N66KNJzGIJ62ByB23GNQ4dC3O7LfbPnyz/E4UEe7pNKwZM/Yh74b8gg==
Date: Wed, 11 Mar 2026 11:21:09 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] ARM: dts: r9a06g032: Add #address-cells in the GIC node
Message-ID: <20260311112109.061a1e4b@bootlin.com>
In-Reply-To: <CAMuHMdX01rwBMGn1FLGm-fHA0w-7+BCskMiucgxcui+PTVF7rA@mail.gmail.com>
References: <20260303102029.147359-1-herve.codina@bootlin.com>
	<abEotS0ZbGwqEmO5@ninjato>
	<CAMuHMdX01rwBMGn1FLGm-fHA0w-7+BCskMiucgxcui+PTVF7rA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 89D592621A9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[sang-engineering.com,gmail.com,kernel.org,vger.kernel.org,se.com,bootlin.com];
	TAGGED_FROM(0.00)[bounces-29189-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid]
X-Rspamd-Action: no action

Hi Geert,

On Wed, 11 Mar 2026 09:39:40 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Wolfram,
> 
> On Wed, 11 Mar 2026 at 09:32, Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > On Tue, Mar 03, 2026 at 11:20:29AM +0100, Herve Codina (Schneider Electric) wrote:  
> > > When checking dts involving the r9a06g032.dtsi file, the following kind
> > > of warnings are reported:
> > >    Missing property '#address-cells' in node xxx, using 0 as fallback
> > >
> > > Indeed, #address-cells is not present in the GIC interrupt controller
> > > node.
> > >
> > > Fix it adding the missing property.
> > >
> > > No functional change.
> > >
> > > Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>  
> >
> > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >
> > I like Krzysztof's explanation "Value '0' is correct because GIC
> > interrupt controller does not have children." Maybe it can be added to
> > the commit message?  
> 
> Some of the examples in the GIC DT bindings, do?
> But #address-cells is not a required property in the GIC DT bindings,
> so why should it be added at all?
> 
> BTW, I never understood why an interrupt-controller should have
> #address-cells (according to dtc)?

I think this comes from the interrupt-map definition:
  https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#interrupt-map

Best regards,
Hervé

