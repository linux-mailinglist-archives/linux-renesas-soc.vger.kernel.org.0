Return-Path: <linux-renesas-soc+bounces-30878-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCLhEdAT0Glu3AYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30878-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 21:24:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B37E3979A9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 21:23:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE203301B916
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 19:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22DCB3D523F;
	Fri,  3 Apr 2026 19:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="BqSU2CF3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010019.outbound.protection.outlook.com [52.101.228.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8916B32C924;
	Fri,  3 Apr 2026 19:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775244235; cv=fail; b=GecFELDYJb58tmBXQrCt8Gn/vpRcEKItvyqLpCV/B5h01BaAUKstgCRz47cuenVNUG1RTPFTAGsQ1K3D9fqM1jWUrZXR4I58qspx5oAQ7a2T10MWZA62VqXijkLrgESfw6a/NJnbWkf6Msu6WzQNSLg+yE09CsNc9hYqslXZzQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775244235; c=relaxed/simple;
	bh=VEvT8c+0sp4cTBTw+25b577Wps4xJR0j1mKsBvLpeYY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=E0ln2aKs2a7nU/pA5C4qxti75sAUaomgRVhRKfiDoX/+r4t3M0FI03rhHTNWKU1/z3vv/egEPHhetC+OS/dEPIwFthi29ovXg3RUDV1ocJD061CRICTzBry2xr4197UJ6TeJsnSk/QkED+FUT5Ey3K348YE+p2dWLMtcCTJ7nYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=BqSU2CF3; arc=fail smtp.client-ip=52.101.228.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yki+oKC1Ei5c9sjiSHpm47335rh3woR2jZPUOw95pDZdZLC938BA9qoga2KRoQ2ttdaDxK3HRuO/g7AdWZjWebnbAACukMqJSxKu8u5zDRTyEqfXf+JavppB/wLif40xV5v8WC/WHSk36H6LQmL9q2nzjFVz19vtk6YnDM4XddD04umlWhjCn4pKC/6bBRjaBusHK2WSLwHzSo1X+PdyOWwLJDlHUxHwntyIHyloGfQP6YSxQbPlICh5w6pTmzgNHLKxmXtPaU3NfS6YVyZZfayu+WOfqKC6ARwlTUr6UBH74Z86e3vUs2vgnQTQP0qRS5lTLgHZ1ZmOqT+8+rqh8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWrJ58ICtjN5s3+XS6Occ1jc8dk4cKgrmRE98HTvM1M=;
 b=nEgp2o/0fJUI5Ms9WZV6wMoxpIxt/HPm4YsSO4+SUQVjfxIJcCHHA0KXP5JQnYjWk+7pt0ncEBLhJlkIoyJ2X1RmzhbKXbfw2q7vWb7RjrR6EpYsRM18aKyKWlWWnM4DBBzdFHDEL6GWTYbG+wOGjRQdkSgAIMeAsWIZ46C99LNE5rSsX8IhKIoLHm717oEYGvLn7qFWqSMhl11HV7dYVjCcnKdXZZt6wLYs6NgB8eYYrTNh37Jj2tmKyEEPBkEFvT0o5GXZag7V+06WdOAJ6YGaWREAdmyxK8Rw8CusMsWGblm0Kss42y23kgrCLHKNZgv5C5GLvALGpthAb6x06g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWrJ58ICtjN5s3+XS6Occ1jc8dk4cKgrmRE98HTvM1M=;
 b=BqSU2CF39+m/wQWIMXdGWpr5r27x9Dds0DEnUs5syOHqk7L+i1Zvc64+gVGpE6WDH/7Zhbcwl3iUW1MlFbU8RkX9Y3QAaSl4HaHkpID/6GcQ2uoAFyaswhs4jCIWGbxHExTPaZT4K0gkDpav0Vy3WuC8IwKIm6TxuAq1+iYek60=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYCPR01MB10309.jpnprd01.prod.outlook.com (2603:1096:400:1eb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Fri, 3 Apr
 2026 19:23:50 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%4]) with mapi id 15.20.9769.016; Fri, 3 Apr 2026
 19:23:50 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Mark Brown <broonie@kernel.org>
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, magnus.damm <magnus.damm@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Biju Das
	<biju.das.jz@bp.renesas.com>, "john.madieu@gmail.com"
	<john.madieu@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCh v3 08/14] ASoC: rsnd: Add SSI reset support for RZ/G3E
 platforms
Thread-Topic: [PATCh v3 08/14] ASoC: rsnd: Add SSI reset support for RZ/G3E
 platforms
