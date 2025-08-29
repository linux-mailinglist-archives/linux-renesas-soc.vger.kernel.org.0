Return-Path: <linux-renesas-soc+bounces-21062-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D85AB3B31E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Aug 2025 08:15:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 661E346109D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Aug 2025 06:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5251E220F34;
	Fri, 29 Aug 2025 06:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="aZpMxJ3q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011005.outbound.protection.outlook.com [52.101.125.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DC230CD9F;
	Fri, 29 Aug 2025 06:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756448116; cv=fail; b=rfLRy1Qmxnbq0s5qGYgjZbehYVXpsATBWEpUaLvVblyo0JDuQi6czZYkvgajhtl/0O2jpJpxmeLvQP+sb7t0QEpRo1yFGmzyjPduj5ZoX0tq4GFICL1F8uO9vb0yMRU214+N2a++yj6b8kAJFUVUu98RSxodbu9wuL/v54R4o/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756448116; c=relaxed/simple;
	bh=L7KHMBhehNO/oMWDqsmwFfZHBeK1oIs+sdUtmtdYfHU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DTPrHHBMqxaZac/5fNxC/l7P25nxMrqISsSoB1P5u5t6p7YPTVSyWOlIIQrk/V6aUwUOZyd0uB6f2gT+IA60Da+vCJG2m1ZOnC0eg57N9FNFxIqlu7IWzIW/JFJjjauMq+AXCT36D4chbE18jD5Q+CIJKTvk8dVgi3z+FEbJXKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=aZpMxJ3q; arc=fail smtp.client-ip=52.101.125.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qUCFR2BhbocR8QwQzfbhNDJ6a+Do709TqPCOyeiC5xbckzdzSulOuRtfdZnS2g+SUmyUdOc8D76ig56yEhrFO1hvtEgOe/GMZ3uNvli8py0B460Q32yJUbvqMBnQsD/fy4dU+TqHaku7v4D6JPX0z2GDwqqfxqZ8ThYPyxrjzDjNr4F1Yj0xBPu4j5wqW+ND+LhP0eE0IRIm70s52KYSfcQ7D9qqd+hdzuhTQERgoXLuPqr6DK9w5ULh1UJsCWJw6xWPKGrJmfrI8Wvko+iZU63Dcr787qse890edT0eqkEvvSKkPNmXNu31SldppYOVHPf9KY84G0BGdYKCjeoNPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7KHMBhehNO/oMWDqsmwFfZHBeK1oIs+sdUtmtdYfHU=;
 b=SybezYsEsYo14amfHPT/yb/9iNIAlfRIzaui4RtCR8wJrUPgM6MpAfjIFsfDuDhOimllatgW4yk+SaBnm+smK2CUxajagegtfq2A0uD+b/HcYA4L2JwgTJJGlELx+YpZRhoCEi1AaCF3B8ue0w/mR/52rV4VPTYmbNnDvEdaAAbBXYHYyAGhK/8Ni7cbTdCWHR4iiewSCgUaBaUSd2rqoV8SzMspkJ0cE9FAm/WIQp6AzvuVqN9vtKdYjpw93ywjIovyM7hIw/8xHrTKuk9kQWPS0hF4BfU04vYtitilerhifhUMjkjgOxlKbwmAOxkaWqhZW7WAOMdkaVdYHdFGUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7KHMBhehNO/oMWDqsmwFfZHBeK1oIs+sdUtmtdYfHU=;
 b=aZpMxJ3qxv1YvrigpJLts7GIrbI9c6D/lV4LD1u+2HF00s7gDYbPEwm93Ah80f1MYmNn+/b0+ggC9fnMG+dC+wZiywgl2a3C9nfmwPYIGKOAPoGn7JF4Pl3BRTJMolM83uvHEH5R0I8xSifDxhoSHK9rqk7wETaHp/2X6LIqBbU=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by OSRPR01MB12000.jpnprd01.prod.outlook.com (2603:1096:604:234::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Fri, 29 Aug
 2025 06:15:10 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::37ea:efd9:8ca0:706a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::37ea:efd9:8ca0:706a%4]) with mapi id 15.20.9073.010; Fri, 29 Aug 2025
 06:15:05 +0000
