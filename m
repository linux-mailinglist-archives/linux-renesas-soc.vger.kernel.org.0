Return-Path: <linux-renesas-soc+bounces-30129-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCs/HPigwWmFUAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30129-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 21:22:16 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 809B22FD22F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 21:22:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7885830EDD8C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 20:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 600423E3D83;
	Mon, 23 Mar 2026 20:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="BmN7ldU2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010047.outbound.protection.outlook.com [52.101.228.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6783E5569;
	Mon, 23 Mar 2026 20:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774296891; cv=fail; b=dpPQV2ylA3D5sAXjSUPHjP4+EXTQr0vYbmWDxOqQQVpeYAsaR/W+B4gpgNzN/tUgq0M3AA9nUHUPf0lzJj6h1KQHQ0+3504hh6NgLFf/+zKSSzz3CNddXGBWh5rIkhRtv9wHvLwyETqmb5Q5I87Ye+Z6sPAc//lhshLPTZlJXn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774296891; c=relaxed/simple;
	bh=yFONrEd1Pbmn1PFeBNue+pk1VnG03605a00RU1IhSK8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Lvj6kNUYRsFHiuBKVcGhWFXaXTaqIHW3/KXrTfw9Wcyi1X6aNswPMQ2K2vYKYzJYOccHMEYLFOewIboGc0opqMfgMXNLP9KHmwHTHPwM0ldUW37Y6AsfGfJQ/I70MAhv7R85L5TFPR0MRgVRDZmcKoPhXZcwmlPf5qKTjdLCOXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=BmN7ldU2; arc=fail smtp.client-ip=52.101.228.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EPAf2EXpIQahJC8xoCIGoIceAnkle5wJE7S34KNRKvrW3xxvET9ixUODrXJHnaO0Oqb+WYhhvuopY0U5BCeol9Enwcc61EAZrYFo4R4kLGydFCwzwFFkryze2bTFakqb6pAXkaRCAmllEuqu3dETuJCGmh9dSwaKP7QD0L7TGiV38VBF/BieIPCp/hbGfyDrnQI1aZ0YsVvLnWHtdO8YF2yk2IdmIP0MXuRi1uFaKxnoLAq7CBI0oyljkm7zN0sbBUSXbk+iLW3Oyn3Xcwd84zoKXfGFr1xd6X3ZW1A8AKksSHbrkvJLmon6AgXlYz/x2k5EIcU9oPqAGa6jAPVUtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BObLDh7G0sKGPxGRUVlSV5M62Ir+90euW2k5N29THeU=;
 b=lGq9RyFMyb1sh+GvULNro3mIRGbNce8WNThbatvYeNsvn2ev504l3pzkkhZkq8e4iFsci1GlvuhYryAAFAA2TLwPLc0T4Y4AOFzynbSZlDu4h3fLBgmRddE07h+Q6N0J8ayxbnievhcC1k/GseNYCP8zlWXFobF1Kjm2taKeaViIc6tq5ajBl09ll+2eK474mZ0jJ+4qhUVv8W9ERt/cWHVA0grHsOsvuiV//gK7ioV+dg4+mU6i9tmxUfHU9a6OrbRuuloaQ+EDjTf7ETd8cTCOO+V4g/b++pTP/vzYk1jQPQLPLb5KstlXHuGK1J5G96NcoY/zthuUHy545LYPlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BObLDh7G0sKGPxGRUVlSV5M62Ir+90euW2k5N29THeU=;
 b=BmN7ldU2PPovkF8xHW5L8elj0CVE0HseKqrWH+yzOu7HzrvTzgkwhTjXFFfv++SAI4klAHHftbcoAz5MCeyAXQSvVSsyk4qJU/sN57fUNkMf/skEvKa5aW2TP2BDgBMF8RcITa4Fb43UYeGML3LnfMIxIfYZqqzPBCuBTPP88Wk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB11631.jpnprd01.prod.outlook.com (2603:1096:604:244::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 20:14:23 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 20:14:28 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Thomas Gleixner <tglx@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v6 03/15] irqchip/renesas-rzg2l: Drop redundant
 IRQC_TINT_START check in rzg2l_irqc_alloc()
Thread-Topic: [PATCH v6 03/15] irqchip/renesas-rzg2l: Drop redundant
 IRQC_TINT_START check in rzg2l_irqc_alloc()
Thread-Index: AQHcufbQoz1eVvgnakyaEdniaPYxJbW8BFZQgACJ+iA=
Date: Mon, 23 Mar 2026 20:14:28 +0000
Message-ID:
 <TY3PR01MB11346583A42FD1B889CB840C8864BA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260322122421.132474-1-biju.das.jz@bp.renesas.com>
 <20260322122421.132474-4-biju.das.jz@bp.renesas.com>
 <TY3PR01MB1134678CEA04F42230ED8929D864BA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB1134678CEA04F42230ED8929D864BA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB11631:EE_
