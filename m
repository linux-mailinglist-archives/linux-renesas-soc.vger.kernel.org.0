Return-Path: <linux-renesas-soc+bounces-25520-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 61873C9E295
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Dec 2025 09:13:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2D6D74E113E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Dec 2025 08:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 733832BE035;
	Wed,  3 Dec 2025 08:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="WS20MNgK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010011.outbound.protection.outlook.com [52.101.228.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1781628750B;
	Wed,  3 Dec 2025 08:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764749601; cv=fail; b=RtLb23im0yYdZqFV6TzON85TxQKn1HZWAESVjVZEHQ6eP3L3ujzSx1IXIzVuWEF9JuI3/GREIJVOQyYLQb4wbY/kdeHwzwjcqJGZd5GNxRKcA9RO6hmkhqWoTj+tQ8uhmR6TDJffCchAb4AzO89cfteOZjYmpdU0hYOcnO1Mnlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764749601; c=relaxed/simple;
	bh=ET6hInVj3sX8vGEo8Q+eNW7WchhZdf2r1nPWx7yD+ls=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LSFPtT7/65enFhXgzWMrGDGvba13AVACWxYGEijhh1gWZ8j6XjTeY+lT+8FhqY+w++oz8tj956hTynxJTUE06RZwZ3Dzz/OCQKSNsAQUuT7vgV9QZen+EPlZBpSFeshetzqN4rmpPD067NHbgwxAH7TEmXHV7b4d31p+7n9BgE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=WS20MNgK; arc=fail smtp.client-ip=52.101.228.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gRsPXnlhnH2EQcfw8u6kvmg1gNOKrAhvwYZDYwzXPv73WgBkrdUNgsEixZe2Pnlb6NUZHtiFQoYW80JoSwzVob25ISxzUcjeS4/qxfxZWF0JMucAFBTrH/r9CwjYD+VZpfzVycnvql6MUY8D+cPZvS0bDt8zqYlc+YvZ7xfpFZ5mo7W0viKtQur6ncDiyYb6TRpS1dF/OIewSeAwl1XAtufKOkCnYZyXmWSHOrzonXZQcw7mPg/AC6pgy+H12iOHnNJF+x/xAoHkXD/LLofvjJA89jhuEkJJ2/yvNmfHcruKaAX0LvllWo+7r0zQ6NWuGZGfceHUzl2x00AqWC74kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ET6hInVj3sX8vGEo8Q+eNW7WchhZdf2r1nPWx7yD+ls=;
 b=a2V8F7X653maqUJNWlSffRNLSz5qT1Jrx+2uHjfxIKxGjzOGTlSGm8HrILkeIHqP8jSa232GMEAMcNtryAGtdtkRf8Hrz392kp51wT3f5+t3l9kkySzUVDkJQR74EqsX0uzJdAv2xIz8pKm82vQA3I/Un3lTTu2li5voBFxY9b4yhBKMFUhJYCoaN5Cy58nhQk9502j+gZz20Oh3SO7/9qpkZ3UqeHhDNKmVBlRclE7deR0McGzxMp6QVYVuAmkqJ+aSWQm/xA+gPpJoOmp3EDOEz4zvHp7aQhfLxa5v/sCPk9mF4buVxdSaJNMqUKJ4lt3dKLwMVaSW0bzJNjyXlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ET6hInVj3sX8vGEo8Q+eNW7WchhZdf2r1nPWx7yD+ls=;
 b=WS20MNgKwQ9WZf3waNk1pYAa7s3/laiT8Q0C7kquAgVuxSFxwXR11dpXTynL/wyKAi5yhqAcGwNzt6xwS88srIIvy6hiMHjtkhzZHNJxt+6+ocFPDEPP/UMmEIXRWToRC15qrCNRWEFZZRo5oOS+TMEL2gcwImGLpVrTbeIcqmk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB12958.jpnprd01.prod.outlook.com (2603:1096:405:1ea::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 08:13:13 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 08:13:13 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: magnus.damm <magnus.damm@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	wsa+renesas <wsa+renesas@sang-engineering.com>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v5 01/17] dt-bindings: serial: renesas,rsci: Document
 RZ/G3E support
