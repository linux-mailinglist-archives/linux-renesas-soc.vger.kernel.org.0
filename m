Return-Path: <linux-renesas-soc+bounces-27878-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eENwH3Iyg2kwjAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27878-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 12:50:10 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 208C3E551D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 12:50:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C7BE30107E4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 11:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F16A53D6480;
	Wed,  4 Feb 2026 11:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="e+rh4ZIU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010021.outbound.protection.outlook.com [52.101.229.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C013D3CF2;
	Wed,  4 Feb 2026 11:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770205791; cv=fail; b=TTnRTW82WOMjALjdoe4NP2R8ILWJuEb00rmlpL6PEofQv9VM0inIo5V+lv6h4JS7PBtGti4nEPexe6MUZtZ//sCi6H/5L2vH7J7fBQUID+TiinekMpj1eCe21Se+TqnQoGqOP4b6pfj/pIfXsLlDdEiY7GTts68jUO0FBIIJOO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770205791; c=relaxed/simple;
	bh=l3W3LAncC6us64w2pF7C7XTl4hw4qDIn7aQOrTlputc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gWoWYVEPjla8Pj6OiR3FCW7c1ieZnkoYAx+nZjK3pHK3NCHJmGqy7BqK7TxSrpdXsn8F2hsHIx8USx0BBJgG32M7TNHFyODI4s4/tLhVk8qkRDWJOgjfZ3D8g4oiH++VA3ODhxZKlsib3ecModWLNQVQBgAC5Y9EmViNqxCMkWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=e+rh4ZIU; arc=fail smtp.client-ip=52.101.229.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q4UjiZwyCi+M9ff7BqeIuKU8/1K4YymqmuN+K6gysHoTTR1RATsMnAYuKFkiuSa50M2vqa/v0EnuNfPerbDi3mFmNjuQ+VcZ9n4kbLBtGRVEGnkqZyFvzEWA4xCkvXJQlcRY3p0cI9xU5CvgtKKrMlgh+cXBS6r26T74WbI+kXcPaiHCrGbdNhuNGpjtA+2cuM+UwoKPaaM1Zuj3f+2kepdlE+AvKqNvwQ3ELLPo6K5zoI/msPeAYuh5CJhKfPLVB9zFHbYw9tINsm1yWA/1lQD75pJJVjVdB4ItepG+B8NxMjnsHaUUC7Ebo9nFh4cv8CSbThGCiVxpWuI+cST3LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3W3LAncC6us64w2pF7C7XTl4hw4qDIn7aQOrTlputc=;
 b=k/giNa+hgsU63RBDJo0IkawJMwdxu4iwcwGiMjajYgrAQGeTMS15l4P2P7Xukp/fXdpo2uAWeMusTDlDyl3R3SCW+oqBikDyadjwdkCnFYxVuaV4HQ6Yp0JvtjFnMZp00brNZUFC1VOPMFdSLWdmmkVedOoNXGpqCW58yztcQGNcRFoQ+jksF2wV69t2xkUVwRsbcCP/eifowTfrcY9uJXVto5SIzs+qV4eZQX0OplpJUify+LzWJff+aUneIe9LxBeB6TekioVOe6gYxObVL1HVFbQR4R+LV4IhvFwkm7ouJotBIJSt54NHB6FzogZC1a+tpQ0KxubzaaQubL3iLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3W3LAncC6us64w2pF7C7XTl4hw4qDIn7aQOrTlputc=;
 b=e+rh4ZIUT/mO3KCegBTgNLLrT3k3pHYYGNAA/7e5T9zxQIUYIAEvGRePvkUhadSwUK019dV4FlDGqB0rdwk5IGSBEmL3GFP/nSyAesPH4Um6ErewUI/hi/5CWsLjAdXd/Q9R6Tp2JDArpXD5gOp2aAOihWp62DI2DYKmP9H+89I=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB8558.jpnprd01.prod.outlook.com (2603:1096:400:171::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 11:49:47 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 11:49:47 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH net-next] dt-bindings: net: renesas,rzv2h-gbeth: Document
 Renesas RZ/G3L RMII{tx,rx} clocks
Thread-Topic: [PATCH net-next] dt-bindings: net: renesas,rzv2h-gbeth: Document
 Renesas RZ/G3L RMII{tx,rx} clocks
