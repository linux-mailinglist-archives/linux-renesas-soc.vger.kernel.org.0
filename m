Return-Path: <linux-renesas-soc+bounces-20742-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5746EB2D41D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 08:35:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E83D4E0A6C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 06:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B5C2C11D7;
	Wed, 20 Aug 2025 06:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="YlgzPI7X"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010001.outbound.protection.outlook.com [52.101.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BDA285C8D;
	Wed, 20 Aug 2025 06:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755671732; cv=fail; b=CDhfZtntlZBJZOsmXcukM1z5BdGZU0Zisl4SzgO4R0PQ1jKPiotOCgUfghkGqF3oqX1ZzrKIY60AgRyZEArkWY8DCSsyr0lPJn1eyHJ+f3opBOD8mc8P5kQ0eyyFpNUdRoi+PKDGxFuI+MJcabDDM1NYfBnpiXvh3r8d78QiZoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755671732; c=relaxed/simple;
	bh=hw4hLSJ26mFCahN4991LhjBepJNRX2KQIhPcdWENWa8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oxKH9UGzKFq4faF3f+nwSCjBLxsCwDqM/edjBD94WrzxNXUVHNrWKeN502k95Bxr6h8wqzdjayniXTIvo2Var9H9ZEHEGdMuCYgKR6YrRqDWuJUHpg5gMHGkVUXSiJ1IjDag3+D32zISDyq/ONy+PgK7NyYDRBRvtFyijGtga2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=YlgzPI7X; arc=fail smtp.client-ip=52.101.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O8L70uTCXdnrH80zQkI2tcby7KQpi+rXDwmFrwRKSBMvd5hDLlS3DCgcMweuMGMqEXfn4yKo6HwU/KdtPMOlfDtXQ8qcV8map6oUMeIT+0jIJFH6OqF5UKnjuOwq8VlRHfaVAuClGD4aYlICVFXRRMcjuHsBrmW3q0+EpdHTUF3XSxRE0vVR0mPsHn3CVjTgSfqQq0JwYWUCyGZrfWkxM4NqTKRpKNvRCUzZA1sgGcSA11UX3KfPu51q+MRF2rYNpW/dV1iqMDruvQreq3JHT/Ih6d7NkfMt09v98VEud0mNGn6DzDFaLsMKJdMirr4GnARRiaVQ6OmRryGJztmrHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hw4hLSJ26mFCahN4991LhjBepJNRX2KQIhPcdWENWa8=;
 b=lXBRfSJMlXPl9kou810/u4TRTv3loalgt5Ucjxp2UrL7d0aKQdxXeiV8OmvOBh/mUwXX4btlGSX0y5TXIjPYzjQHNNb3YFQFb5uUHthd968RREJt2YrwJMHi2QAWn8dHOVWWTlhs4rfhAqw6Hru7DlWFROIOVPF20lph7QCsl3wlcIP5ueP5SJqsalDG7IZ15FkBsnh6PH43LhgMRvX7KxxTH5vX1kxw8WBxVcG2FIV5RAMeL4U0zOEHmCz/IZrnS+vkNVKq63gaGkNKoNYLp0Cf+XXnJF1sjDmDknK5ER2dcZ4Ln9SXePpsG+YaXLokmrYUN/hEPgTXTr7uPBgVyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hw4hLSJ26mFCahN4991LhjBepJNRX2KQIhPcdWENWa8=;
 b=YlgzPI7XDkgizN4ZpWS1714lGWkxl6w17Qm+30H2i0pTcSjXLmd2l3Wv/85J1cRGQY7JBv61eoGfFPuaxh/otgFLpwqIn1an/sQMDDpcX1m3ixC44TRNXidOSbVXD/iYRt62iRNBwTzAH5fiCnCmOVy5VYTxn70f07HDT3qWLJY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB12689.jpnprd01.prod.outlook.com (2603:1096:604:33e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 06:35:26 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%7]) with mapi id 15.20.9052.012; Wed, 20 Aug 2025
 06:35:26 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, magnus.damm
	<magnus.damm@gmail.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 0/4] Add RZ/G3E GPT clocks and resets
Thread-Topic: [PATCH 0/4] Add RZ/G3E GPT clocks and resets
Thread-Index: AQHcDRnDDcvHFGNFqkKDlYxHHCsOz7RqHKoAgAEBWZA=
Date: Wed, 20 Aug 2025 06:35:25 +0000
Message-ID:
 <TY3PR01MB113467CB44FFF5F65038153EA8633A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250814124832.76266-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdXJBL_uJ=2v0aKJaSf45070yP=Z_kPe-9uSyE1P0QeiJQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXJBL_uJ=2v0aKJaSf45070yP=Z_kPe-9uSyE1P0QeiJQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB12689:EE_
