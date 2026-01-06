Return-Path: <linux-renesas-soc+bounces-26323-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 81624CF8F14
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 06 Jan 2026 16:02:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67889300C0F8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Jan 2026 15:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B5D333447;
	Tue,  6 Jan 2026 15:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ZWCNqoOP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010033.outbound.protection.outlook.com [52.101.229.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD96B32ED36;
	Tue,  6 Jan 2026 15:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767711716; cv=fail; b=D5fGy/VKB5FQmpNhUtvmqBiL9CASsmtZuWd+fsl80NSZ1pp/RLpwJ5VHPXV9Hl7Ri4SIVfgs+dHePJZl/NTf5xHgTZRJjl8B8ibvNEffDInpmc7X6C7a/9UIOrpz4d9NZrDcBb1jJllvmhNs1wgJ6nBMI44E7gzLQ2MltgssQJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767711716; c=relaxed/simple;
	bh=5Y82km6lr7T9IQ8fiPrkzWy7UXylPmoNFULrgaMBA1w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SMpdrKBMJAwZy+iRtHM74XJXQq5e1/GzChWpUi9vVptXMcyvVMs0cAMxiklNANhX8RqjXzSlZsQG4VvUyfoToYTPnpR48FEMxyw8pT4nJ4i3+tFW93Xfktz6YOe+UTcN1TxFbmpjAqfeRFIcvN1Q3ojhTlisIfZ2X5miXwnk1zQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ZWCNqoOP; arc=fail smtp.client-ip=52.101.229.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KeAyCsaKQLla1Xzjx213NPBH/Xk//bYMBBU0ii4IVxnRRigA4/l1V65xwemcmGNux2c10BqE74spP5mmORuUbNpUmcxGj4pM0/Xd60DxK5j+Kr/X6Z3hbRE1MoGWw+sExQ/nGfXAg9KfyxPhC7MyJwhwrsELMpIpPIdnLwYjf+Mu6A+z/k2TuNDwf1g++Heb7NAdvlAt3LRAi7Ah35mhlh9rvhjgOkwKWSgin4v56ZxAVRhJuHCLSmzdZvswkNyK4/ShwMvBQx9ZsCX12vNat19c0bAKzKidukzaQu6+OiLVBD3C7eWHEjTIjhtijvjiS+opFA+rErI5zuLXImn6fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIO2ce054HvUPoFFaV3XPa9HTBbB+Tke22qn7UW2tOY=;
 b=ep6+fgrpd7k5Lnsi8IWou6UrL9gAhZ+9QaeXbKdHnGexfWinnf+DjceCISYioHx1trTjpZtf3BOtcXR+CtrH/OoEfV/PbFqwozHmPxx0/xf0sf2K0EAJXnhq2nvzmtVKye7AoQeRDnJC6eEwgdUByKt2SfjSNus5PuagqjXk5K6P8F7GBZuAMhW7+nbDKP9Hojx2WJYFnMq0XCrcvx4NfNEOfP5iH6aEZlH1ix9EBdUbPT9dDsp4Qg1kGIUsqCzRZhvuKROOzUWnQT0GPkc+/hE7jRZ3IqYRfWFUnmy09Vd7SkU0zaeL4MaKTnUVTPi9NEj2f5niO2bo+SeqIHrjng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIO2ce054HvUPoFFaV3XPa9HTBbB+Tke22qn7UW2tOY=;
 b=ZWCNqoOP7eH+TuBrtCuHMfS2stYGYK71u3spoVStCj7yjELtQB6byPocx7xZ2fd16Epf91soOlj3Q96tQRP7CsZbCUlk5yU4SRgBydU0gz/1PXZEI0t8e55eNbudPI+a2BGd36Qr0yauiRdaX2Hb/n/qMX/3T72l0QtAtYg3eek=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB17131.jpnprd01.prod.outlook.com (2603:1096:604:457::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.1; Tue, 6 Jan
 2026 15:01:49 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9499.001; Tue, 6 Jan 2026
 15:01:49 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Frank Li <Frank.li@nxp.com>
CC: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Tommaso Merciai
	<tomm.merciai@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>, magnus.damm
	<magnus.damm@gmail.com>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 1/4] i3c: renesas: Switch to clk_bulk API and store
 clocks in private data
Thread-Topic: [PATCH v4 1/4] i3c: renesas: Switch to clk_bulk API and store
 clocks in private data
Thread-Index: AQHcfjEd/HHAzFY+c0mlsn4qV6uoULVD0GoAgAAOSSCAAVwmAIAAAj4Q
Date: Tue, 6 Jan 2026 15:01:49 +0000
Message-ID:
 <TY3PR01MB113466AB09CC77C375492A0E28687A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <cover.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
 <94d378e99ded450ba118813b35239f9a10a73daa.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
 <aVvw3pjhphnVv7g2@lizhi-Precision-Tower-5810>
 <TY3PR01MB113466E129D0970F0E2541F7B8686A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aV0g5j01beuz5CO+@lizhi-Precision-Tower-5810>
In-Reply-To: <aV0g5j01beuz5CO+@lizhi-Precision-Tower-5810>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB17131:EE_
x-ms-office365-filtering-correlation-id: 1d129140-6828-4a11-e66a-08de4d348495
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?iACLlhJDOtThGk6lVtjqFk8LXZD/PM7nulH2EIpkIO0PAp0r8q41LitN6car?=
 =?us-ascii?Q?ZVoh097C0Pzf7ksPhn+ZroSmc8C/cL0eDIyWUHvxLVn5uQfwPnP8dNNaU/4w?=
 =?us-ascii?Q?fAhJChM9Wb8jrpDB7sEdpU9wuRb+cLJmug2eVaq8+M+PqzBl3AVwkvUbYuF7?=
 =?us-ascii?Q?JMyNK0zQsxAccYOxK9YfraPjkM0MA/7V2skOvglicgPQ8Ap0F4PV1TW5V5jj?=
 =?us-ascii?Q?pUXyVOlesyZ6wYNPMZ2y+w7EUizSXrxhNR1CP0JMC+hOZpTSWnTLks20PVKp?=
 =?us-ascii?Q?VqVxeAj7DPQJRoNsBOyH4+WCvrVlUPir2LIFSRt8+qRiuIe4wA7VIzBdJso/?=
 =?us-ascii?Q?pU17gtL5SjiqVliumCOPIk/5i2tb9A/KE64WB0CF1XTWgwi16teNA5mXsQh0?=
 =?us-ascii?Q?M4EiMS3d9wIVFDCynwM34Gpy+SjMCl2mpJJQS3sH51GM2XZEbv1tM+Tttkwa?=
 =?us-ascii?Q?Vhs4CCH36F8rXQOAYnmyU9Ja0fUxx4QK4TiWLQw4ojEygRwJMj40R79dzDql?=
 =?us-ascii?Q?dnmVuw5znaeCph3s5xXzPurBQiAnFZ7ryWMT36eSn2/i72AZIYcf+mcAOoaQ?=
 =?us-ascii?Q?eX1KTjfRWy1DXe8quhWMZOLuATjXCpH4z44CkLzcOFVKmrnhWhFOLbInqAwo?=
 =?us-ascii?Q?EHIOmQdbViQkaU+A40dZ5RCbMdtfST9PpF6c/PpfNrpoK19TOJnDD/e4UevZ?=
 =?us-ascii?Q?ETk4+bDYBum3pBxaGtkA21rrahoLrU5nmMchPwDP7jH1iYtQPXp0mYcsZVOd?=
 =?us-ascii?Q?jDMfEUMKGRk9lq2ke1EHecq0BDE1dSVPkfuhz8SxV+wtm3B6eUKaYYChZBmZ?=
 =?us-ascii?Q?xdEBYXGy9x5iZXKpOurjPe/U5bMZPJGgCGEG73B1lBNg7fO1BfvRxmLvjJ4o?=
 =?us-ascii?Q?GRWzSoc3Ig12tYYl0d67+MHIOVflktGDTAYzgo6+C61p+v5ArYmky3g1U5L3?=
 =?us-ascii?Q?JDdhbVSRcGeXdsGYNzhOm6nO4pC+xQRKHa8y4NIQ3/X++iAlqXnxSDApO7/g?=
 =?us-ascii?Q?xqxpigkw0s5ssOHmxovkIH9IRO2yM0CaxEdStinpKrHA/Q2Y6v+FvClrSBtM?=
 =?us-ascii?Q?nLgLUIjrt0K0RFPhL/AY4h0VZvoejtglg99Qg8pzxe2Uhgu8QeEmxAwEe3Vf?=
 =?us-ascii?Q?eh6tPVDi+vIHC3m13/c8+kizJBuazGXJpmzKP3q4qeBd6lo445wCsa+OPgNH?=
 =?us-ascii?Q?Vqfl6uf/0fvZxE9U3svedjQ9DlCKHeGLUh7IXFqewSRp6WHdxEvtqJqdOYRA?=
 =?us-ascii?Q?n/T74CvdC1wRAvtVyObqlRVZcx1lfCYYGPZrqI04/51JnzW+jhbdXafnKFBR?=
 =?us-ascii?Q?SKAQR/t6SfeJENxuWLzNByfWyvqB2EnQ16OU3CSbHzZFFT9L8T4JOr7cWQlI?=
 =?us-ascii?Q?pOSBE91Ixrc8PgMtXVSIp9dmqyGLxdKuzH4LxMwmLKcChNE5frkUsHWtweje?=
 =?us-ascii?Q?E19q0vyhJloXaZNJzl615MRxaaj/IAbEMXKdfigGzTUbYKAAYaVFYzbKodb5?=
 =?us-ascii?Q?T9P+QAd5X8LPj12MihoEVTeOWreUZ+ZRYlkP?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?uGv1VLXsU6moEaVmiSuRa6GrplX9oMrFvW3yHU6Iz5sT/bxDXFOwvUjWChug?=
 =?us-ascii?Q?67ArW3w8/X3CCE/jJVnAAvI6ui/eOk9inkUTAgcg34WfLxfVCLXUUO5cqJKD?=
 =?us-ascii?Q?4MxNX7BPcixp8l34nVDpyhRKmYALPQ6wsQJPKAwsOfyMj70kCIkH16ck1TJo?=
 =?us-ascii?Q?vwyjUSsv2rNLIbTgCNKIdZVDK1ssDsKRG4FszSrCxLv+64ewM0AaA/Mz9Erz?=
 =?us-ascii?Q?5ZmQgEF9oDI7jDsHfcII4JIlRAxmDfnSc7rprQXuDsUVUqjP0iosy2kjeSNo?=
 =?us-ascii?Q?hjLAMKYhb16P3Q8N8Co7rJouU33gwgOKtVSrYh/nEhu6P7geUAYRSL6ll7Cm?=
 =?us-ascii?Q?wmXzyTHwt0RFBdqsZq7bf+p6r4IxaWgsUUiHwtHDxRI2T3u0POix5uHUl50Q?=
 =?us-ascii?Q?uxHZ0AdRBZwRV/GBeU96qniZ9aXAWIByEwQ60cbxBf6VgD/sTOHJVlIa0Mgt?=
 =?us-ascii?Q?Sz9j3J/9XNjdkJx0pSl+cRJLaXRW/amVlnVgPqdJOK1q7wfnIo3CT/XPRjdM?=
 =?us-ascii?Q?FIv503pGeJfTr3WbZzoauMSSrlNaHn6dFTzp80tJEM+oodL90Ei9ABmVFMLV?=
 =?us-ascii?Q?XXvYG+mDMXcT9oPzZVjlcjN1r4qNUpN6ybjjsLbPk7+uCMvtsMb2j7C8mcig?=
 =?us-ascii?Q?DHGGEa1053pov5VPS9S4GQo1EJMEvh5uzfUyjTCHW1MqktD60EXmGwMhOQ/W?=
 =?us-ascii?Q?DhvmMF3ItPv84/oScY9ghFdVH0IWp93BxPoei9Go8mqf7ORTmMUcjzCLmJwM?=
 =?us-ascii?Q?BXNxyEc+bJOVuasDLaUh/E2q0nvhTRxd9sUVD2+YM1FOjMCzlrgk9CVDr86Z?=
 =?us-ascii?Q?XuufPLoIFH+lNqBvAW0PYRSJRb4aaggdlewoUu2oOqtuMs9SryKOqg3mtPgk?=
 =?us-ascii?Q?H7VxSq9TT32x7rJyPopKZ0W3FsNzY3pbAhNetGS9IxUjVCi8/tyaatW578MC?=
 =?us-ascii?Q?SYYmw0pmVtP18ZnzPKQfdpViRzfV4dM+vNHST2Bb/D+x8XSHtz5Omx1doMHX?=
 =?us-ascii?Q?1co62yafOV0+bEw6BVAZ295wDnMDkX9k6j0L34QBWc0488NjUSnJ4b1iVuwX?=
 =?us-ascii?Q?hhVdQn+cw6wZv4z0l1jGhnWyi4F/M6oiGuEEte32Jz3uCXMq55cNRnooUIxp?=
 =?us-ascii?Q?gMlGO+K8TirXtaI+dyll26Z2qx20ne7x/Ao0HJlJL4pIJZmlzu8lzQTJSVmc?=
 =?us-ascii?Q?+cJAULNE2hiWq87NiQa0D9Ex2MuoRpX+C4xJAjiRF8iPk3ljQbZQjglJNH30?=
 =?us-ascii?Q?7bC3sVadGYaQjBtolc9XeHiC5fcVwbwL6+IybccImKmrI8Eo2VBHI2jB/5mQ?=
 =?us-ascii?Q?aJRVTl9WZ9h1vdoRmFZ9UzRxmPheZagmZrPoFrtKABpqIsUSuDegGEV6ZY3O?=
 =?us-ascii?Q?3fS+Ev3v0oyN4SgqKeQrhoZ+JQqAaqi7rIAYHnq2rIA1jlhzQfn4dp/zVj6J?=
 =?us-ascii?Q?hqkmEiVtblA7eYdDQcS9lvioYN7FFukceUilhzpmgrETRmKH/B/9Vn9dlcPh?=
 =?us-ascii?Q?ohLFSbS3AOhZEyRc3G4Toxx/zBJyZagnfe8bZAGVfrbvqWUCCvarm+DV3paW?=
 =?us-ascii?Q?Brh/Y0dRvE5w/D9vE70MBbIbfKA2pET1cuvxwXYnrtgxhHAJXkbI3rseEzrd?=
 =?us-ascii?Q?fiyS4KR044evhUid8eYszeLgAL7FzBYFVYMuO/mYUTPtcoibqIxwoSdi6d+w?=
 =?us-ascii?Q?NfdO5+doUGLPLE3L99W/kefuiScRgwlZsjOOx7RPd+YtaKM+/iN31qBwEWkz?=
 =?us-ascii?Q?VBO8nGgR0g=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d129140-6828-4a11-e66a-08de4d348495
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2026 15:01:49.0871
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K46WuIO9ksZ5GKp9HzMfeqxNIwO0tPVsAknHMVBSJwze5gJnUriv09q5cSNsGecFCy88RJYFfH19IyhBaGBTyySg1mpYeUXScaYmZyl12ak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17131

Hi Frank Li,

Thanks for the feedback.

> -----Original Message-----
> From: Frank Li <Frank.li@nxp.com>
> Sent: 06 January 2026 14:49
> Subject: Re: [PATCH v4 1/4] i3c: renesas: Switch to clk_bulk API and stor=
e clocks in private data
>=20
> On Mon, Jan 05, 2026 at 06:06:19PM +0000, Biju Das wrote:
> > Hi Frank Li,
> >
> > > -----Original Message-----
> > > From: Frank Li <Frank.li@nxp.com>
> > > Sent: 05 January 2026 17:12
> > > Subject: Re: [PATCH v4 1/4] i3c: renesas: Switch to clk_bulk API and
> > > store clocks in private data
> > >
> > > On Mon, Jan 05, 2026 at 11:49:59AM +0100, Tommaso Merciai wrote:
> > > > Replace individual devm_clk_get_enabled() calls with the clk_bulk
> > > > API and store the clock handles in the driver's private data struct=
ure.
> > > >
> > > > All clocks required by the controller are now acquired and enabled
> > > > using devm_clk_bulk_get_all_enabled(), removing the need for
> > > > per-SoC clock handling and the renesas_i3c_config data.
> > > > The TCLK is accessed via a fixed index in the bulk clock array.
> > > >
> > > > Simplify the code and prepare the driver for upcoming
> > > > suspend/resume support.
> > > >
> > > > No functional change intended.
> > > >
> > > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > > ---
> > > > v3->v4:
> > > >  - Collected Biju Das tag.
> > > >
> > > > v2->v3:
> > > >  - Added define for TCLK index.
> > > >  - Use devm_clk_bulk_get_all_enabled() into renesas_i3c_probe().
> > > >  - Improved commit body.
> > > >  - Dropped unnecessary static const char * const renesas_i3c_clks[]=
.
> > > >  - Removed the need for per-SoC clock handling and the renesas_i3c_=
config data.
> > > >
> > > > v1->v2:
> > > >  - New patch.
> > > >
> > > >  drivers/i3c/master/renesas-i3c.c | 43
> > > > ++++++++------------------------
> > > >  1 file changed, 11 insertions(+), 32 deletions(-)
> > > >
> > > > diff --git a/drivers/i3c/master/renesas-i3c.c
> > > > b/drivers/i3c/master/renesas-i3c.c
> > > > index 426a418f29b6..1b8f4be9ad67 100644
> > > > --- a/drivers/i3c/master/renesas-i3c.c
> > > > +++ b/drivers/i3c/master/renesas-i3c.c
> > > > @@ -198,6 +198,8 @@
> > > >  #define RENESAS_I3C_MAX_DEVS	8
> > > >  #define I2C_INIT_MSG		-1
> > > >
> > > > +#define RENESAS_I3C_TCLK_IDX	1
> > > > +
> > > >  enum i3c_internal_state {
> > > >  	I3C_INTERNAL_STATE_DISABLED,
> > > >  	I3C_INTERNAL_STATE_CONTROLLER_IDLE,
> > > > @@ -259,7 +261,8 @@ struct renesas_i3c {
> > > >  	u8 addrs[RENESAS_I3C_MAX_DEVS];
> > > >  	struct renesas_i3c_xferqueue xferqueue;
> > > >  	void __iomem *regs;
> > > > -	struct clk *tclk;
> > > > +	struct clk_bulk_data *clks;
> > > > +	u8 num_clks;
> > > >  };
> > > >
> > > >  struct renesas_i3c_i2c_dev_data { @@ -272,10 +275,6 @@ struct
> > > > renesas_i3c_irq_desc {
> > > >  	const char *desc;
> > > >  };
> > > >
> > > > -struct renesas_i3c_config {
> > > > -	unsigned int has_pclkrw:1;
> > > > -};
> > > > -
> > > >  static inline void renesas_i3c_reg_update(void __iomem *reg, u32
> > > > mask, u32 val)  {
> > > >  	u32 data =3D readl(reg);
> > > > @@ -489,7 +488,7 @@ static int renesas_i3c_bus_init(struct i3c_mast=
er_controller *m)
> > > >  	int od_high_ticks, od_low_ticks, i2c_total_ticks;
> > > >  	int ret;
> > > >
> > > > -	rate =3D clk_get_rate(i3c->tclk);
> > > > +	rate =3D clk_get_rate(i3c->clks[RENESAS_I3C_TCLK_IDX].clk);
> > > >  	if (!rate)
> > > >  		return -EINVAL;
> > > >
> > > > @@ -1302,13 +1301,8 @@ static int renesas_i3c_probe(struct
> > > > platform_device *pdev)  {
> > > >  	struct renesas_i3c *i3c;
> > > >  	struct reset_control *reset;
> > > > -	struct clk *clk;
> > > > -	const struct renesas_i3c_config *config =3D of_device_get_match_d=
ata(&pdev->dev);
> > > >  	int ret, i;
> > > >
> > > > -	if (!config)
> > > > -		return -ENODATA;
> > > > -
> > > >  	i3c =3D devm_kzalloc(&pdev->dev, sizeof(*i3c), GFP_KERNEL);
> > > >  	if (!i3c)
> > > >  		return -ENOMEM;
> > > > @@ -1317,19 +1311,11 @@ static int renesas_i3c_probe(struct platfor=
m_device *pdev)
> > > >  	if (IS_ERR(i3c->regs))
> > > >  		return PTR_ERR(i3c->regs);
> > > >
> > > > -	clk =3D devm_clk_get_enabled(&pdev->dev, "pclk");
> > > > -	if (IS_ERR(clk))
> > > > -		return PTR_ERR(clk);
> > > > -
> > > > -	if (config->has_pclkrw) {
> > > > -		clk =3D devm_clk_get_enabled(&pdev->dev, "pclkrw");
> > > > -		if (IS_ERR(clk))
> > > > -			return PTR_ERR(clk);
> > > > -	}
> > > > +	ret =3D devm_clk_bulk_get_all_enabled(&pdev->dev, &i3c->clks);
> > > > +	if (ret < 0)
> > > > +		return ret;
> > > >
> > > > -	i3c->tclk =3D devm_clk_get_enabled(&pdev->dev, "tclk");
> > > > -	if (IS_ERR(i3c->tclk))
> > > > -		return PTR_ERR(i3c->tclk);
> > > > +	i3c->num_clks =3D ret;
> > >
> > > Need check num_clks > RENESAS_I3C_TCLK_IDX to avoid outbound access
> > > at
> > > i3c->clks[RENESAS_I3C_TCLK_IDX].clk
> >
> > I guess dt binding check validate this as well. Eg: a single clk
> > defined in the DT instead of minimum 2, will give DT warnings.
> >
> > Do you expect additional check in C code as well?
>=20
> Yes, worry about a wrong dtb cause kernel crash. Direct access
> i3c->clks[RENESAS_I3C_TCLK_IDX] without check is risk.  if clock wrong
> i3c->in
> dtb,generally, it just impact function. but this may cause crash. So I su=
ggest add addtional check
> here.

OK, to avoid a crash num_clks > RENESAS_I3C_TCLK_IDX check is sufficient
But it does not check whether tclk in 0th entry or first entry.

>=20
> Or search 'tclk' in array i3c->clks.
> for (i =3D 0; i < i3c->num_clks; i++)
> 	if (!strcmp("tclk", i3c->clks[i]->id))
> 		break;

But this returns correct index of the "tclk"

Cheers,
Biju

