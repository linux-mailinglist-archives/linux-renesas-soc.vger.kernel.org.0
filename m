Return-Path: <linux-renesas-soc+bounces-27606-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WB2+A7lYe2mZEAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27606-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 13:55:21 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 536DDB02DA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 13:55:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E324530166FB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 12:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 682783876DD;
	Thu, 29 Jan 2026 12:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hrZQUM6C"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011065.outbound.protection.outlook.com [52.101.125.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC4734FF72;
	Thu, 29 Jan 2026 12:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769691314; cv=fail; b=t8225f+yGKkopTHaKM6Gck5IzPtbTNBBVtPFwM2DoV1j9sM0k6PUiBoiociIyGDHd/yaAnMpoETBO1EX/sHGFXY1ccgcDVw+EHlZwuiknbv+8up+h1ZKX7sBeYR58KOXAjDD9jnAW+BdCfcQG2wNU4F73pUgLIZkrC7tdtwGj+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769691314; c=relaxed/simple;
	bh=s/VHAHdreR7p/RF+hjcW0hs6YbXJ5y+Z/1KJduGtbgs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Viqq/1w9CTVJBQcxdmNXzTXVvCIkHLOQt/AfjsighIBXsp8dkofziuC0Jp0w5vgboDdI4aJLHcJBEaq3WHsiVcj3tu/9Y8Pn8jR/erayqFf63axLqtRqq+Ab3zw6CCrxcZPzcImsge+awz2+oARqne6lmBxhodBIPM1+hI+VaA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=hrZQUM6C; arc=fail smtp.client-ip=52.101.125.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PKqt9+1UpS784TV0DaookkoJKI9sJjQCMuXZ54/jvE5tV0+y+W8rvaIP9EIrb9mOTu4FgIc3yv8uePxQG0HGBGoomGYw0dvi+bUO4WzQPQNe7LWKna7LIp4Ck0T5lfRhHA2g540faTX5NyWgtWAxJ1RSrtpPk0NhvZYzg7E8T9hZfYeilNk9PHuhXILzy8/8CcyEUH77g2v21Uf6bTfdbXzcbMR7+8KUjcoSfQ976LAxqDOKQ3wKc0kL0PK2RHnj4eVtTLlGdVhpceyTweshSo+oyyUvIWlxaDjY1lCnrn1N0gWRsJPZYn3h830bWvTSPTl273pY+4MrbHFT31HLXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9AjW8xHM1oDDbNBxYSnLamInxAEePNvPHRSzTGOhPu8=;
 b=BCvhPvbm6mySl84nXw+Y82cC/lfjWjUbo3Z8spwVebNN/v0sYSjE2tlWUeLyXDFbp3Wq8Ff1aVYoik8xwYXiHFe3uAsUzH8f6s1G+Li4ALTTSexx7YkyOcb3BCAVJhpZtwuBSEsslcVChroNn3fnjYEWF655tkD3s7EYQ3kf5ETgOrLNKgiwLKPQg79kMLu5VcEMUXHgB9YgcpVmv9ErE+ce/s8iWFhhBmPVdfWr5DifDxs85I1IO4uHkQvqQZSb3D8io/+pR/y1zMb4D0ycNWTGIA/pdnY2IGO4EzHPcB8igH1XImH1/rb5IiEfAoNtSA2ndb86Ui5E3SAr9YiSXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AjW8xHM1oDDbNBxYSnLamInxAEePNvPHRSzTGOhPu8=;
 b=hrZQUM6CyQ05zMCaKrJLRahDmVwz3iFvfQDfHaUGFkS6qi3/ngR7NF2nZWWBMCujXHiRvqKmbx6lJvCXS7oy1H/GnzgwZfUZS3DlItbwsXf0AthYFpD3TakICHtiIyAmM9YNdInmIHFQaBALtQUjiMlvX9eJjfUhrf9+zO1MgV4=
