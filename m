Return-Path: <linux-renesas-soc+bounces-30871-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yE7QIpn7z2nt2AYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30871-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 19:40:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F0A397133
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 19:40:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DDC43011F3F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 17:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 286F83D5236;
	Fri,  3 Apr 2026 17:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="kOudUVWp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010015.outbound.protection.outlook.com [52.101.228.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681B929C325;
	Fri,  3 Apr 2026 17:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775237971; cv=fail; b=X5hHb2pwDInMSsAHH/aQwWEscraII2mk/8Keb5S/9ILsAf346GX5AVYYLEKk7brDTMICEhERsOKfTYx1gpiC5IeMt0EjEuuGZhXZPIWEvXiiJ9e6myyUbGj5ydVeP3wNr1t8qqlVhdUYNHI43iao7ksKaGqrxmfZyB+0BGo1doY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775237971; c=relaxed/simple;
	bh=3JVATaGpGc8yKxQ2frkrg0deAi6xpUMqXuY72vucr6Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UM2S+PxDMgl8ljUk/tg2hzYrb9ggmXUuqeqZL+501apcekBV5oNuJKIBoFhH/nQUkYxSqhTWeEQgfL1hrvf0t+uR0wIOfm9ifkEfcnSk2Jl8rKyocQGJ818GuJRdgtPHCxoYg9W8JLljRR2OTRjDpiD/ykYOqxlS4n+M+f4x5bY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=kOudUVWp; arc=fail smtp.client-ip=52.101.228.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lXLO4dFfhleVzaaEIblhSGbXXf8Xv8nQYjRRIx16mhWAPC/Wy1Dcb9+R5tT65xSwQBR2IggAO1sBxiLBUNcaI0zZ2r0t10G3h/ljDhDj0D5U8K3925GUW3VyxCwW48cxArvWUpdkb2M2jwNQYa5/TFQDeRjxA5FIQeAxljo5BuZWy9UZyJm+ARd4s1/wYC8XH+1TEigBtneEunz/6HuPWHvrfqOuQRaEhTHlzBFWPQdYZLBa4Aa8j6ubL+/4aLk036iNdd4dP9AbN62UnJN7IbrPvXBHSrBIOh2caAUmvgXtDaik7X4pQ3PKXj6Kk5DO0kfhWRjkb1PiEErfAj8VQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZqa9TGfT3HyrOIJMKEVwleSIO8wsi2n73YDjK/3hb8=;
 b=ZAUbuJY2VUSUyTQHt6H2xrAz3TFvQ3N4VwPggJgjujLwNVOdVGRA3QlfOIDdcj7tp4VoqkR0CmGLdOxywAu07BA6QjjbCibgpgh0HJRHb0zzpq49hWX4Lpy9IyHONQtNCTEhcQyV3KIlkVg2z7cvHi2HWauZqbjYwg+990Dy6QkMouj/N87o4B5UKFRVRRkRNpVR1ykdIt/1ycflEY01MPM8D/u8Q3M2Qmz/1Z1MVy6BHbQrn4ygm4KHifhI7+WuKHcSzYqFa4V2m6qljXUwEa9HO5Sd6L/98UyyOJduzb59blPlwjtjiWvQ1uyr9XCR4CRPgpvNSQvP6fWekA553w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZqa9TGfT3HyrOIJMKEVwleSIO8wsi2n73YDjK/3hb8=;
 b=kOudUVWplm2C4Icol1R0mDgfYKedrTHv4sR0ek5JVKWoPH/FzOSdSvoDQVDwqlW09E+9zJ+mJxqAdndnMxntSVAgNhfjl5GdRdNnezQu7h7KlKGgmPyeforlT5PZ9p5YOJDhulG8tqXk2mHa5nw5uDVPeu3h2bC+Rt0YVhW3Rfw=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TY4PR01MB14536.jpnprd01.prod.outlook.com (2603:1096:405:23a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Fri, 3 Apr
 2026 17:39:25 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%4]) with mapi id 15.20.9769.016; Fri, 3 Apr 2026
 17:39:25 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, magnus.damm
	<magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Biju Das
	<biju.das.jz@bp.renesas.com>, "john.madieu@gmail.com"
	<john.madieu@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCh v3 05/14] ASoC: rsnd: Add audmacpp clock and reset support
 for RZ/G3E
Thread-Topic: [PATCh v3 05/14] ASoC: rsnd: Add audmacpp clock and reset
 support for RZ/G3E
Thread-Index: AQHcwr1YQHUpSmHrhk66hYJYZ0MlabXMhqaAgAEU0mA=
Date: Fri, 3 Apr 2026 17:39:25 +0000
Message-ID:
 <TY6PR01MB17377E108368073D4CACCB72EFF5EA@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
	<20260402162436.12059-6-john.madieu.xa@bp.renesas.com>
 <87o6k0g8e3.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o6k0g8e3.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TY4PR01MB14536:EE_
