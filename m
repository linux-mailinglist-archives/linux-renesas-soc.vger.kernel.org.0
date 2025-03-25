Return-Path: <linux-renesas-soc+bounces-14793-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE157A6EE30
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Mar 2025 11:49:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 411FE7A50B6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Mar 2025 10:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8511EFF87;
	Tue, 25 Mar 2025 10:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="MhRy0drw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011004.outbound.protection.outlook.com [40.107.74.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C433F149E13;
	Tue, 25 Mar 2025 10:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742899780; cv=fail; b=CxheBzPR7qAIqnlbaUkeT0ttmhNlrPe0hRFh8y08WWnZBdFSJkbuHv9KgHRY9xACB7/uv8+cvdCogC3AkdxBUQt0nXhjDEwJgRURZRFY6ixsAjtl3J3P3RLY930DFbiHQUcWe8P8KlxWb6oHg67ozBsJF6zTx8Owk0nKaHGsL1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742899780; c=relaxed/simple;
	bh=5xF2dz6kMPGT1ojP45bwiMIvBdfxH4ghYjULYZxWQPY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=njCCWllcugtpcGVNgDdqODlS6Sgt3DZL/vpCWGNtJe/NdUm4kFKEWxZ5aLItH0H7qBRTvFz9El3n5xVr+SZE5eI6uGRATSEx4hgH+tqh0wgDu+LXaPMJY7u36Xs0KbruvNEO0BPSxTeq/pBxov+txLpyIbPfyWgsLypTrYv3y3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=MhRy0drw; arc=fail smtp.client-ip=40.107.74.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zoi2M0r2xRS+lLCwtmSxZCYoFJ8XlHl+hNxj7HAuBzidpJQN8xGpv0MJRMxqkCjY6Sxo93ZLj0a8mzLkXg6GP/9vQY9556IjKwxUIVmGWm1afT4pY8mclAJgV/fKAzQh1FWURQXH3DIPxhGEoq5+5fakb4Kj3DXbhHSmLSwB/pUoD0Z4u00oS5Ko6tq0e2TS63n5izEoJDbjIfisBnfC/m0Q83Cy/s4+wMFUjbXOiRz1LSbQRPUkoAtmKnDSt/c1vVuXbdNbh+qKJLuKHxmYpy5nSH6QkH+08599VqcbFk7RgFPPb11oErNAvmujwGJOMvAx5RjiwTW4tV5qR0xU5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5xF2dz6kMPGT1ojP45bwiMIvBdfxH4ghYjULYZxWQPY=;
 b=g+k4wf1aamd/VMuNYpkD9EuSHTdc0rEu+AqmaqzdJodpb4e9cM3K/S3Gtz8K9Hp0mpoj9syGl6JEecnVJ19Wwguumwu76LjhC5y98Tm5gwXE+57b0x9tVenA8BnNFo/CHT5CgDyR+U1V6C8zoyHSlYedkMkPCx+jZ/TXITATsZ6VSnrEEy+6LBRgF/N3oIir8LBZOUWfc7PaeUk2CRpU4NnnKMZCWsiOkAfP0FO5zXHXs8Mnayc0R/u1e/rIkDA7yJpA1t+SmiVuYtHYXmdljtI84JGWl9YvjS5LvRqtWyuD56jijwplMqri753EU9/t1rq7HUyW/wTMPlAKl7WICA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xF2dz6kMPGT1ojP45bwiMIvBdfxH4ghYjULYZxWQPY=;
 b=MhRy0drwEKuo5Cc33UIs8ROLUN/YKvAqF3JgrG/8/X51ZESR181qgXjmi2qXuRtLmczcDDufU9sVpBdRDNR0nGMgiFpgbDtRB26sZkkJM2i6lSbfliW+GT9Yq4wGcdIfpLKpvTCcdXaPSVpgrWuDQ1IVJls0xuP70y3c1E1adfI=
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com (2603:1096:400:37e::7)
 by TYRPR01MB12937.jpnprd01.prod.outlook.com (2603:1096:405:1b7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 10:49:34 +0000
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce]) by TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce%3]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 10:49:34 +0000
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Biju Das
	<biju.das.jz@bp.renesas.com>
CC: "thierry.bultel@linatsea.fr" <thierry.bultel@linatsea.fr>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"geert@linux-m68k.org" <geert@linux-m68k.org>, Paul Barker
	<paul.barker.ct@bp.renesas.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
	<linux-serial@vger.kernel.org>
