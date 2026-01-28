Return-Path: <linux-renesas-soc+bounces-27568-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDAAB3FyemlI6QEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27568-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 21:32:49 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D3BA8975
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 21:32:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BE03D3018598
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 20:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11715372B58;
	Wed, 28 Jan 2026 20:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="i/5btRfL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011068.outbound.protection.outlook.com [40.107.74.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149152BD5AF;
	Wed, 28 Jan 2026 20:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769632268; cv=fail; b=KcTvKSY5U6Y67ha559DEuDK1qQebNbQuf1WJCJDKaJH0EOvXcDoLn0XCQcaIQ07Vqzm3udDMQjBpTukB09V0/czTW2zIFwmgzCuSV20R+B4V75ov3yoI5I2j9Mo3TrKQ9fhVWc8ft5kgdedPCfTR8NTp0Jw19mK4kNjjOy/0ojs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769632268; c=relaxed/simple;
	bh=UGqOk9fOzjfZrY6XGYDnJIyeg9vjWa1QWXzWBGv3Kh8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oEzfxO9NijhOfm/Tph4oLDL7L0gKMfRdJhGKuku10ziGVS1ErxwJDKnrQuhUulxzj8Dp/AeN8YPJSx+7qcFQeC/7yY2tqNf7FpXPOhhUGLA2XgKsTfJqg9B5iYhjyOTIXXS9igk9VWy8GuVyFAW1ewckzWvgSokfPXeVAM0NrEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=i/5btRfL; arc=fail smtp.client-ip=40.107.74.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u8nRl1c0C2tF8aVQsLyeOTLtjJv+l7heGZBMRx7xSjYYXhio54y5aAUI6HU8a/cAwO8pdt3A18+v9AiMlh4prZJTD7oNIAEKP0O3eJ2excRctCNeXWd5BGLhSJj81Gwz4IVV8zQbiSHcMzSiWsPqMNhyScOkNhyR9vqlJYg90T3Lbp4vtxV01nbUoAqtwJMJlAMnrn/NISSvM7eLHSJjmMmiEDJbrOCLjG414RzWAGFlQDcM3bijQe1it4fgi9QN7vBLGONRcdNV7uW31KoduMMGWF0YzTeSzPNEpDHcUEYa4N4BBXka35iNAjt86ZdDt4+O5xp+E9J2XW9UuijiyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UR1uyPy+E+rxk0vSw9ib/PbuFNgRUuFS2apstomRwHw=;
 b=uXlmHNeltXDKfQmeqmbUK1DKDiLM8v7ukvPsRxbI0Xipcu76QBTN72AcSyydLmzDvggwy8VukiEs3rDUt8jtCm4JbgdrIQWiP0bIu5TTN7WMHVqZkC8xtk27H4nGTTTfZ2WaIADmLo5Hxc6saz+c1R8sBPfvURDsuSQWtYBLW3EM0UnJpwpowFy5kvdZtq4ZMPU0Xs2IBb66z625C7wVeCTVOFoJ/TKEoGL/fgmzlon0VkfvcE4WNrUwNSPk/sHY5p6wWhhjt3JkfxXg/iA/xvp1IuSe7tlAOI50mDReBKnWRTCPLf6tdqumpeQG4TGJtAKjnELBTYsJDXDvwd5AIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UR1uyPy+E+rxk0vSw9ib/PbuFNgRUuFS2apstomRwHw=;
 b=i/5btRfLzHd0BtTpAY+ZsGNpfboM0OW7+Qc9fmuo812ic/vkNuUka4+rqHsgERH0suxF6G4R67kfF6rZumfkDMden8AyMrUK4FMTv1SLApg04wCzZgqMTMElj9UcFKqdEKl6wmQaaEeMZKR0GNjEanX2YdKnSGCyhNGgti1tj88=
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 (2603:1096:405:29b::10) by TY3PR01MB11258.jpnprd01.prod.outlook.com
 (2603:1096:400:36f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 20:31:01 +0000
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::606d:1c5a:2899:5ea6]) by TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::606d:1c5a:2899:5ea6%4]) with mapi id 15.20.9564.008; Wed, 28 Jan 2026
 20:31:01 +0000
From: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Conor Dooley <conor@kernel.org>
CC: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Mark Brown
	<broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 1/3] dt-bindings: spi: renesas,rzv2h-rspi: allow
 multiple DMAs
