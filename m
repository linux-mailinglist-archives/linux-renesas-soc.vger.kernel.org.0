Return-Path: <linux-renesas-soc+bounces-27156-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNq3AJDtb2m+UQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27156-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 22:03:12 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EC74BEC3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 22:03:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 39C708E99DD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 20:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3985F3A4F2A;
	Tue, 20 Jan 2026 20:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="uNd3fJDh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011071.outbound.protection.outlook.com [40.107.74.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E742315D25;
	Tue, 20 Jan 2026 20:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768939554; cv=fail; b=uqpUXt1l5v28OmwLJJIOEoEzwixxULdHruinXDJlL2viU1TcKg+YbdNbvCsobW3SXvjex5WOivlxERpEQdzyelpiXMpUyXp2FFaPvCBwuNs2sbupaqcDvLCtGV24qvf70bsoI4BHIf6DkXa4dmZrnFVukdYHonmhDdzYSF4h/vY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768939554; c=relaxed/simple;
	bh=PG8ro4ety9KFORq7B4xA6R6foX248jKjQS9fJO6aRKw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=p7iG3nN8b+razUjSUNk+cu3S1UdErgsI6kkwSEOR6/MAtO9J67S9DKKlLF+tNTWoGWcl6sQ+go1JcBdY0j9rjbG1l7G9u1So4WBcOdEF6eghHqdRbnuknVMu4Zo36SEVtwkRZsAo79b5UR/ekUtH+JRfIlZ94qWi/TcEHApxBs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=uNd3fJDh; arc=fail smtp.client-ip=40.107.74.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K+QJ+GYCcQQTKmunxl+yTqD/Dm7HLSQ58RnNfCNzbdbqTps62oviasqB/wcRbkFbDPCXz7RH2rnZa8cWpCOcN4aaEWWzsvre8HonNWPRvDDGSJxHVbc9Tk3gM3MVraOGtH8g1UQG/JL0cxVFBK1D9BRUWSqxY8gHEzuRrnzQNmr7W+gvTvNRGyKTfkhCpiPWmMw7N3cdW96/ZlkPS3elvyYrgbDpfTzPWrOSFlgBqlR62HDeeWHfXLFPRdcCF2/MHMQL8xT3aI8kqBC5JkQ3my1PhbLfAaylO6vYKDb3yyK5hyEqmPGgkzJ15cSVQC+B6cDxpXigm8ZdqT76iWPlhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PG8ro4ety9KFORq7B4xA6R6foX248jKjQS9fJO6aRKw=;
 b=GaAFbPH0ldAtMwd01aRfw73Puu2Fo8NpMEfTt/hZ1Y0+OlJbyd8KD7ptFyT7AyjjCvWNPVlWgtULGMc7GJFd5NYiKfYUmpWFe4ZUe/MD9y8SQ8j04moBVwlz1yBXhbZkDBj9q9xlbD/Y/LV1bDsIHrycOPylpgE3pzgrsDtIn9dwXaOztWQccDlL1vy3gFbmp/Jqg+IZaapbSCqN4przFpd7HUD+z29zGUJzeBl7papBUxsSYiBZHHSdPGmAif1yBbgjU2ro21LI0rilVAuOwcjSORU3AP5E+mG4hx6BiboYpXwi7t4Woap2VjRTIklrRQzE5SRSFxPsMAG/ccHI/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PG8ro4ety9KFORq7B4xA6R6foX248jKjQS9fJO6aRKw=;
 b=uNd3fJDhUJzG0G2AQ7YlZky8m/82hWwyFlzn2UauRmF+JvsNbURd+fUKDYXFQ73rfGSgHzPFnHyDRCWAqE3bLdYbbThYBdof5xoSOPPLsoiBZXxWdtFDyqq70k2xEWDptvc2SECwcal0q2FNTBSYJ3w+G0MfkrcY6u+GZK7usSM=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYRPR01MB12724.jpnprd01.prod.outlook.com (2603:1096:405:1b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 20:05:46 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::aa7e:1460:f303:3fd8]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::aa7e:1460:f303:3fd8%6]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 20:05:46 +0000
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
Thread-Index: AQHchWtzpfFST+ihokiR5M7UyuehbrVZjjuAgAH2+kA=
Date: Tue, 20 Jan 2026 20:05:46 +0000
Message-ID:
 <TY6PR01MB173777C7DBD6FCAC1C8AF6974FF89A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260114153337.46765-1-john.madieu.xa@bp.renesas.com>
 <20260114153337.46765-2-john.madieu.xa@bp.renesas.com>
 <f6c7cea6-fbd0-4b3a-ab89-a3c26be11ce6@tuxon.dev>
