Return-Path: <linux-renesas-soc+bounces-27157-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAZuOd/1b2m+UQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27157-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 22:38:39 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 519C84C63C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 22:38:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0E9DD4AEA92
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 20:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 245153A901D;
	Tue, 20 Jan 2026 20:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ipWDru8I"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010053.outbound.protection.outlook.com [52.101.229.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED9D3A9626;
	Tue, 20 Jan 2026 20:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768939874; cv=fail; b=AyJsYN4TRsstTIofKoOPDYNMXSmgZw1poTnhHsymNFKiOG5Hb/cV+reNEEvrdSAAhIFSqIgy/VUfY1uLYcmSv8xNEoE5S0OAQ8mmGSi1p92xc6jiwD+Bugg3oPII+64bGn3jCae95/RTMptRv++x42+0Xy6fvjYvIE0/tetpkfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768939874; c=relaxed/simple;
	bh=h+Bl0Z731MRCXUfB8zhnMTcSCMV1QiQ56qvD0h+moos=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dOzC3vw8y7jQQTFHuPdm2Sz2afbcHU8Ajfn9pqga/Mz5x1re9zgJx22MetkBLw5MqizeZER3qS/v9OP1CkxgX0zVWr47WDcL16STDhCRTypfECZbAHVRShgOyP341vaogZMaF0sNqj6jBA6UgkQUSiLRr4HslofJw70RN2b8+kI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ipWDru8I; arc=fail smtp.client-ip=52.101.229.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lL4zlpMYAjcHbJWQ0ZAlM7tUp6n2bIXiU4XcCc1JYackvU4O+DC79zaQ7haOmNpYJNj+GNycRLx3acX+CNw6gq3ZH4gS8qvgOAS3PMwvUbb67nuwppos0wSRDA/9GjtGWLAyEL+utZujBvibjCKz4p9JpWFb8ZrrAkEIY6ByVsSeQ1eE5/M97bW8oYeJeJ9XGfGpOYBfPosB3GukhBZTdthspQMI+8ikUWmwvhIhAZwlBx5IAPd5ypVqzozI8gKvZIHMrx+oAfZX0BFFJpbsK2V8HEVU4vdzFbNSB7HDeMNYpvVnHu6Db0wpYSyIB9YmDnVs+q842OwyW6denhZroA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+Bl0Z731MRCXUfB8zhnMTcSCMV1QiQ56qvD0h+moos=;
 b=BEzX2A7EuWcuOM9IgAX8oGwVOZ+GZjBQ9YROJ+7Q75C7QhktQ4lV9Tfg2x0OODIgzdzVvdM4Fjmn3cp9/y6fwJnQ+s6dqDE8caxFcNnQiVHqbeU1g5iFdjArMMoOABrPSX7xQWFAGQhBGfS+ndyh9Scpf3YALpyaimt+PnkKE5rPDbAsIEB3iroqOFmjQisFcVBkjN1oOZ3avQF9T8JmQTAflH3+o4Rt42D7iln6n+IqwozaDLoFfTJR65TJIs0SdejVqGctB7kc9n1o2VwvPwR4XolqsmOqCoiD5lWHIpVURK9GFBoATFR6pOISHwwCOiVqIY5nw38CF9qmb7KKsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+Bl0Z731MRCXUfB8zhnMTcSCMV1QiQ56qvD0h+moos=;
 b=ipWDru8INIwRvcvXp0HlybYSCCumq1INOFqoLGJBo7d1X8GvQ/1q4bw8JOtldvyrDOV338hfkH31Ynoa9gbIUPhHEU5kVg+8kq+M9sev2l8qsRw+p5Tu/+KINfCOqlBWg1ZCDaH0x+//Y5MahySz7Y/edG9XbdQaTgg1T6xfXfA=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYRPR01MB12724.jpnprd01.prod.outlook.com (2603:1096:405:1b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 20:11:04 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::aa7e:1460:f303:3fd8]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::aa7e:1460:f303:3fd8%6]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 20:11:04 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>
Subject: RE: [PATCH 01/16] PCI: rzg3s-host: Fix reset handling in probe error
 path
Thread-Topic: [PATCH 01/16] PCI: rzg3s-host: Fix reset handling in probe error
 path
