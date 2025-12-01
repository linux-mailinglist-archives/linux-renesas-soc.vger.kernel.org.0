Return-Path: <linux-renesas-soc+bounces-25467-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D4CC97D3C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Dec 2025 15:21:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6AC9134399F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Dec 2025 14:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E0ED31A059;
	Mon,  1 Dec 2025 14:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="mEsDWGXd";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="mEsDWGXd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023073.outbound.protection.outlook.com [52.101.72.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7400C2C08AD;
	Mon,  1 Dec 2025 14:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.73
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764598896; cv=fail; b=Lq9A8ENuHmMuAn6vmsygRCVZKjSwX1GDQ8GbYh/e2zLcH9vXaLWZ9Oo4wM9gL4hbv2TKKsyHSbNrQTkKDEOsuSjAHfVhJelq6R2wMKO+t3UfZ2yjaWbzDY4NNTMXuIvP3dJBp/AkZs2bGD8vYD9xEzDhW2ZgbQAonNOCb5h/8ns=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764598896; c=relaxed/simple;
	bh=zebHVFWRfuv3JwyGA18lTqhhYJdqTFky5+MAdRvI+R0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DgVEjP1xGYNp2Lm6BG0r5yaBZ2kzdt2tEotQUbMQiQksxkegp2pwvxERJTQ1dwi/moruSiloTOG9YEuhpqS36RqcgBM7WplYgP+8oxZEnAcXGB2fZOJ4GalrX5ZXv8BFOMS/VRbqlcbjjA0jzoe0OtBIoc7u9Ysxk/XKQAs5D5U=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=mEsDWGXd; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=mEsDWGXd; arc=fail smtp.client-ip=52.101.72.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Y7sG7j188eecUFWsd5HkYlET4N0aBDLa+xI2ebBtwHs5uQswhMz/ux8Vh05DJzv8JxzZ7QDe6XSsFUkb5JovhkNpuA9x48rh9zAsp4P+oMq1TDV5K6/UbSbm58+BL3MMzFtJs6MKnAPrhlGiQ0C2EYcr0kT+NfVBUUMeZfdC6aAl9tBob4BKK3p9kGQGghe6FqJGXbgcT71GyDuAtwmu4eHokAXmd4NWqKHavsqdm7VnW5Gq9oHwmErK4yXJmxi9t5K2iAnL0MDQAV3u3b7qwlo4laVSi5v7hCnQ9InrOrwYVyf7srw2xflOo21+t6z2Tis2Lc6tpsCj/oa9ZMUzZQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zebHVFWRfuv3JwyGA18lTqhhYJdqTFky5+MAdRvI+R0=;
 b=qefCbDNqjEzo31O+rWf+kf/LRKpcJlz1dy0kSAecUmHSPDBSL0QT/CKCsALBURUYkTFxe5dlgLsRVgeKqG1sn8tS6bJxK/jzKzDWKLAS5AK+aQs0CDcYTwMBOSd2Hpb8ymXk52gQlTUwb7HgQyiEk0vW/xuKla2N9s2K/N1XDYzT8ACoPKUVdDBN7gCdOcERuBp4jmP/vQ+jJJU1x65YL733TVE12zDbR/6PTGT9dOD3tpswjvqtYvvbFJXBJlXFwhfkDGtlHL4cGSAbsjRQ9ynP2O41rHohJA2AXfLNWno5taCfzw+VOhnQzqIc3T8B9C/alPz2jwZGRQCWzwKvCg==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zebHVFWRfuv3JwyGA18lTqhhYJdqTFky5+MAdRvI+R0=;
 b=mEsDWGXdSUUI45bmLFSMGL2HpinvKMZZzKtb+M1v1oEWPW6Ta1YKEQ+TmWICLemS9n+VuzjL0nLt+2fr/zvhs7Kn5xHPX0vGuJvY8Jc3I0DoroOALtyA8j7acoiSioVTqYiyN7Jwxdm0c2CwWlWywI0io1JlxngIIWcdYeZ+Se0=
