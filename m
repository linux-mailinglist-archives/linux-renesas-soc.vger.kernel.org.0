Return-Path: <linux-renesas-soc+bounces-23800-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE00C16A31
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 20:39:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54B0C40592C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 19:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B2EA34FF51;
	Tue, 28 Oct 2025 19:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="n7vr5mmH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011069.outbound.protection.outlook.com [40.107.74.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE6734F24B;
	Tue, 28 Oct 2025 19:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761680390; cv=fail; b=d7KtiNmy/XRYhUOz+8x1p+Cfy68Yn4jaq+g6VyTuUj/xkQSF6CXB5OoduS+vVdBZE3tBlZurVFSXV0h7Xwq+pR64MRzTbM5QymlpljBUIIjuPFZk0xtOKYSYaNnHlzgHbdwP07F467OEONQidWm7pWopG2a62fa9EJgaa0uSLAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761680390; c=relaxed/simple;
	bh=XXgDoK7vRp7ZlKpriuesy4W+TG8N+jFTAzV1fuAgdPc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=u0k0v0ZyAWLzyGqpNf/trWFyC1FcIPm7OZalsyPqwTs+eeooVsYZVrQXlDwsYsLHid1Q6ZD6xK2rWZw3TzQ5S/RqTEmZinazJ3MVCPEI9tNw32FsTnBSm+Xr73jXXoAogxve+6rPNf5Jm43tEs9gQumbiwpcAXDHAj9pWfyuBBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=n7vr5mmH; arc=fail smtp.client-ip=40.107.74.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yRZAfuFj90VR6S8K1q0ebadS0v+UvQzrZptIJoDJXoYKhGHVO86QG2EUcesHJczTEkSgGrOZTtJIn4UATMCykn5SP79VAcLBnkNkXtd61bDCFwJW9Nlge0aChhrUldWnUYE7w/5U2blh05KEv9kMRk1v5dp/F1vRCyj7PC/JRbnXak8sPrRxY5WYMaceZiWW95RO0PsR8wu/v1S0R3cyAS4xj+HXRMA8ZHJEs7RHpTCFTiezeUHjQlYJQYVbSftWDomGm8Cj4u51imQK1TBZgIIUo9F36PGHJ/8pdhibBs/BUPZ9E5Yb2+UauVMslYGT5jaghKSTUTjDu8AKCOLclA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjM9uU7cTLMeftHNlNaDYUEStu+l8l3rxhDSUlFVh+w=;
 b=a5XngSfdhhXoweZtUrs6mz9qJ54r5K1kgOFLanUdZ8wfJmVPBz62ZTERXvi40dpoqEdgnWJMkF3Fbv4rqLFIhUhNbygZAxjNsiBF/lEA0YpL0rZUB0+AM9DvOI6081dQu747Iev2bpHc6MqD2XlgZagvffPTE6H5UhI88IzUR80UOmtYQXAZe7lgDlc57LT3Gf4+ZLNc8NIiY+wm420vTA9XgvgHbybg5b7XE4qfqg9PwyUOP10G0gAP5uDmk1TpYrZ8sQQnlw1I9rjVeMMjPwbs+eFSP8Qb2iGysQ5yQe7I32bDlkFvXuQ4h2ojYQsw4fbhMb538NABsgfU8UNdNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjM9uU7cTLMeftHNlNaDYUEStu+l8l3rxhDSUlFVh+w=;
 b=n7vr5mmH3Dvzm+Y/RqyJ1z4WX18TmqKkuhoy16qiaYTrCED3f5tY5LJeBnVgcY+Ew2Iu+ZdhcKRwziYL82/igOdGRj23xYifvtGfwEGPxb9XgFGJ1xh+aGbuFeykSOVLIEBL6gkAnYgzhDC88+wOfRH/zQvEHX9cQnCfqSEbAfo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB11904.jpnprd01.prod.outlook.com (2603:1096:400:409::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Tue, 28 Oct
 2025 19:39:41 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.9275.013; Tue, 28 Oct 2025
 19:39:41 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Conor Dooley <conor@kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	biju.das.au <biju.das.au@gmail.com>
Subject: RE: [PATCH 02/19] dt-bindings: serial: rsci: Drop "uart-has-rtscts:
 false"
Thread-Topic: [PATCH 02/19] dt-bindings: serial: rsci: Drop "uart-has-rtscts:
 false"
Thread-Index: AQHcR1jec/+s+O3qwEOlwSimibGIebTX81kAgAABcWA=
Date: Tue, 28 Oct 2025 19:39:41 +0000
Message-ID:
 <TY3PR01MB113460F737A66E71E86482C5286FDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>
 <20251027154615.115759-3-biju.das.jz@bp.renesas.com>
 <20251028-griminess-undocked-b6918de546fc@spud>
In-Reply-To: <20251028-griminess-undocked-b6918de546fc@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB11904:EE_
x-ms-office365-filtering-correlation-id: 9338f9db-7e2f-4c7e-0086-08de1659bd25
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ymzYfDB1ikm17wIJYOZ5tSbyqvJVbVCdavUqkgY8eQA4oODI/aiet1MS3Qmy?=
 =?us-ascii?Q?Ym2b4Vn1ICmvufYqnr/9b5ybFbliB+TnbeBL17rOZrZaBQ83f7MFMyEYg5r6?=
 =?us-ascii?Q?HPhy0CT1kwOOua0sW2ye5hDvpz4n0FY45DqXCaoxmTVo+VXzl45ZfcDIz9ji?=
 =?us-ascii?Q?ptagrElIMcCPov4AK/s5qq3lxJvSDACt43Z56H/MKlnrJ+kB+YXzT8aCPGgz?=
 =?us-ascii?Q?bmhv7jSW3i2Q8fPrN8FkRo4i3uqS9iU4YVSKTvVWsKFXj0U12d3QhQaXo2GL?=
 =?us-ascii?Q?+RxDxElj0wryM80xyW23X4FhKbHyLWjMNhAdq7L5vKfi3iKkqcymc/eImhvm?=
 =?us-ascii?Q?QpLA1OpexogChRooIX579s5VtgNbv5Gn7MvBOwaAFNpQB6xy5Q7zq4DKDGr9?=
 =?us-ascii?Q?xBBCSCCf2RY9VgJin6949pxkjmlNWnWWWF+yW33VA8QmTXSGiZkh9oiZBWeu?=
 =?us-ascii?Q?zzLIgKmQp+oqnMGuUkxDADT4YsGtWPqeZXaJ+kgd8P0bu55Vs1RgKlcGgJwx?=
 =?us-ascii?Q?YuwfjLwXXW29gwT3NyRtBaoD8d5bchic7fPGFyA+9+YR5mS1pwsCAvBVireN?=
 =?us-ascii?Q?DgyWb4te62YydyO0bISaZw283nOxrP/Z56P4mQ9oEWi+KZkCAfXi1g1VyadV?=
 =?us-ascii?Q?tez2YEk73ByspIJmn8gMTr5no4i329VyxgYrzu8QR0JSZ7TdYJhtHe0DqpXy?=
 =?us-ascii?Q?aONHgGVKqGUxxI8Yn2awkssI1/dYQLvbcDvZKo7gMnc+1ST/CmynAzUWh0Vw?=
 =?us-ascii?Q?CuMMG3zj4W0JdjPS/nu7pK2euPQYrhwnZsW5AceUmao+iPBcBRjWUETbMMYy?=
 =?us-ascii?Q?/q/OumFSyVd0cSa17W1lSlf8fEDHZZoT2tyCppXOStbODkgeHgI5rXArnbOz?=
 =?us-ascii?Q?ydVdo/tPohBOFRbxU8WZrcLSkPjT7yXia61OaDJ4+tG0RTQA1x9izr0Yqs/9?=
 =?us-ascii?Q?+AyZFzLl63r/d+zILYbVAEIO12vGaNI5NIyLJSjxifnV8BQJGMXSVtOn33LK?=
 =?us-ascii?Q?Zk/JP4jhe3RaFe7fNXj6mNWDSZpVYoGRuIJplBi6GSeNfFI57VqF0bDi6YG6?=
 =?us-ascii?Q?9kkibgUIfSogt/EylmmY3qN0l0PVjlZrzn9Ia3a2g2wz2M7Ye8pRVBrJqD/8?=
 =?us-ascii?Q?zPUPC/84s50SIFk3TLhUmpweauLAXnIcihsuCkdgChx7MRbPRDF02SR4v2ze?=
 =?us-ascii?Q?CpNFbIdTiGnNixbHj0/WJ3TCYUDK2fs4e42rUHf0gZ4I/Rcx/x3vt/YO0VYu?=
 =?us-ascii?Q?B8hMBYqTTsOSxN79DbbE9zH2UBFTzoDV52dC/9tnJR4mjv9Ht/R9Q1RNq/Yo?=
 =?us-ascii?Q?KGf1hd9mtkLof10Qj5gIrCi75sTtuJKWNYNpMLz3rmBxktLhAd4QkkmPuY8x?=
 =?us-ascii?Q?KWIkzs7TGvSjkl6r255lB4AvXK5tu8a1JLXzB5PR3poRMP89/gsPzpPOcC9/?=
 =?us-ascii?Q?5aBzqIKem+g7cuPerAuxAw1YDywqU0Eydxsc8SYqPOT53kPg/9yFSPS4iO/R?=
 =?us-ascii?Q?U4Rtb6e7amy/ttLXa7WtT+51e6mru9n9FkZ3?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?XB3aw2fh6X6T650/wd/JhWKYT3tyqdJk+oyfamEkzlFoaOjA1VqZQ3hJrsP/?=
 =?us-ascii?Q?v3tR1o/N4uEML4+YOJzb3T73xzBZtwoi15bHk1qJYcGdj4dB9gCk3h10X8Pt?=
 =?us-ascii?Q?UchPZX8/TK+maJtOJLFjeUObxafmlJK2dXcRFUASnqGTp36ZfzkItxcpTNST?=
 =?us-ascii?Q?Rt8Nhd2XQI2wqBk1iQSnIYKG6KsWOGR/jyNCK34m5rtRIG+eGOMg1klLDdmQ?=
 =?us-ascii?Q?U8K21X7Ioq5F8Q+1inRsd86RigUjDTdDc5S/v5468JjAM/P5sCL/I4T6wUWV?=
 =?us-ascii?Q?oQjaQ4dpHblYGBv0Iia3nenysCsbRSDPmv2rr00lu8RpMKMrRaT279I9GSfD?=
 =?us-ascii?Q?4tm3N7a97Df49Qce41zQT2weKGixc+OkZwVglhYuK7k4nr78vSOqJX/vAxC9?=
 =?us-ascii?Q?jOMIa9BYRuS2+ae1L5MsROXeH/e/GTHPcGzQwvgsTiL+/U9TpXIa+UezMg9l?=
 =?us-ascii?Q?GW03HkzrqbZ424Usk4Tu4JW5oEPVcioLxlnZujhb9iL6x4H6mFS2soCKLv0+?=
 =?us-ascii?Q?bnkt6qK9L/PU/WKJfBkdWaGP5YxeQFo0RvUcopGmKDS7BThH387rPIY420pw?=
 =?us-ascii?Q?zijdF4ZcHnvrJv6FyVRLy9Kkax4hULUTp6mILRw+8S65+uTAyeIeBZBg6Jjd?=
 =?us-ascii?Q?bH3QaZyF9ZlXMM36bNi+5N0gEysOatMN4VTIYpWCebQdzyuWtyBV1633gFNx?=
 =?us-ascii?Q?iTAtgDzMjIaXIeo4SAGCAUbJPfCokGejmkYP/uDp/GHUWHW/p58DFQfIw8CG?=
 =?us-ascii?Q?uNQ6esXkb0tzgeh6hcMhCNxVu0RXmSWRsBOcCqRKPk10GZEiwKY9ZDVOclA9?=
 =?us-ascii?Q?pwO8FefIH4+DcFX+qYtYtDZXtjsE8s61Bse05E4yeaJc+heLMe8Q4dnYPciR?=
 =?us-ascii?Q?mZTDQ6p1RKTW2RhsiZX0Gin5IZiOMzcPTrWwlfh9qmYta5c0CNSzOd91w0th?=
 =?us-ascii?Q?9Vv4fzGOgOW8rJCPcXJ+Ki0A2FNq/Cma5OQmmV60i6BorqhF/pPOfl4t5i21?=
 =?us-ascii?Q?+ulh9fUqsMyBmW8ynH54wHT58B86I2dY/6fcBY5uMENDXQbuC+2tRugUh+My?=
 =?us-ascii?Q?TxW8t5CqdkmrrNgJg/eTTbW210rFqzbz4eGqkIJm9f5cM36zTQpcZzLz1WkT?=
 =?us-ascii?Q?kPHZ/Yi+YGcqXbv6pt6Eh2cOEDvtCjiLcnEcQdiH6SRaz4pqKRt1PaHirrBR?=
 =?us-ascii?Q?nW7lX8/lXYjqcp8cXxy0+vTFzIxKOZgFo8gPMq2X/Of3sp5m2oPWUeuXWmeA?=
 =?us-ascii?Q?QjOj5o0YhPIKypeq7IkG5QD8lrwmTT1mHuwo5s2xMzjZ7uYbDzI7a4mqrDne?=
 =?us-ascii?Q?LDSp4t+nr637IqBgOx+AmwXhpSYatA6PZUZd3MBl7oGL86uAb/4xe7oDhKRk?=
 =?us-ascii?Q?vXszuGUKQcr3aVo3BIi0r5l1l3BSl65FtDZR/QtyAavaNRAJf7qnggcx+gG7?=
 =?us-ascii?Q?3RjRu4fcnCjthYmO2CzQ9Cj54qWYYRV4owBCExHdNsv2v1Q3XqmalrUvmDZr?=
 =?us-ascii?Q?5JY1MES+OPNyzKFZ9cg3o/nk0fPgmbDo9ZKqxrjzhF0vZGwGvMTlzLZ5q8ts?=
 =?us-ascii?Q?8rST7bSWUeH8PsiLXVNocWZZw9vdEKU3ASCUQ8PkE2ZCgksWe1RMOMnSnykY?=
 =?us-ascii?Q?Yw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9338f9db-7e2f-4c7e-0086-08de1659bd25
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 19:39:41.4127
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4fLBRPHf1JZ/dj42MBDteb6HSHukgkRearitCaNhH0MIUax5N6xVFhJG08JBC10XluyN4tzzE/c3QBdyKyleqhzDOcPXiIEEi0myZ1zaVFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11904

Hi Conor Dooley,

> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: 28 October 2025 19:28
> Subject: Re: [PATCH 02/19] dt-bindings: serial: rsci: Drop "uart-has-rtsc=
ts: false"
>=20
> On Mon, Oct 27, 2025 at 03:45:49PM +0000, Biju Das wrote:
> > Drop "uart-has-rtscts: false" from binding as the IP support hardware
> > flow control.
>=20
> Why is it being removed, rather than only being required for the existing=
 devices? It's not clear to
> me that the comment about the IP supporting flow control excludes the int=
egration on these particular
> devices from somehow having flow control disabled.

It was a mistake previously as the driver does not implement hardware flow =
control and
is excluded in device tree.

Actually, the RSCI IP on all SoCs supports hardware flow control.
If a channel need flow control it can make use of the property uart-has-rts=
cts;
That is the reason for removing hardware flow control disabled property("ua=
rt-has-rtscts: false")


Cheers,
Biju



>=20
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  Documentation/devicetree/bindings/serial/renesas,rsci.yaml | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> > b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> > index f50d8e02f476..6b1f827a335b 100644
> > --- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> > +++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> > @@ -54,8 +54,6 @@ properties:
> >    power-domains:
> >      maxItems: 1
> >
> > -  uart-has-rtscts: false
> > -
> >  required:
> >    - compatible
> >    - reg
> > --
> > 2.43.0
> >

