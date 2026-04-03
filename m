Return-Path: <linux-renesas-soc+bounces-30830-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLmYMwyGz2mwwwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30830-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 11:19:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 30015392B57
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 11:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C141930500F3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 09:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D1123D7F4;
	Fri,  3 Apr 2026 09:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="PslKTtQK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010049.outbound.protection.outlook.com [52.101.229.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A9420DD51;
	Fri,  3 Apr 2026 09:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775207493; cv=fail; b=JaeJfMIUt+v/S0uLt1WyKUdUaw7hqgT3ugSlfHLBakiGplT6zC7v1TvyIFnghZ/Bs3+y4jTsa8Nk17mnogvOu9CTHaCmdHUAH2t6oqiPH906bF9y0XDH7q2o2asKZ9R2OI8aTIFQegvMUPcI2+xQkzWYwx1//yC5C4A6XLYZkpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775207493; c=relaxed/simple;
	bh=QcAWpf1mrPFUxobvAkUySyKh+0MHaNcpNPf6AGsVFmE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gv/ovE5wFTBXDxPX9nfSRXUegK1GSoFJM3AeAdyp1vb+LpX2I/dI455OIOkzr3xljUOMhhI1+AIgGVgQY3f4+HX9rVntFing2zQo+HI/0h8Kzc/z5p+JO9Yw9sBm0lc9IAtuRPTHFrj2R1TOwMDL0G9w+FdsHyBan+Febr2JmMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=PslKTtQK; arc=fail smtp.client-ip=52.101.229.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WGSJqX44JR0uzpaz6v966117Ep6yzr80a3NxsWzP4WpuNeuS6vEqlltkUL9d1MGaykO+WAh46TjBMLZ1rQMhiEs7/YNPMHh/pArwfY84exSRatW0GPTI89+mDYIEhV8HNZ4KB06mOYUiS/dLkGVNC2HV0beVyscw5BDhz2mobdFs8EoPPu6C/ew14DKiy5LhZbJpCjDzYX3h8EcphhCn7Xi2hYPhGIjgXj/OKGJBEgh4KPSYD++f0KsvzkfwlOV6+IdLk+rik8a1ZceKDLzcFKQrBiTgNOw6slJGeMkoVwbRhKDIlfegA7fJA9ETMQ0jhD4rCpilFapEogoUiz80Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xy8nDwb3dFrfVMVtEPNO95IuLyzHbEHqvIe/6rE//6Y=;
 b=NjKdtxQunYuENO6rJK3qLP+WLksPqSvpiNuWTjcxMojQHlYzu4Ckfowa/qpY0xFzoBc4Tsf+39MgvsjW0ojLh4dRYMHNnVOuynbMxpMW96NcIJwkYMyqOinLNZ/X2oP7LS6fxet3igVoYD/msAHOESXJWDCmOF9MPPUlmgWS5eR3d5kb62CwAgTnTIHT//u4FODdKhCaa1FutMVq6jFdIcfTf5SasRzSsUT6DwRkhXpT02vqb54x44xzk/uGRWwrDGcNdLE6dcIUNNBl4Xpim4phqsrpcG0JlO+2pn+CXSH+ikoxPHhZNprD6i0pGZVbeY3UsLvl78otiVlnnOJZDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xy8nDwb3dFrfVMVtEPNO95IuLyzHbEHqvIe/6rE//6Y=;
 b=PslKTtQKUM9Ofc1AAzbUiI6nNt3NFobcb9zAn396WLWn9Bs7Bm6PltV871eZJcjWyK3GOI2Dr32+nqx32tMAEJiS8uQmtBDXtLtvoyCmAoElQ639TrRjpH9dTROHPRm6tnYirifiV8YvGcr3si+7Q/SLlj56KQklC55+0wXFRD0=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYRPR01MB15091.jpnprd01.prod.outlook.com (2603:1096:405:226::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Fri, 3 Apr
 2026 09:11:27 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%5]) with mapi id 15.20.9769.020; Fri, 3 Apr 2026
 09:11:26 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Thomas Gleixner
	<tglx@kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/3] irqchip/renesas-rzv2h: Kill swint_names[]
Thread-Topic: [PATCH 2/3] irqchip/renesas-rzv2h: Kill swint_names[]
Thread-Index: AQHcw0aqKuKWf6oZu0SKGQ8//uVbabXNDP/A
Date: Fri, 3 Apr 2026 09:11:26 +0000
Message-ID:
 <TYCPR01MB11332BC357F43F58B117AA8CB865EA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <cover.1775205874.git.geert+renesas@glider.be>
 <aceab3fbc307ef428dfd62d8d846b68704dea012.1775205874.git.geert+renesas@glider.be>
In-Reply-To:
 <aceab3fbc307ef428dfd62d8d846b68704dea012.1775205874.git.geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYRPR01MB15091:EE_