Received: from OS7PR01MB17371.jpnprd01.prod.outlook.com (2603:1096:604:43e::6)
 by TYWPR01MB7425.jpnprd01.prod.outlook.com (2603:1096:400:c6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 12:55:07 +0000
Received: from OS7PR01MB17371.jpnprd01.prod.outlook.com
 ([fe80::7c48:4e26:72a5:7960]) by OS7PR01MB17371.jpnprd01.prod.outlook.com
 ([fe80::7c48:4e26:72a5:7960%4]) with mapi id 15.20.9564.008; Thu, 29 Jan 2026
 12:55:07 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Conor Dooley <conor@kernel.org>
CC: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>
Subject: RE: [PATCH v3 06/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie:
 Document RZ/G3E SoC
Thread-Topic: [PATCH v3 06/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie:
 Document RZ/G3E SoC
Thread-Index: AQHckFiD5LutvuE/wUOWR6pxx30ky7Vn2aOAgAE/wiA=
Date: Thu, 29 Jan 2026 12:55:07 +0000
Message-ID:
 <OS7PR01MB173719D8E22176F897D0757C1FF9EA@OS7PR01MB17371.jpnprd01.prod.outlook.com>
References: <20260128131647.120511-1-john.madieu.xa@bp.renesas.com>
 <20260128131647.120511-7-john.madieu.xa@bp.renesas.com>
 <20260128-chaperone-hydrogen-421d911b964b@spud>
In-Reply-To: <20260128-chaperone-hydrogen-421d911b964b@spud>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB17371:EE_|TYWPR01MB7425:EE_
x-ms-office365-filtering-correlation-id: b4695118-81c6-459b-3cdb-08de5f35a11e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?zUAw13NEu2n+hExP0BCmuTjyxRHbrU8N5tYTStJPpx4JZGNZ3PkGkSp3eGCy?=
 =?us-ascii?Q?wnGxk8iseNOsQ5xcQRdaza0kJmd3glqq64tKzy6cG8m8QxN8jqtiyGHtpftz?=
 =?us-ascii?Q?dtsgR1sAxzmRGmi26L5kp18Fos+z30FfUPCCpNoYkkxJ145AYSuUj0MwMJPK?=
 =?us-ascii?Q?670n8TpaTyi9QGhGS8QjUVUSzCMjus31GrgioZMPWQG6vVgSnXwDn6dqiZ4T?=
 =?us-ascii?Q?yfl6gFA5WoXIVzfEAy+CKe4E4DeF6XMnEo4h/eiW2yqvl5LaeAnLECBnzn4P?=
 =?us-ascii?Q?NIR3hXT2k0Z57nJwFUJZhVoElIPrZbXn+3ZoActWXh9dnCEFINwf7n0kxu3k?=
 =?us-ascii?Q?rCd3eyp4pjkdrYV/KM60SGdvtvGKYJdxSPoS46odomTosCEP33UtdTYASOB2?=
 =?us-ascii?Q?2YmfwqFRoBPzJMQzfWX0nAamWCDszZbMwQxE4PatBaurTcgHr7+HkMD1vlPs?=
 =?us-ascii?Q?xBi27gqzajDKWTPj1q6Cd32GMd+WcvT2M96oeOcCmYM0iMP2BjixAx8eQLAy?=
 =?us-ascii?Q?KYbuKYKZ4+7t9j3me0jJV2OrydNjMzLJC7wxassluSLE1x2GagwEUj57qdWF?=
 =?us-ascii?Q?TqPTdkxIUeYVxWMZ0+gyvykGQP73uQyjR2ZolhCSWhhOyo8R0jtBALpE221Q?=
 =?us-ascii?Q?ziZL1FxCE8IhAYjRRsEKYTnfaxScH5MM3zYWepUMJyqmjsk7/pFiE8N3H+AO?=
 =?us-ascii?Q?F5NmpwVCRU6129lRVZh//ItuJq5alM/VsU4DPWITKlvaLYymjFvBQyIJbtxR?=
 =?us-ascii?Q?+FbCWESMZ7fIZUxT/TSM7aj04lsahj1Nr0aAfeTdAuqWYdqVdGvYxQ2rPP8a?=
 =?us-ascii?Q?09AlwTxVUnVWO+rGFbpigG0eT6DxSJmOhXoOwPGyAHHTT2eJADR3IVzdQP8L?=
 =?us-ascii?Q?BOaxgWlvixcFVFJGV8iAOBpHCoX1jHR+nS0/3cjXPJgP2XekgMQ3E3H6Dnpo?=
 =?us-ascii?Q?xG55BlZtBeUCd9F9CnIqC0zObcS5N351rZ7jg+uKTrJBBTnCO2hiyBiCtxrM?=
 =?us-ascii?Q?zyu/Jll2IttyIQ7iQ3wMAiclhzXkyJAsC/DWr/2OFmGH+TrhpwtIFlzobxiR?=
 =?us-ascii?Q?GFf5FPwlPUdVsRdAG58msalM+Wr7s3DybmowYATiShxi++KtQS5jKlLfp6rc?=
 =?us-ascii?Q?kGEWPkyNG4J5LFu6aY9r0KHaGpe8lYseZuCplQGVkCIG3qO2uexjGgUI6qU3?=
 =?us-ascii?Q?2TKDHQtu5U+OMkOQYyKF6A8Tb3fJ1ubkn7ktIZsIK9F/NaqT3wqwMBQv9eVp?=
 =?us-ascii?Q?pXh+EaFXKcelTr8Pmo1JfIQ66AyNiRD6pvU/0oUFqsOiRclKwg+qAwDJvfly?=
 =?us-ascii?Q?eXY82pkH1BRFI9fW8ssXQg4Kvk4lhawscJflmqbLtp287Ib48RqpBBXE/sFn?=
 =?us-ascii?Q?f9LaaS+0Wrp+R4nxe0KBYFHRNTNuuwxkutx6pxvFiV0z5DtGxCQuIxSCqmQR?=
 =?us-ascii?Q?QQlUeG2VUR+wlECemi9KVCbzlwOm7vr4IAHP/NMFpnCfSqWR7c2BanxT5Krk?=
 =?us-ascii?Q?y3ayMyVQZ0D2CU5MOzM54riY367ek/0LqrxRqCZ0ZzA8YaHpW34RCXUcrhoW?=
 =?us-ascii?Q?uamFsxKzbQxKQiK0niRyFRq7uBjuyOc7gGTVp2wstuCsRr8ZEWzKMx0nZLcA?=
 =?us-ascii?Q?iq+rDF3ynmHc10BTMCtk81Q=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB17371.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?hKzAjXh4fSisCkOLxZGF51RpqXH/hxeOko+Eufc8/Z9/qYi0KJn59+5NFjpj?=
 =?us-ascii?Q?Jy9b3uouqWbLirCJ0npUS2VCZTERv2f+sWgjBETyrTlZaGBP5T/7rY9t0aI9?=
 =?us-ascii?Q?3UUFgWgXacYTZlUsN0TL2ySWk69CXlXh3z3hBwQtzVvGE8w6B7nzls+5OcN1?=
 =?us-ascii?Q?+NFfVxeIR94zkW8csfnCqsrCwQKVrXYXvQB5iuSlVq4n3/yLxAemQ0SC7DPU?=
 =?us-ascii?Q?IeePq+xuFycyr/F5gsXdm8/9PMt/y7W3nLOqq1kXiAqAf1lvUIKrIrkWrLTW?=
 =?us-ascii?Q?5rMIsC5z6BT9ikzU999B7UP9uoxIjLj/szFJAT33ccjASWEphn4f1HrrISDk?=
 =?us-ascii?Q?LFYsQFZzipQrqZDPcGj+TCGg+7xu0OU8Z6TCV+aXCIA+ocil9mXbZ/wj2jZ8?=
 =?us-ascii?Q?oQrh79zcdEsAHGaTFQu2Hzb2GWcdB+TQsnKcTM/sRsYY0Qumi80qE3eWDZYV?=
 =?us-ascii?Q?3Tvx5Z9Qj3l1D9Qy4CUv5eQ+ryalJcY0QOKpixIkGNs2DsN8HassD12b3ie+?=
 =?us-ascii?Q?M2DnQdh/YKeyP0Ld7Mxd4DuEkEVWcojJpIvN6yxQR7hsmgZ3InhaX+HYglrH?=
 =?us-ascii?Q?GiSOR0yl4efto7nxq3VcqDEa++v8w3s0ihSZQ6JauN64e0zwFVJhaPxRwLuu?=
 =?us-ascii?Q?dEZipsYppMWDXhXFoIOQVzdRuHTIImL1rcpabFtAHG3bqx5eksVr4+d9IOAe?=
 =?us-ascii?Q?rEm3oiDhmd/2nRYoQiXZ6Q4gHjBepf9dXw1JLrQWIBrgxSiCqzfTYBobAPeN?=
 =?us-ascii?Q?MRTNRftqqsvtDhQv7zSH4csIo2RCcW78k44tHU6csh64D2ixL+T4fo3Mhenx?=
 =?us-ascii?Q?G3zLW7XGsN42Cc46hKuFZKtD4wFxHjx8j/+5UPXK9aEbJkB4loKFsduT2PzD?=
 =?us-ascii?Q?PAG/84C0yeHLvP8SjR6Ywzh/PxpTX/33e6bS5MZo6b60ZqlhXpzWzQB/AYmU?=
 =?us-ascii?Q?q3jPwfrdImxL4RGpKATMs0EYMW57mTYc8GhzwGF0uGU/y4uU8IZgpyerCmec?=
 =?us-ascii?Q?NJVImOYXjb4SqcYlKoQ+ITjyu6T1QmjmvFjX04IS0VQFzZ5JqP4aMCJHZNBt?=
 =?us-ascii?Q?Z5pNJiamTg1QiOq46C0rEQ1mHbZz0mMhjuYwOpld3lUFRz1wljU4QWUlpdev?=
 =?us-ascii?Q?wRSC9w8mSdnyneeIl8/ASGqpF/GB6dYWvTS2nKRX7fU1NMFu92PTCaTpLXr6?=
 =?us-ascii?Q?BEdlCVipkvOHgaxI//4aDJMJ5XPuNbHXtYzq3PSuo64nSWlHutghVmaLQKW6?=
 =?us-ascii?Q?ohNKLEy2SyFJcqfnAzqe1U4V8igRjkyrEdC3SEIquUvhPmW3qiPmTt3+Trsz?=
 =?us-ascii?Q?k8C8/rP1dmAQ7ceZV/WZGPLhMCRQfDYKD+Q3CMHhm2AqIMGIFL6t3zfbDBIA?=
 =?us-ascii?Q?odFi12wLOj0I8RtaxiCKK9WDEGsB8rPr+SSUHn8icbr0QdhKrdAsHktr4s22?=
 =?us-ascii?Q?tG11pkeSlrBy2U0T/wRRPQ1MN46G8DuKMG1qHUnozSXn0iTDJ072Dy2XJUTI?=
 =?us-ascii?Q?VRxnBK+OYwdbouzN6tyiM/iWeOulIg47w7jOBiN6ffn0ZlUKfJZ+ayjq8w0I?=
 =?us-ascii?Q?0tIOeLmYlstLCr2IyeK2CrbqO4UPL7LEXGXaoeoDxFApHndBdzOlu0Ut9AYZ?=
 =?us-ascii?Q?1eaVXb4tNvUMAT65BlSWv9MkaOwP5NFC4Y5nlFb3PTbgEYvTzuKp8Jj0OUab?=
 =?us-ascii?Q?mPQFVOBeIme7wvWt6hh3veC5VK5TIpxCx+xTYcD5jX//dSHBNWlP2qcp6zHK?=
 =?us-ascii?Q?cMFQr/ET5dUIjLhZ6PumaIU3049m3yo=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB17371.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4695118-81c6-459b-3cdb-08de5f35a11e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 12:55:07.3979
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pPhmapl3Ebydjc1mWckxBeHXqdPXdO9tY1n8PwNmE6PkZDZn6SvOHlr944CjIKrvV6NQ2TK/fMyJxrSWyGrqDsrUv/H7z9pntfWt4K2pHDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7425
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27606-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,glider.be,google.com,gmail.com,vger.kernel.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[OS7PR01MB17371.jpnprd01.prod.outlook.com:mid,renesas.com:email,bp.renesas.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 536DDB02DA
X-Rspamd-Action: no action

Hi Conor,

Thanks for your review.

> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: Wednesday, January 28, 2026 6:40 PM
> To: John Madieu <john.madieu.xa@bp.renesas.com>
> Subject: Re: [PATCH v3 06/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie=
:
> Document RZ/G3E SoC
>=20
> On Wed, Jan 28, 2026 at 02:16:37PM +0100, John Madieu wrote:
> > Extend the existing device tree bindings for Renesas RZ/G3S PCIe
> > controller to include support for the RZ/G3E
> > (renesas,r9a09g047e57-pcie) PCIe controller. The RZ/G3E PCIe
> > controller is similar to RZ/G3S but has some key
> > differences:
> >
> >  - Uses a different device ID
> >  - Supports PCIe Gen3 (8.0 GT/s) link speeds
> >  - Uses a different clock naming (clkpmu vs clkl1pm)
> >  - Has a different set of interrupts, interrupt ordering, and reset
> > signals
> >
> > Add device tree bindings for renesas,r9a09g047e57-pcie compatible IPs.
> >
> > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > ---
> >
> > Changes:
> >
> > v3:
> >  - Moved interrupt/clock description in distinct PATCH
> >  - Fixed clock name constraints
>=20
> Can you explain why "pm" isn't close enough to "pmu", when it suffices fo=
r
> "l1pm", and therefore the same across both devices?
>=20

Regarding using "pm" for both, the underlying hardware clocks have differen=
t
names (CLK1PM for RZ/G3S vs CLKPMU for RZ/G3E) and serve slightly different
purposes - the RZ/G3S clock is specifically for L1 substate power managemen=
t
while the RZ/G3E clock is for the PMU block. Therefore, I wanted the bindin=
g
to reflect the actual hardware clock naming.

There are also SoCs (such as the RZ/G3L) that have both clocks (CLK1PM and =
CMLPMU)
as Biju stated.

Is the explanation ok for you ?

> >  - Updated clock descriptions
> >
> > v2: Reuse G3S names
> >
> >  .../bindings/pci/renesas,r9a08g045-pcie.yaml  | 76
> > +++++++++++++++++--
> >  1 file changed, 68 insertions(+), 8 deletions(-)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> > b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> > index d1eb92995e2c..d48187ca0849 100644
> > ---
> > a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> > +++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yam
> > +++ l
> > @@ -10,17 +10,21 @@ maintainers:
> >    - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> >  description:
> > -  Renesas RZ/G3S PCIe host controller complies with PCIe Base
> > Specification
> > -  4.0 and supports up to 5 GT/s (Gen2).
> > +  Renesas RZ/G3{E,S} PCIe host controllers comply with PCIe  Base
> > + Specification 4.0 and support up to 5 GT/s (Gen2) for RZ/G3S and  up
> > + to 8 GT/s (Gen3) for RZ/G3E.
> >
> >  properties:
> >    compatible:
> > -    const: renesas,r9a08g045-pcie # RZ/G3S
> > +    enum:
> > +      - renesas,r9a08g045-pcie # RZ/G3S
> > +      - renesas,r9a09g047-pcie # RZ/G3E
> >
> >    reg:
> >      maxItems: 1
> >
> >    interrupts:
> > +    minItems: 16
> >      items:
> >        - description: System error interrupt
> >        - description: System error on correctable error interrupt @@
> > -38,8 +42,16 @@ properties:
> >        - description: PCIe event interrupt
> >        - description: Message interrupt
> >        - description: All interrupts
> > +      - description: Link equalization request interrupt
> > +      - description: Turn off event interrupt
> > +      - description: PMU power off interrupt
> > +      - description: D3 event function 0 interrupt
> > +      - description: D3 event function 1 interrupt
> > +      - description: Configuration PMCSR write clear function 0
> interrupt
> > +      - description: Configuration PMCSR write clear function 1
> > + interrupt
> >
> >    interrupt-names:
> > +    minItems: 16
> >      items:
> >        - const: serr
> >        - const: serr_cor
> > @@ -57,20 +69,27 @@ properties:
> >        - const: pcie_evt
> >        - const: msg
> >        - const: all
> > +      - const: link_equalization_request
> > +      - const: turn_off_event
> > +      - const: pmu_poweroff
> > +      - const: d3_event_f0
> > +      - const: d3_event_f1
> > +      - const: cfg_pmcsr_writeclear_f0
> > +      - const: cfg_pmcsr_writeclear_f1
> >
> >    interrupt-controller: true
> >
> >    clocks:
> >      items:
> >        - description: System clock
> > -      - description: PM control clock
> > +      - description: PM control clock or clock for L1 substate and
> > + CLKREQ_B handling
> >
> >    clock-names:
> > -    items:
> > -      - const: aclk
> > -      - const: pm
>=20
> and I'd like to see an attempt to keep an items list here, by making the
> second item and enum if you keep using "pm" and "pmu".
>=20

I'll use something like this in v3:

       clock-names:
         items:
           - const: aclk
           - enum:
             - pm
             - pmu

If this is Ok for you, I'll keep this approach with both names.
What do you think ?

Regards,
John

> Cheers,
> Conor.
>=20
> > +    minItems: 2
> > +    maxItems: 2
> >
> >    resets:
> > +    minItems: 1
> >      items:
> >        - description: AXI2PCIe Bridge reset
> >        - description: Data link layer/transaction layer reset @@ -81,6
> > +100,7 @@ properties:
> >        - description: Configuration register reset
> >
> >    reset-names:
> > +    minItems: 1
> >      items:
> >        - const: aresetn
> >        - const: rst_b
> > @@ -128,7 +148,9 @@ patternProperties:
> >          const: 0x1912
> >
> >        device-id:
> > -        const: 0x0033
> > +        enum:
> > +          - 0x0033
> > +          - 0x0039
> >
> >        clocks:
> >          items:
> > @@ -167,6 +189,44 @@ required:
> >
> >  allOf:
> >    - $ref: /schemas/pci/pci-host-bridge.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,r9a08g045-pcie
> > +    then:
> > +      properties:
> > +        interrupts:
> > +          maxItems: 16
> > +        interrupt-names:
> > +          maxItems: 16
> > +        clock-names:
> > +          items:
> > +            - const: aclk
> > +            - const: pm
> > +        resets:
> > +          minItems: 7
> > +        reset-names:
> > +          minItems: 7
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,r9a09g047-pcie
> > +    then:
> > +      properties:
> > +        interrupts:
> > +          minItems: 23
> > +        interrupt-names:
> > +          minItems: 23
> > +        clock-names:
> > +          items:
> > +            - const: aclk
> > +            - const: pmu
> > +        resets:
> > +          maxItems: 1
> > +        reset-names:
> > +          maxItems: 1
> >
> >  unevaluatedProperties: false
> >
> > --
> > 2.25.1
> >

