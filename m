Return-Path: <linux-renesas-soc+bounces-29764-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gM4WIk6eumngZgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29764-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 13:45:02 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC772BBBCA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 13:45:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3958B30560E5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 12:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 859763D667C;
	Wed, 18 Mar 2026 12:42:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EFC3D6CB8
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 12:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773837724; cv=none; b=oR1cxzZEYqvMS5Z0YipdG51SGdWuXYsFmOI3L8UgB+lrpr+hXrtrJWyNOFmTP14BbRkYO+Z8Acklx9xJDpyA2oEVse9+g3NSY8pF2NPTAMr6bZSO1rS1LlkgeWfWxHdepoQKJ8arnAt6otTrY582TWcrVSSuJJpDWWey7IvPREU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773837724; c=relaxed/simple;
	bh=7oNXhMGdRfBUz2ngYWe1N2IqdBEx1xzxGDVR7lX5aDo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D0iyhFm3bAbI3aZig+E9Tbftk9jLH/xDBGq0Qt+CaC8QQhiDkdtnmJVuGQGa7+4z5l1VlQ8sD/N6ox5CC+8Vb+R/bv1g7/9q2+ojjAIEupRj7GkSxJRVlvit3009pa8X3gLk4CYFkwgdTPhihpyQUoiPbj6D6OK9ehMq3Q2LLdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w2qDg-0001nn-Pj; Wed, 18 Mar 2026 13:41:52 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w2qDf-000uRz-0K;
	Wed, 18 Mar 2026 13:41:51 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w2qDf-000000009Jz-05j8;
	Wed, 18 Mar 2026 13:41:51 +0100
Message-ID: <b74f0d44d4f895de9c821a05d0a0d6d3c2cb5c7d.camel@pengutronix.de>
Subject: Re: [PATCH] reset: rzg2l-usbphy-ctrl: Fix malformed MODULE_AUTHOR
 string
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org
Date: Wed, 18 Mar 2026 13:41:50 +0100
In-Reply-To: <20260318120854.226783-1-biju.das.jz@bp.renesas.com>
References: <20260318120854.226783-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29764-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[p.zabel@pengutronix.de,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,pengutronix.de:email,pengutronix.de:mid,renesas.com:email]
X-Rspamd-Queue-Id: 3BC772BBBCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mi, 2026-03-18 at 12:08 +0000, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Fix a malformed MODULE_AUTHOR macro in the RZ/G2L USBPHY control driver
> where the author's name and opening angle bracket were missing, leaving
> only the email address with a stray closing >. Correct it to the standard
> Name <email> format.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/reset/reset-rzg2l-usbphy-ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/rese=
t-rzg2l-usbphy-ctrl.c
> index 05dd9b4a02df..fd75d9601a3b 100644
> --- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
> +++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
> @@ -350,4 +350,4 @@ module_platform_driver(rzg2l_usbphy_ctrl_driver);
> =20
>  MODULE_LICENSE("GPL v2");
>  MODULE_DESCRIPTION("Renesas RZ/G2L USBPHY Control");
> -MODULE_AUTHOR("biju.das.jz@bp.renesas.com>");
> +MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

