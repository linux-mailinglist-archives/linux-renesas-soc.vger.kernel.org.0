Return-Path: <linux-renesas-soc+bounces-32254-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOZLMuef/GksSAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32254-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 16:21:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 433EA4EA0AD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 16:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AF64F304F02B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 14:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CF883FCB26;
	Thu,  7 May 2026 14:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="SHc8myrN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011055.outbound.protection.outlook.com [40.107.74.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9643FBED0;
	Thu,  7 May 2026 14:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163632; cv=fail; b=C9eBSDca8l3y563IcIgNx2mvNziqgbO4aB139tyB9wLU5n8vEJAeZQbVP5nBel/pyN4nIdSD5nSyFtjn6FIZkHbl+7w+mOnqhDTukjwH4piBiC7ScCMpNm2GmPjeJwsbJW+u7c3dzF9K9eCiuq86BRobnnmCIxZr1u21Dp9RjwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163632; c=relaxed/simple;
	bh=RDpfLwqud8Q0KMfTU2cBSBlqoLNkPsFxdnWjHRWEsqY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CMSP0gJjHCDvKrUZ9DMQAjewSVB50Q99xQnwLryH76qakLAW01jG9ejqFLuF63s1z1NDgRMxjW2YQalw2QR2fzB7iKT8wa9dp53rMzXxoxFHPl1FbElcl2ugbBkigLYTsGCyehiz2SElpCXiPtlaQng2NayWB/ooA4ZizsKt2jg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=SHc8myrN; arc=fail smtp.client-ip=40.107.74.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lGtvACir618+jVrxyUp7aasm9nVCf3QQ1JEfgnhFk365zDKnmYVFZjHP317foMpvMtD5oSMRv/BKeEOJB/X4EWMm8hJ6kDtfM09ACAtKXvqcChRzy4bjoVQ7Sh8qq0K/mLCYiEkfAfGcdwQz+GkBgc38HvdpUO3MG5GNvCc1eOSEYi0RKrF4Oe4odeqEvtnuuscy8vD8rUFHBgQGWnTFRuE29zeZGbKD6XONo6oLRTS77slnJFZUusIlr7M9JWu9CwiXvtJX2o4B3xxYBKpNFfMKmb5qIMmb1W3nLkIirCZDMZejisskbdrur2g46WDbOt8n3md0jMOkgtNwFeoaIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9MTxLTnDFi6SxuC2EYdkB952lhYjnuSMZfJGIjw3+c=;
 b=we58hIw9zIfRQ/UFCqk9W3lUIwZrfOwaorTvjXTQmsp2CFtNhZfb7YbWcLylNCsB0QZwnToWf1YkdIPKTnmQXHG7wcw0BWpvvJFJNiTAvXCw0sLYztMyvDI26+4h0JN1DW7HF0OZtbrFXFp0FzkABP3sI87hCr7gYKSEALILqvscJwPuril7kBcYiDArvgeEHdbRfp12PLiEvEsKdDaY7tQIRpnVvAhd9cKIZ3LTWc08eSbU4hvHNzPBYL7sqLekEax+mM09LYwehwDt99fuUl9FNT1xta6isLQ9M16C2ZT5OwZZBHAeOQRjI54WM/2m0FdBlR7tN0Om1sM9/aTotg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9MTxLTnDFi6SxuC2EYdkB952lhYjnuSMZfJGIjw3+c=;
 b=SHc8myrN7YCT1fkM1AKJ2lAedz1J7gsbJ6g74Ab0azzLFTXlovF9SS0nXj8Qc5drKBOcGfVVAM7RlZD9V+m72erU5I0u0zcvEEEowc4ZQNTCxAY9kWcnTNzaSW28eOUU6k32tr8pa+Hid3sLwx2GD1fdKWNdR7F8eWI6vclSFyw=
