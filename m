Return-Path: <linux-renesas-soc+bounces-30870-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNheNLXzz2mt1wYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30870-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 19:07:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A81396C32
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 19:07:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE437301DAE0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 17:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 673A23CF05C;
	Fri,  3 Apr 2026 17:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hG4xqnc6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011049.outbound.protection.outlook.com [40.107.74.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD6D3CD8A2;
	Fri,  3 Apr 2026 17:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775235952; cv=fail; b=qL6BlKnrSVLb+iHi/PwIodsRxDj993IzuYULlq9ayiFtfX/rZFSC1dDQoxlyHLiZ1Bc9v3C1RhtrhZ9OhZK6XPxj6N//9NpdhZCV1Iqw2M33MRO9+dNMhglsmyCXrRsL4xhE4+c3IgYp0ZvVuhojVCDQiA2czfiypWXgNPqlS4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775235952; c=relaxed/simple;
	bh=pIgik0wnWtkLO7xfkfzLzxILqMzkduJbqyI2OMr4dcU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=F9utHbANiTmi9T5a71pBjIjj/60MVhEyxEyegMV3gdXPsYyuXJL+ydD0FdseR4DcmKLKinAdYhwaqVMB2lFk0V8yvN4N5A+kNqKGjKWhA5OZqENJ4MaKg7i/+PYT2PRgn164rqYxJzusIqeU9tQ5UN7vqsyCeTOR9PL9HkoXa2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=hG4xqnc6; arc=fail smtp.client-ip=40.107.74.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C5+tHZRO4US4nfujPQQIbXbUYJuJPYgRv2CXTVTJXMt7ZUsXQ0/PGBiyJ3u9X4Z2Qw2ySag3bcQ8FXrUFkz9SQ5FXzx9kwu7Zd1RhtCkvE+lK64kMF8q2lQNlpFnRs5p8ONSAl6JYKkejMhcYZ100Ted22PenBHxdLhGJzMMBQnoMXCMkTL8LSPVbM+4H08fqImEXVq2YZV20yzobBlwj0+QZScCbzLXKI0P8Iu6WGzlSb8oTM/5FxhpBqnbkSViTq9n++pZy0zKM3eWvX0LcxHeL79n1/VbDTszFfFLWwIDD2Ce8mAE1AS4BF1e4ivo5al/bgzN2XJSjsgLHVLRnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+WODx7/rzZicNiAjvXfTMd8TgCs9CIaXob4k5MIRxZ0=;
 b=NlcGUAznuBZYZ9bB9sqEMoSawPYO776bNQH9qrn4NePjDZndAZi+LWULtsXd2nc04lMUHRmz2ejIBqLmE6TQ1SJDosHrYmHCa4xoyiUwnHyv+PvbtcDCpwoqg6FQ+PMUXsdB2uJjcV12qfSkn8c3Mvcu4G3dCuARwBIMy0fPgkve/N0JnYgXG1JSStlE1g4j/91Dh1HX+unOJs2f7yLe69iZL/rkMsWPOz7tW9pF1Y6ZDZ3GnKJPGpcMAno+PuYrtNoXZLz2DBpUv3YD2BA84uhMAPuLUCNyKEPQua4zWGNZZuMjM+T0Ud1ARcM+urPi3Y3Bcv8hEgxd4JOt9VNuTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WODx7/rzZicNiAjvXfTMd8TgCs9CIaXob4k5MIRxZ0=;
 b=hG4xqnc6VjCLFDMGqmCCZcDF3VRXZbN642gtdhNAihnH/Chjes9jnvZWsLEqlnyX9Iw/DnRVKl5r1FGutM2QnhaEyrmLG+cd84v5ni+W0+wdLdLCvILtXLDcAX075O24b7hikzdZS/jvPqKcu+DSgOBijSVmcJsOE5r3d1QDPPI=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYRPR01MB13674.jpnprd01.prod.outlook.com (2603:1096:405:18f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Fri, 3 Apr
 2026 17:05:47 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%4]) with mapi id 15.20.9769.016; Fri, 3 Apr 2026
 17:05:47 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
	<broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, magnus.damm
	<magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Biju Das
	<biju.das.jz@bp.renesas.com>, "john.madieu@gmail.com"
	<john.madieu@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCh v3 04/14] ASoC: rsnd: Add RZ/G3E SoC probing and register
 map
Thread-Topic: [PATCh v3 04/14] ASoC: rsnd: Add RZ/G3E SoC probing and register
 map
Thread-Index: AQHcwr1VhVCgUT295k2BtAsGh2qkhLXMDAAAgAByToCAARCaUA==
Date: Fri, 3 Apr 2026 17:05:47 +0000
Message-ID:
 <TY6PR01MB173779C29C8023CF7E75C411EFF5EA@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
	<20260402162436.12059-5-john.madieu.xa@bp.renesas.com>
	<ca7da576-5280-456a-969c-aa4762803ee9@sirena.org.uk>
 <87pl4gg9ru.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pl4gg9ru.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TYRPR01MB13674:EE_
