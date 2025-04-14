Return-Path: <linux-renesas-soc+bounces-15889-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EABA8797E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 09:54:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01139188CCF5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 07:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D9F2580ED;
	Mon, 14 Apr 2025 07:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="k5VNohAX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011008.outbound.protection.outlook.com [52.101.125.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2191A5B82;
	Mon, 14 Apr 2025 07:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744617262; cv=fail; b=escSz6IRNa6cl3jS40ppo0PmRUh/cbCHo8i0wFO03ULM4gIbb4H2w0RHT7HCIg8wiHtMkDXi1z8eMEPzDWOjVQCMvWdxIx28PKOrD3qnVioPz/O6yy1s8esbS5+iI9cTM/Bl2EscK2x/N7h2VWixpmny/33s7SYrm//YxKTs8V0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744617262; c=relaxed/simple;
	bh=RfSrifxlkkAZI7UlSFahzLnkcWwsOb9HI7CBg/4ylQw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=btZ5nDyW8UnprZw5/pLL5W+FE6Psl28NHnqN1eNeWiBxSkSMPjG0r/nvAGmGvNluZo1e9/ZiV2I33c9sWejB4Qzjq5JXCyiE4OuVN8E2g/H4ho4EY9den9TzUuY0Z6nCWR4Gxcz4aXR3izlbKz6jM+SZsWNTuR5oPNKaBCV4fz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=k5VNohAX; arc=fail smtp.client-ip=52.101.125.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9NhGuj3Rp9IS2Z+fOvDIJQhy8/LE9KdPahfOkRTf2I3lGOag7wIAxlLXyJA03B/bod15OJaEvIwPpH2yiGSUu3AHwe7jImnPlNNY4OKB5Tc/fxOCzGP+xie3d1bpn+BCG54QMQITLXAH0n9WXHc//bz0z0FsUWkSCO5pMB53HdF0fFcDgovs4xNDe14hkFQpP6GKZpa6H9kBbRzrijmuiRwPekEoquG9bIV7haAiPAwdk08Pv8gh6aez880VNHs1X60zPAbgk4unOZpUnJ4yAI2o4PEjbMNzSbEYajrnenb7koaBVEHa7SAIl96mpTzMZHGHAGT/z0auW9mH4cRNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TsYKQidpNCo4QimC+mQaVbig11pDBMt5yMRoiQXWubU=;
 b=q+QywvY5agosRTs7UUkuBWdRn63z95b/aRvbCZH0/T7sppVi+BjL2T/jgJ+lw1ZARtmD7eJz0ZWpDETkwq1UaSVAIcw7NF35D4HbijkdpVgq2aK5WNMyMtgGuF/keHOQFo3g8ZUlZ/3Ulj0BNeyDDxCdWbGGtjFNRFkvqgbsTfKzEcMsNRzCBTxEIo+qA9JN30RR/A1hef1jtAco9snbeZiBKNRupd71C7RW/ZxAnkXGNf4x4rh5THzTSfOuCCW26PIecsqR9NxXtCN+5oVNA/BE7AVptBK6XOVQmSt8Va7+fDc4zPN6SPB1DXUyl+++pdleq3K3HKwqWH5zhVJcXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TsYKQidpNCo4QimC+mQaVbig11pDBMt5yMRoiQXWubU=;
 b=k5VNohAXonSsgNULHQRuwquYuNTu4sRiu3QpAWIjaZVgdshysAnr/z+/CnDzj1nW/TiSu9Jj0XEIJiQ6xtfcxMAH9vUAq+ezIm+QF6PLSDJi2Sjk8MgajOILZT8DsuxY/Dimud2XO6GXAjYXr+HCsx184jTIjSJM0VZnJv3iNds=
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com (2603:1096:400:37e::7)
 by TYYPR01MB15050.jpnprd01.prod.outlook.com (2603:1096:405:1a1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.36; Mon, 14 Apr
 2025 07:54:12 +0000
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce]) by TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 07:54:12 +0000
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "thierry.bultel@linatsea.fr" <thierry.bultel@linatsea.fr>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"geert@linux-m68k.org" <geert@linux-m68k.org>, Paul Barker
	<paul.barker.ct@bp.renesas.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
	<linux-serial@vger.kernel.org>
