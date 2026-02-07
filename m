Return-Path: <linux-renesas-soc+bounces-28028-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id XC/iNuYfh2k0UAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28028-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 07 Feb 2026 12:20:06 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AADF105BDF
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 07 Feb 2026 12:20:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E8A0C3013898
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Feb 2026 11:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0576333E35B;
	Sat,  7 Feb 2026 11:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="cJwhezwW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010003.outbound.protection.outlook.com [52.101.228.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271EF1A239A;
	Sat,  7 Feb 2026 11:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770463201; cv=fail; b=M4lFN45yFqA/OMleYCp3XubXDzaayDXxaluprvYN0FFW0EYleCOrmrE9zWG7F4YJBRvrLGisG1qhGeyc4lRDcuN+uMb73scgHhMK7M5j4oXjq6sS9VVZs0LZEl0HpwGHlvI8kiRiHZkM/z+yGBP2VNcLYYB89E1ZgnwwqqszjKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770463201; c=relaxed/simple;
	bh=VaOm5XML6wdSthc08s/qL0wNYfTbBBP5uSaC994fBQo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ETlpaIx3aN/uKANmnrryXzS5vKHeA8MZd/HH4jajdnBb2pIvt4l11bS8qSU3ZFh5fbEkbH0oQ6dxAnogPp+WgM9uAExj/kl140VTbD+O6gcyPDLOwneLXG5mmzvcne0TWunuw3/8m2IDUlOs5BDFRc61OdKx74qdU/b6lJMmHfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=cJwhezwW; arc=fail smtp.client-ip=52.101.228.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IH0FRQJKyC0/yDxXRFy0Uz+yJ7wY5wq7loirElWn5n2ujINbrRXPVT8wEpjdRR0OaXJ98+YQ7xYbP6K5vTaLAf4lgq5b3OV4gwvkR6tf0PFsLcXfpraUPqUlthauHPJbrP5Jf+ziQh2BsoCr4fic7LrurK60bqyLLwM2Lhlc30SKQKdqAUomOe101I3nIs3FPw+/D0j71qtV4ITbJGDc4eogYAq/QOJ7/6YxGEzs1Y2fgFPwGapD5RknIETcSYJ7jNd12IrCOzZ/OjqpsRBs2iuBtw4Shm0JD7FTbypHmoe9SyjQSEtINOFGPF0VOCX+bw2TaSTRmrG3UBTL4NPnOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VaOm5XML6wdSthc08s/qL0wNYfTbBBP5uSaC994fBQo=;
 b=p5z+w7d+iQMPistvYOK/goYuN2ZREvosA8YJJ4QkhIxGQ5oQ8LULCy0s231NdcykIgZAJ9F4LvWMPgxNDtK2V/i0LmxqUcMGoFJMxPqEFMH76fz1EDBCxOsIUmykqLfrSp3OPnkiPLIbe98eCtdMama/EcTA8oTy3El7/mqtZb36ZlApVbkKKjgp1cW1xehB4OIsmz+U8fxQzCgWwRHo0/GdEl7YAvXHzcogV/Z2Rt/2jxQrT+52OLxbSFfGXf6by1bwtrm4OCI3VB2l3Rx3teD3tfwkN4zWRm5TtNrE6/CwZBvKDEVECwBdFZfmRrV/FpJVvH9omcypBBP7j/yphA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VaOm5XML6wdSthc08s/qL0wNYfTbBBP5uSaC994fBQo=;
 b=cJwhezwWZr9ETedfv9l7Mjy+4IomJD3dnQUuZKFSry87Rl3Z/XAP6f9R7uJOKaz0/usuWVPjMznVewgjwXTkQxA5Coyd/8YGhxvyBYkF5NziJvpzEZ3mJxOC8khGbZ0VfHn9DPSvfWw4LNb47tmIBExNO9RKJdLZJFiiAaptRw8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB7034.jpnprd01.prod.outlook.com (2603:1096:604:13a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Sat, 7 Feb
 2026 11:19:55 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9587.016; Sat, 7 Feb 2026
 11:19:55 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, magnus.damm
	<magnus.damm@gmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 1/9] dt-bindings: interrupt-controller:
 renesas,rzg2l-irqc: Use pattern for interrupt-names
Thread-Topic: [PATCH v3 1/9] dt-bindings: interrupt-controller:
 renesas,rzg2l-irqc: Use pattern for interrupt-names
