Return-Path: <linux-renesas-soc+bounces-25328-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A06C926D3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 16:12:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 051CD34CFBC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 15:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A9E732E681;
	Fri, 28 Nov 2025 15:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="FmDnBzPr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010009.outbound.protection.outlook.com [52.101.228.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A7D309DC5;
	Fri, 28 Nov 2025 15:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764342739; cv=fail; b=MLiVty7QWl8GH0TcJVPqFhOq2qGhLMgDI1oqsJYykroCZUGF7aNSN+ZsqliFZC4eQ2rUPMKY3RFP/p+5wYyt7z6utfhTausdNBUJt0ReBIiTksdVrjyDEUm17W/Et3Y/gaGqYGppS811bvgQ5MuvEek19XVNAVIcXkz88fISon4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764342739; c=relaxed/simple;
	bh=1o3XahID8qt5OPDJPY26n2P4qOTiwBQcABz2K5aiEwk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MBV5k5dPuzqV3Us1Pym6he29Zhk0AeABDvoubKiXvokqVqTGpJCZXSS2Nj09vCCvuy7xdQaTCw9T0uOoBfl77fI7y053Ge59HxUSEIHNb1nNwJEtZ7fP081v8x8uJJsnTUMrkOMnm6PMr8IaWfK1Y8KxgWg+dFEMckAZtKtGWaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=FmDnBzPr; arc=fail smtp.client-ip=52.101.228.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iKrFHDdRN9GHZ9uU8goNeTrg8vKanreUcCjO92zm/LWA46ax0DNRq+yWaSwClv8INLPw2RrH5kclIX8razMQ5Rw6huRWYL2B4sMiFGPguO50OWdLdQzPMCS6Qc8qHsSJX/IE0/fZ0l/Liv/u9xSRCbfE9iEG3o2QJZmS/lKdjgtaOj/+UE3JAjo6JV89u+2rDsaRqvn9owm9Lav2UDeGwg+/ndavTpBZlm6ynh/RXoqWcaZQOOZPr9h1VciJHPzCLykUKooQ0+Vdii+zY83QmouAryIWyH54ChEZQsT7QER42CytecYI3C79u+3gCSeX+7xyv9Q/PFgQE0SGyXhg3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1o3XahID8qt5OPDJPY26n2P4qOTiwBQcABz2K5aiEwk=;
 b=Yjz5wg/yjK+1mZM6CxOxmisUnXbUjnDjxkC5y+klThVPAAog6/rl4/LYYenEPq2FoLIFBd4yit5gtp3IyHLEe15iNyCMZ8GbRQiN62luScqozIe80yqo2QorBDj7M5nqVSOjqUpHzOzn3bgSTQeFgX2VoNonNdQE2k/U0DQbPHRGKU2IwxtgSV8Jq/hzLcvg3FRz77OuwguIaXCmm17L/FgyWsNYla45QJdHs1Tpdq42v1yclQ70Tr/CEQQRKKXMydps1sUSmibixBVjsTAslHLMpu7orXN/UsZGETlGj/f2/fUZbbaIvS3lFV/9I6B8qHWtrPKPyvhYc3g2Rs59ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1o3XahID8qt5OPDJPY26n2P4qOTiwBQcABz2K5aiEwk=;
 b=FmDnBzPr1Q5QNpgnyil7voq2hspvTxz+WCR3vamDv6bknjS/THqtUBesnfvDUjdpzpJdRbUOOHhxcFtBbwpCGw+vsEX+nDhuwU5kHNO7+RFT5Yw+ac62UojkDULadPowLEAG1xxfVbVnnfL/a4gFT8gj6etcWwelTdzuJ0T1sBY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB7098.jpnprd01.prod.outlook.com (2603:1096:604:13f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.6; Fri, 28 Nov
 2025 15:12:14 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9388.003; Fri, 28 Nov 2025
 15:12:14 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: magnus.damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 17/19] arm64: dts: renesas: r9a09g047: Add RSCI nodes
Thread-Topic: [PATCH 17/19] arm64: dts: renesas: r9a09g047: Add RSCI nodes
Thread-Index: AQHcR1kC2q/8YmJpokuR1shvnaL9qbUIQHEAgAAjTvA=
Date: Fri, 28 Nov 2025 15:12:14 +0000
Message-ID:
 <TY3PR01MB1134698D8E9CF61DB44D2B0E786DCA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>
 <20251027154615.115759-18-biju.das.jz@bp.renesas.com>
 <CAMuHMdV3GP6o=3tRZOQ5gmh7ty80KO15yjymDUzzwB75dv9K3g@mail.gmail.com>
