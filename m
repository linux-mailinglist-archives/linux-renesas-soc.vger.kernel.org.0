Return-Path: <linux-renesas-soc+bounces-27140-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2O7WL6rWb2mgMQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27140-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 20:25:30 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F90B4A48B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 20:25:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7968E88137C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 17:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F97D43D4EA;
	Tue, 20 Jan 2026 17:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="KFIZzAuJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011020.outbound.protection.outlook.com [52.101.125.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAE143CEE4;
	Tue, 20 Jan 2026 17:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768931312; cv=fail; b=Kte7hDgPD6+4uQVnwV7SqtSY/YiArHKBhgQR5o3++icptfMHE//nHRyrknaOgC/h4bD17JKeq3sIY3PQpwSk4wT11GbtJldrU8jbrTxjpkp4aHNBiskcOYFWkH0D6Hy1RmhzTDiI7O31PuZHw3SbfEAHzcPTK6Vk3Y+Qi0GXhrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768931312; c=relaxed/simple;
	bh=Av6H4139ZJc+fngDb431Obn3bWvTL2q5T8OdBFkBH6A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=riKc0vc7Z7jI3tHbnPlxBtfR8r/ES+50A5m1ecK+xqZTe9J//1PzsJeD3KriaJmyegskgG9vNzdAEPRzco1Ku2ikn+y8uGFv6DMemuVLc/xbT7l5FNRwbAI7ZjCAHVyj4HaD8yKilpk1DBCFB83hqKXg6ZiCnW/8EyLWzBPYa1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=KFIZzAuJ; arc=fail smtp.client-ip=52.101.125.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YBOo4bzoFH84Hcxj5p4v5VW/t8wbQC6uRALl5H7ykmhTVgnTvXKg01fE7CieFnL+VdgNAUn7HeXF8+PrRfjihcb8AkMLTDPvpGsuDZQHE7PHtbNYJrxgo0jc6HlE7ZUjJXadGtC8bLhmqW9asYxxuG2ANEnPEgeOTJl3qw4DwCwxUalkWaOvFm4J75DqFtWTZxE1DNgGJ18dlYTdp6+yjurQaDNY0uVT5Q0Qc6YOScPtm7fxDya1VqnFJokBuWnppncT04JD5W7IdS16fno9sZSRlzURf6VzZY5WV8PnJkeERkbs7+0A3YFEt2UB7II+hBI0xmx+8/Gl3juCItL7nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bPMlkH0RoqG7ust8FaeH+uiq2NcBACngUn6lyD1XkWU=;
 b=vL+opuwoC39VvSSZ7BjRpy/A+lyBgqgo7Plol6cPKVh5+QmhOJKfoMe2+cQncsRc4//ohukEHCb+V/6pjNxyxomhlwsgHCPuVjSoYhrFUog2S5CLQzkayTtIhWF+6fT5he0jt4HxjHH+bFWhH0oIrzavIPK023HpoQWEe2PIbK+QYZHHkb4uNu3e7LY5IyYDzac8VHAuy3v3ekjsldI5fmGue+HftJNA/hyd3SNVCZhljImfRFl94kLG5hrM+YjYEDdG92dy+ZzTUK7rMvzvahv09817zjg47/q4ugxc0j9AKkOE6Pz2u4RFpyBGZPHIw5F//f7iQNCokIFswqHV6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bPMlkH0RoqG7ust8FaeH+uiq2NcBACngUn6lyD1XkWU=;
 b=KFIZzAuJrDP+R0x46pezh+uCsbr5sAZ9xm/mYitxp1IWtUk/YqHQnM9LBXtJc1UAHSqCEhZtInetFf7SOqgF2HCaV9xxFfMqrAwtUbiZH6khZ12bmP7dVcvIGgNR9Yl2cfBXkLD9rZsm2CKS1zC3EGfYVBvfQ9e48rB7Xe6iMIA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB14567.jpnprd01.prod.outlook.com (2603:1096:604:3a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 17:48:23 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 17:48:23 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 03/12] dt-bindings: soc: renesas: Document Renesas RZ/G3L
 SoC variants
Thread-Topic: [PATCH 03/12] dt-bindings: soc: renesas: Document Renesas RZ/G3L
 SoC variants
Thread-Index: AQHciguqrqFm2g/SxEybVyNueHs6Q7VbVAcAgAAAqHA=
Date: Tue, 20 Jan 2026 17:48:23 +0000
Message-ID:
 <TY3PR01MB11346AB11DA4345080163F5B88689A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260120125232.349708-1-biju.das.jz@bp.renesas.com>
 <20260120125232.349708-4-biju.das.jz@bp.renesas.com>
 <TYCPR01MB120937A6E90F5014CAD069CDFC289A@TYCPR01MB12093.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TYCPR01MB120937A6E90F5014CAD069CDFC289A@TYCPR01MB12093.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB14567:EE_