Received: from TYYPR01MB15615.jpnprd01.prod.outlook.com
 (2603:1096:405:291::13) by TYWPR01MB9758.jpnprd01.prod.outlook.com
 (2603:1096:400:234::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.18; Thu, 7 May
 2026 14:20:28 +0000
Received: from TYYPR01MB15615.jpnprd01.prod.outlook.com
 ([fe80::d8aa:d4b:55a1:2948]) by TYYPR01MB15615.jpnprd01.prod.outlook.com
 ([fe80::d8aa:d4b:55a1:2948%7]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 14:20:27 +0000
From: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Lee Jones <lee@kernel.org>
CC: Biju Das <biju.das.jz@bp.renesas.com>, Daniel Lezcano
	<daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, "linux-iio@vger.kernel.org"
	<linux-iio@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: RE: [PATCH v2 03/10] mfd: rz-mtu3: use device-managed
 mfd_add_devices()
Thread-Topic: [PATCH v2 03/10] mfd: rz-mtu3: use device-managed
 mfd_add_devices()
Thread-Index: AQHcyQg4hc1e26SvjEWxKMTUO2pclLYCrPEAgAAX50A=
Date: Thu, 7 May 2026 14:20:27 +0000
Message-ID:
 <TYYPR01MB156155337B60155F08D6346EB853C2@TYYPR01MB15615.jpnprd01.prod.outlook.com>
References: <20260410163530.383818-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260410163530.383818-4-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260507124620.GJ305027@google.com>
In-Reply-To: <20260507124620.GJ305027@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB15615:EE_|TYWPR01MB9758:EE_
x-ms-office365-filtering-correlation-id: 28045e18-70a0-4a7b-95b3-08deac43c99e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|18002099003|22082099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 /R8MTOQ36z08Rsz0kopD9tse5SjVWOvjBjz9EpX7Vxe3AxasYV5TIQ3esuJFEimEu65XIa99IcSz2MOPDv8c0d6bv5GD9EM7R14wbW8qA+NAlPDmrl3nteHawLD3PLysAcS7VAMeZ7bYEyq+/XDrZb9lIwexUL7CEZ+an3O1aHOESzPmEDMqPz9AB3XwR1S3/pGaaiJ99fHMh29rrMMDPyky5LtjU9jpGXR4mdKLz87it21Ite0R+Pq5quf/amukz6bHXE9lOSdIvDuOOjiyl9H35VcatV62TpbSS7mGK8B3jLsZncd5UrehbxUotkXCU2A4PYel1izme1KER9+0gh32dgTZcGioBTBKJz0DY/q8XQEqumkZfKrj3YMd/mOWbgT9vf8jhNQiMzS9EvRSPA+f7LWIdZzhdPiVSBO/kFPrS/Xyf6PimYhMvu7OErxRQHozSxOIWoESrxxpJhP/DQdxSRBBL6XC3/uHvA3la8eCoiNEOI+eDXS3Wc41g6DcqFmtHrfSS6gtw70paanKXsyYmv9cDbOI/aJTxCgp9o8XWmwnhQ2XNB/OV5G2Lme/y1WDZ6cIdgiTeZBmrepHfc3m14c1fmNzTXDu9bpZPFK5DjDxHw1iE2ya9v38p8YcciWWhu72bh3+rw7ajO5dn78/bdVICn+AFRYZYDDhD7vG4nLaL6YJ7UMLjFvFcDqPbOimSikyCoNrIhT0mmXDKXirQ/b9S4ZXVAn3NT6NnSHfTWL4Dw6c5CxtHGtupp0x
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15615.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?nOjYhj40WoXvhHKTtuXk/hdGlTZCPIm+GiSB+E+GpjqrtpLn0piRIexWpVjo?=
 =?us-ascii?Q?KaYULFKSMpNWXMf1wnXdk2gQgybY7U5EtnVx85Vk2E9xA+0SJKcbIVinKUYE?=
 =?us-ascii?Q?UE0VCOIIV59pijImMiPszemZ4FPFs4czKjrpOg/6jQGoQSGutdlr/XCLXXQY?=
 =?us-ascii?Q?PIqvDOxiG076W6d5T5JQC0lM7h6Ihs1m6CiknuE+NyMWn31TQoiyxgUdk72K?=
 =?us-ascii?Q?MjpSiWlmH3cLmHNt3HsxVo4c3SjMHSthGzbYJq81WElm3zPbe+QOqxq596hv?=
 =?us-ascii?Q?QsKUCEIRj8du+7OCXHKcPKz7s/HpIDapcJQgmx9JBzVBM6ZB4+WgIqVZobW8?=
 =?us-ascii?Q?fV2GaIMfpKewqxvaoMTgnwKQ2c4w1Zp3DbVLcwBZo3/cSTPyES6xe9FcNmdL?=
 =?us-ascii?Q?Xjl/aYDeoaGBCF0oHW7x2PL972EUu44tF1kwRPs+RfVQ+a3AmZQGTJk5FNtO?=
 =?us-ascii?Q?OUFAHIaSp75rdO246gwPV/3S6NdOMc1TQAgGXu4wpwTX+ZFcPwx6/UsQbMZF?=
 =?us-ascii?Q?Cn1b2kgmXmUfophppxgx5GB2REBwvKUJRRM3b2egrKwBsK1hTAWSAssPJQb9?=
 =?us-ascii?Q?NkRPKaBq17UmN99EcCapbCYTECobgmVzxUMzr7HGsS2BFWbHJ+n38uRipflr?=
 =?us-ascii?Q?rYdmcOfktJxd8iP9rz7buw6CbSoOPllN4MLR5Xg2HEXAeRcxJze5SwJNJ/2K?=
 =?us-ascii?Q?ZbcCac44Z0USX7ZHpLMNn7s0Bfla8lW7fdnDikaHW+5DChJQeEmpbZpJfiwS?=
 =?us-ascii?Q?DY+0wxME8mOHpnSd/Cq2zPecq9FJBRXQx6lHdgQkPgTBaIXCEgrC6reVAK2o?=
 =?us-ascii?Q?EG3S5pgvefMx9Eh+8M8ach7xbiLAMmw2BOz7gG867IdFLrvV0e28V2Mt2FTd?=
 =?us-ascii?Q?3U8KyLh/B2KNTWaRNdGt70i9Ny5ASIQxuwb+lS7moPUzfZgV73EYVzA1JqE5?=
 =?us-ascii?Q?eck36IEHoBzSs/XQc9uipiSsV1NtY93Pv3hHIlZ6hZAskg91he8pEWhPnqM3?=
 =?us-ascii?Q?26mFbj2OSql1z9mPKS4O2N2y1HoBps9wN0GVVZAKuwloQvpm81cDDIyDsrqO?=
 =?us-ascii?Q?akbC5pRVBG9kuxe8VDJ0KvhTsUfEHpm2f6LC6lDf3ZPAg5kkZFQ1pwS7pdlU?=
 =?us-ascii?Q?CPKQF+8xFqgduggJHXtlsZJv43SyVH1LcowlDdWZA/t+ltgHO8pVy9f3rY5L?=
 =?us-ascii?Q?e3uqA1fmgOdQhGVBeYHDlXhbmasUpQqLdx7K/qC3E0KC44X3g8E7u7SRlGXM?=
 =?us-ascii?Q?F1/Vw7YTHy4l6RhhbaagpmEVvcfAwlSy/LzQPiwzxTLxMmSORERPTwqHj2Z+?=
 =?us-ascii?Q?mGl1mk6D2q4XrVijsnOvgIkNfnSRdibq8eAEGgYIohlqIW/rgkYIpjVG5POq?=
 =?us-ascii?Q?w34MrbIOdhNfZz26DL5ibOXEk8/iK2GktF9u3ezUWdKorwKnynFdIhb6wpG/?=
 =?us-ascii?Q?OwWMi8erXhyIZLSMk+NH/CnnlD45mpN3yr3JZZS+RV/tbrJ53LmIatyHJXtI?=
 =?us-ascii?Q?s9xDGi6MhNziWDAw6DaRC0zQUKfRZRL1+RWrenr+LregXVkvpr3R7+GlQ8vl?=
 =?us-ascii?Q?V9lgSVy9Ccb3Xi0DSfrFAhOz5spBsl3QczfkBPBEkwli1kcge9VicNrasHFg?=
 =?us-ascii?Q?F7M7Y3Z5RKaUhrtHZXynt1dIn6oJ2oPM7q+ah+GElGDQjNYzXKz52PLOQBf6?=
 =?us-ascii?Q?SDECXOsuQq0sYisqcEYsmIVcFoLjBs2UgbBNbRgs6U0TvvdXg2NW40uXyTBo?=
 =?us-ascii?Q?SKKb/yWoA1KP9Nksi9p4LeLF/upgpPh59B8WLPN5VPJDPMlSZwix?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15615.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28045e18-70a0-4a7b-95b3-08deac43c99e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 14:20:27.8468
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3vNg38+sjesEBXuOBfRrtDTEl1BPYIVgci91QBW/Gyiw/PlpyNA805IF744n23kjfEX+akTHTx3BZOFpGYFffISlm/00v+aKMUOMlWCXoxDR3+HLACdZ5fq+Eegqs8DF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9758
X-Rspamd-Queue-Id: 433EA4EA0AD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32254-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,glider.be,gmail.com,baylibre.com,pengutronix.de,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cosmin-gabriel.tanislav.xa@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TYYPR01MB15615.jpnprd01.prod.outlook.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,renesas.com:dkim]
X-Rspamd-Action: no action

> From: Lee Jones <lee@kernel.org>
> Sent: Thursday, May 7, 2026 3:46 PM
>=20
> On Fri, 10 Apr 2026, Cosmin Tanislav wrote:
>=20
> > Replace mfd_add_devices() and the custom cleanup action with
> > devm_mfd_add_devices().
> >
> > Remove the ret variable as it is now unused.
>=20
> Do this first, then the changes in the first patch make more sense.
>=20

Doing the devm_mfd_add_devices() conversion first would not be a simple
replacement, as devm_add_action_or_reset() would also need to be moved
before it to keep the intermediate patch correct.

Otherwise, on release, the reset will be asserted before the MFD devices
are removed. Doing the reset conversion first fixes that without extra
logic changes.

Alternatively, we can squash the two conversions to avoid the
intermediate states entirely, and remove struct rz_mtu3_priv::rstc in a
new separate patch. What do you think about this variant?

> > Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> > ---
> >
> > V2:
> >  * no changes
> >
> >  drivers/mfd/rz-mtu3.c | 15 ++-------------
> >  1 file changed, 2 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/mfd/rz-mtu3.c b/drivers/mfd/rz-mtu3.c
> > index 6b9c6831dffa9..3be6f6c900b82 100644
> > --- a/drivers/mfd/rz-mtu3.c
> > +++ b/drivers/mfd/rz-mtu3.c
> > @@ -300,11 +300,6 @@ void rz_mtu3_disable(struct rz_mtu3_channel *ch)
> >  }
> >  EXPORT_SYMBOL_GPL(rz_mtu3_disable);
> >
> > -static void rz_mtu3_mfd_remove(void *data)
> > -{
> > -	mfd_remove_devices(data);
> > -}
> > -
> >  static const struct mfd_cell rz_mtu3_devs[] =3D {
> >  	{
> >  		.name =3D "rz-mtu3-counter",
> > @@ -320,7 +315,6 @@ static int rz_mtu3_probe(struct platform_device *pd=
ev)
> >  	struct rz_mtu3_priv *priv;
> >  	struct rz_mtu3 *ddata;
> >  	unsigned int i;
> > -	int ret;
> >
> >  	ddata =3D devm_kzalloc(&pdev->dev, sizeof(*ddata), GFP_KERNEL);
> >  	if (!ddata)
> > @@ -353,13 +347,8 @@ static int rz_mtu3_probe(struct platform_device *p=
dev)
> >  		mutex_init(&ddata->channels[i].lock);
> >  	}
> >
> > -	ret =3D mfd_add_devices(&pdev->dev, 0, rz_mtu3_devs,
> > -			      ARRAY_SIZE(rz_mtu3_devs), NULL, 0, NULL);
> > -	if (ret < 0)
> > -		return ret;
> > -
> > -	return devm_add_action_or_reset(&pdev->dev, rz_mtu3_mfd_remove,
> > -					&pdev->dev);
> > +	return devm_mfd_add_devices(&pdev->dev, 0, rz_mtu3_devs,
> > +				    ARRAY_SIZE(rz_mtu3_devs), NULL, 0, NULL);
> >  }
> >
> >  static const struct of_device_id rz_mtu3_of_match[] =3D {
> > --
> > 2.53.0
>=20
> --
> Lee Jones