Subject: RE: [PATCH v7 10/13] serial: sh-sci: Add support for RZ/T2H SCI
Thread-Topic: [PATCH v7 10/13] serial: sh-sci: Add support for RZ/T2H SCI
Thread-Index: AQHbpN+rulp8VKX3Aku10FSz2hT3LrOemlKAgARAElA=
Date: Mon, 14 Apr 2025 07:54:12 +0000
Message-ID:
 <TYCPR01MB11492DDF2728C9D3B3F14DCA38AB32@TYCPR01MB11492.jpnprd01.prod.outlook.com>
References: <20250403212919.1137670-1-thierry.bultel.yh@bp.renesas.com>
 <20250403212919.1137670-11-thierry.bultel.yh@bp.renesas.com>
 <2025041152-puzzling-clinking-e573@gregkh>
In-Reply-To: <2025041152-puzzling-clinking-e573@gregkh>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11492:EE_|TYYPR01MB15050:EE_
x-ms-office365-filtering-correlation-id: dd5ad4cb-68cb-4e24-fe17-08dd7b298bdc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?OgQtYDx51F8QPJLE9uudm+OUodJ36yL1BzpjZSmC5GRXD8Il7GCdcfbU8rwi?=
 =?us-ascii?Q?xBnLwQu+2doZrZGycVCb+SPeIdtD/ysm5UjSF6JJjwlXE83qeS3a9iudQyCD?=
 =?us-ascii?Q?Yjnx4YyV0l+IKFWmRcjAnGPyxjShL+QmGYzhvUPu3ifpZbNmfveJDbkETewg?=
 =?us-ascii?Q?BTWQbFzAaYXWrax8qYEs2fczUgzW/FYgnM2LhNxjgy3guz5MZbyRGyrPIo3m?=
 =?us-ascii?Q?d4MvcZkko5Jctrnv/FdL1xfuLTxQ4j3nkmNVa0Gj2kzxzGMoMkoMhTikCsWw?=
 =?us-ascii?Q?6cSCV6PhQWf7MsYK9R0GyjOLTayj/8yQYWV3oZfUOx5X4Bd7wf8KE58LgPTm?=
 =?us-ascii?Q?ejmlUYdijT23QBfjJ8dylhQ9Jx/26edtUFq2ehY1vNFcM35gkB+1FojjrXvP?=
 =?us-ascii?Q?0UbjkRYXd4OK6dUWc2S8teTChcVFRieHwOP8/A5iCt9IoSQ8yuUmYQoJpodH?=
 =?us-ascii?Q?UdpDMdnEerA25aqu7aGjGw/m+Y5ibPqhOGF3fPlmth2wEIEA5wZk9QCNIJFO?=
 =?us-ascii?Q?6bNiTr9QxMgMNEwuDCrsAYGGFFPuvMb5oe3GufvAxPrf4uhXAEvu3IqrcW4C?=
 =?us-ascii?Q?qiwhZ0CNjse6O4FkgRXKhKzDrTg8YAORctlny7tNiVT0B8xnMEK7A5mYMrcv?=
 =?us-ascii?Q?SwklywNMeH75Wy1ijjtMl0KHUG2xBnlfrjkHMZHU2IgCfwzzOVoUT/fAwSdn?=
 =?us-ascii?Q?28/cAjUMVi59FBtDrbp7teNYOG3YH9CIeMNojSoG71H+Kzz8TaewPw/0LTIo?=
 =?us-ascii?Q?wyEvZ53BsFBoKOPssVU/EBOQ1hZerIJ6N493G1INzSPfmFYdWX7JdULIEpMM?=
 =?us-ascii?Q?p7fwvwVJNqwEbLHWkA0SNb7fkPd84xYG4SEUzwuAEJk6xKj9RcVy37VRTren?=
 =?us-ascii?Q?lGfkfa+r4YjO7pAhphGq+GDrV1AnCXK8JeTUGu9lRZy+0Z6gFu9n5L2cvLwj?=
 =?us-ascii?Q?Fo4SLHPCGYkFIHAWZT63ePLLkwgRgc0lQTaKXyutBmocNpqRP0xgOHZCYInA?=
 =?us-ascii?Q?g4lEFkMMxY7HXU59yGMFl8qkzIefnLPmJemhE6/yAOq0n+Qfaknoq32u4jwJ?=
 =?us-ascii?Q?IjvRiJoUnfXTf9sFLn4pSc3vDXgAAz8VQPovQ8YhfRamYh6w/Ph2/n/R7d/x?=
 =?us-ascii?Q?HmFTmSJsQayzWaLc10ECfZ6lPzFS8rMngt0D33Vzqkylw57RK1PWG1TdDiDO?=
 =?us-ascii?Q?S0GISqL4XvrJdZ0khI4yQEq5a3kdgDacuB7BnY+06Hzc6vFynt+xKTfGFFEv?=
 =?us-ascii?Q?/Z5pqMekEPeCuLQ5NffpYZICFVXHwDH5zlWfi+4B1hGuwu6CHys9wvRalzhE?=
 =?us-ascii?Q?ANfwSU96mxE18xgRWc8dcUKfYusuULzJlT50381u6y1Xh9pH5vkFXFawWCz6?=
 =?us-ascii?Q?QZz0ROzx+yFiGlYi7rSlgUPW7+vriXBOTdBK2sQCfaeLBQw/krwC9+8WBs3A?=
 =?us-ascii?Q?ccG027wv0MexHwYE9LS2VQDq4shAVZdljlATq6atoAGb1PxYWLSxyg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11492.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?PGTYn4eFJpnb0++E7u6ioCaV1EXbBqhk4AtMb41UWmbHN4lYcNtq0tlyQnmF?=
 =?us-ascii?Q?va8e5PbLsksS+30yf4cr0Nnhsr/EgsM3OQc4MGAL1OziV2RfrxbyEQtQoJRK?=
 =?us-ascii?Q?BNucD689D9Q6UNST/YLNhS0rt3YCIJtS5IGgqSp8U+Ry2RXcoqhDsLvJcCQV?=
 =?us-ascii?Q?KVRgZZsObL3U+/ictK3Ehx8b2KDuGUVuDqvBf9TdM3TA7PKzYQ6MWDfzG1Cf?=
 =?us-ascii?Q?eSE3aaCf+SBYdlUylB69YkMq+hLfD4LgVeYY0VrYNEVqTjMMhBiZKoOEVVZt?=
 =?us-ascii?Q?iigGxv5anuk6fU8C6fFlrIUQ/x3Oem3BfIm03q/X74oAuNqHy+9MqHNZbE4R?=
 =?us-ascii?Q?GaWs/cp/yqE8sgQWjaCxTYYhonHe7yn5vogp8frur21+z9XwyOwUm20XDZON?=
 =?us-ascii?Q?Bu+W2roD8cdc/XVmiB3dHVUrQYRu2HipTN35Z4I2GHDHjpqZ6kMoxwAQgrT9?=
 =?us-ascii?Q?5DEMO0pUsro955aJMqgA9E4S0imV4CrYQywq+zSbHvEkovRhj1FJmg48czYh?=
 =?us-ascii?Q?GAfkFaVNh/4Em0XNtk5I8BSGz8g41b1uJxCv9Hp9eygTiDbNYKszmacc74DH?=
 =?us-ascii?Q?3n421m5FagPEAHGWgApTH2SPijDLnFPq7/MngP8/TXJ2tnoisl7Pqm4G9pCK?=
 =?us-ascii?Q?/ggx1vqNbCsLnL73SytdVv53Q7TmQh3FsxayZ8oPv6RkRZCgrOzhjO2xOdH2?=
 =?us-ascii?Q?HCR42huXEv7T1Ce9Ciz0qa6vogrnf8n/NQ3maVr0jUIJ8buEfhPakcL9Kmlm?=
 =?us-ascii?Q?KejanvzJWN+2Auw5iL0QGHtZp6PqKgFIej8AcPJK4e3JJU61cKBbYZ6QWlhE?=
 =?us-ascii?Q?0iiaa5kxEIqZCqfs8lWWBazRZs0AOocf2q0kywMom8TEsOkQfhhJcjSLtwmB?=
 =?us-ascii?Q?4RSCdCS1r72fllPw4vsB6aKssIk9EDCSgooaUVeRH+gD8Vfl30y84ijJa8gf?=
 =?us-ascii?Q?E/RjHH2H9vF0Z29ZGEN+rx908b12G7jUsgLebgTMoZijsiVvYCGFpTwVANVP?=
 =?us-ascii?Q?hzciT5ftYgebOSZ5nmc7YaQ2EFqPKTYYLrFFFll4JRnrP93Fzi/J00fg14FO?=
 =?us-ascii?Q?wqzXpBo8Skw/eVS49QVwAiGseiKIUIwfsrDwrgnRaOTHLIWmv3qz0M854slU?=
 =?us-ascii?Q?sZrgqWXKmPi3fwZSdqrD6Yn+AJ7PXx7SETbVWQ0xVaZmEA11XMOTqGTjINEY?=
 =?us-ascii?Q?jVZzm5+Q46F9T+oq/uja3h9/pxOkQe7CKZs3uj+o3kZIWGLfwjJZg3/sidtJ?=
 =?us-ascii?Q?v5vGw/soK+q+QNXXeF9zo37HshUfr6GpZ9PjMgaTPFo7YTOp5uMGocr46iyR?=
 =?us-ascii?Q?9yCKYXYvAO2XLr8ddGYQch55ouhHXbCG33uWL5kYnneTrJ7pnGDJYAvThU7u?=
 =?us-ascii?Q?KGg1/l4hZSlRsQgXjOjYYRWZQGtrvRXLRGE/eTwDJnHYeIYbC618XhxMilhn?=
 =?us-ascii?Q?y2JF03vu0MCjO/MSSI+/Hh9GBUjRztSaMxBrdDFe3dcLeZ4FejsGr7RoaNWq?=
 =?us-ascii?Q?0dj4dZ8iMu2ZwVkWGwy88B7H32gnU/2j2dAlUFTCjtaVKAjRIjHnXRsj12jI?=
 =?us-ascii?Q?9gWVwdZ+cqidbYr+RAFvjKqdNeV9wG8MbfsUs9YEP9So5vAhEKlPG00ife0q?=
 =?us-ascii?Q?5w=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11492.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd5ad4cb-68cb-4e24-fe17-08dd7b298bdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 07:54:12.6676
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d0dOC7zacvc4ejEpU2rY9nKdzhh3RTgCLnfpq79LayNCBTtGdxeWpDTgPj2WJ2ZkAwzGWGmfE53lKOFu6Vk09F4ufiEIjpwkZiGftCK6/FvXhFoieIxOBV9IbKkeZJ6S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB15050

