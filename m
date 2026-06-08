Return-Path: <linux-renesas-soc+bounces-33678-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QLzpMvrQJmodlAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33678-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 16:26:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D818A657263
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 16:26:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=STvMYlEQ;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33678-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33678-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B8D6A309DD3A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2026 14:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A3E93C8716;
	Mon,  8 Jun 2026 14:12:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5135E2571DD;
	Mon,  8 Jun 2026 14:12:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780927942; cv=none; b=W8nSvNLwL8V+TgEmHpB2z4fLa2zlzv/22lVQ9ZeMlYz4fC36QrPytUX5PY7wNNW4/aT97FXyrHi8Q8KMwMnXHtPCsRVAY3hkC3t0gUM1ADQsXUsJURLdNGMAcCGjDy+25YsqIeND/GvYZcwg7xyqTNu4wK4vBm1W5pm3e6wxBNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780927942; c=relaxed/simple;
	bh=DkilVGjZZ8mH36mHs2ezpNM/hCSxFlcR8Se6qRGtt6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L20AVL3f0QICL+PoyZV8mTy4oxse1oP8ZeocD6zgVTyz9agRzcGODv7Q/s4h/qglC94VZ5LkP4bYqlD3LLQOe5t6n1XMTMY29hvfrCOCf6LVmPsseXcwGeFLHtPLb4he8WBasX5j3jOFuVgKz9vuaANNMys0UtjRbuK7Zygqyn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=STvMYlEQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC47B1F00898;
	Mon,  8 Jun 2026 14:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780927941;
	bh=OEBUB4frnuV0v1syjChJn+9M/EhF9VBLynr6hUTAR6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=STvMYlEQaY6lXysPYA7cehtnajVaPWxctTuFBoASfyo/xlZBZlyWvfa88ipFBnn4D
	 D7EQ/QRH58XNGZDAQ4LhC3aZrvftt0k41y+/Og76HMhPegtby6s2m+kVkDSuPlk+b7
	 9+GG6AOc7zkJ6fofN/5tuY9NZ+0qQTKA4FFJSbRAhl5k3WbCbwkmuKIzBPnUMJdMDV
	 18yzD7y7bP6P0U8qqXWQsERy/kDsYiib6p64piD7H8yqYrO5gxNjCMG65xnhGA4Cel
	 zizD7Xlj92iQqNXrNajiscyBGd1AZeT98DGzeIJdaSd3b8xPfyHLuabW28nvO1qXM3
	 LoY76NCp2CEuA==
Date: Mon, 8 Jun 2026 09:12:20 -0500
From: Rob Herring <robh@kernel.org>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"magnus.damm" <magnus.damm@gmail.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>
Subject: Re: [PATCH v2] ASoC: dt-bindings: sound: renesas,r9a09g047: Fix
 dma-names and ports schema
Message-ID: <20260608141220.GA2500736-robh@kernel.org>
References: <20260605200526.683577-1-john.madieu.xa@bp.renesas.com>
 <178069496769.286078.10840905064274842451.robh@kernel.org>
 <TY6PR01MB17377F8945B85671FCD20B83DFF1F2@TY6PR01MB17377.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY6PR01MB17377F8945B85671FCD20B83DFF1F2@TY6PR01MB17377.jpnprd01.prod.outlook.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,glider.be,kernel.org,renesas.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33678-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:john.madieu.xa@bp.renesas.com,m:devicetree@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:lgirdwood@gmail.com,m:magnus.damm@gmail.com,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:john.madieu@gmail.com,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:broonie@kernel.org,m:conor+dt@kernel.org,m:magnusdamm@gmail.com,m:johnmadieu@gmail.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,devicetree.org:url,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D818A657263

On Sun, Jun 07, 2026 at 08:50:49PM +0000, John Madieu wrote:
> Hi Rob,
> 
> Thanks for your review.
> 
> > -----Original Message-----
> > From: Rob Herring (Arm) <robh@kernel.org>
> > Sent: Freitag, 5. Juni 2026 23:29
> > To: John Madieu <john.madieu.xa@bp.renesas.com>
> > Subject: Re: [PATCH v2] ASoC: dt-bindings: sound: renesas,r9a09g047: Fix
> > dma-names and ports schema
> 
> [...]
> 
> > >
> > >  .../sound/renesas,r9a09g047-sound.yaml        | 100 +++++++++---------
> > >  1 file changed, 50 insertions(+), 50 deletions(-)
> > >
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-
> > ci/linux/Documentation/devicetree/bindings/sound/renesas,r9a09g047-
> > sound.example.dtb: sound@13c00000 (renesas,r9a09g047-sound):
> > ports:port@0:endpoint:capture:0: [6, 7, 8] is too long
> > 	from schema $id:
> > http://devicetree.org/schemas/sound/renesas,r9a09g047-sound.yaml
> > /builds/robherring/dt-review-
> > ci/linux/Documentation/devicetree/bindings/sound/renesas,r9a09g047-
> > sound.example.dtb: sound@13c00000 (renesas,r9a09g047-sound):
> > ports:port@0:endpoint:playback:0: [3, 4, 5] is too long
> > 	from schema $id:
> > http://devicetree.org/schemas/sound/renesas,r9a09g047-sound.yaml
> 
> This is the 'items: maxItems: 1' I added on playback/capture per your v7
> Comment [1] on the original audio driver series. These phandles point at
> the ssi-N/src-N/dvc-N sub-nodes, which aren't specifier providers and
> have no #*-cells, so the list isn't split per-entry and the constraint
> trips.
> 
> Would you prefer I drop it and keep them as a bare phandle-array, as
> renesas,rsnd.yaml does, or is there a form you'd rather see here?

The problem lies in renesas,rsnd.yaml having no constraints. That 
should have the same constraints. However, you really shouldn't be 
redefining these properties again here, but refactor whatever is common 
into a common schema.

I suppose for fixing the rest of the issues, you can drop 'items: 
maxItems: 1' constraint on this patch and address that separately.

Rob

