Return-Path: <linux-renesas-soc+bounces-31223-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPYULxeT3GkkTQkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31223-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 08:54:15 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 278003E7FDD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 08:54:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 97F47300F780
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 06:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF803392814;
	Mon, 13 Apr 2026 06:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i1ry5J7u"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9967535F5E2;
	Mon, 13 Apr 2026 06:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776063243; cv=none; b=hh/esd0ccmXBKBeIltcD/NBDwo5vASOnUCP/Ctv4JMcUkcpg90wArnW1WfpuN53OwpG3VqdpPxiXbYqdxvNvZxNGYgGewgCwX07xQ/kJ069FWmawlHPauwjsu+pRmk8ry27762VYoldRr3boCLhZwK/t7HJXfF/VxdzKRjmpsXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776063243; c=relaxed/simple;
	bh=5ABNB8VOMVObtOFIQIy3h/bbDRmjGyrH103S1pSZws0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jYpBWiSIdHv4IuCyCGjJdz9YgKKvXPEnY0XfNQKw2q/0pmzGDWLURiUas0e1W+jPkEVdDbOQNtjRvvsYIAcNSTd78tSCAjTd3ezeCvjKairRx0Ct4KprQ5nn/wjv2kKizJWJpzVrBoKU6pmpwSJTZ/2o2XOTrXtifoz8wi0R+Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i1ry5J7u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEBB4C2BCB0;
	Mon, 13 Apr 2026 06:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776063243;
	bh=5ABNB8VOMVObtOFIQIy3h/bbDRmjGyrH103S1pSZws0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i1ry5J7udu20WdcsYFAq4MSVTOwiqiR838HoyG2yPoBUC37/HBgRTvs0lIW63SCuV
	 Rw925Ey72cprXnUK+vub28eLR7Pcw+Pv5jyL7RC/7ODylVq+qi6uWUyICVKVTnzmWD
	 ptE77WJllDh9UnEekclDOGja78KqP75M+B1n/vQh9z1myTiNHE2ZOPyPXTD3TKHnLd
	 tzfMaoAO7BXLzhnyyxHRjefv+jSG0bqHACJazeac4z/ko/kd3s0+IlTHkx1RnH2u/p
	 zXxH0I5H+XQmAtGso+cyyIrfisv0jyJuEqchYJ/70cE4Xn3WnlltYd5MitqeXgDZKM
	 kGOHBperz0WUQ==
Date: Mon, 13 Apr 2026 08:54:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 07/10] dt-bindings: timer: renesas,rz-mtu3: document
 RZ/{T2H,N2H}
Message-ID: <20260413-hairy-dove-of-criticism-97c3da@quoll>
References: <20260410163530.383818-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260410163530.383818-8-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260410163530.383818-8-cosmin-gabriel.tanislav.xa@renesas.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31223-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,glider.be,gmail.com,baylibre.com,pengutronix.de,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,qualcomm.com:email]
X-Rspamd-Queue-Id: 278003E7FDD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 07:35:27PM +0300, Cosmin Tanislav wrote:
> Compared to the previously supported SoCs, the Renesas RZ/T2H and RZ/N2H
> SoCs do not have a reset line.
> 
> Add support for them by moving the required reset into a conditional
> matching all compatibles for the existing SoCs. Disable the resets for
> RZ/T2H and RZ/N2H.
> 
> Document RZ/T2H and RZ/N2H, and use the generic compatible as a
> fallback, as functionality is the same.
> 
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---
> 
> V2:
>  * squash "move required resets to conditional" into this
>  * disable the resets in the else branch of the condition
> 
>  .../bindings/timer/renesas,rz-mtu3.yaml       | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


