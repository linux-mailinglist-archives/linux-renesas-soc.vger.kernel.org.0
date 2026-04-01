Return-Path: <linux-renesas-soc+bounces-30687-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAodN2sDzWmSZQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30687-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 13:37:15 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F018F379966
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 13:37:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6806F30595A8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Apr 2026 11:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 641053BC69F;
	Wed,  1 Apr 2026 11:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D7teJsu3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA9B36E478;
	Wed,  1 Apr 2026 11:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042550; cv=none; b=kkMTrGi2ELHZ3yIYrfdkXTOUvMJPlhKbTP9ZdP0RwzUPUrC4AfIfgOC5fcgq/HINT/pZM3AMA7uZ1kWpQXx3s1R02DoTqdEToEB4cvbRtlW5hk7uWD3lHtsmrssR2FtCMgXzWbwMxhusrU09WV35T2pgP+qcEtpecxIjSFt67zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042550; c=relaxed/simple;
	bh=no6tpj90eoSTzOb8gpzZPZnNEwigDgO67lCKfONBgLU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hKpAvvdYaR0AWovY+boY2Yz5klXliwtPVY/TCbhhnKZDitvEeAeDPo9AGjMK6h1ax29BlvkppiHmkBDHdQtsKgWRFlGQzfur2bGAg2+sMC3+FJp9KiLL7laddp5jEAa1ZJ1Feruuol3GDW7ZCpku7EDEyp9zgUnD5T74+RksdF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D7teJsu3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58607C4CEF7;
	Wed,  1 Apr 2026 11:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775042549;
	bh=no6tpj90eoSTzOb8gpzZPZnNEwigDgO67lCKfONBgLU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=D7teJsu3cY2yFXuRTg1A9Z4ujFm0Ei21NDmsDslrZhkiLNbGaf2vpgxHgED+s1fgA
	 a6IVRUJXBtlsbwQEaUAtUAU2GgG9PrQqFOGo0/h9hOVQQTJdn50/aFlA0GZzbEms5G
	 USjJmioQ0UzfAG/G7sVnc6EjLf1LGjrnFl88IKjEbiRq2/0qJqtdOiBOe7yR4svVz2
	 muSrg60jHSUX1rppLTP+ZNnNr2DcP6J1bdqyIQn3501iMHJZSTloePG5VHcVnatIus
	 JOtPrYmcvk69NjDGvp1fBHAtR6lCtGTF8EnAMO9MgUYgN4yMXiOECH0AwQ20Qyg8BJ
	 Ms2+yxgwO13Pw==
From: Thomas Gleixner <tglx@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>, "biju.das.au"
 <biju.das.au@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, "biju.das.au"
 <biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 3/3] irqchip/renesas-rzg2l: Add NMI support
In-Reply-To: <TYCPR01MB11332DCA62A7B45AF2583DC238650A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260328103324.134131-1-biju.das.jz@bp.renesas.com>
 <20260328103324.134131-4-biju.das.jz@bp.renesas.com> <87qzp07z5v.ffs@tglx>
 <TY3PR01MB113462DB4547CBE03D94F93628653A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <87o6k391z9.ffs@tglx>
 <TYCPR01MB11332DCA62A7B45AF2583DC238650A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Date: Wed, 01 Apr 2026 13:22:26 +0200
Message-ID: <87bjg37wnh.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [4.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30687-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[bp.renesas.com,gmail.com];
	GREYLIST(0.00)[pass,body];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,glider.be,bp.renesas.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F018F379966
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01 2026 at 07:30, Biju Das wrote:
>> From: Thomas Gleixner <tglx@kernel.org>
>> 
>> How is that not RMW?
>
> It is not a shared reg, as there is only a single NMI interrupt and hwirq is always 0.
> I will drop BIT(hwirq) to avoid confusion related to the shared register.
>
>> 
>> I assume that you want to explain that it's not a RMW on a shared register, right?
>
> Bit16 - NSMON: NMI pin signal level monitor register (read only)
> Bit0 - NSTAT: NMI interrupt status. Writing is allowed only when NSTAT is 1.
>
> Yes, I will add a comment: Writing is allowed only when NSTAT is 1.

Yes please.

