Return-Path: <linux-renesas-soc+bounces-30954-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sM44Kl9f1Wlq5QcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30954-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 21:47:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8493B3F73
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 21:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B4504300D4C4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Apr 2026 19:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBD713750C4;
	Tue,  7 Apr 2026 19:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DN6FHOKO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60E75733E;
	Tue,  7 Apr 2026 19:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775591260; cv=none; b=EBVVtaAcEqZd/PnQAsGewQcQb0OhfuXqA319agjLQIuZAuVfy6taMaN0xz/PJCu/OtfBg7gYAj9ntjJMwzc8dVWkX6m6vCB5Dih3xt8VTtZwrpbxO5KxZ+at4T/bRWMJkiLQs98K982dE6dXVHOKYalH0YxKuik6u1iMRm477Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775591260; c=relaxed/simple;
	bh=DWjOj0jn944epv4GaSJc9XCCcQ76Rf1tbXvSqL9Z2KQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BFqd5YG4wvpWXi5Dy/+zuG2MpXTBRJ1KFvC6Msxeil5gRfmIxlI7ZG7myT7LtqWsFCGkD64Zdakt1E/EXWaVwFUNPb4H/UyYe6CTbyZDp94imktlOiAmXrNRcyIQOZOYcs/Gs90NDm6g5kYsdrVfu8M47hnqDnQNzrQeHsROucc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DN6FHOKO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0869EC19421;
	Tue,  7 Apr 2026 19:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775591260;
	bh=DWjOj0jn944epv4GaSJc9XCCcQ76Rf1tbXvSqL9Z2KQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DN6FHOKO0op+Jb+3t6Sy3mdJ+fdm8XEsXupFI+Mnmi0OPDV7a5jPlKJ3VQNsdXXfi
	 9YTTQFPb7/RkQYAoBNNIwnFrEBUZbCNAXlsTbm3hVFefoZ4MsRwroJCVXbi18bkBuJ
	 mV358RktTADWcS8vBQcRRzaaRsztxCKQdx2dcXS1AQKCM6e3M9tcjrm7M8Mc9nDWus
	 nbR5rRXViaxxtwq0610XZduX3A+UV+UQvURe297Rk/RGWyxhgGTev4EwigCNzveazG
	 H37KDLHklkSbVI+BzyB1lNFtP70+03FURbaPFMrh1fk9zoUA6WSnY7fBe1LUkOzBf9
	 gbbWH0PH8mRfA==
Date: Tue, 7 Apr 2026 14:47:38 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Antoine Tenart <atenart@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	Jayesh Choudhary <j-choudhary@ti.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pascal EBERHARD <pascal.eberhard@se.com>,
	Olivia Mackall <olivia@selenic.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 03/16] dt-bindings: rng: Rename the title of the EIP-76
 file
Message-ID: <177559125752.3562096.6691853769356516378.robh@kernel.org>
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
 <20260327-schneider-v7-0-rc1-crypto-v1-3-5e6ff7853994@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-schneider-v7-0-rc1-crypto-v1-3-5e6ff7853994@bootlin.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,baylibre.com,vger.kernel.org,ti.com,gondor.apana.org.au,sang-engineering.com,davemloft.net,glider.be,se.com,selenic.com,bootlin.com];
	TAGGED_FROM(0.00)[bounces-30954-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bootlin.com:email]
X-Rspamd-Queue-Id: 4B8493B3F73
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 27 Mar 2026 21:09:25 +0100, Miquel Raynal (Schneider Electric) wrote:
> Be a little more precise in the title by giving the family name and the
> own name of the hardware block. Despite the original compatibles, this
> file describes a SafeXcel EIP-76 hardware random number generator.
> 
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/rng/inside-secure,safexcel-eip76.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


