Return-Path: <linux-renesas-soc+bounces-16850-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E104FAB12E7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 14:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDC099E2BDF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 12:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851E128FFE3;
	Fri,  9 May 2025 12:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="J1lX4ZIK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011018.outbound.protection.outlook.com [40.107.74.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771FC27A925
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 May 2025 12:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746792275; cv=fail; b=CgMlaqoEGkVI3JRhPQYjk4ErB1YJRlIZ60V40ImLh64YhJfRqxEzkLoV8ojgPL412u1LYq28lGeFTyXKTZYKDoLiOQPr9oAUsSHHBv1D0/IhSiC8Lp1VqcgCGdK0LtQOeKgsxsOvAcUR3dSz6iPd8oR+hJzW2U0UCZpGpauTsYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746792275; c=relaxed/simple;
	bh=xWa9ue0ylQ2+bbAtgUwcSizNFMy1CuMAa/bYYTi/FaI=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=PBREooC56F7PZLMiJlQnoq+WOb/65A9KKmB/gwoMhPlUBBIlExzGSG6ButTN4JuMvwZqyPVMAAxD+LG8IEiXCZil7rMbyjtDy6U1WThlUUU91mYPls4umUQ9kBzjFweFr/t+vZ4eCc3RKY9LJDN3ot3MdgFA1YXUE4w5rSEVlB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=J1lX4ZIK; arc=fail smtp.client-ip=40.107.74.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pe+n474mdDbd7sntEeiTzVIJ1tKYKpTc49i2MQ6EY1QWvWfrPAAWTWdj4kirRr92hDKtJAIf97h4qEQTowt7ZEfSkdKB7uezL6SfVjDI5Vcc3s/FBgh/mbubNCjYzW9fyhejFT+QnTlK85WjwyQcbAzlkNN35u2ii2hUkslkbU/bxl8CZmNYa09m6SvAIo/nFifdz7IWonwdpiczkYoDejN1uFqCjyvLlA9YVb1OeCnudZhxnVorEpTVH+Lq0KX1TJecJX50m4guQitv+SGxWZsDRxhUMf+V6fV6vs23rFH1hWMfil+T5DUMeKdzCUe7ADtbhVXCWHYlblWftPrhcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AMkdPH1gsFRN4E6rQwAVla5o/n1ZVOsSuUjAGbPugKE=;
 b=PDTka8ZCF2lkxxnWG0GbCqkilbQ5e0l4wQak2k76gtxDOupYLnVfjogl2hhOGWhFACWSEsLmc+TUsaVgOCA1wKfyhVJN49pxqRfM3dcYYGS41L7dQwtIQ2NKu1RCzlh0/LRnT8TZPNuYp7ZN3rCx6gOmkoZP5tktCIxZYmk5Nhb+2p78FT/9GMi+0jRfyjZHiE7hkAPqQ90ep1lv9WiPp3pDJmm4eQYrQVPPWDVHkmspYaYIrZJ8Azg6a1kw4rClKimIqFfrj+YqvinrqqSTDd1V8SzRyso18VJeEQesyUUaducm5EGwDukUOiZa4YXRAPGD1AbkZmTI2uM9fXShuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMkdPH1gsFRN4E6rQwAVla5o/n1ZVOsSuUjAGbPugKE=;
 b=J1lX4ZIKKjvanCFmpnm54kIHb1zTSuP6/yuncI/CVm/CT79zD8zlLFFhOwHQj5Exft8dtwkwu4I14PGVCh2vgm9IurrnWXB1avL6f0JSxZu+YKWlg+KKnM+qUFHQmZtELAUMGzsZvB9Lhq9lZsGyZUnwLzVp08KVLa7twWq4Q3A=
