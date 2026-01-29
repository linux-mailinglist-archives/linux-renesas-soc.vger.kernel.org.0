Return-Path: <linux-renesas-soc+bounces-27607-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGRxDYpee2kdEQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27607-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 14:20:10 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D8BB052F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 14:20:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D40A53019C92
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 13:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D837F1FE451;
	Thu, 29 Jan 2026 13:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ZmTLJFmy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010042.outbound.protection.outlook.com [52.101.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73DD1D5178;
	Thu, 29 Jan 2026 13:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769692804; cv=fail; b=lMl5wUnFQNQtIQnadNOhuFdUSMjQ2FcpUHsZI4dIIMTLh60eQTq9Ha0SXsfSVHngo3mZlAEvf2kt9iUVBz5mMkuOVvkukSGFsudhk7JNXm0UGNX8LGlX8SZztnO/4AjVOLce08lavUe8lw7B3wLLqNV/v29KW3bEdzLjiWbSRgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769692804; c=relaxed/simple;
	bh=f2EojiUY4iZNtSOILfbUPOBTzP98T2X3LtyX4lHKFMI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GRU9/5ASZcS2pxWZDI2f5Ax4NsdGo3PUD135mUyVKakIOkbo69SQO97OU0kUTLwpujFEAOMJq8zH+vbl8mLRm/ngd9OJgmbLiYQlmJpqaYe9inWu1uyNmtqnuLCunnsxy5aWSNbprgBpRy7zYsyj+21fJVtjILiwrXT8DxNdZIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ZmTLJFmy; arc=fail smtp.client-ip=52.101.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=siGDKOkMDTj4Nu8a/Rk79xD72qSUW6Ne74VY8JTjDxgFK8qqZFYMasBQgXxzdyv9XUcn7Gwzhmx4VKYK7PEDtY2XXoDvFBqBHYh3IsUcWVD5P1/ZjcXpV5zjdlDBo8bB1lOefbe+NGo11Z3a2/451CLPdlOIupy+h+sV2Rix5pq4ic2GnC8YKdtXvvBgS4IZQxqPGEaEjOF0gUYkvYQ1wYbmQghTIB0Z8DqhNGCySIxPnUMq4g/9gxNeWKk16kXKyW7VocPy04O0UjLKt4JYkwrzicAtImhUtm9iEWQcM33oi+92q3kWubp6/NvUaG7sD8jsXrjoIqhmv/3OZAY0ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VvNRTsyUj97/s/sZlAbCH2uElCaczDCBeKikH7fJ/Jc=;
 b=ObxMUE9IPXn7UpBbs+KFq5rA1s9IN2seumgrcUhlVtTr0mByyjWxrdy5i8zCDobPv51x0L19ulfN9T03EnGYDwETALV2Y1IDxiPT3W1Zp3hp8VOjizbH5o3qtgz4b8kUoTM13jRIbkFeqPKnzP1C7gGi0++pNVo6Tfikadc27x89CVK78ajZtTuxZhIfAMFBlJtIlROuz9tYpEgEa7byK2z5BHOZ7pwd87+VDU9UDES9n2KC0UA17HDPK27MEnlpvDg1mtOxI+zqVHTRJIO4U6ECWuxSlPbmJ02pmkByouF+Zbxd94wePcXVt+aOvVhw95j5hHaPnscQAxHm01DCOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VvNRTsyUj97/s/sZlAbCH2uElCaczDCBeKikH7fJ/Jc=;
 b=ZmTLJFmy6h65MHBbxr5lWHtXrqYEdfRedl281LYZVzD7QirV/b5QUwXUDv04xZdRWsuMrgM5NUolF1cS9MHkaUc5J16ovyYpAQ4Pgwyisessmz/1EBO8uVvK1A2jWKwETiWxMBUOiwlxv2XVMZQfTXk9YP9Xngdc98ttSidFtMU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB9750.jpnprd01.prod.outlook.com (2603:1096:400:20c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Thu, 29 Jan
 2026 13:19:55 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 13:19:55 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>, Conor Dooley
	<conor@kernel.org>
CC: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "john.madieu@gmail.com" <john.madieu@gmail.com>
Subject: RE: [PATCH v3 06/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie:
 Document RZ/G3E SoC
Thread-Topic: [PATCH v3 06/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie:
 Document RZ/G3E SoC
Thread-Index: AQHckFiDnpgJp618gE6ral+EOPGvP7Vn2aOAgAFCqICAAAVecA==
Date: Thu, 29 Jan 2026 13:19:55 +0000
Message-ID:
 <TY3PR01MB113463F7E7E5FD1F5D71E2F44869EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260128131647.120511-1-john.madieu.xa@bp.renesas.com>
 <20260128131647.120511-7-john.madieu.xa@bp.renesas.com>
 <20260128-chaperone-hydrogen-421d911b964b@spud>
 <OS7PR01MB173719D8E22176F897D0757C1FF9EA@OS7PR01MB17371.jpnprd01.prod.outlook.com>
In-Reply-To:
 <OS7PR01MB173719D8E22176F897D0757C1FF9EA@OS7PR01MB17371.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB9750:EE_
x-ms-office365-filtering-correlation-id: 2dabf044-169e-4bed-e420-08de5f3917fd
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Nr2CFdkgVY7OhuGTWfxjl/XwgBrPmVPmGlXejZkPiI0t7Qnw6BNr4bhoRxfv?=
 =?us-ascii?Q?prZgMwhMon+VYS/6y1KRlWVKhW7pYAdkeHU6eQxOtCfRzg+IfvfFy6S3O+ZC?=
 =?us-ascii?Q?018hnGeHKB69HvyiKItouyVJrZx8uH+tJ9Pqmqgb82fYctiKm+RNnj9dZGoE?=
 =?us-ascii?Q?0WosAm52wjm2wTCzJyvaAIQKD6geXSSfhgmVXQVT9nlGawtRUOj277agPWJY?=
 =?us-ascii?Q?vAE78HlTFXHQSgFldOdMFS47FiP8U/7k5lIXwRvMoqoDrPOi+BE8ersLTKnQ?=
 =?us-ascii?Q?91AjAhGQqPecMandkLt5ZscYlqR1cN+kAU9IUWuAs5Jc4fOyN3IVFceT4vKc?=
 =?us-ascii?Q?fSUNvqAkZPi3tt274pJpyLeSsgtmxDeG1mGSg0y6zZSao45eidnJgg+rEtaE?=
 =?us-ascii?Q?jQIAXL8Hx2tXxEcFQD0NMsWAZxM5GX3ZoCPT82J+E5eLrzK1u2CwV3Sp2l5u?=
 =?us-ascii?Q?rHKkceGAbeKpu5yqWrx4zI9gmj1i7/65iaVUGhLiSy7NfI53rNMsoiTND/od?=
 =?us-ascii?Q?+JnhyMz5hKVhrP9vnwMK9xVsCHmH4Xg+SCg2s4qi/iNo/b7ZLqkMdcWCkK/6?=
 =?us-ascii?Q?PpJ3Jm/u3S+6Sy439ab8WwjJdEZe/mhoSAmhe0X//yy7gxdQx9Rlw1Z2Hz08?=
 =?us-ascii?Q?Y7pf1b3W/SBwSCtNV0134mLzIfhDbkEBW+lSJQNkUFfl7zaZSJKgK/aByME0?=
 =?us-ascii?Q?qbODBqfu+3A6Xc188RVgzxrDWzjNiFN5J2GFSGd/gkRQL9y16ip+bk06taju?=
 =?us-ascii?Q?sgYTcj7snvik35f+OZ1c8njeD53T074X232PAr/4Gzclv9SJJ6vq0XrxHD6T?=
 =?us-ascii?Q?l1ZaLhRc3JR6GhYy27smzo8LTA/XBkTZCFJmfHYBmre33W611Xy/0UeXc0oq?=
 =?us-ascii?Q?LW7cFIZLFtQBmoS86urq+NpdTC+AjvLl2nXp1PSxd8XvsyH3GQEQzIBINReC?=
 =?us-ascii?Q?IJ/vRtvJiRMlTjoLVtgqOTpL1w1IWrLJ4Ubgfbu/STIkEgKEXqnhBWEFZ3DT?=
 =?us-ascii?Q?d4Qms6hcpcjk1mUOcDCYPdotqnweuqjZ0NWlsza6MT0MDRcbG2gSRXtjszK7?=
 =?us-ascii?Q?1WGHq2T6K3ifyGdAB2n/84V2u5hKoPEOV620kDD2UCHzwa0RaTmzfZGZI7og?=
 =?us-ascii?Q?FayYYcvY/jFj/ctVeOadQHqf+Y33iDSNtztF7BqJXCEQzgJTv5+Wy2dsC2Kq?=
 =?us-ascii?Q?Up8HAaXxZWn82JUQbwp1HeHCKUzxFxcB9ICPNLba2vcYuaFCQ66HeCjkGmKV?=
 =?us-ascii?Q?0qyKor0yWkyDMs01upS6RtSSKe56eckll02OyN7hehrDZ4cvohC9nfT1fc5z?=
 =?us-ascii?Q?DRpVEaUgg1K5zQ2q/2jmyD/0YFK4eniQV1qjYupzm0XlCaiNgEziEJ23eh+e?=
 =?us-ascii?Q?Nw+h7QxULmr2nMDbORIuWJHnrv+Jz47rbtImAgbSCFMOtbslYYQEeLWTnh9w?=
 =?us-ascii?Q?ERBkIFyefUvhWDrFexFWYqa0JuoOMlwFYkBF0TthMLCejDckeEhkRzCIgA3O?=
 =?us-ascii?Q?7s8DDDWiEEKG1xuMYJN84cl9QjWvk59N1UrTfPAC9FP2qh44lIIjvxGeQd2N?=
 =?us-ascii?Q?14EVdXF5gGPiH0OtApADghnFJS5U6cL955m/kY8z/RT9rhFUQs3vVs5OQc6b?=
 =?us-ascii?Q?DW8Ab23l6TO7r/4wpPWZKy4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?2D50/yjZrTmiUTueThOU36AIgFI1ozk1r9KW8K7Fo1C5t7igSPHVGb2O62Nj?=
 =?us-ascii?Q?pG8emUw1U8N5ntwCSNbEjP5IZbra3AOAIf6ne+a021tJvoYjNCOQuXTnon0I?=
 =?us-ascii?Q?IwpiD6jkKseAn4hvSyXqTQ8pys67g3RG5tBVs61KlFvQc4OI8TWLm7zkbxW5?=
 =?us-ascii?Q?mV7ERlHcEoOFHTIaACBh8nZWEIl9kK6H5uMZfXHGK50jRrxS2zDAnCOhS7Cs?=
 =?us-ascii?Q?S3W/LUupdIsh2pWjGG+RqUuw5aa7GR0IJA4rHE6cpngzvANKeYn1fI8iMvNB?=
 =?us-ascii?Q?5trgRksaaojZP9VepOIVLRlhX5uJKmsBQDHOZA4tEg/B/U4SQ98g7pubpyKJ?=
 =?us-ascii?Q?0f5n/NnL5cTbv0sZ8UEC7LbEw+JdO6MbNklJk0N3jFW6COMs+oCxlBv1qzpV?=
 =?us-ascii?Q?RDNoPQwKvsvD8BCL7qFTWLB5TMcbYK6dF4z4jsM8v9Ho1YPB9ZdQQ7Ux2feu?=
 =?us-ascii?Q?zI4s6sel5c9cZ4lWthmgqlaWY+EaQpUR136S/uy6QmaimZIMdUVdsqTjhUvZ?=
 =?us-ascii?Q?jl98aW6jniU/prP78HUAuJggZurbwf/i4zvI5KJ6tu5DV/VkZHUkHhoUbxJJ?=
 =?us-ascii?Q?PL0V0jsBgBgEpc4fCPpkGD81zlSG/35fwsr1+mwJ+eGknlUF3pRim5CszH3L?=
 =?us-ascii?Q?ZeVFWog06PFJ63lDe3iXtkvL29dDYOfy8vrFQFRNapWB3VDaeNcKyKpox/KD?=
 =?us-ascii?Q?Ay3zBPSgZspjU7SMExoHJZzHXMaedb7oSDXdUyahfT3NVItBCHkVOoxk9e2R?=
 =?us-ascii?Q?jYU7Y6glaAYn6LF+DFm4F5GR05qCNHGyN3MAJeHoVC+V6887CquKct0EPUDF?=
 =?us-ascii?Q?KRzIr1dWzmkyalFZySgmEXtxNmzwfqUeguw/1csYwjoXiplxdMSCcM29fk5M?=
 =?us-ascii?Q?nLZcGV6VjjBag5uc7oOx/ZZk2gZEKcrrzzu6eIrnlXfRhIDBpR0tHPquS+Eu?=
 =?us-ascii?Q?AndvSJyAKMZoFnMyMFINiReUXMtgvwgIojPYP6YyWjq4VtN5IhBOj/chqydo?=
 =?us-ascii?Q?+dLtW4RbVDka/mV14v3u3Cu1KPAFxc2dwEPc2uQ2LwiCVo49N6cndntNpIPC?=
 =?us-ascii?Q?uWefS6/jzApVbjjQhs+XNteN7llHt34b2RokNhZtA0gTRGYUjO/ym1OWJ/ca?=
 =?us-ascii?Q?IOO6aE2z527PmJq1fgngp2k6ECYOkP+qY0Cjin/yRknzUbp1Cqp3MJ9t5usY?=
 =?us-ascii?Q?iYNOugE9RpS7jiqTpV0rAV0IGmilPlGhitxLHp/RA0rQ4sgzskxcxE86iFmE?=
 =?us-ascii?Q?XTBOJIb4S6OnssWASDPmsztu5fCkAjmHC0QnYD75edXFduAE4Fk6iVDoAnX5?=
 =?us-ascii?Q?96RdJBmoT40TVtAN688/Nmh0EhFFE8FOWxzDbZYFsOppSZLX11wkzo//tzlo?=
 =?us-ascii?Q?7P+TQ9AyoGJzLtY7rTW1s3FQo5mtKgo/TF3uVGm23XPRaBT3OiwpOyaj/p5S?=
 =?us-ascii?Q?+QbPLv94xirX5sz5KdgLchu2jiNsMXYUwSSUmjTgulhbMEUhKHvnQJfKevMe?=
 =?us-ascii?Q?HMRNnTeWwZ6qjP31JbfPo7BNMsQPTS7xfUoDr6DrQLo8AnaXyfwZZoafuFzO?=
 =?us-ascii?Q?+GJqrWLVKtdeU+aa9v1rxGrTSDZyNWYyIL1kVk+0jiwoVPhKZ0L8OlGHCnTC?=
 =?us-ascii?Q?ig9MARNkFR2CKgxQmRIwajtRdaQtmWQpCNtSAkJ5OTTg3K1NbPWQ1HikJcZX?=
 =?us-ascii?Q?28y4WencEbErCzaheVDcDymlDJWyyUkffoBMe1UGt/7uETo2OaUi/pU3sNca?=
 =?us-ascii?Q?Jsy3XaJU5g=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dabf044-169e-4bed-e420-08de5f3917fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 13:19:55.2916
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BSGn5DerHK4Wuv8MbxOaf1VwA5/tDOlWoX1z3X0RxevhEE23zmNEpuEpltCeabl//NIgFLa2S0+4I2B0LVzZWtlidz0aoaXLnrvBjKu+mkQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9750
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27607-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,glider.be,google.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E7D8BB052F
X-Rspamd-Action: no action



> -----Original Message-----
> From: John Madieu <john.madieu.xa@bp.renesas.com>
> Sent: 29 January 2026 12:55
> Subject: RE: [PATCH v3 06/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie=
: Document RZ/G3E SoC
>=20
> Hi Conor,
>=20
> Thanks for your review.
>=20
> > -----Original Message-----
> > From: Conor Dooley <conor@kernel.org>
> > Sent: Wednesday, January 28, 2026 6:40 PM
> > To: John Madieu <john.madieu.xa@bp.renesas.com>
> > Subject: Re: [PATCH v3 06/15] dt-bindings: PCI: renesas,r9a08g045s33-pc=
ie:
> > Document RZ/G3E SoC
> >
> > On Wed, Jan 28, 2026 at 02:16:37PM +0100, John Madieu wrote:
> > > Extend the existing device tree bindings for Renesas RZ/G3S PCIe
> > > controller to include support for the RZ/G3E
> > > (renesas,r9a09g047e57-pcie) PCIe controller. The RZ/G3E PCIe
> > > controller is similar to RZ/G3S but has some key
> > > differences:
> > >
> > >  - Uses a different device ID
> > >  - Supports PCIe Gen3 (8.0 GT/s) link speeds
> > >  - Uses a different clock naming (clkpmu vs clkl1pm)
> > >  - Has a different set of interrupts, interrupt ordering, and reset
> > > signals
> > >
> > > Add device tree bindings for renesas,r9a09g047e57-pcie compatible IPs=
.
> > >
> > > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > > ---
> > >
> > > Changes:
> > >
> > > v3:
> > >  - Moved interrupt/clock description in distinct PATCH
> > >  - Fixed clock name constraints
> >
> > Can you explain why "pm" isn't close enough to "pmu", when it suffices
> > for "l1pm", and therefore the same across both devices?
> >
>=20
> Regarding using "pm" for both, the underlying hardware clocks have differ=
ent names (CLK1PM for RZ/G3S
> vs CLKPMU for RZ/G3E) and serve slightly different purposes - the RZ/G3S =
clock is specifically for L1
> substate power management while the RZ/G3E clock is for the PMU block. Th=
erefore, I wanted the binding
> to reflect the actual hardware clock naming.
>=20
> There are also SoCs (such as the RZ/G3L) that have both clocks (CLK1PM an=
d CMLPMU) as Biju stated.
>=20
> Is the explanation ok for you ?
>=20
> > >  - Updated clock descriptions
> > >
> > > v2: Reuse G3S names
> > >
> > >  .../bindings/pci/renesas,r9a08g045-pcie.yaml  | 76
> > > +++++++++++++++++--
> > >  1 file changed, 68 insertions(+), 8 deletions(-)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> > > b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> > > index d1eb92995e2c..d48187ca0849 100644
> > > ---
> > > a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> > > +++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.y
> > > +++ am
> > > +++ l
> > > @@ -10,17 +10,21 @@ maintainers:
> > >    - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > >
> > >  description:
> > > -  Renesas RZ/G3S PCIe host controller complies with PCIe Base
> > > Specification
> > > -  4.0 and supports up to 5 GT/s (Gen2).
> > > +  Renesas RZ/G3{E,S} PCIe host controllers comply with PCIe  Base
> > > + Specification 4.0 and support up to 5 GT/s (Gen2) for RZ/G3S and
> > > + up to 8 GT/s (Gen3) for RZ/G3E.
> > >
> > >  properties:
> > >    compatible:
> > > -    const: renesas,r9a08g045-pcie # RZ/G3S
> > > +    enum:
> > > +      - renesas,r9a08g045-pcie # RZ/G3S
> > > +      - renesas,r9a09g047-pcie # RZ/G3E
> > >
> > >    reg:
> > >      maxItems: 1
> > >
> > >    interrupts:
> > > +    minItems: 16
> > >      items:
> > >        - description: System error interrupt
> > >        - description: System error on correctable error interrupt @@
> > > -38,8 +42,16 @@ properties:
> > >        - description: PCIe event interrupt
> > >        - description: Message interrupt
> > >        - description: All interrupts
> > > +      - description: Link equalization request interrupt
> > > +      - description: Turn off event interrupt
> > > +      - description: PMU power off interrupt
> > > +      - description: D3 event function 0 interrupt
> > > +      - description: D3 event function 1 interrupt
> > > +      - description: Configuration PMCSR write clear function 0
> > interrupt
> > > +      - description: Configuration PMCSR write clear function 1
> > > + interrupt
> > >
> > >    interrupt-names:
> > > +    minItems: 16
> > >      items:
> > >        - const: serr
> > >        - const: serr_cor
> > > @@ -57,20 +69,27 @@ properties:
> > >        - const: pcie_evt
> > >        - const: msg
> > >        - const: all
> > > +      - const: link_equalization_request
> > > +      - const: turn_off_event
> > > +      - const: pmu_poweroff
> > > +      - const: d3_event_f0
> > > +      - const: d3_event_f1
> > > +      - const: cfg_pmcsr_writeclear_f0
> > > +      - const: cfg_pmcsr_writeclear_f1
> > >
> > >    interrupt-controller: true
> > >
> > >    clocks:
> > >      items:
> > >        - description: System clock
> > > -      - description: PM control clock
> > > +      - description: PM control clock or clock for L1 substate and
> > > + CLKREQ_B handling
> > >
> > >    clock-names:
> > > -    items:
> > > -      - const: aclk
> > > -      - const: pm
> >
> > and I'd like to see an attempt to keep an items list here, by making
> > the second item and enum if you keep using "pm" and "pmu".
> >
>=20
> I'll use something like this in v3:
>=20
>        clock-names:
>          items:
>            - const: aclk
>            - enum:
>              - pm
>              - pmu
>=20
> If this is Ok for you, I'll keep this approach with both names.
> What do you think ?

So, for RZ/G3L addition, it will be

clock-names:
   oneof:
     items:
       - const: aclk
       - enum:
          - pm
          - pmu
     items:
       - const: aclk
       - const: pm
       - const: pmu


RZ/G3S: aclk, pm
RZ/G3E: aclk, pmu
RZ/G3L: aclk, pm, pmu

Cheers,
Biju