Thread-Topic: [PATCH v2 1/3] dt-bindings: spi: renesas,rzv2h-rspi: allow
 multiple DMAs
Thread-Index: AQHcj8oOYuyD83XsuUebvUKfsgQ/wrVn4rKAgAADmNCAAB4hgIAAA1Kg
Date: Wed, 28 Jan 2026 20:31:01 +0000
Message-ID:
 <TYRPR01MB15619CBB067CFB9399D5E91158591A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
References: <20260127201706.616374-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260127201706.616374-2-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260128-sequence-platypus-59ae3318318a@spud>
 <TYRPR01MB15619DCD987445778003A81588591A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
 <20260128-debatable-scribe-4e55c208b31a@spud>
In-Reply-To: <20260128-debatable-scribe-4e55c208b31a@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB15619:EE_|TY3PR01MB11258:EE_
x-ms-office365-filtering-correlation-id: e5ee1ccd-61b9-4846-9416-08de5eac271b
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?c+Bxo5AoxWL5I5hAiakXZaH85sr1rVMEsVg3JZTQkTHrEFtrCK/0ht/1TZ1w?=
 =?us-ascii?Q?pnErSijwuIDHed3Pz5rK3QZ0R4LbIGfuDbru8HacB3vovdnwFeBrI6U2u85e?=
 =?us-ascii?Q?IdbzO/6GBc3bWF7suZAWs4/8zVVrajlKjE90r+HIhZWSBVNlP/dEf0cs3GtE?=
 =?us-ascii?Q?P96c5gmNPRQJmqiFZrsBNmtkDTnZTWMmD9AmGC1gMFvRVi2tKdcr5ZkP4fcK?=
 =?us-ascii?Q?hEvMvZQNWDlD6cru9b9fY/xARhh68R6nT8uT6C++HcpwGd+WocL8c3E3Mm34?=
 =?us-ascii?Q?etohm9Lg7JIc0PTjqsRTw14kYt3V1EEk9DuH91kuFJ15Uh4Y3XEZVQ3d8LWQ?=
 =?us-ascii?Q?x0CnjS44MiuKZg7oF4v80BX3n8zb3giUZKeq2v5ejm6JRM5ekbtEPnkMCgv8?=
 =?us-ascii?Q?7QXwghlfJOJ7gE+O4Acy4cxBJCutdEGm7VbRoWg0F8Bo4lhd5aM/7tqWFFkZ?=
 =?us-ascii?Q?QRtkKa9u8lAt1P7S0rly6H1ftczSXU+nC5gRVYC9+eGLQ/EHhSDcXXjSxnoG?=
 =?us-ascii?Q?39LmowUq1vXUc04/n5i9Pm78LK3J0eB5cPr18clKpEJXf0rznDMSAJttgA72?=
 =?us-ascii?Q?gaLzsE1Q52HQz+9I/DYxbK3g7xIOXZowU+xkarOuOVY+A5VMrCHCj3o/ByDM?=
 =?us-ascii?Q?V8LTo+Mkv9ecY4MzNPts6T3LdwoDW+2M84Tf0YAiIB7PqrPvyLwm3I4smzd6?=
 =?us-ascii?Q?Xdtwqxrf6cL5oXN/W8NizFZGYQ7PzdGMtGelxp3devO/w87gA6rofK+IEV5n?=
 =?us-ascii?Q?sKw8ma8j+yxj/TnWQDhFxkjtHP0VxmQxNVMDdXinZQgRSwyo+jIa8EeTBoE2?=
 =?us-ascii?Q?h+EFV0qdMdpi21GbYNXecLafO/C5CcagvZQx8HgrH5yOdWtEv54m6tJkM/2T?=
 =?us-ascii?Q?Qsr8VQ8RvuHrUJ7dRB3yjFB1e2UL86i1AsqJfVL9IU10ebBn9rspNjpAp8Fq?=
 =?us-ascii?Q?BiPyoXXOdENoWoHxuQj1WNjlo6SKVnijzbsYt98ajWEiO9abP9jTAFREkJJa?=
 =?us-ascii?Q?ddGIVmg+J+T9fxUXj+pbaQEmdu8mm/1KvJeIUBrK+aNvNE2pqmT/RxNuhwi6?=
 =?us-ascii?Q?NSZVpOzwz1ztm+AhfxdiRCSS2BY36z1OiIveoujT6vdJ6xGiuv4OvH/gLMg4?=
 =?us-ascii?Q?oFickogPrHsRcJDWvajm7xINQ/39Ssio+WKrPuTXg83I0n24307PAKaqc3U0?=
 =?us-ascii?Q?FINNhF/ExwxCYdS3InIfIYVeEtulTOt0/YZSYe2bKANi6LEK03KZdkE8xs/Z?=
 =?us-ascii?Q?SoXfNR4kKZn8rGyyy5KXI/105IUKiOM4aH1P704ckJxeENGbXhgq6GDMHwGz?=
 =?us-ascii?Q?JDHE6GnJO4FFEtBR3nwLRhVH+jBffCG6+zzSogY9D2TBT5mjQPQXeY2EjoWu?=
 =?us-ascii?Q?C/egpGuKDf1C94YVh+cltoMElww9hLiBQd+ULpxwmvxFE+b8VUuEqnQSpzWE?=
 =?us-ascii?Q?N6m6Z9ZeVbhEwLEtEF98OooJD3hDQsWhGmRpIWRkuLJR+GFeoPI3a0SPSzbQ?=
 =?us-ascii?Q?fRSNPgXomousQ3vBFuVpB1fIKcTeqqYwFgiodUlY90WloXeKVgcx7Wa+cRT4?=
 =?us-ascii?Q?h1R93rnPZrWTG7gS8dgUz5Nz/QoXULuXaZZlHuUyGU1ef4ltcS54KveBYywZ?=
 =?us-ascii?Q?uagyMctrsgfoM0QCfiUo4QI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB15619.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?d/4iAFVT6KM+uFnOWbZiO0gVz3rm0Lcb16myaLHLL/r9bq2nILtmJFVdP/0S?=
 =?us-ascii?Q?rxzybTsbY36gP3mLvuLdzXAq+xqwOYpVCKwo0CtqbVm40iudG6QgyQ/HHtH3?=
 =?us-ascii?Q?dtawZFHJB2EMsiOTMBOiRWpKqq3QPfj+f4aNDSD9Ok5q1mAJpMP2YfbxPgWh?=
 =?us-ascii?Q?lmwWuH+uUs7RMXtnKholna9PE2txcWB9GCH44052h3g/g0jSX8xL845UClzX?=
 =?us-ascii?Q?wDIbtvlWInwsQ6kj1iSq4UoNnriqW/u/X4xmvN1AXeIXq5JriqBDEdCKUXOo?=
 =?us-ascii?Q?40yR7Ml8GnerhN6d+yP6mrbGpq/xVv2gqQNZl3zIrBJdg5eaCJN4usYMCvvF?=
 =?us-ascii?Q?En8nRpcx1uPlU9FfJf6ws31ypdVj+ixrhY7ZagnhvBWRl5ciqNPKJ+c1Eq2Z?=
 =?us-ascii?Q?CVWQX2BMs62NkVd9jPIZobNGvBxq7lgh1WwwVOccD42dS5XHc49n+T4kXPNI?=
 =?us-ascii?Q?Vw59Q6gGu6LVbHJuGhCxnCXE4+bAIamgA/8vGyT5L6luEsYwMOoteei8JB+a?=
 =?us-ascii?Q?Cf669K8PMT2wP9ug1sUeh7nCgt0IqbcRGHlfxQPK5PoWxgbeimniFhQOSlbz?=
 =?us-ascii?Q?WVxjf1LauUgDxebmaHyvOCTmCrjSfw1+ZxplFdRDhGiWR4dwMt5WggDg9a/N?=
 =?us-ascii?Q?aD6W0jVTgJR3oitIZ5MIJoIHkdIpenTg5uP7nnxLOWgFEszQpVkjzKFJhmyE?=
 =?us-ascii?Q?LyliDASmdihKIt3nZsuNqkmcARTFFb3SH1uCTiZRJjw8p1RjGiES15LqdRj1?=
 =?us-ascii?Q?ZsjxaxrlzBIOqMtRKznCzxwMwcy2/KHE3VSsWMsEwb4gbs42O8VgMVeh5yT4?=
 =?us-ascii?Q?x/WqgdR2YvJi/XGpPEUl6diZKp2bzpuKRTh8YQGET90n++MH1LTdhbl9EkbP?=
 =?us-ascii?Q?bouvK2IUvQxlGgo2e6Fo2vDitNyK+QWxxTYWfS22klFgOOzI/KRmch3PnY2l?=
 =?us-ascii?Q?jrPNXaGQzYnBwb3Bc9gaaKfgJYAllx/R8ZRi0vImEJv39Xhh0MvgWY/msw5N?=
 =?us-ascii?Q?4U7olTtS1AuxICY0rl5DZPMW227ZTlL9gvoqaInVkOho7YHG3ep3hZukbpld?=
 =?us-ascii?Q?hOVBc3UgOsJBx0hcvJL7HEXZqTdimU2aVER0eRW+lO6pru6jrbPD0Ig1iB2s?=
 =?us-ascii?Q?Gs2EmkuTM2yDxj95ZRROYHKIv7u6CR4yAkL2Z8Cr44wrUWntZPvO0TpYnNf2?=
 =?us-ascii?Q?3ZlyW258rpOgNCpTqPj4f5UZ4CK5z0NomcgnxLj6OH49SMQmFxGLdenmSnAo?=
 =?us-ascii?Q?5ptzazRpFPiCpq9QarnX58o3Vsf1kIZ0z6BYnUt/rFvTU33EwYz9atX8BDir?=
 =?us-ascii?Q?1H8XbkcggEMJugJEROUabfIYs5S4NHSI/ZyxoeC35LaHRpYZctZoJVAHvMfL?=
 =?us-ascii?Q?WqFhV+ur+rnrwZGEgQptqxn1pK3n9FzWr6iwqGI0+sMXQG69yKia5Ng9COGf?=
 =?us-ascii?Q?k4Up6j6MjVFLEw8JGLb2qrLXYCnPEpfqRaJQ94GDpqPRJ0dt+UmbceiOnHxJ?=
 =?us-ascii?Q?T/h1E+SdXxay2w1F6fOJqECrmhhaU7EcYpGSHWJuauRwFWDHJzceyFRISFAY?=
 =?us-ascii?Q?nyYqxW0eD3PM15LNe+QFZD2Y6YpKBgZtXDuX4IrZJlV4mME1fyJ01Akudg2n?=
 =?us-ascii?Q?sGyxF6t6jsSSm80NtZsZgYPT0d2Ocd6oqOV+ScHyjsn0FHejnNaUnM7EuhMe?=
 =?us-ascii?Q?F7Xc9MceO6sEhZ/qoXb53rgXZpNrfNdCCcNYKW9nQGA9TD8qKlapaMzu0YFd?=
 =?us-ascii?Q?q8SxBt3gW9EwNLcuSnHCgyTiFrz4CuwR0E5E4mNSdQkCpPK4CSvT?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB15619.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5ee1ccd-61b9-4846-9416-08de5eac271b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2026 20:31:01.6647
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mtkvEjqo+NZqII7tEUlIeVPq9FcIBfP3vXDvdZrOc04qwPfAVbdKCAdbi7KoLl+9xOHG7kVnT397K5Yja79zX64OADfG4Djj03fl1vtE6bt9lXOgq+G/qVdhH1cMbJIf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11258
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,glider.be,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-27568-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[renesas.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cosmin-gabriel.tanislav.xa@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,renesas.com:dkim,TYRPR01MB15619.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: B7D3BA8975
X-Rspamd-Action: no action

> From: Conor Dooley <conor@kernel.org>
> Sent: Wednesday, January 28, 2026 10:09 PM
>=20
> On Wed, Jan 28, 2026 at 06:51:48PM +0000, Cosmin-Gabriel Tanislav wrote:
> > Hi Conor, thank you for your response.
> >
> > > From: Conor Dooley <conor@kernel.org>
> > > Sent: Wednesday, January 28, 2026 8:09 PM
> > >
> > > On Tue, Jan 27, 2026 at 10:17:04PM +0200, Cosmin Tanislav wrote:
> > > > The Renesas RZ/T2H and RZ/N2H SoCs have multiple DMA controllers th=
at
> > > > can be used with the RSPI peripheral. The current bindings only all=
ow a
> > > > single pair of RX and TX DMAs.
> > > >
> > > > Allow multiple DMAs by only restricting the possible names of the D=
MA
> > > > channels.
> > > >
> > >
> > > > All '.*-names$' properties must conform to the string-array.yaml
> > > > meta-schema, which requires both minItems and maxItems properties t=
o be
> > > > present before the items can be a schema. Otherwise, the items need=
 to
> > > > be an array.
> > >
> > > Why is this in the commit message?
> > >
> >
> > To provide a context for the maxItems that are needed below, even if
> > there's not really a maximum. Which is why having a maxItems does not
> > really make sense but it is expected by the meta-schema so we can
> > constrain the names of the DMA channels.
> >
> > dtschema/meta-schemas/string-array.yaml:
> >
> > if:
> >   not:
> >     required:
> >       - minItems
> >       - maxItems
> > then:
> >   properties:
> >     items:
> >       type: array
>=20
> Right. You can probably remove all that since I'm asking you to add
> actual constraints to the property.
>=20

Okay.

> > > > Declare a generous maxItems of 32, which should be enough for 16 DM=
A
> > > > controllers, so that we don't have to update this value ever again,=
 even
> > > > if currently the maximum number of DMA controllers on a Renesas SoC=
 is
> > > > 5.
> > >
> > > Huh, No. The binding should constrain this to fit what the actual
> > > devices do.
> > >
> >
> > Should the binding for SPI be updated if a device ever comes up with
> > 6 DMA controllers? It seems a bit unrelated to me. In this case, should
> > we constrain the number of dmas and dma-names per SoC? Some may have 2
> > DMA controllers, while others may have 5. Please let me know your
> > thoughts, taking into account that I only added maxItems to satisfy the
> > meta-schema.
>=20
> Yes, I think you should constrain it to the correct number of providers
> for each device.
> Whether that's done or not, there's not all that much reason to set it
> above whatever the current maximum is, since the binding will have to be
> updated to add the compatible for whatever device exceeds the current max
> and the limit can be increased then.
>=20

Okay, I will submit V2 with per-device maxItems for dmas and dma-names.
minItems should probably stay at 2 to allow a specific setup if required.

> > > > Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.=
com>
> > > > ---
> > > >
> > > > V2:
> > > >  * new patch
> > > >
> > > >  .../devicetree/bindings/spi/renesas,rzv2h-rspi.yaml    | 10 ++++++=
----
> > > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/spi/renesas,rzv2h-rs=
pi.yaml
> > > b/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
> > > > index a588b112e11e..383e97f0dabd 100644
> > > > --- a/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
> > > > +++ b/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
> > > > @@ -57,13 +57,15 @@ properties:
> > > >        - const: presetn
> > > >        - const: tresetn
> > > >
> > > > -  dmas:
> > > > -    maxItems: 2
> > > > +  dmas: true
> > >
> > > This should have the same constraints as dma-names. You've now allowe=
d
> > > this to have 1 and 33 dmas, because there's no requirement to have
> > > dma-names when you have dmas.
> > >
> >
> > I agree, I will fix it for V2 once you decide how to proceed with the
> > other comments.
> >
> > > >
> > > >    dma-names:
> > > > +    minItems: 2
> > > > +    maxItems: 32
> > > >      items:
> > > > -      - const: rx
> > > > -      - const: tx
> > > > +      enum:
> > > > +        - rx
> > > > +        - tx
> > >
> > > You've changed this to allow 32 dma-names, but they all need to be
> > > called either "rx" or "tx", how is a driver meant to use dma-names to
> > > get the second pair of dma channels? Shouldn't anything in excess of =
the
> > > first two start getting numbers appended so that a driver can actuall=
y
> > > request them?
> > >
> >
> > The DMA core handles multiple DMA channels with the same name by checki=
ng
> > their availability consecutively until finding an available one.
>=20
> TIL
>=20
> > I agree that this is not pretty but this pattern is already used in the
> > bindings / device tree for many Renesas IPs.
> >
> > There's even an exception inside dt-schema specifically for this.
>=20
> Hmm, I see. Can you please put this into the commit message cos otherwise
> this looks really strange!
>=20

Sure thing.

> >
> > dtschema/schemas/dma/dma.yaml:
> >   dma-names:
> >     anyOf:
> >       - uniqueItems: true
> >       - items:
> >           # Hack around Renesas bindings which repeat entries to suppor=
t
> >           # multiple possible DMA providers
> >           enum: [rx, tx]
> >
> > > pw-bot: changes-requested
> > >
> > > Conor.