Received: from TYRPR01MB14284.jpnprd01.prod.outlook.com (2603:1096:405:21b::6)
 by OSCPR01MB15842.jpnprd01.prod.outlook.com (2603:1096:604:3e3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 12:04:30 +0000
Received: from TYRPR01MB14284.jpnprd01.prod.outlook.com
 ([fe80::dc7c:6361:a82a:933a]) by TYRPR01MB14284.jpnprd01.prod.outlook.com
 ([fe80::dc7c:6361:a82a:933a%6]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 12:04:30 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH 8/9] Doc: devicetree: phy: renesas: add compatible for X5H
Thread-Topic: [PATCH 8/9] Doc: devicetree: phy: renesas: add compatible for
 X5H
Thread-Index: AdvA2oQJ2f2yTr6ZQJ+h6L7AIgxJZw==
Date: Fri, 9 May 2025 12:04:30 +0000
Message-ID:
 <TYRPR01MB14284F48E79FF2EC68133F5B4828AA@TYRPR01MB14284.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB14284:EE_|OSCPR01MB15842:EE_
x-ms-office365-filtering-correlation-id: d5e37349-ebae-4bc6-af7a-08dd8ef1a7a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Eodx3d9/V00Q1WyB41njyupx0D1UDN2IPkPE67l2B0Q/b71mCedumdepLYd7?=
 =?us-ascii?Q?6vFxmrr3lZZxKF9mnmMZbRraybz9+cPFhP17xaVydmzPusKI8rCsfefHJwD0?=
 =?us-ascii?Q?C6dz7nRvNkwgDHhiqVyo1hkz3H0aRDjHUGfF8uRYtDyFIFpMEDmjrOiB4KFN?=
 =?us-ascii?Q?weuNyJzKK9SzSisPTwJ+Y7qlIg1j6kVMkqNcm0rddiu4kXtsToRKCwB7J4vm?=
 =?us-ascii?Q?83ZL4yuBdFFPfG0nCZWGf5neKCjB7Z5SjlilWdk5pGpJpc+mLSFB3Wx6FcfE?=
 =?us-ascii?Q?H6x7BmZjy0fEpyMO08bZlFLIHbAjKgsB36g8QkF78mErRbMCj0Ng6qSRxrfQ?=
 =?us-ascii?Q?Tw9Lw6UfFIEMGhCtHJZidvoe3jFhM+gICs8hZ/jjQvEJeUQTHkumqlz/PSgy?=
 =?us-ascii?Q?eOCsEunaM6+8YLk+38VwwDc4G6bUQOR4J8vxHcdwE9Civ15fymkQkBzc8jWe?=
 =?us-ascii?Q?pg9ouh3AKDORBA0OqE8uH3dokPUTD3DW1Lhdo4fI341sllygUfVxafy670XO?=
 =?us-ascii?Q?FIvZNk+kp1uDcr9idFU43udOzd8fk/fiQ/vJ2QujLPOtx7t1fGmyebm958mi?=
 =?us-ascii?Q?cJC8P9HO/Tsb07VJbrTdcMiNZGrkLhuOA7UDgUW8SdaA7V4ddIPzuzjgs7Eo?=
 =?us-ascii?Q?Ezxmax6Rikeb6Zhw8rrzRaF59bgOXo8pLQL4ORsBLkT32AG3Jk/V8DVKjMfO?=
 =?us-ascii?Q?hyg1Cme+X381zt5MPmoWQpf4pQV3aJwnDVakcA2zrShEBOk8bEbYHF9I3xV+?=
 =?us-ascii?Q?4aqMNWgwFoEBJTDBLQFEeaa9AAR40csoRlxoeohIOlfF4p5JfhcgItEpXY1+?=
 =?us-ascii?Q?6pJXnqV+miE+T09QV2msgLW+uX0pnM2utk3lqZLTPJ9wujF4vmd72uYkqvES?=
 =?us-ascii?Q?/F7QFLxldMLL669bxNB1K7GEg7CwF3UlGdQCiXnD7b5JyxACjs92yDwPGars?=
 =?us-ascii?Q?RdIbDnOQb0sFZKnrqG4Mm5+ehfECzKqBWbZK4AvGfAwkOurR9ZK0OUGm4SY5?=
 =?us-ascii?Q?DtxEIbp9WFF9D6cnHWpPYXNsvaQlCOoG3OCTWci+HdNsXytcMZqN+LUhFpXA?=
 =?us-ascii?Q?MVT+m9t9KNySLydZpZoGFf064SKRTnuuIgNfTCphWG25ZwFAsvoFwxuOA/05?=
 =?us-ascii?Q?XXkbOOzZNe//6DZlaVzjlMOEhNbRX3/f87oK4vfLMVFGd5VOOiprgRs/03BN?=
 =?us-ascii?Q?vMmsBS5o1Ca/xXVCtSA0sR8/dzmpJJ1BLI4ux06BCOrsRDpZicS5n6ATezeL?=
 =?us-ascii?Q?MGSdN4bYVPd6I5pXnFmVVIDp/OKTR1A/350M1nxGmh/LANjilZ+vkA8NI0ca?=
 =?us-ascii?Q?zk2wxPSJsgaodmPk9/hkJc9CQrcuPWbkhfy6+3g+IwQmjTD5POSVOoRwWKD0?=
 =?us-ascii?Q?Hgrouj8jr5Kz1JNXFRFLpBnsuw5FcdX7OFtF7DptZt8SSB9Pf8kd4hg3l7Ny?=
 =?us-ascii?Q?Efjugqn4opQ6ES+x35DWJ4x3gtkVnJL3NcRDgFO1IvILaGL3twxp6w7c1vlF?=
 =?us-ascii?Q?01PUxiIu27H2tkg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB14284.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?i9hSQU4XwM19UyMfSagjNxjybrAHG+iymGBf76m1rKLMxWR7KmTvijWbQV6d?=
 =?us-ascii?Q?GBrJoYsMbbBoY3o+QLIKD12qrZz/p7K9abScMrqqNR+lL7c4g0pS9BnOWvqm?=
 =?us-ascii?Q?r9/f91ZzhxyGMztD+dQ/RrtqdbS5kjaXgzwhYRoE8NKkfz3IxruD9r3xjbt9?=
 =?us-ascii?Q?Kyt5dJC8TD02D0luvi8pCsWDPEGSPLJZicA4RwCMOLR4eEpUGVuiKwsSAQt/?=
 =?us-ascii?Q?GrVzQcE/v93LwSIPK6R5Mm+zhI0dBAQGamAjnGSGILcwBOsVHP2DGrLjNzof?=
 =?us-ascii?Q?GFtq1QWijUP7YMZUoM8OlmlpKQFyeSdFhwGeFlNVy4kD20Gjsh0tXF43ywKq?=
 =?us-ascii?Q?undufkZ33Gv91aBLYDMQRuOeLE3JgYbggd27Xy0DMjZijd4paOWGKvHOa++h?=
 =?us-ascii?Q?QmW2HElRNJtqbj6z0V/ot/zmc5OAjYihVcfRj1V1WtbMsD8qqxC5REVS954z?=
 =?us-ascii?Q?6AfYzYIkY3WcCUDFgMCP9Bk/D+eh6vNov3wAlFu4ADr3VgzFCPz7F/HEFxBn?=
 =?us-ascii?Q?ygGs4Q4tv9xopYC4K2TrxepmGOhwPDrIXbvkJrYgY7hZMP7MIzrmubyv9ZSo?=
 =?us-ascii?Q?WjRvTbSvRYkWD1Z2olpn70mGeFjsE7QWkKkM6xMBh9VcUVPN/jFgD5B9mfd8?=
 =?us-ascii?Q?q2Bsctkbvji+0hhgWY3LwlN1FZ+CaUwTxE/Hh81Z20D4EhUVSGpNbmtGEYsz?=
 =?us-ascii?Q?1qmmt2dJoacoAU0EVv4wZ8JgbE9DumSqOtyxOdkXS3rxfA4Mtp2izFSoPoZu?=
 =?us-ascii?Q?a+rqyNifQW6wm+hBc7j0STxjQNfsvcFPI//fr7BGZHjYRpDsXPg0poJcMwIO?=
 =?us-ascii?Q?Ac8HnIa7YXTva6zLyPVzZscmM2j2XGQg1oZR9YTZjdeYui/9fNz7+3RdaHQL?=
 =?us-ascii?Q?LJlhvwpIUALJ80IucICXoTKTFAdPFNxDBaiyT7YhLuXMK7CtarLPwPgZyZTU?=
 =?us-ascii?Q?UrTn7NKLRQPb4oVw89THJChl4WMFlxNW7hkRcA9xsOCkGEE2fQnPwyZ3/P6w?=
 =?us-ascii?Q?PKz3t9VqdyzuPrHsRllDBprwjtq+fwZT+E2Z7GJDusdAxpCNTNahl8hgI6si?=
 =?us-ascii?Q?CbnZhMzibH45R27UnAXZyst/5nkUy6GtnqqqifQEK/U2ahlTnh0I91Crvhh5?=
 =?us-ascii?Q?3/L65UdTvl+O8/zdKA2m/PieOwMrphqPXu7CxyhMnh6wZdKetV2tXTYfTGAD?=
 =?us-ascii?Q?ZvW80tGdO0E5EgRbS3cAOyKOusLC0PqiY5w/yyqlU6POoC8fdw+mLSSZVG9L?=
 =?us-ascii?Q?2irStqwxkPj80kiPRS0VVDmQVRSpQyRPTGNcsVlyKCci/gtJN2ljiHBKMc6p?=
 =?us-ascii?Q?Jn7iBtab/kP3s4QmZCcVCNMvw55rjx8QuW7AZgEKGcTawjfK7qh7TDsnvHHh?=
 =?us-ascii?Q?HgFwxHXtVjwe17vgg2Pb11qeWm0rep7kJkgjXFQ214AOF2vUEHIX3TQ3D0AC?=
 =?us-ascii?Q?hm+YYFnCLApB88sN22/yamHNhYeiccBr6oqSEj4IJPyVvqLo67mhbZAxbRoC?=
 =?us-ascii?Q?Wr+5bZFu6AxNGKA09of0QvvlQ9CIoQp4KSjsuaeltsh8tOFz+DT1g0RES+DD?=
 =?us-ascii?Q?/tbS9zT4vhGwyhAtqc6fFjO+lipl3gXwxpQC5ris?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB14284.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5e37349-ebae-4bc6-af7a-08dd8ef1a7a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2025 12:04:30.7498
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hBnGInzU522s+pmRX3LbSGfb3M05C6q6RcJ5/rLD/pvxpO6VlxeRxVujz/4VAluJR5OXM14b0OCAxgmnSlAxtq1HKYC6uCJQsv17/LYmY3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15842

From a2f88121b79cdf756dacc9d58ed1ca23ab1c8744 Mon Sep 17 00:00:00 2001
From: Michael Dege <michael.dege@renesas.com>
Date: Fri, 9 May 2025 12:40:27 +0200
Subject: [PATCH 8/9] Doc: devicetree: phy: renesas: add compatible for X5H

Added the compatible string for new Renesas SOC X5H (r8a78000).

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 .../devicetree/bindings/phy/renesas,renesas-ether-serdes.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/renesas,renesas-ether-se=
rdes.yaml b/Documentation/devicetree/bindings/phy/renesas,renesas-ether-ser=
des.yaml
index 93ab72874228..58e84f703865 100644
--- a/Documentation/devicetree/bindings/phy/renesas,renesas-ether-serdes.ya=
ml
+++ b/Documentation/devicetree/bindings/phy/renesas,renesas-ether-serdes.ya=
ml
@@ -12,6 +12,7 @@ maintainers:
 properties:
   compatible:
     const: renesas,r8a779f0-ether-serdes
+    const: renesas,r8a78000-ether-serdes

   reg:
     maxItems: 1
--
2.34.1

________________________________

Renesas Electronics Europe GmbH
Registered Office: Arcadiastrasse 10
DE-40472 Duesseldorf
Commercial Registry: Duesseldorf, HRB 3708
Managing Director: Carsten Jauch
VAT-No.: DE 14978647
Tax-ID-No: 105/5839/1793

Legal Disclaimer: This e-mail communication (and any attachment/s) is confi=
dential and contains proprietary information, some or all of which may be l=
egally privileged. It is intended solely for the use of the individual or e=
ntity to which it is addressed. Access to this email by anyone else is unau=
thorized. If you are not the intended recipient, any disclosure, copying, d=
istribution or any action taken or omitted to be taken in reliance on it, i=
s prohibited and may be unlawful.