Subject: RE: [PATCH v4 10/13] serial: sh-sci: Add support for RZ/T2H SCI
Thread-Topic: [PATCH v4 10/13] serial: sh-sci: Add support for RZ/T2H SCI
Thread-Index:
 AQHbjqwtIlj0xPSkpkSXsbf2tXVwdbOCJQYAgAAJ6tCAAMLrgIAAj2OAgAAWywCAAC8GYA==
Date: Tue, 25 Mar 2025 10:49:33 +0000
Message-ID:
 <TYCPR01MB11492F2D6D73B2EC18E46D6B98AA72@TYCPR01MB11492.jpnprd01.prod.outlook.com>
References: <20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com>
 <20250306152451.2356762-11-thierry.bultel.yh@bp.renesas.com>
 <Z-EpPL3tn54E8KG5@shikoro>
 <TYCPR01MB114922CBDC2911E2F644BDADC8AA42@TYCPR01MB11492.jpnprd01.prod.outlook.com>
 <Z-HVD6w6ivYR6pt5@shikoro>
 <TY3PR01MB1134602E988AD8428422E820086A72@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <Z-Jgdi5_SizHzcO0@shikoro>
In-Reply-To: <Z-Jgdi5_SizHzcO0@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11492:EE_|TYRPR01MB12937:EE_
x-ms-office365-filtering-correlation-id: e3c317b7-3dd7-4c08-d20c-08dd6b8abaca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?UCX9XWxhb8P4SnML5MPktjcJ3si0SCQ7rcku0BD+iviJ3mPjpEhfvqYg23QS?=
 =?us-ascii?Q?+DMVObY/c31NwUrfTQOcQBLI9fokOMblpMQb4EcbQQM9omf3HTyE/5D4Hrwp?=
 =?us-ascii?Q?7ZvJKbD+ZjxaIMAEPR9pHEL+k+tEzWER7vmyAqLCMYdCACnxX+lZLje5yDIy?=
 =?us-ascii?Q?kgmIsdY1BzxYdVszdO43QkNipt4V4jCBIvKnfgGLuTZInQSGVlWppBPrM9x1?=
 =?us-ascii?Q?cm5IxrH+1uqUYcq4m9bZYvSSMCeoAyNsb9nywf5JPfQtzzE3OjCASqPx9wgF?=
 =?us-ascii?Q?B9OLaylwTHJkOcCR9VS9DUvcQnGSU4sqJ17b7/rYLbDHjzpgOAVB7VtkwVhp?=
 =?us-ascii?Q?Jznr0fnBbdb7Ih6LWpUV9tMsy6oT+A5/LzlnhhJECuqqkL0xwffvz1U7F5QR?=
 =?us-ascii?Q?OpnZFPaTvlNVTUhRqHhmCWb8MHZPHFl6aTh4CIy6xOCNsmERvTJEgJ46/5GI?=
 =?us-ascii?Q?NSHiUcgV7jX1EwmCmJ0R0A1nZLtQlVjJOa2GodHdRT9SJoYYzta0VoGbMXyf?=
 =?us-ascii?Q?KdyGiRjKx3jczRGfjb5mdCpxgp2D+agC8CWqCX4G3+3YMAoW85SnLmi0DMzB?=
 =?us-ascii?Q?M2Pe67Tj5aZXvyslbT/161hQ95cHpsFwibCu2yfMKjGG3mxs8QXOmnV/lAph?=
 =?us-ascii?Q?hyV4//GLq7ZXtTkmFAKJEeK4zmpZtkut3hqgoam4kVHOAJ2ix5XoypOaB+B6?=
 =?us-ascii?Q?NJ9IwSGYf3VZogfNdqWmSHQuR+PEAhtP+iXZihIQFkZiig0yCh6UMkQPX+Fv?=
 =?us-ascii?Q?1iiJm7mP4/sjv9098tyJk+/ay706jXUfqoaE+n2++LBfRsaseUe8ZJSdsfyX?=
 =?us-ascii?Q?/FYY67TXiCD0/ALqYlh2ShHesp7VLc0ZU48Z9VGdsib959KCb6uxlKIP1ANU?=
 =?us-ascii?Q?cyA3wlO5swQNWoN3qpRxrTM3TXreuWBhZ0NQbs4Mzx1o+UBMBV138+KLiYBM?=
 =?us-ascii?Q?BaasqdzR6fWqsMMaW6cwZ9f++qO0KWT78YwVYddWQZD8nW3HkSBrw+q9RR+t?=
 =?us-ascii?Q?BS1c3AY9z5oo36fe+U+haBRdqGrsLXhIW3huwkz9fXkFwvhXRLi15ZSS7COO?=
 =?us-ascii?Q?FDCWlVtRbL7Zxo37HseNYAqjpLeMS0ud8cgy6JDpw2KZafdvQh8JC8NAgh7E?=
 =?us-ascii?Q?w930wTHZ/Yc3CvaOZzEbBbvFKbyrApUUB4Vq2ArC/q/gVFYw3RCozOr1qdLi?=
 =?us-ascii?Q?AL2GfNprI0YH/3TiwoAj7yUJNWjyNQi0t9sPI0lhZy+fGIjuaTzdBLk9L2km?=
 =?us-ascii?Q?9nGrVDzYGfJmtw3j8r7JNpev69kDGIWQrIHvKou+JHDTYTOmA4GKqQvNLtsr?=
 =?us-ascii?Q?r7H2aeBXejuPy7imJYHbWD6rmxPO8RDUaM54KJhKxpCXkmkAAwKVBRbSyqzA?=
 =?us-ascii?Q?rQLMD41j9ue//uJ9TyOzjaL6HZTyajDYfp6A5ad0ZAVNF7Hp2XKsd3EzvAHy?=
 =?us-ascii?Q?UNrjN9+yH7BuqsYFkrJJF5xBYDta5hIg?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11492.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?i0r3AUhBNf6u1Jc2GVzK3LSXYZN8a7Acu+VfM6QybWwB3ric6mK1pbRw2TO8?=
 =?us-ascii?Q?Elf2lTmTFEA9jQ33ZKjms6tllAelv2Y9wjyJD9dTgR4wJmqNNBwfdANTNdUv?=
 =?us-ascii?Q?K3JyDnLkdJ2iH01micYwrHyVxiaXEa2mAnzHJPU5IUZDIiCQgHKgqKkQA3Ji?=
 =?us-ascii?Q?gjeL1m2ujQYQ9xsda6EhJ5yseG2rsDjRMdamxwqlnfYMk/wA2DwtvMBnnkT3?=
 =?us-ascii?Q?qTf5KhGAfZfcIAmixuSzhy5PlAHJWDQqn0HQdf2BRZUw9IjXb/nWrs3wC2A2?=
 =?us-ascii?Q?iofWb8bkepDwPcK5KloxFCwEACRw+dwEPSvoSdA7B2LN4xfCY7oghbCtlj9d?=
 =?us-ascii?Q?gg6Q2g2XvlOx2jiBflSTrov3QFwMzVrHnUN3/PKXtf0eGvyuA99k490k/C/q?=
 =?us-ascii?Q?PzTXSEehh7fZ73G+pXQGFxTRIYQctMZCH9fInUTadAOpxmjIpiIa6ZoCwzLQ?=
 =?us-ascii?Q?SSMhRT47t/Pzt6ie9IrCYV5mISsaSjq9qu8hkIRqILYl+7bxENMsSlshfIOa?=
 =?us-ascii?Q?dOw4Ui4S+KrNSZeNNqSUy+TsvAeczRfqUrCnxtEJb1GRTTAjAtZ9/kd0f+6/?=
 =?us-ascii?Q?U07Lk0nTQtTUCwvGADkHhhovssxGPFBOquM1C6c53DhCOy8p9bYMg3W8GW+1?=
 =?us-ascii?Q?dKWkjO1tmkyAMmpw8ja6uvGN+LP/qiy1ff0oT8vwSLovm2ttvzm7VIxmRz0O?=
 =?us-ascii?Q?SaYlopHV+YeyMqodGW3lM/pXdhiboANXBHoORoSCPOHbhsNHnioz81RoaDDn?=
 =?us-ascii?Q?5vzoN5/Pn5BSKDkYxOuyvXh5J0poBp1zyc+Mrzt9VbhHMNStj9G5dg+ITG6a?=
 =?us-ascii?Q?xuelbARU4T5PIKShzZjGNb55DT6DT8NOnkBBKjTstgEK/9xAwOGmk6JB9CGn?=
 =?us-ascii?Q?X9nX6wUM0iFmyiL1X0r+68KpSOVTHtqLLQQzve7iS1I+GOmqiYSKb0nYb7o/?=
 =?us-ascii?Q?iOiKQK9fIH142azydmz6QCd7/npfA+uX2PRxkmGK1H/D/iALqIfsl+I5hs1k?=
 =?us-ascii?Q?68KKjDQYYsuxfux6BK9gUHTsoAyyHcerH9EORVq7J0xUwS8ORr6VIBD4YEUk?=
 =?us-ascii?Q?KGDXGu/uOd0qXpcW3Yr3YwLbhQmOaKa7spA+XNo4WpxNjzU/bIc0s7WtBfsm?=
 =?us-ascii?Q?qmOZ11LV0e6G3ojuvDpIwe2lfu6qv02/pj+3WbMzjpgwjv5UwfQQyWH1KGSi?=
 =?us-ascii?Q?k0lbSbowLjbKJJ9JJSTeuomLCJf4yWhk+h3AxbrfRmuCMqjCkZtyenxVVSKO?=
 =?us-ascii?Q?p2h2w8Occ2CQuCHA9M+AcgvejVPdszhoFVFbNmVl/+1rIXo65kDWhJ4+4y6n?=
 =?us-ascii?Q?Q8Niafe7vlm0qiNba2E8Z9M2eH648+RRYAszhaVCQ4cZ6W6V1P4jo1QfVdDb?=
 =?us-ascii?Q?vC5nzl1Al7BqbbbeEl4x0AAaIBHNnE/6RIrn47DQO0Evzo760KglJpsuS++e?=
 =?us-ascii?Q?uI51OADXbFn0u8lQVIbTN0IDveLXkrBPoLzqK3XowRTPamHty+O6uLTx4sNN?=
 =?us-ascii?Q?hggWS7qRXP0dWBmlqQmTCk2j0d/rnN7DTATdqMDY71/R1OcXtXTeBjNmmnwa?=
 =?us-ascii?Q?pPAtXpfN4dcKw3f2ePUtFQe8P9xZJW9wzeZNSImKfvj25fblTOkXuUzO1Tv8?=
 =?us-ascii?Q?BQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e3c317b7-3dd7-4c08-d20c-08dd6b8abaca
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 10:49:33.9463
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eBsU0JBWhqQW7I8IhbO3Rx72UJEBp4/zV5PsEBJdt5FhN2wBFs5Qbm68cvyarDpbl55OdwZHOyz0izgONrVnu42ezizP7RXToczX75zl1SrHMN95SjhTf3qZSfSKdE8Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12937

