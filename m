Return-Path: <linux-renesas-soc+bounces-25691-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C30FCB33A8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Dec 2025 15:55:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F86F3004BAF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Dec 2025 14:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91F8924A06B;
	Wed, 10 Dec 2025 14:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="QqtuOCSq";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="QqtuOCSq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021093.outbound.protection.outlook.com [40.107.130.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6771B21D3F2;
	Wed, 10 Dec 2025 14:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.93
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765378511; cv=fail; b=QFWdzO86ok9xIh6/MYy1PQDSRLhJMdE7EXKZ37uMwc8Lu/ubEd5ZBxynySARMUErbSPJFFf7U/yumtHeKYFTUCdglDang6WzxR+NNmkgaigBXVaaq7cuRJCJPz3vLuaa/4eppHU+rnXkHm5SyAx1CLAp6gbWsWIw53Bn72gS43c=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765378511; c=relaxed/simple;
	bh=lmN+AbIbezsomMMcOmUYK3AgQ18AHOWDVPRgbyuGyHE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WyaBoLupTEFiQTVCxi1Cwxi+TYZOh+/q1fkAPneVD3F+Jv4gl7OmYyw9zkX/7oK5TVWR97WXAEXm+AHzfwtc0XjsaIlcvOYv1FrewW+yrhcQXYVvbwO7zTaS+t7NfHiWfLbpqYMlQh2KW1b5jF7WLy/hE7xPoybTAlX4vZuLNB8=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=QqtuOCSq; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=QqtuOCSq; arc=fail smtp.client-ip=40.107.130.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NSt0Rw8SpKWp5wmQCb5/fcS4cNti2KxRTL4V4XjJ3qSvDEKMdNiOwm801aWVOGHhD33N1rirMTzfW5eFI1AAA0j8JWVlDoyTNxzUWbPwWp3D4lENwIYORdFJ7N3FCeKgebaCBcYKDfMZRuX9W/IsnY2d6dNPRnIMwui1CI346zaMWgfWUaSfEa9OeWxyz5yg2Qa51dGi84W8sVoR1z+L37botBr0+vpSLdbDCntXesBH3gYSj6NcfOlGQYph6BiYrD8N4aAlNZtLUSn5hcOV7bDOxtgjYGQOPCtugvQVT4bym2/+DKNBRXeOVy2S8O0HTdUJhFroecY+3lFHGQN22w==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmN+AbIbezsomMMcOmUYK3AgQ18AHOWDVPRgbyuGyHE=;
 b=odBaP36RLvWru1lbdQiUH7Z/rahqna4obqb+FrY+I+9n8+7+xXBi93pIk9VW6irQmUG16JWkUqNDg2GVtmmHu1lpR620wkP5X/62XIMtNOL4bdSA7Vca2Yc4QQoA4H2xAjr4hFNEihlRz2m+AwgU/nlUHvEQdkt6BoJsK+Emd/pOLyGziKOD/gIEWp4LDYGCC0UH85AyodQJ+NUudkFiEZoAuyKx02yxMpW6CeeyRC4J9k5xvxIHePK3HVH0mKEzM+19X+BNX2rbBQHcyx4RhOizq1iy+XB7U63bFwNpsxfGM5oSdGag4TsUfEqpYvBMvosm5kNTpkzPHVaFjgdlYw==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=glider.be smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmN+AbIbezsomMMcOmUYK3AgQ18AHOWDVPRgbyuGyHE=;
 b=QqtuOCSq6G3Y9YvKj/kfGZ/H4b+6OBLa/xeU/TRx49nrzXk/UAUWsnMclvBNNsLs/mo54+bVw7049MXDjpK9Hep227LMIx0viRsJXQjw48QqSKPomfyqfh81Ye3pf9ynvuquEQHOlMoFLztx/GTUzedZulbnSwTNYWpPwMT0/BU=
