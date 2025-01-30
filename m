Return-Path: <linux-renesas-soc+bounces-12752-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6EEA22EAF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 15:06:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0C443A1191
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 14:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A7951E2853;
	Thu, 30 Jan 2025 14:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Co9os89S"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010068.outbound.protection.outlook.com [52.101.229.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF7C1E7C2E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jan 2025 14:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738245979; cv=fail; b=GbN+Vz5WozXGeiWs45C9HZB6P//H/F/3o94Zvh3RyasuRTm7eZCnTPqR9Gu/Vvz5CKsn9RNC84kmS9iYktd7nYEd3y8x+c5+rFPE+NkKyUeFAHlMqsfeGEolsQ/SFLXRsFfnYuVcfreOoTQnMEZyqz4fCOYdekwTQQB1UcSz5Ww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738245979; c=relaxed/simple;
	bh=lRDO5mg3J/DPO+d/rAXjdkSYEvwkma9GaxVQsUIS6ok=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rfkGwuHX/9KV7j3hbPdHzAwA/hHuJCP2LaHoy616UpN+vu04ume8YdwLZ3mKEHhTYmmZsGwaR/a513W4OuOWga6/UCyRN2FjKPggIrnr/+3YqSr/64M4lAW1t2YqiNY/mmE9DO2xNTtWJvjt60PeV7BhIYS1m72iwjLoIiUyy2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Co9os89S; arc=fail smtp.client-ip=52.101.229.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZTGv80GRCeYdpFE695IlyNMmmJCXyz3hntOMaKQkAGV6u9ExLR6znORA0Woop6iMTgtXDzGts7wEJ2AVbC+aLjdqIosr2/beVgDfZEF+Wqy+zHGNQ5UDOLA51RNZKLUBgr2jCHl904G3+Vyf5V7Pgk0iTLIXy8+e8hC8EbfenkuUOjllWjbXUbCP7zGH6Jo2X7X8vB9b/NhYVS9gWA76ft/vf46c5is3Zo93vuhNm28/fKGqKqenaUu5cL9Ahbk9RplRTQfGyarv+FagMErle5r+EmIJUXu10KSVVYHJQ76O4aJNvUARDPKBby+YHOTmwWaiXnk7kDjcaoW/i6UOKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=epyur/Nylq1huyIkrDWSeY/3HBHrC+GWw2A7Lt0V7x0=;
 b=vSwlC7kVDtYbX4jFofvZz5Xyzz6LWdoLFSKscvD6Ua+Oq0BQsyJH6h4N5IvhdHkEEwZEAjxx/+MZ9nv8OGvoGw1e6xIwEQJR//CEU+4MBLBCMPNBQvj8tsCv6moMCFq8psJ008vguoSTf4QgHAwSGeCG+b+xweIRM6yg5TQsgOVOcZ25ywhOo7vNof0hisslAPYVloI7HsGYUdBB0CxnnzdbvBk4evEa6UGPYacGZsJ4WMnYQTEsKllimbyDwI5yg9vpasSYIBVyqj8zr9NzXJyC71ERQ9x3eSYPKAE21gOBAblaAYIa9R8zF1Dl4dfcLvQ8tKfGl4VQ1SVqZv9piA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=epyur/Nylq1huyIkrDWSeY/3HBHrC+GWw2A7Lt0V7x0=;
 b=Co9os89SkZgzOIHrzRX45cGZxZC/5I5vHHgB1n9dcnSpp7sghaqDAgDIIEWKlCTBEMhmO0PKmg8nxGg1ynZmdsjzb6V75FRTWo5WvIf5KyWINmhObYqhY27WaqnbMEuvZQVFXdhKh1Oc6SukyTWEwPkGBOklE0IGQ1wCMeH0tXQ=