In-Reply-To: <f6c7cea6-fbd0-4b3a-ab89-a3c26be11ce6@tuxon.dev>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TYRPR01MB12724:EE_
x-ms-office365-filtering-correlation-id: 77713af5-d7cf-477e-d6c5-08de585f4cd0
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z1g4a1U4WWtBL1VPSThyOW9vWUZPc2hSMklXSHh3TjdOYWt3bGRQOEd4dHJS?=
 =?utf-8?B?cDVTWTFmcDNjL3JiZUxZOWg1dStVaGE5Y09zdHF4WDVtR2JUdW5iVTYzdHlK?=
 =?utf-8?B?TURMdXRXa0VUWXJQRGw0VGJScjFSb25ZVGUyZ1B2Yi95UDdUVnFFNzdwTDFZ?=
 =?utf-8?B?UnkvTDlYbjJBTVFSbFJDSGFNelVXNGJkaDVmcG1yMWM3ZDd6WmwyQ284OXlW?=
 =?utf-8?B?Q1pncmlZZkw3dmV3Z0pZYW5jbVhzcityNC8yZ25oZEdYSU9ucEk2ZURaTkg0?=
 =?utf-8?B?SWtyZEpwWmZDNGR1UHllczQvTEV2azh0TTJWTkFPZWxPREV2UzBkNzNaLzhp?=
 =?utf-8?B?WVJLd1g5c0VlY0ttRmJkTk0zZE5yR0tJZWJha0orNS9uS2dXRDh4TEZaZkI1?=
 =?utf-8?B?YUx6Y3RtK2ZYMHhCV0ZFRGVNbDNQWmlyWFpCL2g3cDdzMlZVN09mQlFsR0VK?=
 =?utf-8?B?WHNvbUYvSHRRSVZ4aUphYmFzMUI1eHo2MDMzMDBsT3FuL3Jkd3VSemdvcXoz?=
 =?utf-8?B?WStTaWVoR3I1MWg5ejJvY0dSNXh0K1IvZWJoZm90blp6K2g2WjlDWjlxSW9R?=
 =?utf-8?B?eXBwTHk4M0d3bWhCOE04STN1VjBFYmxtK0IwNThBcjRlcGxaWFErTXEvVW1G?=
 =?utf-8?B?VlJDUU5rRStoNWZNWk5CRk40SC9tK1VqbTRVSFQrVXJVcEN4NCtKb3hvVzlY?=
 =?utf-8?B?SkkzdCs5cWN1SUZMdkFHU3pyQVVMaXhjMWVwR3RQUjlGd1hFaGNnTmRWb1Rx?=
 =?utf-8?B?UGhvRzZGckE0UFpkcTdnSmxqQmVBTFFkaCs4L3VUYkF4Wk1HYlJmQnhEMnBn?=
 =?utf-8?B?YlErdnlQdFlUcTdSTndzeldQNmVabmhPWDRJdjhBV1ZBTWtaMDJ1N0c0eEE3?=
 =?utf-8?B?YTFsSDhpeldLTW5JbHM3TXJhNVFyU3lwNUpCYnBzRmY3NnppWFk2YUFOZ3gw?=
 =?utf-8?B?THhIbFhzSlF0YnVPUk1JQWhpWENJengwRDV6OHlEYjRPY3RmdVVZTTBMYi9p?=
 =?utf-8?B?emduNmRndk5ROHpySGEwSDBHNnc3NGtGckZldDhVNUtZUGtYdEViaFpLYVZO?=
 =?utf-8?B?cytqWkhYeUlybkNDN2htYjh1TC9weFI3cDAxOGRDejZNTHF3RWRaS09meEtS?=
 =?utf-8?B?ekJmckY0S1VBSERXMUl0RGgzcnlEV1V6QzBMRUNFWDFpOWFFN3Rabkd4RU15?=
 =?utf-8?B?OTNrVDdlTDhWc1M1cVZ1ZmdrQ2pRU0pTTVlIYUFNbUNRQkkxRUwxZy9Bbmhs?=
 =?utf-8?B?dWpGdG9jaHE5MXVkUEMvdTJSZDRZZHc0Zm12UWM2RWpxL3MzOWgxT1c3VERq?=
 =?utf-8?B?SzVVbDNQbFlKYnQ5WW9YR0JBcGpJbzJjb040aGtGM1dTekVVbFNrb2tJNkNr?=
 =?utf-8?B?TVNBUU05VzRTUUhoUWtTZ2NDekUvTkF6anMrMDdFM2lMOEUrdlpJbHByangz?=
 =?utf-8?B?QWNWU0JHUHhCWFluSTV6YWR1cWJSelJJNnIvV1BGMkM1em1INGJyNERSQzJ6?=
 =?utf-8?B?VU50am1CTld6VXlxNlo2bTBHd0NIdXMrSS9Mb3JjY3VlckdIck5kZ04vK21r?=
 =?utf-8?B?ZFU1ZFd2UFJneklXZURRK0pHcUNZSVNnSW1oLzVGVmR5a1VPNWorWHhiSU0w?=
 =?utf-8?B?TGRwOEp0Q2ExSTZOQmg4T2xhZ3dlNGd0OS9TaWNOMkJjcTZrWmhWblJ2L1JR?=
 =?utf-8?B?MDMvVVc1clNSUk9kNnZaZmphUmU4ams0WFV3eFd6WDBlQjg2cjFPeGNEeklr?=
 =?utf-8?B?Y2srcnRHUWszVG8xdWc3Ym5jZ0tEam95djZmMCtCUmFKeVltZGlack00VXp0?=
 =?utf-8?B?S2hBWFI5RnhvWktEdUhTYytBVEFRYm9IODFVdm5pcEhGMmt6cnBnTUwyc0po?=
 =?utf-8?B?eXFyeFVxcjUzaGVjdnJRRkFiT1F4ZkRwSVBzWHFtSW96UGFMYkRVVHFWOWJz?=
 =?utf-8?B?aUtnQmNtQlNtSkkyVExUT3F1T21sUWNRbkFDTnU5ejllb2U0d2lQdEE1V1lz?=
 =?utf-8?B?ZXhlVmFTUFVYN3VTcGZZRERCYXhyN3JEYVd6NzV0Ulg4SXNTUmp3NzhFVjBH?=
 =?utf-8?B?d0ZDaGVrNENXQVBJU2lMYTdwNXk3d25MYlplTzlXdWZReG5RN1o3OXI5TTBP?=
 =?utf-8?B?VnQyenI0eFFObHB5Q2FSQ0ozczNIL2pyK2lNUHVnWjNVYVN2OFRnWUdxZkZS?=
 =?utf-8?Q?TjQMwsPJSQbul6Fuczq6z74=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dGlTc2pLYm1JZS9OQi9Jb2EyL3dmaDZxdUw3Z1Z0WW5tN0JQREpCQ1g4S3F2?=
 =?utf-8?B?RXZDRENsYmFxbHR2Q09GUk44UUFCZ0RSMlN4dWR0RmlSSGovZlQvaUFLTDVD?=
 =?utf-8?B?RS9mUVQ0UW0xQjBSSGQ1N0Jhb0lsMUJSamlaTnh1dzdnNHFLbi9tb0xEY25r?=
 =?utf-8?B?YVUrWTBjOXl0TFpBdGdhN3plZlB5RUovdFl1Y2xCakFlRGxXaHA0VmhrSE53?=
 =?utf-8?B?UEtEZVpQbXBhQVU4YjNCMW9ZT3M1dzk2YTJDTmJGN1RlcmI0NG4rVDlNcTZy?=
 =?utf-8?B?RFdDRk5FZlFsemttZ3ltcmdQQUMwYlpBSGEzNVZTUmRlV2F3MGo2cHlNNGZL?=
 =?utf-8?B?MXNsdnl1Y1RCRkRKNjVSUWxhY0FsdEpucXRkRmoybFk1eFdrQUpLQmsyRUJP?=
 =?utf-8?B?a1k3bncwTXdIL1NvMVNLUmt2dVAxUU10RkU5d2ZtUlE2T1M4ZVFNd0RHYkln?=
 =?utf-8?B?OUdKODlqUlJReGNsZVhzWG9FZGhNK2dDcUZwb3NnUjQyWGhFdnpIUDJyRkRB?=
 =?utf-8?B?L2N2ditWbmZVaUdRMkJqWkZYRWZjYUc1cTVrVGs2QlJ5WGJwM0xTVWZiZlph?=
 =?utf-8?B?VmZWYksrQXNvMHlRQ1YzVC9PLzJOQVAvd1dPOWZiMmVldXFLWjRUTlZlc3JM?=
 =?utf-8?B?aHFSZUc1U0MzTGFKTGJ0MkgxN0REWkxiaFJpd0NoR0k2SW9vZDByYmpkMTly?=
 =?utf-8?B?UGQzWGt5TjBLaTg1ZU1qQWRBYjNJRkhYOWdtSGtVTFJINEZiQks2TFZvTjhK?=
 =?utf-8?B?dzljc1UzSmJlWjRVblZRTDQvSmVrQzltclZFdGc4TVpuSFV2cEMrV2l5cGRt?=
 =?utf-8?B?RFZabXpNNUFPMndlOVBVUFVNVVBGejlTY1U4QVpRdGRPdURIM3BvTUxvbXg2?=
 =?utf-8?B?bkN1MjJNVW1LeXR1OTd2WXlkVlNrZUxDSk03WGFmZGpOTWU0cVBKTFU2WmJk?=
 =?utf-8?B?MzJqN1ZkbVp1SVJaaDJwcUhiOVp0eWhiZC9PanFsSTV6VjhGNXJ0MHBNUVNp?=
 =?utf-8?B?SHNQTXp4YVRCem5YVElNYnFWcnBNalhNTit6eFgzM1RXRnFGbW4weHJoQzRW?=
 =?utf-8?B?K3FWWDNKalBYRlNnS2NENFdBY0pKOHZZZmFmUXdMZ0Q1OXZwQ1ZhenU0cHBu?=
 =?utf-8?B?T215WDRjZjFEYWNIQlRDVU16SG5jdmFwVFUvb25NU3ZRaG13SDRzVmI1QUEw?=
 =?utf-8?B?dzBwenhncDdiMG8zSzRCWmRXL3hnSVB6QzlNYXQ2K2VWanRoellJemQ3dDJH?=
 =?utf-8?B?NVdKb2lEdzlpakJPdmhsWC9BZmVaS1AyYnFBU2svSnNOYWRwSzVwbFQ3cFBl?=
 =?utf-8?B?cVJPY3U4Ykg1N1VEWWdLS3N6Q28xbkl4eUFBbGd4aEtkMmhQaTJQTy9va0Rs?=
 =?utf-8?B?aDJqU1dYSE16UUo4Z01hOGdLNVlIbHBjWXU5cDJ3SjVYL0ZhQmc5K2VWTzZ0?=
 =?utf-8?B?c2p4U0V5YXNFRkJHRDN0ZzdrWUJFbnBwbEZhTFAzSDJFcnZRYVVaYlJLWE5p?=
 =?utf-8?B?TUV1a2kwM0Ezci9uUXVsY2dFSDR3SWhSVEVXQkVIZ3JKVXJ5Q2tsU1QwZDY1?=
 =?utf-8?B?aDVMM2grdktneXRMZVZkdUExdDBFYXVjZmo0RURmUlNleVVtVVdiRE5kbWRP?=
 =?utf-8?B?N1RJWDV6cGpSeFBlSGZuRHc2OU9VZmpzV2E1bFJ0SUhsQjM1L1ZOa3BBQ0lM?=
 =?utf-8?B?cGF0dTZ1VEZiOHNuT0JsL2UvK2pqWnlKbFdxQjdqbUVERTNsUzdiOUo3eVJ5?=
 =?utf-8?B?a2lKRy9LRVBNVjFZT3hVZ3g1aWhFV2JhcUprWUhWNG5GaE5INzRRYlc1MTBv?=
 =?utf-8?B?eG1HZDBSTUNOWUprYm9WQjl1MnI5bTIrSkx4MDFzb0tQd2lWNXVtcHgzcVpG?=
 =?utf-8?B?bFcwZGJHdVk5ZVBUZ0xEaldjRFo2UlpjY0RrcU5lV2xtVGMxazRvQWg0Zi92?=
 =?utf-8?B?YnJrc0Q0QlJubTFOTndHU0FNYW9haU5yVjkwd1B3TUczQkFocTZ6ZFZjRG5j?=
 =?utf-8?B?b1FVOHRvVmp0WUsyZE5EblRBaGQyOGhKTjBwWHpGcEhXVWlsVWx0d3NIc1k4?=
 =?utf-8?B?ZWYrSHZXWlhIWUQzMjd6SEU2VHVXYmR4eXIxb3AwbENtVDZyOTFHRlM5d1JW?=
 =?utf-8?B?TWY0YUg5bzl0SDRNTXdRcEc3VExOVVdsMjJMb2xVQXE5RXVHa3I1TDJSL2VE?=
 =?utf-8?B?UlM4cTFCN3FGS2dyL2JubWFNVFN1dEFLNXM0TlVzNTU4YUltNTNzaEpNbTFE?=
 =?utf-8?B?OWF3RGR3ZlJOdjNEOGtmOUw3Vkhqb0JROTBFZUNmUlE1ZG1IYk5jOGtoRjRS?=
 =?utf-8?B?RTRRcUV2OEh1dTlFeUxYVm13Y3o2S0drRE9HeTBjbmJhRU1GbER0T3RYQWx5?=
 =?utf-8?Q?CuOmNHFeftyP55Fc=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 77713af5-d7cf-477e-d6c5-08de585f4cd0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 20:05:46.6933
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O+VFVVlbI1qq67hfBhJ52NHIDEO8InbfliCkeuaBTFbjmoag0t8xw1tqEJKeKxoz3DRbFqLscgw5Pybdh6YYNk+i7tAnbr22gdsYjvwH+Ec=
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
	TAGGED_FROM(0.00)[bounces-27156-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,tuxon.dev:email,renesas.com:email,glider.be:email]