Received: from CWLP265CA0417.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b6::7)
 by DU4PR04MB10693.eurprd04.prod.outlook.com (2603:10a6:10:588::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Wed, 10 Dec
 2025 14:55:04 +0000
Received: from AM3PEPF00009B9B.eurprd04.prod.outlook.com
 (2603:10a6:400:1b6:cafe::8e) by CWLP265CA0417.outlook.office365.com
 (2603:10a6:400:1b6::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Wed,
 10 Dec 2025 14:54:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM3PEPF00009B9B.mail.protection.outlook.com (10.167.16.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.4
 via Frontend Transport; Wed, 10 Dec 2025 14:55:04 +0000
Received: from emails-6066740-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-47.eu-west-1.compute.internal [10.20.6.47])
	by mta-outgoing-dlp-834-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 397667FF85;
	Wed, 10 Dec 2025 14:55:04 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1765378504; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=lmN+AbIbezsomMMcOmUYK3AgQ18AHOWDVPRgbyuGyHE=;
 b=K29ysod+j+YBZmxGbtqxbw2v56FV/WfJ9JVLK6f1t89vZJAPtZ8BVLfDw5N9gluSNKoS4
 M1D3w5qUDi462VQwOVeazhpPz06PI2WNoMHl6IzKK5Bkr80oLTTeQf9OZ0C9D5AUBgk/D97
 SJwaa6wRwvkjrVEgxNZtav0rCWnUCuc=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1765378504;
 b=fKL0zfI6PwZfzCy3MOhAP2u25o6olU/U3lp2M1ftpoILs4xsk8+GoH/M2ZsXa7k8uqzi0
 PnRf7GM/0ZeiERgqQuHfN8n+apEPburIMNSS1hl4B06LAPxAbObaV9Ajk9cWUXbWlVg8bz9
 z/Ur+WOj4qAQtYDxvXBAfJh35f5tb3Y=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/htuIOkfrwZhXJHaLbtPH/ZoCUMIEYTjJCQJNYyDMxLmKHHwmKP+gP3KNkEwDBTB21Rp/wlLfBSfMYYmyygIaWGj0urFlBI9OISVeUSfwsJVk4I/7qoUMICRtI3RVMV5YfyH3DCEw/v82H08/9OJAW+z1uXJxpPA5JD9GHg0B3ibqXS8BqZTBeatO1C1yPlBzjJvVrM7+ym5sXSlwbdcwgM7exQ5wkvfiS4OIVCA3n0TWLRJqgj2PH07yaq/fHsW5QHZMGBUjbC4ZcQVhfl7WS/AaKOMBvDXo/Cctc29i3OE/ZYbw6B+Xmz8Rt9MD9D3Y7cl4aK6a8uTd/q9cBVZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmN+AbIbezsomMMcOmUYK3AgQ18AHOWDVPRgbyuGyHE=;
 b=t9/SbJs2BPg+oaOb5l1bK+o9WBWT8GUiMYK2r6OnY0Dt1FycjgrzQCFvzpv+wtVPA0f6Zf53K89nZuiIIRraYrwENdApdkQQXaopGqoFO8GDW9BuUo3BOPds7v8Tm9jwNlw+RAA9n2QQn/pyW/pqZyz5PEVYvZdd4DG5HVNHXXQwsec19YEXQ7TvBDV0l2kAFrxhGDlBNg2fVwXf36P6iMjOhCDTyO1rlnLBOHP6krTF3eN5geBW8FxXKMLnsF26DWCoWusiRZFFttEGCvXzHiTwGd2YqrwLDowaI9u1hHyxn28nv5z1X1/i34BiYTs4P77JnyP9ZKRAcxr00ZGfMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmN+AbIbezsomMMcOmUYK3AgQ18AHOWDVPRgbyuGyHE=;
 b=QqtuOCSq6G3Y9YvKj/kfGZ/H4b+6OBLa/xeU/TRx49nrzXk/UAUWsnMclvBNNsLs/mo54+bVw7049MXDjpK9Hep227LMIx0viRsJXQjw48QqSKPomfyqfh81Ye3pf9ynvuquEQHOlMoFLztx/GTUzedZulbnSwTNYWpPwMT0/BU=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PAWPR04MB9910.eurprd04.prod.outlook.com (2603:10a6:102:380::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Wed, 10 Dec
 2025 14:54:45 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 14:54:45 +0000
From: Josua Mayer <josua@solid-run.com>
To: Rob Herring <robh@kernel.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Mikhail Anikin
	<mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>,
	Jon Nettleton <jon@solid-run.com>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] mmc: host: renesas_sdhi_core: support configuring
 an optional sdio mux
Thread-Topic: [PATCH v2 2/2] mmc: host: renesas_sdhi_core: support configuring
 an optional sdio mux
Thread-Index: AQHcYr5i2s/P6vKYKUiSzrjsDCO9N7UW/WuAgAQG8IA=
Date: Wed, 10 Dec 2025 14:54:45 +0000
Message-ID: <808fd3ca-c3f1-46bd-a68e-514629ac07a3@solid-run.com>
References: <20251201-rz-sdio-mux-v2-0-bcb581b88dd7@solid-run.com>
 <20251201-rz-sdio-mux-v2-2-bcb581b88dd7@solid-run.com>
 <20251208012453.GA333127-robh@kernel.org>
In-Reply-To: <20251208012453.GA333127-robh@kernel.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-traffictypediagnostic:
	PAXPR04MB8749:EE_|PAWPR04MB9910:EE_|AM3PEPF00009B9B:EE_|DU4PR04MB10693:EE_
X-MS-Office365-Filtering-Correlation-Id: 48eab042-41c4-45cb-c755-08de37fc1a52
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?aEh3TGVRWWxQcm1IdFFmY1Z6amFidFN6TmhQMHRlajQyaGpyK2IwOXp1ang5?=
 =?utf-8?B?MWNHd1RmUzluWlRUK2RkK2lIRCtTZGs1VDF2eCtyWlUzbmM5RnNOT1dIRGlW?=
 =?utf-8?B?UDlxbWhHZThQQlFQY3VPWTA5T1BNS1lrOW5Ed2FHWFF4UHBPaFlENngyK3dN?=
 =?utf-8?B?MW83OGNLTXZBZXlOWVdrUDF4UnFrZlJyTlN4aGtYY2o3RWE4MkdSVDNQVkZZ?=
 =?utf-8?B?MW03aDBpOUVXdk8wbitBdXJTck5tOEZKWEJ5Uk5SNFZtZkx6MDlhYVpoeUpQ?=
 =?utf-8?B?NmFWaGh5eEwwdVFHamg4UUg5dVZvQTFUVUFlRFdXZnl0VElBUDM1RGY4cFNn?=
 =?utf-8?B?ZE05U2pHRnVwSEljRlJOeDRnRmJuSGxkTWFKU0ZBbDdrcW10eGE4N3RZamg3?=
 =?utf-8?B?bGhXMHVQU3RaVVdic3VkRmtXZ0FxQzJRbnhrT2drQkt5cExXbjh6ZzZ1cTA5?=
 =?utf-8?B?bXZENitmZWxxdUdBQmtrc1Z0Z1FNSi9hWFVJamdCS1UwK3hWOGFSR2Y5YUEr?=
 =?utf-8?B?QWFtRFFTVndJenVJRldXOW5XSG1YcjlFNW9JcjNDZklxb2lkeXNCYyt2c0Y0?=
 =?utf-8?B?aDVQbk0reG9nVFJ1bjJmSElLY3RTYTNWSzhYajh0YUZXamdSSGUrVG5ON1pw?=
 =?utf-8?B?TkZ5ZTdsNUZ6NW9lZkZsY3BjdHdLbkNRcjBCbEdKTTBUZEphd0x1ajZLNi91?=
 =?utf-8?B?RXVkK1BhMGNCK2JZdFQyTzlheHRxQXlOUWs4dGE4cGIzblh5N3p4Qlo2aXlv?=
 =?utf-8?B?SzV2MXFhTllERmQ5SzJxK3FNSFV3ZzV5TDB5MVI4ekhqZ1pNRmRNdWZVL1Iy?=
 =?utf-8?B?cWx0eFh2RVZMQ0ROaklEV3UzOXJiOEFSSVBzMDNncDF6UU5RL1Uvd3pJdmc2?=
 =?utf-8?B?K0NHSVlYbHZMelc2REpwL1lob3VXRzIxdlRqWk1MNEhzS1lQV21ET1BzVWpr?=
 =?utf-8?B?bTA1R3M1RUNUaVZsL0hHSkR1Qk5NQW9uYzF4S09wdEI0VTRGeFAyRVNNaVNT?=
 =?utf-8?B?UnVGUmhPOUtkS0JEZnM5U0xSM2lNK1NScDFKTG00bkJ1cnpjbEJTSUJzYVVH?=
 =?utf-8?B?RzlsZXRtbmc1MWZ4RzdOUVJya1Jwc2h0TFFoWTdRZzljczdJeVFuQTl4TFZE?=
 =?utf-8?B?YnlzOXd0d3Z5c1Zab1hHeW8vLytxNktiK1RKcW5rN2RRakl5TDcvbmNDWjVD?=
 =?utf-8?B?dEpJd1ordThmTnM4ZVZ5MDkvL25LRStsRGJrV1hyN3BQaklsbXA3QnFIRitn?=
 =?utf-8?B?bXFvOTN2YmFRWUhYSXI4ZWJwQ21VT2l2bW50eFc2L0NPa3NNODNKYnV4YzUr?=
 =?utf-8?B?eDhrRjdYQkxmY1YyRkF6bkpTMXA0azNLT3ZIVUc2aGVpcXJoM1JLWkphdm9J?=
 =?utf-8?B?d0tZbm9aRGlxZG5PUEdzeTBTcEJwZXFwelhacDFyVEl6ODNyOVMwTlZwQ1Jp?=
 =?utf-8?B?Kzk2UjAzSFAxRVIzLzM1ZEpqWlNXKzVaaUlLa2FSc0VwMTU2UFlka2FraUFi?=
 =?utf-8?B?K3c3dm9teVBZQVpmdXFleEMwNUJJUGVQbUljMEdlNU1zN0Jjd0gwSUhGNHhj?=
 =?utf-8?B?U2VXaldMRkhzMlA1VkE0U25OWFdZY0hPNTVOd3Nkbm9zNEE2T0s2Z29xcWFp?=
 =?utf-8?B?aXpYeWFYTURKVExRR05MZHpNN0J4YlFjR0RoaUxIQnZ6L2I3YlB1WlIzWDdv?=
 =?utf-8?B?a1Y5WFFUYjFLRlA1U05VaDlvdmZONEU3WkpuaGRqZGQvTjdGbFdqWnE4cmYr?=
 =?utf-8?B?eGZYR28zU0J1cjJUU29heW9UYXVGb3dDZW5ibUs2dnh1SS9rcXJmSGRQL1o1?=
 =?utf-8?B?NnBWanBGOXVtYzFlaG41UEJCQnBzRDNjckFHdloxL0R6OU1lVUxkZjR6bFNq?=
 =?utf-8?B?aFMrMXF3WXV4eFl0SjV0T2NkQzFacVV1ZlFRSE1EZDIvNkFMTjhTTGNHa0F2?=
 =?utf-8?B?bGpCL0NqN3JGTWRoQ01Qell2bUxodkpZbVJaQWlNbzVWbVdrYnRWTjBmdGVl?=
 =?utf-8?B?cG12K2JOVjFLZSsvUENTYjg2SU8rT1JkSldaenVORXdaL3FmTi84ZjNDM1ZU?=
 =?utf-8?Q?l3jSvr?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C7FA656326027B4D97DAEF66474E1F63@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9910
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 4f18e2025f754615a1661044cf813419:solidrun,office365_emails,sent,inline:e721bfb270c4d40e788f1e9075f4e5bd
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009B9B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	913cb18d-20cf-46c4-9213-08de37fc0f09
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014|14060799003|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YUc2R2JsRmJJd3UwN0Z5R2ZJakZ0ZzdGaXAzMHE4T1dtMWZrNllGRUVnSmNo?=
 =?utf-8?B?ZUE3bitRK095OS9JWnJXYlhUM1d5UDdDNkQveVNsakJmZnIvcVJQMkdQYk9U?=
 =?utf-8?B?TEw2UTdKSXJ1Z2Q1MUdoM3lvNXcwVGg0V1p5WWozaUt4V21GczRJSStybEoz?=
 =?utf-8?B?WHJTbjZoSnNUOC9kdFpBNUpQRFhkdjZmN25CaEdVbG1jWTltQlc0VVFERWdC?=
 =?utf-8?B?N2xFS2t5dkJTVDNFYzdlcngwRnFqUnBDdEMyUTc2VXAyWUFIc0FtM0RjMy9G?=
 =?utf-8?B?OC9JVHNzc3k3ZU9CMDdXSldkSTZYVnRFeHhKODJTTGFERGFoWG1teEFsV21O?=
 =?utf-8?B?U1FPbVpFMDQzeUZZMXNlNWN1bW9nVlRkczZLV3RPZ2pjalR1c3VSV25vYktr?=
 =?utf-8?B?Z2oyVWEzNXZTa0hHTDNXRUo5OTBhVnJHS0V5dE9vTkMwdk9sZXN2QUxnTkQy?=
 =?utf-8?B?TXFFSThYZHlRWE9HdlNkYmFmQ1UvK3VJT2w4bHFHNStmNmk1KzEvQVA5MFJT?=
 =?utf-8?B?TEFlbVhiVE5TTUZOUlMvQlNqYm92VlpqeVIwRk1UckVrWnlSUkRtSThEMUdZ?=
 =?utf-8?B?ei9nZ1Z4OGlFS3l3OFZDL3RKYlpwd0tNcmVpekhILy9IOXJZZ2lZTXZPZm1Q?=
 =?utf-8?B?SDF6UGErVzM0djlJRXhvZVV2Z0l4QVRodmd4SytGU2VQRFhTTWRwNHhMVEVi?=
 =?utf-8?B?eC8xc2ZMSWh5NDNMdzFDUUUxbzFiTXdySHpGcWFVcjlleU10U2pQZXFXQVNS?=
 =?utf-8?B?SFZpNzBpWDJmRVMvcHdZNUlqSERlMGVJaFQ0SmVYY3czMDBKcXN5b0FITjVl?=
 =?utf-8?B?K1o2M2lBZmd6S1lHL1g2VkRJZU1BQ2phd1dhMC9ONE9pYnltc2hRMDV0MXRx?=
 =?utf-8?B?RHNTeVBVZlZxM2VGOTZ5VVFiZVNBVm1MTFpxSUxUbUQ2bllJZlVVdm1pU0Nq?=
 =?utf-8?B?VEdKb04vcWZpL0p0d0RKV1pLd2VtbFpXaW5nUWpCWVFmK2dNUXBNdG5jUUtE?=
 =?utf-8?B?OFRxMDBOcXBmb3FJWDc2eGk1a0Z3QWUyTE1sVEJ3ZWdIU3c5T0dWME9RL0Jw?=
 =?utf-8?B?VVhWS0dxR3RiNStwMnZ3NFR4RG9CVmo2cWR3RUM4YWgwT2NrZm1SVHFCdm45?=
 =?utf-8?B?Mmtyc3RkMG5IWmlkNDRFUitPZFZ5VGhJNmFrSWZ2aVdjMmszSTRqVWVLODRY?=
 =?utf-8?B?MDhZU1k3NmVQa0VNV3I2YXpTZ0ZvUm1xaFQzV1EvaFhJRUM0dWEwREJXNUNs?=
 =?utf-8?B?aHRoT2dIdWtxUGxqVVJrQi9kWXZkS3ZJSmEyclFPRHFJMFRYVXZ3VDcyRTI0?=
 =?utf-8?B?ek1yeis5cmRnWklBWE9GSlgrWkI0aFpodkxtMFR1RTZLdDJBdVN1YkIzd3du?=
 =?utf-8?B?NG5QYzlodHRTNS9uc2xQMWNLNDNsajlFMUJFRmEvQTdpYXMvTEVLVGs4UkZn?=
 =?utf-8?B?U3dYdU85YmlvNjQ3bTlWVitVMDJHbGFON1BtMUFVZ0pJenRmMUdXTG1VTUJi?=
 =?utf-8?B?bkVuWDFRMk04Qk5oWUF1Ymo1ZlFsdW9GdW5TZ0lQc2x6alpEb0hacy9mbHN5?=
 =?utf-8?B?QXFPL0UyT0JIRE9rdERubnJLZnM1aiszWm1CbzZjL0k5Yjg5MTJBb0ozSGcz?=
 =?utf-8?B?dThnTTBEY3lwUVRaM2I2V0ZuNm84UTNkelFEQndCalp2cS91b0JIMERQVjZl?=
 =?utf-8?B?d1JYUDFlbjlWajZ3aXZwbS8xYUJsOHFDZ0EyWUtwSVo3SUo4RWtzWjF2REZt?=
 =?utf-8?B?MUUrMGdqd3dORGxtbktHYzJ6UW5hTHJoa1VXTnd3SE02VE9hU0YyZXVKVGJI?=
 =?utf-8?B?TWJLM0ZpZU5MUHk3UGZ2aW5BbDVMcWR1RDQ0ZVRSa01XQ2lOaG9ETzlRS2Z6?=
 =?utf-8?B?aVpaRUV6Ui92L0tJR09WRVpLL2dLN0NRc2hpVE5PL25nemMwVHdlaDVQUHdq?=
 =?utf-8?B?MHdqcXZLeGl4cE9oWVlhRnNmL3lSOE15Q2lYNS9xSFpIeCt3QXZMQkcwMTA5?=
 =?utf-8?B?Q1dNUFVsSHFPMWdaSHYzeW9UZVo0NUdZZklkY0lYNnRnTmJodURGdHNVY3ll?=
 =?utf-8?B?RHg0LzhsQnF0MS9lUzN2bTVCRHU5R2VoTG1IeS9ocVJHUHZreU4vaXBydlpw?=
 =?utf-8?Q?1VHM=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014)(14060799003)(35042699022);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 14:55:04.5209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48eab042-41c4-45cb-c755-08de37fc1a52
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10693

DQpBbSAwOC4xMi4yNSB1bSAwMjoyNCBzY2hyaWViIFJvYiBIZXJyaW5nOg0KPiBPbiBNb24sIERl
YyAwMSwgMjAyNSBhdCAwMTozMToxMVBNICswMTAwLCBKb3N1YSBNYXllciB3cm90ZToNCj4+IFNv
bWUgaGFyZHdhcmUgZGVzaWducyByb3V0ZSBzZGlvIHNpZ25hbHMgdGhyb3VnaCBhIG11eCB0byBz
dXBwb3J0DQo+PiBtdWx0aXBsZSBkZXZpY2VzIG9uIGEgc2luZ2xlIHNkaW8gY29udHJvbGxlci4N
Cj4+IEluIHBhcnRpY3VsYXIgU29saWRSdW4gUlovRzJML0cyTEMvVjJMIFN5c3RlbSBvbiBNb2R1
bGUgdXNlIGEgbXV4IGZvcg0KPj4gc3dpdGNoaW5nIGJldHdlZW4gc29sZGVyZWQgZU1NQyBhbmQg
YW4gb3B0aW9uYWwgbWljcm9TRCBvbiBhIGNhcnJpZXINCj4+IGJvYXJkLCBlLmcuIGZvciBkZXZl
bG9wbWVudCBvciBwcm92aXNpb25pbmcuDQo+Pg0KPj4gU0RJTyBpcyBub3Qgd2VsbCBzdWl0ZWQg
Zm9yIHJ1bnRpbWUgc3dpdGNoaW5nIGJldHdlZW4gZGlmZmVyZW50IGNhcmRzLA0KPj4gaG93ZXZl
ciBib290LXRpbWUgc2VsZWN0aW9uIGlzIHBvc3NpYmxlIGFuZCB1c2VmdWwgaW4gcGFydGljdWxh
ciB3aXRoIGR0DQo+PiBvdmVybGF5cy4NCj4+DQo+PiBBZGQgc3VwcG9ydCBmb3IgYW4gb3B0aW9u
YWwgc2RpbyBtdXggZGVmaW5lZCBpbiBkdCBhbmQgc2VsZWN0IGl0IGR1cmluZw0KPj4gcHJvYmUu
DQo+Pg0KPj4gU2ltaWxhciBmdW5jdGlvbmFsaXR5IGFscmVhZHkgZXhpc3RzIGluIG90aGVyIHBs
YWNlcywgZS5nLiBpMmMtb21hcC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKb3N1YSBNYXllciA8
am9zdWFAc29saWQtcnVuLmNvbT4NCj4+IC0tLQ0KPj4gIGRyaXZlcnMvbW1jL2hvc3QvS2NvbmZp
ZyAgICAgICAgICAgICB8ICAxICsNCj4+ICBkcml2ZXJzL21tYy9ob3N0L3JlbmVzYXNfc2RoaS5o
ICAgICAgfCAgMSArDQo+PiAgZHJpdmVycy9tbWMvaG9zdC9yZW5lc2FzX3NkaGlfY29yZS5jIHwg
MjcgKysrKysrKysrKysrKysrKysrKysrKysrLS0tDQo+PiAgMyBmaWxlcyBjaGFuZ2VkLCAyNiBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L21tYy9ob3N0L0tjb25maWcgYi9kcml2ZXJzL21tYy9ob3N0L0tjb25maWcNCj4+IGluZGV4IDJj
OTYzY2I2NzI0YjkuLmMwMWFiN2Q4MWE1YWYgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL21tYy9o
b3N0L0tjb25maWcNCj4+ICsrKyBiL2RyaXZlcnMvbW1jL2hvc3QvS2NvbmZpZw0KPj4gQEAgLTcw
Nyw2ICs3MDcsNyBAQCBjb25maWcgTU1DX1NESEkNCj4+ICAJZGVwZW5kcyBvbiBTVVBFUkggfHwg
QVJDSF9SRU5FU0FTIHx8IENPTVBJTEVfVEVTVA0KPj4gIAlkZXBlbmRzIG9uIChSRVNFVF9DT05U
Uk9MTEVSICYmIFJFR1VMQVRPUikgfHwgIU9GDQo+PiAgCXNlbGVjdCBNTUNfVE1JT19DT1JFDQo+
PiArCXNlbGVjdCBNVUxUSVBMRVhFUg0KPj4gIAloZWxwDQo+PiAgCSAgVGhpcyBwcm92aWRlcyBz
dXBwb3J0IGZvciB0aGUgU0RISSBTRC9TRElPIGNvbnRyb2xsZXIgZm91bmQgaW4NCj4+ICAJICBS
ZW5lc2FzIFN1cGVySCwgQVJNIGFuZCBBUk02NCBiYXNlZCBTb0NzDQo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tbWMvaG9zdC9yZW5lc2FzX3NkaGkuaCBiL2RyaXZlcnMvbW1jL2hvc3QvcmVuZXNh
c19zZGhpLmgNCj4+IGluZGV4IDA4NDk2NGNlY2Y5ZDguLjk1MDg5MDhkODE3OWYgMTAwNjQ0DQo+
PiAtLS0gYS9kcml2ZXJzL21tYy9ob3N0L3JlbmVzYXNfc2RoaS5oDQo+PiArKysgYi9kcml2ZXJz
L21tYy9ob3N0L3JlbmVzYXNfc2RoaS5oDQo+PiBAQCAtOTcsNiArOTcsNyBAQCBzdHJ1Y3QgcmVu
ZXNhc19zZGhpIHsNCj4+ICAJc3RydWN0IHJlc2V0X2NvbnRyb2wgKnJzdGM7DQo+PiAgCXN0cnVj
dCB0bWlvX21tY19ob3N0ICpob3N0Ow0KPj4gIAlzdHJ1Y3QgcmVndWxhdG9yX2RldiAqcmRldjsN
Cj4+ICsJc3RydWN0IG11eF9zdGF0ZSAqbXV4X3N0YXRlOw0KPj4gIH07DQo+PiAgDQo+PiAgI2Rl
ZmluZSBob3N0X3RvX3ByaXYoaG9zdCkgXA0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbW1jL2hv
c3QvcmVuZXNhc19zZGhpX2NvcmUuYyBiL2RyaXZlcnMvbW1jL2hvc3QvcmVuZXNhc19zZGhpX2Nv
cmUuYw0KPj4gaW5kZXggZjU2ZmEyY2QyMDhkZC4uYzU4ZjQxMmVhMjAyOCAxMDA2NDQNCj4+IC0t
LSBhL2RyaXZlcnMvbW1jL2hvc3QvcmVuZXNhc19zZGhpX2NvcmUuYw0KPj4gKysrIGIvZHJpdmVy
cy9tbWMvaG9zdC9yZW5lc2FzX3NkaGlfY29yZS5jDQo+PiBAQCAtMjYsNiArMjYsNyBAQA0KPj4g
ICNpbmNsdWRlIDxsaW51eC9tbWMvbW1jLmg+DQo+PiAgI2luY2x1ZGUgPGxpbnV4L21tYy9zbG90
LWdwaW8uaD4NCj4+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+PiArI2luY2x1ZGUgPGxp
bnV4L211eC9jb25zdW1lci5oPg0KPj4gICNpbmNsdWRlIDxsaW51eC9waW5jdHJsL2NvbnN1bWVy
Lmg+DQo+PiAgI2luY2x1ZGUgPGxpbnV4L3BpbmN0cmwvcGluY3RybC1zdGF0ZS5oPg0KPj4gICNp
bmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kYXRhL3RtaW8uaD4NCj4+IEBAIC0xMDYxLDYgKzEwNjIs
NyBAQCBpbnQgcmVuZXNhc19zZGhpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYs
DQo+PiAgCXN0cnVjdCByZWd1bGF0b3JfZGV2ICpyZGV2Ow0KPj4gIAlzdHJ1Y3QgcmVuZXNhc19z
ZGhpX2RtYSAqZG1hX3ByaXY7DQo+PiAgCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7
DQo+PiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSA9IHBkZXYtPmRldi5vZl9ub2RlOw0KPj4g
IAlzdHJ1Y3QgdG1pb19tbWNfaG9zdCAqaG9zdDsNCj4+ICAJc3RydWN0IHJlbmVzYXNfc2RoaSAq
cHJpdjsNCj4+ICAJaW50IG51bV9pcnFzLCBpcnEsIHJldCwgaTsNCj4+IEBAIC0xMTE1LDkgKzEx
MTcsMjUgQEAgaW50IHJlbmVzYXNfc2RoaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2LA0KPj4gIAkJCQkJCSJzdGF0ZV91aHMiKTsNCj4+ICAJfQ0KPj4gIA0KPj4gKwlpZiAob2Zf
cHJvcGVydHlfcHJlc2VudChub2RlLCAibXV4LXN0YXRlcyIpKSB7DQo+PiArCQlwcml2LT5tdXhf
c3RhdGUgPSBkZXZtX211eF9zdGF0ZV9nZXQoJnBkZXYtPmRldiwgTlVMTCk7DQo+IFRoZXNlIDIg
bGluZXMgYXJlIHJlYWxseSBqdXN0IGRldm1fbXV4X3N0YXRlX2dldF9vcHRpb25hbCgpLiBBZGQg
aXQgaWYgDQo+IGl0IGRvZXNuJ3QgZXhpc3QuDQpPdGhlciBkcml2ZXJzIGhhdmUgc28gZmFyIGF2
b2lkZWQgaW50cm9kdWNpbmcgYSBnZW5lcmFsIGhlbHBlciBmb3IgdGhpcy4NCk5vdGFibHkgZHJp
dmVycy9waHkvcGh5LWNhbi10cmFuc2NlaXZlci5jIGhhcyBhbHJlYWR5IGltcGxlbWVudGVkDQpp
dHMgb3duIHZlcnNpb24gb2YgZGV2bV9tdXhfc3RhdGVfZ2V0X29wdGlvbmFsLg0KPg0KPj4gKwkJ
aWYgKElTX0VSUihwcml2LT5tdXhfc3RhdGUpKSB7DQo+PiArCQkJcmV0ID0gUFRSX0VSUihwcml2
LT5tdXhfc3RhdGUpOw0KPj4gKwkJCWRldl9kYmcoJnBkZXYtPmRldiwgImZhaWxlZCB0byBnZXQg
U0RJTyBtdXg6ICVkXG4iLCByZXQpOw0KPj4gKwkJCXJldHVybiByZXQ7DQo+PiArCQl9DQo+PiAr
CQlyZXQgPSBtdXhfc3RhdGVfc2VsZWN0KHByaXYtPm11eF9zdGF0ZSk7DQo+PiArCQlpZiAocmV0
KSB7DQo+PiArCQkJZGV2X2VycigmcGRldi0+ZGV2LCAiZmFpbGVkIHRvIHNlbGVjdCBTRElPIG11
eDogJWRcbiIsIHJldCk7DQo+IElzIHRoZXJlIGEgY2FzZSB3aGVyZSBtdXhfc3RhdGVfc2VsZWN0
KCkgZmFpbGluZyBpcyBub3QgYW4gZXJyb3I/DQpJIHN1cHBvc2UgaXQgaXMgYWx3YXlzIGFuIGVy
cm9yLg0KPiBJZiANCj4gbm90LCBtdXhfc3RhdGVfc2VsZWN0KCkgc2hvdWxkIGRvIHRoZSBwcmlu
dGluZy4NCg0KUG9zc2libHkuIEV4Y2VwdCB3aGVuIGl0IGlzIEVERUZFUi4NCg0KSW5zaWRlIGRy
aXZlciB3ZSB3b3VsZCB1c2UgZGV2X2Vycl9wcm9iZSBpbiB0aGlzIGNhc2UuDQpTaG91bGQgaGVs
cGVycyBkbyB0aGUgc2FtZT8NCg0KPg0KPj4gKwkJCXJldHVybiByZXQ7DQo+PiArCQl9DQo+PiAr
CX0=