x-ms-office365-filtering-correlation-id: 88d5964e-54ea-4a9c-d315-08de8918c978
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 fDwo29nfJXHgsV/0hLPlL86cydJwHo5uMRKtyp8tCU3qDT8siJ4nEYOK0LSMXs92MXfo/4k+PkbUBhljXuAV4ug0aa/bwiip/x80HXT0JuDxoaR3KYVN+881bWciODHmDobTx9j8saMgtoBNe3uwOPl6krJyWxpC2sLCHy29AQeDL0PHsawH53TaqxrlYDFmhvWPfeibRwV7Fb+mar1JBxcjdJKYuPxADnNW1lerU9nWMa7zTRmk8buSZczry3l+M2dUr4LGudl23gN1vU22xfrxFM0sWkyXvD/pkLbC21PURLv0E9/Cv3kMZdJxVZAnNuSzpv6doo3rS0OoLjL2Y5m1FcGj3prEnrw9gE6aLKDa05/TO/1eHXckvGoU5QT3F1EpcsAKgMxEvXEg0RIjUE/5928of4yce3Bj7N4BM/rKzg46tNSWoIonZzO/BJq+Ro1O+cO5KYOpokpMVbeffv7ommVkkN1dF5CGSUg8x07Fh7rRHiwQt46j0Z8TgS7rIF1m/kroBl3JPd6hJEluZMUONLbMptl3iFLFyZMI+FVWRY6cdcD0szWVQCw7w7EHsb3hTkYAR641sQRs+S9gZLanqbCIZEJDx9fiBAYMIm3tA+p0MVK4Knkkn1wkMspsCb0Pv1Ngn0/WsQKhc7FoTVp3j/udDPLsvGXeWA1tw28dSrR7x61Yna8dvWnLOcnPzCnlwlgnmlm2oBv7xsfeZtpABCfxiylRc+l9HSnaVbStAjNLKsoDV3uvkCAMKjbW
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?oisU1ur/WC0hRhPW2+GaySsdEsoJdbJx8ovL/6Ll6WZYIdRiRbSdn+UYN+Ub?=
 =?us-ascii?Q?l0oQP9reZlnZjAgpcmfPQuhtXn8Ib3omElYwAj3QCl42d1XoVSeKIgNqatee?=
 =?us-ascii?Q?av2PmVyvEiu+pG1hUu5SbDhQe+5JJqnM3s02uckowaL1IOs8q2VHhlNxaw/M?=
 =?us-ascii?Q?mvxVGQf+ZA+fpR/B4c0j3wkpW2cX2I9JI2DRki8KCIrpLSoulJpWkcZVoEM5?=
 =?us-ascii?Q?iHYdPnAOcJAhwI5OEd9Jo9W5OyF6OQgYDAPdMkQwSJfxmLSyeuEQIRoD7UYA?=
 =?us-ascii?Q?8BwBkRUAfLUWCllUFkdOswpXD/3P+QOqie3S4n6Zhn5UTOHwse5DOVVAWs5p?=
 =?us-ascii?Q?334rw3PrGRrp6kir3/4G5SYSqrgQrbtdscCuoTinSPC47Vp+nvhcQrSjBKXa?=
 =?us-ascii?Q?NsGsW2eiyuMqYAkTClSSbvBXAzMKWFtTcFh13BBPh9cLkwi62tbqakoWVW7a?=
 =?us-ascii?Q?clH3UvHfP/MFOnkUzyzwIRgH5ScQF9GaT+j31IxoVB6X5SqglgDt+Yeey2Cg?=
 =?us-ascii?Q?1epQWNTBMWgyOECnpquZ7sTw11v2bCjpO0yYafyFovYcOXXufZ1aUfLyEGAh?=
 =?us-ascii?Q?fOFrxGj5GNMWIEIVz5b0f7cGdiGTIquxlx5iUeN4/1qinCHtt6Xe93/liw0L?=
 =?us-ascii?Q?fPMC3IfcyDmHE+T/miIlpaVeDhuvlV1MBckexBkOnVkXDe/vl8gp8RZd0deC?=
 =?us-ascii?Q?UwmeAdNR39ROlQ1pH6MqKXXi6mmN1KHJ9dSgT9nD8mattAuy9hWgTNlL69tO?=
 =?us-ascii?Q?YppXhoj31Kj0RWAMkQke6HNIETGpDw/ydLX15EIa+rZhwZVJqMPScLabOPQJ?=
 =?us-ascii?Q?7O04TveCtqaWVLtvAkXw03vwWY3cCJ2EryZYzdldaZedsqw0MxIcE1JoGkuc?=
 =?us-ascii?Q?n6+dTYStfn8s5FErp2I84oul7OHU1TzUwoVZzJfuCbrR3GtlCssIWQrx5cx7?=
 =?us-ascii?Q?fxNAjqD/SeHrylk4mW/L74HG6cuD+26z2VYgBqj/TthG2B/7RWzd1utamy/a?=
 =?us-ascii?Q?N1cZkcQ4yHMCo7dxiyq6kOwFpN2lSuGbwqN2G3OosUaAWQYGYYO5DxBaOGhn?=
 =?us-ascii?Q?8Snn2NPj7UfbZJqH2Yibg9ZNP2x7ajACYDqbmTNFEYNhb/5kdVjFJOZmeFyX?=
 =?us-ascii?Q?l/hr5ZthvuSZpGYkEsrv7+jE52T0/chdmzpeRN19aj+J0SyGGC6SoIXcPAyL?=
 =?us-ascii?Q?VV7itZay58Kjah0r3l8qdeskWgjostKhJ6pyOb4Y2ATLD/zC65MI+xmNKhqE?=
 =?us-ascii?Q?cZGOAas2poFYcmjHeeFpjCRSgieKRi9s34/ue1YZQd912fBE8e2rrQ8LKVRC?=
 =?us-ascii?Q?fxzy8rUfGEDdxTPakDyE5G1bF8sQqXsRLvtCPYE/sCdKCu3gf8akd2sZig/F?=
 =?us-ascii?Q?jNZKVMjAUwCcQgjO2ve9TkCRmlVoYgisQ5ol2o3oSNE58uSg9HOQKaMuPoQ2?=
 =?us-ascii?Q?XQqW4+HbZ3fyaHMQ8pHvw4Pr43w2qHi2eMGv7zdG3OnKGsoAZcwDSkBv8mOm?=
 =?us-ascii?Q?RAv/WIx69k8S1aM+DrDnQfs1pQxW0cZ62oW8YxEViOhD/Mf4p03Q6U+6ad/l?=
 =?us-ascii?Q?ByhA/NXgbV+Bi56GLki49JkMrPH5AN6akzZsLS1I+ZlDWZRIysWDwuWxkD87?=
 =?us-ascii?Q?HUYBbOclAsfBHWA/j1fclN/2ZgNdLI8zzSYaknAVhbMim4nYnPPFdCze1lGw?=
 =?us-ascii?Q?0ipUCRHHCX0UtVADQKBsDqdDrFn/sR7CH/aHCbGcxulP1YGHuqFe4xXdBrFd?=
 =?us-ascii?Q?F1eWtWL9UA=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d5964e-54ea-4a9c-d315-08de8918c978
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 20:14:28.5131
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hDXjvM2Y2c3e6i1B5uWRBEob7NhmJyyvQJISl2Nh6REfjpa9R5ViIyUxLAkW+OJ1CcaHyTAtfG2sf2gaZCDsqzI0h34e2mQQ8Aqvn0P2gis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11631
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30129-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,glider.be,bp.renesas.com,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 809B22FD22F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

