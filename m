Return-Path: <linux-renesas-soc+bounces-25021-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 844A1C7CFA6
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Nov 2025 13:30:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4331A4E403C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Nov 2025 12:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F02B52AD35;
	Sat, 22 Nov 2025 12:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ubVLBIjs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011018.outbound.protection.outlook.com [52.101.125.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2978488;
	Sat, 22 Nov 2025 12:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763814643; cv=fail; b=ShpvRS57oLy0dnVll1zfYE+0rJfIskNduw11AcYq1aXd9Mmq2T0ju9zqYXDdZGSXI/NMmm50bsBUXCsCcEw5YTzAaPM2sEQWqxwMMDQKPYUSuBFjFtANpNwL13FrluZXZiJFkyvdGNciCH7a1zXK1qf9Hf1mTohL2B7Gse68quA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763814643; c=relaxed/simple;
	bh=za23//sPEGDzVgjggzZglkaqXT6uy3Ys7+Hee3fKqYs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OvWbORkw87l7usISIjmMbVdqgkZ0cfM2zCjSfBkYB2nXfVSgdpidao/C65YXMDHDx1Xt4swU/w9ZS9GQKFY4oNz48XOrtmtojahhJj54n0t48INJS2xSt5fj54SpesmEo2tyXdSl1BdKrwyvu3fPYZ3dDGscuOy7GK2yZspJMdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ubVLBIjs; arc=fail smtp.client-ip=52.101.125.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xA74sAtVfg5gWfSS3H7/Dn/nD9pFtB2OJbqQ+p5gbcGgQy9HnqmIbeJ3wNg2uvClTN1kPZiCVozcq6jWe+W75vzzFIt0gus3uXE8Cy588Ao07pr41pfV2mALaxt4FBbjPTBqlptq4xh28XIp30fBW+2M9hBYjz16BKwfTHGlau1Qquq+uem8zKI9cW3vN+KpN4EIy28GvaxgzXnZa7kpdjnCs/URFW/YDQdM+DJWhzdhDr4EF7FWkUp7YwjfHKkkY3vp0ryvctcTxAP7deRJJ+BugOlmZopkwpsFL4Gudl7QypNZTUCqCRO4gL67T9nXiWkaHoPBb5pXs8SoaYlAsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=za23//sPEGDzVgjggzZglkaqXT6uy3Ys7+Hee3fKqYs=;
 b=xS1Oucvf4H3XmMWsSLO7CMTnJywD4psK8nQ9ZgJyAm4JO/tgs8lljAsC80xacHtPD288WfS6N9Lr2Jd+SzQeXPX2kjRDv0+g23lbqyftr5qLHLws/AFQGeE2V3nV/2DuFnK4dlssRkEFx3+R5YiLRN7N4H2utISTMs1phir/oljX0ZwgicWGwhkAf1yO0J8M2EG7e1/+Om2zyLOmYk/zs22ln7cIBy6OuaszyzXG4zvErg47uKJ8ha2O8ZjCgdzCTVzaWk1ebX1836swQNC0tIhhBnbh7dSGNFp4vAnD7XKUBxv0KsHR1TDYFnw9v/l+iC5lEscm1o/DUxpb4JpLRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=za23//sPEGDzVgjggzZglkaqXT6uy3Ys7+Hee3fKqYs=;
 b=ubVLBIjs5A/b5PfPdGIIDZX1CBsktk6N4St4+O5ZwkZAPJl02fDTe95XURhLvGIkK1MMhjARQogS3h8NfIvImGhp7wsZYhXGeYA7Pf5XGCDWkgCt6t3zo77ZISq6gdHIz+Ke924SPfVs7JXXKRRjcbZyur5nqaASqHKhqpBkkIU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB9799.jpnprd01.prod.outlook.com (2603:1096:400:20d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.6; Sat, 22 Nov
 2025 12:30:35 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9366.005; Sat, 22 Nov 2025
 12:30:30 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, magnus.damm
	<magnus.damm@gmail.com>, wsa+renesas <wsa+renesas@sang-engineering.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 12/13] serial: sh-sci: Add support for RZ/G3E RSCI SCIF
Thread-Topic: [PATCH v3 12/13] serial: sh-sci: Add support for RZ/G3E RSCI
 SCIF
Thread-Index: AQHcVVS/SdMHEdZMy06Lf/dxs0umWrT9QJOAgAFr9iA=
Date: Sat, 22 Nov 2025 12:30:30 +0000
Message-ID:
 <TY3PR01MB11346B5AAC1CBB54361ABAE5286D2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251114105201.107406-1-biju.das.jz@bp.renesas.com>
 <20251114105201.107406-13-biju.das.jz@bp.renesas.com>
 <CAMuHMdXshthP8nrV-qP=fSv6HGCDj47x9_jQYobZTEivy15tvw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXshthP8nrV-qP=fSv6HGCDj47x9_jQYobZTEivy15tvw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB9799:EE_
x-ms-office365-filtering-correlation-id: b989f9ca-67bf-421d-9f5b-08de29c2eccc
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?V1JUVmlPaHMzMm9lZXl3RFAzT3VncVg1bzljaTcrN214eTlHcTZCa1k5MFV5?=
 =?utf-8?B?OThjZkx4RlBZbkpUaVdYZHpoR2c2K3Jwazd1a084dlIyOE1nVVFMWGMxWVRV?=
 =?utf-8?B?ZkpOVjRjeDZnRTJPYTFveExSVWRjRDN5SzJCQkt0TmJkSXptOXh5SjI3ZU5v?=
 =?utf-8?B?eWx4OVdpWi8zL2EzR0xrUXRBajY5NVk1U1Z6OXhoWHpzdVNSMTB3QWxQckZR?=
 =?utf-8?B?TXZQYTdaUVFQd3h6ZEFNQVdpcFAvOXdPandmcHBOemNOd3NvaEJpQ0FVRDBW?=
 =?utf-8?B?S1VZbmUvQnQvL3hDeW1QT3RSUndDRnJ3VjZnbXRyQnB1Y1JuQU5WaDcvbjZ4?=
 =?utf-8?B?WDdzUWw2S0lQSDZGSmY0bU1CUkR5U1hqajJoeW5aTlBvOUh2M0dTT1dCYkRL?=
 =?utf-8?B?Mld5UjRJVlpoUlI2bVlPNXY5UjJoS2FBSTZNNnpYQldWU21TRVZFSWkvclNI?=
 =?utf-8?B?LzIwSlZMSFJZL2dHSS9TN05HVjZSV1pnQkhqLzVaMkNxNjNjU2crZ05mdnc5?=
 =?utf-8?B?SHI1VXM5dXFRTjRoc3BGMlBZM3VpcUtzVnBpeUxIbWlULzc2ZG1oVEpDVnJq?=
 =?utf-8?B?ZjVVUEtmVkxFM2Y0NElUeHBZUHNvTGdoMlNKVm9UVFYwdmcxbzhkNGpMZ00x?=
 =?utf-8?B?aFIrcFhrZHpLM1BhRG9pYzFPUTlobThycUJ3V3VOcDdKdVltV2tSaHJJYm5n?=
 =?utf-8?B?T2NZK3FpajJvT0NIS2JVYktrN3FodVF5UUNpcDNhR3dhUHJmazFEbitmZmhL?=
 =?utf-8?B?anYxTkV0K0prTjMvSlF3N0lGQTNOWmxMNXlad3k0eW9nMWhpQ1F6UFR0K0tv?=
 =?utf-8?B?cml6N05UNy9DWHB2cy92UmtJazRjUkxqZXpjQUxtZFZYNDJhSmFlUStCaEtv?=
 =?utf-8?B?dlE5MSt0Z0hScS9pemNmTWpZZ0lsRFc5OXhuVm5iblBQNXFUV0FlRlVsNys3?=
 =?utf-8?B?cUcyQWpuNUxCZndxZVIxRUpLNzg5MlM3S1IyMnBYQVF6QzZoY04yblB1M2cw?=
 =?utf-8?B?YllJdnNJaElLeHNUbmsvUXRNVEJVUTJyQWY1ZTl3dHVpTDBSVUcxSjJGdDdR?=
 =?utf-8?B?TGxRdnBKaUNScTEyT2VlU1VsMEdZVjZ3eW1RdFEwV0pMb0RVSmJ2d3VYbWhz?=
 =?utf-8?B?VUhOYXNEVHY1bmNYc09rWUNCdzcrenArczNma3hSOUpjclJNUjlUc0xHZ3dO?=
 =?utf-8?B?L0RGdTVjNDd5VlVKSXptNU1xTDk1UzZuM3ltN1pIa0Q4RndJTFR6SnI2VXRE?=
 =?utf-8?B?cVovVFE3TDF3d2lYTVpSU0NvQzRrYkh2VnkvK0tKL2Urd21wdERoK25uWHB2?=
 =?utf-8?B?OS9XZ2VQdXVoejJrcncvazRZTlR1ZVlDRTlRMWhIMEtCYnJBWUlJWXowUEo3?=
 =?utf-8?B?QWdPcjNlcTBLYk56T2Q3Y21NZGpLeU4reFVaR2ZZTFNGTUthTlhrTCtkdHNT?=
 =?utf-8?B?QjZyR25aZDVKRlpML1RQRmZoWm1DK0g2S01UZE0zc0g3V3BKSUx0L2o1RTNt?=
 =?utf-8?B?MjVuSmdwQ2VDQVZITmw5bXJVS2VvV3NJRkMwWjdsNzN4dXg4S2Z4WlZ0dkl2?=
 =?utf-8?B?NEZlRlZDL2cxUXd6Z2FtU1NKMTgydEJnS1BxOXB5NWFpVFdHTE84Tit1UjdE?=
 =?utf-8?B?cU1ROWVPSDZnSzlOdTVRYkI5TmZXNXErN2lVSHZCTWh2NStzNUFzNTB1bm9k?=
 =?utf-8?B?ZWRqTHV2Uml6c1BkYlg5VWdjNkdwZmdrZW9kTHlTSERRMVZBUTVDbUZKeDRi?=
 =?utf-8?B?M0ZOalNULzlZMSt4NUllaURoS2YzS3dhTjhZS25KS2FhOUlka0E1eWtRSnp2?=
 =?utf-8?B?cDY4cm1PRnlPZEhSc2EzVDhRUkFMNEtHQ1FJTTBSdXh2RzQyNS9Kc1NVUUdO?=
 =?utf-8?B?ZzU1NWZqdVBUdTJnaTNBUXlpVmkxT1ZGL3hyQTk5TnNoSTVBZUpHQkJyaDBP?=
 =?utf-8?B?STZERXBvMFd6ZVVtMk1RekMrQnNSZjlTQWZLMzZLN2ZPTXc1L21nQVlSWith?=
 =?utf-8?B?RDYzR3ZOMzZiODFUTUlWOWlnTGFBNXhuZXczZUVYalJqRXpFL09pUDFhOEhx?=
 =?utf-8?Q?j/1O7h?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eEpjaTAwRnRGT0FLMllLclRUQXZZMkFGWE50dExwbHBKMXRwU2hHVm13TVBs?=
 =?utf-8?B?TzlOWUI5VmVrc3VTc08wMjR4d2Z0Y0IweWlrdTRCb1h5eEkyQzdwZEFvbkd5?=
 =?utf-8?B?VEJ3S0txcUloK2Z6SWs3MEdacVpTWXo1a2gxQ2lyK2VCZGFUZFpkMDF2RWor?=
 =?utf-8?B?YVQ3cU1XaHp0M3RvdTA3TUY3VGlZYlQ5b0JzeHFnZGs4Vi9lYlBjRkEzZlhK?=
 =?utf-8?B?QXoyUktsSjUwb1FKckJLN2puQncvWFVQaEoyUUg5YlVhSSttWGcwb3ZzM0Yv?=
 =?utf-8?B?Ykd3ZGVRUzlUckNnall0UzdBVjVpYzhrM1VzZFV0bVpiaEhqVUlZVlNVUTVr?=
 =?utf-8?B?M1BuRkpsd3JYWWFldmdDS3ZLVG5VZUtIMy9kbUtLcGRIVHEyK0NjTFAydG1i?=
 =?utf-8?B?ZVBqaGcrV004bDAwSGNWTXZHcTF3YXh1Nkh0cTFGOVNwUm44aHpoNFEwdHdj?=
 =?utf-8?B?V05GUkhuM0ZZUnErYTdYZVBwZmVwSWlPTmV2blorYUR3VEN6ZW1OVVF4elBO?=
 =?utf-8?B?QWhWd01hSlI2Nkp4d0ZrMUNvTjA2MG5jYjdEckpwRXl5RTlxV3daSUpGRHdj?=
 =?utf-8?B?N2grODgwQVM3SHc4cHREbjhrOHlrUk1NUHFNTlV1b09pUVB6MXpGOVlhWGFy?=
 =?utf-8?B?S0FCRTZQK3hNZU1xT0k1ZmttdnpMWTJRVUFnRDN5bW01TEVBdnc1VjVWZnpm?=
 =?utf-8?B?SE4yVHZuMW5zMzU2UjJSK0xzZWdISDNCYU5xM3RDT3o1d2xQZzFSRHYrYmZQ?=
 =?utf-8?B?T282ZVIwRFVEcnQ0MTZBYVp0MVdDeHhsd0Z6ZzZkNVZlNzhRZkNoUnozQ1pJ?=
 =?utf-8?B?cUpJQVlBWlc4YlZtNUtGSHd2NzdSSys2TzNpeFJzdGNwTjlHc2JLK0lNSXVo?=
 =?utf-8?B?dHFjRk14Yi9Ba2JwN2gxWmUreUVwNTY1Z2U2WjBEVzdZbFVuemFVWDl0WGwv?=
 =?utf-8?B?b09lME5YdGNzWHlCZ3QzcHJnVFplV0x0bDU1dDZNVFhpbjhocGl4UWkwNmtl?=
 =?utf-8?B?SStPZlRUVmNTbEdWNlJ1ZHI2MU1aUXVOWmN1c0sySGJEb1FHOEpTNklodmIv?=
 =?utf-8?B?cnM5eFNxOXd3Y0xvQlg3anBYamVNdlVXNW1vRzRLeVNqYmI1dUxsR2pCOVFG?=
 =?utf-8?B?Z3RxdWhNNWwrbDEzQjJia2YwN0MwNlVQL1dKQXVVQUx1d1h4d3hYYVV6U281?=
 =?utf-8?B?cVNlOWFiVVp3QWZTaXdFUmljUlJJWStmcTJyMEdhRGZTKzBDdCt6ajc2UXNV?=
 =?utf-8?B?L0hOdFozMzNVQlBkN3gxYXZwZ0FoSlAvL2UzanBwN1pvZUd0Vm1SK284UWdT?=
 =?utf-8?B?Z0VmbVVTdnhoNnVpcW1HNVVNUkZxbGN1WEt0V1RkQkhWOFF2STU3M3RFYWRM?=
 =?utf-8?B?cHZ5Yk5aVDVCSEdHZzI3SnRNTXVuWXlNOEpsZWdRUWM2OWdCb1JZaFZMb0FI?=
 =?utf-8?B?WUpEQ3FqZkxhZ2ZVdWhHdXJVYXZwV3B3dGxPUDdSb2poQXdSRFluYXNsV3R6?=
 =?utf-8?B?Vmo1TFZITmNIR2ZLcGdyNVc1OHpVaHR5WWY3azJkcXVWYkpqQjY5VmFTb3RB?=
 =?utf-8?B?L2tKVW1yUUdaMTBPZDd0Y2VEZlZrdllFY04rRlAyamFiOGk0Y1AxcUM3RUQ0?=
 =?utf-8?B?R0pXQWc3REtKbVN5ZkpPdExQeDVSY1FFTGRPV3RFdDFqVVRHZ3h5enFGK2U5?=
 =?utf-8?B?bEtQWngyUHovWkZYWjVjUk1LajIrVEc3UG5lcWQrUFFOVk1BM2g1RU1YVmVx?=
 =?utf-8?B?cVZ3Rm93b0NxbkZlZGN5bFY2c3BmcUp6MUhnTVNPM1hOK3lDTSthUDh0clFh?=
 =?utf-8?B?NHlpMjBWZEtsbWN0Z015enppbjZzNDl3SWQ1eXdjeVhXVWNHaTM4ZzJtRnFq?=
 =?utf-8?B?RGdEdWUzbHUrUzdGcFRUWDdMSExtdk9EQXp3Vk1tYmNCWlJqd3J1WEF4SkEr?=
 =?utf-8?B?QVFPMUxqMDFsb3ViYnhLSFk4ZjJ2ZllldXFtQzlXV1J1SkxabW1rcGZvSFpx?=
 =?utf-8?B?RFZFeFh4M3pCOHR6WDYzRWlNNEdrbWFqVVpEazAyaWIzVGhld2dEYzZ5M0kr?=
 =?utf-8?B?L25Wdmkwb1NxVkdib01YNHByQW9HYzVlb3h4TndaeGtza05SenduU2pWWHVi?=
 =?utf-8?B?eFlvV3Yvb1MwdC8zanFKbGRnM2NoVlFYK2lkcjg3bmIvMUdZbm01cHc4QVE5?=
 =?utf-8?B?bmc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b989f9ca-67bf-421d-9f5b-08de29c2eccc
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2025 12:30:30.5967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kWzbnQzCksPHeJLWKVPsYJtrpGo7C0vNPXJe/AKLq7TdEHX/oZT1foCT7Z0BHExgIbbk9EPp4/nCGq9Hz2GE4IdSsvzmnkYRQKpGylwCdI0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9799

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDIxIE5vdmVtYmVyIDIwMjUgMTQ6NDYNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MyAxMi8xM10gc2VyaWFsOiBzaC1zY2k6IEFkZCBzdXBwb3J0IGZvciBSWi9HM0UgUlND
SSBTQ0lGDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gRnJpLCAxNCBOb3YgMjAyNSBhdCAxMTo1
MiwgQmlqdSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPiB3cm90ZToNCj4gPiBGcm9tOiBCaWp1IERh
cyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBBZGQgc3VwcG9ydCBmb3Ig
UlovRzNFIFJTQ0kgU0NJRihhLmsuYSBGSUZPIG1vZGUpLiBSU0NJIElQIGZvdW5kIG9uDQo+ID4g
dGhlIFJaL0czRSBTb0MgaXMgc2ltaWxhciB0byBSWi9UMkgsIGJ1dCBpdCBoYXMgYSAzMi1zdGFn
ZSBGSUZPLiBpdA0KPiA+IGhhcyA2DQo+ID4gY2xvY2tzKDUgbW9kdWxlIGNsb2NrcyArIDEgZXh0
ZXJuYWwgY2xvY2spIGluc3RlYWQgb2YgMyBjbG9ja3MoMg0KPiA+IG1vZHVsZSBjbG9ja3MgKyAx
IGV4dGVybmFsIGNsb2NrKSBvbiBUMkggYW5kIGhhcyBtdWx0aXBsZSByZXNldHMuIEFkZA0KPiA+
IHN1cHBvcnQgZm9yIHRoZSBoYXJkd2FyZSBmbG93IGNvbnRyb2wuDQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+
ID4gdjItPnYzOg0KPiA+ICAqIERyb3BwZWQgY3B1X3JlbGF4KCkgZnJvbSByc2NpX2ZpbmlzaF9j
b25zb2xlX3dyaXRlKCkgYW5kIGFkZGVkIGENCj4gPiAgICBjb21tZW50Lg0KPiA+ICAqIEFkZGVk
IHNjaV9pc19yc2NpX2ZpZm9fdHlwZSgpIGhlbHBlciBmb3IgcmV1c2UgaW4gcHJvYmUoKSBhbmQg
cmVtb3ZlKCkuDQo+IA0KPiBUaGFua3MgZm9yIHRoZSB1cGRhdGUhDQo+IA0KPiA+IC0tLSBhL2Ry
aXZlcnMvdHR5L3NlcmlhbC9zaC1zY2kuYw0KPiA+ICsrKyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9z
aC1zY2kuYw0KPiA+IEBAIC0zNTYzLDYgKzM1NjMsMTEgQEAgc3RhdGljIHN0cnVjdCB1YXJ0X2Ry
aXZlciBzY2lfdWFydF9kcml2ZXIgPSB7DQo+ID4gICAgICAgICAuY29ucyAgICAgICAgICAgPSBT
Q0lfQ09OU09MRSwNCj4gPiAgfTsNCj4gPg0KPiA+ICtzdGF0aWMgYm9vbCBzY2lfaXNfcnNjaV9m
aWZvX3R5cGUodTggdHlwZSkgew0KPiA+ICsgICAgICAgcmV0dXJuICh0eXBlID09IFNDSV9QT1JU
X1JTQ0kgfHwgdHlwZSA9PSBSU0NJX1BPUlRfU0NJRik7IH0NCj4gPiArDQo+ID4gIHN0YXRpYyB2
b2lkIHNjaV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZGV2KSAgew0KPiA+ICAgICAg
ICAgc3RydWN0IHNjaV9wb3J0ICpzID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEoZGV2KTsgQEAgLTM1
NzQsNw0KPiA+ICszNTc5LDcgQEAgc3RhdGljIHZvaWQgc2NpX3JlbW92ZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpkZXYpDQo+ID4gICAgICAgICBpZiAocy0+cG9ydC5maWZvc2l6ZSA+IDEpDQo+
ID4gICAgICAgICAgICAgICAgIGRldmljZV9yZW1vdmVfZmlsZSgmZGV2LT5kZXYsICZkZXZfYXR0
cl9yeF9maWZvX3RyaWdnZXIpOw0KPiA+ICAgICAgICAgaWYgKHR5cGUgPT0gUE9SVF9TQ0lGQSB8
fCB0eXBlID09IFBPUlRfU0NJRkIgfHwgdHlwZSA9PSBQT1JUX0hTQ0lGIHx8DQo+ID4gLSAgICAg
ICAgICAgdHlwZSA9PSBTQ0lfUE9SVF9SU0NJKQ0KPiA+ICsgICAgICAgICAgIHNjaV9pc19yc2Np
X2ZpZm9fdHlwZSh0eXBlKSkNCj4gDQo+IEkgdGhpbmsgSmlyaSBpbnRlbmRlZFsxXSBoYXZpbmcg
YSBoZWxwZXIgdGhhdCBjb3ZlcnMgYWxsIGNhc2VzLCBub3QNCj4ganVzdCB0aGUgdHdvIFJTQ0kg
dmFyaWFudHMuIEUuZy4gc2NpX2hhc19maWZvKHU4IHR5cGUpLg0KDQpPSywgSSB3aWxsIHVwZGF0
ZSB0byBjb3ZlciBhbGwgdGhlIHZhcmlhbnRzLg0KDQpDaGVlcnMsDQpCaWp1DQo=

