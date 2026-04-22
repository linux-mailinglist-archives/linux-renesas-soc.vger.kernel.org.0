Return-Path: <linux-renesas-soc+bounces-31480-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CKPAoZj6GmpJwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31480-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 07:58:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A769442354
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 07:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 61EF33024A31
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 05:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E6D2D060B;
	Wed, 22 Apr 2026 05:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="HXLCoyB+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE6B26AE5;
	Wed, 22 Apr 2026 05:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776837505; cv=none; b=sbWpGKlTJw0CgbHpmH53aKV/wpusu6yi5GqlAvE87Wp79nMlg41h/ylikGWgiRIpfLDxhmUNNIDkU/QfNVkFktIv49L3P3+7YcNlcz9xPlbOLi2Q+SvM1Q8vVzLCUyi5lpBY1fIvC7OsWfYC/5n0flyQGUZvW6F/D4eM1YdvQZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776837505; c=relaxed/simple;
	bh=+SBEpZLG6GAppa05nCtpaeeSwAjeK6SPvGIAE88fxXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tt2xNxXXi+W3yQ83Rq9R8/ek+pY9xaHZKiNlkr+N/qfs3nPhuH1v+DZapBl5he/xqqzv+rOz9p7Dzzh0KBh6dfpcHYTS2pTuUhd1REgdQ0FQlEyYFpgaGrDBEC/sIig6ZjyMpauhGlSJP16Ck67Ysx9Yjy6RkKDI8IKXQohr5YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=HXLCoyB+; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=lY/hgFBno9RfdYpXPt9j6UEb8sKZ4/mklIZ8F7pl0vM=; b=HXLCoyB+DDPSKlJJ3Boim+K+Al
	rIESKF3BZiqSWEeF9naIuwgDEmrEnO4nD+xWLLokehnTu+fJEjeqpmT5vdXlMlrtaTgAIaC2tYJzY
	b5APdYSaLl57W/2Z18OmHKDUJv/BNlQTxQ6vAY/UA4JXzywlhyBSYJoK5VXNjhvBioTpH+VEDfks7
	XSjtJPD4qXuo/NYxyPrwWr0WGdC/iFVSfdaRj/71uWzG5eZeIQrOX2HcCiSGQmAK6mJ6NO0YMtnFw
	jXqbZLteEFgYE7unJ5SL0fbyROzQSvQwV9siF48xzWx0Ri0TN9qr1Nymw80+gbLcDCaldNfbU69O4
	IikISMtw==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wFQbF-000GKu-0q;
	Wed, 22 Apr 2026 07:58:13 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wFQbE-0006jK-2r;
	Wed, 22 Apr 2026 07:58:12 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
 linux-renesas-soc@vger.kernel.org, Daniel Baluta <daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: add tqma9596la-mba95xxca
Date: Wed, 22 Apr 2026 07:58:11 +0200
Message-ID: <5988897.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <4f436a21-ecfa-44ef-9002-c64ebd5e30ee@oss.nxp.com>
References:
 <20260326111803.1248934-1-alexander.stein@ew.tq-group.com>
 <20260326111803.1248934-2-alexander.stein@ew.tq-group.com>
 <4f436a21-ecfa-44ef-9002-c64ebd5e30ee@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27978/Tue Apr 21 08:26:17 2026)
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ew.tq-group.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ew.tq-group.com:s=default2602];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31480-lists,linux-renesas-soc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,glider.be,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[alexander.stein@ew.tq-group.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ew.tq-group.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7A769442354
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Am Dienstag, 21. April 2026, 16:48:25 CEST schrieb Daniel Baluta:
> [..]
>=20
> > +
> > +	reserved-memory {
> > +		#address-cells =3D <2>;
> > +		#size-cells =3D <2>;
> > +		ranges;
> > +
> > +		linux_cma: linux,cma {
> > +			compatible =3D "shared-dma-pool";
> > +			reusable;
> > +			size =3D <0 0x28000000>;
> > +			alloc-ranges =3D <0 0x80000000 0 0x80000000>;
> > +			linux,cma-default;
> > +		};
> > +
> > +		vpu_boot: vpu_boot@a0000000 {
>=20
> Should this be memory@a0000000 ?

According to schema in dt-schema repository [1] the node name should
describe the purpose, so I would keep that. But despite that it should be
vpu-boot@a0000000 (without underscore). But as this is unused for now,
I will remove it.

Thanks and best regards,
Alexander

[1] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/=
reserved-memory/reserved-memory.yaml#L25-L28
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



