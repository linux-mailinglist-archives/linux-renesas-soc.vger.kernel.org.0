Return-Path: <linux-renesas-soc+bounces-25435-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AFBC972B6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Dec 2025 13:02:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7152B4E12E3
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Dec 2025 12:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96FE82F6597;
	Mon,  1 Dec 2025 12:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="jLZfeeFH";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="jLZfeeFH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023097.outbound.protection.outlook.com [40.107.162.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7035B21A;
	Mon,  1 Dec 2025 12:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.97
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764590570; cv=fail; b=lIfBoW+SoWZP1ymZvkYdZzFhMfxtix72wKgZ+L0qauXyK0JmQf12RdH9iDxPMoBl+LVSUUhWkRwhpTC+IRENqm6Tngx9bST97L6be/U3PDjcATx4BPl+M1S/W1cPM8TG6kRdkuyyGfhmpIoe6+LOWADMkNMmmKeFLNX+0ro6PFs=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764590570; c=relaxed/simple;
	bh=BKNfswUKxrGEsbNRu0/sgRe30Z5Nr5ndGBia0GJNxX0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EshJBwOB162sBDMHQXaJsMOqOtm2Bqx8IZeMigZn/WjfChSuXSA2ItBB9R/MUiFDJazoCvLi3m18FAA9wZReM2DGIdmLmFW3FFJZrAm40MLvexuYfiq+/8LkYdKWS0SMmeWoFcEK6UOXmQ6EUiMU3JklOuvRJziXm/f5Mn42JnA=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=jLZfeeFH; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=jLZfeeFH; arc=fail smtp.client-ip=40.107.162.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BG5iQp3HVY0Vh1atJD1FgaE4pJSIYqDK+KP+ahlQbT0R2z8maDwQ/FcOf+I2lanowZ3W6f65hVFU8HKRWbXdd/Bf5k8IZdMwvWQRGYRipsxaQyMrTKSK1wZgj4lZImUS1uu8rGLQ4ewt9VzAssgplEv+bSAFyDg2+v9BPUVj8qTCD2UOaONoAmU31Txt+ra933ZItLp9frW6irR0fMDjQnGs0Is/v+01un+nf7DcuoS7D2OWHCWxM2Tmy0V9h1vhKCDv06IiHbC2yZTObAudUiztG082OPfj+ZKfZyt/Q+ts1UDeJDqemLn8XHkuUPWjxTXE0qnAHt87TKvjSyVeMQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BKNfswUKxrGEsbNRu0/sgRe30Z5Nr5ndGBia0GJNxX0=;
 b=j+OwowcCRIlVq0JEcu5Rx5RBBncAOKA5f163FbQupCHCdFPAAlWWFtBXYexWTwch1lUpqSxfwuMbRkTlx2ETNJx3GfnHm+UhNZ4ub7xW5D3H715RtXcu2DN3OdwhGYyswurF2LQmuiuxy4B6VTMxCxj9MJo7lqfsOTm/6KUtjzKFfiAAzKGVnIdliSpBA8yysCW8svRkjYfilKubDswROkcICn60XFrR5OLZs6Qrc3nNzC5lqq4mrQ216GaYIppV8GpTLUEiour9ioN5ENEvsxjyZX9biM5m+QvAPsEdgeepQ48Vr/GcDNzph/gtj7v6Bxb56gp1aqU2yRXEVpWKlw==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=glider.be smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BKNfswUKxrGEsbNRu0/sgRe30Z5Nr5ndGBia0GJNxX0=;
 b=jLZfeeFHOzcXonTfLsQsgo0SR9Pnk5wWATUGnrImQTdrBKjBSi9Qij6jG7q0JYZTToYX4Ae5xufgM4alCA4NU9pkQ9+mSlOiX7DOY6do0kAZ7C73WTU2VTC5rsdHiWzjHYPvraA1tB5PftBHlevjFGcD5fPStJI62wjERU2KThw=