Thread-Index: AQHcwr1hbeDA1YxNJ0iYPTuQw+cdtbXMDu2AgAGqHuA=
Date: Fri, 3 Apr 2026 19:23:50 +0000
Message-ID:
 <TY6PR01MB173771EA6FBA232134DAA52E7FF5EA@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
 <20260402162436.12059-9-john.madieu.xa@bp.renesas.com>
 <cbd544c2-cfe5-4eb3-b414-7f3fc9b57346@sirena.org.uk>
In-Reply-To: <cbd544c2-cfe5-4eb3-b414-7f3fc9b57346@sirena.org.uk>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TYCPR01MB10309:EE_
x-ms-office365-filtering-correlation-id: 746c855f-ae84-493b-c98f-08de91b6894e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 jHLUQACsJOCZpKh0qvdGn5IrIggypIZjkheq4cDulN6sh3vaNahg6aCSd/P8/FDEXkGNylJNgduJ79YgehAHuwOoqfDo36WC1QJVdVjTtgdszomTNe47lt93CvDjBVdqXSZdYLitNQ2CMErD+JmXIJJqW7jShXv9OsuKbblukGhmKih2ic+AU3XSXq1fgl8Mh8gGh5lYI1tia/iDbogl80K7+qSwvwTc08B4WrhizYtjBEhNuGdXCW/zdiaCyQEYI+rvNpH4ypIGHqiz4qwNT4eDHxPriB7eR6V5wBQtF2/4dnDPI9mseL21rPZs/EK3+PCOk5klx42iHb6JUNG8+Yzf/YCFfUhiaFD+lQ55oz0srXdbPMhD/6RcMX3tnveLxt7B9d7OYbk/3totzOQl2l9O8C9WISUghvU3ijsw+jjf1C4UT2g/fVrPkFiPAmLUa07b64yZEn0Gf85DvA7qsKjVKVwD7u8jzvoepGWqBRqHsHc9Moy7IWkMugnxFS/Tyy0Og8BHcyJXUT/16ignHS5heeFu3MtNcPOM1n69ReE/MX906bFtYKgIy5yZ/Eqe2V6aro7Eu1CAq+e37Dm509j1/LsneyBgNsSsaFNgGafI1SRhEG0j7gPXA4cTqn7+9dJA+zzhfiQhI0izV9m+VANP2p4MX5m4V+Mv0ExjQMNt6fQrpA+CEtCtTrCEpf2HxP16BhHuQ2DYytjZe2xreEJcCFBF4I98J1Uu6448S9fQ7R7czBefMr39jqGD+tJGBX1bUWni243sDwNigypVYw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?iiFvI8COKzJv7mSBeyZ6EkM2p04+RJtNHw4P6io9BwOXSZLsDhnJgU8w2f3X?=
 =?us-ascii?Q?GHS7Jflb7hLvOP/jBgMyR73Vma8CbZc1fspLCuY0uTPXRpfJYylWVNBDdZX3?=
 =?us-ascii?Q?UK0F6MUiabUzFPI3ZIr+vCT4XQEhohbKCYFSkXmIfmaGExjQWw8A73EDb2AD?=
 =?us-ascii?Q?avaGE3S6zP7TWiHWngxHhakCf5zzNVhPg/kYSHomHlLTTOflL219L1OV7qtm?=
 =?us-ascii?Q?pyVvzSYey0DaU3FyFdiJe2uFAJ6K4mPwcI16SCgKE+InztPaD/wtpLFme347?=
 =?us-ascii?Q?HOfreWjYh7zlM35S/K4QIDAjx29HOlOJUc7mlnuTQvlXdYDtVMxT7o74QI84?=
 =?us-ascii?Q?CFJvf19T4LSvEzSiGi4KiNDYj5jngyJkMId62apEfIz6rW5O8c+TEtLCsPm0?=
 =?us-ascii?Q?2daky9El2iDvY8/uTKGOI8IyZqjL8/5oyccBOkn/RBhK2oE734IABdpfBreE?=
 =?us-ascii?Q?8Pjm4lba35BIceckGCk+5uzF3jsqRRejyK3MeGmJcrZws+Qb1W+bndTUZjsE?=
 =?us-ascii?Q?tusKWHCJ3LT1VhkGavYO62KLRYVFrSjPW4QHcRroVMtfh39lfIlRp3Pv0Z7D?=
 =?us-ascii?Q?IdGxJWt5EdTuUddKzFieG2QFC3AR2fPRvzS4n1i+bvOJvET8UCCw2ZbAhNHZ?=
 =?us-ascii?Q?NybKKRASVaYhhiuQHgBw5/VjtPCo0QO8kmzeEuMN6ncfFGRMzAxJIxlmoMj9?=
 =?us-ascii?Q?qp3+CpvmP3ijawHrYXdEWPHW38TffGmI8QkLyo3AgmDVRK40T+ygm8E2zn1f?=
 =?us-ascii?Q?Q9mS+2jT/zyYAwJ61kqRV4BKACfT+mubhyEhAZA15tijXlU5DClWK89svqD6?=
 =?us-ascii?Q?I7u+VdbEYyo/Pf1FCPpAmafjNb/iTW4+LvK9JyJqNMcioT3VKKEOKW3rqrjC?=
 =?us-ascii?Q?0l3mP+GTQ8AmSqFzVkGaSWyPUQjhTdD4sc5PYT1Ay2yIr2yRfyn0+xekd1vm?=
 =?us-ascii?Q?vTccSmWwvLQ4qCTXkkdMl9lGbxXRhve+Yb0vmeeno4KhrLxLFXChjYXnQSeU?=
 =?us-ascii?Q?QALK5P9WvpvO0XS+AwNoKYvq/R7zwz6GJ2QLAxg5WnMsPDLHdTzewA/9JI83?=
 =?us-ascii?Q?dfpZLCEzWmz53CC2V39j6yG06i4xJsf7qQGHH7B/yqLsGm4U3ojl7zLMcmPb?=
 =?us-ascii?Q?Q1rgrIYiR978ZHDZcs8fVK5fRdTynbYXfas7Lu7Hnxb5BmR1xQ0W0s2+ELfM?=
 =?us-ascii?Q?T7dPlXy7LBcrnZj2C6V4NYzHE5oXmGNYBvO4v+wAK+j5yv4Vn19GVy4AJvjt?=
 =?us-ascii?Q?7Y2lmVjrYZ02ulKFgeE5WMEhD+j9F1seTsRdpTjIoiZlVqX+jAugtu1L/SFR?=
 =?us-ascii?Q?cDqTm11NROR/5yKMWIZPcvdn6Tzc2MDk4neWqRGFEPhi86S74/pOPYR5Hq3n?=
 =?us-ascii?Q?o9F/OICCurFJyOgderfej+s411SDrL3FAMr8juK2NFXOFr7Op4LGzdb62u37?=
 =?us-ascii?Q?4dXXiIkbLuVqgIqS5qy6BHgGbqr8gKQoHRwGi6XIChhO1bZEGq7j5XBjTa0o?=
 =?us-ascii?Q?4+ebAxdFg2HLyhWO2dAyJ07PKwaA41RsA4fHySoi3evOfx7xtG3pH0Zgslos?=
 =?us-ascii?Q?yySWBBgu7KEBMA7JAO3MKHtDtKpT4vtNl9z+x95i0SbaOu/4+e2cZ4vCg6od?=
 =?us-ascii?Q?sXNvw1qpuc5dRM45U6w7BI/OUoDks+iIECv6afW3j7qaAr99TfjNoC4zBLvk?=
 =?us-ascii?Q?ZllBfEnoDsFQzsR6mclSwRCqJNkLcmSEb0GUCtEdquaiOvaBgLabTXsgxtP4?=
 =?us-ascii?Q?TB1utyPNu0Yk0V/AXDmA/tdd5vZPVaY=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 746c855f-ae84-493b-c98f-08de91b6894e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2026 19:23:50.6843
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RG0dWwAbHeaLfo8o/tjk5Zti5QHtDz1wm5024XZarSF0U+hK+b0dksYKC7aG0DVlaQyJYS9+aYbtL8CHQw5cMcatXhSxaoPvUS1cTgJ3Buc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10309
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30878-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[renesas.com,gmail.com,glider.be,kernel.org,perex.cz,suse.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,TY6PR01MB17377.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 9B37E3979A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mark,

Thanks for the review.

> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Thursday, April 2, 2026 7:58 PM
> To: John Madieu <john.madieu.xa@bp.renesas.com>
> Subject: Re: [PATCh v3 08/14] ASoC: rsnd: Add SSI reset support for RZ/G3=
E
> platforms
>=20
> On Thu, Apr 02, 2026 at 06:24:30PM +0200, John Madieu wrote:
> > Add SSI reset support for the Renesas RZ/G3E SoC, which differs from
> > earlier generations in several ways:
> >
> >  - The SSI block always operates in BUSIF mode; RZ/G3E does not
> implement
> >    the SSITDR/SSIRDR registers used by R-Car Gen2/Gen3/Gen4 for direct
> SSI
> >    DMA. Consequently, all audio data must pass through BUSIF.
>=20
> Does the driver still support PIO mode?

Yes, it does. I'll update the commit message accordingly,
to reflect that.

Regards,
John.

