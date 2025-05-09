Return-Path: <linux-renesas-soc+bounces-16843-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 239A0AB12BC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 13:58:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBE53A06908
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 11:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A2C128F94C;
	Fri,  9 May 2025 11:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="H8O77Oug"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010069.outbound.protection.outlook.com [52.101.229.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B446128F95E
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 May 2025 11:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746791714; cv=fail; b=aSmikkdY171b9qnLFGQZjSpVQKuTpckFIZGCoJ6Z2Pj36l37uNBg4qVpH/hZqCdrf5AHIxU1r2H5iqWYIeefsLxjluHCqyR/eEKB39vWnJSpH0w1kn47gKOG40umKZ5KrzbW3AOWPlqp0tf6QFDWGsXGqyiH+1boM/zKsGIephA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746791714; c=relaxed/simple;
	bh=euW4MaqrGRrBg/YxOPGji+z9MvBzJ4qprMEetEvI9S0=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=A2Fg5uNGZWRl28pI6rfawNleOuhZtVRzeSqxWOkdRKlkPDFE4kxKdJIQvfJ2S6ydIk/F2M2GOcVN+UtgRgV5tbeT5GXvLbN3cbJYtjau06FdW1vKG/QjbS+bdQA1z4i+ki+f7+PEJrJ4fJ/4WNPCG/CNwzeC4EEpWkNPnn//cZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=H8O77Oug; arc=fail smtp.client-ip=52.101.229.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DvoOEiL7LZevLpNAN8gj7Xq9ZBKsoB1hZCXl/u8ckhPyNjXZCTUTzMLIV8PhYsuUBMOq2tJRdSsySPIaisxij4SFD+4ZKTmwHzGJgTSyCZb0U1TepNovv61fwSI3bWkdCR1Bz1NA45wXcjaKaNjlQ3oaDkZy9A9Vise4LfH35UBxujXKhoASiaOx1L7jW1ugW6adt3HCnn6LKcI7eMvEf3RgVfN8gmq+7CyjSdosCQAyXOm610SolW6dqhZBijIkxaZVjo88KwavGGgQCpQ00vSCOBEXWPGuklrlKTfgVOK+kzpfUyGPwWwbPCMQlejWdk6QtXvKtRwFB6L0znFfxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=euW4MaqrGRrBg/YxOPGji+z9MvBzJ4qprMEetEvI9S0=;
 b=CsVd8DHSTdLnzTNy6SV5OXV2ql3YJi1DE70+qkELxc9rzOLz/ump+4yr0bkwm4vWQYx/3yjcPHGwBwSYu1aj2/W6ggEmY3142lpwond5LdzwQc4AJBXYe8PgtEkj/MtD1kEP2GtafGY5n428xdsCG5SONREWMVjmPjh5qlx8ybQ/AziyEuLPrICzSU5WQRNKcEqEHx4qzkcWUxzOrBJ5hSKbqNzXthNe6ewUvQqtIP6w3cx458VQ/ENSLzdt8+uSxJrNuKp88RRAnA86vTUkwGCDwa08bstTlFqlbeILurCXIFGC5JtId/2dvoCYewlFKtGo9juuGnP6UnjSsU65Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=euW4MaqrGRrBg/YxOPGji+z9MvBzJ4qprMEetEvI9S0=;
 b=H8O77Ougf3tCyaUaRr4nhlqkNK8rJYZxG+10kmUGyVCTlpjWy+WlF4QRw5UneTydT3souheWH0Aw9iEMSg8uDF+1ehbhcKKitW74zf2MgZiNDmRt7pPR41yVqWxCwUj0tL80AxhKlZSjkQsFQA6vtavqwCQe/bAnFzDkgAqcm5M=
Received: from TYRPR01MB14284.jpnprd01.prod.outlook.com (2603:1096:405:21b::6)
 by OS0PR01MB5396.jpnprd01.prod.outlook.com (2603:1096:604:ae::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Fri, 9 May
 2025 11:55:09 +0000
Received: from TYRPR01MB14284.jpnprd01.prod.outlook.com
 ([fe80::dc7c:6361:a82a:933a]) by TYRPR01MB14284.jpnprd01.prod.outlook.com
 ([fe80::dc7c:6361:a82a:933a%6]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 11:55:09 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Doc: devicetree: bindings: rename r8a779f0-ether-serdes.yaml
Thread-Topic: Doc: devicetree: bindings: rename r8a779f0-ether-serdes.yaml
Thread-Index: AdvA2TWah5fzeMQjT22krypIc8kAww==
Date: Fri, 9 May 2025 11:55:09 +0000
Message-ID:
 <TYRPR01MB1428415607B42877B763427F0828AA@TYRPR01MB14284.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB14284:EE_|OS0PR01MB5396:EE_
x-ms-office365-filtering-correlation-id: 7a7cc585-b347-442e-b41f-08dd8ef05904
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?NfhWNwEXqCLgsBToOwmJHm7brfav1VXSo6QRyInd7MgjId6aShIKbRSknEhR?=
 =?us-ascii?Q?9iAtYmZ1hcaFHnZd6RaXgIU8OuUXXrrPQH4ETme4CMzOBf2TN8CBevzeyB6C?=
 =?us-ascii?Q?Wp0WoPtCGwKzikWG14F9MYQ6Nh/DmBXgmcdK+epyikr6avWi5zD9RyzE8vvY?=
 =?us-ascii?Q?loSw/ZYf96CFruVCFgpWIRORd3yoGqDA4bQidxOgwCXCyvpy1WATssVpNFY3?=
 =?us-ascii?Q?ZnDSeGO2Mw6CRaoXAiY0OdaM2GjxMavGludZQVWESTej85GGqv3OUekSnD7z?=
 =?us-ascii?Q?IFxHyRo1bDuxgTsLPozmv4QEoBAjaRi/XlwDhdjgqOWxQvqixotjS294fATJ?=
 =?us-ascii?Q?S+eHMrD0U8cb7DdH7n25omnJSAHjlTSjZY+TJPi5JEhNWhP2h/Eczc8UPaS8?=
 =?us-ascii?Q?U4KDNDHR2ZEN9DGbhRsLLHrCEQxKarKFgEo0XqcW9StmOWPLSh26PNUVI57D?=
 =?us-ascii?Q?VP/D9x8dypNjYlbqynoWTeSXFGSflorEYW7ixzfKgDIbCAO/hbpbPbdGFfgM?=
 =?us-ascii?Q?rFUc2lP4/1f5mZBFXAzCNnmwc41Lv+37rFjneNABpcVdIvArTkJXJv+hQn7n?=
 =?us-ascii?Q?zGHZ7y6Ic3Mvmp4vT6GQyhxOBvCMYdAdTDCH3Eakl1FhHFOTzQFADj9W6R+W?=
 =?us-ascii?Q?TKdutszgRjVVhjV1TKVoGIn/8ksNw+8vBhKp8htCWEGKA443fMpvpiuwyHiq?=
 =?us-ascii?Q?7vZSVktSMz/4gja04DMLFH6Oq+veREfLuvhvIOMmBu8MrkufzMH46/oOBEml?=
 =?us-ascii?Q?Uxrn6IoNTxoJGFDnrfeUDypvnhp8M61OdsS+mJ6HRS2qqrF7HWL72NeNg5c7?=
 =?us-ascii?Q?IGjzq07evB+2QrOS3d3s91tc2QSHrICp0XmkoYO4rG0OWS63DAajr9p6WMNO?=
 =?us-ascii?Q?ZkKfTO3MUH6RF3aJyrNh6pNVSS4GsAN4ByvARJQD8SrcdIF/Dt8xwAQOgfM4?=
 =?us-ascii?Q?eDDUUW/wSwCnKV8MqdOzoziwlRdCwzH3ICGAv3UzRyxxyXxNbIcpn/VSblIm?=
 =?us-ascii?Q?+nJo0azovvfPkSyqs431CdtWfuMR9oulyrbfYivkIIxrJ9EyT/JTdzEiodVC?=
 =?us-ascii?Q?VBZv9oJbtqxOnqfMGtKG6mf3tpW83+RjQwI9hcBUb4h1Hpa0TeDHrZ70/pD4?=
 =?us-ascii?Q?cB3vu1JEZryM/TXAKl0BbAdak9sapMtJGUc+wGDPzCmPhnu8tZiDFjKsTA7u?=
 =?us-ascii?Q?q82XSZRzpmDIJjl2/UYTzVwCp54VVaG0neCB00hmmw0Z6y1Z4tyVJ2p/SKIQ?=
 =?us-ascii?Q?yaXNu5QECVYNw5QxSXZcRP4LcfHHhl4CZuUAZXKFhzbn9Pn+rydhCnqFEQq/?=
 =?us-ascii?Q?Y6QylX9TdcuAZY7bnKSvf8vTN8BLo7XWpiv7bDlz7TLmgsADq/VM6MVKgAu2?=
 =?us-ascii?Q?dz4325xRObCeK21tUTvb/bqpv7xMnyeDpSobf70/uY98bH4QeFgj6tXB3dHx?=
 =?us-ascii?Q?RXTdL122mwx1IRkg+1J05nWxNV3gyzOn0qmRyNa/qQmH4G+w4jgXRCHYWQ/g?=
 =?us-ascii?Q?x/rj3cDBxH+YRjo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB14284.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?LmCwZFk7vy/+ZPUON/gL5LmwDHsvr4/POcusc/YHLXOFF67nITwFk+70qO2H?=
 =?us-ascii?Q?vxzpy4/L1hPpdswJxHfE0xL58ILNH37uu2wGPPL9heZ3rVpbMP10PWWCBqhC?=
 =?us-ascii?Q?PKVLoPg0LujQCwY0PZ4K9oupkPGWA/Q5UEta+Xzxny9Ft/rjsVc6gG9UcpJH?=
 =?us-ascii?Q?LZzHOn+3cVakTWot7m2taN9yKE1T1UMQ7LRGfkhYQdUjtwH9VDgedUXbjr69?=
 =?us-ascii?Q?y3gHx7Fyh6BxdWUHEaGoZdSohDr0yNztjqcsSKvdEtkMpqqGltLxM2eV38YS?=
 =?us-ascii?Q?XKMAqWIiCLbe0DN7YjSpP0PQGP/JT1g0gJdkbTbgIneu2uKDGepwWgL8K26a?=
 =?us-ascii?Q?NeC0Jgj2FQX7BnEvHbzMBkopuIbFgZB8JMU1Pglxj8HXPWjb62ndMze8BMqI?=
 =?us-ascii?Q?4ZUnK7uI/oYUbmHv/dw3/ouCR/BdQl1RdSlxv/QjCkZqTVl9PPCmCUTRe7C+?=
 =?us-ascii?Q?qLCNyXnQF92ufwImK/ZIf8YzgWKp0thI6vTQBCmzHID5GEh1JtC5p1TLbXAG?=
 =?us-ascii?Q?Kjd/+vanNQ2XORWCIyZW1s3KuUVFIk+n7u8PTP/RxNd24LDECWX6DBDM39rl?=
 =?us-ascii?Q?YOo2tycBh4vHXr4gKnYZ2MplfzkEPPxe8MoK0Sd+0ld1D9L+RAmb5Kz84evP?=
 =?us-ascii?Q?g6sLvGcWAyi0Y4VGkshl6yv5MOOgiDtLEPt7H5wn4trXzOtss+j4tlNfXRIS?=
 =?us-ascii?Q?W46k7N4o0aXwba0wwLWb24on7ilA0joGyVMITkRhqZanP7H1CA5An4xbF4rI?=
 =?us-ascii?Q?+xiZ/qk7b/zaoljyC4RtrSdEhgJQwzF+/PL/2wahboV4+fMa1JQO4qqSxeiK?=
 =?us-ascii?Q?jkSCwZ9XdvfS1XKoZ5W8wK0QCFExc3lg3tQH7EeJdG2Oymk+DoGK8i1lQubt?=
 =?us-ascii?Q?MSaq6qchXZ9oUvq6f06cVo7yhkkjjvpckXdB26s5xc+CQUJlgbj4kFi0lLp9?=
 =?us-ascii?Q?PWezyx7W2lhsll/wlUoQ9YXu5r+YQiu9QvBLF0ZGE+iOlSYc3RqRq6hsnNLF?=
 =?us-ascii?Q?zEKuTB2fqo6XKQVAneJ7aoT8H5sXtEjrE299pd7LPCjQNN/Drrw8+LfFcvE5?=
 =?us-ascii?Q?0WRbcZAGaKy0YCA2wo/YxEWvKOWLE20gUAX6h2yrYhp7JSOCPllYwPnyMkfu?=
 =?us-ascii?Q?Fb3Gtr3X4NyC7lhvVZAsHTIVGTHwNyDq7LaPvGoIa5KUNhrzs/sLBLWLAI8a?=
 =?us-ascii?Q?De4TFTyaaeLhMOIrN1plYkkEsH+9x6iJvGxeSA28MQPYRFn1APZEdDAsuXMo?=
 =?us-ascii?Q?7NhfpF4wzRlnXJdRLSdST7fh07FCzXKXF0dFot2chTRatPX6fsJ/wo5jb42+?=
 =?us-ascii?Q?XBOtTT+wkFPpyf9Jsons+R4o/sDDuV5V2TANQDz4EF8HOfO6XD03JANu5iT0?=
 =?us-ascii?Q?FDfi25l/5yXH1qNrTJOvuqnjtBjyrVHK5JgHR/7hdLwH/7Ni3f+lVrJBeddo?=
 =?us-ascii?Q?NNeov7YD41WK1/KXW3Zf7QUS7m22QdvvIgdeUBqZBF0QGc/pfQqFG1Ieiv1Y?=
 =?us-ascii?Q?bCNC7R8Q4PYoEbZH3hfGu8NMvrG+pfcXV2jMYUv4zMqGlHBv5s0hvW2+8Pvu?=
 =?us-ascii?Q?cQAg4DW4zdisvAYkzGVxgAq05ZO64KAJFY9urBgA?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a7cc585-b347-442e-b41f-08dd8ef05904
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2025 11:55:09.3221
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GA+nMpWSDVwX2DXDLLJ5yo+weGVEWpWALEx46S5b59j7s9JPAEIoXL8c/N6z4MSheBmWusE2V4JhEe7MmnqypTE8hpHx/gAaUHEKBbq70bE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5396

From 17e2e2044613eb2e738fadfe2b776593759a3994 Mon Sep 17 00:00:00 2001
From: Michael Dege <michael.dege@renesas.com>
Date: Fri, 9 May 2025 12:29:58 +0200
Subject: [PATCH 2/9] Doc: devicetree: bindings: rename
 r8a779f0-ether-serdes.yaml

The updated serdes driver supports multiple devices. The original name
included the device code of a single device. The new name is more generic.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 ...a779f0-ether-serdes.yaml =3D> renesas,renesas-ether-serdes.yaml} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/phy/{renesas,r8a779f0-ether-serde=
s.yaml =3D> renesas,renesas-ether-serdes.yaml} (100%)

diff --git a/Documentation/devicetree/bindings/phy/renesas,r8a779f0-ether-s=
erdes.yaml b/Documentation/devicetree/bindings/phy/renesas,renesas-ether-se=
rdes.yaml
similarity index 100%
rename from Documentation/devicetree/bindings/phy/renesas,r8a779f0-ether-se=
rdes.yaml
rename to Documentation/devicetree/bindings/phy/renesas,renesas-ether-serde=
s.yaml
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

