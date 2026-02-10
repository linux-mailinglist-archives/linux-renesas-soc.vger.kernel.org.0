Return-Path: <linux-renesas-soc+bounces-28101-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDqiD26GimkVLgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28101-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 02:14:22 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAB5115EEA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 02:14:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 19BAC300C32B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 01:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC3424468B;
	Tue, 10 Feb 2026 01:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xp6MOftG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CBB238D42;
	Tue, 10 Feb 2026 01:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770686059; cv=none; b=K8X8Y16UyXGCEdWrtXyZIQq+sc8mAdrIzeL9Gqd1xKpTAI6efRb5FYCHuC78MmhEwF+/820INiop24AvtjqYYXr4Q+++knqc4Nm3EZPNKC1r9xanidS1GZZTi6NXb5R4WMUJ3ZOJayp8P1OoIEaAgCRzbkXB+c3kuFp/mVOmThg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770686059; c=relaxed/simple;
	bh=yMSnap1H9Cu9+6D8Oq3J4mpUg6BC7MFbdOxTodbzqu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lK+/Ipq78yfoiWGqEFRI+ivS4R0sn/LCArJCo/i63YzhF+tfgvvEg4Yutca4ZUNgVMf+aufLcC3ivBMgB8Ic9lyL5G13wxzQ23ent3nNu4KHWfWccXJ4CuwST96+kNKdMrx1W+RH7d67N0gQdcevBF+GT2QPlcRDfW9A6ucF7sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xp6MOftG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44091C116C6;
	Tue, 10 Feb 2026 01:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770686059;
	bh=yMSnap1H9Cu9+6D8Oq3J4mpUg6BC7MFbdOxTodbzqu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xp6MOftGDVcdLaI0o2bj0Sd8EimEigqWQXlkQc7FiQ5zewU7MsbYmms3QZddtPyol
	 w4usqbZU3vEz5csslDOMN3w1n0wOC/rhESf51+GTCYLgAqaPYdFbBp5L4Z0759b/LG
	 RLfRA55JNbXRSTjJa0penHvIe9uCqy7i1Z8y67zgjPVxE5N33sbI7NzQr5KKaEbUKo
	 8J+uCMw+/jv2iEAxKqJF2kDSQefj/s6bFyinvInBTR+VpRPxxN5sv72eb3UHL+flAI
	 LaWeJVQ2W5hoNKeZwGI3XPMhPZN6rKyMbPjy7YyPw2fj+bU+cXl8lBiFkoUrl+TEbO
	 y2phLy4vYqJAw==
Date: Mon, 9 Feb 2026 19:14:18 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, devicetree@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 1/9] dt-bindings: interrupt-controller:
 renesas,rzg2l-irqc: Use pattern for interrupt-names
Message-ID: <177068605793.2257614.4296319093364723189.robh@kernel.org>
References: <20260204180632.249139-1-biju.das.jz@bp.renesas.com>
 <20260204180632.249139-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204180632.249139-2-biju.das.jz@bp.renesas.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28101-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,kernel.org,glider.be];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8CAB5115EEA
X-Rspamd-Action: no action


On Wed, 04 Feb 2026 18:06:17 +0000, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Simplify the bindings by using pattern property for interrupt-names.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * New patch.
> ---
>  .../renesas,rzg2l-irqc.yaml                   | 120 ++++--------------
>  1 file changed, 23 insertions(+), 97 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


