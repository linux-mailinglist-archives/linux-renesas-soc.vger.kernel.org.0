Return-Path: <linux-renesas-soc+bounces-33386-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Jw4DdPtHGr9UAkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33386-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Jun 2026 04:26:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88117618D36
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Jun 2026 04:26:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E41E53010531
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jun 2026 02:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE8A21CC5C;
	Mon,  1 Jun 2026 02:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="epo7cXxQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFC418BBAE;
	Mon,  1 Jun 2026 02:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780280781; cv=none; b=HS0I30lo63jrxGwLbarJLF6JHgNQOwc8dg1FGcyW785ouavcF1MuK487P7t3drMeJZdAVX1JiG9907+0AN4Ah5xblxOVpgFhtbG0bMk1iz3KWc1OuzpyrO4ShowBS4MCeOQ0H7hki9PAK/vXggdrBBy1wENa/xLFL4pt3stHM0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780280781; c=relaxed/simple;
	bh=U/+5R1lWRqJAsWn4rvOd9TEJGh0tSpWWdjHqo27vY3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rnkNlvph/rOyoFgkgj7Ok9i0jcuWwZwLCZTXR+qOQxlP5BTrH/NPhorbjLiXCohhvENki5cNoQfdxZfriTK3NWXpgcoh6PQHEN6k/P37Oa29TmSlEEOkzmamC0da76lj4xIBpKJsk3vKGd081C3rsxy5XHXy2630P/yMUlpY6nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=epo7cXxQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E031F00893;
	Mon,  1 Jun 2026 02:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780280780;
	bh=UEW+CBPeGaXOv67OjmaNomjMEwykYbnfDwfMc30LrEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=epo7cXxQUr3DwHKtUDowiQXL3Pcl9gODiCePLoen85tE7/sWnLsi+fLm7T6oko9/d
	 z58c3fj7e3ux48yNUPL6lQn5wu2AhBuW46cmCJY+gMbRwSX4DQTt6P1SLKRPAhC/F3
	 EcjsrztO5TlWmMxux6d5MXYoCn7nFa0II4noM/H90C4Y0oU3dHknsawXXLMIarMBxp
	 7iConc+bfzVDgHNoBkNhs+NUZaY1Ff82k8/+PHHFmFh1zXyM3CJxYTssR11XYMaH2P
	 vFdydS7yF5eYrDqPVGsvc58HrHMeD6zPsMQvoiJZZdEhmmqDHGvFVJ/FZedPNXClw/
	 RLu5eW7UN3Lww==
Date: Sun, 31 May 2026 21:26:19 -0500
From: Rob Herring <robh@kernel.org>
To: Biju Das <biju.das.au@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org,
	devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: Document Renesas
 RZ/G3L LVDS encoder
Message-ID: <20260601022619.GA3961324-robh@kernel.org>
References: <20260524194457.479681-2-biju.das.jz@bp.renesas.com>
 <20260524195829.960401F000E9@smtp.kernel.org>
 <CADT+UeAYhrwpmApCWaJ9w0gK3zF4eR4LVptTTwegGucvF6mmiA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADT+UeAYhrwpmApCWaJ9w0gK3zF4eR4LVptTTwegGucvF6mmiA@mail.gmail.com>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33386-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,108a0000:email]
X-Rspamd-Queue-Id: 88117618D36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 08:45:00AM +0100, Biju Das wrote:
> Hi Bot,
> 
> On Sun, May 24, 2026 at 8:58 PM <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > - [Low] The compatible string 'renesas,r9a08g046-lvds-cmn' is used in the dt-binding example but is not documented.
> > - [Low] The parent node 'lvds-cmn' in the example lacks a 'ranges' property, breaking address translation for its child nodes.
> > --
> >
> > commit be595c0db2d85d9ea1396f0f30ac7ad75f4101fe
> > Author: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > dt-bindings: display: bridge: Document Renesas RZ/G3L LVDS encoder
> >
> > Documents the LVDS encoder IP found on the RZ/G3L SoC. It supports
> > single-link mode and shares a peripheral clock and reset signal with the
> > MIPI-DSI interface.
> >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml
> > > new file mode 100644
> > > index 0000000000000..b1f6d020ae7b1
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml
> >
> > [ ... ]
> >
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/renesas,r9a08g046-cpg.h>
> > > +
> > > +    lvds-cmn@108a0000 {
> > > +        compatible = "renesas,r9a08g046-lvds-cmn",
> > > +                     "simple-mfd", "syscon";
> >
> > [Severity: Low]
> > Is this compatible string documented somewhere else? It looks like
> > renesas,r9a08g046-lvds-cmn isn't present in the tree, which might cause
> > dt_binding_check to fail when it validates the example.
> 
> This compatible is documented and is in next [1].
> 
> Q1) Can you please reun the AI review with [1] ?
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20260522&id=51284d8b1dbcd7fa0220c49eeab29b14617e0d88
> 
> >
> > > +        reg = <0x108a0000 0x10000>;
> > > +        #address-cells = <1>;
> > > +        #size-cells = <1>;
> >
> > [Severity: Low]
> > Does this parent node need a ranges property? Without it, address translation
> > for the child node's reg = <0x10 0x8> might fail, and dtc often warns about
> > missing ranges in simple-mfd nodes with children.
> 
> I don't get any error or dtc warnings. Have you ran dt-binding check
> before providing
> such comment?

There probably isn't any warning, but sashiko is correct that 'ranges' 
should be present. The schema for the parent should require 'ranges'. 
The 'simple-mfd' binding does not as not all simple-mfd's have MMIO 
addresess in the child nodes.

Rob