x-ms-office365-filtering-correlation-id: b977e833-f492-47a0-826a-08de91a33fef
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 5/Kc6np4eqXLIbvnd1dITkKqu2pyPoKrovCfWzWMB8g3A1SRUkxqcKBYRkcM70B6sL2nrXqVX3BQaIuYMDyW5FFi66onrJ003reX59mlREmOpjzS4C3MJdf5RFOl+ZBvItXEkYQs92TwPkvDz06bMjeScY1isLybX07AvlwwrabTZsDewRwrXCMSdtP7EJEQ56FOygTBAIinOMTLDrb9ZXi2EEldjqEO/5Co9lE2B015HL6Xewxk3R6i1wCoq+Ypuofh0dloYHsr1884zPBTcpNYA0e57hMynnGX8HFE360Y5KjWD67DsePk9iVlCGAvZG36T6Mq9tUTtpMam/5arDUiX0yc28VV1v6NpdwyundlmpapI4WXOmfb42M+XJqCNhSUXZHZSFzJ6J1ULlKgz4G7BJhI+qpb+cXKfUImL/ATGN05ANmWNAc9us6KV+i+qA8VrA2VPV7EHx8cN66ltMoR6fzjNEpF5tlfa9NBOUuhHZFu4X4049CPYLPZemHaCBnuqw7he0EJS6T4/iMK/X9rpQ+ZhaQyn7JZUf6oUPfTGzZXSs2WoEzEqfBMgqux9dOuPWN81zvLXIF8AGCVYSV1a+t9lX4Aot4rTcwi7hxGGbrX5i9MXWBa4Hr+k1ktUwErk2OmSl6YA+JBVDIb7+mUudeKm+CCcn1+Yvl2Kz4WDbOSsIQrl8U2t6Spt56QcT/IX+Y0ffg7HC+ZONBN48/orY3qqDgFIAINLoayKFVCfQEb0Jsg2PpaninrdZidwJY9gIKvBQgu3QxFBFXtxoQiC4mKyrUKkJr54vMvHXE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?01PeBtrBKmqsEtZjufcMmRBu1eItJUQa5xQtL1d30aiw/DWRB6HhpOdV64Mw?=
 =?us-ascii?Q?F1FD0pvaxc53gDa4WxlTfwuz7FmSIH2K8mQUObR2ZBBbTImaDbBcWazjYMDs?=
 =?us-ascii?Q?El1OWfeL0k6w4paE1FWKdwZROxiQzfjMvVL04fJHVdG+PgLbZ2fAfk3u3/Mn?=
 =?us-ascii?Q?knXc//YG6cqGdX31zqOodyRlV3kYzstCmQk+18mBZaxV3V9uefxcYrYB6c2l?=
 =?us-ascii?Q?Qb7DwzzGo+1o55J1mRQVrRgGi/Wmcb2DjtgMSsa2Hppvsbf9N43mnvPZ+MuZ?=
 =?us-ascii?Q?whvk2PoowFMgiU7Z1Ar0J7pBxhqOU3J1jgop9kiRoEq4xJ2L2yCC0gjh7VNC?=
 =?us-ascii?Q?BGjyz65kFYqp+KvdYIr4Upvzpbl8Lfv8Xy4k5D4WIiKVDdXtZc/Wj00WbT2G?=
 =?us-ascii?Q?zR/uskUM8aMTpRQFPXdSK73cpzYsOWamZt9roOdCB4zafi7u+OYzZ3UJNEgH?=
 =?us-ascii?Q?DsPI4OugxhgxxKGdIczMtWtQ3TCY2q8PjNdB+y1/sjEXgx7QN66lnRSZcSXe?=
 =?us-ascii?Q?huYw5aOxyEHiiLdWrzLqNEdMowb0r51XCpxfgJWxWWiD/HzsX5P+Jy03QXyf?=
 =?us-ascii?Q?4lFMWXe8kXhb/szKtlPpr/oGiEXotxM9ajLBX2uV38EMy5eSYvKqEYNWE5nK?=
 =?us-ascii?Q?zeEORPPevTXaB7VqrOCsCWfDK+AlANXSg3uupcAh97zHkn6TMmZ5w6v4k9/T?=
 =?us-ascii?Q?mObg6IE7rjA9KBMBNCO6YhWjkCIAoiPUT8fHyM9AiHy4Efv1u/BMOBthLXQR?=
 =?us-ascii?Q?w5f9vBeqe8po7eEg1j4EbQaVRpNXfyiPnm3ZwdgzRIGjyC4K/owG9eJfZWjA?=
 =?us-ascii?Q?W1R5oayx3csnIqvJmbbCZEJFLE1rBvXpuoKpRHSIsjebumMtTMY9s7CWoRsd?=
 =?us-ascii?Q?D2vHdot4bQlBtaK2GrU08xJFeWo0a5qvT5URmIBVZRVzNit/d16nP35MWElc?=
 =?us-ascii?Q?n1YQZPubYDigd5+WT7E9doxLF3scVGoUUAjqWm6vbn/ewP1sR4VQf0K8ZA58?=
 =?us-ascii?Q?LtZuZorzdnSfCrhR3RO3J0V8vtcKYIMX+ShmmYhqmfBI7kpetI9HBx93LZaC?=
 =?us-ascii?Q?et+vg1D3y8kkcpopoiTF2eacCyKYKr8PB6ujCcDCzIbIK/VlOcHm6gxhOEEN?=
 =?us-ascii?Q?z9CLnQcPVDSkxgDaelUJOblfZ3LlHDhK5VraYZOTArph/EqCbzeopr6kW4Sj?=
 =?us-ascii?Q?SawE9dfLzP0yuoOIc7K+Ocwn2Z2sdTfGwUYFPggcXgvE1ToJfd/sa3306DsV?=
 =?us-ascii?Q?SaqQahcAg19RsohEbNLdZTmOgygC66uPdBxVgKLtaBLIkPEQ0L97F0l0nSNV?=
 =?us-ascii?Q?bvBp4VfRhNxawTuOd6g7HlJcx8kenI5gp7Fg6pzF5lK8ONRq5cqDRuHHjt4r?=
 =?us-ascii?Q?QTL4W2bC9wJXoSie2pb6lqG3kzlSESo79uuVoWi3bw+CkLCGHYhlQU1eTte3?=
 =?us-ascii?Q?oJp2rUHPZZiV37jkFOY2NVOQSKiYWTKKhUryL8zlwW3Oc2eRUQQU0Ic9oTl7?=
 =?us-ascii?Q?Hs9mUZRmTHmCYGcTU/Sp4A4w5dyndtBD6EIyAWcE/XWO5NrDT4hZ+cAc28Rf?=
 =?us-ascii?Q?AsEZtHiSiM28Zew9uEWdph/+DuH4eoV9ncC8/GD5VqhDOyfJTlWQnsfFph6X?=
 =?us-ascii?Q?/QSDIKUyyV3TbWP2H5UYUDInlibQIgGHWvy5/0gp8rgUnQv+Z0MLFiKwZx5E?=
 =?us-ascii?Q?eD/mZ2PpESaPFj7GAOBtflQySfvj7nOSRkWaXkLoCU0Xb/zGq617JqWscgCL?=
 =?us-ascii?Q?U6VCEKdsXE09pvSiXjqe8NB0+AQ5AW4=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b977e833-f492-47a0-826a-08de91a33fef
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2026 17:05:47.1001
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2r2d0pM/GKjf81ZlaS3WxsXLZPc08t11qLLun+5ZjW2PtLVm0aOoh17s06SWpj1VI/bPjRrde0pIA6YB2NPd8Ty4Zll54mPVEdxYUHwA2Oo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13674
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30870-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,glider.be,kernel.org,perex.cz,suse.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,TY6PR01MB17377.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 32A81396C32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mark, Kuninori,

