Return-Path: <linux-renesas-soc+bounces-29706-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id LrUPC2zkuWlePQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29706-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 00:31:56 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F2D2B45D4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 00:31:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2C1D33028512
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 23:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546E4346E7D;
	Tue, 17 Mar 2026 23:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="dt9HfY2c"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010070.outbound.protection.outlook.com [52.101.228.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB6C35949;
	Tue, 17 Mar 2026 23:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773790311; cv=fail; b=ocITYP+RaYDqKrNQPLO4LbvqsaZsiaW3/n7iWXnbDf95nDLhpCoJko6jyfSXgbDN0OHwkQkXBM6hYtxzVwjPvjfycSo+G6lrTVS4LnzmskXbRCsy/rOCDMj00MObIYtjnVr5vxW9MsR3yoVqR0IHSzeXVBQL9OHx0oJUOgqa6qM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773790311; c=relaxed/simple;
	bh=xNvcNrmaJwdvQTsCg7aUv71kw4kH9NTTG4U3UNGC0IM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DR2rPjofhlvm2tIZ0GI0nz7XIJAJF9A9iJrfxz46SdZM7M/csKEH77HNYr08Ngbk/ZOCC+X8xHMc0dn1PGc1etFTs79KzFRMSDUdyGGeIL38j2Y3FFZCiABegZ8wsZGpkl6v9pnpXXOp82TTjPYfrKDw140EGTIc0gK76Ayzt0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=dt9HfY2c; arc=fail smtp.client-ip=52.101.228.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aMzfHfXXW3L+hOsghbOQ9l0Td+WTxYUHOyneLR/1P2jhErr8nSpawCfk/XEVe96V1TMs7Y838foJ9T9uMZsh52vRLmfBdfgI93P+gsoRzA+fvLQ1w3xnsR4rn9/7ucPORjE0zlTkhUAsS4CK1q5YXhnziuLQPvQ6TRRjoQrF5ZKr9dr6HI3UK65rzGr04F81vzQQl+y7Hh6asFdLDUWrakywbIK8yDRz5mcjx7NNPYb43aCrJRZ0uY6kP8FPz3/SJNZQmVf45d6IHNP/AIJQIH6DU67xS8aIoaqWoXQSlGJEsWl0JrhvQoGFZ11G15NJxnXL8lZwRWVnWTYSYHcGZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xNvcNrmaJwdvQTsCg7aUv71kw4kH9NTTG4U3UNGC0IM=;
 b=xqnzpFzNVdqxVaxMtXuaSAGu98Vi/EZd/8lAlLO7GmRm0V8nFuo760jHCsEVxCQ8kd3s2rRCBJlj8s8OFBuKxI8CYXeJlNW3oSh+f4gtMlFuWFJ+BrntElX9FYEytnvAT0leKxPgC2lBRi4WU2Qq3qUuBvkDHatTb0usBtUm/GTbbgC0V6VO24rC2MyHT+D2NAsuI2MAw1iKIG9dn0fR0jb4KKx1LdxyLXqYizk1WTPp03opB9bihzYtMO0Qrs0ssNYFWzriEbTSK/jm2O/fi7xgzNVWSlA4GVrEmPtODBxYBlSHsUEH0xsBfnNh4UHi9EgWdPeikhFPz6uI6C/hzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNvcNrmaJwdvQTsCg7aUv71kw4kH9NTTG4U3UNGC0IM=;
 b=dt9HfY2caSipuSENqclVs7obrZoqJu8XCWHXH+OIe4i9N3hH2stOKsVbrFX4TUcOK/uFVPQ+PTSb8CHMdawWwi3Ewx0pPCF4oOZCST5ILI/jkQLmYnCuFoncoj7AvMH4K6GOgQ8pvEQMebtuMZSTGtodPwRr4T7E7NjKDeju6nI=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYWPR01MB8363.jpnprd01.prod.outlook.com (2603:1096:400:160::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 23:31:45 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%4]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 23:31:43 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: "phucduc.bui@gmail.com" <phucduc.bui@gmail.com>
CC: "bhelgaas@google.com" <bhelgaas@google.com>, Biju Das
	<biju.das.jz@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "john.madieu@gmail.com" <john.madieu@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "kwilczynski@kernel.org"
	<kwilczynski@kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, magnus.damm <magnus.damm@gmail.com>,
	"mani@kernel.org" <mani@kernel.org>, "robh@kernel.org" <robh@kernel.org>
Subject: RE: [PATCH v8 15/15] arm64: dts: renesas: r9a09g047e57-smarc: 
Thread-Topic: [PATCH v8 15/15] arm64: dts: renesas: r9a09g047e57-smarc: 
Thread-Index: AQHcsRDxxVpRghIpcUOEQGYBtm2ME7WzZwRw
Date: Tue, 17 Mar 2026 23:31:43 +0000
Message-ID:
 <TY6PR01MB17377BF5B5B59022FB39AEA12FF41A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260306143423.19562-16-john.madieu.xa@bp.renesas.com>
 <20260311043831.2576-1-phucduc.bui@gmail.com>
In-Reply-To: <20260311043831.2576-1-phucduc.bui@gmail.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TYWPR01MB8363:EE_
x-ms-office365-filtering-correlation-id: ab7ca5d4-053a-4de0-e026-08de847d5958
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021|18002099003|56012099003|22082099003|7053199007;
x-microsoft-antispam-message-info:
 wle3b4MnUQL3sT800S1eSs2tTPmqhrzKBfHv2oxgPywY8r6PFsCUIJP2mHRIJo/PbHWl1Gvcu1K7wV3XERcMOxp0EDw/M3y99Uqe8hPkb6dQe5irLUS1Cq/6yGyQ88NcWHGBeA0w3bNYqmJyondZQho7QmKW6jclYNvrhT5/cXwLbkSmwkUAoPypaTqFgNudZ5iCDaEcJ6/fps5MIy9Aq5e7+AfaPf++ZnzYsDnV2Ba5wC9JiM4UN9TiivHKJ0qCbJuJufcsTwWxMcx8r7oBjO94vJJz83rENdwacRCHC+70Sn6YFAQiiOuvs7TTqskk62F0rrJnku5jtOitBeOw2Z1ivXS4eZ721CkjAB0y8XOqejhnhFPlXAr40Tde711sx9+U7WvHDVhihW/0tVweYazAi9fYlaPlQ9Zf6/sQ/5pvfGDNVcDO5RnyIxAkxCuVaQ8I5Ih2Aa3bBrdnssUeJavPhLkiA1eLdK+brnB3PNH0BBui1KgXeoLTSG5wirbzTDmulsDuGC1qUR7BP/+W9B2qc1v2JGjXhYal5u7jLpU1uCH1qj8eGJvUeEcFPlwRTNMeXKAPjN6KoI0ZdmHvprkzNQkJVFmVfW7N7g9mRnu8B/cvK1YIfeNJXmB0KmfrL22SeA2LLxdE+yim8N6Ia9GOWl4EI+uSjesqylBJQ9WjXDo4jAL0n+7jJWONVnVe0DtOIoKFTZkZj8tS0IcwmebiU4t/ZRW6aobQk6uIERNngvBL+RhEj5n7qyb8BvfXeW/qxQHfgfageQlrKi+cjAyCgdkWq7YXuxxk1KKWouc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(18002099003)(56012099003)(22082099003)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ZLoyCXdl/hK3dULnvZFUHm2tI97HqfDUQMZrHzD0G/B9nCdz18s6+JXtVCVN?=
 =?us-ascii?Q?4CChZfoefHjKQFoyY10jN6+nH16qz6FRFUGmtGYvbWnMZaX3w1f7Mu3RYsJ5?=
 =?us-ascii?Q?g8yBbuS7R+GCN3GhM4xJfPgPCkpTi9W+0Aa0PPJC7bnA+jHUf/wA2AxK6jMw?=
 =?us-ascii?Q?X5LvlhrDz2BzQZEKLJfwcshoZXLqPvZS2VEpfCPwDQ4bTNPf/EOpgIYL/MQd?=
 =?us-ascii?Q?XYzIPHjEoffP916Jliga3scrCiDrzerCL0jPvNJV+5/ORNtrBNMrAdd7RUb1?=
 =?us-ascii?Q?ldiGNt+0w3+LGSnVckOlram8GAD74Ehjo1jsZ2mrNLRX7kixK3UUHzISosfZ?=
 =?us-ascii?Q?VIAEBCWelxpIbeYkuoYRyv2nJxk572uP13G5iNw48caUKJd6gPeg5byhCTZp?=
 =?us-ascii?Q?Z5aBfo9vwb+i2Hu5/j92Lvc6lnAMnSyji9QREIcJAijWoNkk8I5tz/SUYjZX?=
 =?us-ascii?Q?Aki53sYsXvlvdfTcQ4iWgOZhziNHCQsYZg48kj5ljc/S87kmBGlAfkL67P/F?=
 =?us-ascii?Q?ooVMcM8m1dOOQA+WVW8cCOOjAY4Z03MscsV6rcgChOV9SX7J2wZir3YuUEGj?=
 =?us-ascii?Q?kdlxsXyW5vaNplHbgDOGLk7j3pS2BuRuKv0SCWy7B6fQKO1K0glTCL1ynbgl?=
 =?us-ascii?Q?f4Vi2SlVwLTdO6VhZGNbFqTt14smde/k1SZzUGbIWtkge4yOkHTc3noXuRmZ?=
 =?us-ascii?Q?6rsUtdq72ueo1rSoJpb4BxzRa4r45Tzssxzcx+1fwrAtBjE1NOd3CrerJGiy?=
 =?us-ascii?Q?blXB9iIXLRpmi7M0obHGvph9O6kT+0z0Ck8TJZrjIT3GLF2DNrb6pAbIxMj3?=
 =?us-ascii?Q?+vJTcsYZmoDkYHrbOszzuJH0EMXXD0AYx6lWtRCUXUcFTDNuD8R0DYzQvkm5?=
 =?us-ascii?Q?kXsT6hdxeEdlafFFPFTp+7iPwqnqs3bGSnDKPfpULiUF5E5XbhT3klzGPsIP?=
 =?us-ascii?Q?CRbbZZCjQRB1IcQmuocg6xaS0vRJyb6ARRIN/miSXVWi8zZEbznR5Dosh+My?=
 =?us-ascii?Q?YlrSQs/rZ8rmO52gx8arzV8d+RgpE0pWdkOmnbRlhjjqwfDAecgDZhIHjwDx?=
 =?us-ascii?Q?AbxzP2Kxw25ENgiBkBBGdGJHlNIPUkUueAa04NVnaYmQvZfj45f9RjtUsVfL?=
 =?us-ascii?Q?SHUSYx01XLXUwyQasAPCW44B7cG2NfSp9Sq8/4+lKuvxavyWVLchYJI7oo83?=
 =?us-ascii?Q?UrxP/Jd/++5tkTpSnRYAKeZ8NnIkC3Iewo8JKzuVaaOSTjpWQSP7MYoP/6Ch?=
 =?us-ascii?Q?Rxz8DpazV68lw/GLv4z1boSbUH/641/z9JsT56hmE5LmYzqUu27KVy8L9iDk?=
 =?us-ascii?Q?IN9GE0eCMUaLxgB6jlAPlVouETci2D7KsPc81EklLxtXxhyBXNNodPKMXBdu?=
 =?us-ascii?Q?lYuzWGqnBt1QmJLoP/haP41V87lSKXQPDpktzh8gfcWxyn+g0hmU+7nI1EVo?=
 =?us-ascii?Q?FVtmYcWyu/rz5FcaJMud7dzqOD4pu8njdAXpR/CTRQ4UVXEGlbZPgX93O7J4?=
 =?us-ascii?Q?UNriaxoAbNk3fuqM5lOsRFqtAXTmikRbzxkPcbH0eYSvNvKOvJsbhCQr2fj6?=
 =?us-ascii?Q?lGclyWYElln+3ZZG2xvoCjR53U8CErFCrfuFiJHfV0OQyOUHL5Z6ZitJAKqA?=
 =?us-ascii?Q?i4UnNBLfCA2Fop2xG90fc4G1W7vaWQqrX447jmIlTr8z4nREwhz87mdKarvG?=
 =?us-ascii?Q?YI7IgcmhBBinrg1YaLJig61i9h4LsbTFm7JKx/DcfI5V6d0HoX1hr7oxbLev?=
 =?us-ascii?Q?WbxMiOmXE97ZhJ7PmBhkBswhVDZUG2Y=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ab7ca5d4-053a-4de0-e026-08de847d5958
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 23:31:43.7379
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3qtK/lu3SNSqMYaEB5gUIWUv66+mPYzR2fW/pJzvouCXsnOsZEgdLtTJJvgkgGI+0zQa5VZgB9Qou7mG2ZyNK9exsjA9U8EpCUHLd44JDgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8363
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	SUBJECT_ENDS_SPACES(0.50)[];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-29706-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,bp.renesas.com,kernel.org,vger.kernel.org,glider.be,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	REDIRECTOR_URL(0.00)[aka.ms];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aka.ms:url,TY6PR01MB17377.jpnprd01.prod.outlook.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: C0F2D2B45D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Phuc,

Thanks for the feedback.

> -----Original Message-----
> From: phucduc.bui@gmail.com <phucduc.bui@gmail.com>
> Sent: Wednesday, March 11, 2026 5:39 AM
> To: John Madieu <john.madieu.xa@bp.renesas.com>
> Subject: Re: [PATCH v8 15/15] arm64: dts: renesas: r9a09g047e57-smarc:
>=20
> [You don't often get email from phucduc.bui@gmail.com. Learn why this is
> important at https://aka.ms/LearnAboutSenderIdentification ]
>=20
> I noticed that for gpio-hog nodes, the kernel already uses the node name
> as the default label in /sys/kernel/debug/gpio if line-name is missing.
> Since the node name here is already pcie-clkreq-n, the line-name property
> seems redundant. Should we remove it to keep the DTS more concise?
>=20

Thanks for pointing it out. As per Biju's comment, there is a missing
-hog at the end of node name. Thus, if we keep the schema-friendly node
name 'pcie-clkreq-n-hog', then 'line-name =3D "pcie_clkreq_n";' can still
be useful.

Regards,
John


> Best regards,
> Phuc

