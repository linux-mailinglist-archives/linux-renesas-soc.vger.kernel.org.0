Return-Path: <linux-renesas-soc+bounces-25327-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E63DCC926B5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 16:11:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78B273A4EC1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 15:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6790A32E6B1;
	Fri, 28 Nov 2025 15:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="AtLfMI0t"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010038.outbound.protection.outlook.com [52.101.229.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E9130BBB7;
	Fri, 28 Nov 2025 15:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764342659; cv=fail; b=SajR17zjy2VIk4gT5yPDV95QH/zdXAcW/UDeJlqmaYIJP3FFsrXIofQUAgcx7StOoNyl5RIA0tG0gIxgzrhL+EqqsMMiZOHsfh0sEI4J95tVgGq+v+tziNDacOZQM1liXXRUJiOPkoqvXu4DHjztAFH5X4U+KZeytx0Uyg+yx88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764342659; c=relaxed/simple;
	bh=+bxnpLBtt5qW2pBtEE8AgT5MApnYbUnr5tEhlmVrG6M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DyCZLIRrfzdi9XiZo6p5z85vkwFtyk3WwA3nQ/dBJ4nJBvs7HC3WY4iHvKSG/KVUFjzoJ6JVpEE2BI8r316qAFjsUqzHGUtXWyR3I/z1vd42QxZIGgPk2qRSg6QoXjGlX+bGP5i3EF4ZKSiRqoUPb0lCwblwSoe6J4gB8inSyHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=AtLfMI0t; arc=fail smtp.client-ip=52.101.229.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fmr1Lv3Lu9cg8w5CXLATmd648J90j6phXHtQQhce643AmkR+PiJ1C6iPDOKiJ1QzTolrvrliHb977WpnzXR2cwoR+8CqCMWJzFYHifQgkdUMXiE9rAcM7hHjwybhgrNSCXfkd2zWlC7tVbO2GuKWwhqlp9gme7tHGPCe9iuRkgytpnohj1Tjr/se6zusvOcK9WMagfNFnL4X04YBAdJKrejHrurZVt07jmopQlUxSaga5o4gwnstOmkEoDhfDGjqageQVViz0mvPjrkKW5R+tP64HNOJH/yFKeglnLS3N/6jlTWVqFY0qhkzAHPN8hb7ag7JoD0n+ah0dR8YpcRMwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+bxnpLBtt5qW2pBtEE8AgT5MApnYbUnr5tEhlmVrG6M=;
 b=fVbsFONmvkbOFLtsr50AgYKA33+w1iyhhC2uHiY+R0ipF2JXHHCYcY6Ar7ghHRO/AnWe0Pe5W2i6aFkhev4rtKfUF/w6PcKDJ4XxXTvenLoISoe3cvFGBO6GOP973ZibCWT7HAHqNUinzpWFowe/PF7nslDXEBTFvD5ioY7CVU/+oKvK2xqNBEvLnELboMZLpcGfT47e+fWLpHBGEl6EbHgio6AxOpMVcwLGHN4vqfrDVGbbeJc5PtKaOU1tN4Xc2vvh2vwN7FH6hEfdiiLc8XPMItR1WdfrSWO7y7reODpJaHe2IPD8M7HWcuHscQ6riubFOKu6WfVJ3QEI2CWatA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bxnpLBtt5qW2pBtEE8AgT5MApnYbUnr5tEhlmVrG6M=;
 b=AtLfMI0tvaGS6YVTVu/dsQLVeCbrjoBFLmNkyN8VQMHP+pnQanZG2fMHftBeq0FULcw3a6cGVVKNXJmQk2AsBGXu1xvn45wQ/dOmNZdJO/feSI3EKqt0ukxdLYjD26ogDGwZsqMNRnab26217D85WPn+5ClJsEPU81hdqqZ0Zn8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB7098.jpnprd01.prod.outlook.com (2603:1096:604:13f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.6; Fri, 28 Nov
 2025 15:10:50 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9388.003; Fri, 28 Nov 2025
 15:10:45 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
	<linux-serial@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: RE: [PATCH v4 01/16] dt-bindings: serial: renesas,rsci: Document
 RZ/G3E support
Thread-Topic: [PATCH v4 01/16] dt-bindings: serial: renesas,rsci: Document
 RZ/G3E support
Thread-Index: AQHcXh0bVzrle3W7okC71p3jKSGrkrUID8SAgAAlozA=
Date: Fri, 28 Nov 2025 15:10:45 +0000
Message-ID:
 <TY3PR01MB1134676EBFEF0DDBD1E81912286DCA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251125150632.299890-1-biju.das.jz@bp.renesas.com>
 <20251125150632.299890-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdVaqnCmHBk+Zxo23KU7e+GuH022nDgpR59dH6K8Ei9O4Q@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVaqnCmHBk+Zxo23KU7e+GuH022nDgpR59dH6K8Ei9O4Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB7098:EE_
x-ms-office365-filtering-correlation-id: ae6e7372-b0ba-4b4a-162a-08de2e904e00
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Slo4ODQwbUxGZHc2UkdaeXVuQnNseTUyV1R2ZlUxTzF0Nk1UMlh1eFZZWXFx?=
 =?utf-8?B?QUREMFZucERBQnVidTJmRjhXeXdRTHNhRGhlNHN1aGdpY2NOeFIvQ0hieHIx?=
 =?utf-8?B?bUFrOHc4b2M4b0FFN040dUxDRWVDWlJlQkduSWxzVHZPakxNcFBJZW15Z2E1?=
 =?utf-8?B?Ynk2R2pLU3pIN1QvMEdNMUhVQXUyenB6NTAzbGlyTHBud0tiYUJMYldaL0RB?=
 =?utf-8?B?THQxMURFdG1VYUNGRE1keXU0KzVjSWhRek5aRGw2ZkRtOG9vUWNwaFYzOXEx?=
 =?utf-8?B?OHZkMlpwNHhPMUQwTnF5dnpLSlFrdm15dnlBcEJxVXRNYXNRbzZxaFR3Q0po?=
 =?utf-8?B?cnNzQVNmVExBYzdGWE5yY1JYYVJYTGFDbGxrVkk0amlkZjJ4T1N4ZTFkSkx1?=
 =?utf-8?B?QkszTFpMYmFyTit6ZGR0NVFKdGdkY3JDUnlEVkp4OW81Wm9xL3BJM1Q0enNT?=
 =?utf-8?B?TU1EaFQ4VGpBbktxRUlDU1FEUHhDTFBNOFNPVmMxUVd2Y1Z1NTcyRWxrSTRC?=
 =?utf-8?B?akVpUXJvSW5CMUZaajVxRGtHRnJuUy9GbkVxcTVEeVF3c2F4TzRhemN0UEdG?=
 =?utf-8?B?Um01Mk11bTlVVU5ZK1V0d0x2WU1Jd3hUcDVCRlY0T0VZbzVlQlI5aTg5RnZ5?=
 =?utf-8?B?UTNsb01tdHBlMGFqUUdzdVNlYnY5amRnUHJQdDlHSlFSb3gwcTVHcGZHQmZ3?=
 =?utf-8?B?cFk1WUNUSkR0WXZjSnJEOGlWTGZsNUx1aXVnT1RTVitZc2k3bVVGUGhUeWtu?=
 =?utf-8?B?Y2kxdnBkZnhaaVp5MXlyMGVHNEVZaExzOXZHSzN1dWRxc3l4NUZPbi8zRlgv?=
 =?utf-8?B?UkRpRmcySjZYeGFvcVQxQWQ3NkdhQ2NYa1IvcU1EVUJhMCtlYndleTEzYlZN?=
 =?utf-8?B?Y01KaWNHU1YzcVJvU0RyTmRXSGJGY1hBNFFzeHNWVkdPU051RzFBMW5aY2pR?=
 =?utf-8?B?S2xHbFJGTnVOMDZibmFuSEhPUkxjLy9TclAzYnMrTjZSN3dGMUdHVEVCVGwy?=
 =?utf-8?B?L0RURmd2dnZoMXcwVURPREQwS01DcVM2alkxUjhpLzgyd2J3THlGUFF5UWJN?=
 =?utf-8?B?a2h6SHhURUhYWXp3YjlxUHZCNHFNN0hPVlM0ZWlGSU85c0tQajdVTjZKaEdv?=
 =?utf-8?B?NVBDNktXSFhKU2ZZYUhzbW1ZWlM1bENjQnpIdGF0eGEyMWtKWkJxSFQ2RDBi?=
 =?utf-8?B?YnJzQnJEYzNRMFJNSm80dGo1SlZIZEhMNkwyb1IvZzVZTXJLS1NySldzWUNr?=
 =?utf-8?B?d1Fjenl1U2o0dEJaMmcxZ205aXdaQ3FlNlU5ZzY5ZHh3Vjd2UGpzMGVTWkRY?=
 =?utf-8?B?TlFLbVAyalhiU2gva05rMGNkSXlTVk94QWRMMlNUM2Mwc3h4UWhleGtGaWRp?=
 =?utf-8?B?TFF5bktrZklwZ1UrWlFYZG03dllEUTVHejZQRHZJVVdzMHhqaWdveE0wckRv?=
 =?utf-8?B?Sk9FM2hjVGIza1ZhSmMzZFRYVjFsdjFyV0JWeXhTYmc1V0VzakhHaDlTOFJK?=
 =?utf-8?B?MDY0TEpWdW9Hc01tZHU3S0pZZWtLejB6Rnp5MloxSkpMK2ZoNUxZVmQrTVg1?=
 =?utf-8?B?WnRNSVFRRXgvekRzdEJaNTBITUg2OE4waTliOXZaL2JhdVBTcXZobEpDalk1?=
 =?utf-8?B?cGozTkpkVjBENGtvSVZQcjY1K2xGQ29HVG5ZaElWNnh0QlNUbDdLUkhiTXF1?=
 =?utf-8?B?ZGRBR0ZMdUd3Wmp2cmRCNEoxQkdqRVE4RXhQc3d4bHI2eU92UllTVW1oUmNt?=
 =?utf-8?B?RmM4ekhFLzl6NkxobnNHMEcrK2JlSmpTRTI1SFZHTDFMZlRVOWJYQzd4Q0NF?=
 =?utf-8?B?MlBla2JjS2hTQ3VxU09BbXA1Z0orWEwxa1F3bDJSMmFHSjhIMVUycmo3MWh2?=
 =?utf-8?B?NmJSRG9jcEVFUmVlRDV0dUFhRldiOXRuSXdReHk5L0NZT25DR093ZGQ4ZGJZ?=
 =?utf-8?B?ekVjVEdpY2J6UDgrTjNZOERkTUJydmdOVmlxTmh3ZFBiZDNOZTNxVzhFUmlH?=
 =?utf-8?B?TnlrNzZ6bGdEazUzQThTaUxhaTZ5WVNrUEVFU0tsQ1R1QUlUSDVNK3NhYTIx?=
 =?utf-8?Q?SjGaEc?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dnlIbWpVNzNKdVJURE1vWG1yV2FVZmhYS1FmUkk1WHN3bUNEeWdBaEFZY3Ja?=
 =?utf-8?B?SUlsNDA3YjRkejRxTWZHRXFqSVdxOTNLZ1E2eVF1Q1pwaXpSYUlPVGJNUkN3?=
 =?utf-8?B?SGE1VHhoZEVoa3V2U09DMElHd04xOVBJZFJkVE42YXJqVldWUSsxY2M1blBS?=
 =?utf-8?B?ZUtCM1UweFo3dUZRcVJSQ0U5UjJ3QWxIdFYwTjkzTG9qaENwelVEcnA0VHVp?=
 =?utf-8?B?ZXhPNFV3cnJiVTNLVTg1ZFRtUE1ScG96Vk1EUU1IckEySTM0R09QOExZMTNV?=
 =?utf-8?B?SUVtWVVNR0hQMXdxYkRTYmZYdkVjZjJJRXlQNXU5aUxiYzlSc1ArdGJ1LzF6?=
 =?utf-8?B?YjdVUFZzTzhyZFNZQTN4YVY2M1dEZkE4QU5Ed0trWTAvTWlvRnByYkVUdXhq?=
 =?utf-8?B?WGVaRnRuNWRlNnBoaUd5KzZLbm9xOUkrbmZtNnBQSThMZ1Y5aWtXNVp4dGRU?=
 =?utf-8?B?Qk9SQzNXVVZDaFcrQmM3SE1XbmN3WmNabUJsVXpRNVlSQWQ3QjM1WGx3LzRt?=
 =?utf-8?B?OU1YdVNkSzMyNFRHSTBqNFhaYktUbHpiaWJINnVIbGFjVVozNUtJVnpGOS8y?=
 =?utf-8?B?WS91NDlyUFo2SzA4azdlUHNJaHR1RU80TjJLV0ZkcWhVZ0hJRDRIOUdQTk1I?=
 =?utf-8?B?clcySnF4SDlubHU3YzQ1K0Y5RU51WC9MZ053Vm1kbi9sTFVmMW1UWnE3QWVy?=
 =?utf-8?B?S3dMdk15aU9EN1NJc0pMeGN1THQ3Rm1qZFlpNndnSmtlQ1FZWENaOXFzbE5h?=
 =?utf-8?B?bVovQStySnFhRTJjcEtTU0IwMFZ2SnZLRC9iamtuTE1wdGxGcGNkdzd4ZE1F?=
 =?utf-8?B?QTZCRVdWdU56YmNWbjZUNlJWR1RSWXJPd2FBMCt5dFE2U2xvQ0k3M1RQdW8z?=
 =?utf-8?B?Y2N0dkhDK1hxanFkTmQ5eUQwS1RYMHJMNWQwVW9iS1VxeWNFMEZyT3lINUlJ?=
 =?utf-8?B?bW9aT3ZXMHdTZFRZRFNhZWZ1Y2pBTVRRSmNaNVVXL3I0S0VVZjBXUWVhUU9h?=
 =?utf-8?B?MUNxYVhZaXNsSFRaL3VqOVFQa3J1dmdIWXBwWUtKM3RwNXR1cVJ2ZmFEcXZE?=
 =?utf-8?B?eXRIalRCeE1MZkd3TzJ4d2prVWt5Zm1lSnZZQWFINU4xSTJheXBHR0JORnFx?=
 =?utf-8?B?ZW9zdFV6WFVIUkJjQ0tiNHl2RWt6NkdkUjZFZnYvangxbytkcWZtdGxrRlhX?=
 =?utf-8?B?SFd0VUtBYnNlamR4Q244a25VS2M0eWgveUorS2lUTVRQRnQyTncveVRhTkZE?=
 =?utf-8?B?OG1iVDF5RDNHMHJCamtXM0tIVU0xajFtdkZBVU53VDVLbnVkQ1daUk1iOWZ5?=
 =?utf-8?B?dnYrU1ZjU2F1RFN1bmN0VTlKOWJDNkFNVGJBM2FBNDNMKys5MkhZMktmWDkw?=
 =?utf-8?B?L0RiMjNoSTBqMnIrNE9NNUovUE12Qlc4U1JJMEs0UzZ4S0xlQWJORGZCWHl3?=
 =?utf-8?B?bUxxVjk2cG14UjZVclVHZlpzNjZDRi9rK3hGL0lGaHhlb2FsSVI1TGpUb1di?=
 =?utf-8?B?cnZRdDlyZ2NyNXFDWEtHRjh6b2sxc0pUdTlxNWFkZ2hBNmNMeWRROC8yUGp6?=
 =?utf-8?B?L1JWVTdIOEhEbUY4dzJ1M2Nqa0tkZHFTM1ZRR0Y2VngxL2lUU0dLQlNNK2dJ?=
 =?utf-8?B?TmJ0YS9hUGZIK1V4UHNKZlRZRnB1a0kyUzF4ZWZoazl5V1BLR0tvTHhFbWZI?=
 =?utf-8?B?YVNyWkp0UU1QOTVheFZJSUVPU2pTYlgzT2dhUU0xZmlIYjVNOUZZWnpBT2E0?=
 =?utf-8?B?VzArclFncWQ0VkcwQnh1M3FsSE9Vc0VtQm42Zk5NOHhPbnhhQUR1bTl2RG5B?=
 =?utf-8?B?Qm44bWlzODF2QnBNZXdPNEdRYnYrU0ZPV05LS1paeTZKeVVTajZxaWFlNjB0?=
 =?utf-8?B?OEs4cUo4eG0zTDAxbzhvWVFxMWFQQ042bVdkcXplUTlSdlBmZlNKMHdmUzFD?=
 =?utf-8?B?anA2V3lwdUFtTWprSDZySlRzYm9OWERjWG9WS3M4bzFudS9OOUlqZVAzOGs1?=
 =?utf-8?B?TkJqY0dCOG9xdjdMa1p3UFBxbmhkY1BzcTRKeEdVcmt3OG9QQS9MNzZlM05E?=
 =?utf-8?B?ckZuVU5vS3ZlSXVvYWpUbVoya2k3azZ1Tlk3TU5QbTc0UkpDVUU5Q0VLbith?=
 =?utf-8?B?azFLNVdQQ1U4R2FBY1E1QlRtY1R3L1lib3JYeFJOTGJsRlU5QVFsditSQi9Z?=
 =?utf-8?B?aGc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ae6e7372-b0ba-4b4a-162a-08de2e904e00
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2025 15:10:45.1586
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PJ8cwFdoDe3qOnUhyLt/HJQX9ev93PioAVyGUqzOY3JwGvDKA20SipB2IzTkszMAYdDPlsF6gFXCov4+xLjYajurze8syjgmu4CAyR7GFSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7098

SGkgR2VlcnQgVXl0dGVyaG9ldmVuLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdl
ZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50OiAyOCBOb3ZlbWJlciAyMDI1IDEyOjU0DQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMDEvMTZdIGR0LWJpbmRpbmdzOiBzZXJpYWw6IHJlbmVzYXMs
cnNjaTogRG9jdW1lbnQgUlovRzNFIHN1cHBvcnQNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBU
dWUsIDI1IE5vdiAyMDI1IGF0IDE2OjA2LCBCaWp1IDxiaWp1LmRhcy5hdUBnbWFpbC5jb20+IHdy
b3RlOg0KPiA+IEZyb206IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4g
Pg0KPiA+IEFkZCBkb2N1bWVudGF0aW9uIGZvciB0aGUgc2VyaWFsIGNvbW11bmljYXRpb24gaW50
ZXJmYWNlIChSU0NJKSBmb3VuZA0KPiA+IG9uIHRoZSBSZW5lc2FzIFJaL0czRSAoUjlBMDlHMDQ3
KSBTb0MuIFRoZSBSU0NJIElQIG9uIHRoaXMgU29DIGlzDQo+ID4gaWRlbnRpY2FsIHRvIHRoYXQg
b24gdGhlIFJaL1QySCAoUjlBMDlHMDc3KSBTb0MsIGJ1dCBpdCBoYXMgYSAzMi1zdGFnZQ0KPiA+
IEZJRk8gY29tcGFyZWQgdG8gMTYgb24gUlovVDJILiBJdCBzdXBwb3J0cyBib3RoIEZJRk8gYW5k
IG5vbi1GSUZPIG1vZGUNCj4gPiBvcGVyYXRpb24uIFJaL0czRSBoYXMgNiBjbG9ja3MoNSBtb2R1
bGUgY2xvY2tzICsgMSBleHRlcm5hbCBjbG9jaykNCj4gPiBjb21wYXJlZCB0byAzIGNsb2Nrcw0K
PiA+ICgyIG1vZHVsZSBjbG9ja3MgKyAxIGV4dGVybmFsIGNsb2NrKSBvbiBSWi9UMkgsIGFuZCBp
dCBoYXMgbXVsdGlwbGUgcmVzZXRzLg0KPiA+DQo+ID4gQWNrZWQtYnk6IENvbm9yIERvb2xleSA8
Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+IHYzLT52NDoNCj4gPiAg
KiBEcm9wcGVkIHNlcGFyYXRlIGNvbXBhdGlibGUgZm9yIG5vbi1GSUZPIG1vZGUgYW5kIGluc3Rl
YWQgdXNpbmcgc2luZ2xlDQo+ID4gICAgY29tcGF0aWJsZSAicmVuZXNhcyxyOWEwOWcwNDctcnNj
aSIgYXMgbm9uLUZJRk8gbW9kZSBjYW4gYmUgYWNoaWV2ZWQNCj4gPiAgICBieSBzb2Z0d2FyZSBj
b25maWd1cmF0aW9uLg0KPiA+ICAqIFJlbmFtZWQgY2xvY2stbmFtZXMgYnVzLT5wY2xrDQo+ID4g
ICogUmVhcnJhbmdlZCBjbG9jay1uYW1lcyB0Y2xrezQsIDE2LCA2NH0NCj4gPiAgKiBSZXRhaW5l
ZCB0aGUgdGFnIGFzIHRoZSBjaGFuZ2VzIGFyZSB0cml2aWFsLg0KPiANCj4gVGhhbmtzIGZvciB0
aGUgdXBkYXRlIQ0KPiANCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc2VyaWFsL3JlbmVzYXMscnNjaS55YW1sDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9yZW5lc2FzLHJzY2kueWFtbA0KPiANCj4gPiBAQCAtNjIs
NiArODIsNDYgQEAgcmVxdWlyZWQ6DQo+ID4gICAgLSBjbG9jay1uYW1lcw0KPiA+ICAgIC0gcG93
ZXItZG9tYWlucw0KPiA+DQo+ID4gK2FsbE9mOg0KPiA+ICsgIC0gJHJlZjogc2VyaWFsLnlhbWwj
DQo+ID4gKw0KPiA+ICsgIC0gaWY6DQo+ID4gKyAgICAgIHByb3BlcnRpZXM6DQo+ID4gKyAgICAg
ICAgY29tcGF0aWJsZToNCj4gPiArICAgICAgICAgIGNvbnRhaW5zOg0KPiA+ICsgICAgICAgICAg
ICBjb25zdDogcmVuZXNhcyxyOWEwOWcwNzctcnNjaQ0KPiA+ICsgICAgdGhlbjoNCj4gPiArICAg
ICAgcHJvcGVydGllczoNCj4gPiArICAgICAgICBjbG9ja3M6DQo+ID4gKyAgICAgICAgICBtaW5J
dGVtczogMg0KPiA+ICsgICAgICAgICAgbWF4SXRlbXM6IDMNCj4gPiArDQo+ID4gKyAgICAgICAg
Y2xvY2stbmFtZXM6DQo+ID4gKyAgICAgICAgICBtaW5JdGVtczogMg0KPiA+ICsgICAgICAgICAg
bWF4SXRlbXM6IDMNCj4gPiArDQo+ID4gKyAgLSBpZjoNCj4gPiArICAgICAgcHJvcGVydGllczoN
Cj4gPiArICAgICAgICBjb21wYXRpYmxlOg0KPiA+ICsgICAgICAgICAgY29udGFpbnM6DQo+ID4g
KyAgICAgICAgICAgIGNvbnN0OiByZW5lc2FzLHI5YTA5ZzA0Ny1yc2NpDQo+ID4gKyAgICB0aGVu
Og0KPiA+ICsgICAgICBwcm9wZXJ0aWVzOg0KPiA+ICsgICAgICAgIGNsb2NrczoNCj4gPiArICAg
ICAgICAgIG1pbkl0ZW1zOiA1DQo+ID4gKyAgICAgICAgICBtYXhJdGVtczogNg0KPiA+ICsNCj4g
PiArICAgICAgICBjbG9jay1uYW1lczoNCj4gPiArICAgICAgICAgIG1pbkl0ZW1zOiA1DQo+ID4g
KyAgICAgICAgICBtYXhJdGVtczogNg0KPiA+ICsNCj4gPiArICAgICAgcmVxdWlyZWQ6DQo+ID4g
KyAgICAgICAgLSByZXNldHMNCj4gPiArICAgICAgICAtIHJlc2V0LW5hbWVzDQo+ID4gKyAgICBl
bHNlOg0KPiA+ICsgICAgICBwcm9wZXJ0aWVzOg0KPiA+ICsgICAgICAgIHJlc2V0czogZmFsc2UN
Cj4gDQo+IFdoaWxlIHRlY2huaWNhbGx5IGNvcnJlY3QsIHBsZWFzZSBtb3ZlIHRoZSBjb250ZW50
cyBvZiB0aGUgImVsc2UiIGJyYW5jaCB0byB0aGUgImlmIC4uLg0KPiByZW5lc2FzLHI5YTA5ZzA3
Ny1yc2NpIiBhYm92ZSwgdG8gaW5jcmVhc2UgdW5pZm9ybWl0eS4NCg0KT0ssIHdpbGwgbW92ZSAi
cmVzZXRzOiBmYWxzZSIgdGhlcmUuDQoNCj4gDQo+IEFsc28sIFJaL0czRSBSU0NJIGhhcyB0d28g
bW9yZSBpbnRlcnJ1cHRzOiBBRUQgKGFjdGl2ZSBlZGdlIGRldGVjdGlvbikgYW5kIEJGRCAoYnVz
IGNvbGxpc2lvbg0KPiBkZXRlY3Rpb24pLiAgU29ycnkgZm9yIG1pc3NpbmcgdGhhdCBiZWZvcmUu
DQoNCk9vcHMuIFdpbGwgYWRkIHRoaXMgYXMgd2VsbC4NCg0KQ2hlZXJzLA0KQmlqdQ0K