Received: from OSAPR01MB2772.jpnprd01.prod.outlook.com (2603:1096:604:4::9) by
 TYYPR01MB13287.jpnprd01.prod.outlook.com (2603:1096:405:162::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Thu, 30 Jan
 2025 14:06:12 +0000
Received: from OSAPR01MB2772.jpnprd01.prod.outlook.com
 ([fe80::7280:12fa:872f:e753]) by OSAPR01MB2772.jpnprd01.prod.outlook.com
 ([fe80::7280:12fa:872f:e753%5]) with mapi id 15.20.8398.017; Thu, 30 Jan 2025
 14:06:12 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, kernel test robot
	<lkp@intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: RE: [geert-renesas-devel:renesas-drivers-for-v6.15 4/6]
 drivers/soc/renesas/r9a09g047-sys.c:51:13: error: implicit declaration of
 function 'FIELD_GET'
Thread-Topic: [geert-renesas-devel:renesas-drivers-for-v6.15 4/6]
 drivers/soc/renesas/r9a09g047-sys.c:51:13: error: implicit declaration of
 function 'FIELD_GET'
Thread-Index: AQHbcpo4rmu7ofNW20iMaJbUJVDP7bMvBmIAgABE3KA=
Date: Thu, 30 Jan 2025 14:06:11 +0000
Message-ID:
 <OSAPR01MB27728A138C60575D99709A6FFFE92@OSAPR01MB2772.jpnprd01.prod.outlook.com>
References: <202501300600.APok2iDU-lkp@intel.com>
 <CAMuHMdXfZbH3bPjpDKm5-PMg-MSh2sDzoeYCzr6kkyvkD8cJFA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXfZbH3bPjpDKm5-PMg-MSh2sDzoeYCzr6kkyvkD8cJFA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSAPR01MB2772:EE_|TYYPR01MB13287:EE_
x-ms-office365-filtering-correlation-id: 6ed8adda-115d-41ff-9477-08dd413740af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?2cHnXds0PSfnfHU0wc8Z3w44H79VZOx1d9F2mOwMRCHYEoz0QserPhrXUvjv?=
 =?us-ascii?Q?8mUzBLXpqHNbc/8ord3FqV8c0aFS5D+Wynq/3489Kz6URidO3PErlvNH5Cjo?=
 =?us-ascii?Q?CcnYBvg83maSNRdJg0uPK0nw5RP5nJ8qc6LUzb0b3g2QHjjn2OZqdJgCuPQ8?=
 =?us-ascii?Q?OKqmjZ/ByqyTX8DiZV5MgmTIb1dT2wYgLEWML0l8nNG9sRR4ttJwPwFf7SMS?=
 =?us-ascii?Q?lIQSe1k4lKEXeCQ5qURFw+bamdkKNvC/GXuoBjW7QaVNax8fkUog4GwOLu4G?=
 =?us-ascii?Q?y+SV62HHccz2zv43pSgBk0fFJALtOS0wvkr8PR4mItm8rf6YrPW3RGnJR9lm?=
 =?us-ascii?Q?/J11wwCVO116ErgJXxePG+G8a9/JwULN/PCwM8l9xrPtxRREZqRg9x0JjxwK?=
 =?us-ascii?Q?1OaIpWfVNdK1Dl5WEkt6cA/VtFYmf0OmPqslBIG04kEpZ8TBB0fuNMFPbBOj?=
 =?us-ascii?Q?ZkS/9FqLssp9z8Y2Llb7RwC4lUUxvRbZ2ftLTT7MWHB1lvWxN9tIP2dIhv8H?=
 =?us-ascii?Q?0fz1wrwa05PDzt+FStEYgbc5xlK1JJJnDJQkorZqeDiiODG6ZDEHPbz3Cy0y?=
 =?us-ascii?Q?0RWrgOr52fBhC9Z7OmaSopRbVrXjhr5iDoaguS8Dj8uhHtlQQ923AIocRoUz?=
 =?us-ascii?Q?ApvhrTFBBFUK3skkxv1riC++zaxkWXcLG/S7s2GpSKq9nw+M1Wx9PqwBtkaE?=
 =?us-ascii?Q?Lpzj/cxpZvDaqC5JxEgMFaAeSYHw6xMSJaF/5xAxLTISRUy7EB0txP8e8Zdg?=
 =?us-ascii?Q?yGSDBfqzVOJa6beqHVYov5Q6/yDxvDWHYSfbEp9qdVNlQ+LttmZwjNmY4sFE?=
 =?us-ascii?Q?oqlNAUxjXgyUlECn9nh5PeQJcaHqPGxCFQdoytqlG6Ow6HG4+K5wd/+PVPQ2?=
 =?us-ascii?Q?QpULn8RuCmXnZ5thhfPsUw3DDf11rleZtvhpaNAxwpZGZHqhCgK1I/SJtdRr?=
 =?us-ascii?Q?0Q62ndabts9rKnEyUMBa5wkqchAKXVVbslTxrYpH+sxX5Og2KZeZi/Gw5N3O?=
 =?us-ascii?Q?XGUX81aGQ6U46+4U4pLCBJf8vyF+gzEyDS7QFleB01h+l1ZuSzPH6MTr49Ki?=
 =?us-ascii?Q?ukCBemEU6WXbYTtRJknNfQmSWZidOI7LcTTMMhnsH14pQLAAsk6mRrXxHV22?=
 =?us-ascii?Q?9/TVsA0msHuWkO/gr0cfKlmOLJPvWfspglw8nZwiWEhJg68sDS6wE8VyTqQ7?=
 =?us-ascii?Q?T3/avGAC/ZM6YPke6m2czfgqrSY0KqaiKlThjFrf5YYXuw58iX77CrZcMN0N?=
 =?us-ascii?Q?MqsuOgp7hKL9ZxRCR+ZP0/sBi3yxQrFLv0F6z0pvoKWuBZ9J2+xGxU5HybKF?=
 =?us-ascii?Q?PIhPEh1mSq3XtOfZe3XnzcTXUY4mL3SzH/neWjOjyBxPi0+QZxeq1E6lU+VB?=
 =?us-ascii?Q?PLpSv14GxtCpAmo+T9HOe7hfpvKUklucpcz5LGchcG4MczXku99aFeGgWqG/?=
 =?us-ascii?Q?k5WXPEE6zIrSFkrTopEOIvYi5TsqQi4T?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2772.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?a73ybxwupb+7FuM4GSoW4BJR6lyWRODh1tE4gH7KzHUKh2BCU/n7a4WclEw9?=
 =?us-ascii?Q?YEEQukW/NyyWMjGBLot7woV3q0+GNA6EJqZ+1QhZCI19iL/pFkQfdHR/E4WS?=
 =?us-ascii?Q?prZxrhzQUclyt2T/cO1ToDmIHpvonLOe+Vx+++5KdSJWTKtirf0+i1gjV6u/?=
 =?us-ascii?Q?lTapf7B8cJT+ZhPHJSenToUSspvFNyKhnIkLnMxEPn9KIwS8E7S54u0Hw5bc?=
 =?us-ascii?Q?gvpdnFAgsY8RAj/vyJzhIbmnTrLvxSH3KAxgrb5WzyICBtxrU1CmRBV0miqY?=
 =?us-ascii?Q?cD9ApgKscvAW2UTLbaVnMBrY66YtgdewsXPgLe1sX4ZbyE7USXwKA0A+g+8L?=
 =?us-ascii?Q?iHLNBVEH9JvMnWOpHrpS+JJgYYTHPoEzPBREIe1Tw9zdDUePAnu20Plb5Kax?=
 =?us-ascii?Q?NOrDx7ZF3OvAFDV1XbnkAee4SwkKIMv62SY4LL2yJHZ1zMGZN8zrqlYkduXm?=
 =?us-ascii?Q?pkFEzTpwBoxoT/+7EW4PhKrr0Y8GUa4h+8/1/xY+Duj39xe4Af6frA7FPE+e?=
 =?us-ascii?Q?oxllxKpz2q42bg4K1eUqe0XWw3jmUk4eTUONardv617T0VWDXTkiM/TX0NQk?=
 =?us-ascii?Q?8ySI2HNBxFKoH3Ov6ZbdnI+qisNxSr+LG7roHcNDvw+AkCeVI7Tfar3Geo37?=
 =?us-ascii?Q?uGSpAX4dhdnTyyBVyLVC7xhFYjrrXeNmNhG6MV4f3h+gdaT3jRArhu584QWo?=
 =?us-ascii?Q?rPRY7pSwCeyMOJOeLNCnSaDXdiFGVBRL6d7k9bBg0zFBHfDUcATrBMf8Jpyf?=
 =?us-ascii?Q?gV5ofNf1ycjDxnmR8i3qbbcDK/78zwnIQR8FGka5IuGh6lB/BnsHJYZ7WrOE?=
 =?us-ascii?Q?xNh2YlaCLPaQrQPKTj0bJERLBsG2z6OUiDnJ35ksk4KffyRMiUineisFWbEb?=
 =?us-ascii?Q?U0eiI/88/Mth9FJvfxu9zjggtKTm8nPXPo9egnMxnu1MXs0BbxFwr1Q8atgM?=
 =?us-ascii?Q?9QtJOVV8bJn4dZl+Ddd5CjWgrvHE7SkbY/gB7gDJBI4S/sSZrel6dZ3q3I3h?=
 =?us-ascii?Q?kG+khgiyNqpzGw8VOdMr+UBNgysXKlpk9bBLbpcZA5Uh0Gp6hoP9wXzo4Znz?=
 =?us-ascii?Q?HdXHXXkaOPFN9cO9kaB4K91dkpj1IXnkcO3PBl9OLJHqU5xeC64m3zIIp5X2?=
 =?us-ascii?Q?u2SQvWDB8QRtLzkCGKzJ9q6aNEL5crgsyjfIN4CzZOzrD53Yu0Ww7DHgCVZi?=
 =?us-ascii?Q?X9RS3xbPcCajPPYX81dPn8YSmEFVNvxgJL7k5lwNw2JE4RgsmrB2iUBvNp3b?=
 =?us-ascii?Q?4jwYxMr10e5hM9E5NIDplrl+xt2XDzRALcz8l29uNeqtBvidhPDMO4VcDlWK?=
 =?us-ascii?Q?RVyZenL7S2f1tJG+q412EGpHJAq5wzSCukwDgKYQUBnP1KBkxQWzQdQ/xZUL?=
 =?us-ascii?Q?GMbJ73FvIs5BZKsPprjh3EMvLCCSAMNlxCK9M3SRVw9uTuX+zEAOngr4GU1t?=
 =?us-ascii?Q?K5jabb9EJfXDSZ/Lp+EXLZguCxyC/br6i3co2riRr0nU9LR8SKycMSEK7VEb?=
 =?us-ascii?Q?eQNI1kqnn/FwMtHGSZsCATFxgG4aXIbjuULO35YUkzcXSzLAON82hnh8yQsV?=
 =?us-ascii?Q?F/I11xsnsQ94h/qfPUPj4CFFgC81DoZqlMIpGR/tsgn/A6dIePxWnvLTarhj?=
 =?us-ascii?Q?Sw=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2772.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ed8adda-115d-41ff-9477-08dd413740af
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2025 14:06:12.0395
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oNhsMcFWNnfpLJAi/vNSF2HACbtRURoSoGiKGzNGukKpQejts4fGcOY1rul8WC06wULX+lnIFCkO0qaQ1XzXdlsbWyCnOlG2yIZPi9LtU5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13287



> -----Original Message-----
> From: Geert Uytterhoeven <geert@linux-m68k.org>
> Sent: Thursday, January 30, 2025 10:03 AM

Hi Geert,

> Subject: Re: [geert-renesas-devel:renesas-drivers-for-v6.15 4/6]
> drivers/soc/renesas/r9a09g047-sys.c:51:13: error: implicit declaration of
> function 'FIELD_GET'
>=20
> Hi Kernel Test Robot,
>=20
> On Wed, 29 Jan 2025 at 23:07, kernel test robot <lkp@intel.com> wrote:
> > tree:
> >
> > All errors (new ones prefixed by >>):
> >
> >    drivers/soc/renesas/r9a09g047-sys.c: In function
> 'rzg3e_sys_print_id':
> > >> drivers/soc/renesas/r9a09g047-sys.c:51:13: error: implicit
> > >> declaration of function 'FIELD_GET'
> > >> [-Wimplicit-function-declaration]
> >       51 |         if (FIELD_GET(SYS_LSI_MODE_STAT_BOOTPLLCA55,
> mode_val) !=3D SYS_LSI_MODE_CA55_1_7GHZ)
> >          |             ^~~~~~~~~
>=20
> Thank you, adding "#include <linux/bitfield.h>" to both
> drivers/soc/renesas/r9a09g0[45]7-sys.c.

Thanks for your fix.

>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20
> --

Regards,
John Madieu