From: Michael Dege <michael.dege@renesas.com>
To: ALOK TIWARI <alok.a.tiwari@oracle.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, niklas.soderlund
	<niklas.soderlund@ragnatech.se>, Paul Barker <paul@pbarker.dev>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nikita
 Yushchenko <nikita.yoush@cogentembedded.com>
Subject: RE: [PATCH net-next v4 3/4] net: renesas: rswitch: add offloading for
 L2 switching
Thread-Topic: [PATCH net-next v4 3/4] net: renesas: rswitch: add offloading
 for L2 switching
Thread-Index: AQHcGAXU8Fwgj14zpU+lmgvaulJVqrR4ZtcAgADBQZA=
Date: Fri, 29 Aug 2025 06:15:05 +0000
Message-ID:
 <TY4PR01MB1428244B42D6CE0A5BD136BFF823AA@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References: <20250828-add_l2_switching-v4-0-89d7108c8592@renesas.com>
 <20250828-add_l2_switching-v4-3-89d7108c8592@renesas.com>
 <2fd60e1b-a234-4663-ad35-1696a6fd6827@oracle.com>
In-Reply-To: <2fd60e1b-a234-4663-ad35-1696a6fd6827@oracle.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|OSRPR01MB12000:EE_
x-ms-office365-filtering-correlation-id: e04ed7f1-5125-4a38-cc2d-08dde6c365a2
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Wm05UWJOTGRUaTRack5XRTVZR2ZxbkVaSTB6TGlkc2wyTlJCeDFwNjV3Tng2?=
 =?utf-8?B?ZTR1alI0a1ZnL2JsYTNrekVYYjhIWEQ4ZXpSSG1BMlk4WmVBeXpVSE05OHly?=
 =?utf-8?B?eTlod2dtMk1tMWJKWk1GckxLRkdUMkk5ajViL1ZGTnZNWmd4RkFtZllhVUxO?=
 =?utf-8?B?TUVWMmEwLy9YYUVrRkcyMC84YktHQlBjV0lNaDZWVWJzK1B5NVFTRS9NaTBh?=
 =?utf-8?B?V3dsbDNhZWJaUVNmMkNuMFlWNGoyNTJ2c1F3aUJPMHR5L0lJRTEwcmcwZ1Bh?=
 =?utf-8?B?RXQ3amlzbSs5VDBrZ0hBSXM1NGNodnNJYlA0cnJqZ0RaWDRyR3V1d2toWm9U?=
 =?utf-8?B?RFZFelVLU0JramdzbXpGNzlDbXQrZzN6YUt5WUNqbUpiL0ovUVhrdEJSZ3Y2?=
 =?utf-8?B?RnFCcktnT1RzR3ZDUVRoV0xseUsxRGJjN2RIK0thMkVNZCtsalkzbS9ndnFa?=
 =?utf-8?B?U3g0Smc5UFozRXJzWklQTEl0RGo4M1FHZC9XVlFnTDNXTnRodG9zMzlycy95?=
 =?utf-8?B?aUdGWEFSSVRWdTVwWHpySmxrWTd4eExoWWszVysvV0xPd1lrUUJlck1kZXB6?=
 =?utf-8?B?dHMxS0FqWGdNR20rUzNNdG84R0VjaDFXeDhnejR1bEREZFRSeG5uMVg4bUZi?=
 =?utf-8?B?WWE4cGM4WFNNTHIvMFNXWEh6dFd1UjFkLzZBQTVzVTEzMzNKTjRtMjZwV3FW?=
 =?utf-8?B?eXVCNEhtbTJLbkRCemN0VjFzdklrVDdSOHNJUVVERHArMWNaVHhrNWNPVE5W?=
 =?utf-8?B?aGgxUkpQcDVxZ2JLejhxTVdTMHBxRTNMNzFtQUkwZDNGT0FIZVpzT3ZvbTF3?=
 =?utf-8?B?T3F2a1RCWDlKVWQyb2hPUHhBTU5xWUZJSFljenU4eElxMlZ2NUoyRnhrc0hS?=
 =?utf-8?B?R3Vnbm1YT3N4enRVc2NBaytiR3BlK3hEOC9CLzFSbm1GcFZNalo5bG9FOXJM?=
 =?utf-8?B?aGZ0Wm5uWHpMelpoMS9RRW9JMms4T1VBc05UTFFsZTdQS1pNRGpnSk83WlRW?=
 =?utf-8?B?YkxzK2c3VTl3em95ZlJ2RVVrVzdjVklwNkppMWxlanAzcGdVVi96YTY1K1l1?=
 =?utf-8?B?UXNUbk0xRHNvSms5MjU2N3dBWmNDa2lDaTllenZhdVE1N3poVVVvWEdLcUFT?=
 =?utf-8?B?ZjdlSEI4cFY5ZStlaUl4RTd0R25kdVh5OUoyazF1bGRJWndHMzNCRkk2bHox?=
 =?utf-8?B?L25qaDZ4Zjd2akdqdWdXdmx5L2NnWkhkMXFLY1EvOGNCY2c4ZGJubnk3K3oy?=
 =?utf-8?B?UFZFVG1Kbi9FeVIxYzg2L0tUd2ZoWjZvOWoremk5OU82ME1wcG9ZUWpTcXlk?=
 =?utf-8?B?S29FRmtMVFFwZjh4WWFxc3JvN2hENTB4S2ptOGxFVWN4WDgxeXd3enpycUxV?=
 =?utf-8?B?VC9xOWR6QzVRVHQ1UmI3dFJwZElWZGRQcEE3R3M2ZWFMTFhtYkZBQ3VMYlU5?=
 =?utf-8?B?OVAySGVlZ1RKK3pqZjBHUUhUUVFGdy9KanlXSndnN3YvWG9sTUNnUDd2UWxw?=
 =?utf-8?B?WHkzVFRJa2JLZjc3VjZrZzhSU2xRVk9GQ0ppWWhNWXllVlZLLzg2a0thVytr?=
 =?utf-8?B?bFZ3VzViN0cxbDN1ZGhiTmdHVFZ4aWJyRzUxc0NvOE1MVnI4eEV0bFYweCtX?=
 =?utf-8?B?R3dvT2krNFZqOGY2Z3lOYWhnNzY2bkNRaE8zcjVWa3NBd0pobU16dkhEL0Vj?=
 =?utf-8?B?L1JRM1NiUVQxb0lIcHMxTC9tQ1h6TXhmZTBLelF1SUI1Vk9ZNWh2MmhQejlm?=
 =?utf-8?B?SjExUVFTNENsa3FRNlpSaHRURU5MOGI5R0NTd1NvUnVnMnJ3NXZIMFQvZmhh?=
 =?utf-8?B?aStmbVFCYXJuWkg1MUZmUVdia0pEa0EzOHRWV0FHT2RhS0ZHMmhubTZiUDRE?=
 =?utf-8?B?QVN5WWExVWVZam1PT2hoQVJRa1RHaFBac3BDK0ZEaEpOYVpkeTNaK3ZxdnhF?=
 =?utf-8?B?MDVGYWJSSVo4SXJUVFRHcUZQM05HWUhHeFNUNmMrRS9YTlpGQXVzRzBiOCt2?=
 =?utf-8?B?bWp4dkJhVEtBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MXhneWtYOUk2MmhkMm5mZ0hIeGZyTi8ydFM2eHFTb0JKdndzeU40WlJkVXB6?=
 =?utf-8?B?ZDB4ckVuM1hUbTBCZ0orSFdHUUtqSm8vQVhxNHZBVDFEV25pdGNwV0swTUhj?=
 =?utf-8?B?QjFxREdCN0dOemtiZE00aXdONGpyOG8vOFhKVU9RUzMxbEltQmh1WVB4NzZx?=
 =?utf-8?B?enBSNUdWM1RhOUsrUm5jUWYvVjBERVo4OHErZitwSzdXWXVJYXRUdWgvWkhE?=
 =?utf-8?B?STBFZkNiZGZWemxLb0xtbkxMSzJwMkpjUlU2dFdZcUFrbDZBTWlQSU9BV1BE?=
 =?utf-8?B?aWFJTTIvMFNpaDNuNVlwOWluNjdaVDRxaUlZWm1pY29MK1RvNCtJQm9JdjY4?=
 =?utf-8?B?QVhyNlNacEYzdlpYZUNJci9KU1BWQkQ2M3R6MHpaeWs5MnhiUncranZyUTlX?=
 =?utf-8?B?YW9YRm9YMTBpMUYyYXhnRUxGUXE0UEhOY0VDb3RIbzY2VWFGN2Q0ei9WVzNV?=
 =?utf-8?B?RC9Gai9hQlN0OTBEczhYOUlpYk9WOGNXS00rZ2EwTWhXNXhHVkdWaFhEck9S?=
 =?utf-8?B?NXZHaTg0cmVLcU9rdWlZUVlJeFVCOVh6M1VGN0MyQ2piZTRMcnFXVjJ2OFd1?=
 =?utf-8?B?UGcrRTA5OWNaWEJBU3hFcE5rR3VDdXZtVW9KRTZkZHZkUnhJcFF3RkdDcFg0?=
 =?utf-8?B?amVBSmQvaW44Zi83T3hMWjg2NkgwSzFFdUxmUjNLNVM2dE91YkIzOEJ0QmRE?=
 =?utf-8?B?bVNUcXFWNGtqbUlzT3N2QnM4R3kvU0xvMStYOUUxL1Bic3pQWC8xNnhSU3dK?=
 =?utf-8?B?dDVMazk1Wk4zWDU4a0VCVmQwQ3ArRldtdlV1a3JBcXdob0RlWi81dmFiMk9J?=
 =?utf-8?B?ZCtUVE1Qak80SHFFRzM1RWl2SlJZZDR1RWlSZDNDRDBkZGdUS2JvUDZweUxN?=
 =?utf-8?B?RVljRzNsaU9ML1FwUjNTMzF4aWxxRFNvTDVvR3pPbEtDRTdHOXhwdjMzOG9M?=
 =?utf-8?B?eGxrOEJ6bmdrVUh2YW5ZMXE1bnJlTlR0ZXZMSmc4a1A0d3A5eGFOMGlIQTYr?=
 =?utf-8?B?WERIWFkwTm1VK0ovQWpXOFZNQzErMFlQQ2pWSWM2WEhPNFd1MitrZVBnY3dl?=
 =?utf-8?B?UVYzTG5ZaU15TWpuMWR5blBlc25UeksvR08vcE9DUWFJaVVOMjNIL3RXdFZB?=
 =?utf-8?B?VGRBSHpsUzJ4TVd5V0lLYmN3bG5aNGxaM0xZSFJDaGxkZThhUkRudCtnWlhj?=
 =?utf-8?B?NXYyQjE4c0hPSWFQVEZOU0tMZGphUE5nOEJZUk9QWGw2blVVemptNjg0Mk13?=
 =?utf-8?B?aUt2bjJoLzUrTDMrOXA1NlBrSlhCSHY5SFNwZkZTZUhwVVRvMlcxa3lSN3Jo?=
 =?utf-8?B?TU1tcUNWZktkTURTMitmRTJFblF5VE84aGdZMkZ5bWpwS1lsZlBoaTF6ZVgv?=
 =?utf-8?B?SkNMN2k1NG5SRVVMOXVYa25BWTFkSVI1UjArSGlUcXFQZlVXeXZ0WDRPZTRH?=
 =?utf-8?B?UWQ2Vk45WGJRTm4rOU1hUXV0cEs4SzlmZkdYOWpTN0JvZXBIT1QxOHp2SjUw?=
 =?utf-8?B?a2w4Q0RVZzd3Q2xrKzUzS2FBNk1hWVEvMEc1amFNRHgya0szQndzTHJhQ0R2?=
 =?utf-8?B?eGc0emEzQmlrMjA0VEZMRFhONnRZbHY3VUVxM2NKT1BHZ05sQVMwb2R5dDEv?=
 =?utf-8?B?N2h3b0FydTRIVnVLd05SbEpCTVJOK1B6REM1MHBUWlpDaVUrMWFVaGlMS0V3?=
 =?utf-8?B?NW1qVXBZRURJS3AyeDBqNDNXTVZnd1RNSGUzZkNwdVpXc3ZMVVpOaE1mWnhV?=
 =?utf-8?B?QU0yV21XVDlyL1NIN2J2QjJHa2ZDY3piVlZlaUlNQWszV1JXMVhEb0tnaGlD?=
 =?utf-8?B?MFUrTHlZaVVyS2JQM2JJVlZSZXJHWTNIMXFyTi9LTFhwUCsvSVU4NDZFSXlL?=
 =?utf-8?B?cktvaVRLREdSQkdXSCs3bTdBb24vNk4xTGI0cWNtNGJSZ2FhUCtKaXV5bmVZ?=
 =?utf-8?B?KzQrREY3NkM2TWo1QVd1Ky80Qk51dzZHUUxoY1A0M0hpeHZraDErK3ZzemtD?=
 =?utf-8?B?bGxyaC9jUnlSczNRYnVlK3ZybStXUkk4ZTVjdElIZXZteXkwck9YOUF0ekc4?=
 =?utf-8?B?dit2SFphRXcxay9LNUVjVEVjTmp3VEY4TFlsSzlQMS9DYXBMajJZVlBZc0ph?=
 =?utf-8?Q?OHE2bMWeRiAoxCbuN1wYD2tGQ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14282.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e04ed7f1-5125-4a38-cc2d-08dde6c365a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 06:15:05.4451
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qu2j+Gov2wcqCH37tD/mPxYaUZYydfqJo0Khiqcxt4/zFqfZz53ujOKY+znL0RvcMVXfu09tqhs4ON3OMvn7SNPtD2/JfIG4/OYtbXG2k3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB12000