Thanks for your reviews.

> -----Original Message-----
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Sent: Friday, April 3, 2026 2:36 AM
> To: Mark Brown <broonie@kernel.org>
> Subject: Re: [PATCh v3 04/14] ASoC: rsnd: Add RZ/G3E SoC probing and
> register map
>=20
>=20
> Hi John, Mark
>=20
> Thank you for the patch
>=20
> > > @@ -629,7 +632,9 @@ struct rsnd_priv {
> > >  #define RSND_GEN4	(4 << 0)
> > >  #define RSND_SOC_MASK	(0xFF << 4)
> > >  #define RSND_SOC_E	(1 << 4) /* E1/E2/E3 */
> > > -
> > > +#define RSND_RZ_MASK	(0xFF << 8)
> >
> > This overlaps with RSND_SOC_MASK.  That might be intentional but I'm
> > really not sure and it's all kind of unclear.
>=20
> Indeed.
> But it seems the strange is RSND_SOC_MASK, it should be
>=20
> 	- #define RSND_SOC_MASK	(0xFF << 4)
> 	+ #define RSND_SOC_MASK	(0xF  << 4)
>=20
> I think it is good timing to have comment to clarify flag.
>=20
> 	0x....DCBA
> 	A:	R-Car GenX
> 	B:	R-Car GenX identifier (if needed)
> 	C:	RZ series
> 	D:	RZ series  identifier (if needed)
>=20

Agreed for the overlap. I'll fix RSND_SOC_MASK to (0xF << 4), keep
RSND_RZ_MASK as (0xF << 8) for nibble C, and add RSND_RZ_ID_MASK
(0xF << 12) for nibble D. I'll add the comment block documenting the
nibble layout as Kuninori suggested.

/*
 * Flag layout: 0x....DCBA
 *
 * A (bits  3: 0): R-Car generation (Gen1/Gen2,Gen3,Gen4)
 * B (bits  7: 4): R-Car SoC variant (e.g. SOC_E for E1/E2/E3)
 * C (bits 11: 8): RZ series generation
 * D (bits 14:12): RZ series SoC indentifier (e.g. RZG3E)
 *
 * Bits 16+ are used for capability flags
 *
 */

I keep the existing shift-based style rather than GENMASK()/FIELD_PREP()
for consistency with the driver's convention. Please let me know if you'd
prefer otherwise.

Regards,
John