Hi Greg,

> -----Original Message-----
> From: Greg KH <gregkh@linuxfoundation.org>
> Sent: vendredi 11 avril 2025 16:57
> To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> Cc: thierry.bultel@linatsea.fr; linux-renesas-soc@vger.kernel.org;
> geert@linux-m68k.org; Paul Barker <paul.barker.ct@bp.renesas.com>; Wolfra=
m
> Sang <wsa+renesas@sang-engineering.com>; linux-kernel@vger.kernel.org;
> linux-serial@vger.kernel.org
> Subject: Re: [PATCH v7 10/13] serial: sh-sci: Add support for RZ/T2H SCI
>=20
> On Thu, Apr 03, 2025 at 11:29:12PM +0200, Thierry Bultel wrote:
> > --- a/include/uapi/linux/serial_core.h
> > +++ b/include/uapi/linux/serial_core.h
> > @@ -231,6 +231,9 @@
> >  /* Sunplus UART */
> >  #define PORT_SUNPLUS	123
> >
> > +/* SH-SCI */
> > +#define PORT_RSCI	124
>=20
> Why do you need to tell userspace about this specific port?  Is that a
> hard requirement that your userspace tools require?  If not, please don't
> export this here.

This point has been discussed with Geert and Wolfram.
We cannot use PORT_GENERIC for this IP, and adding the new type
is just keeping consistent with the sh-sci driver.

Thanks
Thierry

>=20
> thanks,
>=20
> greg k-h

