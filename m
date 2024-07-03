Return-Path: <linux-renesas-soc+bounces-7026-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9579255FB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 10:56:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 385211C21A6E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 08:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5785C13B5A5;
	Wed,  3 Jul 2024 08:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="kVJMIdaL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010017.outbound.protection.outlook.com [52.101.228.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4185F133291;
	Wed,  3 Jul 2024 08:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719996975; cv=fail; b=ZVi8wxKHhm0wvTHGCX7DxWaOFOnpQQHUm3A2Ui0E3294VB++Vq6PfEEE8ThtkKR8NViBAzwLWkM1BKjD3UUwr57uMeL/jjf2HTzjdBvtxerBwJBq3CpjsjTlyivcXHnwPaMF6R6gWFmc4kokCJexQ05zVID/mS/cKmbDHJ89Q2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719996975; c=relaxed/simple;
	bh=98YJzqN36vf6tjizl//dLjfkctb46lxSQAt4jUUSsxQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hP/Lc5G4Q1iFoolKoC/KEQaIOCH8OZMrOV4l/C/8+pCRwyT9hNTP142rCAdrFgSvtT9vZIDMOwu3DxhGCrLB4ANl7WFwcEk3P71l0c6M2rZ52RSjqCcVSKK588CQfPuFFJsppc5TszJcdl6689D1+NpJhioz8G1YxQJQ93POXIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=kVJMIdaL; arc=fail smtp.client-ip=52.101.228.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a7jursWRqEaQflThpJkyLMnhenyx379dN9q1a4NcZwpmchBXeHftKUCmFYBZndHr0IlE8YT9xovqZIm26wEfZ5Q8pJieANnY2gTBiCr5dN8r0MDxnN5zPiWV8aF+hOQRKSyvIPNlskpTcqX0fqtGeLCc3Gws7khlDyrM8oCrzQ5jvoCC9LhLWdSqfwZp6IJS5gb6UcuSYuw82liByDtLbhfUQoz/tLeabrzdByk0pTOAHCzFGx2yKKTVwFaSr0ynyRWDBoD96I25ihbNncd2E7vaqs2/cPD5lDvtAamoJAun1RRR2b3bvWyGo/KnOkmtN8RGV3JrEiscsGexCuq9xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=98YJzqN36vf6tjizl//dLjfkctb46lxSQAt4jUUSsxQ=;
 b=X/TjGZup/J0S07HvT7IcFKt7vF8D1e3Zp6lSIaWAsn15yiFf7uHk33IxBnjlwHfRJ1m8ReNIK8f/JwwR495j+RSKJ7dyx9ZpffKpOpRnaYZH4d2+0E0XQr2b14VP9jIKmPT7LHp84g01qNnjMY5301kFW4oc2gfQFTtLaWqMzb38SoNBwAdnePhTOC18T7xlpc91x4DUOkbAfmiOz594AQNOGRJkKfdx8B55MCC6q3ZOQd1caj1Rf9b8Bx9RF/DRPujlA3GREEKFK2drBpPi/uuaUKHGTs0dOQhHPGxW9N5awu38oobFYfA7KGvn737q38Vo4ifMfmWLGVWMsz54QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98YJzqN36vf6tjizl//dLjfkctb46lxSQAt4jUUSsxQ=;
 b=kVJMIdaLQJOJPyyywLK5BkQK4n96i3rzdxVMsRhmQg0Cr++LPzD1fBsBgh4xJOvN9F6viFFm31Rc38ugQ1NF5iE/498ickG/aj3sTb1Vc55rJOFQrMpjNnnk3gFttwYhQJxpmAeRjj1xDkMcyYtobxMGg6J3KIQ7Zq1hFJ0DQMo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB6966.jpnprd01.prod.outlook.com (2603:1096:604:12d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Wed, 3 Jul
 2024 08:56:08 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7719.029; Wed, 3 Jul 2024
 08:56:07 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v5 4/4] arm64: dts: renesas: rz-smarc: Replace fixed
 regulator for USB VBUS
Thread-Topic: [PATCH v5 4/4] arm64: dts: renesas: rz-smarc: Replace fixed
 regulator for USB VBUS
Thread-Index: AQHazKnOIphyijOdAEmjF/680sSvm7HkrtYAgAADY/A=
Date: Wed, 3 Jul 2024 08:56:07 +0000
Message-ID:
 <TY3PR01MB11346C77668002325FD916DBD86DD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240702180032.207275-1-biju.das.jz@bp.renesas.com>
 <20240702180032.207275-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdUmvWPPBVqhtpu2dovwQg7YA7TVZBRnATUiY+1QRy0B1w@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUmvWPPBVqhtpu2dovwQg7YA7TVZBRnATUiY+1QRy0B1w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB6966:EE_