Thread-Index: AQHclPpD+OKdtNuh7EKVfsaMutonhbVyYooAgAALaAA=
Date: Wed, 4 Feb 2026 11:49:47 +0000
Message-ID:
 <TY3PR01MB113467ED7E58A5EB0CA8FEFF38698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260203104541.264759-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVpgzDAChz1M=hbVZTeHVKwiprPwLbe14nLKc85hX=ZTw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVpgzDAChz1M=hbVZTeHVKwiprPwLbe14nLKc85hX=ZTw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB8558:EE_
x-ms-office365-filtering-correlation-id: 2862dc07-b85d-42ce-63fa-08de63e37eec
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?MEFPcHQyY1d3TVVPdXR1THVnWFFIangxZkN6a1RjZE5GKzhHN0hKbkVhdWFO?=
 =?utf-8?B?cXpjVEoxa3dmazVkOTNibDN5L0NkT2FZWllHbVZXSUV4d01KSEFlU1pkVXFt?=
 =?utf-8?B?Y0FUTUZKd1ZvY3o3djd1VnNkYVJId2ZLMG5FQlV2YSsvSlB1VUo4UkthOXpq?=
 =?utf-8?B?SnZNZkp1WUltQi9PUmgwRHdEMXM1bG4vQzk5TjFGblFtYmdKdHVvVWhNQkli?=
 =?utf-8?B?OW4wYy9rb3BjbnF6VERqK3BsWmczbWliUlNIMkE1WkIrODNFaXQzV0hnSnFI?=
 =?utf-8?B?OXdtSWFJNFFCYjkzZlJ2QS8yR2JWbXV2ZGl6MDZEMHRrK0dOTmp0bTRwcFhq?=
 =?utf-8?B?S1piTW11VmpMb2tZWFM4QXo2YVcxbzJGM0V1eDBQMm40NlpNVlo1dUZ3NWJW?=
 =?utf-8?B?dlBJaVAzdzM2SE1VL0RUMFo0d3FxSW9Xbjgva1Z2aGYyeWJvVlEvektMaFYx?=
 =?utf-8?B?QjM5UjdKYUU3VnhnMlFRVDVkWGJ2aGc5cmJ3TWsybjRnWnJMQUVzb1ZZSDVW?=
 =?utf-8?B?RTE3b0tpdzk4MTBSWEJuVEdjeVI5NTdBQ01waHFUWWhBMURuQVlHdm9jSi9O?=
 =?utf-8?B?enByK1g3NFBiemNHbXdOM202cEkyK1R1a3VpdGhXOStXYnhyS0dBL0NSaitm?=
 =?utf-8?B?NEtIdlpwdExoYjMvb0VJUTlRVm9nV2hUTlZHSjIxaTB1bmNvbDkydWprV3pr?=
 =?utf-8?B?R3NUVEIvTkFlaE1lK2FOODNLTE4rZkRDcTNkYVhMdk53MEpNM0NYbktmTE0r?=
 =?utf-8?B?SFJ5bWQ4ZG55TXkvR3laNytWNkxYb3NOeUN4S3dlakt5aXNWd2QwUnpnTEV5?=
 =?utf-8?B?NlBObkVOL0wzYWlJeG81SW5waXVpRWtvSnVkOXRGSThmaktMYlJKZnpWWHA2?=
 =?utf-8?B?MUVPQWlpd3UxbTVuTFcxS2ZBSXJNanlxSkZ2K2pFWU55dkhxeEJoQzJGQmow?=
 =?utf-8?B?YmYwY3dkV3g3UWVwU0Y5aXc3SGJUMlRGbFFYclBBWUFldUR1dnlKeTVDTVpX?=
 =?utf-8?B?N25Sa0tlTGJVZHdNWDBzRmovUHpvMVBsUFRSZDJDM1h5V3UvYm5xem9uOExT?=
 =?utf-8?B?Y2V2U0p6Uk5lSWdhcTlrUWZQaFpoUzZLZk5jc2NqL2ljdE42RWdFT0prOFFD?=
 =?utf-8?B?bW1QRlVDYW5XYnlXVll6blUyVG0xYTNSRTVSRW1DcE9vZVpuWDF2aDdnaGU1?=
 =?utf-8?B?alJUditqbmdNZ1Ntem0wWEZXMmdrVHVNUGZFcVB6MW9CR1Z5R1lTQ2xoZ2kw?=
 =?utf-8?B?SWdJV2RFZEpheVRxYytGZ2NnbStrVkVaNE4xY0x2QlNuMkRrNDk0d0J4M0dw?=
 =?utf-8?B?N1NrUGdVbU5JN1F5RXJ4a2xXcmVRN3RDSWlxTzg1d1dKWHl5eTdSSHlud0tF?=
 =?utf-8?B?OTI0c3N0QXJLT3dlLzM3OXdoUThpeEVxTnRNTDhGbFBiUCtXMlVtRlo3ZkRS?=
 =?utf-8?B?RHRLYTVwOUE5bkZ5K0ttMG4xL3R1WTdTQXlyUWw5R0hoelNoWmZZekpiQVVr?=
 =?utf-8?B?R0U1eFg2NDlDNDFFY1A1S1kzK2RmVlpwRThZOFdwWG5vWDRQVFlJQklEbWYv?=
 =?utf-8?B?NXF1c0hJcm5tbWhaeStZenpXQmtPaEM5bnBkV0FvckZkOEVYdjNaaFhiNnNz?=
 =?utf-8?B?Q2Z5UTFyUFh3R2RCNW9XZG1oQkxDSHRBWVptQ05CdStkM0NLSms5bW5NM01D?=
 =?utf-8?B?NzdMSjZBU0FwdUk4WWdMZkdtVnRzeFpNMDZSblUvZ2RqbEEvVklIWERwaWRn?=
 =?utf-8?B?eHhkUWVaRVVGdCtjZzhtdkg5QmtvblorWm1TenRJRzFQUEFTUGJ1WW9nMU1h?=
 =?utf-8?B?aU5Udk9WTmJpdWhiTVlsL0kvSVVRbUpTRm4zZXpWTHc2VFJHY2wxUFFCUnMw?=
 =?utf-8?B?WUsveExxb0srUGwxZkZUOVRlMHVVaC8yUmlJSDJPQkNmWHpQNEdhOVBYZ2RQ?=
 =?utf-8?B?ZWxhdC9KRFFlMDJ2VlMzekxSTjZ0cXpZUHgyUmY5Z2xmVkNQdEl1QXljZzFN?=
 =?utf-8?B?aktMdDJYRFU4MWsvSFhVVlV0QmNkZXhVTFZ5ekVHRS9KaVRtTUZXbHdYaHY4?=
 =?utf-8?B?c2NLaEFhTFlVWGU5SXJuUU0rVEpDS3g3Z2oraitIMTV5dnFSbThxMmxXMXN6?=
 =?utf-8?B?N0tYMUtpck1NNEUvZ0JDYlZMTEw5RUc2VXVESWJLRUdGMnpEeUUrV3ZYd1Yv?=
 =?utf-8?Q?8+Ydh91WG3cXE1zw2I8/Ung=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M29JZlREN0R3SnM4NWdaQ0JtQVlxaFZTN3dadWpFQUNQNTBIcGZOMjU2a0xQ?=
 =?utf-8?B?dlNMU2dQTS9jSm5sSkNUbnNJbWpHWG0vNDFleUpjRHJ4SS9ZNExrVEl4MGFo?=
 =?utf-8?B?MFdZbTFnbWlDeUNSS1JKWWZRcE1uaDB4dFQ1eG9rSlJDSDhkQURCTGI0SHNM?=
 =?utf-8?B?WWZuR3JPT0J1eVJ4MUZOTlZ1RmN4YlNjdytUYWN2VVo3WnVZYjJKSlcwMUZE?=
 =?utf-8?B?WjdyS3pxWXAzbk54MW9nQUYrckJyQkhvSldIWEZWNFVROXY2cW9BcWV0K05S?=
 =?utf-8?B?UzYwVHlnNTFVZGdDdCtxODRwa21MV0ZFRFdidkJNNkdjeTFYRndxWXV0VTNO?=
 =?utf-8?B?L0FEZXlxaU1RbTlqK2crOEFHU2NLODZJSHJ0UDhjM2swZmhHUGVSKzFqczhP?=
 =?utf-8?B?R295MDRHeGZzUXU2L2M3NVBIWHFwci82M1VqNEVvMXY1Z2Vxbm9TOU5yb0NZ?=
 =?utf-8?B?aVgzVEtyT3FBaGRoSWRnZ3ppamVTRWNYUUR4NGZLbVJQS05CaklSWlUyNGZi?=
 =?utf-8?B?MVdwOXdYQitZSTlvaUp3U3dSd3hTY28rQnh4amdKODVtT1dQRys4MDB6WXdk?=
 =?utf-8?B?K3QzbTROU0Qwc1VsRUVNVUhtaitPSmJPNGRhT0d5LzNPN0N3QVJXOTFRZGNx?=
 =?utf-8?B?S2dWQURjb1V6OUxHMUJOdnNaeU4rRVNCTkFGZ2F0VThTM0JoR3BVaDlPR1FY?=
 =?utf-8?B?eFA1eW9qbm9EQTZnMm4xSXM4TTYzT0xEUzgySDU2dnE0K3pXeW1lUXFIREMz?=
 =?utf-8?B?cUFaSGNYSldsMC9uMDRiSlJIdUppeVVUQnNZeEFVSGljOVpVS2lYVWxReU5i?=
 =?utf-8?B?V0VmUEhmSnFiRzN5L1Y5U1NJazMvb24yVTgreVdBU1VyUDNZTThUbGJsRTM5?=
 =?utf-8?B?TE11eDA2WmFIZjM4TFdKOWRoclpBaXc5bEcrcm84Zy91TlNONDQrdkowUUhk?=
 =?utf-8?B?dkpIcmRURUJOKzlVc2hyc0lORU5FU0Z2T20zd3lHditnK2FEcnFneWo5OGN1?=
 =?utf-8?B?Q2haWWJOTzdkd2ozVmtDQ25UVWZ3eEFXZ1h1Z0o3TW1EZHBCaGUxcnIzZ1p1?=
 =?utf-8?B?L1J1Uis2bUI0UzBGYkdyeURZeG03Tnp5MzdWZFV0NXRHaVRpYXUzM2s3enRm?=
 =?utf-8?B?M0VTd2xGV0lVY0hoNW1IZVRUZFVYZVVDNnN2bDNqVGlLOUw1VHJxOXZUcUFQ?=
 =?utf-8?B?VzFzd3lTcDA1d2Rub0pvZE80WlFHQkFZVGFzZzZ2Z08zSVZFRnpGSzZsN2NN?=
 =?utf-8?B?dk1Zcm45eGdZSWtqdTA1dlo5RlM4dEV0bVVsSWJJZ3UxR0N5RGR2OHFHaEt5?=
 =?utf-8?B?dHhSL0ptcUhHMWdxcUMzVkJkb2pJRFJJVWxIaExmcDRnamdWcjdrZTY1VkZK?=
 =?utf-8?B?ekN1ZVFiSnpZODYzeUlkemtuQVUxOVZQTG5Td3lMRDVLWkdKcDA4eUtiYjJ6?=
 =?utf-8?B?cGdjV3pKaGoxc1hkQVgrNkxLVEMzREEzanlFeTVGOW1tY1JVOHB1aEtBenNY?=
 =?utf-8?B?ODE5V2FzYnl4dnI0cEEySGdja2dSbXpzRlptYWQxQ3A4V0Q5TlhEcFc2akRK?=
 =?utf-8?B?aUtwa3lFRG5ZYnl6WDNnRjAzOFVEY2k0bDVxc29uejJpbjdmaXdhUzl0Mkly?=
 =?utf-8?B?ZGZscmxJV2pMSC9WeXJMNE8ydFRVRWc5cC9KRUZqODNMTEQ4NnBSQUwzcWRX?=
 =?utf-8?B?Z2k5WTBqb2MxOVJic09mNFdoTUhOQlM3Y1Y3ZEY5RDVLdTJ3MmJhRWRmNzNa?=
 =?utf-8?B?ajY2K1FDQkRZYkpKRGR4RThhTkpxVUYvQTFpTkFjemMvYW44MFdVdXJVcUZR?=
 =?utf-8?B?dlhObEZHVnhoeWZPWWV4cDRjcXdSQW5NM0VPSkhpRStyN1NFcHhsMVNNVUVK?=
 =?utf-8?B?WEE0bTNHR3NqVTQ5MGNQRk9FUmN0SjZqclB0cFAvb0ZWblpQSW9NWUNSOTBr?=
 =?utf-8?B?SkxwQ2NabVNsbGVRbnRiUnhKaGdYZTB4a3VadUpNVVVsa3o2N1Z3VE5sV0Rp?=
 =?utf-8?B?YXdzNU5OS1RWd2Z0K3NJQ3VqNGxTV3V3VE5RODRRNlhaeEQzZVBWSlNmNUxH?=
 =?utf-8?B?d2FLSCswekZISW1qclVHREVQZUhzNmVqMnRlVzd0YnB0aERDOFBwbEQ2THBP?=
 =?utf-8?B?b0xXTHJ5RHhzOEFtWThvRHpvVm5BVDVqV3R5TzJqc2hDNDNnem16U2lkdnFS?=
 =?utf-8?B?ckN6c1J1UlJTUEJoenU0Z2Z5b1YvNGNkRFdsVjEvUXhzT004S0lGNUlhVWxC?=
 =?utf-8?B?cVFwaWRmcklIbmlHNDhiQ3pmcHZQN1lCQ2N5WjdhQzNMcUNFRkZDSjJ3OFl2?=
 =?utf-8?B?cEtiSVM3cDFNYThVMnRTNDNzZVFRelYvdDVob0twOExyejZnYnNVZz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2862dc07-b85d-42ce-63fa-08de63e37eec
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 11:49:47.1054
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8NNagJkNfcmPa0OO9RPJukTtti5xCsnmqNN1UxIaINcwGZs/2mNIrQjovrHTKx4BkdjRDatqWqE3j2BeRObSRxxx58knGV5RxEfbyPR/Xpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8558
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-27878-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,glider.be,gmail.com,vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:dkim,renesas.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 208C3E551D
X-Rspamd-Action: no action

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWJhY2suDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhr
Lm9yZz4NCj4gU2VudDogMDQgRmVicnVhcnkgMjAyNiAxMTowNg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIG5ldC1uZXh0XSBkdC1iaW5kaW5nczogbmV0OiByZW5lc2FzLHJ6djJoLWdiZXRoOiBEb2N1
bWVudCBSZW5lc2FzIFJaL0czTA0KPiBSTUlJe3R4LHJ4fSBjbG9ja3MNCj4gDQo+IEhpIEJpanUs
DQo+IA0KPiBPbiBUdWUsIDMgRmViIDIwMjYgYXQgMTE6NDUsIEJpanUgPGJpanUuZGFzLmF1QGdt
YWlsLmNvbT4gd3JvdGU6DQo+ID4gRnJvbTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVz
YXMuY29tPg0KPiA+DQo+ID4gQXMgcGVyIHRoZSBSWi9HM0wgSGFyZHdhcmUgbWFudWFsLCBDUEdf
Q0xLT05fRVRIIHJlZ2lzdGVyIGJpdHN7MTIsMTN9DQo+ID4gYXJlIHRvIGNvbnRyb2wgdGhlIFJN
SUl7dHgsIHJ4fSBjbG9ja3MuIERvY3VtZW50IHRoZSBybWlpe3R4LnJ4fQ0KPiA+IGNsb2NrcyBm
b3IgUlovRzNMIFNvQy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IERvZXNuJ3QgdGhpcyBuZWVkIGEgRml4ZXMtdGFn
Pw0KDQpJIGhhdmVuJ3QgYWRkZWQgaXQsIGJlY2F1c2UgdGhlcmUgaXMgbm8gdXNlci4NCk9LLCBJ
IHdpbGwgYWRkIHRoZSBzYW1lIGluIHYyLA0KRml4aW5nIHRoZSB0eXBvIGluIGRlc2NyaXB0aW9u
ICJEb2N1bWVudCB0aGUgcm1paXt0eC5yeH0iLT4iRG9jdW1lbnQgdGhlIFJNSUl7dHgsIHJ4fSIN
Cg0KQ2hlZXJzLA0KQmlqdQ0KPiANCj4gRml4ZXM6IDNhYzJhYTMxYjQ4OWViNGUgKCJkdC1iaW5k
aW5nczogbmV0OiByZW5lc2FzLHJ6djJoLWdiZXRoOg0KPiBEb2N1bWVudCBSZW5lc2FzIFJaL0cz
TCBTb0MiKQ0K