Thread-Topic: [PATCH v5 01/17] dt-bindings: serial: renesas,rsci: Document
 RZ/G3E support
Thread-Index: AQHcYU9OIzH/bfLdDU2wN2SL4FuR27UJ5w+AgAWujKA=
Date: Wed, 3 Dec 2025 08:13:13 +0000
Message-ID:
 <TY3PR01MB11346C9A7B587AF03D533AC9E86D9A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251129164325.209213-1-biju.das.jz@bp.renesas.com>
 <20251129164325.209213-2-biju.das.jz@bp.renesas.com>
 <176443699313.11808.1467058497468917565.robh@kernel.org>
In-Reply-To: <176443699313.11808.1467058497468917565.robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB12958:EE_
x-ms-office365-filtering-correlation-id: ac2267a7-f458-4e29-933a-08de3243cdff
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?NzdwcTljbGpzN2d4UC9qTEJiRkl4d0hMUG5ISGhDRWZ5UkxJQUhQUG40djIr?=
 =?utf-8?B?NWZ4b1ZsdjgwRWFXbGYwUWdia3JCUkc4dWR4VkI4dzJPaXZ1NjVFQnN4Q3JL?=
 =?utf-8?B?SXlYNjhoRUdydFRGWVhCOTdOVXZoUzlRUnJ3V3M2U1d2VERlYndnYmMxcUdr?=
 =?utf-8?B?a08rSm9YeVhCOG5DQWJRM3RYT0pnTUk0MVFzUEtKU2g4eU1xVG1DQ1pqakdO?=
 =?utf-8?B?dEJydEFBV3NEZndBV3AvdUFiMTkwdzFFeDk2c1BlUWFvdXQ0d3liSUxsRXo3?=
 =?utf-8?B?cEpKdEJ5dWZjNU8wKzFBWk1qbnZQWVN2MFJCM09BTVh4ZVRBdHViYk82ZVpy?=
 =?utf-8?B?eDJaWVB0MnRJcVVRMUNySTB4Tm91Yjg1Q2h3akVIK1pDaUdTTU1pVW1kSlpT?=
 =?utf-8?B?Skx5S1ZxNmVvemEzUDQrVThrMUdLaTZGS3BJQUlFUGJwNldHOE1JT0pGZm9y?=
 =?utf-8?B?d240cDFLU0RtdnNwbisrR3NVMEJsM1FRUWFmd0VoVWgvb05yc2Zrc2dJSWR3?=
 =?utf-8?B?WUFDeGdlZXRFdklmNGs5LzdsY1p4Qm91NUs5M3RPdzY1N2NLd3h6V0krbE1p?=
 =?utf-8?B?YUtLM2RYdFdGR2lZYnVCM1lEUFhaUlVYdDZKaTBjQkNNVXBmR3R2S0JEVElF?=
 =?utf-8?B?eTIzbmxuckRRSXh3M2hiWmI3bjZDQlY5R29FakhibjhuWGpUMWNwUzZUOUpj?=
 =?utf-8?B?NHIxaVdVaFp6TW5PL3Ywemd2NFk5QUhWVnc2T05aV2xTb1VxUEFUNGJvNHlW?=
 =?utf-8?B?eWRhQUpOS2JCYkJXUTNUWXpsL3FISlM2aDd6cEtUeDFPVlZFK0NrSVZPdEtV?=
 =?utf-8?B?QWFBZjhDQm5vNGhYYVZQZktaL3dzRjg3Qk1OTUl3R1BPZ01Qamx6dkMwaDFr?=
 =?utf-8?B?NE0wQWRCM29TUWdxV1I1b0NCRTREcDVhWnAzdzQ0WHNwT1p2U2QxTXVXQnBS?=
 =?utf-8?B?TkNUaGh0STJzd2hTWkFWS3c3OTBrendIL1ZkSkVxamJBdjdOYWZON2t4aE1z?=
 =?utf-8?B?dWJhTDBRNHpsTlUrQUZYSFFwT1IwN2xkOEFnb3FoTFo2UE01d1ZKSTJuNHQ5?=
 =?utf-8?B?eFR5ZTcwODhNTTdvTjZ5cmtpWmhKUGQ1OTUzYUVnSXVhUjV2bWlLcHg2VzJM?=
 =?utf-8?B?U0JMdXVWamN0NlpHdlNBOWFNWi9pVCtyUEVXTjZmN3hsSjIxRzZMeStOcm8x?=
 =?utf-8?B?QUhiY3pEeFI5dFBCcFJXSi9wb0JsNGtidmZBWkJtWVVoOHN5NlR6WDFYZU91?=
 =?utf-8?B?MlJGdkV6VEJTNTErdStZaHZNNzZxVmxmNC9BKzUzbTZ0UHJlakNpbTV1THp4?=
 =?utf-8?B?VXNzb0JSTi9kVzMwb3FSeTRmN1Q4aFNTVTZKVmpNczNIWVJ2NXlaWklKb0ZB?=
 =?utf-8?B?K3VQRVF6K1R5dDl0V3VSZkV2TGtMSm5Pc0Z3V3VsaU9XWWlreVFVVGx0dGNQ?=
 =?utf-8?B?UzRzblNHcC9BL2FTNVduRXVvR3UzTThuK25lUldLWVJZaXo5WG1uREpKSmtU?=
 =?utf-8?B?WFpzMkNQUWtJamhRMGI5Q0pxU1hWTEZnL3pYUXNFQ00xTnd3cnVrcGVDQStF?=
 =?utf-8?B?MktkcTAxNnlPVm1mTlE4TFVnalhybWcrTlV2RkNqN05QM3lyckY2ZUhUNjJt?=
 =?utf-8?B?TEd1S3F4Y21EVlZlSGY3ZmQvbXNDYlRQS3N6dWJ3Qy96MXNRRWVFRUFMTjdD?=
 =?utf-8?B?eHh0QzZ3QWRQSm1QbGc4N2RtcVk4Mlh1Y2hQWUhPTS9YbkdhTVkxaFZ5bW5J?=
 =?utf-8?B?Qmk5d2VqT2w1bWw1SVJuTnRwKzd6VHZ6VGZCa01FMUU1TjA0TjN4cGFTZ3BW?=
 =?utf-8?B?Sjh4a0E1cENla2gzN0MvSVFFdEc3RkcvRWlxUFl0QmdrU2lnaThTRHltTGpU?=
 =?utf-8?B?YkhmdDVJQzJiQnkyREdTL0hCdnlvR3BBWUt1dm9raE44Z2lRbnpabU9vM2xZ?=
 =?utf-8?B?Znh3Sy9MK2hRM1RKWnA5b29hUG12N3g0Q3JhZjltaGkvMDdScy81ZTJHQ3hU?=
 =?utf-8?B?N2lYaGJXcWMxQWVMSURxNlFuVElUOUVRSWR1NjZxMkZRMEViMThTcm5JeWZE?=
 =?utf-8?Q?8gq9OY?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RElGSmZtank1YVJwU0VxMTd6TUNlczF6VUpVZ2QxUVhrZTNrbng0WW04WU1x?=
 =?utf-8?B?T3ZCamJqRXBpdU5nd3FZMkdZWEVKSmgvVEk2Q0tWekNNejZXRlVrOTRhR1U0?=
 =?utf-8?B?aldzWmgrTVlWVVFsMW1kbjcrQ1NXZ251SWIxL05oeGdhUTZXMS9ydWZPcmhZ?=
 =?utf-8?B?SlRERExVUWhDQjVEa3pZY1I3RlFjaEJTYmlWYThOLzZ5blNHVklwUytyMmpO?=
 =?utf-8?B?NnlRT2J2WUdwK29QU3A1QjhMTFV2alFPNVZ4SFhSUTV2SEpwSDYyeE84ckVo?=
 =?utf-8?B?V1pRbW5QYmhyYXZNTVF5K0lud3NyK1R0WWx4Z1QrYXhlYU5QVll6VkdrZFJz?=
 =?utf-8?B?S3czVzM4TU1yUWUvdWt1MCtoL2JERGZkK2trVmxvTHluU1h0SUNaVUVYQ2VD?=
 =?utf-8?B?cDFKU1hpR1kvRm0zVW9PL2ZEaHRYUkxtUEJiNGhqMERRN2lyQjZBY0RNWW1F?=
 =?utf-8?B?WllReDVlSGRmZzZNSVM0bzd5TGpLUEIwdXhIZnQ0Ung0WGJ2anNUVnZ6OTkx?=
 =?utf-8?B?VHV5QzY2WmJRNmdRdUFTZXNtWHBpQ244WkdISXlWSXptMk1xZVFxcFQ4d0hn?=
 =?utf-8?B?L0tUZWRaL0NOWm5LSGJORy9sdDFzL3VnUVlWeFlwWTYyOE1hT0d1SVBmM1h3?=
 =?utf-8?B?OVVQR0I1RW1OREFtMFBWYUozcVRTbGFUSUV1Z0s0eWNrdjVZTTZhazl0SmhH?=
 =?utf-8?B?TEprdWUvRDZ0cGpPOEg3RlN4ZmtjSXFRQWE2YkhNZ29LZWcyMFNvamI1amRT?=
 =?utf-8?B?M2FOd1d1bTFqb1ZrWjNVN1puSHBWdkt4SlQwV0JDU0N0dXRHTjZDaXlEUUJR?=
 =?utf-8?B?dmhDVGtLeUw2eFlyWlRVeXN1MU84VVZPRnNvS2FzM0RyNTNWV295QlpYUDJs?=
 =?utf-8?B?L0dmN2RRcjhPaitRR3QwUmxnQ0t6cXNHcTBGZzZrcDhTNlVxOVRPRDZjTCtM?=
 =?utf-8?B?MzdDN1V3NWVjSWIrT2Q1dW9BVWZ4S0FHTHovTVFLWXU2TlJ0VUViOXMvcTdm?=
 =?utf-8?B?KzRhZjhaRVFYQU9SSXE0WXpWZWJ5T2tRV1B1cTJ4K013c2JhUkNNaGIvTENw?=
 =?utf-8?B?Rm9SbjkycnRBRGNhb2Q2czdxZ01xU0Z5L2lwR056YzlkdWQ2TGlNMnNxQVNx?=
 =?utf-8?B?aHdXZlpnSis1bkZWb3MyUlVlbFdNTS80angyeFlQOGxCRVFHbWtSS0tKQklB?=
 =?utf-8?B?VUJaUTVMUU1hUjF0MzV2Q1dNMWR0UjVhSjdWMzhKTE5oeXVIWmlXdk9aMmRH?=
 =?utf-8?B?T1dSREVGdk83ck8wUW44MkNvZVpkeGdwemJHc1NNZEZDOVB5UjR0S1JDdkFJ?=
 =?utf-8?B?SWZ1RzBsV0xmM2Z5bWxiK2hUcS9tTjVNVWRIYmlSd0RVM0ZPd2tuNmErSktL?=
 =?utf-8?B?aGVFazIwL1djbVZDZ3Q0T0pTOVFoV1BQdXAweWlmanN2d1NVZ3NxQlZGaURO?=
 =?utf-8?B?M2NPWDkvSUQvWmlZR3ZlOFYwMnlwbjEvUWg1bzRxTDUxd2tiMFc2cTdvVHI1?=
 =?utf-8?B?ZVQ4eVF2ZFM4RURsRzVnbWtlZkVrNTEzUUp1eFROVi9rMzdmb3l1VW1QUHFR?=
 =?utf-8?B?MHVTL3UrS09rOGNxcUJEU0tGVjFtUDFKbWZNZWVyZXpneWRMQmJscTg2T0pN?=
 =?utf-8?B?YzZXMXkyY2NxcEJ0QU5qT09jZ1JvLzFpQnVvTnJNOHpnbHM5a2Q3NUpSZXlj?=
 =?utf-8?B?Ukp5SnBhSUFBUElWMDNibGdzUWlQM0t3aDIrTWJvWUJrc2N4R2lMdU5udzlh?=
 =?utf-8?B?OFh0VGE1aE1XU05EYjNwQmZ0L1BZelUyQkwzT2pQKzM3eTAwUzVtd3V4aERC?=
 =?utf-8?B?dHFoNEdZWXpFZXJLT0ZrSGx5aWtIM0ppOFJCajVGS0lhMVdzSWs0WS8wOHpr?=
 =?utf-8?B?dlhXVXM1RnR1Mjk5UlJLbDJXWG5XMm9sWkRvTTBhTlRJeW9zZGNCazcwRmUz?=
 =?utf-8?B?SU9tYkk5ZEEvN2EvMHcrVWpQTWNMS1B1U21idHVFK3BUUnNhSnNCbzhyazJU?=
 =?utf-8?B?QVgxTXdWeWROdndkUnhHeWJTRnZCL0xOaXo4d3kzQlVZYVQ3U2o1SVhQRjZw?=
 =?utf-8?B?cG1qa3BvS1lEbnErVk1PVFJOb0hBSDZXY1p1bW5JdkRoMU1vT2sxak9sWmxj?=
 =?utf-8?B?OWZMTDRUZ1Awc0tUb1Q5LzRENzZ3bldaWktQcmd5V001ZFk5THRFZkZtbGUw?=
 =?utf-8?B?Nnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac2267a7-f458-4e29-933a-08de3243cdff
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2025 08:13:13.3226
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nSc0ru2OumWtNcILNXAOToSgz+yOQ1rIV/9C7dZ0VGzK7s60FdXHug3gSodlYU1YDjN/dPAcxwonIlImc9bBtA8zXKuTUGE+ImG0gjf7G6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12958

