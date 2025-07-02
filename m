Return-Path: <linux-renesas-soc+bounces-19012-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB004AF0DF2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 10:27:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4F7F3B84AE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 08:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 612422367CC;
	Wed,  2 Jul 2025 08:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="jlMWWrhH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010051.outbound.protection.outlook.com [52.101.229.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9B71EE7A1;
	Wed,  2 Jul 2025 08:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751444849; cv=fail; b=Ys9NUg/7lTr9UbWUwRHxf6jEqN2t9EQwXcxuDjXVGPmN70Qr+IdqTtVBtsCPwLg5JhbD/qp8Eyktbo2Atn3EJhXk/38uMYIee16lMIggJ0ROdKtbbSV7KXMAUTQ3SrwFp1zOROA1cS0VeFrHm9aJNbg6BuPMXwpL0CHxlMUU6MM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751444849; c=relaxed/simple;
	bh=fFnOX4c5FTQNJzBzYm7vxPQxjdon01k555hvrqc4Rpw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KEjOz1Z/6RBSgfaFRrpO+hL+NeUBehqIaV8ltVXY1/G3cW6spmslDyN+sgU/eHxs47io0wGhqi7lqAC16NTDrHM9ibnOkCsKNyTn3qZ8un9zNRzTQIChy2nW/KmY86zXDWUU4bXJebfGfyqzpgv1b36NTvVU29ghHRXCtFTmeFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=jlMWWrhH; arc=fail smtp.client-ip=52.101.229.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y1c1gWb6HuzL+QRfaXmT8kJJOf7hmdRlhl52W3B51ed1VUjntbZb+7HM6VhLsBr8cumBVRK36HHmmfOpwKkcIrcWFATJ+tKIC/S+wrR90T/lu7U9NOahwDRdlaTloz4x7PZy2hM6Dej2M3NvlfO7y84oOhCKC+H3aeFwiOAqWo3YBT5ugsS0hCIvzgQFTTL9GDDZZZilYXg5v5wV7Eh0vsonQCk+SCT8LaCuuPEG5r1k3Y1LZoUamAVsZ9x81qGJpVu3w3UzeqSdf9AXA0a3cY7RhpU5CpYUUAWZM7FnevB7Ml696CtRhpNDfPsJoGuDAnD//80vT/uTr9SjzXrEWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fFnOX4c5FTQNJzBzYm7vxPQxjdon01k555hvrqc4Rpw=;
 b=LxkYzxp1F0jtq8CdF1vF1a4JAnVmV8DK1C9NhvX3WOX4Mg2/yLP+n6QG95ngHBA0yGo3JE47kgZcUr+Q+pVCH71DXv8wMMHQ9Q7+qumjesdge8FA1eZUZzqNYJ825sWpCsCorh24FDqK5Jez0xsl3u2RSfs5BV7HW8UR+LaFSNLPi8rbqss//EliLzI3wEbTnL7EknUiMuRpawek7bCK3JQXdzWQJMC70F221lG4HvaQWlu2tz/fkEoM8EiRUr5QXyghAm7CIES48yio5L+1N47v0wCDCEXf5jvc983vfznjJ9tZd9MVfRjQm38Gk+cbdw6NOHampFeLwELLAbIaJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fFnOX4c5FTQNJzBzYm7vxPQxjdon01k555hvrqc4Rpw=;
 b=jlMWWrhHYRJK7buZIF1B5ALanSCqXZ6bHbKIpw7fENXjSrwhla6uGpKug/A/pE1RCh4k4Tfs5ZvkE7ZK09Svp/5C2xLh+kyB/tYNa1hkfUV5FTeaTES5ux2Vt1JnzNyNRWTGByBUuHZ3HMRZ0r2Sw3R0yUMkc8hsJAf5AFft5o0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB12064.jpnprd01.prod.outlook.com (2603:1096:604:263::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Wed, 2 Jul
 2025 08:27:16 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 08:27:15 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH] arm64: dts: renesas: r9a09g047e57-smarc: Add gpio keys
