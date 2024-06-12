Return-Path: <linux-renesas-soc+bounces-6095-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26657904BF6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 08:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 196BD1C208F0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 06:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B385168C16;
	Wed, 12 Jun 2024 06:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="E2v+NUsn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2080.outbound.protection.outlook.com [40.107.114.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9369B1649BE;
	Wed, 12 Jun 2024 06:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718175154; cv=fail; b=B9ZX1iGZmzMehJIgewvCZ8ysTbpsWttiSntc+Hq3je9bslyetgyAs4N89YdhFGCBT+yPeriNg5t4kQXxET0/dHxH5Lpb+ZurrpRdYb1rSYL2IYRiKOlQX4Rulx3v3WnHrOpHqVzNVs+H4UNHlQY+0cgr3axWBvWSwChotpf2RIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718175154; c=relaxed/simple;
	bh=03iFqg6GOkFLaL6f1JZ94U6JQERN4Y7PBkKhKsnl9z0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jem4IWkcb5y5VSY+eN+rl50peE/4ifcOb0QX5c+lPYxsTp7BuaDnkzz7t9DxmgBH3PW1cymso5IDjvwRZDOoF0N6b70/wSI8onOikVKynAQ7FgFSn/oE3gmA3WUzPsgNKDgwkngJmwLSEhdox2KuUtneeoq79bjeYaqm4j6DOkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=E2v+NUsn; arc=fail smtp.client-ip=40.107.114.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b3K3RAhJEkJL106ZSts1ItwXnF9oUwle4MhYDK86ola4w8bEJ5pZZfwhSkyZF2SyXHXyQHE54RW+YIFBjk+tgOGm6aXVnAJ8lkP88rlfFF6pnsx0kRk5y2VhTtivNmFDd7TiGV8SGcgT5E7m9WLg7KlW9H+hSgwKn8JK50JYnJuTdFQSU0NQNRZJH09cCm2X/4MWUWh2Z5CyJltp1XVFcdEM9rPNt6unYUx7TSmCyk3j4IfV0UgG7oAdQMjBLulxRQhqnpU4OwUJuboK+0IZJp+pcSXvUFU7uFMK9gYyDIfIlE4DwRW8N+iTyxgw4I+AzqHtOSQ8gimfthAkWlmp+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=03iFqg6GOkFLaL6f1JZ94U6JQERN4Y7PBkKhKsnl9z0=;
 b=lJzgsWjqGZv4NozfX3RetNqirZjvlvMWvfevYlVZQrtArz39ZUU0uYTrNa971UrvBQcgrHGjHsjfQNKeM6lRXnnCeXUGoBt43imgb6D8CBT1LN2mBBRcaU1ekHb9N30SyZSVUI05LJLZKrzLoQ3nAx4ou/NAVCy2KHRUEYRlptk6/hhvXXNczNkn8+CAMlDUh7TCc52BCwnpCQmapkC3NuJv/F3p4W+CKUidcxypYoQqKHWmZWaZw32sIsBvvQYc3uPYYIKRCFQy4j/+yEVXolPOWPaNbXk/CQwQNxc/j9kO/dFpZbE4aQEfAgM8fPz6ACYTPLZGmECuaoBnLY+z/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03iFqg6GOkFLaL6f1JZ94U6JQERN4Y7PBkKhKsnl9z0=;
 b=E2v+NUsncppSPi6ns/QLjwoB49Pkvr2ZZ6JSXDxnych+J05LUcR23lPFMr/O82EZxmNV6fZAFXhuHjGBMSPLkpFr9PK8ODFtUwKBYXlYNz6SB5brG7gm3/DeOFDfhbFHMqKukQ0mcngQgDz+uYk5ARJlPEH/kvB/K4SDmXn5I0o=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB10001.jpnprd01.prod.outlook.com (2603:1096:400:1d5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 06:52:29 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 06:52:29 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v3 6/6] arm64: dts: renesas: rz-smarc: Replace fixed
 regulator for USB VBUS
Thread-Topic: [PATCH v3 6/6] arm64: dts: renesas: rz-smarc: Replace fixed
 regulator for USB VBUS
Thread-Index: AQHau+8tQfwk3xAR1EK3dnMFIggJ3LHDrmKAgAADofA=
Date: Wed, 12 Jun 2024 06:52:28 +0000
Message-ID:
 <TY3PR01MB113461A3894AB11DDC6A90D2486C02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240611110402.58104-1-biju.das.jz@bp.renesas.com>
 <20240611110402.58104-7-biju.das.jz@bp.renesas.com>
 <b4d04a73-22eb-44f3-af03-8f8686869c9e@kernel.org>