x-ms-office365-filtering-correlation-id: 6cd65648-ccdd-4ef6-4f9f-08de91a7f30e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 BOM2G2ttqMOBBRPsWU6caZzrry8lxEfWjuREmBxpMYb9ScefAKAED06CJW9bnoAAIHsaWWpLz/9ZO0tGfghxclIu4Rqtgka+t9tKxWWicyq8JE959juBT9sY4F7ye2HBLIlLMycm1jqPBsqwTJGZrG8wKn8bYA0RLzDi2kGTDVK0hq5IY5U9JTkHQEL8efME+3SUdTPWgOG5csMs+eZ3soxznxmgIzlIQBr9p9DUJ6BUiFCO9Cg/0rrtnm28fWFl3e8sy2npr2Izbl2lOVEn0YeZ14hIcBML4DXuNpswOhOLpEZSpY1ciHnzqMlJv3yn4Nr87cozHhy9EJK9dqb2wLDq1yEgX+II5AyF29FBPCfpMR8WfwmC/4k9pINIgpcYZIHEJL5k0GMwR7N5EmZFTCHBBDJg2EqDGsSfk4FLyQ00B4URlbsevPbV7J7hzjE2rT/Xv+MHKRmFN6Xnxa3iSI7PEJQ55Ej/XWrKILLJ7DVnGLolmFdAgKYaVkCCnO02BrrFzPbAkp+dAgyedp7oP0g0a0T91iPqs5tiurvFVVoKHh2dVx9Y28aTxSShuKRVFUebv5R0OZIKVdKFZqeHEjMZ/FfnCTJ6kWnsQt6CE/wLlSnay8F0SYSzJ+D+94hySPDKu/+3olmVPOmvCDg4fOTHi3NKP5/SjtoJ5u+UT4nc5wC3/1DSJurXa5LV7vIRW47jK5pTuv5W4PkIjTtLyydnR+1yK44KjMQsu0HCXKmDFyi0RVjBykI9mto1pNrtmScqoVFdd5zQcmK0OG740Bds7txKkcyCNjbcXTnUPRM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?7sfDDql/2HzxRpt42hr68xcX5DVdvA8eW/EuAyvXolCNHuHGjwz2863jwN3K?=
 =?us-ascii?Q?X1Qpum7Wn06KUqn8TzpXRgbGrUbaqDIJ+D5eqxuvLGD2g9oB7hBTs1mg8cEc?=
 =?us-ascii?Q?QQp1/sktok1YVrvGYo/KEYHTSQRJ7RrGD0qe/Az8thWFdX+qG67TxVAJB5El?=
 =?us-ascii?Q?xyCGz1LWKXeiMASMK7HnpDrVaudtWUvW79EKVJRDQTjmdd521fhpcpAlUlVg?=
 =?us-ascii?Q?9CLV04ZjlXGVI4OGoD3tk/rkQN1HxW8v7hOEjjf0b5qM5nbAfAT8K6LtxvXj?=
 =?us-ascii?Q?6UTuhWH+7PWlDM5vkmnE0LJ8ZumGBW2CdxkmGMF1+B8Qj16e3yrlCQbPpTNW?=
 =?us-ascii?Q?tdYgjhPViC5DLwsXjOHAOseoFjj9iWva8+v2NzA2tivkDV9IOthStMjPcs6K?=
 =?us-ascii?Q?rzlKsaTAJuDjke8PktZoRzckjXmw/HXcHGFa2tnYr997YSEanwxZhcO9QX6r?=
 =?us-ascii?Q?ewvwKmbOo+uyrTXNBYyaVVSx/bxcghgLT5l3mcuKfDxWgH37ATQ510MzildJ?=
 =?us-ascii?Q?+Ovl5wXwaKmRYSLeJOnr9atNtMv+0jU+yUoVzruGVL5s+0yGRXisCXDQ8kMl?=
 =?us-ascii?Q?RPy1H/21qOVzMMSLoc+/A+hF8z/aVMNuvi/bKV8N/cYcy5Xrp2MAqrbKbnyi?=
 =?us-ascii?Q?1z4BCEQmxQjkGfA7NsIekH6jU+IU8HsmSYTLPwISwCOUM3GWKBYP/kOX8guR?=
 =?us-ascii?Q?E5Es2062belGJqvPd3jw8ffsY9K19i+8uSSw1nhgQ4i93oj2B7IEsfL8Ok0r?=
 =?us-ascii?Q?nnB9waqiSoIgHozeca2RqwKfV1P2hz9QQFdgiWG4W8lyldvPN8yM35NzG0VM?=
 =?us-ascii?Q?/SnRi7OXnpcaSZDQ/stU9RV4mRYeNT+DiDnx6XiKZuwlbpn2e7FNLWxqCnb+?=
 =?us-ascii?Q?F/9eidO/7lu4ygRR/mwnu8p4MhcR08Slu9utFjTaqKRN/32Ea96xxThXi3eW?=
 =?us-ascii?Q?ki3Zynz2oWPdWmcwMAK0+XuWXeP8CVGDxTo8dN39ff0QFbejg7IWfdMVR6ae?=
 =?us-ascii?Q?zzEUgNevBkxjhPiPo6gANgU5APq6SNSD+wPpFQiTWVI1CObg/HCdrpEgfO02?=
 =?us-ascii?Q?lgZFQ1dx3D3Xkm+4ylaHuxaZ2SXkXBdg5OBhT158yt0z/Me2Mz60KQIPJ44y?=
 =?us-ascii?Q?bH3I9LVPK3oLfufpuNHHPGqYWsuODxZCF8mf888qtJe1IAKfFsCrRWBPZu9h?=
 =?us-ascii?Q?xBV9IOfXshQ/9zP6ZLXLYkMs4buDimWqogU5/sI/F9WObnzZzSJMRs2aPI0R?=
 =?us-ascii?Q?kridpZKsCa59uHzrrXOzQN16DIYi5h6+tf3nQCDwLYv02C56cYJXtY6ZenwY?=
 =?us-ascii?Q?dXYJ/ThOzLvGE95oazN6Iy3cShp3FKa8TV+87zLHE3aLtI+4VYw8OaNOTavk?=
 =?us-ascii?Q?Pgq/NVoqjIRFSzQehd30E+wk17LefR+eJr7gUgmFX4yxWKxbpcSC2Zz2w/il?=
 =?us-ascii?Q?eLfD90QC76tOBHqzqHA/LmrRzCpMyEh2M9XNuos7hv+6YsFdQw9k3r2jub5J?=
 =?us-ascii?Q?5UXjCrHdMqBkQGuaSlKSujPryIJzNQx3+ZW83RjK51ZjAJ7uV8AOx1HYUiBJ?=
 =?us-ascii?Q?SaP3Nac+InrTQZwFCgC61ZpgVGc4WYAhs9atNuH+Y4DiylUltLZSMdTt6Si+?=
 =?us-ascii?Q?A9W+JsuMUB+7LFIRtK0sVixw74vpJ0Pvir7o0hlv9MxeOmQ9P9bq/3qtEHER?=
 =?us-ascii?Q?L6zRX0z5C4aQDDENWeGKkvlKCGdW/xCRuXiNA2G/c+DM9px6vc8pl7Yx2T37?=
 =?us-ascii?Q?Yhuuvl4MfQI2F+I5KNfhBtiErZOwNaY=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cd65648-ccdd-4ef6-4f9f-08de91a7f30e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2026 17:39:25.6118
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r6X9kJDJd00Wj6qqS/rV8+0yELcTI65QwNSa+TA5V3yHhgm/wPqedn5JwallGDc2qFLS5PGV8/rJSkUUYDLc0vDGWjt3bPrD3sl3vY0+WVM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14536
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
	TAGGED_FROM(0.00)[bounces-30871-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,TY6PR01MB17377.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: D9F0A397133
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Kuninori,

Thanks for your review.

> -----Original Message-----
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Sent: Friday, April 3, 2026 3:06 AM
> To: John Madieu <john.madieu.xa@bp.renesas.com>
> Subject: Re: [PATCh v3 05/14] ASoC: rsnd: Add audmacpp clock and reset
> support for RZ/G3E
>=20
>=20
> Hi John
>=20
> Thank you for your patch
>=20
> > RZ/G3E requires additional audmapp clock and reset lines for Audio
> > DMA-PP operation.
> >
> > Add global audmacpp clock/reset management in rsnd_dma_probe() using
> > optional APIs to remain transparent to other platforms.
> >
> > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > ---
> (snip)
> > --- a/sound/soc/renesas/rcar/rsnd.h
> > +++ b/sound/soc/renesas/rcar/rsnd.h
> > @@ -623,6 +623,13 @@ void rsnd_adg_clk_dbg_info(struct rsnd_priv
> > *priv, struct seq_file *m);  struct rsnd_priv {
> >
> >  	struct platform_device *pdev;
> > +
> > +	/*
> > +	 * below value will be filled on rsnd_dma_probe()
> > +	 */
> > +	struct clk *audmapp_clk;
> > +	struct reset_control *audmapp_rstc;
>=20
> I think it is DMA specific.
> I think we can move it to struct rsnd_dma, instead of in rsnd_priv ?

Agreed. I'll move audmapp_clk and audmapp_rstc into struct rsnd_dma_ctrl
in dma.c since they are used only there.

Regards,
John

>=20
> Thank you for your help !!
>=20
> Best regards
> ---
> Kuninori Morimoto