Thread-Topic: [PATCH] arm64: dts: renesas: r9a09g047e57-smarc: Add gpio keys
Thread-Index:
 AQHbrVNDGj8C8kQeE0eZE1bPrrwQPbPEGWSAgFmCYRCAAAYYgIAALWkwgAAGyqCAAQ1TAIAADD5A
Date: Wed, 2 Jul 2025 08:27:15 +0000
Message-ID:
 <TY3PR01MB1134678E0033ED967A79B4F558640A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250414153818.214811-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdUjtG-EcrpbDO2y8M=GQeV=5i4qODp=VZqymipeCneXhQ@mail.gmail.com>
 <TY3PR01MB11346205BCA481EA7B740A3028641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdVNCRGMmgBT2Ow4Af0CTf1iiS=AwhsLnZMFFy40tLYS0Q@mail.gmail.com>
 <TY3PR01MB113462A4490760D5C6C59FF968641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB11346C70FFD599B85A790B8278641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdWCq7eQ0Fpq6oMFP-n_yZZV8TB2WXV3SgjhW3Wne77CxA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWCq7eQ0Fpq6oMFP-n_yZZV8TB2WXV3SgjhW3Wne77CxA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB12064:EE_
x-ms-office365-filtering-correlation-id: 7ca321c5-580d-46d8-d0fc-08ddb9424085
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VTY5T2JlVEc2MTRwKzQ4dDN4Z0h5bEVudHN2ckRnTTY0RlF3TWhHNEdsUlBB?=
 =?utf-8?B?RzN6Ry9yMjZyNUlVcmw2WXBnWWY0Tlo0NDRYOHlRbG80VDg0SGFDenAxRU1p?=
 =?utf-8?B?Uy9VTUtuWktNK0thNURsbkJDeXFBWmhQNlc4d21xZXZISUVwM2FuK01wczE0?=
 =?utf-8?B?d3R4MVppUkovVXBCMlkzWGJtN0hIeVFnT1ZYUEE5YWh5d0w0d2M3eUxEQldJ?=
 =?utf-8?B?Nlp0OENCOFU4QnZMa2ltY0NndmNBaVlkMzRDQmhoYW42bGFPS1cyV25URkox?=
 =?utf-8?B?MEdETGJmaXJXQ0liOG9XREU0aGZTaEU3RFV6TFVoWmFxYXowd3A0TmNQTmdY?=
 =?utf-8?B?bnU1SkNmb0g2UktxVll4Vytxd0JvQWpiS0dYQmI3OCtJTXhKRVdEYlB6WGQz?=
 =?utf-8?B?R2NUVEtCRVdTUnFBaUwxRDdzeUYyZmdrUVhaVVF1aUJIZ1JrQVJ4YUxNTWha?=
 =?utf-8?B?MW9hVXR2M2FUeDZoa2I5YXlOWlJybGJ3a2drNHhFRkprb2g0MERrYUZRRWFn?=
 =?utf-8?B?RkdVUjc4YUplU2EwM2o3QkJjTEJyc1REVk1kcTVRMXRjbksxT0E5OTFmLzBJ?=
 =?utf-8?B?bmlrVU5GZE5mOVRNcHJNQXgwRmU2VXpUbUQwR2dLRE1LU1pVV2F1SFptSzJJ?=
 =?utf-8?B?ZGFHS2grZTFvZDhuRmlRSmYyalptQ04xclBQUXBHQmhZdDJFbHRCSjhCTk1Y?=
 =?utf-8?B?OGFlZDJ4U2hvUExaWVh6dVdnaCtOcVk3a2ZZZlEzaVlzWGJVK2pCTDRxaklP?=
 =?utf-8?B?b0srcWFIRGFaYm0xYlJwSTZYQ0NuZWhIWW1yakFZbktGdVY0cHlGNFZHVVdF?=
 =?utf-8?B?dk8yNStuazBQdFJtUFYwVFlWT05pOGZyckZrd1ZkR0piRkNxQ2t5dWtON1Y0?=
 =?utf-8?B?dlZkdE5Fd2E1ZTg3b0lhWVE2QVZ5dzN4SVRNaXNmZ3krYTNDNGtmNWRMaXJN?=
 =?utf-8?B?UmJKYy9qeGZZQ05KNzQ0N3pIbWNrbTZGTGhHZHNUcXdXNkIrb2NiVXkrOTkw?=
 =?utf-8?B?eHo3QnBSYlpXZEd4Vm4rd1NpMHM0M1NTa3Ezb2NtWEJRSGNieXgwWkpUdnE0?=
 =?utf-8?B?YjJzUzdaQllyR203VVlVVldoQmVMMW4yTGtWWUxiQUdSUnpabUVPSUtnY0Iv?=
 =?utf-8?B?U2M3VnFGWlQrR3RKcnBqSU5wWElJaFgwKzJXc3hiNGJKdXU1ODFQUWRnMTNS?=
 =?utf-8?B?cTBJZ1hJZW52Q3RINkRlVEVoT3hPT0pkRldSbVM1b3ZnQ01YSTNONW5GQUU4?=
 =?utf-8?B?Z3RxN0lWNVJKV0RhalRTV3oxSkt0RHZjb2x4dFJXSjlaTlM4T3JZSE1IQXRW?=
 =?utf-8?B?Q01pVmpaME5UMnhCVy9sYVA0Z2YxOUhra2IyTHFtZkRlSDNwbDdvNmt2ZXpM?=
 =?utf-8?B?MjNmSEU2U054RDJEaWVxcCtxaTBDcXlDanVLaWR1dkZBanRnM0FwOGdGdWUx?=
 =?utf-8?B?eG9MWWNvSjdXQ0ZtdWV6TkZjK3VTTVVna25ydkhiYjJNU0NFSndyeFhkN1RP?=
 =?utf-8?B?UFFwanNxVDJhd0paYU9HSzhoZFBIVEhQeU94SnhJcU82NVdScHZRM1NPKzBv?=
 =?utf-8?B?VEpGdnF5bExtckJpVjg3aVJXeGVmclNUdGRBM3RzV3VXNTNUd0JEUnhmVDNL?=
 =?utf-8?B?YWc4M3FpSG1jZCtkZERLaU4xWjhNWWZRWHpybDAyTjRXbnR3OGlTN0MyRTNv?=
 =?utf-8?B?a2t2d3QxbU55TW9sQTRtdUJYQytiQkI0VWg3d2FJRHZpZFE3V0Ezak90Z0xp?=
 =?utf-8?B?Zzk2Nkd5NitCclFiemtMaGRtQ1VvVTZ2NzFnb0phdXhDb0Q2VVh0VFJ3UFhB?=
 =?utf-8?B?QkV3b3VMeWRtYjhpdkxKa1RwVEtIMERLazZpcHlBQmNOL0xMTUNlMjh3VDhC?=
 =?utf-8?B?Y2VXeXdCWnMyK0tyMFdmeFFjZVFHUFIyYVNJY1dvUmtLUFBsL2hGSktyMmtx?=
 =?utf-8?Q?JHztCSsi/0E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SCtTK2c3Z2hteVlGdDJ6R21CVnBXLzNWQ3NLTThKUXNMZ2ZBMmJJcjNmNUV3?=
 =?utf-8?B?bUoyaDk5L0VlTC8xSWc5YUZVcTVRZzlMWHdTaVRpR1k1aEthTFVVaU9UZmg0?=
 =?utf-8?B?aGdjVmlCdkxBaWFqaFVvZHpkRytNelFMMjJCb3RMWlJONHUyTXR5OGxlbHV0?=
 =?utf-8?B?ekdwSC9QMm1aN0swMUJUK3Z2VnRFS2pCdHVkWlVzUzVuRlYyV1A3UDU3cG5o?=
 =?utf-8?B?RzhsMVk0djNKMHhZQzdJQXNGNTNCYnk3MC9CYkJJUGZQa0hrT082WXZkQk5J?=
 =?utf-8?B?UXlVdEtsVEVLZndkdVd2RUJpRmRxd0RjSkRlQmVhMjlUNWZsTWczbFFVWXYv?=
 =?utf-8?B?TzFpT2p2MUhXQ0htcEJyd1d4RTVVdlZkUlIzWHZGemUyUnJMZ09EbmJDaFV5?=
 =?utf-8?B?U3ZRcERrR0UyaDlybXFCWXA3S0w4czN3dGYwWEJmRDBDVmxsWVRWQllmeGto?=
 =?utf-8?B?Uy9abnZUSEUxd0FRN0QyRXl5V0RLS1JUYmhHbHZYdTBpSlg3OHNWWGgycVdM?=
 =?utf-8?B?WU84eTB6MUQ1aGo3L2hkZit4ZFJmVXdIeVBlS3ZlZjZKT2NvUkVjZEJVVGND?=
 =?utf-8?B?cmNIVWVmV1RybFZET1N5MmQrQlhZRWlDaGUrK1Q1M29BWXFjSEsvQytTUnVr?=
 =?utf-8?B?bkt0TEpEakJuQmsxSUFkM1FHSmo0VDJOR0tENkI1bEttOHZsbDNMVnRjZXVT?=
 =?utf-8?B?TkhTTFFSekR3UEZTQm9WL2xadFNxZnJnWG9SVm9GL0R2cFllNjFmZkJXVkt6?=
 =?utf-8?B?L0haVFdvUFJrNGVta3FZaFMwQXprbGFwTUFFL3pGREx1ejA0K1NSMnFFc09h?=
 =?utf-8?B?OHo2SnN5d0J3MnVTMXdXWmdrZHhZc0xwN3FwZzFwNUZQTWtpNnJ4blFyZEtN?=
 =?utf-8?B?dlpLdThyaWhzM1NyVmJLZ2ZpSVU3NFN4eUNCOU1QbklzQ0YxUVg1Qkdvd1hP?=
 =?utf-8?B?TExiYzgrdFJwejJaWTZ0S21zanNlVmc1RmxraEdzV1BDd29vVkNTeFIvYU93?=
 =?utf-8?B?dnMzbXNodStQVEdHQ1NNbEVDbHJPbGNtV0NraUVleHVrZHdNaFUzUmVnWU9K?=
 =?utf-8?B?NTR1WnNFVEg3VmxXZTRBYUwrQ3VoK2tocFFyemVobGNrNVpkWWpiQ0NFdFcr?=
 =?utf-8?B?L2ZvdjNsSVF4cmdmSEx6TTlwM1ZkZ3hkVFU3Y052a3Z4Y0dJNUEwdzN4UkNp?=
 =?utf-8?B?QXJ0YU1LMmFMVTBVampuRGpJMVJwaExMQmZ6Tm0rWlBzMzBHVDJuZzZ6bEZF?=
 =?utf-8?B?cmdxUnJMaEZrd2tod1dKWkk3QWdUMkJPcSszK3h6OUpnWjZsRVkwWGEvUVNu?=
 =?utf-8?B?OGUrOWFGYlVSUFFwb1Jnb0NZcTJDbmFZaDVqT2xVNEdvR1JEcUczam1EZk5t?=
 =?utf-8?B?WW5nalQyWkZMcHJSN2VsNVFZazltVG5nRTlQNTNhblNZbzRrTWpnTVROcFNL?=
 =?utf-8?B?NThydGJaNUdGdzR0TTRDZzVCK0p3bkdma2ViN3YzVXVEeUhQUlBnTU0xaDVU?=
 =?utf-8?B?cHRlakl2Si84NXlwZVhxc3ZzYjN1TkNHUWc4anRpNU1HR01CRTZqNEsxYWd0?=
 =?utf-8?B?d25nU1lwVFpCWEpmT1FtdlZlNWFyT0RTbjlDMTFxNkdHTmVYSEs5d0tXWEdS?=
 =?utf-8?B?Y3FDd1B2NzlzMVQ4OC9rRHFsblduWjFtQmN4cndzbDZzWFhNYzRaRTV1SWty?=
 =?utf-8?B?bFdJT0hwWnJ0Q3ZrQUdYb1hhQnJIQ3JSWTNiOVQ5OGhRWVNJQ3lhd3VxZG1j?=
 =?utf-8?B?cnM5RUFVeUR2L3QwamNwc3Y2OGlmYjlzZGwzMEgzNG1yaWlMQ00wVDB3U0JZ?=
 =?utf-8?B?MGpmWTlLaEdXdEUwd2U1cCtoNGlaNHR2czBxSUM0WWwwOHRsVktUcmJPNHJ0?=
 =?utf-8?B?REtnNUxKTVF0VlQyMGFoWUZGR1I1STF6TWdZdkRpaEhXTWR2NUVNekxUZDRB?=
 =?utf-8?B?dXVjRzY4V0lOSUNsT2pyYVY0YkQzSnM5TzhTZEZxSnZNbTFLVFdYZUNMTENw?=
 =?utf-8?B?TVlCZ2tFcXcwL2p6OE55eDF5NXJ3UTdlN1Y5ZGF5S2JkQmJHVm5GUXFGVnl5?=
 =?utf-8?B?c1R5a3ZVVXRPT1kwSzdrc3gzQ3ZFQllqd083bjdQUWhmalg4MGZQUFpqbDU4?=
 =?utf-8?B?ZXJOcUFBRVVtenhWT3M1bkxDL2dDeEN3dHBIU2tBa0tRTVN3SGJFRDNBZmw5?=
 =?utf-8?B?WlE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ca321c5-580d-46d8-d0fc-08ddb9424085
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 08:27:15.7368
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 31skl63qmj4tPgbVINhU+B/ebnScSUvpRhb+7C0U2lf3+N/PSUtZfcbnK+0Ny7pBB8K9z7J3GHB5Bb9UmtA8NZbogMs8S0KnFhwWlVuwsns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB12064

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMDIgSnVseSAyMDI1
IDA4OjAxDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHI5YTA5
ZzA0N2U1Ny1zbWFyYzogQWRkIGdwaW8ga2V5cw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFR1
ZSwgMSBKdWwgMjAyNSBhdCAxNjo1OSwgQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMu
Y29tPiB3cm90ZToNCj4gPiA+IEZyb206IEJpanUgRGFzDQo+ID4gPiA+IEZyb206IEdlZXJ0IFV5
dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IE9uIFR1ZSwgMSBKdWwgMjAyNQ0KPiA+
ID4gPiBhdCAxMzo0MCwgQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90
ZToNCj4gPiA+ID4gPiA+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+IE9uIE1vbiwgMTQgQXByDQo+ID4gPiA+ID4gPiAyMDI1IGF0IDE3OjM4LCBCaWp1IERh
cyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gPiA+ID4gPiBSWi9H
M0UgU01BUkMgRVZLICBoYXMgMyB1c2VyIGJ1dHRvbnMgY2FsbGVkIFVTRVJfU1cxLA0KPiA+ID4g
PiA+ID4gPiBVU0VSX1NXMiBhbmQgVVNFUl9TVzMuIEFkZCBhIERUIG5vZGUgaW4gZGV2aWNlIHRy
ZWUgdG8NCj4gPiA+ID4gPiA+ID4gaW5zdGFudGlhdGUgdGhlIGdwaW8ta2V5cyBkcml2ZXIgZm9y
IHRoZXNlIGJ1dHRvbnMuDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+ID4NCj4gPiA+
ID4gPiA+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3JlbmVzYXMtc21hcmMy
LmR0c2kNCj4gPiA+ID4gPiA+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3Jl
bmVzYXMtc21hcmMyLmR0c2kNCj4gPiA+ID4gPiA+ID4gQEAgLTEyLDggKzEyLDEzIEBADQo+ID4g
PiA+ID4gPiA+ICAgKiBTV19TRElPX00yRToNCj4gPiA+ID4gPiA+ID4gICAqICAgICAwIC0gU01B
UkMgU0RJTyBzaWduYWwgaXMgY29ubmVjdGVkIHRvIHVTRDENCj4gPiA+ID4gPiA+ID4gICAqICAg
ICAxIC0gU01BUkMgU0RJTyBzaWduYWwgaXMgY29ubmVjdGVkIHRvIE0uMiBLZXkgRSBjb25uZWN0
b3INCj4gPiA+ID4gPiA+ID4gKyAqDQo+ID4gPiA+ID4gPiA+ICsgKiBHUElPIGtleXMgYXJlIGVu
YWJsZWQgYnkgZGVmYXVsdC4gVXNlIFBNT0RfR1BJTyBtYWNyb3MNCj4gPiA+ID4gPiA+ID4gKyB0
byBkaXNhYmxlIHRoZW0NCj4gPiA+ID4gPiA+ID4gKyAqIGlmIG5lZWRlZC4NCj4gPiA+ID4gPiA+
ID4gICAqLw0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiArI2luY2x1ZGUgPGR0LWJpbmRp
bmdzL2lucHV0L2lucHV0Lmg+DQo+ID4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ID4gIC8gew0K
PiA+ID4gPiA+ID4gPiAgICAgICAgIG1vZGVsID0gIlJlbmVzYXMgUlogU01BUkMgQ2Fycmllci1J
SSBCb2FyZCI7DQo+ID4gPiA+ID4gPiA+ICAgICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLHNt
YXJjMi1ldmsiOyBAQCAtMjcsNiArMzIsMzENCj4gPiA+ID4gPiA+ID4gQEAgYWxpYXNlcyB7DQo+
ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICBzZXJpYWwzID0gJnNjaWYwOw0KPiA+ID4gPiA+
ID4gPiAgICAgICAgICAgICAgICAgbW1jMSA9ICZzZGhpMTsNCj4gPiA+ID4gPiA+ID4gICAgICAg
ICB9Ow0KPiA+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiA+ICsgICAgICAga2V5czoga2V5cyB7
DQo+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImdwaW8ta2V5cyI7
DQo+ID4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIGtleS0xIHsN
Cj4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cy1leHRlbmRl
ZCA9IDwmcGluY3RybA0KPiA+ID4gPiA+ID4gPiArIEtFWV8xX0dQSU8gSVJRX1RZUEVfRURHRV9G
QUxMSU5HPjsNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBTbyB5b3UgYXJlIHVzaW5nIHRoZW0g
YXMgaW50ZXJydXB0cy4gRG9uJ3QgeW91IG5lZWQgdG8NCj4gPiA+ID4gPiA+IGNvbmZpZ3VyZSBw
aW4gY29udHJvbCBmb3IgdGhhdCAoZnVuY3Rpb24gMTUgPSBJUlExNCk/DQo+ID4gPiA+ID4NCj4g
PiA+ID4gPiBUaGUgc2FtZSBwaW4gY2FuIGJlIGNvbmZpZ3VyZWQgYXMgVElOVCBvciBJUlExNSwg
Y3VycmVudGx5IGl0IGlzIGNvbmZpZ3VyZWQgYXMgVElOVCBJUlEuDQo+ID4gPiA+ID4gSXMgaXQg
b2s/DQo+ID4gPiA+DQo+ID4gPiA+IE9LLg0KPiA+ID4gPg0KPiA+ID4gPiA+ID4gQWx0ZXJuYXRp
dmVseSwgY2FuJ3QgeW91IHVzZSB0aGVtIGFzIGdwaW9zIHdpdGggaW50ZXJydXB0IGZhY2lsaXRp
ZXM/DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBpbnRlcnJ1cHRzLWV4dGVuZGVkID0gPCZwaW5jdHJs
IEtFWV8xX0dQSU8NCj4gPiA+ID4gPiBJUlFfVFlQRV9FREdFX0ZBTExJTkc+Ow0KPiA+ID4gPiA+
DQo+ID4gPiA+ID4gVGhlIFRJTlQgSVJRIHdpbGwgcHJvdmlkZSB0aGUgc2FtZSByaWdodD8gQW0g
SSBtaXNzaW5nIGFueXRoaW5nIGhlcmU/DQo+ID4gPiA+DQo+ID4gPiA+IFdoZW4geW91IHVzZSBp
bnRlcnJ1cHRzIGRpcmVjdGx5LCB0aGUgc3lzdGVtIHdpbGwgZGV0ZWN0IG9ubHkga2V5DQo+ID4g
PiA+IHByZXNzZXMsIGFuZCBmYWtlICh0aW1lci1iYXNlZCkga2V5IHJlbGVhc2VzLg0KPiA+ID4g
PiBXaGVuIHlvdSB1c2UgR1BJT3Mgd2l0aCBpbnRlcnJ1cHQtY2FwYWJpbGl0eSwgdGhlIHN5c3Rl
bSBjYW4gZGV0ZWN0IGJvdGgga2V5IHByZXNzZXMgYW5kDQo+IHJlbGVhc2VzLg0KPiA+ID4gPg0K
PiA+ID4gPiBTZWUgYWxzbyBjb21taXQgY2FiMzUxMWVhN2EwYjFmYyAoIkFSTTogZHRzOiBtYXJ6
ZW46IEFkZCBzbGlkZSBzd2l0Y2hlcyIpLg0KPiA+ID4NCj4gPiA+IEFzIHBlciBbMV0sIGZvciBH
UElPcyB3aXRoIGludGVycnVwdC1jYXBhYmlsaXR5LCBJUlEgY29udHJvbGxlciBuZWVkcyB0byBz
dXBwb3J0IGJvdGggZWRnZXMuDQo+ID4gPiBCdXQgVElOVCBzdXBwb3J0cyBSaXNpbmcgb3IgRmFs
bGluZyBlZGdlLCBidXQgbm90IGJvdGguIFNvLCB3ZSBjYW5ub3QgdXNlIHRoaXMuDQo+ID4gPg0K
PiA+ID4gVGhhdCBpcyB0aGUgcmVhc29uIHVzaW5nIGludGVycnVwdCBkaXJlY3RseS4NCj4gPiA+
DQo+ID4gPiBbMV0NCj4gPiA+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjE2
LXJjNC9zb3VyY2UvZHJpdmVycy9pbnB1dC9rZXliDQo+ID4gPiBvYXJkL2dwaW9fa2V5cy5jI0w5
ODANCj4gPg0KPiA+IFRoaXMgaXMgdGhlIGVycm9yIG1lc3NhZ2UgSSBnZXQgaWYgc2V0IGdwaW8g
d2l0aCBpcnEgY2FwYWJpbGl0eQ0KPiA+DQo+ID4gWyAgICAyLjE5MTgxOV0gZ2VuaXJxOiBTZXR0
aW5nIHRyaWdnZXIgbW9kZSAzIGZvciBpcnEgNTEgZmFpbGVkIChyemcybF9ncGlvX2lycV9zZXRf
dHlwZSsweDAvMHgxNCkNCj4gPiBbICAgIDIuMjA0MTY4XSBncGlvLWtleXMga2V5czogVW5hYmxl
IHRvIGNsYWltIGlycSA1MTsgZXJyb3IgLTIyDQo+ID4gWyAgICAyLjIxMDAxOF0gZ3Bpby1rZXlz
IGtleXM6IHByb2JlIHdpdGggZHJpdmVyIGdwaW8ta2V5cyBmYWlsZWQgd2l0aCBlcnJvciAtMjIN
Cj4gDQo+IFNvIGludGVycnVwdHMgPSA8Li4uPiBpdCBzaGFsbCBiZS4uLg0KDQpPSy4NCg0KVGhh
bmtzLA0KQmlqdQ0K

