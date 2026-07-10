Return-Path: <linux-renesas-soc+bounces-35030-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iGfwCkfJUGpa5AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35030-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 12:28:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 76194739AF9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 12:28:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=LkrgFSkn;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35030-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35030-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44A0030871D7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 10:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2D1A40759C;
	Fri, 10 Jul 2026 10:21:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427554071E5;
	Fri, 10 Jul 2026 10:21:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678904; cv=none; b=XXXsWG+xv6umrQQqT0JqhSS1PSvtTZpTUnCEO3zTpb1/OGYyFVE6YbIj9OD1Zbez4a0fdNeYUZN8SF88SSfsQGsD3Ed+w/h6QRDXhAwOALdMFzdlRCUIsNMmnfNJWYDyBLDFd/6GL74gYVrQ+k9pEuQhwW6X/pT+PjUqCrqteFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678904; c=relaxed/simple;
	bh=wtmu73QitmzzmosffXemjGVrBxH7cPBF4G0ijzO2o/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H0DP4wugOUjBjwLybJLrTEmeGtSlAwY3kk0hpk3Vpr02qt/1rIuaWNWj9pymetSWVTjrwC8bGrqN9brN7/G5B1TNR3AgT+IgOyrRxuu7UZ1d8M+1uLYb6KmqXuUQdyixtgg6lLjQRqDpHLyzj1aW9jbddRebXnMsXmhHpHmdfNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LkrgFSkn; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C57251F000E9;
	Fri, 10 Jul 2026 10:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783678901;
	bh=8h7oqU5VrbSxzMabjyrEsZfFX/tU8T/jpuFUiUgSMj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LkrgFSkndzJ/SFPA+4AIzFpW4hbJopqU6uGT/fWHqtusJv4WlDihe1NYGHYkDuMsY
	 f4pxfLrC5eyxf18xnDiKEqdyLRNq3Cs+m3UA/eR7SfuHwvZNWzlBLxArTfXMnfjsUp
	 oXKmcrgYrLMO7oTps7t3Wa3qZ7j6ffYAxNJiRgRkSxqorms1GQyturavm3n0sMBAJD
	 oXrCUP3bSfKEtD5QpHAgh0jfe7nPbFmiiq0i0Nu99iQzg+dXqx9lSahoOIxFrhtSq9
	 WTjj9L1/duTwfIPnMcQ+8fkKDkwvMbWZHSiu4KFaOqNfqOTsMmhQ14A3BhRldKIIby
	 oSpOZqUZapKfg==
Date: Fri, 10 Jul 2026 12:21:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Kevin Hilman <khilman@baylibre.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/10] dt-bindings: clock: renesas,r8a78000-cpg: Add
 firmware property
Message-ID: <20260710-adventurous-burgundy-chimera-b2fff9@quoll>
References: <cover.1783505329.git.geert+renesas@glider.be>
 <49726acff0fee1c3606e83c4f242ef6aad25b4b8.1783505329.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <49726acff0fee1c3606e83c4f242ef6aad25b4b8.1783505329.git.geert+renesas@glider.be>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:saravanak@kernel.org,m:ulfh@kernel.org,m:rafael@kernel.org,m:p.zabel@pengutronix.de,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:bartosz.golaszewski@oss.qualcomm.com,m:vkoul@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:khilman@baylibre.com,m:florian.fainelli@broadcom.com,m:wsa+renesas@sang-engineering.com,m:marek.vasut+renesas@mailbox.org,m:kuninori.morimoto.gx@renesas.com,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:wsa@sang-engineering.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-35030-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,glider.be:email,quoll:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 76194739AF9

On Wed, Jul 08, 2026 at 12:16:23PM +0200, Geert Uytterhoeven wrote:
> Add a firmware property, for systems where SCMI must be used instead of
> direct hardware access.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Spin off from "dt-bindings: clock: Document Renesas R-Car X5H Clock
>     Pulse Generator".
> ---
>  .../devicetree/bindings/clock/renesas,r8a78000-cpg.yaml    | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> index 4e23bba334382346..fc499e7cf52e4f0c 100644
> --- a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> @@ -35,6 +35,12 @@ properties:
>        <dt-bindings/clock/renesas,r8a78000-cpg.h>.
>      const: 1
>  
> +  firmware:

RPi is doing similar, but I have doubts. It looks way too close to
generic "syscon" which is disallowed.

I think this should be vendor+purpose specific, e.g.:
"renesas,scmi-transport" or "renesas,scmi-firmware"

Also we have "firmware" nodes, so this might cause conflicts in dtschema
validation.  Anyway, the phandle itself is fine for me, just the naming.

I'll ping also Rob to chime in.

Best regards,
Krzysztof