x-ms-office365-filtering-correlation-id: 1a119d6e-74f7-4eb0-9086-08dddfb3bf5b
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Tk9mWmE4WlZxMitxZkllWVg2YzlJWTJWeDVSRjlZaVkvc3RIRmpIdzZXK3hC?=
 =?utf-8?B?SUk2OGtic01SOVNpemVHTVIyOTFtWUt4Z2dLd0hKbWVZa1hkVURZR0l3aUNW?=
 =?utf-8?B?ejAyclkrbVcxclhTT1RBZXpSd1Qvc0lsaVlNSzJoV1ROQUhCRm92b2FTL2lz?=
 =?utf-8?B?SVdXOXlwQTA2b09wTlIrV3duK29wR1djKzlIQkxhV0JydDNtdVZYcmhGcytJ?=
 =?utf-8?B?VTYrK0JrSHFhRjF6Y0EweVlPaXBUbC90Wkw4ekRCVGROQ05veUkrSHhKSWhy?=
 =?utf-8?B?empydHgrRThJSGRVSFlaNGI3Q3BKeVluNkdtOUl2RUJRQTdudnZsd0RpbzFZ?=
 =?utf-8?B?NTlLZlM2TU0zZ0ZWMXFMbG5qL2dvK29ScGt1dVdhT2R1em4wU0RRQ3Vhd2hJ?=
 =?utf-8?B?dlc3QTJYZnFXd3BzODMxVmZ2RFBOOExwaUNUUEhBQlVKbGh0NlVsQ2tuWG1S?=
 =?utf-8?B?VGdjcWV6S2xqd2FtSG5WR0M2WUNJK0JFNmFmWjVkU2pWSmlkYlFZOHdOVU1i?=
 =?utf-8?B?L1BqL0F6bVNiUnRGVzIzNWRDOVRMem5XSjR1d0ZrQ296dm5xSC9HUGNjZHN6?=
 =?utf-8?B?WWE3K1V0czVWbnY4alRLTjZjMmh6MEl5aS9IZVhWRXRsbTI4dVZwQ3IranQz?=
 =?utf-8?B?dGwrQzZWbnhHVXdDZUk1RGhZVWpPL1d5SXVwQ1BTZHN6Y0ZGYklpK0pURkE1?=
 =?utf-8?B?bC9vUy9IeTJzNmdmYkRKMVhkZnNpamhhVFdsZkRjYkxiRlpXWHJyWmM0RkZY?=
 =?utf-8?B?bU4rQ3JKM2s0dTNydFBHK2Y2OWg2N2I2R2RCclFVL1dMRXhEa0tneThlQlFS?=
 =?utf-8?B?OGFoMnZKNytOOVovOWZJblc0eUp3THdvZzBwalZhOC9TRmpIcm40d2R4c1ZL?=
 =?utf-8?B?eDNRdFBVSlZ5WWhWSHgzUm1zVEtEQXhRVzZWNkExNG13dHJrS3FHWitzdjVD?=
 =?utf-8?B?dGJpVlVvU3JtZnE4bGdYcEZsSHd6MXJaNXRUdytJZVB1S1FTTU1qMThnZm5D?=
 =?utf-8?B?RGtwU3ZrM25OYXBOL2FvS1pjQXlHd3ZXSXZsS3dsQzVHUzcwN2xkZlFJeHh5?=
 =?utf-8?B?YTFOZlNlZFV5WmVyR0VyUVdoNDNKQkJPNmsxR01QWTN2K0pUdG40QkxHUE1t?=
 =?utf-8?B?dlgzSWRyU2ZkbzFGMC9HSEhZSmpyV25HUllGeWc5VHU3L1NCZ3pVenFzR21l?=
 =?utf-8?B?Ui9EOVh4RWJkdnpaYTJxclNkY2hZSXJjK0FscnFWWThpQ2hGcDA3aVQza09y?=
 =?utf-8?B?Z1AzNS90K3BCaUQxTUdBZTRaclR1R0k5SUFGVjBVdGQ5YWhUMDV0ajVFVXZF?=
 =?utf-8?B?UVEvSERNYldtZTBpRHc5NkwvWnpGTmJCajBMVDNMbldkMVBUYUpNUmRVUjRE?=
 =?utf-8?B?UXFGMUJPbVhIaWlNQlFVRlh0YVE1a1FYWlprdld2SDRJWEFpK2doS1lnNmtQ?=
 =?utf-8?B?U0lhWGJ5bUFQUGZOVXRCZDZBQUh5dzc2cDc4cGhhRFNKY0g2c1VLbXlkR2R0?=
 =?utf-8?B?dTRHaWtaZFVzY1J1QnBIR3Q4OGVoQ0IzRHBKaXlrRGRxdHZWL2pGOTVzYzMr?=
 =?utf-8?B?cWV3enArR28yZmFMdmFKcnJyVFBPMlNQZHFZU0VaNm9md1JFbWlWS3loaHYr?=
 =?utf-8?B?cVRyM1p2bHFObUZFLzRsK2JZVmRFZmtnZkI2YWRuNGdmZ3BQUDdJbE5lMlk5?=
 =?utf-8?B?OWFSTGczYkp2UjJpd3hHbmhIdlZoVEZ5VmlxTHR3b1RKSXVkSFZvLzZ4L0ZV?=
 =?utf-8?B?MVJqNW8xOW42dHA0L0cwWGZoQnQrcXNjdEUwbjFNK0hidzVXeG1vQXk2Z1h6?=
 =?utf-8?B?bk1rR1pSdUFhM0lPZXUxUzRaVzZxZFdBYXJTbkVJdjBZNWhnWE9VTzA3UkhL?=
 =?utf-8?B?MlVxNVNoMEtqM2w0QjRFTlhUeFhmVEhTNDU2UllBbVExQlZ5dkRld29XdjhL?=
 =?utf-8?B?OXBUMHBmSElOMVFYVjROdGhWeTE4bzBmeTNicU5HTDdGcUpNNUg2WlpuUTRH?=
 =?utf-8?B?cC9wVG5ZTjNBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NVhHYUxrbGhZb3BsbXZvLzdMOVc4UzJ5R2VoaFp1NWRPcnlQbUZCNGZkREJD?=
 =?utf-8?B?K2tlUzVUZjh2SENrem1jM251Q3BNMktESzNTVktuTjNzd0pPU1dVemlkUUxq?=
 =?utf-8?B?S1NhSmo0UzlEVzhSUWhmWnMxK1REWStOdFVFd1lGbmx1TlZCMTNscVVNenR6?=
 =?utf-8?B?OW5WWmpQUlE5bDFvRzlKSXYzVnZaZE9UUzhVN3U5aUtJbTFUTDh1eUdMR1Iv?=
 =?utf-8?B?eDBpakZDT1p6VlBUUWg1VWh1bjUyM00vb2FLM0FKZnAwczV6K1lDaFA4Z1F5?=
 =?utf-8?B?UkprS2dZcXZ5UzBaUURKd1liQWdzK0dZeVlUQmpqTjJkZVUvQjFCQlpqQUpq?=
 =?utf-8?B?MmJMcHk4UmFQV1lwSmp1SjhCSE95VG5SRkg3Z3p0SUhWd0MrMlVHaVVqd0tm?=
 =?utf-8?B?ZHgrMDB0UUFUODN6S3ZmYjhDSjNkK04yRkEyeVJhMGJSeWZSQmczbXFIRmlh?=
 =?utf-8?B?ZStGOTFYTEhRZ2FzMzU2Q21qdjY5U29pSFdaVzVab0pxeE93T0lSVkt6aFhH?=
 =?utf-8?B?UzNVZTZxTWFsU2U2VEpmTHFwbWxrL2ZtbnJxaGY0dHpyaVBpTGNCVEYvMUVt?=
 =?utf-8?B?UjR0dFladGNjVjRDb0Y4eE5qZi85enZwL3pWN3lKZFNGaTY3MDRXNHNFUmFO?=
 =?utf-8?B?QkFxM2RKRnI5ekdDMGduUm4xTmhwZFcydWUzbHk4R0k2OHJZSzdYaHcveit0?=
 =?utf-8?B?TUtPUkRVZUZ2WTFzUS9vRnROb3UwdjlXSkpLK0JpM0htVlNDVFo0Nk15ZkhM?=
 =?utf-8?B?b1k4YUU0bnRlZWtrOW9seEtaWVRjRjhJWmlzWEh4ZHdCdy90TUkzbmt0WVY0?=
 =?utf-8?B?NGlKOHNMVnJvQTRpeGp5NHErcWZWdDZyWW9XKzRWZWREZE5TOHY4QmlFWEVm?=
 =?utf-8?B?SFpxTFk2d2lpdi82cTlRTFo2bWloTTIyeWhjVVhqSlB6UXpZNFRjc21DU1I2?=
 =?utf-8?B?cFdkZk4yVTFCMk51RFpxV0JxbldXbWVUVHdVdGdTbzNwNGNIODU4VU51WERN?=
 =?utf-8?B?Z3Q1WVpUK2xGNGN0QVFjWXhiUlJrTW9SUkxaWWdQVGNwM0lEZXBPWTkwNllw?=
 =?utf-8?B?Q24vcFNhaHNsVDFYc1J0UTVQK3V1Zk83allHNzlMNFZvaTZqMnNXcWZJZk15?=
 =?utf-8?B?c1l4c3A4NC9CNThHTG5PdG53MHJPekE0bUs4SWFtbjNwbFhxcEhYbFU4d2s5?=
 =?utf-8?B?Z0FseEI4anNpazVxeVdDaDdJNmsyTFVSZnlNaUJRZGVxMzBoOGR0dUdycG85?=
 =?utf-8?B?a0NUMnpVVU0xYXk4QlQ0SDNVR3ppaEdqcGFFVXN4K3plYTdrNVVEbnF3bWtX?=
 =?utf-8?B?MFRtcWRZbUF5aW5TeU1Xd0xieFk1VlZTWFAxOWlJN1BpRWFGSDZ3VFFtb3ly?=
 =?utf-8?B?NW5wQm8zRHFIUDVXMTFCN1M0MjR3WW1SUExGTTcrM3NDazdSOThTMDlqbmc2?=
 =?utf-8?B?ZkM0WVEyM3V0dDk2L0kyb1NOQTI2elEzSDhscjJ1NmdLdldoKzNvOWlSekVH?=
 =?utf-8?B?R2laVXhtOWhHb3lUQjZJMzVWeU9RbnFCdkVVZFd6eU1lZ1lGZU5TM1o0Tm1N?=
 =?utf-8?B?SFBxdHF1K3pGU0hHMks1eW10TnZKN3U5dUdlVXVQK1VDNC9tY0lQZlJMQWhZ?=
 =?utf-8?B?WUpXbUJZbDhpaG92b2pzcGEyU1NDd2pNSktTVU1WanZwZmtYT1lTbU1mTXNG?=
 =?utf-8?B?dkJ2bUtreW9Vbm82K0M3eTJpaFFnNmQ3b1haUjd0Z29WdXdLbnIxSDlqWGRw?=
 =?utf-8?B?RkNlMXVrZ3Q0ZmRYY0VzTFU2V3ZaOStKMkg4MFYzZ2pRTWNOMmlqMkErUnRp?=
 =?utf-8?B?R1gwZk9wN3NwRTlxMllFS0ZuRXRHNnBZNUxaTjRpTFk3VXlHdG1nQm5RVXlM?=
 =?utf-8?B?ak92c2VyMzBUazdiUVEzSEtpWHV4dmVQYlN5L3IxeTZ1cFRQOFJ5OHI0VGtV?=
 =?utf-8?B?QjZ2Mk9PNUF0WkFuUVVhRUV3WjVSZldEcWpab2pKUVE0WW1pVDR0WmdhS2g4?=
 =?utf-8?B?TDRWQzhHNGpxRTBPQ3lYaXpLWFhucEt5bU0xWlMwQlZpWVNSQjh0YTVnK2dW?=
 =?utf-8?B?NGEyMjFpZXlpdUE5QmRXajcvSk15eFphejVxVjRzL0VPNjlmOGwycTV2UXRj?=
 =?utf-8?B?WDNuWGZmWXhBbzZ6bm1XR09uRXR0U1BXaTd5WlNQb012OTVOZ3ZlQmZPZ2VJ?=
 =?utf-8?B?blE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a119d6e-74f7-4eb0-9086-08dddfb3bf5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2025 06:35:25.8663
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YCnrn5jAooD2QKh1vC7mSPHT/h63Mi+P0voBLOWnwEMh9iEwErYK89nPy4oTjBXvjJ6e9zOxBxiWe9DX5e+VV3vnnLqDzohtBZAGarOMghU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12689

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDE5IEF1Z3VzdCAyMDI1IDE2OjExDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggMC80XSBBZGQgUlovRzNFIEdQVCBjbG9ja3MgYW5kIHJlc2V0cw0KPiANCj4gSGkgQmlqdSwN
Cj4gDQo+IE9uIFRodSwgMTQgQXVnIDIwMjUgYXQgMTQ6NDgsIEJpanUgPGJpanUuZGFzLmF1QGdt
YWlsLmNvbT4gd3JvdGU6DQo+ID4gRnJvbTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVz
YXMuY29tPg0KPiA+DQo+ID4gVGhlIFJaL0czRSBHUFQgSVAgaGFzIG11bHRpcGxlIGNsb2NrcyBh
bmQgcmVzZXRzLiBJdCBoYXMgYnVzIGFuZCBjb3JlDQo+ID4gY2xvY2tzLiBUaGUgYnVzIGNsb2Nr
IGlzIG1vZHVsZSBjbG9jayBhbmQgY29yZSBjbG9jayBpcyBzb3VyY2VkIGZyb20NCj4gPiB0aGUg
YnVzIGNsb2NrLiBTbyBhZGQgc3VwcG9ydCBmb3IgbW9kdWxlIGNsb2NrIGFzIHBhcmVudCByZXVz
aW5nIHRoZQ0KPiA+IGV4aXN0aW5nIHJ6djJoX2NwZ19maXhlZF9tb2Rfc3RhdHVzX2Nsa19yZWdp
c3RlcigpLg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHNlcmllcyENCj4gDQo+ID4gQmlqdSBEYXMg
KDQpOg0KPiA+ICAgY2xrOiByZW5lc2FzOiByenYyaDogUmVmYWN0b3INCj4gPiAgICAgcnp2Mmhf
Y3BnX2ZpeGVkX21vZF9zdGF0dXNfY2xrX3JlZ2lzdGVyKCkNCj4gPiAgIGNsazogcmVuZXNhczog
cnp2Mmg6IEFkZCBzdXBwb3J0IGZvciBwYXJlbnQgbW9kIGNsb2Nrcw0KPiA+ICAgZHQtYmluZGlu
Z3M6IGNsb2NrOiByZW5lc2FzLHI5YTA5ZzA0Ny1jcGc6IEFkZCBHUFQgY29yZSBjbG9ja3MNCj4g
PiAgIGNsazogcmVuZXNhczogcjlhMDlnMDQ3OiBBZGQgR1BUIGNsb2NrcyBhbmQgcmVzZXRzDQo+
IA0KPiBJIHRoaW5rIHlvdSBhcmUgb3ZlcmNvbXBsaWNhdGluZzogYWNjb3JkaW5nIHRvIHRoZSBj
bG9jayBzeXN0ZW0gZGlhZ3JhbSBhbmQgY2xvY2sgbGlzdCBzaGVldHMsDQo+IGdwdF9bMDFdX3Bj
bGtfc2ZyIGFuZCBncHRfWzAxXV9jbGtzX2dwdF9zZnIgYXJlIHJlYWxseSB0aGUgc2FtZSBjbG9j
a3MgKHRoZSBzYW1lIGlzIHRydWUgZm9yIHJzY2lfWzAtDQo+IDldX3BjbGsgYW5kIHJzY2lfWzAt
OV1fcGNsa19zZnIpLg0KDQpUaGFua3MgZm9yIGNvcnJlY3RpbmcgbWUuIEkgZ290IGNvbmZ1c2Vk
IHdpdGggQ0dDPUdQVF8wX3BjbGtfc2ZyIGZvciB0aGUgY29yZSBjbG9jaw0KdGhhdCBtYWRlIG1l
IHRvIGNvbXBsaWNhdGUgdGhlIGNsa3MuDQoNCj4gU28geW91IGNhbiBqdXN0IGRlc2NyaWJlIGdw
dF9bMDFdX3BjbGtfc2ZyIGFzIG5vcm1hbCBtb2R1bGUgY2xvY2tzLCBhbmQgdXNlIHRoZW0gZm9y
IGJvdGggdGhlIGNvcmUgYW5kDQo+IGJ1cyBibG9ja3MgaW4gRFQsIGUuZy4NCj4gDQo+ICAgICBj
bG9ja3MgPSA8JmNwZyBDUEdfTU9EIDB4MzE+LCA8JmNwZyBDUEdfTU9EIDB4MzE+Ow0KPiAgICAg
Y2xvY2stbmFtZXMgPSAiY29yZSIsICJidXMiOw0KPiANCj4gRG8geW91IGFncmVlPw0KDQpZZXMs
IEkgYWdyZWUuDQoNCkNoZWVycywNCkJpanUNCg0K

