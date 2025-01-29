Return-Path: <linux-renesas-soc+bounces-12701-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 334A6A2209C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 16:41:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 988931633DD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 15:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A7921DDC34;
	Wed, 29 Jan 2025 15:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="svHZY5ZL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011020.outbound.protection.outlook.com [40.107.74.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7D71DDA17;
	Wed, 29 Jan 2025 15:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738165271; cv=fail; b=lQm3AOM8wHrh4gIupjn3mVXtItgYdNN8SMBb5jbLBRxWhUfsltCkFASlWu4NRfEdrqFcq7KUPSw9ZcAbJ55J6NkCVJ7oDhLzUEWS7+ZP4qxGwCP8hMS2fXHGx28jiruE/JoqgQbKs0S6IqgjuW+yO+55zo/SdCm1nsMlAgPYAjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738165271; c=relaxed/simple;
	bh=votwMpg0fV5Wj6Be4pUoaHcr3Fy/4zIk3KqcEETuC2k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=S6cbJ5Ec76L1vl8JJA6KMJx98lmUDqUgm5UYoKfnNeuya3oSjXOz2jyL8ydP2+MzXgyZJRX7swtTU37pNCOQ3eqUyS+tuKeTFAg+KMThxQGDMcEoxuFInFik/elNX9DtuRU1yYZrtDXZ7mlnnRwh3pa+RbFtPIUFJGO/twvWlec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=svHZY5ZL; arc=fail smtp.client-ip=40.107.74.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rxBJaWlkp7RvDqLt3qaofaDFKveUOtq9L+fiLoxG5FZ3Mgc/d7eit536SIsrkktiq/lKLIxTye4cTN1lYqXcfrNeTzf3LC9VaKWCEMRVpWqIo9rgO3I17UldaWSsseOhhgHC66hsEziYQeywPGsGTzfk9/fHKuDRha0rKC5/MkygBr3ZB8gzWShQI/UhZJVoDCXp4oRbsOdmxK7OVQT62eXnW1w3wRRWS4ljWsUMtV4RgS3J3EcTbrpaFAenkrWfNd8HjvgPVgR5jJ1h5nOB52dHuDnsKbXKHxLJDD2DtrDo1enPcP6V52nxE/1i8nqabS71baD+uJrFcFHf/QNvhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=votwMpg0fV5Wj6Be4pUoaHcr3Fy/4zIk3KqcEETuC2k=;
 b=aTIOQ7noCZmg8RrBOS/vy6ozh9o+Q5Eu2+5cSwU6OLkxY76golKGlW8DaUzad34YD7f1eaWWEyc9y4HmFO2w7gqrZnBFG0hRq17osgsWZupVrMs8MPwzuVV0DfcWfPD0/yajWI/FU96H5jzYZRx/TiJPi5mo14GKyHk8ZFqkH7QKd2tsAKdQAj2Za5IB680GN+1qEbabnMziRtVJkV3/DxpFlbbo4O13dBsxjwW3YygyWY8H1jihYGH0BVVAUfEZUss8eYR9HhsEXE0jOkuKDilHwXPVfR0dC+ZvGb1Taw8WKotaIliUOTIdGvo/VjteQrR/QWMYf97HV05orK7tCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=votwMpg0fV5Wj6Be4pUoaHcr3Fy/4zIk3KqcEETuC2k=;
 b=svHZY5ZL5sGDmS2Zt4GHZ5zwp0AJD+B54XU+q+w+pgqc1karEm0/vSDZoIRfPPb+i3tDsvQMJMumjfMWVmJJChAxizTXlA/EzFcMqk/4ka+4o2fpdFphZehSa6pEl9Krtbchy+FiUMlWulOYg7Hfkn8tg78bWQiV14/JVR48l+M=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB9938.jpnprd01.prod.outlook.com (2603:1096:400:232::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Wed, 29 Jan
 2025 15:41:05 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%2]) with mapi id 15.20.8398.014; Wed, 29 Jan 2025
 15:41:05 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 7/7] arm64: dts: renesas: r9a09g047e57-smarc: Enable SDHI1