Received: from DUZPR01CA0024.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::11) by VI2PR04MB11002.eurprd04.prod.outlook.com
 (2603:10a6:800:280::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 14:21:29 +0000
Received: from DB5PEPF00014B88.eurprd02.prod.outlook.com
 (2603:10a6:10:46b:cafe::69) by DUZPR01CA0024.outlook.office365.com
 (2603:10a6:10:46b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 14:21:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB5PEPF00014B88.mail.protection.outlook.com (10.167.8.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Mon, 1 Dec 2025 14:21:29 +0000
Received: from emails-7126510-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-191.eu-west-1.compute.internal [10.20.5.191])
	by mta-outgoing-dlp-862-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id EB4E980138;
	Mon,  1 Dec 2025 14:21:28 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1764598888; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=zebHVFWRfuv3JwyGA18lTqhhYJdqTFky5+MAdRvI+R0=;
 b=D+Xlt6zTuepoRAUOB70SwKZ7Vp3g5+eLjmNobLOR46U/jV/LTVzMGFuhh8kDa1RVyGswh
 gAXR7ygzdlt7IS9MSaJgaNDcbcm4XgHvnltMJwor4Wo9I/yXTU+9EoAYzH82IwFpu/JpPfK
 EgqqhICZ5bZdaPZ48r90wW8mFGaV2Vo=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1764598888;
 b=j2298BqwftzBznbsuUekbxuK2wzm2yytJYUMLK73hjSwiZhd1LHe7NzDpnLw3FPeQO6To
 go6naYIko1/OzIL/eWpkn6k6vcXC+we6eiyf7+9ZLzKN7XW/z41ZOaJwsJOghR3Q3W9CUgu
 yBtkFBACwEFaZWzIzklwrWrsWUytWvk=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m8ACkc/eQFBXkuFdqAeFnWaAUK56i0rfEIVsXfDXipGl2fW8WV5CvtFeb8zujKuukjYcqHjcwfrz3HtbKHZRtvzfSS8Y8C14rFVqGitXzYHqn4TBYpzcrhkwdgQYmfo7ZLEMxdJS7Lm+A4RAa8DE//LiBE0JEEj7NoJyYz95MCJBCIcgRjjNfUiQ6VuVwNv5svGw5w/YtSGeYOEmQMcNnTvAvUNk6Z4M0pEhkrB5g+fueO8J/0BmtnwLm8j87FpNdNhVH6Whs/mdA9Ux21BHtyyRtIRJ/GfYzRQ0pTh61DR6AwU6Uu7g4SX5YJqNGRkawWzed40JxWRvMfjDhogkMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zebHVFWRfuv3JwyGA18lTqhhYJdqTFky5+MAdRvI+R0=;
 b=HxFVkjdXxXykazXhADvLbXcWOXEdf27ZH2ZfQxU0IYewed2ZDrZ+5kS7p2y+Sbj4c7Qk7t2qe++uK/BQUCMjQYNCfQNlVdKCOP3TPFk6mqn27EvSmS7G9tIN13KM2LDI0umdhpDQxAUhwR8qAY0SHa/tI7ftWg7MCMRKPky6yUcFgO+tydlw/oEjZ+HrQOasDx33D7R3jGDn+oF4j7ZIoee+Y6N3VqGUhU7tFp9VTcNWqUUvTtIrXE4AUQcJNqHERuZjreqQJapzIcN0B6tepJhgE0p8w0w34Fanp46+5PHGK0EH9zgcFxM4WkbtXwvaTP3EJFdTjGFYzlHvl4A0YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zebHVFWRfuv3JwyGA18lTqhhYJdqTFky5+MAdRvI+R0=;
 b=mEsDWGXdSUUI45bmLFSMGL2HpinvKMZZzKtb+M1v1oEWPW6Ta1YKEQ+TmWICLemS9n+VuzjL0nLt+2fr/zvhs7Kn5xHPX0vGuJvY8Jc3I0DoroOALtyA8j7acoiSioVTqYiyN7Jwxdm0c2CwWlWywI0io1JlxngIIWcdYeZ+Se0=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM9PR04MB8553.eurprd04.prod.outlook.com (2603:10a6:20b:434::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 14:21:19 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 14:21:19 +0000
From: Josua Mayer <josua@solid-run.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>
CC: Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan Shhady
	<yazan.shhady@solid-run.com>, Jon Nettleton <jon@solid-run.com>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] mmc: host: renesas_sdhi_core: support configuring
 an optional sdio mux
Thread-Topic: [PATCH v2 0/2] mmc: host: renesas_sdhi_core: support configuring
 an optional sdio mux
Thread-Index: AQHcYr5hLWwrzyX6FEuhC9gonmX5M7UMxC8AgAAR2AA=
Date: Mon, 1 Dec 2025 14:21:18 +0000
Message-ID: <af4da0ac-a6f3-4248-9050-537a4ecf7711@solid-run.com>
References: <20251201-rz-sdio-mux-v2-0-bcb581b88dd7@solid-run.com>
 <TY3PR01MB11346F6A9485A334E8BAAD0E586DBA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB11346F6A9485A334E8BAAD0E586DBA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-traffictypediagnostic:
	PAXPR04MB8749:EE_|AM9PR04MB8553:EE_|DB5PEPF00014B88:EE_|VI2PR04MB11002:EE_
X-MS-Office365-Filtering-Correlation-Id: b0cfe7d8-5e92-45ed-8d97-08de30e4eb4a
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?b2dVajBvNUZVMjRpWGhIbUlKT245YlF2SjEvL1BlQjI3T1psd1ZhL2dJSkpk?=
 =?utf-8?B?VU9hQytxdG9iWktPeGQrZ0Z6OWZwZy9nOGNqSWFMVjlzUU9pcHcyRldJY3lx?=
 =?utf-8?B?K3lxd1VVM1htQVNSTHo3SUE3OFdJYXZNdjVReSttTEJIQncrWTFFdFpFeVhG?=
 =?utf-8?B?YWdiYnpFVm91SVloY1Y4VW1xQld3ank4NTBZRzdhTHR1VS9RL1RqTjVjQXZ1?=
 =?utf-8?B?VDhUZ0wraEVtd3M2QWVZWFM2V1g5QVl6MzBmbGNka2dmRitUSnFYZmJTOVVV?=
 =?utf-8?B?cldUVUI2T3pLN2w4UW9hbFRvQ3dmSUxoU29ZdXVMNmtMcUdsTXY5dEdERXNs?=
 =?utf-8?B?d21qZHZaTmF5bW9JSjREeS85QkluamljZzlkSTl0MitqVTFab2YydDNzT3Jx?=
 =?utf-8?B?TUdvT0k2ckdPbE41OFV6VjNsRU56Y1ZRa29kWG0zREx4TjJ6VlV3RHZEWm1C?=
 =?utf-8?B?VmNtdWh0TklkcmwwSTVNMWpDYXVyOU85RlJ5UTNpYzByQTcyUU9xTk9IRUV0?=
 =?utf-8?B?UFpxb0pEdkhFK2hUdk1tWjdDa2lJenhYS3BqaENGeFdPQko4czU2d0gwNWpJ?=
 =?utf-8?B?eDV1ZjhWRmJPY2ZVRXlIWjFKSG1hcW5mWUVHVkY5bGRBUmpnRTdWcXl1V1lY?=
 =?utf-8?B?VFFZdS9uRytzSjRHVEJlSmlvMy9ueFFSc1d3QVRkeEp6NDhwMXhMNkdIWTJL?=
 =?utf-8?B?RmNvd2ZXNHF3WTlOZnpjR1ptNGhXT2x2NnFtRTRpUGZCOXVSQVJEeG0vWDl5?=
 =?utf-8?B?VGpOZ0tNeHMxSDM3Zm54Znk2UnVabjI2OFFKSkJaNndRQVpMRzhLdkJwbVBn?=
 =?utf-8?B?eGtBOHdoSWFpTnR0UTJLU0llZVJ6a1E1c2RudFNRUnM4S29yVHVpV3RjaWpi?=
 =?utf-8?B?aUpBK2htWnlFYzlySjFycGZPKzlaS3QvOGx0Z2pQa21yOXZaMmRnYU9DUTBR?=
 =?utf-8?B?bVlTT0kyNXlFaGo3RVNCemduNDdUOGRqYUlaYXlqWC9DaXcrbXY4UFRhcGF2?=
 =?utf-8?B?RGpOcjF2NVJvV3p5QVdsbHlURlhYNmxreTMrSHBUN3RXMis4Y2w4amxlSTB3?=
 =?utf-8?B?Q29vMHFNUldXdER4azVBcUJiWmFheXgrL1I0MmM2VW5BZENSakZUR09BTTdM?=
 =?utf-8?B?QlRwYThrN2pid3RicEkxbkg3L29UTnpuYWtyQ1E0bWdGMWliZCt3UUNNUTJU?=
 =?utf-8?B?R05JeHJ4dU1OM1dRUXR6d2YwM2grUHR5eUsrV0hBdEpzUFVyLzFBVXl0V2xR?=
 =?utf-8?B?dVJSRzBRQ2tnQWZrZVVhVEpzL1FGNGpocWNuTk9MWktxemlCY1FNd1JWYk5E?=
 =?utf-8?B?TXVGOS9ZV1p6OWVteTFCdkJrdlhUWnlXZFZlSmloU2kyQ3REVWROaDhocThG?=
 =?utf-8?B?YW1kR3oxd2piU21CNzJpc2daQUliYXdnRnpxNUpYSEV4YzJ3c1g4b1J6OEtx?=
 =?utf-8?B?K3F3VHhkT2xyMVN1c3pMZndkQUdONjh6QjR2Y1JaR2pjNFFzckoySVZSMFYr?=
 =?utf-8?B?M1NkYXMreE4yYU5SbHR6WURRYjB6aHI2SVlBM1Z0TElGOFpISnV4UjR5QUtM?=
 =?utf-8?B?MWtxQ2NpTXZnNGkzbmVaQWQzelo3WFVvQm56cjVENUM4ZC96dk1VdjFENzVG?=
 =?utf-8?B?Z0JWNkpxVXAwSnpoblNHWGpwRTRLdXdhRnZ2Zk5RU0UzbnlvYThPUnVoOUZJ?=
 =?utf-8?B?ck9INmNFZk1lajJEK1Y2NGpxSFk2M1VObjJpYmtCaDBCc1VnUUhWcUNnU0NY?=
 =?utf-8?B?Tk1NdjdkWk5HUTBURVhPcEo4OGsxOFFkNjVVZEoyZ2xPNTZmcVZ2cFZPMTRV?=
 =?utf-8?B?bmNQYUZvbUMzNjZ3WHN3eVZwUHZZNHNBbjRaMGEycEhUVWFDUFZ1N0xocGNX?=
 =?utf-8?B?blBUa1R0d0hEdWVxdjVQb3BJbFdGaUJYRGl1WVpCa2NvWDRML1gyZzgwTnVT?=
 =?utf-8?B?RVNGMGdCdkhvMFh4R3pWSGloQ25OczZubGRvZXVQTG03bE1md0N5RVd2K3lN?=
 =?utf-8?B?MzJac1l4UUNDaVpjWVpoTi90OTFHUHY5ZVIwWTR3TzhORmpneUNBdVNGcHVH?=
 =?utf-8?Q?s7YZm8?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A8B3BDBE6A9684592AF15AB0931AC93@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8553
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: c18793e5e0a44cfbb5b77c1fcb4b59b2:solidrun,office365_emails,sent,inline:a16b318bcca0cf807b7ab5a932f15c74
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bc4c9cdd-3be4-4cf3-7914-08de30e4e534
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|35042699022|82310400026|14060799003|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R0hBa0ZCbFJnMGt2S0FtUVNZTWR6akY2VXNmRXo3cFQ4Z0I0akFqV1pNUmFh?=
 =?utf-8?B?cnJVQXoybjBEMXcyVkI2SnY5alJDdzBIb3BzVlkxWXZBYWdaZG1ONWEreko1?=
 =?utf-8?B?a3huTTFXQlhVdTFnbWl1UTRKNVlubkZJRXFXcTNHYUNsMDlmZGkxMUt3anBu?=
 =?utf-8?B?WU1xM3BqRVo4SGhsaHBUY3c2bDN3SlB6SWFxMGNycTJ4NmwzODExd1dVRldP?=
 =?utf-8?B?bHo0bk95Wi8wOVEzMVMrNHdOL3BnOTVNRytENFlhVHBuck9JMXVKbndVakly?=
 =?utf-8?B?dHF4c3BsNmRJdE5EbCtqU0prVTVqaTZtZWZNcUl5VFFVMkNnWFZCRnhnakhV?=
 =?utf-8?B?ajZtR1lFcmR0WXE0SEd6RWp3UHFnV0pKbkZDOEhsOEtZZ09sWWxFb1ovVXFz?=
 =?utf-8?B?b1RhTXlMS1Z3K2xRcnc0eHZGRGlFUEo1ZXRlMUVJZ0pBK2VHR0xCNFQzMWh0?=
 =?utf-8?B?YjN3aEFoTVNLOTJCeFZVVUU0L080TUFXUUJjQTFDMkFwdVZrQkxlUkRCRTBG?=
 =?utf-8?B?RFlSVUdBaVBPcjZCNUJPb1BoSVptazl2bTZpMWN6SDUzVFFmVGpwdmVIQkVa?=
 =?utf-8?B?Y1QwZ2xoTE5ZNnhEYU54NU51SEpMdWtRQldMblVobm5sVXFyeWJsMUIzRlNv?=
 =?utf-8?B?WFE3ZmhUOTZRV3g5ZHhGdXFtbEJHYmtCWUhZRC9NdGV2NVpIakRTSGFuOTEw?=
 =?utf-8?B?TGEvR2VKeGFHN0hFbFlxYTJLR3NOK0MyeFpGSUhjdzh0dGZaaDNURGdpNmY0?=
 =?utf-8?B?TWxHdTN5ZGpqUktaRngyYmJORXRSS25CSUdWamYwOHdtMmt3SjlsTVdEbkpx?=
 =?utf-8?B?b1lTd1VYTmIxRVJCcldYN0wyanpEb04vSUpJZXNjVWZBSStRVHN0Z25ST0N4?=
 =?utf-8?B?SFd5Y2RCNWMrKzZLMWNEMFlKdGF4OWxEa3ltdEI1TmZoY3dsNUp6dGJXTGpF?=
 =?utf-8?B?TFBaVitJMmdyWkd4OEh1R2RqTUlsb2cwNEZHZnRYU2J0dGVucExPSnBLeWMx?=
 =?utf-8?B?ZlNnY1lJNnZyd2tZTVBEREJERXQwYnNQdGgzRzBnQ25obk1SdkNhUml3RU5a?=
 =?utf-8?B?LzM4NG9hTkw4K0hHMEVpa2NlS1oyMEk3OVVYQW44dXVJYytEWm9mM3NvUXFr?=
 =?utf-8?B?VnhGamp1VWtVekdIcFdmK1V6aXIvK1ZJQzAxckRjVDVvMk1yYmlCemR6T2xX?=
 =?utf-8?B?SzNac0Q3VlVwYzU1MFNOS1UyL3ZkcXVLcFJCcVAwRUhETzJnWUNZVkR5dmhX?=
 =?utf-8?B?aHpVSXJrbnhOTFJPVDV1RXR4eG5lK09rS1d4WUFHQjhaYmtqOXpsNFl0aEVX?=
 =?utf-8?B?VUlUcmwrb1JUSVg0YysxMFNNSXlYeFpwOENicWVndTRqUDJCZXUzdjlReXRr?=
 =?utf-8?B?Qm9YY1JkQm8wL2VaTmYxZ091bDRxeks2UHdkdmd0d0R0S2hTZWtvOHhyZy9J?=
 =?utf-8?B?NFhDOFBCWTIrcDlYNDZRbU1jRWxSdlIwMm1qa1FtdW1MNXNva0kvWHFaVmV0?=
 =?utf-8?B?Z1FVd0ZUMmFoRUkvd0JxTlJab0FVUU5iaXhsdzdYNmRpVjZERGF6WFhLc1lG?=
 =?utf-8?B?Smh3OU80cG10U0dNMzM1TWpOMXJJZkNRMytSQWw4UzU3ZDdPYkF4UVVnMzlo?=
 =?utf-8?B?a21OOHBtd1VLa2ROSURkL1hKRTZicWtVNGFTSitscmdZY3R0V0pxdTF5Sk5L?=
 =?utf-8?B?bUdWY3ZFSTlSQmE2dzZZL0JqakpqUWpydmFPM3RVVHpYK3lHUUFkZXk2eTFt?=
 =?utf-8?B?bDVHajRKU20rTmhOb1RQVGJwU21hbkY5ZTNPTDBVTzFTa295bWxPdEphWFVI?=
 =?utf-8?B?d0gxakNSS1ZaUGZuTG1jT2pRT2ZzQXUxeDdJT2FNM200REdiTkRSSVYyYmZI?=
 =?utf-8?B?YURDYjVUYVZMTTducGZpUlppNVpCVlFzTW1UMTZkVFhOS0JCa00yaVh1TGFj?=
 =?utf-8?B?bFJwbnBaL1grR2FURFg3dEdPV2p4WXFzM0Y3RzlZQnM4RDdTZ204Y1dUaWUw?=
 =?utf-8?B?Z2Z0NFgyeHFSbk1HajRsbHBNRVIrMFVjWWlVSVhCSlN1WW1yc25TcStoa2FB?=
 =?utf-8?B?cjdIY1hiNE0wQWl3SnhEeFhmclBlK0lXL0FQUT09?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(7416014)(35042699022)(82310400026)(14060799003)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 14:21:29.0961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0cfe7d8-5e92-45ed-8d97-08de30e4eb4a
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11002

QW0gMDEuMTIuMjUgdW0gMTQ6MTcgc2NocmllYiBCaWp1IERhczoNCj4NCj4+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+PiBGcm9tOiBKb3N1YSBNYXllciA8am9zdWFAc29saWQtcnVuLmNv
bT4NCj4+IFNlbnQ6IDAxIERlY2VtYmVyIDIwMjUgMTI6MzENCj4+IFN1YmplY3Q6IFtQQVRDSCB2
MiAwLzJdIG1tYzogaG9zdDogcmVuZXNhc19zZGhpX2NvcmU6IHN1cHBvcnQgY29uZmlndXJpbmcg
YW4gb3B0aW9uYWwgc2RpbyBtdXgNCj4+DQo+PiBTb21lIFJlbmVzYXMgU29DIGJhc2VkIGJvYXJk
cyBtdXggU0QgYW5kIGVNTUMgb24gYSBzaW5nbGUgc2RpbyBjb250cm9sbGVyLCBleHBvc2luZyB1
c2VyIGNvbnRyb2wgYnkNCj4+IGRpcCBzd2l0Y2ggYW5kIHNvZnR3YXJlIGNvbnRyb2wgYnkgZ3Bp
by4NCj4+DQo+PiBQdXJwb3NlIGlzIHRvIHNpbXBsaWZ5IGRldmVsb3BtZW50IGFuZCBwcm92aXNp
b25pbmcgYnkgc2VsZWN0aW5nIGJvb3QgbWVkaWEgYXQgcG93ZXItb24sIGFuZCBhZ2Fpbg0KPj4g
YmVmb3JlIHN0YXJ0aW5nIGxpbnV4Lg0KPiBEb2VzIGl0IG1lYW4sIHlvdSBib290IHdpdGggZVNE
IG1vZGUsIGJvb3QgdGhlIGxpbnV4IHdpdGggU0QgbW9kZSBhbmQgZmxhc2ggdGhlIGltYWdlIHRv
IGVNTUM/Pw0KPg0KPiBhbmQgdGhlbiwgc3dpdGNoIHRvIGVNTUMgYm9vdCBtb2RlIGFuZCBib290
IGV2ZXJ5dGhpbmcgZnJvbSBlTU1DPz8NCj4NCj4NCj4gT3INCj4NCj4gYm9vdCB3aXRoIGVTRCBt
b2RlLCBmbGFzaCBlbW1jIGltYWdlcyBhdCBpbml0cmFtZnMgbGV2ZWwvdS1ib290IGxldmVsDQo+
DQo+IGFuZCB0aGVuLCBzd2l0Y2ggdG8gZU1NQyBib290IG1vZGUgYW5kIGJvb3QgZXZlcnl0aGlu
ZyBmcm9tIGVNTUM/Pw0KDQpUaGUgbGF0dGVyLg0KDQpESVAgc3dpdGNoIGRlY2lkZXMgYm9vdGxv
YWRlciBzdGFydGluZyBmcm9tIGVNTUMgb3IgU0QuDQpUaGVuIHUtYm9vdCBoYXMgY29tcGxldGUg
ZnJlZWRvbS4NCg0KRmluYWxseSBVLUJvb3Qgc2hhbGwgbG9hZCAoYW5kIHBhdGNoKSBEVEIgZm9y
IGVpdGhlciBlTU1DIG9yIFNELg0KUmVnYXJkbGVzcyBvZiB3aGV0aGVyIHJvb3RmcyBpcyBpbml0
cmFtZnMgb3IgcGh5c2ljYWwgbWVkaWEuDQo=