Thread-Index: AQHcl1ohZul8FZnrO0OBcrMOZH0Et7V3C7kAgAAKxrA=
Date: Sat, 7 Feb 2026 11:19:55 +0000
Message-ID:
 <TY3PR01MB113465DF3134440209DFD94058667A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260206111658.231934-1-biju.das.jz@bp.renesas.com>
 <20260206111658.231934-2-biju.das.jz@bp.renesas.com>
 <20260207-spiritual-victorious-wren-519a0f@quoll>
In-Reply-To: <20260207-spiritual-victorious-wren-519a0f@quoll>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB7034:EE_
x-ms-office365-filtering-correlation-id: e4fa17fb-5bd8-4ca2-7421-08de663ad210
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?WTNMYUFQTzlKdkszbG9BZVpobjJhc204QkNTbHh0a0U0Ky9ySGJGUkhTUlAw?=
 =?utf-8?B?QytzQmZWYWZUYWo4UEpsdUJ6eHQ1R2ZOTDZSdXRWSWg2Nk9LbW5PRllGSDh0?=
 =?utf-8?B?UHpGNTVSekswZ0xrQkZiWHJHNFlUVEoxSXcvTTFuTG9OdFZYbkxENHgrbkFk?=
 =?utf-8?B?OFlBYVlja0ZCcUZoV2c3UjNBcW5BSEh0TzBqa2w5MFJFcjQ2THVMbDRqbzdw?=
 =?utf-8?B?ajVKV1U4cXN5WXZLbXhodzNWck96VkdPblByaXB3WEVtOVg0eHJBL1F0VURU?=
 =?utf-8?B?c2RlQk9YZG5LNDJoekxEUGExMVBxSjV5SzVEMGdONlZVNkdOakwvUXNlR0VH?=
 =?utf-8?B?MXdQVUdQRWJaN0lTc3JkOTdMWDdONTJBOUNSclc5SUxZQ0dMSVpsR1V5VTQz?=
 =?utf-8?B?MlBxTytuUCtDa0VCeTlnbjgyZklGcnpaa3ZSKzMyMHVKTTFwcXRJZEpFTDNh?=
 =?utf-8?B?ejdCKzRocUxRUFZBNUF3MHZCUkZ4cExvdmJoR0RVQmVQUHlaSXJGTE1WU1hu?=
 =?utf-8?B?WmYzdjU1Tjg0UmREbzEvTjhpVHpkY1NnSVozdk1wS0NtRnFjK0lOT1lUK3Jr?=
 =?utf-8?B?R2Z4WVRRWTJCTHhLNC81R2hVc2pSMW52NjRnRmt1eWE0WGgyUC9DUmtLQlJP?=
 =?utf-8?B?SnpWQjFic3Z3N3lyd0dWTmM5WEF2WkpCeTZsRDR3QWtQZllhcmxpSmNFSlha?=
 =?utf-8?B?anhHWm9qd1hrREliZWpLZTNZalp0aG51VWpzWTdvdHNPckpQc0tRZEJpU2NP?=
 =?utf-8?B?VWFSMW0yWDVYTElKNFE5OGkzMFIrc3lvVXRVNjhRRzNmc0ZkTlBRRzRGTHFD?=
 =?utf-8?B?eXQ1Z3FRcHM1Z2xvUC8yRFN6b0NZNWJhU3hUYnJTeHJvVFJ1ekJBMjljUXRS?=
 =?utf-8?B?aDNRVVZpcU5UcitnWDIzeGp3Unp5cEtOLzlwZXFKR0MxTTkrUjJuL051ZW5u?=
 =?utf-8?B?WDJsenV1dDBTMTMvYTQzYXdaMjUwVTZXd01zWXduK3BDQlpUMWZub291dUZM?=
 =?utf-8?B?SlRRTXRBdEUxR1NST0lFVDQ4KzM2ajdGbUtDNlZuTkxSNDB3MUltUU5XODFz?=
 =?utf-8?B?enNiRHRQbDdsTHhzZEVudzM2bzM5aDYrdzZkV0FCeDRtSVpMSXljbjhud2FB?=
 =?utf-8?B?V0I4dWR2c1lDRVdDWC9ZKytJSXV6RUdLaHBuc29qS0pMaWovaXYreTlUY2sx?=
 =?utf-8?B?cFZhWE44R1VaNmEvYmVKc3hWVUhKYThoelZnTkwzcnJySUNzeHQrZlV5NkNv?=
 =?utf-8?B?VDdPWS85YXhjRFloa3NjOHY5ZkN4aDBuUmtxeGhTNTEyakhmUHNvSTFEMGlR?=
 =?utf-8?B?dDlKR1V0TzFHMkYrWnpFZ2NZL1JzeHhmOGxiWVpvTnMxQWhzS3pjbGVpbU1s?=
 =?utf-8?B?REgvRVN3V2VpSXJ4ekgxcFNhZWN3YXk4TnJsYVRzazQveENYdmFxV0hoNDVB?=
 =?utf-8?B?cDhCQ0NMNEh4QnVadTBZd0VJclF0YVRxWHF3cUhMTXI3V1BYeVR1T1dIWWFJ?=
 =?utf-8?B?R3pibFVnUk93akQ2UjB3TE1yd204RmsxdC82Y1UzU3VTZWlocFEwQ1RQMlNm?=
 =?utf-8?B?ZUljTU56WTI3V2NYQXBGL0tYTTcrSys5QVU5clJZeUpLUlRLVVFKcmcwZUZJ?=
 =?utf-8?B?OE83MWw5VHhJWFNHUkNzVHFHaHFBTmduWHNQN3I3SUJLdWpaZ3RnME1ONkgw?=
 =?utf-8?B?Q0x3ZW1Sb1VWc1BUNTNrNUZDaFZUMFBsczcxbERjakZFdWhPMjlBQWxlbG1u?=
 =?utf-8?B?ZklZY0FiZkZUY1V6TlN6dyswbGQrNjFFaE9NUWZTVVROZGZlNnpqa09CMGxO?=
 =?utf-8?B?MGFZN2hrVXYwODl3UWRmUkNNQmxwTnZRb2hpcWNFUkp1WGlHekh6SG02Mkpp?=
 =?utf-8?B?MTJKUmVBZDhaaVJBbm1CdlBvbks1eU5ueUE3RDRYaUJUd1ZPVmZBb0c1cVJs?=
 =?utf-8?B?ZVVzaGdNTDl6L2lzbXRtcmJQVGt3ckV4T24wUlY2ZVFqZThOd1BCem1BcnRG?=
 =?utf-8?B?RFFiRWdsRnNIYmswdjl4RS9wQngwUWllWVRaekxJczNKZVM4cEpCbUxIR3ZT?=
 =?utf-8?B?VzM5SHNycXZvcVYxSGtjL3g0REtzeHNPQ0VEVUFqU0t4WndUckxXVlJWTHVF?=
 =?utf-8?Q?Nlvo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bC84eGMxNjBkODRpaFZBRGRLaDRUaUljN1MxbVlZdTdFYlR5K204dnFSZmYv?=
 =?utf-8?B?R25wTU1HeVUzeEZuUWNGQlRIN3dSNVRENDQwcVREVTh0Sy9aYldmMFhramVo?=
 =?utf-8?B?MWxsK2tJSkZzUEJzTjlyK2daVFM0Wk9xdC9iVXYvTlR1M0ZLci9JUnZ1ZFBD?=
 =?utf-8?B?K1UvTldjRjVvZS93MVh2MDRtMlcyV2FhbTlpc0tFZlEvQ051N0NJU1c1MmhH?=
 =?utf-8?B?ckJ6ajZJa2loQ2pkK09SY1FsUkFKTlZLVjNvRzN6R1FucVlhenJXWUg0MzI3?=
 =?utf-8?B?bzFFbHNuYUdWdUl1cVUySnBtb1F3TjdLZkNEeXBxZmw5YTRwb0tDa0JZU1Aw?=
 =?utf-8?B?eHZMWjJvYXpCcldIelZYMDdVV2IyL1pmVStzbXcweS9JS0UxVEdkSkpTa2sr?=
 =?utf-8?B?Vm5Gc3k3NFoyVm1YRXF0REFMN1VhMFpxRGZsSEtpZE5DWEhranB2THJ2K2pG?=
 =?utf-8?B?ZUV5aUt5a1Vha3I3R0NUVTRFdDk4Q2tzZkZKZVdaaWlrYUNWWWxjZTdLTUoy?=
 =?utf-8?B?OHhoaCtESTRJRW1ndnhtb1F0a0tyNW1MWFB3MVd0YjladjNYN2VuNm8zUytm?=
 =?utf-8?B?aWJVdzc2dHIrZGwzUWgzb2ZmV2FNVnlFU0xPTnBCazI1cFBIQXB1SS95VXN1?=
 =?utf-8?B?WmhFM3RSMlM4WlcvMFExcVorbXJOZWlOTVBvbG9IU1F0RHNndGdMMkZZOFZy?=
 =?utf-8?B?TkROb2dzUFdJWFhWWlFMYW1wNm5hZ0FlUmhHOVMyUHNFaFBLSVZEVk1IQjM4?=
 =?utf-8?B?T2luaWg5dTVneU1xSFFOcXdEOEsrWnpKMkFBby8zSkJVMW0vSkZsOVhZVFZ6?=
 =?utf-8?B?T21hMXR3ZG5za0pONXBLRUZNSURHS0ZoL1VIK0gwRjdsYTBGamtxQjZBMUx6?=
 =?utf-8?B?M3RvRnR2dUxKMGNteU1WWlRrcDR0VDA3Y25GRENnNE9TSHFGMzNsYmN6VjZG?=
 =?utf-8?B?cGdxSE9kSjFLeGhjWUpLUmZSN0p5S0pBb0ttazNZbFJla1BSUXAyUzZ1VUNt?=
 =?utf-8?B?K051aGtqQUVXQmtuREhFWWJQTDhVSENDRVNqOEJjcmJRSHJZcHRqdmlYSm5z?=
 =?utf-8?B?QlhaK0E2NjFrdS9BTTBjSWdYQ1d1Q0ZHRjlGZElCZjN4eTlISHlSdnIxYnpE?=
 =?utf-8?B?aW1XWVRxaUJsQmRYOU5TU21XZVY2MUJWWDZLbFRNN002Zm9EeGRFL3FNL2Ja?=
 =?utf-8?B?ZFZHNUFSMUJyQW5oeDZCVUMwTTh4RWlaS2NwTE5uUlJ2WExKUXNrMGZQeVIy?=
 =?utf-8?B?ZVh0Qmp5Yy9TZW01SEEvN2wrUHZTNnkxclcwRmlEU09UU284WVR5NGNEVzRk?=
 =?utf-8?B?a2doV2loVlVqS2dLaEI5c0xxcisvZjdSanBWNFowbmkrbC81Wm5yeERranp3?=
 =?utf-8?B?MFdXSzF5cTg5RktkVVNzTmlmMFFOSkVsMi9HSkxvNnR6cE55NmYxVTh3UWt5?=
 =?utf-8?B?WVdHayt3V0xHQmZUaGFPRm1zQVpUa1loVkRXQm1SVi9ZaitrRVNxL0dUdVdp?=
 =?utf-8?B?ZnoydUx2cGk1aDR3Y2l3L2MrUGNsMnU2MXBsZnRFUFNKNGxiMzNZUkxzdUFY?=
 =?utf-8?B?SjR4Z3lndkw5dExXT1FxUEF0YlEzTDN3dUY0RGxUUEMxNmdKdTU3d0VnRFZD?=
 =?utf-8?B?b2M5WFFKQlVwUWFGYm9TNVRua1k1WWlpajlJR1pheklzelpnTUc5RmgrYUll?=
 =?utf-8?B?aW1UWDFGK2xSbUhQRFZBc0R1MTgvRXBVK3BuM3hmYk1RWEN0TmV2OStHUzhH?=
 =?utf-8?B?MUtYcEVlTGxrN0xaRmNVSkNSSFd4enRMRVBmU3NsbWhsZmMvRU9hc0RRR3Qz?=
 =?utf-8?B?ZlBIRmtYVkwvRjZqWFFxckRmRno1ZXpOV0RJK0xZQWR3Rlc4RTBCbVVYOEw5?=
 =?utf-8?B?SXJPUUFtZE0rTjRpV2VqcUUwOTlPdUZjSkNGNlpNZmlGNDU3NFNzWjZXczV4?=
 =?utf-8?B?RjdFS2hLTW9oUGQraWtCZFdyOGdTWUlaWCttajY0UHVuTHN1TklRanZ3ZzFC?=
 =?utf-8?B?MFMwOVRuSlNseFZydmhoYmlBUTh6UWpmZnNEL29UUXNMNXFPWXlKTFMvc1Zu?=
 =?utf-8?B?eDZJM1JuLzhjWUhZUk9hTWhLWlZzTjZWNmhuUms5M21nTFQ0ZDNtQURiOVg5?=
 =?utf-8?B?elIwUWR3dXNjenZiRmhjZEJKQW90ZTgzd3B6djZ5OWZiVzVyWSt0WHIrYnRF?=
 =?utf-8?B?ZHRxbU9ZQkJOam0zUThGeGJvdE5lZlZXSmREYWxGNW45TXVNMW43MEdrTFJY?=
 =?utf-8?B?b1BkaWxLSFQ3WG5XSm5JY3JFV1cvSzZ0cll3Sk1yenVZc1dwUm9MWEtZa2tE?=
 =?utf-8?B?QmJMU0hhdVhqZWg3WVBNUnhxMGl0SmRQc0pQOHFpaXljOXl2bENpQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e4fa17fb-5bd8-4ca2-7421-08de663ad210
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2026 11:19:55.1419
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9lbtHQOWnnp6HBsMXyeZCr91C6W/U2D+HTuyYBt0tPQ16DZkNoIkQhdCHTy2LJGRLTYTJRhyfn6GSAGc08XWn5VFjwM1HI8ijqvAUxRLGSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7034
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28028-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 0AADF105BDF
X-Rspamd-Action: no action

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiAwNyBGZWJydWFyeSAyMDI2IDEwOjM0DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjMgMS85XSBkdC1iaW5kaW5nczogaW50ZXJydXB0LWNvbnRyb2xsZXI6
IHJlbmVzYXMscnpnMmwtaXJxYzogVXNlIHBhdHRlcm4gZm9yDQo+IGludGVycnVwdC1uYW1lcw0K
PiANCj4gT24gRnJpLCBGZWIgMDYsIDIwMjYgYXQgMTE6MTY6NDRBTSArMDAwMCwgQmlqdSB3cm90
ZToNCj4gPiBGcm9tOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4N
Cj4gPiBTaW1wbGlmeSB0aGUgYmluZGluZ3MgYnkgdXNpbmcgcGF0dGVybiBwcm9wZXJ0eSBmb3Ig
aW50ZXJydXB0LW5hbWVzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUu
ZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+IHYyLT52MzoNCj4gPiAgKiBObyBj
aGFuZ2UNCj4gPiB2MS0+djI6DQo+ID4gICogTmV3IHBhdGNoLg0KPiA+IC0tLQ0KPiA+ICAuLi4v
cmVuZXNhcyxyemcybC1pcnFjLnlhbWwgICAgICAgICAgICAgICAgICAgfCAxMjAgKysrKy0tLS0t
LS0tLS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCA5NyBkZWxl
dGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9yZW5lc2FzLHJ6ZzJsDQo+ID4gLWly
cWMueWFtbA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVw
dC1jb250cm9sbGVyL3JlbmVzYXMscnpnMmwNCj4gPiAtaXJxYy55YW1sIGluZGV4IDQ0YjZhZTVm
YzgwMi4uYTBiNTdkODA4NjM5IDEwMDY0NA0KPiA+IC0tLQ0KPiA+IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3JlbmVzYXMscnpnMmwNCj4g
PiAtaXJxYy55YW1sDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2ludGVycnVwdC1jb250cm9sbGVyL3JlbmVzYXMscg0KPiA+ICsrKyB6ZzJsLWlycWMueWFtbA0K
PiA+IEBAIC00OCwxMDcgKzQ4LDMzIEBAIHByb3BlcnRpZXM6DQo+ID4NCj4gPiAgICBpbnRlcnJ1
cHRzOg0KPiA+ICAgICAgbWluSXRlbXM6IDQ1DQo+ID4gLSAgICBpdGVtczoNCj4gPiAtICAgICAg
LSBkZXNjcmlwdGlvbjogTk1JIGludGVycnVwdA0KPiA+IC0gICAgICAtIGRlc2NyaXB0aW9uOiBJ
UlEwIGludGVycnVwdA0KPiANCj4gSSBkbyBub3QgdW5kZXJzdGFuZCBob3cgdGhpcyBpcyByZWxh
dGVkIHRvIHNpbXBsaWZ5aW5nIGludGVycnVwdC1uYW1lcy4NCg0KVGhlIGxpc3Qga2VlcHMgZ3Jv
d2luZywgdGhpcyBjaGFuZ2Ugc2ltcGxpZmllcyBmb3IgUlovRzNMIFNvQyB0aGF0IGhhcyA2MSBp
bnRlcnJ1cHRzLg0KYW5kIGl0IGlzIG5vdCBzb21ldGhpbmcgbmV3IGluIGJpbmRpbmdzIHNlZSBb
MV0NCg0KWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L25leHQvbGludXgtbmV4dC5naXQvdHJlZS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbmV0L3NucHMsZHdtYWMueWFtbD9oPW5leHQtMjAyNjAyMDUjbjEyNQ0KDQoNCj4gDQo+ID4g
LSAgICAgIC0gZGVzY3JpcHRpb246IElSUTEgaW50ZXJydXB0DQo+ID4gLSAgICAgIC0gZGVzY3Jp
cHRpb246IElSUTIgaW50ZXJydXB0DQo+ID4gLSAgICAgIC0gZGVzY3JpcHRpb246IElSUTMgaW50
ZXJydXB0DQo+ID4gLSAgICAgIC0gZGVzY3JpcHRpb246IElSUTQgaW50ZXJydXB0DQo+ID4gLSAg
ICAgIC0gZGVzY3JpcHRpb246IElSUTUgaW50ZXJydXB0DQo+ID4gLSAgICAgIC0gZGVzY3JpcHRp
b246IElSUTYgaW50ZXJydXB0DQo+ID4gLSAgICAgIC0gZGVzY3JpcHRpb246IElSUTcgaW50ZXJy
dXB0DQo+ID4gLSAgICAgIC0gZGVzY3JpcHRpb246IEdQSU8gaW50ZXJydXB0LCBUSU5UMA0KPiA+
IC0gICAgICAtIGRlc2NyaXB0aW9uOiBHUElPIGludGVycnVwdCwgVElOVDENCj4gPiAtICAgICAg
LSBkZXNjcmlwdGlvbjogR1BJTyBpbnRlcnJ1cHQsIFRJTlQyDQo+ID4gLSAgICAgIC0gZGVzY3Jp
cHRpb246IEdQSU8gaW50ZXJydXB0LCBUSU5UMw0KPiA+IC0gICAgICAtIGRlc2NyaXB0aW9uOiBH
UElPIGludGVycnVwdCwgVElOVDQNCj4gPiAtICAgICAgLSBkZXNjcmlwdGlvbjogR1BJTyBpbnRl
cnJ1cHQsIFRJTlQ1DQo+ID4gLSAgICAgIC0gZGVzY3JpcHRpb246IEdQSU8gaW50ZXJydXB0LCBU
SU5UNg0KPiA+IC0gICAgICAtIGRlc2NyaXB0aW9uOiBHUElPIGludGVycnVwdCwgVElOVDcNCj4g
PiAtICAgICAgLSBkZXNjcmlwdGlvbjogR1BJTyBpbnRlcnJ1cHQsIFRJTlQ4DQo+ID4gLSAgICAg
IC0gZGVzY3JpcHRpb246IEdQSU8gaW50ZXJydXB0LCBUSU5UOQ0KPiA+IC0gICAgICAtIGRlc2Ny
aXB0aW9uOiBHUElPIGludGVycnVwdCwgVElOVDEwDQo+ID4gLSAgICAgIC0gZGVzY3JpcHRpb246
IEdQSU8gaW50ZXJydXB0LCBUSU5UMTENCj4gPiAtICAgICAgLSBkZXNjcmlwdGlvbjogR1BJTyBp
bnRlcnJ1cHQsIFRJTlQxMg0KPiA+IC0gICAgICAtIGRlc2NyaXB0aW9uOiBHUElPIGludGVycnVw
dCwgVElOVDEzDQo+ID4gLSAgICAgIC0gZGVzY3JpcHRpb246IEdQSU8gaW50ZXJydXB0LCBUSU5U
MTQNCj4gPiAtICAgICAgLSBkZXNjcmlwdGlvbjogR1BJTyBpbnRlcnJ1cHQsIFRJTlQxNQ0KPiA+
IC0gICAgICAtIGRlc2NyaXB0aW9uOiBHUElPIGludGVycnVwdCwgVElOVDE2DQo+ID4gLSAgICAg
IC0gZGVzY3JpcHRpb246IEdQSU8gaW50ZXJydXB0LCBUSU5UMTcNCj4gPiAtICAgICAgLSBkZXNj
cmlwdGlvbjogR1BJTyBpbnRlcnJ1cHQsIFRJTlQxOA0KPiA+IC0gICAgICAtIGRlc2NyaXB0aW9u
OiBHUElPIGludGVycnVwdCwgVElOVDE5DQo+ID4gLSAgICAgIC0gZGVzY3JpcHRpb246IEdQSU8g
aW50ZXJydXB0LCBUSU5UMjANCj4gPiAtICAgICAgLSBkZXNjcmlwdGlvbjogR1BJTyBpbnRlcnJ1
cHQsIFRJTlQyMQ0KPiA+IC0gICAgICAtIGRlc2NyaXB0aW9uOiBHUElPIGludGVycnVwdCwgVElO
VDIyDQo+ID4gLSAgICAgIC0gZGVzY3JpcHRpb246IEdQSU8gaW50ZXJydXB0LCBUSU5UMjMNCj4g
PiAtICAgICAgLSBkZXNjcmlwdGlvbjogR1BJTyBpbnRlcnJ1cHQsIFRJTlQyNA0KPiA+IC0gICAg
ICAtIGRlc2NyaXB0aW9uOiBHUElPIGludGVycnVwdCwgVElOVDI1DQo+ID4gLSAgICAgIC0gZGVz
Y3JpcHRpb246IEdQSU8gaW50ZXJydXB0LCBUSU5UMjYNCj4gPiAtICAgICAgLSBkZXNjcmlwdGlv
bjogR1BJTyBpbnRlcnJ1cHQsIFRJTlQyNw0KPiA+IC0gICAgICAtIGRlc2NyaXB0aW9uOiBHUElP
IGludGVycnVwdCwgVElOVDI4DQo+ID4gLSAgICAgIC0gZGVzY3JpcHRpb246IEdQSU8gaW50ZXJy
dXB0LCBUSU5UMjkNCj4gPiAtICAgICAgLSBkZXNjcmlwdGlvbjogR1BJTyBpbnRlcnJ1cHQsIFRJ
TlQzMA0KPiA+IC0gICAgICAtIGRlc2NyaXB0aW9uOiBHUElPIGludGVycnVwdCwgVElOVDMxDQo+
ID4gLSAgICAgIC0gZGVzY3JpcHRpb246IEJ1cyBlcnJvciBpbnRlcnJ1cHQNCj4gPiAtICAgICAg
LSBkZXNjcmlwdGlvbjogRUNDUkFNMCBvciBjb21iaW5lZCBFQ0NSQU0wLzEgMWJpdCBlcnJvciBp
bnRlcnJ1cHQNCj4gPiAtICAgICAgLSBkZXNjcmlwdGlvbjogRUNDUkFNMCBvciBjb21iaW5lZCBF
Q0NSQU0wLzEgMmJpdCBlcnJvciBpbnRlcnJ1cHQNCj4gPiAtICAgICAgLSBkZXNjcmlwdGlvbjog
RUNDUkFNMCBvciBjb21iaW5lZCBFQ0NSQU0wLzEgZXJyb3Igb3ZlcmZsb3cgaW50ZXJydXB0DQo+
ID4gLSAgICAgIC0gZGVzY3JpcHRpb246IEVDQ1JBTTEgMWJpdCBlcnJvciBpbnRlcnJ1cHQNCj4g
PiAtICAgICAgLSBkZXNjcmlwdGlvbjogRUNDUkFNMSAyYml0IGVycm9yIGludGVycnVwdA0KPiA+
IC0gICAgICAtIGRlc2NyaXB0aW9uOiBFQ0NSQU0xIGVycm9yIG92ZXJmbG93IGludGVycnVwdA0K
PiA+ICsgICAgbWF4SXRlbXM6IDQ4DQo+ID4NCj4gPiAgICBpbnRlcnJ1cHQtbmFtZXM6DQo+ID4g
ICAgICBtaW5JdGVtczogNDUNCj4gPiArICAgIG1heEl0ZW1zOiA0OA0KPiA+ICAgICAgaXRlbXM6
DQo+ID4gLSAgICAgIC0gY29uc3Q6IG5taQ0KPiA+IC0gICAgICAtIGNvbnN0OiBpcnEwDQo+ID4g
LSAgICAgIC0gY29uc3Q6IGlycTENCj4gPiAtICAgICAgLSBjb25zdDogaXJxMg0KPiA+IC0gICAg
ICAtIGNvbnN0OiBpcnEzDQo+ID4gLSAgICAgIC0gY29uc3Q6IGlycTQNCj4gPiAtICAgICAgLSBj
b25zdDogaXJxNQ0KPiA+IC0gICAgICAtIGNvbnN0OiBpcnE2DQo+ID4gLSAgICAgIC0gY29uc3Q6
IGlycTcNCj4gPiAtICAgICAgLSBjb25zdDogdGludDANCj4gPiAtICAgICAgLSBjb25zdDogdGlu
dDENCj4gPiAtICAgICAgLSBjb25zdDogdGludDINCj4gPiAtICAgICAgLSBjb25zdDogdGludDMN
Cj4gPiAtICAgICAgLSBjb25zdDogdGludDQNCj4gPiAtICAgICAgLSBjb25zdDogdGludDUNCj4g
PiAtICAgICAgLSBjb25zdDogdGludDYNCj4gPiAtICAgICAgLSBjb25zdDogdGludDcNCj4gPiAt
ICAgICAgLSBjb25zdDogdGludDgNCj4gPiAtICAgICAgLSBjb25zdDogdGludDkNCj4gPiAtICAg
ICAgLSBjb25zdDogdGludDEwDQo+ID4gLSAgICAgIC0gY29uc3Q6IHRpbnQxMQ0KPiA+IC0gICAg
ICAtIGNvbnN0OiB0aW50MTINCj4gPiAtICAgICAgLSBjb25zdDogdGludDEzDQo+ID4gLSAgICAg
IC0gY29uc3Q6IHRpbnQxNA0KPiA+IC0gICAgICAtIGNvbnN0OiB0aW50MTUNCj4gPiAtICAgICAg
LSBjb25zdDogdGludDE2DQo+ID4gLSAgICAgIC0gY29uc3Q6IHRpbnQxNw0KPiA+IC0gICAgICAt
IGNvbnN0OiB0aW50MTgNCj4gPiAtICAgICAgLSBjb25zdDogdGludDE5DQo+ID4gLSAgICAgIC0g
Y29uc3Q6IHRpbnQyMA0KPiA+IC0gICAgICAtIGNvbnN0OiB0aW50MjENCj4gPiAtICAgICAgLSBj
b25zdDogdGludDIyDQo+ID4gLSAgICAgIC0gY29uc3Q6IHRpbnQyMw0KPiA+IC0gICAgICAtIGNv
bnN0OiB0aW50MjQNCj4gPiAtICAgICAgLSBjb25zdDogdGludDI1DQo+ID4gLSAgICAgIC0gY29u
c3Q6IHRpbnQyNg0KPiA+IC0gICAgICAtIGNvbnN0OiB0aW50MjcNCj4gPiAtICAgICAgLSBjb25z
dDogdGludDI4DQo+ID4gLSAgICAgIC0gY29uc3Q6IHRpbnQyOQ0KPiA+IC0gICAgICAtIGNvbnN0
OiB0aW50MzANCj4gPiAtICAgICAgLSBjb25zdDogdGludDMxDQo+ID4gLSAgICAgIC0gY29uc3Q6
IGJ1cy1lcnINCj4gPiAtICAgICAgLSBjb25zdDogZWM3dGllMS0wDQo+ID4gLSAgICAgIC0gY29u
c3Q6IGVjN3RpZTItMA0KPiA+IC0gICAgICAtIGNvbnN0OiBlYzd0aW92Zi0wDQo+ID4gLSAgICAg
IC0gY29uc3Q6IGVjN3RpZTEtMQ0KPiA+IC0gICAgICAtIGNvbnN0OiBlYzd0aWUyLTENCj4gPiAt
ICAgICAgLSBjb25zdDogZWM3dGlvdmYtMQ0KPiA+ICsgICAgICBvbmVPZjoNCj4gPiArICAgICAg
ICAtIGRlc2NyaXB0aW9uOiBOTUkgaW50ZXJydXB0DQo+ID4gKyAgICAgICAgICBjb25zdDogbm1p
DQo+IA0KPiBZb3VyIGNvbW1pdCBtc2cgaXMgY29tcGxldGVseSBpbmFjY3VyYXRlLiBZb3UgYXJl
IG5vdCBzaW1wbGlmeWluZywgeW91IGFyZSBDSEFOR0lORyBieSBhbGxvd2luZyBhbnkNCj4gb3Jk
ZXIuDQoNCllvdSBhcmUgY29ycmVjdCwgYXBhcnQgZnJvbSBrZWVwIGFkZGluZyBtb3JlIGludGVy
cnVwdHMgaW4gZGVzY3JpcHRpb24gYW5kIGl0ZW1zLA0KaXQgYWxsb3dzIHRvIGNoYW5nZSBieSBh
bnkgb3JkZXIgYmFzZWQgb24gdGhlIHBhdHRlcm4uDQoNCkNoZWVycywNCkJpanUNCg==