> -----Original Message-----
> From: Biju Das
> Sent: 23 March 2026 11:59
> Subject: RE: [PATCH v6 03/15] irqchip/renesas-rzg2l: Drop redundant IRQC_=
TINT_START check in
> rzg2l_irqc_alloc()
>=20
> Hi All,
>=20
> > -----Original Message-----
> > From: Biju <biju.das.au@gmail.com>
> > Sent: 22 March 2026 12:24
> > Subject: [PATCH v6 03/15] irqchip/renesas-rzg2l: Drop redundant
> > IRQC_TINT_START check in
> > rzg2l_irqc_alloc()
> >
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > The check `hwirq < IRQC_TINT_START` in rzg2l_irqc_alloc() is
> > unnecessary as the condition is already guaranteed to be false at that
> > point in the code. The outer `if (hwirq > IRQC_IRQ_COUNT)` block
> > ensures that hwirq is always above IRQC_IRQ_COUNT before reaching this =
check, and since
> IRQC_TINT_START <=3D IRQC_IRQ_COUNT, the guard can never trigger.
> >
> > Remove the dead code to simplify the allocation path.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v5->v6:
> >  * No change.
> > v5:
> >  * New patch.
> > ---
> >  drivers/irqchip/irq-renesas-rzg2l.c | 3 ---
> >  1 file changed, 3 deletions(-)
> >
> > diff --git a/drivers/irqchip/irq-renesas-rzg2l.c
> > b/drivers/irqchip/irq-renesas-rzg2l.c
> > index e73d426cea6d..ed8044b0a339 100644
> > --- a/drivers/irqchip/irq-renesas-rzg2l.c
> > +++ b/drivers/irqchip/irq-renesas-rzg2l.c
> > @@ -491,9 +491,6 @@ static int rzg2l_irqc_alloc(struct irq_domain *doma=
in, unsigned int virq,
> >  	if (hwirq > IRQC_IRQ_COUNT) {
> >  		tint =3D TINT_EXTRACT_GPIOINT(hwirq);
> >  		hwirq =3D TINT_EXTRACT_HWIRQ(hwirq);
> > -
> > -		if (hwirq < IRQC_TINT_START)
> > -			return -EINVAL;
>=20
> I am planning to drop this patch as 0x10005 is invalid for TINT IRQ This =
check will return proper
> error.

I will retain the patch, based on [1] this never happens.

[1] https://elixir.bootlin.com/linux/v7.0-rc5/source/drivers/pinctrl/renesa=
s/pinctrl-rzg2l.c#L2609

Cheers,
Biju