x-ms-office365-filtering-correlation-id: c10bb49f-e18b-4cfb-ccdf-08de9160fc4e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 f0fQ4TSmPyFtoxh6YsG0Z29uMMu90KvflHzE5lwuVmhGNIv23GmoGFzSkgLO0VmqlvTT5fvSOPjR8JS88bZ1MDhTEwKTEbiCtvPqJ3CdUirFt7D4HCvnV+8cH/kR8CF1jWIKU1BLYGHDzqJ/9Wz8LVRNonu/rnejQGNDWSHQGeRw+mffqJr74STwj9RCS6pg3PaGxbDfZ0RT9VbdpMJC7u3VbY9dr8TR2NUdgHTZPL8tlT+LS8hOii/pp21QyHMhhwUe8SlNonN45BxOXFjKmi+fKEqq6YxOsYUqr3Vu9sgg96XQHo2auC/YR7n4w/RtKtyNj5ccG2Axmj9oxa/O8P9mTSCdLgrZzCTQqFqg5YB3/JicrgmuzTnulydWlsd8wbcMNWZ8TINpiA7aHVKypDdw1TGn/BpluB2eGzQusCC2Y97TXwTU+jjrmMV8+19bqE/7KioU9uJ6jqScm5zgjKAxoHVNLsax3P+6Y9fbyjF02l1ENJMioVh/0x1Y4QBwPyz1xRADWgowpM2wvVAOW+JDW5WqbJN/nl0puHBx/41h6CtuuICcOJaioPJNr4rr4IYtCgZULmlnnrw8S84iDFnOeV8ZXZfLWnDMh4YH1q/2S3cCpQwu9n+iTRjHpMeQZM8azQPj9L/r6dqBFccCyOdaVYZZL8Zq0OucvVvomMD36H7F+mcsn1i7jVVLEk3Y9GOp0Jz/GXC/Pz5f2BEMSCICx8rXL2Emo+kSxvX/xYqn/uHK01aJGCmhKA2DlQEHf88ZRrqze5yNfpk8awynEvHYM39gGwpXSxpi4K+MWGs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?UZNFWrzTXfgK6fQsWVx7Zxyglnyzphh1IW8eI/UnJxmzf3IJUmGtCBkPdQwJ?=
 =?us-ascii?Q?mbRQvdXm1yLmyCL5uwhlmfCGG1vNymm0m2+W98VUlpanOkDagF7m879dpIY/?=
 =?us-ascii?Q?gJfDHLjdmjVmSLpe5AjcX/7i2ISR2sZEXL6nINH8eAipmr4fWktJMdz/Tyo+?=
 =?us-ascii?Q?PR+vo330HGaqYXhZxCb362zmW4zvBcUyAVB/L8iFnwfpnrw1JJlAuMjeQQ1C?=
 =?us-ascii?Q?sZpWH/VsJyYIYxk1ocLy0sjFKKSM/7G10LraUN5aD6zYWnfc813OthaYTVU/?=
 =?us-ascii?Q?Mt7chr+HJs0EvgAzS5036Rfs5yyoUHoSiWWGHdUR7Ny8TOkD64guRJfjdhTW?=
 =?us-ascii?Q?7E6rAwHXwKSz1sFjE1Zuzy6ehhS7g1rEI5lRHsOiwZVYpSYkqLRSNrs+BjmI?=
 =?us-ascii?Q?neu7+iTPpTLM75as7s96bKUQOALej6sSeWToZItGl8dg4NH6gzI8EmEBS8hn?=
 =?us-ascii?Q?awxxyXBXqRR4O4NG+xO+EMZs4070knVICIKb8nq5NoCbnejKCPp04YYXyB+A?=
 =?us-ascii?Q?YJJGXcJIihtq6wVbCB8hqMJjWDfKXXYHf/yBCykMygShjzxqakjt45LSU91A?=
 =?us-ascii?Q?tAdmRWMj39MExsiedxHjFQmDoWoBZwhsGhdRUCtNeSGq12zrBBrqc80BCbXe?=
 =?us-ascii?Q?SejjMTi1JhOMm7ZFCLcKhKbEimhVQ4FPvSLQfy4vm9T77hjJUwr28iqzRySH?=
 =?us-ascii?Q?zD29ya9WTEBX8etYiViNzUNj9sf9Kk2MDA5tRjg5V0rQ27GXA9xGcDYtW+Af?=
 =?us-ascii?Q?mO55Qt/0b7rlYx9aRFasMbg0BWCcWdOU0nc9I0+VGDAWdfemDvjhfrPLa6WE?=
 =?us-ascii?Q?pbQVdPcM95bzcsxwhIeBYZ3uGA8InxJ9KqMo1dCWhoQzA8W88hQcUH71PMWf?=
 =?us-ascii?Q?+XZTckHzyL+Puh2pAdzRpL2Ch1coArfvT2IewE178orTGYhSxjkU7vLwBGfO?=
 =?us-ascii?Q?vqO5fE4ORCliYvG1CJMh87F3FPK2Vdcp2oKch4JV8Y4GThqMAqdAtpTD9Tvy?=
 =?us-ascii?Q?5gGiu4GqsH9XYZuoat6n6gbeP0VMy4Z78H9GevZm5e6sq6oLJqFLGeAJJ6Q5?=
 =?us-ascii?Q?BNKEi+d53Mk4inoAY0ItuGSABqmnrC3doVUi0miB8i+QPnBHcA8pb25orZnt?=
 =?us-ascii?Q?JRcuL2uE7bzSnYWCLC17XhsmYVZCVSYLIKLCa80s7eOIsXXKKu5lGQsj7Zr0?=
 =?us-ascii?Q?FsMxlXvsS0c+4+gQ0+IhWMVm1eoyQWs94vbGuUvtmv7Mw8wuGDCl2NXiLtwk?=
 =?us-ascii?Q?LYfxXSa1PCWMmRRxS4SRoyAWZOkZyYcBOH4FgodaH3HA3Qy686aveQDauU+/?=
 =?us-ascii?Q?fw5DwnWNRH4nJFPyCi1y/0p1BkvISw5sEwLa0EM7nM1GBVawqBOblnvJPlGk?=
 =?us-ascii?Q?L0zLmrD05o4hPRG8TmgoPrUgw/dfLwxmU075APAn3wnZWR4mqLHvELQtj716?=
 =?us-ascii?Q?13UYy1OvQSfJQSKJDsJFr4trPltKbYPO85OpOEDeXXNjX4o76kQ2I/BOWkOq?=
 =?us-ascii?Q?iyeDuOTYPfILn+g70tXMXjrFGBqsArhpry7spKqowrfkqdceZGVcmarEatM0?=
 =?us-ascii?Q?wgd9Igg3qvSKZWXBc69LUla274i8m9HcElLLFxmLokV+2cixA1KPaKmQ4PAx?=
 =?us-ascii?Q?8UWB1LrOO4TXkYfoxkffpEqBMn39SNkDZ0PEIeApyzMiqyO3FDyn6AdXxniA?=
 =?us-ascii?Q?JLNHHDF2rzienwhJLuuWjEhAfmEn0Y6cBxldTshOPGBqCezoTzFTSzZ1iZvo?=
 =?us-ascii?Q?Y1OKXl4BMg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c10bb49f-e18b-4cfb-ccdf-08de9160fc4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2026 09:11:26.8979
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9tBYNd3K2KC8BFKYnqOks5hxPqpruRPNYJ7IAKoEqF9NTb67Rd7Znq4DpJPHYq/QVnoDFd8Tfnti65by/z4DawfZhhX22Gq9dMYmmBivhbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15091
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30830-lists,linux-renesas-soc=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,TYCPR01MB11332.jpnprd01.prod.outlook.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 30015392B57
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert,