SGVsbG8gQWxvaywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBTE9L
IFRJV0FSSSA8YWxvay5hLnRpd2FyaUBvcmFjbGUuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgQXVn
dXN0IDI4LCAyMDI1IDg6NDIgUE0NCj4gVG86IE1pY2hhZWwgRGVnZSA8bWljaGFlbC5kZWdlQHJl
bmVzYXMuY29tPjsgWW9zaGloaXJvIFNoaW1vZGEgPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVz
YXMuY29tPjsNCj4gbmlrbGFzLnNvZGVybHVuZCA8bmlrbGFzLnNvZGVybHVuZEByYWduYXRlY2gu
c2U+OyBQYXVsIEJhcmtlciA8cGF1bEBwYmFya2VyLmRldj47IEFuZHJldyBMdW5uDQo+IDxhbmRy
ZXcrbmV0ZGV2QGx1bm4uY2g+OyBEYXZpZCBTLiBNaWxsZXIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+
OyBFcmljIER1bWF6ZXQgPGVkdW1hemV0QGdvb2dsZS5jb20+Ow0KPiBKYWt1YiBLaWNpbnNraSA8
a3ViYUBrZXJuZWwub3JnPjsgUGFvbG8gQWJlbmkgPHBhYmVuaUByZWRoYXQuY29tPg0KPiBDYzog
bmV0ZGV2QHZnZXIua2VybmVsLm9yZzsgbGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3Jn
OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBOaWtpdGENCj4gWXVzaGNoZW5rbyA8bmlr
aXRhLnlvdXNoQGNvZ2VudGVtYmVkZGVkLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBuZXQt
bmV4dCB2NCAzLzRdIG5ldDogcmVuZXNhczogcnN3aXRjaDogYWRkIG9mZmxvYWRpbmcgZm9yIEwy
IHN3aXRjaGluZw0KPg0KPg0KPg0KPiBPbiA4LzI4LzIwMjUgMzo1MyBQTSwgTWljaGFlbCBEZWdl
IHdyb3RlOg0KPiA+ICtzdGF0aWMgaW50IHJzd2l0Y2hfZ2V0X3BvcnRfcGFyZW50X2lkKHN0cnVj
dCBuZXRfZGV2aWNlICpuZGV2LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3QgbmV0ZGV2X3BoeXNfaXRlbV9pZCAqcHBpZCkgew0KPiA+ICsgICBzdHJ1Y3QgcnN3
aXRjaF9kZXZpY2UgKnJkZXYgPSBuZXRkZXZfcHJpdihuZGV2KTsNCj4gPiArICAgY29uc3QgY2hh
ciAqbmFtZTsNCj4gPiArDQo+ID4gKyAgIG5hbWUgPSBkZXZfbmFtZSgmcmRldi0+cHJpdi0+cGRl
di0+ZGV2KTsNCj4gPiArICAgcHBpZC0+aWRfbGVuID0gbWluX3Qoc2l6ZV90LCBzdHJsZW4obmFt
ZSksIHNpemVvZihwcGlkLT5pZF9sZW4pKTsNCj4gPiArICAgbWVtY3B5KHBwaWQtPmlkLCBuYW1l
LCBwcGlkLT5pZF9sZW4pOw0KPg0KPiBQbGVhc2UgcmVjaGVjayBoZXJlIHNpemVvZihwcGlkLT5p
ZF9sZW4pIG9yIHNpemVvZihwcGlkLT5pZCkgaXQgY3VycmVudGx5IHVzZXMgc2l6ZW9mKHBwaWQt
PmlkX2xlbiksDQo+IHdoaWNoIGlzIGp1c3QgMSBieXRlLCBzbyBpZF9sZW4gd2lsbCBhbHdheXMg
YmUgbGltaXRlZCB0byAxLg0KPg0KVGhhbmsgeW91ISBWZXJ5IGdvb2QgY2F0Y2guIEkgd2lsbCBm
aXggaXQgYW5kIHNlbmQgYW4gdXBkYXRlLg0KDQpCZXN0IFJlZ2FyZHMsDQoNCk1pY2hhZWwNCg0K
PiA+ICsNCj4gPiArICAgcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+DQo+DQo+IFRoYW5rcywN
Cj4gQWxvaw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCg0KUmVuZXNhcyBFbGVj
dHJvbmljcyBFdXJvcGUgR21iSA0KUmVnaXN0ZXJlZCBPZmZpY2U6IEFyY2FkaWFzdHJhc3NlIDEw
DQpERS00MDQ3MiBEdWVzc2VsZG9yZg0KQ29tbWVyY2lhbCBSZWdpc3RyeTogRHVlc3NlbGRvcmYs
IEhSQiAzNzA4DQpNYW5hZ2luZyBEaXJlY3RvcjogQ2Fyc3RlbiBKYXVjaA0KVkFULU5vLjogREUg
MTQ5Nzg2NDcNClRheC1JRC1ObzogMTA1LzU4MzkvMTc5Mw0KDQpMZWdhbCBEaXNjbGFpbWVyOiBU
aGlzIGUtbWFpbCBjb21tdW5pY2F0aW9uIChhbmQgYW55IGF0dGFjaG1lbnQvcykgaXMgY29uZmlk
ZW50aWFsIGFuZCBjb250YWlucyBwcm9wcmlldGFyeSBpbmZvcm1hdGlvbiwgc29tZSBvciBhbGwg
b2Ygd2hpY2ggbWF5IGJlIGxlZ2FsbHkgcHJpdmlsZWdlZC4gSXQgaXMgaW50ZW5kZWQgc29sZWx5
IGZvciB0aGUgdXNlIG9mIHRoZSBpbmRpdmlkdWFsIG9yIGVudGl0eSB0byB3aGljaCBpdCBpcyBh
ZGRyZXNzZWQuIEFjY2VzcyB0byB0aGlzIGVtYWlsIGJ5IGFueW9uZSBlbHNlIGlzIHVuYXV0aG9y
aXplZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgYW55IGRpc2Nsb3N1
cmUsIGNvcHlpbmcsIGRpc3RyaWJ1dGlvbiBvciBhbnkgYWN0aW9uIHRha2VuIG9yIG9taXR0ZWQg
dG8gYmUgdGFrZW4gaW4gcmVsaWFuY2Ugb24gaXQsIGlzIHByb2hpYml0ZWQgYW5kIG1heSBiZSB1
bmxhd2Z1bC4NCg==