SGkgUm9iLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJvYiBIZXJy
aW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDI5IE5vdmVtYmVyIDIwMjUgMTc6
MjMNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAwMS8xN10gZHQtYmluZGluZ3M6IHNlcmlhbDog
cmVuZXNhcyxyc2NpOiBEb2N1bWVudCBSWi9HM0Ugc3VwcG9ydA0KPiANCj4gDQo+IE9uIFNhdCwg
MjkgTm92IDIwMjUgMTY6NDI6NTcgKzAwMDAsIEJpanUgd3JvdGU6DQo+ID4gRnJvbTogQmlqdSBE
YXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+ID4gQWRkIGRvY3VtZW50YXRp
b24gZm9yIHRoZSBzZXJpYWwgY29tbXVuaWNhdGlvbiBpbnRlcmZhY2UgKFJTQ0kpIGZvdW5kDQo+
ID4gb24gdGhlIFJlbmVzYXMgUlovRzNFIChSOUEwOUcwNDcpIFNvQy4gVGhlIFJTQ0kgSVAgb24g
dGhpcyBTb0MgaXMNCj4gPiBpZGVudGljYWwgdG8gdGhhdCBvbiB0aGUgUlovVDJIIChSOUEwOUcw
NzcpIFNvQywgYnV0IGl0IGhhcyBhIDMyLXN0YWdlDQo+ID4gRklGTyBjb21wYXJlZCB0byAxNiBv
biBSWi9UMkguIEl0IHN1cHBvcnRzIGJvdGggRklGTyBhbmQgbm9uLUZJRk8gbW9kZQ0KPiA+IG9w
ZXJhdGlvbi4gUlovRzNFIGhhcyA2IGNsb2Nrcyg1IG1vZHVsZSBjbG9ja3MgKyAxIGV4dGVybmFs
IGNsb2NrKQ0KPiA+IGNvbXBhcmVkIHRvIDMgY2xvY2tzDQo+ID4gKDIgbW9kdWxlIGNsb2NrcyAr
IDEgZXh0ZXJuYWwgY2xvY2spIG9uIFJaL1QySCwgYW5kIGl0IGhhcyBtdWx0aXBsZSByZXNldHMu
DQo+ID4gSXQgaGFzIDYgaW50ZXJydXB0cyBjb21wYXJlZCB0byA0IG9uIFJaL1QySC4NCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4N
Cj4gPiAtLS0NCj4gPiB2NC0+djU6DQo+ID4gICogVXBkYXRlZCBjb21taXQgZGVzY3JpcHRpb24g
cmVsYXRlZCB0byBJUlEgZGlmZmVyZW5jZQ0KPiA+ICAqIEFkZGVkIGFlZCBhbmQgYmZkIGlycXMg
Zm9yIFJaL0czRS4NCj4gPiAgKiBNb3ZlZCByZXNldDogZmFsc2UgdG8gUlovVDJIIFNvQyBhbmQg
ZHJvcHBlZCB0aGUgZWxzZSBwYXJ0IGZvciBSWi9HM0UuDQo+ID4gICogVXBkYXRlZCBjb25kaXRp
b25hbCBzY2hlbWEgd2l0aCBpbnRlcnJ1cHRzIGFuZCBpbnRlcnJ1cHRzLW5hbWVzLg0KPiA+ICAq
IERyb3BwZWQgdGhlIHRhZyBhcyB0aGVyZSBhcmUgbmV3IGNoYW5nZXMuDQo+ID4gdjMtPnY0Og0K
PiA+ICAqIERyb3BwZWQgc2VwYXJhdGUgY29tcGF0aWJsZSBmb3Igbm9uLUZJRk8gbW9kZSBhbmQg
aW5zdGVhZCB1c2luZyBzaW5nbGUNCj4gPiAgICBjb21wYXRpYmxlICJyZW5lc2FzLHI5YTA5ZzA0
Ny1yc2NpIiBhcyBub24tRklGTyBtb2RlIGNhbiBiZSBhY2hpZXZlZA0KPiA+ICAgIGJ5IHNvZnR3
YXJlIGNvbmZpZ3VyYXRpb24uDQo+ID4gICogUmVuYW1lZCBjbG9jay1uYW1lcyBidXMtPnBjbGsN
Cj4gPiAgKiBSZWFycmFuZ2VkIGNsb2NrLW5hbWVzIHRjbGt7NCwgMTYsIDY0fQ0KPiA+ICAqIFJl
dGFpbmVkIHRoZSB0YWcgYXMgdGhlIGNoYW5nZXMgYXJlIHRyaXZpYWwuDQo+ID4gdjItPnYzOg0K
PiA+ICAqIERyb3BwZWQgMXN0IGFuZCAzcmQgaXRlbXMgZnJvbSBjbGstbmFtZXMgYW5kIGFkZGVk
IG1pbkl0ZW1zIGZvciB0aGUNCj4gPiAgICByYW5nZS4NCj4gPiAgKiBBZGRlZCBtaW5JdGVtcyBm
b3IgY2xrIGFuZCBjbGstbmFtZXMgZm9yIFJaL1QySCBhcyB0aGUgcmFuZ2UgaXMgMi0zDQo+ID4g
ICogQWRkZWQgbWF4SXRlbXMgZm9yIGNsayBhbmQgY2xrLW5hbWVzIGZvciBSWi9HM0UgYXMgdGhl
IHJhbmdlIGlzIDUtNg0KPiA+ICAqIFJldGFpbmVkIHRoZSB0YWcgYXMgaXQgaXMgdHJpdmlhbCBj
aGFuZ2UuDQo+ID4gdjEtPnYyOg0KPiA+ICAqIFVwZGF0ZWQgY29tbWl0IG1lc3NhZ2UNCj4gPiAg
KiBBZGRlZCByZXNldHM6ZmFsc2UgZm9yIG5vbiBSWi9HM0UgU29Dcy4NCj4gPiAtLS0NCj4gPiAg
Li4uL2JpbmRpbmdzL3NlcmlhbC9yZW5lc2FzLHJzY2kueWFtbCAgICAgICAgIHwgOTkgKysrKysr
KysrKysrKysrKy0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgODggaW5zZXJ0aW9ucygrKSwgMTEg
ZGVsZXRpb25zKC0pDQo+ID4NCj4gDQo+IE15IGJvdCBmb3VuZCBlcnJvcnMgcnVubmluZyAnbWFr
ZSBkdF9iaW5kaW5nX2NoZWNrJyBvbiB5b3VyIHBhdGNoOg0KPiANCj4geWFtbGxpbnQgd2Fybmlu
Z3MvZXJyb3JzOg0KPiANCj4gZHRzY2hlbWEvZHRjIHdhcm5pbmdzL2Vycm9yczoNCj4gRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RoZXJtYWwvdGhlcm1hbC16b25lcy5leGFtcGxl
LmR0YjogL2V4YW1wbGUtMC9zb2MvdGhlcm1hbC0NCj4gc2Vuc29yQGMyNjMwMDA6IGZhaWxlZCB0
byBtYXRjaCBhbnkgc2NoZW1hIHdpdGggY29tcGF0aWJsZTogWydxY29tLHNkbTg0NS10c2Vucycs
ICdxY29tLHRzZW5zLXYyJ10NCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Ro
ZXJtYWwvdGhlcm1hbC16b25lcy5leGFtcGxlLmR0YjogL2V4YW1wbGUtMC9zb2MvdGhlcm1hbC0N
Cj4gc2Vuc29yQGMyNjMwMDA6IGZhaWxlZCB0byBtYXRjaCBhbnkgc2NoZW1hIHdpdGggY29tcGF0
aWJsZTogWydxY29tLHNkbTg0NS10c2VucycsICdxY29tLHRzZW5zLXYyJ10NCj4gRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RoZXJtYWwvdGhlcm1hbC16b25lcy5leGFtcGxlLmR0
YjogL2V4YW1wbGUtMC9zb2MvdGhlcm1hbC0NCj4gc2Vuc29yQGMyNjUwMDA6IGZhaWxlZCB0byBt
YXRjaCBhbnkgc2NoZW1hIHdpdGggY29tcGF0aWJsZTogWydxY29tLHNkbTg0NS10c2VucycsICdx
Y29tLHRzZW5zLXYyJ10NCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RoZXJt
YWwvdGhlcm1hbC16b25lcy5leGFtcGxlLmR0YjogL2V4YW1wbGUtMC9zb2MvdGhlcm1hbC0NCj4g
c2Vuc29yQGMyNjUwMDA6IGZhaWxlZCB0byBtYXRjaCBhbnkgc2NoZW1hIHdpdGggY29tcGF0aWJs
ZTogWydxY29tLHNkbTg0NS10c2VucycsICdxY29tLHRzZW5zLXYyJ10NCj4gRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RoZXJtYWwvdGhlcm1hbC1zZW5zb3IuZXhhbXBsZS5kdGI6
IC9leGFtcGxlLTAvc29jL3RoZXJtYWwtDQo+IHNlbnNvckBjMjYzMDAwOiBmYWlsZWQgdG8gbWF0
Y2ggYW55IHNjaGVtYSB3aXRoIGNvbXBhdGlibGU6IFsncWNvbSxzZG04NDUtdHNlbnMnLCAncWNv
bSx0c2Vucy12MiddDQo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aGVybWFs
L3RoZXJtYWwtc2Vuc29yLmV4YW1wbGUuZHRiOiAvZXhhbXBsZS0wL3NvYy90aGVybWFsLQ0KPiBz
ZW5zb3JAYzI2MzAwMDogZmFpbGVkIHRvIG1hdGNoIGFueSBzY2hlbWEgd2l0aCBjb21wYXRpYmxl
OiBbJ3Fjb20sc2RtODQ1LXRzZW5zJywgJ3Fjb20sdHNlbnMtdjInXQ0KPiBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvdGhlcm1hbC90aGVybWFsLXNlbnNvci5leGFtcGxlLmR0Yjog
L2V4YW1wbGUtMC9zb2MvdGhlcm1hbC0NCj4gc2Vuc29yQGMyNjUwMDA6IGZhaWxlZCB0byBtYXRj
aCBhbnkgc2NoZW1hIHdpdGggY29tcGF0aWJsZTogWydxY29tLHNkbTg0NS10c2VucycsICdxY29t
LHRzZW5zLXYyJ10NCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RoZXJtYWwv
dGhlcm1hbC1zZW5zb3IuZXhhbXBsZS5kdGI6IC9leGFtcGxlLTAvc29jL3RoZXJtYWwtDQo+IHNl
bnNvckBjMjY1MDAwOiBmYWlsZWQgdG8gbWF0Y2ggYW55IHNjaGVtYSB3aXRoIGNvbXBhdGlibGU6
IFsncWNvbSxzZG04NDUtdHNlbnMnLCAncWNvbSx0c2Vucy12MiddDQo+IA0KDQpDYW4geW91IHBs
ZWFzZSBjaGVjaywgYm90IGlzIHNob3dpbmcgdW5yZWxhdGVkIGVycm9ycz8NCg0KQ2hlZXJzLA0K
QmlqdQ0K