x-ms-office365-filtering-correlation-id: 3a4548f5-f84a-40d9-b9d2-08de584c1b45
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?LQcyKyGgMWBCitXRGx3PO2N3KljZl51kxgRcYD7WXeSpdpblQN80jmGdqJwX?=
 =?us-ascii?Q?U/EkiJ+pUEgsBb6ilPUk1ZdUCNr1yyhHNFGV7hdbehdNvX8t+6vCfZweiNDP?=
 =?us-ascii?Q?2/UGb01aVCXgX42Z8UVGoEZTuH7ayTE34uXMiyNl6FdeghJ6+SWxv2RdVxZG?=
 =?us-ascii?Q?xo2ACTWUenlqDLSsNF1Yz/vBSee3UdmafFAXFFPIUiIUTc5B6WYLL6Vrnh6z?=
 =?us-ascii?Q?7knJYjQ8x+xkeu6aSk9pLIbKfUY1VfgZLe/QBambks3qsXNFfmUOFORmdBGp?=
 =?us-ascii?Q?K1rIMQktRTxTCN9yrenQLcmMrigcDBHRVkcOn59nn9n0uc/AzH9nxfEZBlnC?=
 =?us-ascii?Q?WtitgPQkbykN4nLVDFG8v2ysu3T/JWtuUJPlSgHAsFuAiBcOqGcnrMQRzXKm?=
 =?us-ascii?Q?v/WyrBEZwUf7L9uzU8InuF8kke3kB+e2ZNXDGXA1dpkTW7j0z6r7siA8BHTU?=
 =?us-ascii?Q?Tb3XC1DemseFY8Gmbv7IeZM/XIHGwIOmJyqfDvUGN1yNl2EkqTv+7eJB8Na2?=
 =?us-ascii?Q?1njW+wgrIQoS4YJDvcSra42vgUXyBEpJTz2kKxTrI9+xWgcn+ORIBe3AbSuA?=
 =?us-ascii?Q?HnzR2h1H2KooNDWb8aGuFMqwPiI4B1zXR50Nt4WFvcDXetXqZgrzd/7/Nec0?=
 =?us-ascii?Q?2u85XFanOfAG6fQV/toic/vJYOlHto4JjCioxz34p1V8Al+5jQOfWu33UBMf?=
 =?us-ascii?Q?u7vQfJFymoAXfaFTNBYsrsuAI2c0k/l4v1k5iwf7WG0V3QuoOX3AtsCrIU6e?=
 =?us-ascii?Q?vgH2aQSO09hR4DO7QuS1gf9rGl80/x1Ad8/+HqyLa70WFQxnyF/e+Gt1FVpy?=
 =?us-ascii?Q?Y0CUUj6nWyaPDqztqoBNPtzODKtXRuKQdi/W9KfYR6MDHYfdmb276sDE2hFl?=
 =?us-ascii?Q?B0p0KtPpNk0N7zm2BnICs4Nz+l+eIzDA95SnQpwlMAMxeb9FMuTuFL9/5bJ2?=
 =?us-ascii?Q?tZfGp3zbmnqAfkfXiBaqBLJcny82MJHuS/0bAsEnvSjDGTCRLlq89kvYnqJb?=
 =?us-ascii?Q?EpFqLx39APFXdkMK/UJjwXFoWxwUTQ/ZidU5wL66W1CLuicWTv0QwDEqbRrx?=
 =?us-ascii?Q?r5zyqKH3HTOfMaz0UIWQyRuWdf7AIMCFfWsc54meR9+a/bcQSUx8T8DstvHS?=
 =?us-ascii?Q?nokcWnHbzl8FqZlH/JgtymVNdcCYW7TisVMIYncReuzWo9XWagb09mNf1aZF?=
 =?us-ascii?Q?EIzB+RDkvig/OVUGvEkBt1AN9t0XKVuqJ8yy9u/ZM1dafa694Pn081apf9uC?=
 =?us-ascii?Q?jzm4zJG8LZJiMgL7x9lU+3miroyBjG/K3ay2XM4pfzY2Rktd635mvjQ67b91?=
 =?us-ascii?Q?/wCtQqD33IH9kZz6+drInAECAB6bz8gNMqE28BhNjhmnoB7aTDOG67KWc3Er?=
 =?us-ascii?Q?s76jl6Q18LT9ws2tp0y7dVoGvCGYMZgS6ro2G3fP2/+dJNHQwT+d4TIexBk/?=
 =?us-ascii?Q?z4km3PtDqesFkQZN5E84w73VScRDWBXo3aJoM9lwbGVnAsMXxAxsbuLRLkSI?=
 =?us-ascii?Q?z8t4P/fdf8cwsNiaTx4/y6wUvif8u1Xq+rwpTOJH6OOWt9K92L4doRTDI8dO?=
 =?us-ascii?Q?crC5F/xmb3EOL/U9UmCeY84xTx6yBcRkoSgiKeoVkSTM6twaXWWtGaCmTUHZ?=
 =?us-ascii?Q?Q5Lx8buz9G4dhLNk8jAok9w=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?kLQ0i5crDPUD00PZIf/mohnJLdvxvB66oXORsEsyU1kNfWKJ3Q4nqpuLI6Re?=
 =?us-ascii?Q?lEyY1us95a7EhrLrcieA/UmRQDTuEnmE0HdkX7JXJOG65WD9nXmAjqfHfY9F?=
 =?us-ascii?Q?HlN6BXHGLoWT1CW3qrjIe9f1f6sRqh8JosCvr0v4EeWF1yWKgILw9c9UJWnr?=
 =?us-ascii?Q?nvMNvKH7KwtBl1gcFnmGMcMi2MudvlAJCp2Zoasrxi2l3rHoobaIZz8J90TL?=
 =?us-ascii?Q?90gThHi+MQs4fcvI8L6L/uTACc2YjceGK48Qv4EmcyasE77nAyjl/p23HmdZ?=
 =?us-ascii?Q?OEug4SafLeMDkw4o0CurxvMlpy3YFziWfdTtWqjeRghXgahDJVPSzV/Ezylm?=
 =?us-ascii?Q?LOEaJMca1FeT37rnQGQdRrV3UKWsHbFPp6B3CNHqFms3TFSq3Fv5GN4RW2mF?=
 =?us-ascii?Q?QLSAH/Hr7cFxuYmlt3l6R3YsMTKKT0j/vJyEVsT3S7eZfodGqBoyk5Cz5U9f?=
 =?us-ascii?Q?QfwHrXZvYSd6yqoBlvN9+N1nbPBv25C+5b5PHqfd02EJfDHcYyuNNjECcJw4?=
 =?us-ascii?Q?Q7+45MCSCmx3/TrCZ9+IJkYFiRAZ4BRrNlJZMDnVi3ssABOeS+9gU1gtg9bw?=
 =?us-ascii?Q?UaSSAfixFW0GKa1LzQvWEPlmW4uQqh7SYHixFgg3gKtuDQutTGONJcvgL2T6?=
 =?us-ascii?Q?xPQaN6tGZJC9ji7f87fr+WDAAvIA8fgrj7ndPNAXtWXlMsxRUM0rOuYQLSPA?=
 =?us-ascii?Q?D6ZB3W8cHil911u3vyoV5lkctlBEi/LdGDXAMIydkOaXSTKoMzNuR5Uu+QQM?=
 =?us-ascii?Q?cZv5YWcK1hAyohCSlXKshuYdUT2QsdWdHHsTSKsbIitM64VtV80x3mGOFjnn?=
 =?us-ascii?Q?ASoqmq7aE1iOClxRjCj/zLToon7sllN5onPDRXK0v/3gQIsgepw3mghQbSou?=
 =?us-ascii?Q?dMJdag2nnNal2BYA0TzOe9xTNRqSq9I6LOy7CCNTuu7idFT89FYFJsrQTaSH?=
 =?us-ascii?Q?XqWOp7hcuV7dRMLkdhvcDIOOTPJV4SGL4D77vUlikCPUh+UG68gaSZ7oievQ?=
 =?us-ascii?Q?GfPzprLDxl90Pgx1mH6Izb7DLLGmDsGE3aKm5B1+JWcmFQHfdGEXVh5NXdAr?=
 =?us-ascii?Q?di142gThoDjcHcLmJQ6IY/l9wq9Xc3QlGqBBIG6rrdICd/AO3MNOoW5IctIw?=
 =?us-ascii?Q?UHScMUZG3mQIPZy6q43REmJkwZrRKIFn7IyoR4SKh62FvGaxaGnkR5JzOmU3?=
 =?us-ascii?Q?jP8dwJD9VcbnmK4FpiVHUSEN/Dwo4ThwJmor02TICDDCtyC1lvdZpCkldzGd?=
 =?us-ascii?Q?qV0QS5zZtPo+Mb0yEmXfGNk2x+4LzoVF7Q86laX6mpi/eo7HuwEtQ0zWhM1+?=
 =?us-ascii?Q?+43GG2pEVGrrsZNidC8C0lO8LmGnA9s7FcyROszKgapPbSLGy04vRcs4VzhK?=
 =?us-ascii?Q?sJ5Wc1PbqNP4BATgxDS6a0SnkbCAS/WcJ1pd0bReIrjoLWE/tULtmE+ay0CU?=
 =?us-ascii?Q?CUNTQGShunpGy1c96lvMVl5t9jtfcrmJAozseDyffLXxajcYhppNGZJq4We/?=
 =?us-ascii?Q?83hCifYItsg4B9DTpzYDE7e7rpw9+XWKxM+gj4MNPxg1/XIqJWH1+7xxvBm7?=
 =?us-ascii?Q?4KMzUNw08FJpSOUj/88QD3J8uj3QRBiZ0aJSfSTlMsGZr2JjS34Z4tgcnqQJ?=
 =?us-ascii?Q?Bn0aNPxF37Mi1cGlw9VuZ0w5i4UcrqQ1lMwsL2mhhCYiqEVt0jnLoJNJctIy?=
 =?us-ascii?Q?j7sHpxWaBQycL1H4JbaIhjovnwF9v8I+Wygts2e97epZVKXlN7i8YSKkEMqD?=
 =?us-ascii?Q?B4WM6Gsb/A=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a4548f5-f84a-40d9-b9d2-08de584c1b45
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 17:48:23.0771
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kd6vbcILvRZmGF68qTKrJ6EC3+I6DXBd8Q5H6kKpV0/IHJfeBDgEawZc665Bcn2ffxP9BDI5XQ0c8nKABU61FQFgUAHHKAggoTakrIs+YAQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14567
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27140-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,gmail.com,glider.be,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[renesas.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,renesas.com:email,glider.be:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 5F90B4A48B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Fabrizio,

Thanks for the feedback.

> -----Original Message-----
> From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Sent: 20 January 2026 17:42
> Subject: RE: [PATCH 03/12] dt-bindings: soc: renesas: Document Renesas RZ=
/G3L SoC variants
>=20
> Hi Biju,
>=20
> thanks for your patch.
>=20
> > From: Biju <biju.das.au@gmail.com>
> > Sent: 20 January 2026 12:52
> > To: Geert Uytterhoeven <geert+renesas@glider.be>; magnus.damm
> > <magnus.damm@gmail.com>; Rob Herring <robh@kernel.org>; Krzysztof
> > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>
> > Cc: Biju Das <biju.das.jz@bp.renesas.com>;
> > linux-renesas-soc@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Prabhakar
> > Mahadev Lad <prabhakar.mahadev- lad.rj@bp.renesas.com>; biju.das.au
> > <biju.das.au@gmail.com>
> > Subject: [PATCH 03/12] dt-bindings: soc: renesas: Document Renesas
> > RZ/G3L SoC variants
> >
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Document Renesas RZ/G3L (R9A08G046) SoC variants.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  .../devicetree/bindings/soc/renesas/renesas.yaml         | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > index f4947ac65460..be61a71c7305 100644
> > --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > @@ -548,6 +548,15 @@ properties:
> >            - const: renesas,r9a08g045s33 # PCIe support
> >            - const: renesas,r9a08g045
> >
> > +      - description: RZ/G3L (R9A08G046)
> > +        items:
> > +          - enum:
> > +              - renesas,r9a08g046l26 # Dual Cortex-A55 + Cortex-M33 (1=
4mm LFBGA)
> > +              - renesas,r9a08g046l28 # Dual Cortex-A55 + Cortex-M33 (1=
7mm LFBGA)
> > +              - renesas,r9a08g046l46 # Quad Cortex-A55 + Cortex-M33 (1=
4mm LFBGA)
> > +              - renesas,r9a08g046l48 # Quad Cortex-A55 + Cortex-M33 +
> > + GE3D/VCP (17mm LFBGA)
>=20
> The document I am looking at seems to indicate that all of the above part=
s come with GE3D/VCP, but we
> are only mentioning that for the last part number?

Good catch. When I looked it was on the first line. I did not thought it is=
 for all the variants.
You are correct. I will fix it in next version.

Cheers,
Biju

>=20
> Cheers,
> Fab
>=20
> > +          - const: renesas,r9a08g046
> > +
> >        - description: RZ/V2M (R9A09G011)
> >          items:
> >            - enum:
> > --
> > 2.43.0
> >