X-Rspamd-Queue-Id: D4EC74BEC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgQ2xhdWRpdSwNCg0KVGhhbmtzIGZvciB5b3VyIHJldmlldy4NCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4
b24uZGV2Pg0KPiBTZW50OiBNb25kYXksIEphbnVhcnkgMTksIDIwMjYgMzowNSBQTQ0KPiBUbzog
Sm9obiBNYWRpZXUgPGpvaG4ubWFkaWV1LnhhQGJwLnJlbmVzYXMuY29tPjsgQ2xhdWRpdSBCZXpu
ZWENCj4gPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPjsgbHBpZXJhbGlzaUBrZXJu
ZWwub3JnOw0KPiBrd2lsY3p5bnNraUBrZXJuZWwub3JnOyBtYW5pQGtlcm5lbC5vcmc7IGdlZXJ0
K3JlbmVzYXNAZ2xpZGVyLmJlOw0KPiBrcnprK2R0QGtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6
IFtQQVRDSCAwMS8xNl0gUENJOiByemczcy1ob3N0OiBGaXggcmVzZXQgaGFuZGxpbmcgaW4gcHJv
YmUNCj4gZXJyb3IgcGF0aA0KPiANCj4gSGksIEpvaG4sDQo+IA0KPiBPbiAxLzE0LzI2IDE3OjMz
LCBKb2huIE1hZGlldSB3cm90ZToNCj4gPiBGaXggaW5jb3JyZWN0IHJlc2V0X2NvbnRyb2xfYnVs
a19kZWFzc2VydCgpIGNhbGwgaW4gdGhlIHByb2JlIGVycm9yDQo+ID4gcGF0aC4gV2hlbiB1bndp
bmRpbmcgZnJvbSBhIGZhaWxlZCBwY2lfaG9zdF9wcm9iZSgpLCB0aGUgY29uZmlndXJhdGlvbg0K
PiA+IHJlc2V0cyBzaG91bGQgYmUgYXNzZXJ0ZWQgdG8gcmVzdG9yZSB0aGUgaGFyZHdhcmUgdG8g
aXRzIGluaXRpYWwNCj4gPiBzdGF0ZSwgbm90IGRlYXNzZXJ0ZWQgYWdhaW4uDQo+ID4NCj4gPiBG
aXhlczogN2VmNTAyZmIzNWIyICgiUENJOiByemczcy1ob3N0OiBBZGQgUmVuZXNhcyBSWi9HM1Mg
U29DIGhvc3QNCj4gPiBkcml2ZXIiKQ0KPiANCj4gVGhlIHRpdGxlIG9mIHRoZSBjb21taXQgd2l0
aCBTSEExIDdlZjUwMmZiMzViMiBpcyAiUENJOiBBZGQgUmVuZXNhcyBSWi9HM1MNCj4gaG9zdCBj
b250cm9sbGVyIGRyaXZlciIuDQoNClRoaXMgcGF0Y2ggd2lsbCBiZSBkcm9wcGVkIGluIHYyIGFz
IHdlJ2xsIGdvIHdpdGggdGhlIHNpbmdsZQ0KUlovRzNFIGltcGxlbWVudGF0aW9uLg0KDQpSZWdh
cmRzLA0KSm9obg0KDQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEpvaG4gTWFkaWV1IDxqb2huLm1h
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