Thanks for the patch

> -----Original Message-----
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: 03 April 2026 09:48
> Subject: [PATCH 2/3] irqchip/renesas-rzv2h: Kill swint_names[]
>=20
> The array swint_names[] just contains expansions of "int-ca55-%u".
> Replace it by formatting the strings where needed, to improve readability=
.
>=20
> Despite the two error messages can no longer be shared with the ICU error=
 cases, this reduces generated
> code size by 56 bytes.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
> ---
>  drivers/irqchip/irq-renesas-rzv2h.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-re=
nesas-rzv2h.c
> index 6fa8141adcaa59f2..d075196bdc741c7f 100644
> --- a/drivers/irqchip/irq-renesas-rzv2h.c
> +++ b/drivers/irqchip/irq-renesas-rzv2h.c
> @@ -755,10 +755,6 @@ static int rzv2h_icu_setup_irqs(struct platform_devi=
ce *pdev, struct irq_domain  {
>  	const struct rzv2h_hw_info *hw_info =3D rzv2h_icu_data->info;
>  	bool irq_inject =3D IS_ENABLED(CONFIG_GENERIC_IRQ_INJECTION);
> -	static const char * const rzv2h_swint_names[] =3D {
> -		"int-ca55-0", "int-ca55-1",
> -		"int-ca55-2", "int-ca55-3",
> -	};
>  	static const char *icu_err =3D "icu-error-ca55";
>  	void __iomem *base =3D rzv2h_icu_data->base;
>  	struct device *dev =3D &pdev->dev;
> @@ -774,16 +770,14 @@ static int rzv2h_icu_setup_irqs(struct platform_dev=
ice *pdev, struct irq_domain
>=20
>  		virq =3D irq_create_fwspec_mapping(&fwspec);
>  		if (!virq) {
> -			return dev_err_probe(dev, -EINVAL, "failed to create IRQ mapping for =
%s\n",
> -					     rzv2h_swint_names[i]);
> +			return dev_err_probe(dev, -EINVAL,
> +					     "failed to create int-ca55-%u IRQ mapping\n", i);
>  		}
>=20
>  		ret =3D devm_request_irq(dev, virq, rzv2h_icu_swint_irq, 0, dev_name(d=
ev),
>  				       (void *)(uintptr_t)i);
> -		if (ret) {
> -			return dev_err_probe(dev, ret, "Failed to request %s IRQ\n",
> -					     rzv2h_swint_names[i]);
> -		}
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Failed to request int-ca55-%u
> +IRQ\n", i);
>  	}
>=20
>  	/* Unmask and clear all IP/CA55 error interrupts */
> --
> 2.43.0