Thread-Topic: [PATCH 7/7] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 SDHI1
Thread-Index: AQHbb/jE8FJH5b8cn06xmQGxemva7LMsWFcAgAGPtpA=
Date: Wed, 29 Jan 2025 15:41:05 +0000
Message-ID:
 <TY3PR01MB113466A41A9462FC0D789F9BB86EE2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250126134616.37334-1-biju.das.jz@bp.renesas.com>
 <20250126134616.37334-8-biju.das.jz@bp.renesas.com>
 <CAMuHMdVOWPkf5U3iqafpzMF6FrzqZ4osoFtvgtgSra6VgFzynw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVOWPkf5U3iqafpzMF6FrzqZ4osoFtvgtgSra6VgFzynw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB9938:EE_
x-ms-office365-filtering-correlation-id: 5cc3d606-80a2-4164-9071-08dd407b57fd
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?L2dtWWJIclFBdkdGWGo3M1JTMitHYTdRNFVBOWhSdmszY0pHNEpWemh5OGJt?=
 =?utf-8?B?UWxqaUg1MlRBaUxTc2RWRVdjMkZLOEVCbHM4MFkzQ2pKN21Mc05aQ0x1UlFG?=
 =?utf-8?B?OFhwa1hQKzBreHkxbjQyUndXQzBHSmwrNlhqa0E1LytQeC94ZFNFaTNxYlB5?=
 =?utf-8?B?NlhIWlRueEpqRGhBd0tHZ09aU1RHZDNzNzJ3ZUNKQVRDNENwdHVWMGZ0bXo3?=
 =?utf-8?B?RzkxcjNjaEpMRHgzRlRzQ1VCT2tOZEVKRXZVN0ZIbGFrOGFSVGZnT0p4ZGhN?=
 =?utf-8?B?M2tCTVF5RWlMVGpqdy91bythTDZrd3Jyb1dDUmJZaWdUbnpoeis2WkxkdW56?=
 =?utf-8?B?dThRSjkzd3FzTWtjM2NXNjNRNHpUVHR2QktyOG04QkI3ZDRmdi9KMXN5MkxD?=
 =?utf-8?B?QjVyNlh1TTA1bEhDYXk5RUlNTkRHemlhSXZjSE1PVmM3QXFkK2g5czZMb2JM?=
 =?utf-8?B?Y3RhejJlckw4ZjlBSkxQM2dRcEtJNG9GQ1NndDc5aGQ3a1RJT2VWWTEzRDBI?=
 =?utf-8?B?VlJjTTBIMkpNZUhmcDVLVTVSNjlMRXorRUFsMDQ0bzAzVmNSVHkzT3lVU1By?=
 =?utf-8?B?NFBSc2tUcko5Z0h4Sm1xeEp3Z3ozVEpBMEZWSDYydCs3ejR1REZ5dlh1TS9Z?=
 =?utf-8?B?Z25yQ3lURWpjeDNUNWtRNjVWd3h4ZERKN1loamo1NjU0WTlrU3ZjRThiR01t?=
 =?utf-8?B?WXBkc2dXZ1Zib3RmNlljc21xU0JrRzVYeHZOckZrbS9LdDUzL3hkSFhhZ3VT?=
 =?utf-8?B?QVR5dFFLcGZEb3ZKUm1lT2ppakxNSU82a0tCWC9yZXBWZ1lwZzdLdllyNWFJ?=
 =?utf-8?B?b1h4aThVbXU2dlFjUjBKTG4xQjJLSXlrWm11clpockhRZko5QVpXNTdLMG1s?=
 =?utf-8?B?T1FqRlhUTytjVWdtR0t0QUFWLy9tMG05bnNsTzJqT08vMno4Z0FuNVI2emJq?=
 =?utf-8?B?TTVFcHRPd0Vsb2lMeGVuVGlJdkRTRUJrSll6QndyR2JpTTc2b0gzRGdCb2J1?=
 =?utf-8?B?clBpSnBYY3I2cDVCQmhuUG5uVDdLVDB1TS9PN2t2Ry83dE1rTDljNDVJZk94?=
 =?utf-8?B?UkVzeW1qK1Y5UVRpckFMa1FBdTd0TllmWS9HYnV3NG5zRmgydlZEU3NaTWd0?=
 =?utf-8?B?d2t0WnhIdUFvamdyNnp6T1ZGVjlYTmwvVEw1V3QvZngrWnZ0Nk1VNnpwc211?=
 =?utf-8?B?Qkt2S2laNUNVb1NpelEyQ0V2UnJ1Zmhob3g5VkJHeGFlYjhWQXNwTjJEK0F1?=
 =?utf-8?B?SDhFWGNhbkdFUUxIYW5lWDhOYVBrY2Q3azM4NmthNjlNZVhSWVkzN3JZejJT?=
 =?utf-8?B?ek4wcXhjNEg1UUpuUTNVSDBhT1lLRmgxSERQejhXL3UyNjRBQWEwMUgrOFA1?=
 =?utf-8?B?d0JiSG1YYlROOVZGdExQek1jMGRWQjZ0cXFlc0hqR3A4dVFNNXV0dXE1Lzh6?=
 =?utf-8?B?bnpXYkFQeG1FQVlSc1hoNzdZaTdyQkFpTVlzaFpzZW1BRXZxbDZBSWFlNWph?=
 =?utf-8?B?RnV2ak12R3dVL0RwZE0vQTZKS0hjM2lFSEhvVzZFQ09lRGdWam1BS0JPZHVy?=
 =?utf-8?B?MlBuY1JmazRaQ2xRVlcxeEpVYTAwSk9vQmZHbE96UXlCVXNaTnpKeG1OWmhO?=
 =?utf-8?B?ZjZGb2ltanRHWThYRlRxSmh0dC9yTEVYLzZTTVlaVmxaams1c210b3BnRjho?=
 =?utf-8?B?cVpLaE9LVlpFaXBadGhFMVFydEV4bDU4eHhXaVhqaThrb25sTVFSTmNIY3Qz?=
 =?utf-8?B?RmJWV2VNSVNhWmdqdUtNWnNDWDlBTHJ3YjRxK2hkTit1Q1ZlT0h6ZXF1SjZq?=
 =?utf-8?B?ZXM0NFFLM0RtQzhieHA1QTFzZE9ueDRwalppZDNNL3ZMb1dMREZkZjg0TmlY?=
 =?utf-8?Q?03Op10m2nZfQn?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WTl5dExxWlJlZURPZE1wVUo5bWc3U29TamQ2UjhXV2V6dzcxbWdaVWpCZkRX?=
 =?utf-8?B?VmZianRoWXJTRkdJejAzdStCY3pOMHZweXNHVVVOMWpMUm52WDBoMml2ZU9k?=
 =?utf-8?B?aytySWdTU3d2R2Fpa3YySHJKYmdMdHZhbjg2Vm9NS0ZtUUl2ZkxlMC9GYkhK?=
 =?utf-8?B?cmRjaVQ5SE5aTFpnMEw0dk9mN1pSemM4MTA5cFgxOXNTb2VoV1VrK3Fvb3NS?=
 =?utf-8?B?cUJTMzR0NUZQMmFCSXJROFprZjBnT3FuTXZEa3dma090MDRqMzZ5cE5LY3VN?=
 =?utf-8?B?OHZ6cUhidGxpTDJ1eGI3ZWo1c0I1aXFYRWRSVFNIY1RmeFhXS2ZjK2ZiSEE0?=
 =?utf-8?B?blErbTV3aHZUSStNSzgva1dvVGNDeFBTMndVT01mSTIzTTFQbzE4RTQzS0pL?=
 =?utf-8?B?QzBhUkdSQ0x1c1RTNXFtRklaazhJdmwvWVo4dXhISXFycjNkOEJjRkdHL0h4?=
 =?utf-8?B?MzRKblBaZDkvUzhJakNEcXBadkt6MEV5ZCtPZjNhM2tpYisyWDdjOWIvNzMx?=
 =?utf-8?B?M0prVklkVm9KQksvRU1YWEFYRCtiamgwK3RBczBkRVIxelNrQ0VVVnN1ZjF2?=
 =?utf-8?B?MGlkRXY2UVJoQVFaakxnSVN1VzZaR3pMd002ZTFSNWZReVpRb3pZZFBEVTMw?=
 =?utf-8?B?Q2w5bXpidUlzRmV5L21tODIrN2JiVnBwOURRemNCMDBHRUxNM3cwNzRFV3NU?=
 =?utf-8?B?L3RPVDd3VUJoSFA1VlBMTnZrR3dxRVNPS0NQTlljWXRsZ01PaEpVTXNudEtq?=
 =?utf-8?B?RVdiaHNoMVQ4K00zTm9pdDBndjJncm44U3JWZWdNVXlTMkNzNWNTR1Ywc1JU?=
 =?utf-8?B?QzFjczdyUVZXVjdDa1luSEJzUnVybTVhWWlBMnh4RTB4cnNCeC9QUHJuN09K?=
 =?utf-8?B?Y0pyMUdTZVlwT2dQZG42UEp0N3JSVVo1aTNTL2RMcXg4b1V0NlN1TGZtNEZ2?=
 =?utf-8?B?VzhpNll0UTJqNERWWFBJSlVtN1lUZUUrblBBa1I5VGpWWS96NmZibEt5T1N2?=
 =?utf-8?B?cVRzNVRKZ2lZLzhxVExXT1U1aElkeDl0dG1nSEl3LzI4VEo0UXFtTTRmaTVu?=
 =?utf-8?B?WnFiempJdC9wQlZhNjBzdmtkeWxLYmlNKzRxNi9XOG9iSEdQU1FWREt4amV6?=
 =?utf-8?B?Tjc4ckxod24rU1EzMmNiWjBlcFM5Umt5RWxDTXo0RTM5dHd5dXo4Wmt3WmlJ?=
 =?utf-8?B?MFU0NVVCT0l2d1NNanBPQUh0eVdnNkpnTXl3RVUzSEMzOG5tZWJWS3hvaFR2?=
 =?utf-8?B?b2hDdG9zUjgxYkNkVGRrVXI1ZFJ2KzFxNGc5OXB4R3c4WVVqRGFSbWZDQjQw?=
 =?utf-8?B?cGRUSVJYUmdwaDIra1FnMHFJUmNXT2RWc0Z4SHVMTHhXVklwUVhqZHZ1a0h5?=
 =?utf-8?B?RTZ2K04xYUhPMVRFK0svSitMZ1BQZ3UxblQ2SlBDNUVKNkVDWXBNWlJmTTBi?=
 =?utf-8?B?MThjeGNKcG9HYW1YRGZ6ZktJZGdGZmpKWmlZaVZoVklrTHlhdXZ5L0NSMDdp?=
 =?utf-8?B?Z2tjZ09velV4c1l0ZXI0eTlEVXRBV3FzcXB0MmpSOTFGMnREd3VEUGxDeXh6?=
 =?utf-8?B?ZGhQS3AxSm5LSWE1Q2dSRjRkNlRlNmd0Y2FzUy9aVG9ERkR3UkRoZnRmSEwv?=
 =?utf-8?B?SHF1TzRNYURqSHVqU0daa2RFd256dlFGOTJEaWYwYmNUcGs2NFcxQUc0TWJU?=
 =?utf-8?B?ejM3UWNCWDNiekdQaFcyVnQ5LzF2QkdvNHBMUTFNcWNiOXpXQmkyMXBBV3JS?=
 =?utf-8?B?YmtBaHUyUU9reEJPZXd3TmwzMXZMODBORHVFMWxzR2tLKzh3bEJBdkx0Tmpp?=
 =?utf-8?B?KzhleXpyaFdNTjJsOFV0SldFQ1RwRkt3aVNNVFE3VTBEVXZsS2x4bFltbEFM?=
 =?utf-8?B?RHFtNngvL2k3SkYwZCt0UXJwWUl2cXdjMllyTk9xN21RUXc3MjdpR3NON0Jj?=
 =?utf-8?B?cGZhQWtjWWRMclBCOWVuKzJiM0t2d0x3MUliSXMrTXpKakhtVzJzM3JjdXFq?=
 =?utf-8?B?bk9pdmkvUjBKOXhtcVlzV3RZT1FKbDRhNFJ6R3ViQ1VUWFJ1c2RUZW1JSlhR?=
 =?utf-8?B?bzE1dzVDOVNWYW5oM3crSVdZZjVZcEJ4aUJGWlJFTFJNSHpROEFxaVVoaWUz?=
 =?utf-8?B?d0Y5djViTG94bmRMaWhRTGFWOFNSNWdQQjlzYVViVTQzbjRBb2cvQ1pHdmMx?=
 =?utf-8?B?ZVE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc3d606-80a2-4164-9071-08dd407b57fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2025 15:41:05.7233
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uIFj7bLp+mfkBtJMDGO2hC3t5sGimlv3JTs491F+P63+pD2cPHu2VWH00DF0hGkZMwaHA9FZRGonYfzfJ3e8birypgKlcsLDJ29V0EPHGWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9938

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDI4IEphbnVhcnkgMjAyNSAxNTo0OQ0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIDcvN10gYXJtNjQ6IGR0czogcmVuZXNhczogcjlhMDlnMDQ3ZTU3LXNtYXJjOiBFbmFibGUg
U0RISTENCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBTdW4sIDI2IEphbiAyMDI1IGF0IDE0OjQ2
LCBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IEVuYWJs
ZSBTREhJMSBvbiB0aGUgUlovRzNFIFNNQVJDIEVWSyBwbGF0Zm9ybSB1c2luZyBncGlvIHJlZ3Vs
YXRvciBmb3INCj4gPiB2b2x0YWdlIHN3aXRjaGluZy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+ID4gLS0tIGEvYXJj
aC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA5ZzA0N2U1Ny1zbWFyYy5kdHMNCj4gPiArKysg
Yi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDlnMDQ3ZTU3LXNtYXJjLmR0cw0KPiA+
IEBAIC0yMyw5ICs1Myw0NCBAQCBzY2lmX3BpbnM6IHNjaWYgew0KPiA+ICAgICAgICAgICAgICAg
ICBwaW5zID0gIlNDSUZfVFhEIiwgIlNDSUZfUlhEIjsNCj4gPiAgICAgICAgICAgICAgICAgcmVu
ZXNhcyxvdXRwdXQtaW1wZWRhbmNlID0gPDE+Ow0KPiA+ICAgICAgICAgfTsNCj4gPiArDQo+ID4g
KyAgICAgICBzZDEtcHdyLWVuIHsNCj4gDQo+IGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9y
OWEwOWcwNDdlNTctc21hcmMuZHRiOiBzZDEtcHdyLWVuOg0KPiAkbm9kZW5hbWU6MDogJ3NkMS1w
d3ItZW4nIGRvZXMgbm90IG1hdGNoICdeKGhvZy1bMC05XSt8ListaG9nKC1bMC05XSspPykkJw0K
PiAgICAgICAgIGZyb20gc2NoZW1hICRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMv
Z3Bpby9ncGlvLWhvZy55YW1sIw0KDQpPb3BzLiBJIHJhbiBhIHNlbGVjdGl2ZSBkdGJzX2NoZWNr
IHdoaWNoIGlnbm9yZWQgdGhpcyB3YXJuaW5nLiBJIGhhdmUgZml4ZWQgdGhpcw0KTm93Lg0KDQpD
aGVlcnMsDQpCaWp1DQoNCg==

