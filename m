Return-Path: <linux-renesas-soc+bounces-28158-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBgsOB5/jGl9pwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28158-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Feb 2026 14:07:42 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 134CF124A46
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Feb 2026 14:07:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 087EA30173BC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Feb 2026 13:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20E3332EA0;
	Wed, 11 Feb 2026 13:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="qn/EF+fh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799CB316195
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Feb 2026 13:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770815259; cv=pass; b=u2jEks+/kqMeu5yy92rNfrPyrBeSzfxDhhh3er8UkdMPpNKKAjIgJqoT7BDBO6n9UpoeOuRjPnHLDYnNkTU7+68eJT1oy9/QSsbk0SSdrHe8+sX2z52nZX/+nzUZJSRHUwXN+Cw2V4vIS5HRrmTAu7mWb+1Gq1Wpq/CSVdUWQ6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770815259; c=relaxed/simple;
	bh=3u7qEwIxFefCD9RIT8ZzGZntXAn+E3x5kO1a/WDdBuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l7tbuRLNBEv2VNIGHQXr9Ir47/RqmWGRg0ccNaxrCFkZLWbCYiNtAZN5j+kSYoXsXz9soCz/QYm3JrXDsN0JU9/EHnlP9EQzRBIGmBZKIux3D4Bw4PqttO8WCE+rkVo4UIH7qKGl1kjhBIf2S/s1AWeF3yBqHFENFUa0j6t7c1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=qn/EF+fh; arc=pass smtp.client-ip=94.100.134.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=e3x2+YwwuhZsQSW5fmO01fXaVVeUQQTpRkaPQngxDXs=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1770815228;
 b=pMifFNAwCEmUcFpPBOcCLymEA7CcfR/vwwSXcQsBh6Jg5evaryqqMXS5z4NTfQzMEgYmH4Nc
 j36SSAEkZu9AxInJZlEnWPgr0DRlMpi08G33vkRDPEvh6Kjsj+JLAwnNRLSdQ71TAPuDMta1VMr
 wYaBV6bpqR+1nWf5lovhUb4GxKWWHrV5KnCVqgp2LKE3SQTSVyvmq7bSx4v5159XV/tcgOULVRM
 oIVd7fYMCeuhpnnUgfMe/SLL63+xuag1q8J/w8JV+9DRJll1hgM002SwNdb/kISt/4zpbNGn/YO
 hTP8WpB8/tn+y+7Hn8RCqytIjhiVVEkdQkU1Mea7NT3kg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1770815228;
 b=PMjDE+IBrMBiJcd52lPEoRwgPevQTvaVU1TeOPKESlvCA2IwoeXlY5wpj/q4KJvvI+rglsz8
 amvAab0nAbr9WBDa80kvRyUQJTwFeQ6ploMHorahUCqIoE20FoR+Y6hePGQLCfKlKFzIangSCkP
 FwuXaJLUcUM8lIDjgsV+tPjT9PnET5c95kZX/7F4E9wE/FDZ0M/x3ymeQnCxm3Cpztk8Rexw8zY
 rHXeLMxIJkpBtFQD6OEKVMSofSR2zm1dZydDwx9+v+qkXAPWqW+5o/aJ5Pp4Aton1TCGT/crszK
 EpyGY7/CZTCxd9mqVgFw8wuE2yOAUIqdQAyd7h4srTC1w==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Wed, 11 Feb 2026 14:07:08 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 6C818CC0D37;
	Wed, 11 Feb 2026 14:06:42 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
 Roger Quadros <rogerq@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Marek Vasut <marex@denx.de>, Frank Li <Frank.Li@nxp.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com
Subject:
 Re: [PATCH v2 4/5] arm64: dts: freescale: add initial device tree for TQMa8x
Date: Wed, 11 Feb 2026 14:06:42 +0100
Message-ID: <3404121.aeNJFYEL58@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260211-futuristic-venomous-poodle-3b2708-mkl@pengutronix.de>
References:
 <20260211123436.1077513-1-alexander.stein@ew.tq-group.com>
 <20260211123436.1077513-5-alexander.stein@ew.tq-group.com>
 <20260211-futuristic-venomous-poodle-3b2708-mkl@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-renesas-soc@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4f9zGW4Rtgz3ycCd
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:6e6ea929ed061832352f734018e4b891
X-cloud-security:scantime:1.997
DKIM-Signature: a=rsa-sha256;
 bh=e3x2+YwwuhZsQSW5fmO01fXaVVeUQQTpRkaPQngxDXs=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1770815227; v=1;
 b=qn/EF+fhhKBL7GaiQKfS9J9KD0Q1ry0eetkG5pOiFN/ukYTaeCRIwVIa90R6i4mkKfMF3pOM
 hceziP5+QlAv/5p3fdijKAs2kAuX22R+UVMOFDQMQYD1s3abHMIDMEVmPN+vTLn754Ool1eIuGt
 Jl/sWw5wb2HvdcjSRmr9/mgRK/s7YRF/QADbmrCI9aCPc/2OapHKSC9+sVjrMTrq3E2pLkzvmC6
 T7v3tPYY73DO26uXlqpgwj4hhS+BHk6Q28Dbtlpk/4tUpW1tKNFlCiDH4Vz6IEFNi8DKjdmRdyo
 HxPK/zBauUHJ6o6+nYU2ZeZLLh0i4NTXlRtYTiPWkznLQ==
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[ew.tq-group.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ew.tq-group.com:s=hse1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28158-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,baylibre.com,cadence.com,linuxfoundation.org,pengutronix.de,gmail.com,denx.de,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,ew.tq-group.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.stein@ew.tq-group.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ew.tq-group.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tq-group.com:url,bootlin.com:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ew.tq-group.com:dkim]
X-Rspamd-Queue-Id: 134CF124A46
X-Rspamd-Action: no action

Am Mittwoch, 11. Februar 2026, 13:43:17 CET schrieb Marc Kleine-Budde:
> On 11.02.2026 13:34:31, Alexander Stein wrote:
> > +&flexcan1 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_flexcan1>;
> > +	xceiver-supply =3D <&reg_mba8x_v3v3>;
>         ^^^^^^^^^^^^^^
> > +	status =3D "okay";
> > +};
> > +
> > +&flexcan2 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_flexcan2>;
> > +	xceiver-supply =3D <&reg_mba8x_v3v3>;
>         ^^^^^^^^^^^^^^
> > +	status =3D "okay";
> > +};
>=20
> Can you use the PHY binding instead, see:
>=20
> | https://elixir.bootlin.com/linux/v6.18.6/source/arch/arm64/boot/dts/fre=
escale/imx8mp-tx8p-ml81-moduline-display-106.dts#L180

Mh, this doesn't seem to be necessary at all. It's an allways-on fixed
regulator anyway. I guess this is carried over all the time to silence
a warning regarding dummy regulator.

Will drop in v3.

Thanks and best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