Received: from DU7P194CA0024.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::28)
 by GVXPR04MB10490.eurprd04.prod.outlook.com (2603:10a6:150:1e2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 12:02:42 +0000
Received: from DB1PEPF000509E4.eurprd03.prod.outlook.com
 (2603:10a6:10:553:cafe::f2) by DU7P194CA0024.outlook.office365.com
 (2603:10a6:10:553::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 12:02:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF000509E4.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Mon, 1 Dec 2025 12:02:40 +0000
Received: from emails-8377534-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-191.eu-west-1.compute.internal [10.20.5.191])
	by mta-outgoing-dlp-141-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 160B980134;
	Mon,  1 Dec 2025 12:02:40 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1764590560; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=BKNfswUKxrGEsbNRu0/sgRe30Z5Nr5ndGBia0GJNxX0=;
 b=VXGEWTMa/iDX3EG96dHW/8QWqwOxp3dKkANiflpCRzvzugWp3LQpeNIN3aM5PLvLk8a/A
 ax2sfwRH3zFq25Zc+pUlXEq5wCl44uUS69pHjvBK/qb0gY4s1tLzxrP7JuuUh6OxhKLFA4U
 bQSCISqUE3dBtCJ85tzvog99YfhcAbA=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1764590560;
 b=dC18Za+E5Pc5QtP+VLpFUya6V3QqOOT1fv7BZiKrrBUYumLgKuX2iwOYWz9L5Iu5Tnrsc
 KQk7Cr4k4E196GXDD4ng5Y0YKivTn1aSkSMcFkf27hp1RtHg2GV2+vvRRihfk+2Gh3xJ0aR
 OyUaa27TCtCwhupqOVp0cV12SOYvV6I=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ltdKJ9fdrjPIiFGan7TOM6ff70qXq5vWpkndRzr2hYDyzGWQJd8+eCIn0mcnfycS3T07NZ9sg5TLjgloyzOGZUHetnLvoB/bHEPkbA3PWrZ9jPpVkUIYBH3jEo7oNl0AxQaX2GxzajweH/uFzMNDvPdhvtinEdGCaNvkuOxqanab4cVCwlbITajoss2n8AEeUwuSxYk+R+O1r1LNOlsgQErKWqfYMk/dZuio3dQ70YQ0XTgY1Fw8EL/AnEWNIMy0J7u9RJYevS7B147W69NU4x7cNyLTzQqt4WOZi/HMr8uI+4gcP/OKQ5DZyA6K2C+bmSg1bzp9dD8nAGnWELSi6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BKNfswUKxrGEsbNRu0/sgRe30Z5Nr5ndGBia0GJNxX0=;
 b=tKwpstbGUA5ZUROkJwlC3kURI7dAGsLMEwNINyxQlcWDduX7fwXg9bugwfATwHrBMT7CR2GqtbEzIp10gw4bTggYO3vIad9H/rqJQT8V3ODaK3vAJ/ST+d87LU1J0vqDP/dU/GwJE2LEnwF/703om/67qSHdFtldCD+pZ/QibFz6C2uUfU/i7eTlu9LCQkbjyGyXRTx2At6OrSrg51lZSGGSy+zEXnpoRN2aI1hKh2Tt+pOn2JTEQwcDdWli2gWMbKk8OTH5H+wAFlUB8HYzQ/GIVihQpRK51aGQ1/7SkrQp8EfcMSp1Re2rNk9/ht1Ar8oAeGYXFtLIuod0VOXNQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BKNfswUKxrGEsbNRu0/sgRe30Z5Nr5ndGBia0GJNxX0=;
 b=jLZfeeFHOzcXonTfLsQsgo0SR9Pnk5wWATUGnrImQTdrBKjBSi9Qij6jG7q0JYZTToYX4Ae5xufgM4alCA4NU9pkQ9+mSlOiX7DOY6do0kAZ7C73WTU2VTC5rsdHiWzjHYPvraA1tB5PftBHlevjFGcD5fPStJI62wjERU2KThw=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DU4PR04MB11410.eurprd04.prod.outlook.com (2603:10a6:10:5cc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 12:02:30 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 12:02:30 +0000
From: Josua Mayer <josua@solid-run.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>
CC: Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan Shhady
	<yazan.shhady@solid-run.com>, Jon Nettleton <jon@solid-run.com>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: mmc: renesas,sdhi: Add mux-states
 property
Thread-Topic: [PATCH 1/2] dt-bindings: mmc: renesas,sdhi: Add mux-states
 property
Thread-Index: AQHcYIJJKL/cyVts3EOroyH4FLJCO7UK4/aAgAHPwIA=
Date: Mon, 1 Dec 2025 12:02:30 +0000
Message-ID: <c905c987-59b7-4c31-978b-52212ebe9767@solid-run.com>
References: <20251128-rz-sdio-mux-v1-0-1ede318d160f@solid-run.com>
 <20251128-rz-sdio-mux-v1-1-1ede318d160f@solid-run.com>
 <2080db04-9845-4193-8dd9-7bb84894815b@kernel.org>
In-Reply-To: <2080db04-9845-4193-8dd9-7bb84894815b@kernel.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-traffictypediagnostic:
	PAXPR04MB8749:EE_|DU4PR04MB11410:EE_|DB1PEPF000509E4:EE_|GVXPR04MB10490:EE_
X-MS-Office365-Filtering-Correlation-Id: ed5a00aa-0dd0-4483-54de-08de30d186ed
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?SWliRnZva2xNdHFDTmZPUkVnbVRIOTZBbDRTYkYzalZaSngwQW5rU0I5Mnk5?=
 =?utf-8?B?NjhKMDRmM29XNFNhSTNSOVJ3a2JEQXd6NUNjOE1rOTNURGZ6UUlYcENjb0xv?=
 =?utf-8?B?RTFRdXRqNms3Z2RNSjhPNUx3Zm8yNTNCcDJOWjhUQm5oMlVkU1N2Nmt5OERr?=
 =?utf-8?B?c3VsUStlL2pxWXdRL3BORWtRZXdJZ3JxcndxQ1prY3BHNVprSmxqMUYrck9J?=
 =?utf-8?B?MzZqbmFEcFVJL0Y3L3crc0pxOHhhbFFscTNJa2lYWWlkSG9Rc0xUL2RFc3VY?=
 =?utf-8?B?SEl1Zng2bHRBMTFSK0tOdDY4T05uQm4vYmFBbXJCamNucG9QU1ZMd0JMK2pk?=
 =?utf-8?B?TktZRG5abzRmcVdNWFVLQnQ5dkt0L1g5UkhvdzllUEVsaTFOSzlTdjBOU3JN?=
 =?utf-8?B?WjI2VGhDVUtKdUlKdVRGWUhqVytDSk1HYzdoclBGYkRMNVVKa3lDallKcUJk?=
 =?utf-8?B?Q1lhN2xjdVQ5MVYvVHBmRUFpb2JwMGNrTmRqSnMxSVN5MGNjM0l1dDczTEFk?=
 =?utf-8?B?a2FVQ0xad0V6MW92bU9nMGJoVSt3MzhEOWtVSE9zQzZFc25jeC9CckxDQVBH?=
 =?utf-8?B?YXVKUEh5cjlDYlNCci9IL3pnTUpxeFRtNU1uU2hPbWlQZ3kzNzNySHVxOXZy?=
 =?utf-8?B?Ym5kOWdPWWdhZ25PUCtUNTZqY0txakZtZzhXVnRKY1NSRCtiZVF4QzRtc0xD?=
 =?utf-8?B?d0ZNWUJRcjgwVTM4QkZRZXZ3OCtlWGtIZkNlNkJjS0RPVXFrZGsrbGVaTUdm?=
 =?utf-8?B?TEs4RkJQSkViZVhCbGQ4REhiNDVBRFJNaEsySVlTTG9hUThVS00zQkNJTzdJ?=
 =?utf-8?B?dWl5VmptUStKU1EwNG9CSUFpUXYwUStTM0NuSFRLOGw5UFBXMk93Q21wRFVB?=
 =?utf-8?B?QVZDNjMzcjVnbHk1bkhNKzF0QW0xT0E4YmtLK1M3WjJ1SkkzSW9zOTR3Ti9v?=
 =?utf-8?B?WFBLL3RldDYzNFJ2UmEvdk5FMFdMdUlOdHhFMlU0cVRDRTVwdFl5OHc1QVZI?=
 =?utf-8?B?SFNRd3RCLzZpbURQSkVNWVl3Qy9WcnZoOXVzc3kwNDJOUUU2ZlJNMmorcWwx?=
 =?utf-8?B?dTRPbmp1aVQxNkVmRER2OTJQMk9VblFKdEhLSW5KeTF5S1BFSHhLS1k2Q29Y?=
 =?utf-8?B?R1RVTFlwZXhQb2NZWDBQQXVCYUM2OWZGaWhsTzVuaVNZSTVkckJlZDBEdWNp?=
 =?utf-8?B?WXFlK1pVcE5pS21KZkh3cElJc1hGQnB3bWMxRDQ0bEpIQjZiZk5MenJsQS9r?=
 =?utf-8?B?SkRId1ZsQWZqalJwamNDNzRObDYzYWplSHZBVDFadGF4b2FPZTN3cU45S1Vt?=
 =?utf-8?B?dm1aeGIwME9nRTZWcEZYcUMweDhyV2hMTHBEaFV4U3V5bTRza3h4M0xTcjRh?=
 =?utf-8?B?TTBlRFhHdHZTZkdZWFF3YnExTmpEUVIzOEdlT3pNRDd4elFUUjB2bTNrcFd1?=
 =?utf-8?B?SklVYzZIaEdoQURwbisxWmg0dkhTT1JXZjd3WEVUREwwak1hZTlib3FWZkxx?=
 =?utf-8?B?QnVyTW0wL2dQaGNCaVFibDZuVWtqSWgxdmE2MnVrMU5qcG95T3dnNlpZR2hl?=
 =?utf-8?B?VW8xMk9vTWZiRnhubkx3Qm92OHJNbmZJMkQreGdCYlQxWmk4dHQ0aktzaFZz?=
 =?utf-8?B?aDg3bEVVRXFhM0l3bmVSOG5iWWZQSE5oT1c0d0Z1a1FDVG5Ja3VzSlpSNDZZ?=
 =?utf-8?B?V3ZkMWo5OEI3TjUvcXFaZUhTTE5hN1ZjSlcvVVJhMWxzc1pZMkxuM29TTGFy?=
 =?utf-8?B?K3g4U09xNW1kaHpHdTRnSnhvMzNmUEUrcWIyUnNCbUcxWXRzVVhzNzdKT1R4?=
 =?utf-8?B?UXFqTlhkaE5OU0FPN1ZrcjkwSVhtaldzQ043bUZvSEpMeVI3UTh4UGZ3RU5I?=
 =?utf-8?B?VGo5RS9uSW8rcTBlQkRiQmJ5OTNwTU1wbDByS3Z5c08xWCtyREl1WjNuYlZt?=
 =?utf-8?B?Q2ZZUWpnZ0JhY3MrdDNWb0dCU1Q4aEVjQ3FjNDVKbVFOTTdYc2FKYkFZLzJS?=
 =?utf-8?B?MUdMaFZmMWI5a2EwTEFSRzdDVVJLVzFlc0pxSkJQUWxMWWZGWXBjcGdBY1Js?=
 =?utf-8?Q?9QAU51?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C26935A2D81F3A4598062D043E8E5C0D@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11410
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 0461faf4528e4920b06214ae79a53d8e:solidrun,office365_emails,sent,inline:d43007b067a6b00d5ca3784192c32722
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a8d88c60-6944-4e9d-41bf-08de30d180f1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|14060799003|1800799024|376014|35042699022|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RFNsMTFIdlhUNWs1TWtiSzFkOFF3OUhNYnNsZ3VLMVZZSFdJbFhhS1kyMGJ3?=
 =?utf-8?B?MVc2d0pvTkpjNFRmUVVSR1R3UXZSWDE1NURFV25BUmxLOHFJbTJqYmw1T084?=
 =?utf-8?B?YjJRdmZtTXhWM2hPZ0ZsV3pYcHFsMEhhcjhGalVXMjdPZzJ5eDdSWlp5N00x?=
 =?utf-8?B?a3ZOQldtZmM3aEdVT01qbGlFb3N6d3l0MGM5TXIwTmlSbWZCSkx3M01XWFVF?=
 =?utf-8?B?ZFZ5NzE4dTNkMmtmSHBjemUrb29Kd0pvWmxjeExCYm9iQ3JCSDNiTC9pZFJr?=
 =?utf-8?B?aFJJbXBhcHJ4TTlGSVBFdkxzVUpxbWI0K2NvMlZHVXNmYVFUdG9GeTRiN3BG?=
 =?utf-8?B?SHBsMU9NSndidGdKSXBvdkpHbDQyWmZINENsSDAwYTFoNDNmdlYyeEZwcElO?=
 =?utf-8?B?R3pHaUxuL3lpMUFHWFVucWFYRkdocWIyRVpzbnRiZk5LOWpyS1ZIL1UrUkxi?=
 =?utf-8?B?b2JXQytaSzIwQmtTTWdYdVEzS1gyU012MGJLNlRsKzhNK1V4TW83NjRkcEJV?=
 =?utf-8?B?TkxYMlJqUTdnUy9HM2I5VnQ4aUo0dHkvb3hjd0xYRllVT1lFMUNIcVZaenZh?=
 =?utf-8?B?aThuVFQ4M0RrcEp3eStyZ010YTNINnIvT2M2VUpldXRReGx6NlhXMnFweDRQ?=
 =?utf-8?B?ZnF0ZFY5SVgrVnJlck1WM3FIa2RobStKNCtTejh5U0JKb1lMZTY5eXROYit2?=
 =?utf-8?B?Y2YyNEE3Vkc1TVNGZWw3c1dzTE9MVE56YjFjRnpKd1l3UFNHb1QwQ0R6UVRH?=
 =?utf-8?B?L0JRSHBMS0gvVWVTdU5KYkFGMnUzWlBIUlFFc1lBbkxWNDJBeC9IZEk3ZWEv?=
 =?utf-8?B?UnBEREFNendSaWZSZS9kNHJIb21QMk1VZEZtemMyUEJocWxvM3I3RTdjSXo0?=
 =?utf-8?B?Q3lVTjFvNnJac3lwK2RaMmQ2RGxKYlFFK0lCOUZJZEplVlltT3BNWHVYaUEy?=
 =?utf-8?B?amdrNEtQaWdQVzRManlKcEhMaEJTS2ZSckZuNnZxOUFTT1l4V2hKVjliZlRU?=
 =?utf-8?B?TDdzWDFxQlJ0eTh0OWpDSWJNaUpyY3JySkF1TDcwVDQ5aEdacnV3cDc4bEx5?=
 =?utf-8?B?eC9JNTZJZ1FvNHVvWHBVaURHYXYwUmtpaFNmeTJEQmphUENGUE1EVkFuNmVj?=
 =?utf-8?B?UDF3Y1hsZkozVnVIVDdaYnNETXhmdXlSd05HK2xkYnN0QTJkdjRKamgrcFFi?=
 =?utf-8?B?UzFtdW5UWHgvSm9aWXlqQ1UwWUNuWmt5RWRkZ3ZDUkNRNnZSN1F0Zjh2T21p?=
 =?utf-8?B?SGt4VlhWNStrNkVrTFZXL0NDOE91SUViQkFZK3R3YjdDMGxyYk9iQkJ0eGFB?=
 =?utf-8?B?UWFUbjUzd3hoc2Y3ZldwNjREejZMVjNWSlY0Tkd4TjZkenMvQUlaajRsVXly?=
 =?utf-8?B?cE1CLzlwVUZxM0NoZ1NmME9JQjRVZWJxYTBmUDJranppRHFJUFNOL2xLZDNr?=
 =?utf-8?B?UDMydS80TnJob2FjZ2NHWmxINFRNMXNSM2NySG42YUtmZXZ4bVM4aFZtdE1W?=
 =?utf-8?B?WnQ5SG9QdUE2VytOWDMxWXY0WkRNVGkzZDA2cXFMbDZFTnFmS0J4U21xS1Iz?=
 =?utf-8?B?V2tpdlUvWWFReWZnVEdNTE1KVW5uSk5zVEwwR1NxQVE5cysrRTI1Y1hoU1Qx?=
 =?utf-8?B?ZWRDUDRSUXNVakNxVnhLWS9FNzhhY1Y5VHA1K09xanJxaHB3ZklnTENrVjJM?=
 =?utf-8?B?a2ExSjc2YTdQd2hPZDZseHB3amcxc2pJay9ES0MxS1lmek8vSXVVVGd6NzVX?=
 =?utf-8?B?V0JCVXZaZlpmN0EvSkI0eHJVdjFPYjI5eWpmR2M4U0NFaDZqWXczL3hpeVdI?=
 =?utf-8?B?eXBCc0s4WVdTd0FxZXU1cUllMitGUHpYSXM2OGNueVpDdmI3YWJ2ci9CNzVx?=
 =?utf-8?B?VHVxUEV1eTA2YmdlRjdXc2FrTWNIUW52a25NUVF3aGluc0E2dEdTalBFR0VE?=
 =?utf-8?B?dTMzMWpnK2lyMnFXS2VzV1Z6MTgrdlBwNmNNS3VjYmRsYkFtVWhZUXByMjda?=
 =?utf-8?B?alN5VlRJNUd1RnBDRnpJak5GWWIvRzVOTENSVmpFelRweENxQjdmZUt3V3pR?=
 =?utf-8?B?OGtudUFpa3FrOVJUTWtYcjdBb3plK3JBeE5OWlNEWDlQcG5XNDNCanVKbjlP?=
 =?utf-8?Q?Jtd4=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(1800799024)(376014)(35042699022)(7416014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 12:02:40.2757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed5a00aa-0dd0-4483-54de-08de30d186ed
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10490

QW0gMzAuMTEuMjUgdW0gMDk6MjIgc2NocmllYiBLcnp5c3p0b2YgS296bG93c2tpOg0KPiBPbiAy
OC8xMS8yMDI1IDE3OjE1LCBKb3N1YSBNYXllciB3cm90ZToNCj4+IEFkZCBtdXggY29udHJvbGxl
ciBzdXBwb3J0IGZvciB3aGVuIHNkaW8gbGluZXMgYXJlIG11eGVkIGJldHdlZW4gYSBob3N0DQo+
PiBhbmQgbXVsdGlwbGUgY2FyZHMuDQo+Pg0KPj4gVGhlcmUgYXJlIHNldmVyYWwgZGV2aWNlcyBz
dXBwb3J0aW5nIGEgY2hvaWNlIG9mIGVNTUMgb3IgU0Qgb24gYSBzaW5nbGUNCj4+IGJvYXJkIGJ5
IGJvdGggZGlwIHN3aXRjaCBhbmQgZ3BpbywgZS5nLiBSZW5lc2FzIFJaL0cyTCBTTUFSQyBTb00g
YW5kDQo+PiBTb2xpZFJ1biBSWi9HMkwgU29NLg0KPj4NCj4+IEluLXRyZWUgZHRzIGZvciB0aGUg
UmVuZXNhcyBib2FyZHMgY3VycmVudGx5IHJlbHkgb24gcHJlcHJvY2Vzc29yIG1hY3Jvcw0KPj4g
dG8gaG9nIGdwaW9zIGFuZCBkZWZpbmUgdGhlIGNhcmQuDQo+Pg0KPj4gQnkgYWRkaW5nIG11eC1z
dGF0ZXMgcHJvcGVydHkgdG8gc2RpbyBjb250cm9sbGVyIGRlc2NyaXB0aW9uLCBib2FyZHMgY2Fu
DQo+PiBjb3JyZWN0bHkgZGVzY3JpYmUgdGhlIG11eCB0aGF0IGFscmVhZHkgZXhpc3RzIGluIGhh
cmR3YXJlIC0gYW5kIGRyaXZlcnMNCj4+IGNhbiBjb29yZGluYXRlIGJldHdlZW4gbXV4IHNlbGVj
dGlvbiBhbmQgcHJvYmluZyBmb3IgY2FyZHMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSm9zdWEg
TWF5ZXIgPGpvc3VhQHNvbGlkLXJ1bi5jb20+DQo+PiAtLS0NCj4+ICBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbW1jL3JlbmVzYXMsc2RoaS55YW1sIHwgMTQgKysrKysrKysrKysr
KysNCj4+ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL3JlbmVzYXMsc2RoaS55
YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9yZW5lc2FzLHNkaGku
eWFtbA0KPj4gaW5kZXggYzc1NGVhNzFmNTFmNy4uNTU2MzVjNjBhZDczYSAxMDA2NDQNCj4+IC0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvcmVuZXNhcyxzZGhpLnlh
bWwNCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvcmVuZXNh
cyxzZGhpLnlhbWwNCj4+IEBAIC0xMDYsNiArMTA2LDExIEBAIHByb3BlcnRpZXM6DQo+PiAgICBp
b21tdXM6DQo+PiAgICAgIG1heEl0ZW1zOiAxDQo+PiAgDQo+PiArICBtdXgtc3RhdGVzOg0KPj4g
KyAgICBkZXNjcmlwdGlvbjoNCj4+ICsgICAgICBtdXggY29udHJvbGxlciBub2RlIHRvIHJvdXRl
IHRoZSBTRElPIHNpZ25hbHMgZnJvbSBTb0MgdG8gY2FyZHMuDQo+PiArICAgIG1heEl0ZW1zOiAx
DQo+PiArDQo+PiAgICBwb3dlci1kb21haW5zOg0KPj4gICAgICBtYXhJdGVtczogMQ0KPj4gIA0K
Pj4gQEAgLTI2Miw5ICsyNjcsMTcgQEAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQ0KPj4g
IGV4YW1wbGVzOg0KPj4gICAgLSB8DQo+PiAgICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9j
ay9yOGE3NzkwLWNwZy1tc3NyLmg+DQo+PiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9ncGlv
L2dwaW8uaD4NCj4+ICAgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9s
bGVyL2FybS1naWMuaD4NCj4+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3BpbmN0cmwvcnpn
MmwtcGluY3RybC5oPg0KPj4gICAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcG93ZXIvcjhhNzc5
MC1zeXNjLmg+DQo+PiAgDQo+PiArICAgIG11eDogbXV4LWNvbnRyb2xsZXIgew0KPj4gKyAgICAg
ICAgICAgIGNvbXBhdGlibGUgPSAiZ3Bpby1tdXgiOw0KPj4gKyAgICAgICAgICAgICNtdXgtc3Rh
dGUtY2VsbHMgPSA8MT47DQo+PiArICAgICAgICAgICAgbXV4LWdwaW9zID0gPCZwaW5jdHJsIFJa
RzJMX0dQSU8oMjIsIDEpIEdQSU9fQUNUSVZFX0xPVz47DQo+DQo+IFdyb25nIGluZGVudGF0aW9u
IGFuZCBub3QgcmVhbGx5IHJlbGV2YW50IGhlcmUsIHNvIGp1c3QgZHJvcC4NCkFjay4NCj4NCj4g
QmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2Y=