In-Reply-To:
 <CAMuHMdV3GP6o=3tRZOQ5gmh7ty80KO15yjymDUzzwB75dv9K3g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB7098:EE_
x-ms-office365-filtering-correlation-id: f492971c-466b-438c-ddc9-08de2e908326
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?SnF6TXVpQlR0dm1nODg5K1FoM1FrZjdPNnR6ZWtDeHZVcHZwTXJSSFc3Z1Qv?=
 =?utf-8?B?NzFZRHRpajBkalhCemkxWE9ESHhFMW1scUZES1FGTS84ZmhVVENKU1NOdUZX?=
 =?utf-8?B?ZFlpUEc5N1BkNlpmWEhwSjdETUdZMDQyZlZwYzNRa3NWZGtMM0pmUEN4d3hr?=
 =?utf-8?B?dmdQVUlmWElwbWJnb2FrbXJCdDFoSGdIM2NHdDRpbW1HUU82cVVzSlZra1pt?=
 =?utf-8?B?ZDk3ZXI5T2t2RTZlM1JiS0MvbThrVjVheVlWL1I2aGRzVFpVdzdVdlppU2lM?=
 =?utf-8?B?cHpERENXVTFHVTRIMzBFRExyZmRscEFjZ0hrbkU1QmlMMGhxbks2K1FvRFJ4?=
 =?utf-8?B?dFRvWUxQUFRUTlJMVEtlSHA5dmI2NmFWYmpMOURxL1pZL1FxTkttWEczS01F?=
 =?utf-8?B?cElHZHFOM055ck9qV0ovb05zRmR6Y3NlblNFWDJCUkx1NGphUUpvQmI2Zkxx?=
 =?utf-8?B?ZHcvVndtMW96RGhUNW9CRExOUmFRWW9jV1RRTW5nY2lvalUxeTZLWDlQTDVN?=
 =?utf-8?B?SlpUZDkyTU5NY1lwbGV3TWR1bWUvMjl2b1dtcENMWkNFbW5zK2R2WHgvL1ps?=
 =?utf-8?B?cVhwMzQ2azhYSmp6R1RYMGxoVWlhWjAvUGpKZlNxMHpkOHRHcmZkNWpadFl5?=
 =?utf-8?B?U1h2azVrOUxTaURZdFRyNlZzcnkzN0dPUjcxVVd0QmhHOXdIamdpOHc5LzhS?=
 =?utf-8?B?dmV4emtIeWNFdjdXTTl6TnoybWppWThmbUlob1pVS0d4Nk1Oc0hhbmhLTkRZ?=
 =?utf-8?B?cTk0bTdETStrU3lkZXNOWnJBWkdFT1l2RDFKdXRLMElxaGdEMEVXaXlYdDhD?=
 =?utf-8?B?dm53MElWYUJKTkFIV0RnSFlMaUpZaFl0SWhJYXhXUTlwU3V5SEtFMW5BNnhx?=
 =?utf-8?B?RFV5UXNmVDhlajE4Nys0amYyVEc1UHpXcUFFdHhyNTN4Q2NYaFAwem1GK016?=
 =?utf-8?B?Q3A2SGNlc0lZTHI3VTBkRktISVU0Yi9RMHBmQW9LcTVSd2NiaWVXcHhXM3Vy?=
 =?utf-8?B?TFRFdHArdWE2NGhIZ3hVVW9Yc0hYZVU1Y2EzdVVmdVd4RkRZMnVKZ28wV3Fi?=
 =?utf-8?B?WDJIbFVhTGhKTDJ2S1drYzlpdTdTNWErcUU5aTlwTEJrOWtYQzZoWldGV1N0?=
 =?utf-8?B?NTZwQTR0YStjTFBKcG0wODNsT0xVTU5hOFd6ZVpVUjd4ZWQzTHpTdDV2bUcr?=
 =?utf-8?B?MUF2bGVHSVpvbk5JQUR2dGhUR1ZMakZsaTlxNG50ajZjNEZGaGtjRUVBTWlm?=
 =?utf-8?B?Z2hJL3BqaFdNVm9NT3NwZExyaWxtT01qQ081R1FMM28vVSt4YWN3NGdnNXRl?=
 =?utf-8?B?YllqZWc3N20weGZFOUN0ZEVnM2x6bExxNzdNaDZ4Q0t6eHZqQndCdFZuS2wv?=
 =?utf-8?B?VldRbC9raTduSXlDZXFIZFNmdzRPS2JtQXlVRDZuVmdiU3RLVk9GMlVrM2pS?=
 =?utf-8?B?VXZpOWpVZngybXZYaXVibGVNMFpZRUJBRHl2d3NSd203aVRmWFU5c2tSYUpV?=
 =?utf-8?B?ZDdnT0tJaXBDanRMZXd5VEtxeXE3cUxZVmVjK2I1cUlXRHQ1bXE4cjFseG9R?=
 =?utf-8?B?ekZNM1AwQW10ZWx0VCtmN0dTS3p2eWNSQVJVVDhIVWROeTU3UEx3OE9xL08w?=
 =?utf-8?B?MmUwR2Z0RW81a0tUdjNOTlgreklLK0ltWmgyRnd0UTZmU2lXM3VERGU1WlVu?=
 =?utf-8?B?L0ZPNzdqMFVGZjhPVm9RVFNxUjh1OUozalpJSHo4OGtXMnc1QkhrRStIaDBT?=
 =?utf-8?B?Uy9IUStuQWFZMGg2V3ZaNVBRSWh5RHU5NTFKSXdJcFpvUTJkdkxRL0NkUzl6?=
 =?utf-8?B?VjNQSFJDRnNNazFtdmlaT0hoQkhNQ3E2WGgybEhGa1ZicTYzbmR0bGVPenFZ?=
 =?utf-8?B?eVlWNVg5Nk0vR1FUSWtSMzhJY1JzV0IxbU9TOFJsMERGVFhDT2NZRTd2Z1Vl?=
 =?utf-8?B?dGJuMzNSWUFIemxjd1A5c3JtWGlvRHNCL0d6ZjhCRlVJYjBWZWJ5dlZNdU52?=
 =?utf-8?B?QXhtajdXbi92eUJYbmZrdyt6WTRoQnNzYkQwV0Vyek9QT1hHWmlVNUo0TVAy?=
 =?utf-8?Q?NToEEc?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Mk9saFZ6QTJnWWJic1JwWHBEY0lzQ2hYOTVZeCs5VHhNQTJWOE95Ny9nK3Qy?=
 =?utf-8?B?Y1lSaWFSay9MSnVzcEFkcEdZQ2VxaGRGVEY0TThSMVYzUjJFRkJNMmc3aURP?=
 =?utf-8?B?NStNR3lBUEhyYWxTSndhM0JYNFM3ekUvcUdlVWFvYkR1M3BraWJlb00rZWJB?=
 =?utf-8?B?czcyYWFvQ3NoSkdHVGp2MWVCQ0o3Z2c5bFBib2JvYmNPOVZMUWJiaTRIOTZm?=
 =?utf-8?B?S2hOQWp6RVB0YWR6MHh2b3I1amI0dEdldkloeTJzc1pQZXBNeTZXVTBPNXlv?=
 =?utf-8?B?dlVHS2M2VUVLYVRGakdjNTM4T3Y5Q212ajRmSU02c2lxNk1jUG5Qb2xLYlJx?=
 =?utf-8?B?ZzVFOG1nRmFtZ1JNdXZtTmxaT2VURDdzeW1temZVZWVwNkh5ZWlQSkhxZHhm?=
 =?utf-8?B?L1BzWEQyUzBIRGtVL0FrUjN5VWNKNVd5RTRqbXF3SlYzL1FYZitxZE82Z3hO?=
 =?utf-8?B?WVJMWHlpRFU3VW1aOUtaQ2R6Q2VwWTRQcGZTUWVUN3FlWDNzTytlZXpqOHdn?=
 =?utf-8?B?SUdZNUUxeThOUm9GWk0wRDBVMHFxd3lyMU5ObUFWWnNBRUxOY29NYmRtQ0x2?=
 =?utf-8?B?L2lQL2tRM3pKMDBpZDhNRy9OUm90Mlo0K0lWUC9EU3VoRVBORXUxdlNTUHRO?=
 =?utf-8?B?bjBtaUwvWkFjblZwZGtrMUt3NFdtTVBpS2ZyQjlOYjNodWo1dkdrdEtQa09I?=
 =?utf-8?B?TzI4VjJlaFZkYkRtQ2ZCWEpHbUVlSWdEd3Vub3NMUWN6eVkvaDdSYkNwQ284?=
 =?utf-8?B?cU1CdGxVckJqeFpFcWxQZVNVWGZRMXY4K1VDT2xJWVppS2tSbW96UzF4Rjkw?=
 =?utf-8?B?aUM1Rk1qbHBzbWVYaExVUkRkWTNuUUNXVWtoUDZZUzFBbmQrYmlPS0NsNkRl?=
 =?utf-8?B?NUhnY3IyQ0xDeUlGZTZYWHpLcCtSdGZqRW5wcytmdUY5UmM1R1p6Q2xvdXpj?=
 =?utf-8?B?UkJ3aU54b0hRNGpnSkdaR3dndmU2bVU5c2wzZ1YyMHZYQ1JxR3pOMmdaVFJW?=
 =?utf-8?B?SHVtVE9IdlYzR3VrVHgwZlBMWVBuRW84K2hwT1pCRW9scHo1clhTV1Y5a1k0?=
 =?utf-8?B?OWhPUE5SN3FZTnNGNW9KNStTbDJSTXNlZFdkTU5wWm5JU0pPb3B3cGlnVFlQ?=
 =?utf-8?B?MjhBSTE4a05TcmJRVWZ5aUxlUkpZMG0yMEVWMkN0ZEZ1Z1FDdzBQc0xYR2Fz?=
 =?utf-8?B?Qks4cHZNTFlqOVh6dDlHOEx3VVhXY2d2Wi9RbndOQW41aklxSEUyY2wrcFFk?=
 =?utf-8?B?SEc2UlVoNXBjTnVGR0U0bkRHRFNFa1hlTWFSRlN5cTZVT2p5bWxsQXo0UFJD?=
 =?utf-8?B?Rkxob0NpUm9LRzRDdGovR2wxeXA5ZmtiQWoweXh0OGVZMVZFeDFVR1piWjZk?=
 =?utf-8?B?ZFFXUGhCSS9Vb3dURGp4OXdGYzZDaVY2VEdpaFhkQVlkcUttU2JRMURyTkxx?=
 =?utf-8?B?UUx2RURjSitWVEUzNmJMOHlzUndudW5YZEM1VHdZclZvenFTZFlOVjUvbFVP?=
 =?utf-8?B?YndncEt0MmRxV1QrTERvd0kwNG5iWlRSMW5pTjlyTEV5Sm1La0lzLzhkeFRZ?=
 =?utf-8?B?cVpWQVp0Ry9HSk5jZjhtUDJ5d3VxK0sySXloQm90c1dDZGNVUDZZUXA3UHdK?=
 =?utf-8?B?QjA1TnowaXA1LzBvNzJMQnRDQjlOenZiUGNvU2t4QjdBM2x2cHlacEhSNmp4?=
 =?utf-8?B?a2EzZi9ncElpYTBVd3pQTGF6RXc1Nk1ZZXZDaGROa3VtWkRGNXFXT0RFU2tw?=
 =?utf-8?B?ZlpWb3BKbVZkcUY0bEVBNWFCdktyRU1vUTc2M3BPOFJ0eGRvc0dKcjA3eG1n?=
 =?utf-8?B?RVRYcWtJSFpGSCtjYVZTTjhmV3I1T2Q5NWhVUjBtLzJOdGhXMWoreGdKRy9n?=
 =?utf-8?B?SVdzZmdPVXJQSWtZZjAvOEkrdUpOdlFWN1NWdjdaQk1JdU1XYnZoRUhENWpk?=
 =?utf-8?B?b2VQVDd5NHJqdCtNVWFnSkJXZkMzcmtNM1BHK1JmWnpHaDlaajFKT25rUDJV?=
 =?utf-8?B?QjNZMDRPYTlIY0FERVl5cU5qbjFVZStyWTMzMVhEVytsNzlWWkZ1aWU5aklD?=
 =?utf-8?B?M1NTeGQrRmVjQTRYR3NVei9FRDNTcWs2NndJM2EzZ3RVSERFNldoZ3cwR3Fj?=
 =?utf-8?B?VHgwMjVRVzRvVHRZRSttSU9uWVpFcGIrLzczZW9kU3hqdndtMGU1MXZDdjJL?=
 =?utf-8?B?Tmc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f492971c-466b-438c-ddc9-08de2e908326
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2025 15:12:14.3587
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 21bTgOkMTiG/fDy8q77IgpKngtc5xQhcJZVFTK8l9DvH/PigNH58Y1hINFZ+maENPhPPAE29PfDNdsuPZpebEGnaYwzYXiBHtx2iB9LzP0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7098

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDI4IE5vdmVtYmVyIDIwMjUgMTM6MDUNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCAxNy8xOV0gYXJtNjQ6IGR0czogcmVuZXNhczogcjlhMDlnMDQ3OiBBZGQgUlNDSSBub2Rl
cw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIE1vbiwgMjcgT2N0IDIwMjUgYXQgMTY6NDcsIEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gQWRkIFJTQ0kg
bm9kZXMgdG8gUlovRzNFICgiUjlBMDlHMDQ3IikgU29DIERUU0kuDQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFu
a3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVu
ZXNhcy9yOWEwOWcwNDcuZHRzaQ0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNh
cy9yOWEwOWcwNDcuZHRzaQ0KPiA+IEBAIC04MjMsNiArODIzLDE5NiBAQCBpMmM4OiBpMmNAMTFj
MDEwMDAgew0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7
DQo+ID4gICAgICAgICAgICAgICAgIH07DQo+ID4NCj4gPiArICAgICAgICAgICAgICAgcnNjaTA6
IHNlcmlhbEAxMjgwMGMwMCB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJs
ZSA9ICJyZW5lc2FzLHI5YTA5ZzA0Ny1yc2NpZiI7DQo+IA0KPiAicmVuZXNhcyxyOWEwOWcwNDct
cnNjaSIsIGFzIHBlciB0aGUgdXBkYXRlZCBEVCBiaW5kaW5ncy4NCg0KT0suDQoNCj4gDQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDAgMHgxMjgwMGMwMCAwIDB4NDAwPjsNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTE0IElSUV9U
WVBFX0xFVkVMX0hJR0g+LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICA8R0lDX1NQSSAxMTUgSVJRX1RZUEVfRURHRV9SSVNJTkc+LA0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICA8R0lDX1NQSSAxMTYgSVJRX1RZUEVfRURHRV9SSVNJTkc+
LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8R0lDX1NQSSAxMTcg
SVJRX1RZUEVfTEVWRUxfSElHSD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJy
dXB0LW5hbWVzID0gImVyaSIsICJyeGkiLCAidHhpIiwgInRlaSI7DQo+IA0KPiBNaXNzaW5nICJh
ZWQiIGFuZCAiYmZkIiBpbnRlcnJ1cHRzLCBhcyBwZXIgdG8tYmUtdXBkYXRlZCBEVCBiaW5kaW5n
cy4NCg0KT0suDQoNCj4gDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZj
cGcgQ1BHX01PRCA5Mz4sIDwmY3BnIENQR19NT0QgOTQ+LA0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDwmY3BnIENQR19NT0QgOTU+LCA8JmNwZyBDUEdfTU9EIDk2PiwNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JmNwZyBDUEdfTU9EIDk3PjsNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJidXMiLCAidGNsayIsICJ0
Y2xrX2RpdjY0IiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJ0
Y2xrX2RpdjE2IiwgInRjbGtfZGl2NCI7DQo+IA0KPiBUaGlyZCBhbmQgZmlmdGggY2xvY2sgYW5k
IGNsb2NrIG5hbWUgc2hvdWxkIGJlIGV4Y2hhbmdlZCwgYXMgcGVyIHRoZSB1cGRhdGVkIERUIGJp
bmRpbmdzLg0KDQpPSy4NCj4gDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcG93ZXItZG9t
YWlucyA9IDwmY3BnPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXNldHMgPSA8JmNw
ZyAxMjk+LCA8JmNwZyAxMzA+Ow0KPiANCj4gUGxlYXNlIHVzZSBoZXhhZGVjaW1hbCBudW1iZXJz
IGZvciBtb2R1bGUgY2xvY2tzIGFuZCByZXNldHMsIGZvciBlYXNpZXIgbWF0Y2hpbmcgd2l0aCB0
aGUNCj4gZG9jdW1lbnRhdGlvbi4NCg0KQWdyZWVkLCBXaWxsIGZpeCB0aGlzIGluIG5leHQgdmVy
c2lvbi4NCg0KQ2hlZXJzLA0KQmlqdQ0K