x-ms-office365-filtering-correlation-id: 2185fe80-a441-44b9-7f66-08dc9b3dfa6c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RzZDb0FHVnpjaWhpeHFMN0xaaG9Rd05ydEhFenZFNG1IRkloVGYxeVhxT2po?=
 =?utf-8?B?dnFDYisxNTYvMHU1VmZUYjBpb1ZibHVzdTNrYldEeFVmOW5kbzRHekNhVkMw?=
 =?utf-8?B?VHNTZEYzeGF5MVB0SFIrQ1ZNcDJJN0gzams2d0Erbm5aaVNMK2RIL0N6Umcz?=
 =?utf-8?B?ZjNlbWZRcXBQYlVLK1IxS1dkRFBGMjVwaUlSQlhxUFovODdRV1V3MjFpZE9r?=
 =?utf-8?B?N1JOWEtJU2ZSUDdid3h3ZXFMeTA3Y1dVc1BNamhna0pYdnlFcE1XelBST3Z6?=
 =?utf-8?B?Z05NcUVsRlVVRmIxQ1d2cGNyYWlzcXJpSEI5RDFzZVhPNnh3WlJKVzVrSFNG?=
 =?utf-8?B?ZmhOcUZGc3ZhT0RYRi9CdDFnenVDZWlQVEZJakZYVkhDeEZuWEtORXp0aTRt?=
 =?utf-8?B?LzZxc1k4TXZJZFFiSnRib29tMG0xRXFXWllyaW1lQ2l3elc2QTJXYndyU0Nh?=
 =?utf-8?B?MUtmOUNtUFJtekVodlBSK0M1a0hPQXdtUk5EN3FrV2dSNGRJdWI5RTFib2JI?=
 =?utf-8?B?eDFXbHVTUVB2dE9waVRHWERNSWx3M0tyRU1xdFIrQ2xveFFZTGMwaG9NcFc0?=
 =?utf-8?B?RlpmbXc1LzJnVHZQRU9ONkI2UFJrTkZUTEpIWDdFSHdyYmE4THBmeGdRemxl?=
 =?utf-8?B?TitBRE8xNDZwdTF5NnFPR2ZLYUVkVEFCcGg0MitteTZnMnVzaXFEcFNFRWZu?=
 =?utf-8?B?NnNhVzBYa3lOcmxOWjNhTU5keEk0TW9pNnRDaFNnVnJBU1ZOcEJseWVCcUNr?=
 =?utf-8?B?Ty9vK1F0dlh3dDRnMnE3U1dmS0NrK29DMlFlbEI1WFBGaWVLcUNrODlrdU5J?=
 =?utf-8?B?QTR0bEhXaklBeUVVK1E0dmlzU3JMaGRhenVoS0FHNEEvZmhpTm5seDZFbVRj?=
 =?utf-8?B?QzU5ZDJFcVc2MFhIaDByblRUbUtueXdyVlJ5SVhicG9XNER2WFA1S0F0OUVJ?=
 =?utf-8?B?VE1WK0d6WXh6eWI5cnZzdzFWeG5ENTVIWFBOWTZmMXR6VWZIRzdUaUhBbWtq?=
 =?utf-8?B?cE1BN1IwRUthdDJEbTY4aWF2bW41UENyLzNLemR1bnNzRFk5NlRrSXhvRk10?=
 =?utf-8?B?VnNJOExyT25KL3lPWWFPbld3dUxubUtrUGRiS0FxS1MxdlVwYkhUbUFHNjRH?=
 =?utf-8?B?OWh1YUNlNkg4LzJKTUl6R0hOUzMxR08vWTZydHZ5eldyMmtGcDA4eVpiL3gv?=
 =?utf-8?B?Kzh2ODkrYXQ3bkR3RkltZCs1Rk9URlRtdldPSHRFZEtKL0VFUUc5SmU5MVR1?=
 =?utf-8?B?TENxVkRqZ3FjZDhJWGtqTEo2bjBaUDZ4SHhFM2RYWVNMWFhuWlJtUjF4bUhI?=
 =?utf-8?B?U3E0dEg2S2xjT2lSakp1a2VsN2RDNFRjUEVHSVZMczRqVkFuYnM1Q1RodnV2?=
 =?utf-8?B?YWhkbnNLWFN6Zy9rdjNzSlFaTDg3U1NCQWpjSWN1Wms0WFlmdHdrem03NEVr?=
 =?utf-8?B?MjYyaFRkSmRUOS9FMDBlVU1KVDlhOTdkSUxlRzJDck1Jbm9pbFJLWm1ILzhS?=
 =?utf-8?B?QnNlTEVSa2tZdmRmM3lCQkV2S0xoL1E3MnlzU0Mvd3ZneXRsUlcxNE5naHky?=
 =?utf-8?B?eDZPQVc4Qk9OTlplVDl5WkpnU1dOQUNDZU0ydXNQRGdBSi9lQjhIeUtsNEM3?=
 =?utf-8?B?MXRlR1F6M1I4NUJ1TFc5ZytTRnhnVTdLQjd3eVJJaXhXbldOZTdYNzJVLzBy?=
 =?utf-8?B?R3NHZ1JTbzFxcEh1VUZOd2QraWNGemdTOU1lV0dzclFsR3o2ZzZiSjFNNk82?=
 =?utf-8?B?QXNqelhxUXN4Q1A1N0dMdG96VXE0ZDNTZERXQXY1Y1ZrYmdoU0pkUFNtb0tF?=
 =?utf-8?B?Z2ZIZDQ5L0huRDdTVTVJQlNJZitPSGwwbXNMUFRqRXVvY2ZzYjBXZGxCRXZh?=
 =?utf-8?B?czN0T2Vwb0t5U0JRT3p0WEljMm83ODRIQjB6cy9OZW5RRFE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TFVud0ZNS013ekFkU3R1Tkc2THBvOGJLZkNMSitBbjAvRzR0aUJVSStRTVFs?=
 =?utf-8?B?SUZ3NGQ4RDRwOTFXb3hnZDl0VzFFcjVYbXA3UkI5dHpGVC8wb3d5bUtBeW8r?=
 =?utf-8?B?eHE1ZTlCaUJRMzRBY2JXN3dZNWgrR1BGa3BJUmlGVDFlZmtDMFdyZEZOMGVi?=
 =?utf-8?B?ekN1SVp2RDNsamZVQWJSbXpySU9HUkV6Qm9ublRCdFZmaVlJZHZzeTluNlR0?=
 =?utf-8?B?cE53QzM4VHlYWHloQnpCZ3h5TUh3b21ZN3ZsUmcyYUNqTUpSVFE0RFE1QjY1?=
 =?utf-8?B?blJHS1padlg4eU5DNS9iN3hpaUo0aVNORUVKUTBMWFhyVUNsa2ZZTk9QVkxS?=
 =?utf-8?B?eWV3blNLYmE3VThaVWlCeHd4NWo1djE0K1cvaHA3c3N6YTRPS1pvV2NocCtP?=
 =?utf-8?B?VUEvSTc5eXdDcHUycGZyV0dkdDVzVlRqdmJkTUNFS1E3eVM1dGRwaWhxTGpw?=
 =?utf-8?B?eW55WGlVT2RkM0dYU09tZEJydzc5eDRqdmt6T2VtMlVFcGZEcU8wT1ExZC8y?=
 =?utf-8?B?MGN4dlcvcVlMdzVJQVNmRG1RZEFZdnVPTlJWNkFnWFJveEI0U1laZjNZa2dH?=
 =?utf-8?B?bEdBNFFwMFJIdHh2eGpwbzd1aVM2RXpwU1NGb2RncWNGempVVWYvOEN2YkZ2?=
 =?utf-8?B?VmFsTkoxbFJQRXdqL2FsMUpiR1N1dGhrK3FPNUQrUHkrVGcvK1lGMGJxeFND?=
 =?utf-8?B?d0UvYVQzZFc5NGRvNUsrd1dRaklHTVpoRTBNVkhEaHVYQjRLai8wcnVrNENN?=
 =?utf-8?B?QW5taFFvOEpDWk5Vclo1dktRUVR1ZHBqM2NHQ0JiVHdwQnNUUFNjT01oempX?=
 =?utf-8?B?RExLdWdBZU42a2t3aklaZnJoT0FWNjFWQUo2cDVyTFZqV2V3dUwrOUIzQ3JX?=
 =?utf-8?B?WmtFRGh3VE9rWHE0M0lRcHZQRkVoZ216eFFaSmEvVEVpUDB5V2F6ZTlXQ1N3?=
 =?utf-8?B?S29xOEg0SVB2ZStyYjBsd0g1R0R2WlZJUnRsU1hCRjlhcXhkc2Q0ZjdoYTcr?=
 =?utf-8?B?b1QvdzNCWmtadElFNW1Ca1Z1NjkzT1p0WUM2aG03bTlKM3ZPQTI5WXoxSCtm?=
 =?utf-8?B?eUlSNUlDeGwxQVRPS0M0Tk16UzZoUGMzaG8vYVIxcVpLQXN0aXRzRk9qdFMx?=
 =?utf-8?B?eklMWUluUU9YWUc1MTBST2MvRHBOVS9UY0xGM3Z2RzM5NnUyZkRnK0duTnZN?=
 =?utf-8?B?RlhYNEZ2c2hoYjVzSlZ5bitVc01VamVoUGovMUYvanlBdlQvczlsSDYydjFZ?=
 =?utf-8?B?MFdoYUdkMU1ESk9jOUdUQWs1ZVVsUklBVWkzNjM4NHFwUmFpSU00SkRWcmpo?=
 =?utf-8?B?dGVrRzhQM2dyeDBRWVNkYW4xQUhzYTlXbWQwbnlvRTZoQm10SmZyaCt3Vm1P?=
 =?utf-8?B?YTMyajFGcURSalVHQUQ1cjBJRGRuUSs1TXBiL2tjSVM1TU4vZjU4MkI4MWVk?=
 =?utf-8?B?SkFUb0VBYklGbkxaZ3BFQlJqWDJsQUdWdlVpM2ZIZkZJdGZPWkVGcUJxaWNy?=
 =?utf-8?B?UExzRDA1cjlIcTkrMk5pakdwSlRPKy9Hcjl5UjhnbjNUREZkNDFLZmpxb0dL?=
 =?utf-8?B?Ukd1L1psaUlKTndhLzY0UGIzSk9wbE9NZThrSlJIaEdHTUJuSmVkTk96dWcv?=
 =?utf-8?B?M0ZJNDVIYUhzbjl6clBwRXlaZzJCcUI4U080Umd0b2JnaWdjZGI5OXlua3dW?=
 =?utf-8?B?MnhUQnFlaVZITlIvVEpFbmU3TkdsZGVmWlVUbW1wZi9SOHNOSUxpeXcwYzl0?=
 =?utf-8?B?dzRuQmU3d2NWaVQ2ak1mTGVGQ2QyckttanFRRjZRNW9LRXphUk1ySk5LNHJN?=
 =?utf-8?B?YW0wenljN3ROUnJpcjNzQzI1YnRuT2g5T2NlU1doRGdSb1Z5L0RMQWQ0MUM2?=
 =?utf-8?B?Vm9YM3JWTmxKSzltWE54RTRQQjJoZGhKZ2h5QysvTXorSnVDWDBFTmVzWFFH?=
 =?utf-8?B?eGF5MXFkWkI0bXZIcklmbjNNUTJYVWpBdURwV3llNmdlbTY0Y0ppa1BDaVUv?=
 =?utf-8?B?ZFVPQTlxblYzRTRKU3NqMG1VWGJTcThoRU42cUhKMmpLdVZ5MjRaVUFtQUxq?=
 =?utf-8?B?ZWxJSk9JSWVGYlcvSTFSU3VoZ2xVZDZnNUQ5Q3VxTDM4SmJ1eVdVQU1Bbm1X?=
 =?utf-8?Q?xML0SsL2H9Y3xKwUjmCYpBM1H?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2185fe80-a441-44b9-7f66-08dc9b3dfa6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2024 08:56:07.6305
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t7T/WwMS2uAuuHsWEkYmJUKAMALmixscPDUEx3BW30ouLy3GiqHr0L0lRJ9/e6hhhBvto2fTjRS4lJWkqBw5yuQmD1P9C2cf/QBujg71ix4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6966

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVseSAzLCAyMDI0IDk6MzYgQU0NCj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2NSA0LzRdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHJ6LXNtYXJjOiBSZXBs
YWNlIGZpeGVkIHJlZ3VsYXRvciBmb3IgVVNCIFZCVVMNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBP
biBUdWUsIEp1bCAyLCAyMDI0IGF0IDg6MDHigK9QTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAu
cmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IFJlcGxhY2UgdGhlIGZpeGVkIHJlZ3VsYXRvciBmb3Ig
VVNCIFZCVVMgYW5kIHVzZSB0aGUgcHJvcGVyIG9uZSB0aGF0DQo+ID4gY29udHJvbHMgcmVndWxh
dG9yIGJhc2VkIG9uIFZCVVMgZGV0ZWN0aW9uLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlq
dSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+IHY0LT52NToN
Cj4gPiAgKiBVcGRhdGVkIGNvbW1pdCBkZXNjcmlwdGlvbi4NCj4gDQo+IFRoYW5rcyBmb3IgdGhl
IHVwZGF0ZSENCj4gDQo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6LXNt
YXJjLWNvbW1vbi5kdHNpDQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6
LXNtYXJjLWNvbW1vbi5kdHNpDQo+ID4gQEAgLTU0LDE0ICs1NCw2IEBAIGNvZGVjX2RhaTogc2lt
cGxlLWF1ZGlvLWNhcmQsY29kZWMgew0KPiA+ICAgICAgICAgICAgICAgICB9Ow0KPiA+ICAgICAg
ICAgfTsNCj4gPg0KPiA+IC0gICAgICAgdXNiMF92YnVzX290ZzogcmVndWxhdG9yLXVzYjAtdmJ1
cy1vdGcgew0KPiA+IC0gICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInJlZ3VsYXRvci1maXhl
ZCI7DQo+ID4gLQ0KPiA+IC0gICAgICAgICAgICAgICByZWd1bGF0b3ItbmFtZSA9ICJVU0IwX1ZC
VVNfT1RHIjsNCj4gPiAtICAgICAgICAgICAgICAgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8
NTAwMDAwMD47DQo+ID4gLSAgICAgICAgICAgICAgIHJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0g
PDUwMDAwMDA+Ow0KPiA+IC0gICAgICAgfTsNCj4gPiAtDQo+ID4gICAgICAgICB2Y2NxX3NkaGkx
OiByZWd1bGF0b3ItdmNjcS1zZGhpMSB7DQo+ID4gICAgICAgICAgICAgICAgIGNvbXBhdGlibGUg
PSAicmVndWxhdG9yLWdwaW8iOw0KPiA+ICAgICAgICAgICAgICAgICByZWd1bGF0b3ItbmFtZSA9
ICJTREhJMSBWY2NRIjsgQEAgLTEzOSw2ICsxMzEsOSBAQA0KPiA+ICZvaGNpMSB7DQo+ID4NCj4g
PiAgJnBoeXJzdCB7DQo+ID4gICAgICAgICBzdGF0dXMgPSAib2theSI7DQo+ID4gKyAgICAgICB1
c2IwX3ZidXNfb3RnOiByZWd1bGF0b3ItdmJ1cyB7DQo+IA0KPiBUaGUgbGFiZWwgaXMgbm90IHJl
YWxseSBuZWVkZWQsIGlzIGl0Pw0KDQpUaGUgbGFiZWwgaXMgdXNlZCBpbiB1c2IyX3BoeTAgbm9k
ZS4NCg0KdmJ1cy1zdXBwbHkgPSA8JnVzYjBfdmJ1c19vdGc+Ow0KDQo+IA0KPiA+ICsgICAgICAg
ICAgICAgICByZWd1bGF0b3ItbmFtZSA9ICJ2YnVzIjsNCj4gPiArICAgICAgIH07DQo+IA0KPiBB
bHNvLCBhcyB0aGUgcmVndWxhdG9yLXZidXMgc3Vibm9kZSBpcyByZXF1aXJlZCwgcGVyaGFwcyBp
dCBzaG91bGQgYmUgbW92ZWQgdG8gdGhlIFNvQy0NCj4gc3BlY2lmaWMgLmR0c2k/IE9yIGRvIHlv
dSBrZWVwIGl0IGhlcmUgZm9yIGJvYXJkLXNwZWNpZmljIGNvbnRyb2wgb2YgdGhlIHJlZ3VsYXRv
ciBuYW1lLCBpLmUuIHRvDQo+IGF2b2lkIGNvbmZsaWN0cz8NCg0KWWVzLCBqdXN0IHRvIGF2b2lk
IGNvbmZsaWN0cy4gTGF0ZXIgSSBjYW4gbW92ZSB0byBpbmRpdmlkdWFsIFNvQyBzcGVjaWZpYyBk
dHNpJ3MNCg0KPiANCj4gPiAgfTsNCj4gPg0KPiA+ICAmc2NpZjAgew0KPiANCj4gQW55d2F5LCB0
aGlzIGFkaGVyZXMgdG8gdGhlIERUIGJpbmRpbmdzLCBzbw0KPiBSZXZpZXdlZC1ieTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gQWNrZWQtYnk6IEdlZXJ0
IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQoNClRoYW5rcywNCkJpanUN
Cg==