In-Reply-To: <b4d04a73-22eb-44f3-af03-8f8686869c9e@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB10001:EE_
x-ms-office365-filtering-correlation-id: bed19cd3-b9d6-462e-ace5-08dc8aac39e3
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230032|376006|7416006|366008|1800799016|38070700010;
x-microsoft-antispam-message-info:
 =?utf-8?B?eS83a2hSRDV3S24vQmcwZGQwd1ZtL0hjRHJNQzRXMWU2bldVRXR4WmhNMytF?=
 =?utf-8?B?aU1hZWpnaUJNRy82REc2d2hUVDEzRFgwcFM3ZjduRkl0eVY0SkpHV0hwWjBh?=
 =?utf-8?B?ZGlDZ0pXSWQ4VzBtZGRGOFptMHFSYkFNUEF2UitzaWt3K3FENnBpMFlGWUU5?=
 =?utf-8?B?VWpKVWg2ZWFock5CcFVsdEh2ak5pMUNPZ1ZOYnVoSDZ6cFhPbkFUVWU4WXlx?=
 =?utf-8?B?aFhrL09ad3B1cXpmc3lMSEZJQnd3cGRNVjIyMk5KOXZkWk5ETk9MN1hQVktC?=
 =?utf-8?B?OGg5dVFVMkMxZFhmK2U0aG5naUJ1V2s3VzBISG9va1lyeStzU0NTcGR0RmVi?=
 =?utf-8?B?SE8wUFdvQWNtZU8rd1NCVzFaWmQvOGM5TU9KUHRMQmFrMndWZHA4aktkNTBx?=
 =?utf-8?B?Q2U0RDIxT2s2T3hQZ2lSVnBjWXI4bnA0ZEhnRGhiNnU5dEt5b3RZS0R2a1BE?=
 =?utf-8?B?N2F6NmdGWG01VUdkRSt1TzRMSTdHelI4QzhTY0l2TEloR3YrQXFmVDVlTEg1?=
 =?utf-8?B?c1AwcDZPTzRzYlpnRVRjQ3pTNW5FQW9DRFA4Uk5Jb1ZrTFRKVUZYbkRXN2NF?=
 =?utf-8?B?Mk1GTHkvSTZuYWZ2Mm9icCtoSFlDcy9CQjdub1FZQklyNHVCVlprUkorV2c4?=
 =?utf-8?B?TGRFbHJPTUZhUzEzblB6Y0FPOTJqdjUxWFhiQ2FKdEp2NE5OT1hqdExONGJv?=
 =?utf-8?B?Z0NUYnVBMTNkVXd2WEYvNkpXQlRTUm5TWnAyTVUvVzZTcjVPUXFCVkxFRVlh?=
 =?utf-8?B?eGJtRmVDaXlFNit6RTNjM0VkQ3FmaTh2U1U4Y3QwZUE1M2FTRmFtNVd4VXpO?=
 =?utf-8?B?b0FEMDQ0M3B0Q3hSZWpQU0p0dXlxOVByZnl2b0dibnduTHJUdDRKVDRMa1lj?=
 =?utf-8?B?YTlNemtzdXY4UmI0Q2kwK1FIZTBXMlpBUlNtVzlJdGxQeGJFNXlFTmVEQ2ND?=
 =?utf-8?B?ZVJDRDdJS1gvMUJUYk13TjEzcVRUQStPVVZET3VBT3RhVE9hTERxdE16bWRP?=
 =?utf-8?B?aDBodnNTeEtBaktZS2JLVTlMcEs1aGtwc05xMTlJSEdtQjh2aW5IUTY2Z3pJ?=
 =?utf-8?B?WG52RDQxRk1RUUI2bkZ0TThSNTlSTWJadmJsOVBaRkZBTnpPT1lQNitablh2?=
 =?utf-8?B?R0FhUjR0Y05ka3B4UkxRT082bHhMQy9vdnZBMU9RUWNlanJMRHZpUXNYWldC?=
 =?utf-8?B?dG9WV0MvcEFmeitQclRHTldWc1g1cDhGZHRWZFNaOGI0WndHSTIyK0d3dm03?=
 =?utf-8?B?NTE1RUVpdVZ0QmlOdmNBQi8yM2ovMm11UFFDYzV4YVd3UWJFMkxHQTBBaDA4?=
 =?utf-8?B?L3loaFVvUFB6N2Y4Y0hPT0V6SWFQK3Y2U21nRG12c3BjK2hseW9nWUcrSDE1?=
 =?utf-8?B?UWhUUUZOM3ZTY0ZPUHVxVTlxeVQwOU5YbjJPOEJ4N0ZRemRqcUJwTVYycmtu?=
 =?utf-8?B?OUs1b3N6Y2pEcnlZb3RqcUtFMHVEV2IzdXU0Q0tScG41M09oS09XcThOekNh?=
 =?utf-8?B?V0RFVzBiSk16OUZrVTBuRVBjUmtXbTE0TGFSN29XSU1mdFIxOEpaZUpnWUpC?=
 =?utf-8?B?WkxnRE03elhYVERiN1pMMC9VaFVzaHBnOENlRi8zR2V1WU5leFk1cTczU1Nm?=
 =?utf-8?B?ZWNCSXRUcnduU1ZMUFpYYk5rNUZ3QzJzdnNaZXRSRTRKNzhzdWNLcGlnWU45?=
 =?utf-8?B?SkdQU0IwckhkN29oV0kzTzRLMUFkOXFiOVpGcjcyZnY0T1d3TS8rZWo4RWRv?=
 =?utf-8?B?WWtwQm5TR2svTlE2alZDR29Kc2NxVzVBNWh5NVZZYVo1USt4WU5WNDlHSnhD?=
 =?utf-8?Q?k+V84jyfhCiJEQow9wW1DqghmhkSxVRQkz6ZU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(376006)(7416006)(366008)(1800799016)(38070700010);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OTQ0SGZVL2pkbWo0Y1ZUeGIzQktqR0ROUkdabGZqWFFOTDRxZ2VlNnh2bm1s?=
 =?utf-8?B?aUZJTHRiQm1CRXBoT3gya29YRUNjbCtNTmhsM0ZzY0w1MUsxWkxJWisyVnk5?=
 =?utf-8?B?bTFzMlJmZ3F3M3luZXRKRDdGTm1FRWhzbVNSZHVTV1dLbDh0TVZBcE5xL3Bo?=
 =?utf-8?B?UTRBdzJ2dmxuTnAwK2pPYTkvRnJ5SVBQdDB3WFhYdmVPYnQxcis5QjlqVXF5?=
 =?utf-8?B?UUNEZjhWNXhPbWFtSjRCNG45a0Y1akFIVXZBVll5ODJrK1NQbXV1RmRITkw0?=
 =?utf-8?B?SHZEekhYeEFISjdjYTdOT2l1MklOR0kzMTd3aHhmM2g4ODNGTnRTRmJYTTVU?=
 =?utf-8?B?QlRRblNOMUV2ZEVXcm5DbUw4dzFMQ0c4ak9qZ1lxNUtkcWVOOUVGdzgwNlhC?=
 =?utf-8?B?OC9Xdnc0WGJSbXNIVlljRTFZdmtNMWUvNzNQYUwvT0xHRmU4VHpVc0pEQVZq?=
 =?utf-8?B?TEpIeHJCYnFyY3FIOXYrVDJZcGJpNFFRZFJTVTFGOGNuSFVMVU10S012VHE1?=
 =?utf-8?B?cEYyMSs1MkdvLzVBM2pySFFMQWtlM1JYVGRXU0VjTjE1QmZBekNoY1hJUTl0?=
 =?utf-8?B?MGh5NDRtMU5iZVBaWUZnZTJWNVdjK3Z0QmIzeXRVVERFcE1rN3NENUtJMXFh?=
 =?utf-8?B?L2twdUs1NEFERElWR255NlA2blZKK2Y4S2JJNTdML0J5WENqaGsxcGErcTk3?=
 =?utf-8?B?RUs3UXFSVUl4Z0oraVlNcTRHaGpqeFBWQkpaOVU3ZFppMVVoY0hCdWpWN1ND?=
 =?utf-8?B?Ukl5KzA3eFFoYzU3ZWx0QnFIMFgyT0tHY0hzQThkUnFOald4MXNvNnUzRDJz?=
 =?utf-8?B?SENWNmpoZGpYREtuSHQ2Tm5iMW9yUUlBM2E4VVRnODdNdWNsemlkWDVLTzVS?=
 =?utf-8?B?K3B6ejUxdDluZVo3S3lvL25Sa0U1eFFXbFBGZUJLMlhSY2J0UGZTMDk2YVlt?=
 =?utf-8?B?NlFJeWhxanAya0VSMnM4V2VQK0g4QTJmOGhXWW5rSDB4TU1rSDJ5SktRbnNX?=
 =?utf-8?B?SDhSaU1EcjNrY0xqMGR6QVJZMjNUdGVJZll5SGFOTDNIK1l5SnhhZ2ZpdnJY?=
 =?utf-8?B?cWhvTUE1OG5TR3d4N3c1R0lQeUg1YmZiSXBsUGptaHpsaG9rVUFTbzJZQXpi?=
 =?utf-8?B?SnQ3VEZSYk5CUU9aSFBMS3NSekpWQ0NHS0dPK2lSWGxTb1dlK3N2N1VtdkFy?=
 =?utf-8?B?Z1VtZnF1Znd1YkhjL2p0TllqWmJLb2pib245WGhCNkhmMjFQbVJDbVMvY2Nu?=
 =?utf-8?B?OTg0a0NqVFZlbUFBVzMzSVVWM1FrUVBoSkhzakJzVENLZ0M1WjFDT3ZrWXBI?=
 =?utf-8?B?bnlwcmhKUEthQmRFQUxMZXhnKzFVNUJPUDBCV3RTcVZtZ3BpK29aRHpISUgz?=
 =?utf-8?B?aVg2cW9Qa0x0dTFxMzhGOFZuc05vL0F0M3dBSHUyQmFuVlRaOXJrdVZYQXNG?=
 =?utf-8?B?c2h2RDNSUzN3TWd3WE9XUzA3VGtmYy9rbXJSNVVDTUExVlhqS3g0OWhraEx0?=
 =?utf-8?B?ZXFuVXlVajlITno1VDRFVmxNQy8wQ3hHWHJqKy94S1ZVazcwK0RJMFUrdVRT?=
 =?utf-8?B?MjRyamdOQ2h4Wko4SmFkLzJFMlhybERvNTFvem9BZzVub3B6OGhqUmlSelBm?=
 =?utf-8?B?Mm9MTVN4Ujl6NnlzbnVlNzJIS1FBUWRYcTJPN2UxalU2WjhjU0FpSXV6dVRw?=
 =?utf-8?B?VVFXSWUxK2ZvSEFYaWNoMGFVd0Zyd0N5NDBqTkRHbmNPMFIySVJ1Y2lrNG9E?=
 =?utf-8?B?Ly9KdXZQT0RCNWhPR3VKcURxbVdJbko2cUdNWlh2R2I4T0pkR2JQOXhvbXRs?=
 =?utf-8?B?YTk4ZERoZGJDM0xtRnUzUHFISjdiSE9HMmF0aWcvWTM5RkJwek9ZdjVraHNB?=
 =?utf-8?B?NjdPNDFXVS9UTnRCUjZFL1JvSUh3bS91bUh4ZkFXZUdlN1dySmdEbjF0NHBN?=
 =?utf-8?B?aGlKaGVSOVBQY1g0SXlyYlNTK0tUdnRTOG1UUE8vdm1xU0d5REZDV3ZCenp6?=
 =?utf-8?B?ZUtRSzRZdDg3REJrOWVhRjJna3ZPcFlzNTdxcytCM3FPRE10WkxDUnhFaXNG?=
 =?utf-8?B?YU1wT3RkQXZITDRGQXpZOHJQdmxDbkhnTjdmYTRKRnNsV3FCNVZ2VTlYVzl6?=
 =?utf-8?B?UlhMYkZYWUlhVnZ5VjM0QXJnTFROUWpscW5wUXEvKzhSSFIvTndBMGcyMnZ5?=
 =?utf-8?B?eEE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bed19cd3-b9d6-462e-ace5-08dc8aac39e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 06:52:28.9587
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GD8h405ed2cJ8b0jizwdSd0FXJQ1e7eyPGgcxRwXLInOarcwO+f7knpcBxigBiwy7j9DF4YY/vF/yiX+ybbqedTfWWLVoKbJ6pDE+ZB1ens=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10001

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiBXZWRuZXNkYXksIEp1bmUgMTIsIDIwMjQgNzozOCBB
TQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDYvNl0gYXJtNjQ6IGR0czogcmVuZXNhczogcnot
c21hcmM6IFJlcGxhY2UgZml4ZWQgcmVndWxhdG9yIGZvciBVU0IgVkJVUw0KPiANCj4gT24gMTEv
MDYvMjAyNCAxMzowNCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gICZwaHlyc3Qgew0KPiA+ICAJc3Rh
dHVzID0gIm9rYXkiOw0KPiA+ICsJdXNiMF92YnVzX290ZzogcmVndWxhdG9yLXZidXMgew0KPiA+
ICsJCXJlZ3VsYXRvci1uYW1lID0gInZidXMiOw0KPiA+ICsJCXJlZ3VsYXRvci1taW4tbWljcm92
b2x0ID0gPDUwMDAwMDA+Ow0KPiA+ICsJCXJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDUwMDAw
MDA+Ow0KPiANCj4gVGhlc2UgdHdvIHZvbHRhZ2VzIGxvb2sgdW5uZWNlc3NhcnkuIFlvdSBrbm93
IHRoZSB2b2x0YWdlIG9mIHlvdXIgTERPLCBkb24ndCB5b3U/IEl0J3MgZml4ZWQsDQo+IGNhbm5v
dCBiZSBhbnl0aGluZyBlbHNlLg0KDQpBZ3JlZWQsIFdpbGwgZHJvcCB0aGUgc2FtZS4NCg0KQ2hl
ZXJzLA0KQmlqdQ0K