Hi Wolfram,

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: mardi 25 mars 2025 08:51
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>;
> thierry.bultel@linatsea.fr; linux-renesas-soc@vger.kernel.org;
> geert@linux-m68k.org; Paul Barker <paul.barker.ct@bp.renesas.com>; linux-
> kernel@vger.kernel.org; linux-serial@vger.kernel.org
> Subject: Re: [PATCH v4 10/13] serial: sh-sci: Add support for RZ/T2H SCI
>=20
>=20
> > > > > > +config SERIAL_RZ_SCI
> > > > >
> > > > > I think this name is too generic. Most RZ-variants so far do not
> > > > > have this SoC. Would 'RZT2H' work or is it too narrow then?
> > > >
> > > > This is too narrow, because for instance the RZ/N2H , which is
> > > > very similar, has the same SCI
> > >
> > > You know the differences better, what could be a suitable name?
> >
> > Please consider RZ/G3E and RZ/V2H SCI as well as it is almost similar
> IP.
>=20
> So, I am thinking to not use a name based on SoC but based on feature lik=
e
> SERIAL_SCI_32BIT or something. But I don't know the HW details enough to
> make the best possible name or maybe this is a bogus idea.

This seems a little bit confusing, and like said in former discussions,
the 32 bits registers are not the main difference.

Here are the known SoCs that have this IP, up to now:

RZ/T2H
RZ/N2H
RZ/G3E
RZ/V2H

So that seems reasonable to keep RZ in the name, even there are other RZ So=
Cs that
do not have it.

The HW documentation does not mention a better name, or revision,
so, the suggestion is to arbitrarily consider it as a new 'T2' type.

Would SERIAL_RZ_SCI_T2 (and rz-sci-t2 for the driver) be specific enough ?

Thanks !
Thierry


