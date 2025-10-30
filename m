Return-Path: <linux-renesas-soc+bounces-23937-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F184C21AC8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 19:07:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 16C544F5816
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 18:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D0B836CA7C;
	Thu, 30 Oct 2025 17:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="kjAGFyz3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011041.outbound.protection.outlook.com [52.101.125.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA941F4CB7;
	Thu, 30 Oct 2025 17:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761847167; cv=fail; b=cPUUDSwDG1i30qitL3F4nWTVoS2WI3xw2VTC6RIKcdmKXxD3SoUUQ3JQKMzlhuZApupfvmR7s0DDRudxKy/r4nWs7EiFU5Tp+3jd+fixEDZXSS6bz18LVXjyN+ry1FVliOvP5ylJWtmIMGoH6YtXTz78bpS0MXbzCaHv6Q1Iwxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761847167; c=relaxed/simple;
	bh=Upu7Mtl1aaSKJaqp7eDZL7Gow8v+WkKABJR/zUIPDVA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uXFfgZvRLabZeYhFc7PS6TsC9taGv8HcggVW1na6smesFUsTlqo+wDRHQMl+7LWyJ3JZ35TzFPt1HBOf0Uc7jNvpuWnx5mZz0wWDle/ITxAFmi331Pk4SE8RhQ5JfFg3+mkOzqzePkPzlxP90BghsOuow0w8T0WTL5UDMje0jXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=kjAGFyz3; arc=fail smtp.client-ip=52.101.125.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l7oFFN0nSImUEfQIf1o8XfJyzcOz1+TvYX6r73ZzM/l/hFSKXJKc+4JeEBriaNoKm3LN1Z1SL9JWhTwY+qomGOsX3kpwYSipwdKgOYs8kdWKS6IRXwsd0yvSI5CXx6NkSHhWDCRq8LXpfIJnTwz51QSgPHZCzOLop83P2g75dKxFgFvRwGLwjT1ubzbE2Od3UQo7kI/XSMWHzDKd0doHJWL8Xb5woz/zBarwbA1CSl3NsPtVD+8RqUQ+NxtDCwe0ZocduC1TYJz8JWLWTfSXAnC1H8vyfVPQ3uQD9MZWLUqB4ntLmo1J/oCGBLAq1D9IZaFUQTGi4g7Wu18DBP/EaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXiaBwuhvEEB8ms/ndZqz1k4MWTO51mPWYmRu4B6lUU=;
 b=IS7nMlNkJQTGcZ7a3yKka3IwSACiqH2sAw5gJRK+WLHZVCK1qqgLoWKcYx3Cl2kGQIAdT1nJYQ8LNdxtKlbsJ0xZZBtSMPJOQ9FsD5bUY4HF0GnWLRgcmpZZkfIZigDJQ9iBIFMf5SY1e4dpogxrBEfkXLB5W35Wqnz3MY/Ww7bb2Mypo8cj7F9TgZt+x18/4HDwhCZdW7v0rFxzGexa8a0oLA+z4sJwhGyGksDeaaIn5Rixq6WCyVnIUPBnTd1wPe7cpNb2ncSyPqVAOfgieq7AYPJp7LA6POl2V9mmPgYujaPfjLkkd0Tfr2++R/uoBAPozgkRnvlLzGoySFDc6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXiaBwuhvEEB8ms/ndZqz1k4MWTO51mPWYmRu4B6lUU=;
 b=kjAGFyz3KILouEPYaY9cZT/YNGrsIPRRckZHCIPwGblQW7djpFgVkH5xBgJaqjNCMdJHTurwLrzRVuP0ysPP9FFL+6HwtGox9FfUsJ+td5BtZHtHOcMrOMc+dwUY4P1GjhlApnZYw0DsA+giuz5sdMuzjH5yJTvW14iSTxoq7ts=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY7PR01MB17179.jpnprd01.prod.outlook.com (2603:1096:405:32b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 17:59:21 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 17:59:21 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>
CC: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	biju.das.au <biju.das.au@gmail.com>
Subject: RE: [PATCH v2 00/13] Add RZ/G3E RSCI support
Thread-Topic: [PATCH v2 00/13] Add RZ/G3E RSCI support
Thread-Index: AQHcScZktj/UsVDsEk2RDStbuwrpwLTa+gig
Date: Thu, 30 Oct 2025 17:59:21 +0000
Message-ID:
 <TY3PR01MB11346756ED260C02BAF75B97286FBA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251030175526.607006-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251030175526.607006-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY7PR01MB17179:EE_
x-ms-office365-filtering-correlation-id: 10918148-d0a3-433b-47b0-08de17de0da8
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Xyd8Fu6atRq/8QFHKnQGGzZJuccurYQe+UXqA5a7z8Z9pbL8YoTUlp/OXgre?=
 =?us-ascii?Q?c0pK/ADNb9vGeeutPpHZKlw5+D9bbYMWJ46sJEbXnCoT04Spl1oo6lcy/gsT?=
 =?us-ascii?Q?cX0y8TOR0Q3Q9M7FQAvVQm892V9sdNLLMyrbrt7490JLH+VyYq7BKBFzuuhl?=
 =?us-ascii?Q?9rBjSdq4Wa2rTXFJ0zgaNWwLKC9gJwVX0kTAlLQHsr3NXm9LCNp1wW/fKtmq?=
 =?us-ascii?Q?4GimA3qPOd8v7MK+62w3DcF1KtDShMduOLXQRMxYGzvbZ6P4I6pr+CJ613Xd?=
 =?us-ascii?Q?+GA+vCHX3lTNILi+1AL48/S/IEyTVDJfZrVE0m5ZUPnswaAW5Dc6nsuIMvq/?=
 =?us-ascii?Q?9gA7I2y+357WSGWCwD1bDdZsisP2gfYCgyBak16ScaTphpjnGRa7wQuNJJPN?=
 =?us-ascii?Q?9/Sy9DGomiEg6KB7S5dwZA6Sk32nCpkvZ4VZJHVjKJWaiJ62K/XQ4evQbf24?=
 =?us-ascii?Q?mhpYjucQMZVxwt16ck9qsxV1FFOJ95fENdvkMpKvs1Sd/k5Ng5kH7Nyqq50E?=
 =?us-ascii?Q?L7/KoNe6uy6r1qx9xSCAVwOpoDbNO8nwPGwieTM5mNFB9N8uBU9kpQDZVZrk?=
 =?us-ascii?Q?HV7fwWXEy32flqFKM34HGYRSDPAbr8BBBKYDaPwU98R09yN7d0Xesju1miVN?=
 =?us-ascii?Q?nkk//mV5HHJiZROklI9U+HieEBqyyQtUBb4rBeoXL/xQexJgX42HTHbzHUCe?=
 =?us-ascii?Q?kO99fkEa07w0R/59xMA8i79hiaRUzF5x3Uaz7sPT3E81UoO/nevoYiTmiz/5?=
 =?us-ascii?Q?VPnlFBih5xFMdUlId0HsBBPN2lP7tYCBzB79H7hLXCR6enTKSjt3aG4n9iT2?=
 =?us-ascii?Q?F74Z5x5MmYou8+0M0rcBbVRfM1OiyZjH1dGl8gtL2TJcrHMwsS1z8thZyG1c?=
 =?us-ascii?Q?iMErFwtJzlAOywc1YNjtzIEyyMyISn+K2Ut0kCezu+zTtau4XfJ7KgaFvX+v?=
 =?us-ascii?Q?AO/llSqMTMzaSP36XA90HWghqObfWbO0yj0laK5NL8kWz5FNhRGto5+1zygn?=
 =?us-ascii?Q?cwH80Avp3hbb05WRWXSPyO65v9irj1K9/de9XC6iTenlFmojrW5eFZoZ1dJ5?=
 =?us-ascii?Q?oTHuj+j25KyXm43uVI3VbsFZ4UzBAOJ/hxZA+mbgqLYBwRIwY4cv9kpQALRC?=
 =?us-ascii?Q?QyuiL/cUEy7yWaX+lPu1BBeh7Z1azN72YJ/BGbom7ohHHq6ZjElEUHVSJUVl?=
 =?us-ascii?Q?NBnoCdxjxdy7HqWfRNon47T/7VkHQuA2/vi7Sxq59foSj41p0xkuIjboAc/c?=
 =?us-ascii?Q?6iR/GAw1hnJ6UiWS70t5QMs8M5C3coUl8O3BFsMwkz87zp0RwMTmhcXOcTSt?=
 =?us-ascii?Q?UOHQ21XlAsnkRsKo55AtzayRw6xWk9nzOMLCgGFCAOoBJyKH4boKNF6RE5VV?=
 =?us-ascii?Q?e1DxsklITpmQsMDYAGjrYGRkG/z+PlFidxx+3owdcPWFi6kHuybl7zk5aiXw?=
 =?us-ascii?Q?APyOn0lYogV8ypsRwtHVT89306iG8SeqXZg86CZeh0zzxCIYn3PuF9ZyiWjb?=
 =?us-ascii?Q?k1MnSu/96o+49PQngx4oqIfR43+5QuQB+6/G?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?uNIDCVK+Ukg3E4zzAGmwgDuJM4PYd9Zikvq0Kj3rUGN9TWQ5bLlwlgnM3iwj?=
 =?us-ascii?Q?HQaovCYR49rrNsgOdhXZkWfW1Q4qnJgi09Ix7YaSgOr9moGM26YbBcGIxX85?=
 =?us-ascii?Q?3U7kFuaK1zaQttJrqBoHy4YYZ7wOKXeZvI3fqwGxVNMvNUWs615C4X2JUhkJ?=
 =?us-ascii?Q?WgchUfVPObvytA11HClHzleDKkTi7U2qpGgA+jBtrCKJNQVBik3aGJsoZTe1?=
 =?us-ascii?Q?7CKkFAR8q2kJCnLLA4otdkmLGzp+VcgCM6Eihf64sICoqPSNUtTf7WPHd7bZ?=
 =?us-ascii?Q?hUp2/Gv2efbYfXqNNGbG6sPhaeomf/GN6L83vUKcM6qWjCJESxUCqIEk1Qs9?=
 =?us-ascii?Q?vVT/mw4Shjrr/nvCIyPyKzeKSBNQv8+kqd/Bf39g5XOQGm04esC/FDpPgTtJ?=
 =?us-ascii?Q?xCzGZB8ZoX8aVdz36UCbi6y3rRuMNa2bc7Kffn+1EXXN/gOdwrhXiAgAV8Vm?=
 =?us-ascii?Q?a2BCpV5psrcWSPv+2V9Zzce/2ki6A4xIv5DbgZEoWkQ3B1XZ46a2r4HvsbKL?=
 =?us-ascii?Q?paOfW7U1lxHMmJrlsj2+35MPSB+9FNLHSipRhfP4B84s26xdks/tvXv8Rzop?=
 =?us-ascii?Q?sQ9WLfdmugSm8ExN7FN6kq10Ph0hHOTSorFh4gEXLMOD40MWg7ArPpEdXQ3X?=
 =?us-ascii?Q?v3Dsrc1aiczF5tqFl+sE0/xKWcLIeLHVpRjxE9MntqCXuBouzW6k1ri/YJ6q?=
 =?us-ascii?Q?lwHSC+2B23J/Kp2jSPb0ef3eYvBNcDCB56IrqV7AEOqNC/OLi1MEo68Sem6u?=
 =?us-ascii?Q?OFaylweXAhu6n4EsmWrpdxn1LjtBBUa4cJERuBpfqsTFyDqvhEau5rkXtvAW?=
 =?us-ascii?Q?ZF653vsGkN0/P6iljnp9fzwKVL/im78qddqpLWcvNM5kFgfp17sl/P1mB/Ym?=
 =?us-ascii?Q?LBSKpcSkY4GidQfzNmpGiGg2aS82aK54Nb0l3P+SQSa/7J3KbcxxH1E/9IzI?=
 =?us-ascii?Q?NxxHpENj8IV4fC8mCsnzP+tMBJYMSurIj/uoPK9xEsCPDqerAszB50gTe1nN?=
 =?us-ascii?Q?Y5zAFyQuftDYUANePUsEZjGQjn5RI3VtjfiO6EZGrAPkGadz/6UkKTUG1kpH?=
 =?us-ascii?Q?jOGKEC+yGtCOkKitZHWhb7P+7vmaOfc/QBiYyADy/b1uwSQ+33QRgyKcgPgk?=
 =?us-ascii?Q?dLQSPXPKx8ng89HAIzL8a4DlzpC9fQJ0+xxviT23raiIKGxoORMSphL4wjhQ?=
 =?us-ascii?Q?V1PrTScfUZUHkfKj+NN0wr9b1p5Ru54zg4nTGc9thO8NhgCF7wPT31+pmisW?=
 =?us-ascii?Q?w+nFl846fvO0xqr/E8mRDsHqY26HJjABLun08USW0o20iyjRg2jJxNxiCcwk?=
 =?us-ascii?Q?m7yzMwK29dO1E8fVfDTA1I1ZV62MZ5vGAx4nZqUXqDSlR1dc/RkbkyU8jwY4?=
 =?us-ascii?Q?4iQwBBiZweABG+NBzj5K/eroHw+tVkpgnmwFDykqhWNsBFUrrYg5MVye6W4a?=
 =?us-ascii?Q?wSUaltlWCbksXYHUX2j7WQpolTL5eBnY1ErZ0hUlNTt2Daos7rMTnTN17UCg?=
 =?us-ascii?Q?iB7UIuIUz24VUVmw3RXJSuIOV4QfeaPtY0ylAur+mqwTTdC1Na3eT2S3EfAK?=
 =?us-ascii?Q?QID2Dc3RMebhcoajYJDhCbYgFJCc6ovPae3dfaklLM3Ep91MSbH27eNphOR2?=
 =?us-ascii?Q?cw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 10918148-d0a3-433b-47b0-08de17de0da8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 17:59:21.1975
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JHF8LEOXisKokVvLEGKfu7aQ+ek5LAPl9f37PjByEWKJ55dtevixdMiDpcDtcop42Iy3WYqB2jcHWFYnwWwawF9GP+NKyWfXtvTC+PSc0dM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB17179

Hi All,

There is some issue with last patch in the series. So, resending again.
Sorry for the noise.

Cheers,
Biju

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 30 October 2025 17:55
> Subject: [PATCH v2 00/13] Add RZ/G3E RSCI support
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Add RZ/G3E RSCI support for FIFO and non-FIFO mode. RSCI IP found on RZ/G=
3E SoC is similar to one on
> RZ/T2H, but has 32-stage fifo. RZ/G3E has
> 6 clocks (5 module clocks + 1 external clock) compared to 3 clocks
> (2 module clocks + 1 external clock) on RZ/T2H, and it has multiple reset=
s. Add support for the
> hardware flow control.
>=20
> This patch series depend upon [1]
> [1] https://lore.kernel.org/all/20251029082101.92156-1-biju.das.jz@bp.ren=
esas.com/
>=20
> v1->v2:
>  * Updated commit message for patch#1,#3,#9
>  * Added resets:false for non RZ/G3E SoCs in bindings.
>  * Increased line limit for error messages to 100-column limit for patch#=
3
>  * Updated multiline comment to fit into single line.
>  * Updated set_termios() for getting baud_rate()
>=20
> Biju Das (13):
>   dt-bindings: serial: renesas,rsci: Document RZ/G3E support
>   serial: rsci: Drop rsci_clear_CFC()
>   serial: sh-sci: Drop extra lines
>   serial: rsci: Drop unused macro DCR
>   serial: rsci: Drop unused TDR register
>   serial: sh-sci: Use devm_reset_control_array_get_exclusive()
>   serial: sh-sci: Add RSCI_PORT_{SCI,SCIF} port IDs
>   serial: sh-sci: Add sci_is_rsci_type()
>   serial: sh-sci: Add support for RZ/G3E RSCI clks
>   serial: sh-sci: Make sci_scbrr_calc() public
>   serial: sh-sci: Add finish_console_write() callback
>   serial: sh-sci: Add support for RZ/G3E RSCI SCIF
>   serial: sh-sci: Add support for RZ/G3E RSCI SCI
>=20
>  .../bindings/serial/renesas,rsci.yaml         |  85 +++-
>  drivers/tty/serial/rsci.c                     | 412 +++++++++++++++---
>  drivers/tty/serial/rsci.h                     |   2 +
>  drivers/tty/serial/sh-sci-common.h            |   9 +
>  drivers/tty/serial/sh-sci.c                   |  67 ++-
>  5 files changed, 492 insertions(+), 83 deletions(-)
>=20
> --
> 2.43.0


