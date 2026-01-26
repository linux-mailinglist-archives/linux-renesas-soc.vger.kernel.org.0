Return-Path: <linux-renesas-soc+bounces-27449-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLshMNCdd2n0iwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27449-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 18:01:04 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 543DD8B36D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 18:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9E1C13015AF3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 16:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24651347FF8;
	Mon, 26 Jan 2026 16:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="XfjgkX41"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010054.outbound.protection.outlook.com [52.101.229.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBB3346FC3;
	Mon, 26 Jan 2026 16:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769446544; cv=fail; b=B3fEsn4tR8h9J34kXQQCMoT9sYzrqnuILbmGn+0Ej4TXW9LbC3QSIzb6GOlDrd9tyVBOoGnopuzYGopKPWwwUao+LRV1CJ7lokJQ4owP7feCdHastsSGFVSJaUPnw0VyH1F4+t49KimmHKf+4IeSOdSVcQ6ZUEkEXk8XOBgN5Fw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769446544; c=relaxed/simple;
	bh=APryLf7x6vejPKDPTXuuUip1h0bTO7FcM9g8CR9Otg8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XKUUIZ9qie9di+b65FWBewHFrB6ma9kindvM9VA0ClxIUKmSBiajjYw1zTLpJ6s1xVRfq6pqnRNEU3YtOl5kTyyrYMRJQO60NtbYbyJx4ffHAbK0f5+kywBGTpj9BLzxO3xiHGj3fAxYrszf5JvQStEYhIdrePQNgKrrihjVQKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=XfjgkX41; arc=fail smtp.client-ip=52.101.229.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=phQxHr/Cc+dkN2htMB+gB+/Jj0PDmDgzFrMnxsU306X4qPCUh66EIzVKIq+27lKknEk9zjf6uhUw0pmYHfiSHeHZcbKcy7AcJWsp+xmht+4p0QeMJjfZFTwJloS61GoQokW1Og18/nEJPmZYWK4nOywQ6SxYX8LGQuIS8F6SrBr+HVdsD2q4/NgZ0kTy1HQBPW5C1cygy3/Lc8KRG0603cCdqhPz8O8uNqv12WhvfZ8h+BeD8rqudL8A5hCxdvgq1K93mcAeYXtaqNEXkUBKffMO4W7HHmkvNpeLaryJJwyeg7BFCjBczXZbzYMt6yGhhoN4CELO/OlswzA9fKI5rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YlSTjAbo1b2q2iJ2QHtp73EHE54IxtOQVSzyxTTVmBk=;
 b=mUFdO6b1PitPrS9/7p1q7Cl8PHALRaCRo/pITmbclCrblzEQtwj99L2wxd/rudEfT/lAH8qZP2ImAOQX0MmjW2LwDRvnLadTXUdKEKDUvJ4ytvuo84KWq6L+m7FdivSaIwKmgpb+F3J5Lz5yanQdbdhZVp+/DE8n3SOJhvPd9wL7LzjYOCW/BE+UHDdJm2+Vl7vdMYfERI5t0qxE3ewaFnUVNRXkqU9pkcI2f8Yje9WWlpzRwf0UBIgkCz5jUFQvVKdWAJgZkwOfHbJqA96Te5q1WzAA9I2CHGfAr571lO0bX3zav4iCqnkm5w+3HVuTgihIs30lj2HwjhPpAcuWyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YlSTjAbo1b2q2iJ2QHtp73EHE54IxtOQVSzyxTTVmBk=;
 b=XfjgkX41tHvdhGj540U/L6F1skDn0nMDenhR5cEgycbxno5/wOz8r49WZWGCuH4A3PyXCzzqN6LGBaGh78WFv4ONqj4QrHNuXMOfsfmOBZGJb4YMQTumo4AWRTEdqm6ocwILbQrC7JjZSN1thjq1Bz6uufVtHkv9ZdnmwMJpG5Q=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB11303.jpnprd01.prod.outlook.com (2603:1096:400:3bf::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 16:55:37 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9542.015; Mon, 26 Jan 2026
 16:55:37 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>, Rob Herring <robh@kernel.org>
CC: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, magnus.damm <magnus.damm@gmail.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>
Subject: RE: [PATCH v2 06/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie:
 Document RZ/G3E SoC
Thread-Topic: [PATCH v2 06/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie:
 Document RZ/G3E SoC
Thread-Index: AQHcjHDWJvIbQMI8j0WdDTFLzZ8lCbVkh/cAgAAl6YCAAAFEsA==
Date: Mon, 26 Jan 2026 16:55:37 +0000
Message-ID:
 <TY3PR01MB113462A7C72AFBE24F2B117268693A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260123140031.94752-1-john.madieu.xa@bp.renesas.com>
 <20260123140031.94752-7-john.madieu.xa@bp.renesas.com>
 <20260126143114.GA2223879-robh@kernel.org>
 <TY6PR01MB1737770235BF9F3D29E4E71DAFF93A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY6PR01MB1737770235BF9F3D29E4E71DAFF93A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB11303:EE_
x-ms-office365-filtering-correlation-id: c365b57e-5f98-489c-36b2-08de5cfbbad2
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?DQV6wWwYNGvW8U4g6J+5wQkj/wG0Fpxjevz1CNSFfVNPK9zRuuU9Sy9ddr78?=
 =?us-ascii?Q?qpnYL6SzTSplfYxUJfTh34h83IRX4vkNVTOlnz9Q7MHCJ/mw9RjIEdc8Sgp5?=
 =?us-ascii?Q?2/oSs5LOSwI0hpECSJxSMItgYlC7yRXnXOF0AebJLdcmGpjHUBWAFOM4cnLI?=
 =?us-ascii?Q?mX5cRcgFjlSxM7mFvq08i1TVERcOqBqSFpq2jy53N+nTkYzFH+w7g1h6n4En?=
 =?us-ascii?Q?KwpZu9Mstw8rBlOwNLdxMlg69tRY3iuVP7kv0YI1CWiV3x9Ub2LQKjTRNlZY?=
 =?us-ascii?Q?gPQxWiMIo5S0lAPfyLhxqFsSy+h/+AoiLPRR2RCsuJ3zOQk+Eibhk6Uw8lrl?=
 =?us-ascii?Q?ww1hiWpChhMTAE6iK6U3SM+vKnEVrvkRnBunlMHMKFPDwJafRWU9NpX3awTz?=
 =?us-ascii?Q?OQkMtJjwv/V3I/MHVMFQtzAYN3fuf46aErfg+kHH4YNBLrSHpxcpn2lxJBaw?=
 =?us-ascii?Q?bc7iSf93zdwam7bBgGru/h/XdJ5WkOOKMI/HiBV9s/WEyS3uX3AVMWtvj8ck?=
 =?us-ascii?Q?E9UkzNBO+9oBUIhymQ1QOdJ/n6I4VoEA2fTt5npTm4IvuHSZ3uuU/+ObENrU?=
 =?us-ascii?Q?8S1tuA54O9UhMi6jDdJb+gRcUWcYNuYUnUUc6CCXsZh7Z4dw4mXDfupb3TLl?=
 =?us-ascii?Q?YwhjYMaqq0lILW8BszP5kL9TwhD0CHCH4xDfucSE0ucxRpmitXR4FeXwWUvX?=
 =?us-ascii?Q?lXi300GSZcDmxfFiPDEY4Xq9Ym9GIpV6DLJ07sdUViSSKXFOvj2PwDvl2uCv?=
 =?us-ascii?Q?HSooFPefLlUOJZR5sw/pYzf6mFa3V5T9/7kJp3nLvjmTUv2uJZ0JMOZGpqpG?=
 =?us-ascii?Q?Sz1VpKf27A+QcYn6JkZDlD6YGYBX+uIxJN2GPny6EbgdtjtSfaL7h+B/+tV9?=
 =?us-ascii?Q?06pzI0Ii8NynXIKKvaXdPJ0lWVlRpe4w8xTLP9Udnv8nd2vbnHhywfeD185H?=
 =?us-ascii?Q?SWiTUMwCp7JvGLZbRrfoFxKVQaytIjzdKL9iG3f81zjDe22TtTR1CFIGvEV0?=
 =?us-ascii?Q?pCHzv78PSO4haMqf0EMQ1PpOXvBMoMnoKhewYJEf20MmY3Ll8x901u75q32V?=
 =?us-ascii?Q?I5LuE44S4Lo6Qfp+up9AdW2yUGV7oV/2nUJJLvSOxeUtMrwwIFiVd0Tyaxev?=
 =?us-ascii?Q?jLIpAzJcnj0D2Z6MKZC92Vet65Pwq75XdgzbhXJgKpy8IrGwkv2Gwi+Wtwkz?=
 =?us-ascii?Q?s3Mpj8vC0NZv4SwO+hGA880+ZOe+XIpMpIqqf4HE2+bSB5gI8MhRsxQ6tI7g?=
 =?us-ascii?Q?4CCdnjQVO5DPl0OMXERIiexM4rME421X4uc/aS5Mu8tcHb58uciJwfE9tSlX?=
 =?us-ascii?Q?4XzhEa5BhUA2XORG3BJZAnZkojwg8YFo1X8ZKlsNUWHlNcPFPBBOVr1V1yc2?=
 =?us-ascii?Q?E6S73jKwNoqdlF7aXVzxHz2N31aFaw6svWbirhCifVA5b3MTjnutwhmwccWY?=
 =?us-ascii?Q?t4ds6nL8u9dXkyBiSDKPS50UNb4W96sT8fOTYwIfrmz0Tpa0oj3T12ZTjrG/?=
 =?us-ascii?Q?NR7HULekBzju4/VNlB8MTKk6gm7cwVt6LN7T21nbxQcmzkH1FgYGDjUv96Xu?=
 =?us-ascii?Q?of9VmRqVmoxIFYqPUUouXPxRRMBaK6ShEyssqK1NociN2QQ9Wviv0CxASJkD?=
 =?us-ascii?Q?7gX4B9412vMTDC/tgDvT9O8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?8bd7fHcM3H3eQEq/3FVCFIfpN6y9zb14TkSrvDLaPJkFRH0kiFBpvtzPSOF0?=
 =?us-ascii?Q?+J8Fd4BrB1fV7ZveyDtfzpLBN2ySyTMv4Oiyvr4ydDt2LxXaMI/8EanE6W2F?=
 =?us-ascii?Q?FgCfZl62ITyeqCNilo3G21bE0RBcpMrYzuCvQ9ecUjKjAg/Ebhc45ECN4KUJ?=
 =?us-ascii?Q?+rbs+xr72wMBACgF7/6fF3nBpwDmm3NWqCNxUjGf0IKWMQ/VqgMFFbYr7kuX?=
 =?us-ascii?Q?0zfww4NRTW7/HngbjuFCWkQd28j+xH6CAugoIKbPtFs8cvMx35DiaP5gisci?=
 =?us-ascii?Q?/a7ki20310OhrSQZ/VBt+HZsVz7hbwWvHnE09ULEiPJKvimghZT24uCgt8s/?=
 =?us-ascii?Q?ezRjL93WZG/EcUUcD2mPesweZkwGhUx3w2peHmv7YALbv+bdsmhooQ/bkTAr?=
 =?us-ascii?Q?Vyfbw0ocSB1xIA462A2FtmO1FzqlD6uBTypj/eGs0XpgUSxaKn9hTrSY7Pbu?=
 =?us-ascii?Q?hRXPmuchb4mNT1SoekqyY9MVmeZcg5youAAu641MaK73Q7LRc9ewvgU2/qhB?=
 =?us-ascii?Q?Ve8vkOKRnQrwpDqX6hTBLdbVL/iYj+dYr4YZ4prpMq8LT6Sh7UMge1kHsU/z?=
 =?us-ascii?Q?5Wz6u693H5Focf0ildW0a3+uJlXDsThhQYKLbxuYXhLpSjzaqu/a+QgXiE8f?=
 =?us-ascii?Q?i0asjomuUePN6FPexzJNb0xx11zDMnblwOt+cEoRJ4URtHfO8XUEpu86tViI?=
 =?us-ascii?Q?710W2zZZFgyZKnYaEhPbLy7T/nwIik2UiYCZmI97jdCfHyp+1iVzc1vKy6eK?=
 =?us-ascii?Q?hv55cQP9/+eVA+QRPg68YVxyW1sIrhI8uV2sgJpSmG5Plv0wDxVurtMDVLwL?=
 =?us-ascii?Q?Ix8MmFxgiIfXRz7pnciohKQQYYHfoodLDQBM9IdzeuVYhzahqtzXGJcysYUH?=
 =?us-ascii?Q?wKQcVhCjQJ6w6qdLmKxBNCKPC9IpCg18lbjqFYTAzSVXbKfI2y7JoxtlqdgX?=
 =?us-ascii?Q?BIkVjT3EX0NesNonmcrf24sbQXGS5BqqWV+ir3UxNa/fpePX5wBqd4BDrI3T?=
 =?us-ascii?Q?7AXZgKFEYoWewTNn0KhIFikTgl8gWFpokImVedZc+52WXjdYiVcYHjHfrHNE?=
 =?us-ascii?Q?uTfrrFqXphQjxsMGAPw9/tbw95pXPlCzlqt2ycqwqEk0Rw16S4v1RIhaY2rk?=
 =?us-ascii?Q?Dfj2OE5xa10EM61fh3+Ns30eRTqLCmprSSU9L07dUmOp0O9d3uglabd/g+KE?=
 =?us-ascii?Q?0UqHCdVGOQv/XI7GgxbDBexDED9JgZW73N61g1rc8xkY5LKElpd0mZEkZWWB?=
 =?us-ascii?Q?1FDBKkOC3V2y2LGKUS82qr2fxrULO0y1F0/uK3Wu/whFs6e5vwDEn2fYwago?=
 =?us-ascii?Q?Vw3ZVCYGCgrPXg9d0S1w0w7S+WJPoBmftSx5EZltkLR4G7L8KoncNZYtemHC?=
 =?us-ascii?Q?fQcklSmbzmcnAxmk4BL+IOEkgJTrhcUhNyPRd2EpkoANQPKZFbWir2G7hBp0?=
 =?us-ascii?Q?iLLHby6U9I1eKJnk1hbh/I6JQ+6RYe3TrqACT/FyGYli0s3SkmJAJg3AsIDI?=
 =?us-ascii?Q?xpd8AHqw97WJ+nBfYxVRT4xhrWoSO/xKnhjUz395DcLrY1Gl1meCtZZse+k7?=
 =?us-ascii?Q?6pQCg6uCZI0P4nkL079Lx+6T6zjyrsO4ZpU1KYmJZKt/tl8w+m10F75SpL8X?=
 =?us-ascii?Q?ED+l8OI6VG6u52bvx1Fe+venNXCIRgqMcIiLD/zOq8SISMT/QVPa9ZKroB4R?=
 =?us-ascii?Q?wnVeFfDA7BeDD6DlJ81SAT5WRsjSjKD5KlZtp1EGPGFDN4eoNGHejKHMKWzH?=
 =?us-ascii?Q?yjOvilqzFA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c365b57e-5f98-489c-36b2-08de5cfbbad2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2026 16:55:37.3637
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dCDAU7KgXV+A5Jpl9AeTA+lZTMOUkLFE9Hk7dZXX5Nxx4fKzuyuxgBBi/WnV2O3URLOYuEih3UqL1+Z38OlTCLD9VzkHZNX7iAAIg0VjjDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11303
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27449-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:dkim,renesas.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 543DD8B36D
X-Rspamd-Action: no action


Hi John/Rob,

> -----Original Message-----
> From: John Madieu <john.madieu.xa@bp.renesas.com>
> Sent: 26 January 2026 16:47
> Subject: RE: [PATCH v2 06/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie=
: Document RZ/G3E SoC
>=20
> Hi Rob,
>=20
> Thanks for your review.
>=20
> > -----Original Message-----
> > From: Rob Herring <robh@kernel.org>
> > Sent: Monday, January 26, 2026 3:31 PM
> > To: John Madieu <john.madieu.xa@bp.renesas.com>
> > Subject: Re: [PATCH v2 06/15] dt-bindings: PCI: renesas,r9a08g045s33-pc=
ie:
> > Document RZ/G3E SoC
> >
> > On Fri, Jan 23, 2026 at 03:00:22PM +0100, John Madieu wrote:
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
> > > v2: Reuse G3S names
> > >
> > >  .../bindings/pci/renesas,r9a08g045-pcie.yaml  | 127
> > > +++++++++++++-----
> > >  1 file changed, 96 insertions(+), 31 deletions(-)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> > > b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> > > index df30f729d4b3..9565f1774720 100644
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
> > > -38,39 +42,54 @@ properties:
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
> > > -      - description: serr
> > > -      - description: serr_cor
> > > -      - description: serr_nonfatal
> > > -      - description: serr_fatal
> > > -      - description: axi_err
> > > -      - description: inta
> > > -      - description: intb
> > > -      - description: intc
> > > -      - description: intd
> > > -      - description: msi
> > > -      - description: link_bandwidth
> > > -      - description: pm_pme
> > > -      - description: dma
> > > -      - description: pcie_evt
> > > -      - description: msg
> > > -      - description: all
> >
> > Well, that was really wrong... Fixing it should be a separate patch
> > before adding the new chip.
> >
> Will address this as separate patch in v3. Thanks.
>=20
> > > +      - const: serr
> > > +      - const: serr_cor
> > > +      - const: serr_nonfatal
> > > +      - const: serr_fatal
> > > +      - const: axi_err
> > > +      - const: inta
> > > +      - const: intb
> > > +      - const: intc
> > > +      - const: intd
> > > +      - const: msi
> > > +      - const: link_bandwidth
> > > +      - const: pm_pme
> > > +      - const: dma
> > > +      - const: pcie_evt
> > > +      - const: msg
> > > +      - const: all
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
> > > +    minItems: 2
> > >      items:
> > >        - description: System clock
> > >        - description: PM control clock
> > > +      - description: PMU clock
> >
> > I don't see 3 clocks being valid.
> >
>=20
> If I get it well, I should use a generic description here for the second =
clock (keeping only 2 items)
> and specify exact description (PM vs PMU) per compatible.

The upcoming SoC, RZ/G3L SoC has all these 3 clocks.

- description: System clock
- description: PM control clock=20
- description: PMU clock

All SoC has System clock

G3E and G3L has PMU clock

G3S and G3L has PM control clock

Cheers,
Biju