Thread-Index: AQHchWtzpfFST+ihokiR5M7UyuehbrVZjgKAgAH4vcA=
Date: Tue, 20 Jan 2026 20:11:04 +0000
Message-ID:
 <TY6PR01MB173771F2A14FDEF6698DCD14EFF89A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260114153337.46765-1-john.madieu.xa@bp.renesas.com>
 <20260114153337.46765-2-john.madieu.xa@bp.renesas.com>
 <fb7ec096-372b-48f4-b6ed-e224a05d55e2@tuxon.dev>
In-Reply-To: <fb7ec096-372b-48f4-b6ed-e224a05d55e2@tuxon.dev>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TYRPR01MB12724:EE_
x-ms-office365-filtering-correlation-id: 40086c6f-ffa4-44ff-86f7-08de58600a18
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?dkFkcXRXdjZSZDVyck9XVWlnb21QWHl4Yk54Z3E0SXpmVk9pWW5KQm5RRWQz?=
 =?utf-8?B?S2lIK1BuMVBLWTlhQkJGYTgrYjlsSkdzV1hPRWtRZEdjMFVsbElyYlp0SWlH?=
 =?utf-8?B?ckNGV05GWTc5SkpZandlOFFVS1lMS1pjUlI4ZzZtY1FldGdZK0tNNytEM2Vm?=
 =?utf-8?B?VHhmU1FZZlBTRCtrRmRJU1ZwQUpLWWpLZkpZdHV6OVNRNENFMjdHcy9rWUlL?=
 =?utf-8?B?Ym1LV1piaktVekdTUW9YcVZNbHk2cG80UGRhQk1abC9RcVZQUDhkMlhiZHJE?=
 =?utf-8?B?MTZPeFExZTkxemlLTm5KUHR2TjY1a3BrdHRDME9iSFpIampHT2VQVTJkSTdw?=
 =?utf-8?B?K1JLMDhmOXU2U0RxeVNqVEtwWU5Za0V2QWVLNGJhY1FWWFFvclNkeFRCZklL?=
 =?utf-8?B?WTErYmtkaVBmbDVPN0V2dEpoRjAySE5MVVcyVFhiQjZoQ3pMdmVSSTR5cEh6?=
 =?utf-8?B?Q0VGdXFwSFU1SVZsT1dVSjNRM1NzOW05TTV0UTJGT0ppeVJhYndvclBuZHpq?=
 =?utf-8?B?SWVzRFg3UGRoSTdXc1N2R3RuV1lGVFlvSnc3TmtiUmJKMmxTeFNVcUlRcURT?=
 =?utf-8?B?SzJqUzBUNHlpNTNQZTJtMm8yT1JQdDR1NFlzaUJDcEhCYW04dDlOMmtHRUdN?=
 =?utf-8?B?VzJHODYxTU84azE5aTM5K2tUVE1uOGMrdUo0ODk3WUM1OThzUUdJdE5BeWds?=
 =?utf-8?B?TzVSN1duZE43NUJ0RFNxZHUvNE04Vzc2a0l4YWU1Y0ROWEVhUmdIbTQ5Uzcx?=
 =?utf-8?B?Y2IzUUxPSFkxSjROVlUrc1J0MXZ0eUdybUVKdGdTeSt4T1pYR3E3c1hSbjFZ?=
 =?utf-8?B?dXZkbk8rVVJqN3RXT3lsQ0Q1eC9RNy8rZk90czZobjRhVVlndThFYi8wUVpw?=
 =?utf-8?B?UWNDTEFUcEdtVTRQNzZrb0pXYVBIdXBPaDBGcFBjZ3owTzlubmQrUDRQdlV0?=
 =?utf-8?B?QlV1cFpCTmdFWTJpSW5JUm8zNUNTSkNDR204NFdrcjMxWlFITWZmcEZyaEtk?=
 =?utf-8?B?eWVOekJqajNHZ0xXelpmdkVGOW12dEZQMXJZSVBBS0NJc2JNK3BWUHJqM3Zz?=
 =?utf-8?B?cnRyMGNvZ21RZmZDYVIzWFlvS202WkJrVTMyR3k5NVlRNzVyQVZVeTBveTAx?=
 =?utf-8?B?ZXhnWUxTelRYZktXM2VDNGdxWnA5UEdvUkFUNTdGNm5zYXJsMXZ5UWFOV1Fx?=
 =?utf-8?B?ZGkrTFVBK3N2dk95Wnk4QzIrMDNsMHlwVDJic0s1dEdlcEhQOCtFcWhTR1pw?=
 =?utf-8?B?aDIxMzNKaWNmbmg2VlgrVWZrR25Tc3BBa3RuNzZWa0lqWFVUNWJ3YldFZ0J3?=
 =?utf-8?B?QytUS25wREdPd092YWFJUm9WK1JQOGtmQ25TbThpcTZPL1ZLQVJ5TDVrWDlP?=
 =?utf-8?B?ZEFVem5xc090Y05NQ0xkbTZkTGhIczlodVh6TWlKNnA3Z2xBa1BiZGIrR0JQ?=
 =?utf-8?B?OUNCOWpFQzIzMjVERXNDMTYrY3ZHQTJPbUFSR0VQRnFzVUhLNzZtU3h5K0hl?=
 =?utf-8?B?L29hS1RDNUhXUERVWXhaT3V3Z0ZjeUF4MUhQbnRtU3Z3OWQ0eGRMQ3RiaGdB?=
 =?utf-8?B?OHJNZGM5Mzd6aEtya0MwT1U0aU1VMUsyYWt3N0lnRTNqWXF0UHUzaWJRaUZo?=
 =?utf-8?B?dHN6eEJaaTVXdjUzTlVMaHFMd3QvRDd4cXJIdGxxR095c2t6eWN1UXZJS05M?=
 =?utf-8?B?ZStzdlFSUlY2ZnArdWF4VFZGdkowUWgwVXBVcWlyNHBjTjhIWGd4K3JnQTUz?=
 =?utf-8?B?c3c3MFFiaGUzQ21yV1lqcjFuWWw2TndDOEIwYWg4R1NFRi9zc2VQaTUzTFA1?=
 =?utf-8?B?L1VxTVljRkxSUEN0VGlzN1FVSzJKMytSVTh1Z0ZET2VaSlcva1JWYkVKYWY3?=
 =?utf-8?B?R1kxVXRnSjN6VmJYaDJmb0Y3V0RQdFZ2RHkxMk8xT3dIeEltUVBKWjNuUzc2?=
 =?utf-8?B?aVRuMWF1YUtqdUpWOHJyVG5QUGYzbWp0c2I3cHZYaFJzeThPdExFZlEvMTBT?=
 =?utf-8?B?b3ZudWZVQTdUSFM3RG9DMzZyV3NyejBRV1NaVmVZdmVlUmo4aTJOK2FvZDdj?=
 =?utf-8?B?eUZqQUFaaHdhNXZsUTZzRWZFdUUzZXFodVpjU1ROOHZDNllUakIwcEg1d2lz?=
 =?utf-8?B?TVNnQTJpUEU0OWFHeWtWcXRMOE9vYStXYkdJUncyNHZmV3VJWkN2RXRmeE8x?=
 =?utf-8?Q?qgJS8tVIGmUNWk34J6zj65U=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U0lOanZJYVc2ZXA3TFNFVTdNWGN4RTh0L0NrMlZYenBWaGhDSkJjRzJBRXJ1?=
 =?utf-8?B?MExrc3hWbDVnRExab05yVVEwcVNReVdhRzhXckRuc2NScm5BUGNXbTc4R0ts?=
 =?utf-8?B?cUNSM3I0Wk5hczMyNWJmT2krRnU1VksxaFpWN01scFFHaTFnSWt2Z2JiRlZ4?=
 =?utf-8?B?WHk1RzQzMGloRUdweHJ6amtJSkIyb0g2dGh3NXVXNnZJNko3VHRXWGYxcldi?=
 =?utf-8?B?WE4wZnRuMHJCYTVyVXJqZ3RXRWhYNG5zbWIvS0RCSWl5a09uRzJhcFBsVEpV?=
 =?utf-8?B?OC9IS3c5cjM3SEZaOFQ1S1lNN1ZDc01XOGxpcXY0SEhkeEpKZ2tLTWU0QTdX?=
 =?utf-8?B?a2U1V2RkdVp4ZGYvc05NQ0tmK1I4NVhGYVZ6MTFXMnJPeWhlLy9tRmFRazZR?=
 =?utf-8?B?T3NCSU9MY2ZhK20yT2pONkZ5K0pFU1MyRXNqTUZSR1NxdC9RdWplbVRVZE9Z?=
 =?utf-8?B?aG16NmpjcklrVW1ncEp5VVFjSmdjSFBvMlV0d2tpRHpxQXF5UURxRDFEVVhI?=
 =?utf-8?B?SFduTXVURFo2MStNTlk2TS8yeHhpN1lHYjBndnFiczkrRFdLbDd0OGMxSERa?=
 =?utf-8?B?NVYvdmVPdU0wdTJLYVlYRWZuM0JuRmd1b3E4eHZDK25yck9jWkZvcEM0R1Q3?=
 =?utf-8?B?V2gyQzBOVS8vbkhRcHB3ZUY4cDVLUWo3OThZZ1ZOTGxTYVZ1VkdZR1hhMkJa?=
 =?utf-8?B?blBnRjZGUldaMDA5MjZpY0grVDZDS1J3MWtBSUV5Qk91R0lIMnZKQW80M2FW?=
 =?utf-8?B?bEprNCt5VkFPMHNPZllyZDhOR1pkTzhhVWJzNEtscHZqTmx5ZHpPVjQ4Ykpy?=
 =?utf-8?B?Q3ozVWtIQXZ0clZ6S2dmVzh0TExhMGNQbU91R0kxWHFiWS81RUEwdHVLeUpT?=
 =?utf-8?B?TXIwUklxT0poczNKb0gvYitMQ0d5cDJ6N0hqcmVMNHIyREpDZkNvbnNCUmFa?=
 =?utf-8?B?RWd5NE1sS0Q2YmVhU0RLRlNoZ2hpVUxGdzlIOFYvRnFaRGZpUGhTSXdzTmdO?=
 =?utf-8?B?b2VPRmhqeDdvSml5YlBGeXkweURpQk93SWhRZGtiN0gzN1FOb2w1Mm10S0dT?=
 =?utf-8?B?ODExeFpKSTN6bU9ablRpNlNXeDZlNGczYzFXeFVjL1J2NDVaTmQ1dGlrSTZh?=
 =?utf-8?B?QU5XdnZJS2lLc0tEV3JHMFNxemJvUGhNWkx6SVdJOExMRElIYldYeDlhUG9h?=
 =?utf-8?B?ZDFWSXF4M1ZieUxRdGtNNHZXQ2Iyb2pCNmpFdlA0aXdlaXlnR3dGN1RtbExD?=
 =?utf-8?B?YzZ6TUErRzdBUmg3Qjh3Tk4zZ3dpYkwrQk9XeGhMKzZ3NHdMT3ZUcGVkN3hV?=
 =?utf-8?B?OWlsNU5JZkhOQmhiWWZpNEo5cERqRk13V2wrSERKbVhlS0FrVjZiQWZoK3pP?=
 =?utf-8?B?c1N5Q3pFZW1SVFBLZUsxMWZXUUNnaVVhbGFZU00ycTFybEs3dm9aV21ESjBu?=
 =?utf-8?B?T295T2dQKzhFVy9BbGpvMXRNdTV6RWwrdEp6RjNXbjl0UVpDaGJ1dGh3Z3VN?=
 =?utf-8?B?UTlSa1ZSdHluVHlNWHNWTGl6YlVaK2tIbDZpWnJ3UWZMVTIyNTFyQ2lwdnNu?=
 =?utf-8?B?b3NXdngrSEFDWlFrQW4wRHFqd2UwWktjVWZWTC9TWVd6TFhvUlNjS2dTdXNS?=
 =?utf-8?B?cGR0ck0xRmVUOWdVSFNFUFcyNGtBbk5vSnlTZ0d6QldSS24xTnlVY0hmbThF?=
 =?utf-8?B?OE9wV21IeWxrR3JFdCs5enlwL1FCQVlEeXNsS293cDdkSm1kUDFiN1ZadEZw?=
 =?utf-8?B?VkhqQ2VrLzJOL0N1NG91SXZ4elpPbUdjN1JiVnBCTVJFelRtZXd2M0F6Y3Zz?=
 =?utf-8?B?eTkwb3lubU9oMUhyalJXSVoxRCsvU2JVbDFDSkNzRE5rZkRPaXpGdTlKTlNN?=
 =?utf-8?B?Vm8zTzdWb0haYWtWajlIOVhhZEU4T1c0cXNROXZrK3lVQ2JuazdXb0llc1hu?=
 =?utf-8?B?Z2NCRzlERGwwajBYYlA4MVVMWmhMWmdPWVVVTGpYL2J6Q05nSVRvRGNiWno0?=
 =?utf-8?B?QmsrSVpwVTNhSGpQR2Y4QXNnWTVWSHJXdkRMWER5Zy96cG9ldExXdkNJdTNs?=
 =?utf-8?B?eGNoSjFaQTQyaks2MmZXcnpHYzBNRERwdnhCcExUbVZXS1pieDR5SkVYVlpm?=
 =?utf-8?B?MDlTWGN6RjMwTDlPU0U4bUQzdHV1cVZaQy9FbjNPbnVXZGZLVXJQcVJBMVly?=
 =?utf-8?B?dFozZm9sWkJja0lXOEJ3ZE9TVUw3NFVzaFRhSkM2Y1dxeTNGemhGdGVkVkNL?=
 =?utf-8?B?Z1U5bWFvc3R6c0dpUk1sYWZ5ZFozVzRqM3N3TUVFNVJ2bGtKNlBGY2NiWDhS?=
 =?utf-8?B?V3JhaDJibGh6VFRMU2tXZFVCajhaSGJ1aVN4QW01cFVYd053MVI1NGUwTEU2?=
 =?utf-8?Q?uHmU5bKvdSEnRv3Y=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40086c6f-ffa4-44ff-86f7-08de58600a18
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 20:11:04.2188
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K1wMtb/DjgcK2rqYbWnn8GGB7iWjlEpkHgF3TIeqJ6TzwKSt2j/T5dt+WavuKl7F7GZkYAntSAJPdbZojPRcr0SsZwhX0QNHILnLUBsqsHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12724
X-Spamd-Result: default: False [2.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27157-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[renesas.com,none];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 519C84C63C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgQ2xhdWRpdSwNCg0KVGhhbmtzIGZvciB5b3VyIHJldmlldy4NCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4
b24uZGV2Pg0KPiBTZW50OiBNb25kYXksIEphbnVhcnkgMTksIDIwMjYgMzowNCBQTQ0KPiBUbzog
Sm9obiBNYWRpZXUgPGpvaG4ubWFkaWV1LnhhQGJwLnJlbmVzYXMuY29tPjsgQ2xhdWRpdSBCZXpu
ZWENCj4gPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPjsgbHBpZXJhbGlzaUBrZXJu
ZWwub3JnOw0KPiBrd2lsY3p5bnNraUBrZXJuZWwub3JnOyBtYW5pQGtlcm5lbC5vcmc7IGdlZXJ0
K3JlbmVzYXNAZ2xpZGVyLmJlOw0KPiBrcnprK2R0QGtlcm5lbC5vcmcNCj4gQ2M6IHJvYmhAa2Vy
bmVsLm9yZzsgYmhlbGdhYXNAZ29vZ2xlLmNvbTsgY29ub3IrZHRAa2VybmVsLm9yZzsgbWFnbnVz
LmRhbW0NCj4gPG1hZ251cy5kYW1tQGdtYWlsLmNvbT47IEJpanUgRGFzIDxiaWp1LmRhcy5qekBi
cC5yZW5lc2FzLmNvbT47IGxpbnV4LQ0KPiBwY2lAdmdlci5rZXJuZWwub3JnOyBsaW51eC1yZW5l
c2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmc7DQo+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBs
aW51eC1jbGtAdmdlci5rZXJuZWwub3JnOw0KPiBqb2huLm1hZGlldUBnbWFpbC5jb20NCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCAwMS8xNl0gUENJOiByemczcy1ob3N0OiBGaXggcmVzZXQgaGFuZGxp
bmcgaW4gcHJvYmUNCj4gZXJyb3IgcGF0aA0KPiANCj4gSGksIEpvaG4sDQo+IA0KPiBPbiAxLzE0
LzI2IDE3OjMzLCBKb2huIE1hZGlldSB3cm90ZToNCj4gPiBGaXggaW5jb3JyZWN0IHJlc2V0X2Nv
bnRyb2xfYnVsa19kZWFzc2VydCgpIGNhbGwgaW4gdGhlIHByb2JlIGVycm9yDQo+ID4gcGF0aC4g
V2hlbiB1bndpbmRpbmcgZnJvbSBhIGZhaWxlZCBwY2lfaG9zdF9wcm9iZSgpLCB0aGUgY29uZmln
dXJhdGlvbg0KPiA+IHJlc2V0cyBzaG91bGQgYmUgYXNzZXJ0ZWQgdG8gcmVzdG9yZSB0aGUgaGFy
ZHdhcmUgdG8gaXRzIGluaXRpYWwNCj4gPiBzdGF0ZSwgbm90IGRlYXNzZXJ0ZWQgYWdhaW4uDQo+
ID4NCj4gPiBGaXhlczogN2VmNTAyZmIzNWIyICgiUENJOiByemczcy1ob3N0OiBBZGQgUmVuZXNh
cyBSWi9HM1MgU29DIGhvc3QNCj4gPiBkcml2ZXIiKQ0KPiANCj4gVGhlIHRpdGxlIG9mIHRoZSBj
b21taXQgd2l0aCBTSEExIDdlZjUwMmZiMzViMiBpcyAiUENJOiBBZGQgUmVuZXNhcyBSWi9HM1MN
Cj4gaG9zdCBjb250cm9sbGVyIGRyaXZlciIuIFdpdGggdGhhdCBhZGRyZXNzZWQ6DQpUaGFua3Mg
Zm9yIHBvaW50aW5nIHRoYXQgb3V0LiBXaWxsIGZpeCBpbiB2Mi4NCg0KUmVnYXJkcywNCkpvaG4N
Cj4gDQo+IFJldmlld2VkLWJ5OiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWEudWpAYnAu
cmVuZXNhcy5jb20+DQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEpvaG4gTWFkaWV1IDxqb2huLm1h
ZGlldS54YUBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvcGNpL2NvbnRy
b2xsZXIvcGNpZS1yemczcy1ob3N0LmMgfCAyICstDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3BjaS9jb250cm9sbGVyL3BjaWUtcnpnM3MtaG9zdC5jDQo+ID4gYi9kcml2ZXJzL3BjaS9jb250
cm9sbGVyL3BjaWUtcnpnM3MtaG9zdC5jDQo+ID4gaW5kZXggNWFhNTg2Mzg5MDNmLi5jMTA1M2Y5
NWJjOTUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLXJ6ZzNz
LWhvc3QuYw0KPiA+ICsrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1yemczcy1ob3N0
LmMNCj4gPiBAQCAtMTU4OCw3ICsxNTg4LDcgQEAgc3RhdGljIGludCByemczc19wY2llX3Byb2Jl
KHN0cnVjdA0KPiA+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPg0KPiA+ICAgaG9zdF9wcm9i
ZV90ZWFyZG93bjoNCj4gPiAgIAlyemczc19wY2llX3RlYXJkb3duX2lycWRvbWFpbihob3N0KTsN
Cj4gPiAtCXJlc2V0X2NvbnRyb2xfYnVsa19kZWFzc2VydChob3N0LT5kYXRhLT5udW1fY2ZnX3Jl
c2V0cywNCj4gPiArCXJlc2V0X2NvbnRyb2xfYnVsa19hc3NlcnQoaG9zdC0+ZGF0YS0+bnVtX2Nm
Z19yZXNldHMsDQo+ID4gICAJCQkJICAgIGhvc3QtPmNmZ19yZXNldHMpOw0KPiA+ICAgcnBtX3B1
dDoNCj4gPiAgIAlwbV9ydW50aW1lX3B1dF9zeW5jKGRldik7DQoNCg==

