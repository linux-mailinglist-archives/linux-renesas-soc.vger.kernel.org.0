Return-Path: <linux-renesas-soc+bounces-35060-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tYT/A+EHUWrq+AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35060-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 16:55:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA4273BF6F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 16:55:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35060-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35060-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 000583083C54
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 14:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8DC0430786;
	Fri, 10 Jul 2026 14:49:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56F44302EE;
	Fri, 10 Jul 2026 14:49:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783694965; cv=none; b=aIgqEflQ0/YQbVv6sA8TqkFBaY8QFw0SDa2gmc0q0QCaNxPn8WQCKoFfn5WX/w8i8WukSTEQ2zcLHUzACuPPTZyBbPurGs9Ruo88+CP+VahxqFF7GHq3XceI85np16VTWMRW4uS6oD51jrAJT3tMgWvWy1AJSecaZ7ruUUdkBLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783694965; c=relaxed/simple;
	bh=HNRMsFFW9sbOTufo575Gsp5etSe6HFFk3WWc1fICwYA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ITlsRg2Y6K03oMDdSLANm3yyXrpgj0SSKAzVwN9Xgx7oYVJ2nR1ymtc7+JI0Tg40g6pouTt8xIJYeTd3BqzdivzrLDERvH/UwidXKc4w/Ms0Lo7wAxutf1iRoQMJqVv2F+FAAMtzxXE9ntJuF2ze8WR5XXKjPTO4uJNIQ4Jud3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 372F9200687;
	Fri, 10 Jul 2026 16:49:16 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wiCXU-00162F-0R;
	Fri, 10 Jul 2026 16:49:16 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wiCXU-00000000EZW-04xu;
	Fri, 10 Jul 2026 16:49:16 +0200
Message-ID: <6fd99dbdf7930a98d3dbbd44c0b39658c1d5efd4.camel@pengutronix.de>
Subject: Re: [PATCH v2 04/10] reset: Add reset_controller_get_provider()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Sudeep Holla	
 <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>, Ulf
 Hansson	 <ulfh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Michael Turquette	 <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney	 <bmasney@redhat.com>, Bartosz Golaszewski
 <bartosz.golaszewski@oss.qualcomm.com>,  Vinod Koul <vkoul@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman	
 <khilman@baylibre.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Marek Vasut
 <marek.vasut+renesas@mailbox.org>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-clk@vger.kernel.org, 	linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Fri, 10 Jul 2026 16:49:15 +0200
In-Reply-To: <c415dc5f468e62cd0e2a6b9639abb92a82c01324.1783505329.git.geert+renesas@glider.be>
References: <cover.1783505329.git.geert+renesas@glider.be>
	 <c415dc5f468e62cd0e2a6b9639abb92a82c01324.1783505329.git.geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35060-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:saravanak@kernel.org,m:ulfh@kernel.org,m:rafael@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:bartosz.golaszewski@oss.qualcomm.com,m:vkoul@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:khilman@baylibre.com,m:florian.fainelli@broadcom.com,m:wsa+renesas@sang-engineering.com,m:marek.vasut+renesas@mailbox.org,m:kuninori.morimoto.gx@renesas.com,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:wsa@sang-engineering.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[p.zabel@pengutronix.de,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[p.zabel@pengutronix.de,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,glider.be:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0DA4273BF6F

On Mi, 2026-07-08 at 12:16 +0200, Geert Uytterhoeven wrote:
> The reset subsystem differs from the clock subsystem in multiple ways:
>   1. It does not provide a public way to lookup resets from a reset
>      provider (clock has of_clk_get_from_provider()),
>   2. The xlate callback does not return a reset object, but merely an
>      index, which is converted to a reset object by the reset core.
>=20
> Hence add a public helper reset_controller_get_provider(), which just
> returns the provider, and will be used by the R-Car X5H Module
> Controller driver.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Please don't. Only the owning reset controller driver and the reset
core should interact with struct reset_controller_dev internals.

I'd be very uncomfortable with a driver reaching directly into another
drivers reset_control_ops, bypassing the core entirely.

I think it would be better to let reset-scmi export a specialized
scmi_reset_assert/deassert/reset(id) API, and add a possibility to
suppress registering the reset-scmi reset controller, so that there
aren't two conflicting paths into scmi_reset_proto_ops.

If you want to stack two reset controllers, the upper one should go
through the proper channels: request exclusive reset controls and use
them via the reset_control_*() APIs from the ops.


regards
Philipp

