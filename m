Return-Path: <linux-renesas-soc+bounces-30947-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJqCBG5Z1WmC5AcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30947-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 21:22:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 358183B36AD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 21:22:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E3D0A30166C9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Apr 2026 19:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D414A3358BF;
	Tue,  7 Apr 2026 19:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YUWEvnZK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39C9171BB;
	Tue,  7 Apr 2026 19:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775589699; cv=none; b=Fl9vazz/hXDzRBjJfluddbVcOkbfnmw+S7MmZwXZKIDHr8y4DG/H10GIP5VogLX1A8B4AuFyYeYzk/wAlusPoFOunDR0KF+LyqHDQpKfCNKu461CZiG+jtrKa1Pe40Tz82EuD8orNe1PJuT0eYuG0PipbvP2qw0deJWoHPUqaP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775589699; c=relaxed/simple;
	bh=rTmt5dXW+S0+2SdXUEAHvyF1GDGXG5dO+i794TcD5RI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YEdSsNkhWYT0U54DvTmTKiZr4KtYyrwkhxvdT5lW4Msd8wNPqvM5HfKZ0s4Q0sVPLkfyfcfqQEqLwJyA9QQ6SoJUsyDf3Yhi//kVtUyvMQV1bDQc7GPb1RCinTgZ7edPzzvzUHHHMoj4ujvoQ20KOmRYpf+yeYO8f5YvCnb/UWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YUWEvnZK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 261D5C2BCAF;
	Tue,  7 Apr 2026 19:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775589697;
	bh=rTmt5dXW+S0+2SdXUEAHvyF1GDGXG5dO+i794TcD5RI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YUWEvnZK/uw0yQKErEwQ3pscjG34MBvBNA6vObNT3QlK4o6HJwG8sWwS1S4xrKUKg
	 S3TmDpMc397v2aEdXsxQyizl6lG6NVDUu/NcUJmzE5OY2fuQa06tYRyDVV11w+p69K
	 h5tNeRX+3gcWCvp6iYmUIJKIYG4AM7u74tLg8S1Q21Ts/hKSc78029kFbiWY7eeJcY
	 D3bCSPtxe9DfbGL7Wtxp6/S8trLO0YxygCweR0t5PX8GMy/hRGu+7rmkvHSo5pVWQ3
	 4oe8mWSZF84ip/WMu6MD15fFq8EIVbgS2Zenu+/jFvjQ9ln4w3uyRIauyOKDrFay0b
	 3tv20OaCaI26Q==
Date: Tue, 7 Apr 2026 14:21:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	linux-iio@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lee Jones <lee@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	devicetree@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Subject: Re: [PATCH 06/11] dt-bindings: timer: renesas,rz-mtu3: remove TCIU8
 interrupt
Message-ID: <177558969492.3525612.13691264487981119206.robh@kernel.org>
References: <20260327192425.438263-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260327192425.438263-7-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327192425.438263-7-cosmin-gabriel.tanislav.xa@renesas.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,vger.kernel.org,bp.renesas.com,gmail.com,glider.be,baylibre.com];
	TAGGED_FROM(0.00)[bounces-30947-lists,linux-renesas-soc=lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 358183B36AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 27 Mar 2026 21:24:20 +0200, Cosmin Tanislav wrote:
> Based on the following pages in the User Manuals, the MTU3 block does
> not have a TCIU8 interrupt, only a TCIV8 interrupt, as the row where
> TCIU8 should have been is marked as reserved, and the GIC SPI numbers
> stop at 212.
> 
>  * Page 486, Table 8.2 Interrupt mapping (7/13) in the Renesas RZ/G2UL
>    Rev.1.40 User Manual
>  * Page 363, Table 8.2 Interrupt Mapping (6/13) in the Renesas RZ/Five
>    Rev.1.30 User Manual
>  * Page 528, Table 8.2 Interrupt mapping (7/13) in the Renesas RZ/G2L
>    and RZ/G2LC Rev.1.50 User Manual
>  * Page 540, Table 8.2 Interrupt mapping (7/13) in the Renesas RZ/V2L
>    Rev.1.50 User Manual
> 
> Remove the TCIU8 interrupt.
> 
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---
>  .../devicetree/bindings/timer/renesas,rz-mtu3.yaml         | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


