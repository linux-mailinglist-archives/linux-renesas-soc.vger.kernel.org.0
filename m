Return-Path: <linux-renesas-soc+bounces-31333-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ENOMoAP4WnoogAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31333-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 18:34:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E99D4411B99
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 18:34:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 090EF300FC75
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 16:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0AF326E6F2;
	Thu, 16 Apr 2026 16:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="G9V099IW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011012.outbound.protection.outlook.com [40.107.74.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D607C19E98D;
	Thu, 16 Apr 2026 16:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776357086; cv=fail; b=mYbxTZMfp3oszipM0VSZ7v5ZIRkoJ981DFX2T9QeTBB7Et+ywLPUHLZMONEdMF9+CXu2EkmPkwVh5KYNW4CxLCdAUin+C/X2c3aVHRTQhf3S9v/FrFIoc+LBNHbdYGeGzr6rz3C0VQhqfeJ9LV/AAbdpF90h2RY/QnKSRkrrMWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776357086; c=relaxed/simple;
	bh=JYZSznhA93hKgBZo9vl7emlLo/zsOxJIDDheP+FdPIM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=H3FMurqBEAUW+hStvR8RpNbN7eNrcl4nqgJZzTlyaxbixfzGyJRQXO2Ka/VHJvXUm0aDkUiqoC/nQJnI770vNbJ5v7UJVxJjViemoCacixth8v/DKG/Dq5v/xCUqTp//rvUtYQlaMpbl1aMKctihaF1lVCPnt1VI+u+eGyJ4BcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=G9V099IW; arc=fail smtp.client-ip=40.107.74.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TEmk0fclhCl/v1Mow+X5lv8Rof9T/mZU+c5PRt24jWNb0Y/TasGv8hh/UiiDZkSCNXAp0haUB+Caz4EtxVxN4wG8IM6ny2B0UFiNLsbPuvI2ajigljZgjHFMtOC7ibyiWWOdlyXcejXZubChIWb+rH3fU8Fe05HiZy87P9QsJbyRmiUQLWGwn9nNJ7pdN2hlZiavTLl8diTr4SAe8prND2pzbSTAHIZkNIC5gNzE9Ljwv2Dg0XnBYEovPS9Ijy9jwPRET8zOf4aYLW9MCj8ibTYkXoJ2m1vM+ItKlqDGJegX80AuG0DLI1d4lCZ03IDeCKAc6kmZbstPiJmKwmmqHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYZSznhA93hKgBZo9vl7emlLo/zsOxJIDDheP+FdPIM=;
 b=phs7mPBneUE+sld08a1TSbmFE5eBk0zvPHXK/B3XqPOYKgj3kzNtwjnz67qQOT8qEvhms1BT/B3J8XEp31FlYJ9290pYr4d7CrtHK4JZYWSdy3PvluojpcaKzeC7+21tSYTlYHzhJm4V5dRbQ0UiDeg8RY7m7RyK391P6h82ZBIjwHrXykmcy4B8rRFMXjtKSxnJKE2TnUFMQqfFP2PuGwxwzKriI1U+4Gvx3XzttJF108TzY/fTTCUlFT+qOqwzouDX+pWih2LhcvS9j3HGJaRuanPda8jbhkxowQXYEMeB4zVUsbKZg+RV+WIGcpnei7LESqYs3kWbX0JVADiAUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JYZSznhA93hKgBZo9vl7emlLo/zsOxJIDDheP+FdPIM=;
 b=G9V099IWwM7IiSL7Ef+PXx7fSCX+g4z6xwWZUwkI8piVZ2Tf3tzV0NAFnw4/63HAMYSHl+bGc3jo58gKokCxS7DQtgqNxshAIGkAFkzg/pkkfpwZ//sFsFj6eWzjeTDYkdKeHwZ+i45yJEi4yxSEt8yTDD9zN1bcud1Gd3hsBVU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB14048.jpnprd01.prod.outlook.com (2603:1096:405:214::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Thu, 16 Apr
 2026 16:31:20 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9818.023; Thu, 16 Apr 2026
 16:31:15 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: Hugo Villeneuve <hugo@hugovil.com>, biju.das.au <biju.das.au@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	wsa+renesas <wsa+renesas@sang-engineering.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
	<linux-serial@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] serial: sh-sci: Avoid divide-by-zero fault
Thread-Topic: [PATCH v2 1/2] serial: sh-sci: Avoid divide-by-zero fault
Thread-Index:
 AQHcx2L1WxU/Wbm0ZkuvgJVMedankLXVW0yAgAAAwXCAAAUgAIAAAHbQgAdvCACABRxAsA==
Date: Thu, 16 Apr 2026 16:31:15 +0000
Message-ID:
 <TY3PR01MB11346E163C0E4AD61C22A6FBF86232@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260408142105.310210-1-biju.das.jz@bp.renesas.com>
 <20260408142105.310210-2-biju.das.jz@bp.renesas.com>
 <20260408123039.922a75327fd7672df3bd61da@hugovil.com>
 <TYCPR01MB11332B594964DDF0763499184865B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <20260408125142.24cd94f094ba3ca512e7f346@hugovil.com>
 <TYCPR01MB11332859E901171C91C543061865B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <CAMuHMdW770zLQt5NiUZffhg3ztXzvM8iT=byBzKJEU9Gm8OykQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdW770zLQt5NiUZffhg3ztXzvM8iT=byBzKJEU9Gm8OykQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB14048:EE_
x-ms-office365-filtering-correlation-id: cc81e7c2-ef04-42d0-c4ea-08de9bd59486
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 2Sn12uQQdDiUrq3rfSLXk2RlPT+C+fLz6SeqfETN27CtFPGwdph62vF4MYbeJlSeOnPDwejEPYLn4NTRDIdLWXwPXtOkUcfKTJzcdKK2dr2nnPU8DKqVdvhpZw1eU48g3MZOXor9RHEc9BteyPCA0cah2Yr3WP3vDIS/NiHGDrl8LlDGFGqEc5ebgmpJPms7fqjCn+v22p26sVhfzCa/NvwFnjPiXtuTzj7l4ot7bEhqsgPPaCssNS3hnB1bXGINgKxXGMFx5JUwVk4FpvkHLai1wOXXiAm5La5Xk2uQRQIs/jtwhuZ3eJCVVaVab9OjOerycQ0NbHiaSfq3jP42gfy7q2nhQ1PGtxBsUILowCxVOVaDM6o6BxbGjdT/FUpJsYfsI1NsZcnjSFPY37YbBfgiGd23prq1dVkQovt3ISXezhyxKnKnBjtOVfldhgeNEWvSbuYTYqt8y/kIqYHjkveTYRo/S/q1xqNNEQTUujgFO2WsDfxrQ5BZ6Hp7KBfEwVaa7TBIceJfddg86ucHihDkc9ZjVDVCrd8M9SKOpRVshSaa0T6RzJIV2XrBT3ZiApalnbWsdfmZaUpSVIY1csRqqQF/yCcrw9tsUJOQ/UPYbeSlerB9/T6En5WsoCLD6u5vvk6JvQXQbr8O4zM8Sp4utkIvh5ldQ6ITCew4OXm/uWoVf39PQR/wDwx7KGYWqBM0gWITnV4GccCgIBXBNGTDClkHfmMzX58yoQmIoXPM8gGZc41rMGO6OoDcipti02PKwZ9lsLI6HJqxgGRRtLdRD+zOjBRJy6YH/sFH5ig=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NVE0VFNXQ1FBbGRwMWw1MUp6RWJURjRHL0JkUE5WUnNxZjZhZkVCUCtOK3lz?=
 =?utf-8?B?YVB5ZjVDTDVUS0xuOUtNdG8rWHE4bjdXZmI2M2tkd29VTEpacktOYUU1Mmlv?=
 =?utf-8?B?aDBvSzArTmRrWW1sUkpXOFEyWVk5ZkhNcFVTaWZWYWNMa2RZVEptUXdkYXlZ?=
 =?utf-8?B?Zzc0MUJJcGQ0S1plMXZ4R1YwK01nUitaZVRsTHJmTTJuVXEwcmNocmVMNWZE?=
 =?utf-8?B?alFiaElGZnJnYkc4UHcwalBSdFNqQ3JlQUhUdisrcm5aNFV6cUl3Sy9xL1RI?=
 =?utf-8?B?Mnl2Y0ZjbVVMemI2Ynp4UWc1V0FiYytaSGZEM2JnWUlmOXVYUndPdEtTR1Av?=
 =?utf-8?B?OGY4bThRaktxVndFQVBjWTBFR1hEMUd4YTVwbHQ5K2Rteno1UjhGc1padmZZ?=
 =?utf-8?B?dTk5TzVzN0crbVI2cExBWW1ockt4L1E3c0ZOUjAvVHFSZVhVYmtVUmo2SWZy?=
 =?utf-8?B?dTAvUnFmTHViOVZnNThISFhiQ2o5RWpZNnZpeEc5YlczNkFuMUtKNU90OXMy?=
 =?utf-8?B?bGlUOTdmL2xuK1JEUm9BMmJCMDRuc09iNDRmS09RNHdEQVhiMTVFbWU2Nmpa?=
 =?utf-8?B?VjU5cWwvSkw2NW45bmNlOHpERU5JSDlhNzhyckFpSWhEaWI4M1NYOGxQdk1L?=
 =?utf-8?B?S3g2czBvanBPYkVyZ0tlb1VrNC94RTFxV3JTdS85OU9vZVNGdERDZlRmZGdE?=
 =?utf-8?B?elRWejMvZ1pMa2VyTTNrOEx1REpNZHJmVGpmT0tQMnovbWVZV2pacEJrd0ZI?=
 =?utf-8?B?aWQrSExrZXhYdzNjZk5qTmVhRkY2S05pd0ZrdnlJUEFvdEFOZld0M2lxd1E2?=
 =?utf-8?B?N3VYMC84SFVWNlBMaWxHNEhqaU5nVkpUWDFiM2c5VGdWMGdkcVU0WVY4eWhh?=
 =?utf-8?B?Unc4RXFlcC9mc1V4ejErVThvRlcwMmtHZ2htcUNWMjEyVHNBVnVxT2tBMjZK?=
 =?utf-8?B?N0prbGlIMGpsR0pKT3p1MHdQbUU1UThKVTRPV1l4WWt1VmY1STkrZVZYME5M?=
 =?utf-8?B?UUNHalpvRkp3KzdCL25UU3ZkTGFEbExLUm8xVTRBVUhwVXVHcHlkL1N4bkZy?=
 =?utf-8?B?NllBNEFkTG85cCtaQWtiaFd4Nm5SOHMrZGRHT2IxN2JYaFZ1UE50L2p1Q3pj?=
 =?utf-8?B?UkNJdVZGVmZ3Y0Z0Z1VSRndKWWtsZjRra25yaThzY2NYN2ViWUh3cGpyNzN6?=
 =?utf-8?B?UGphNmc0VEhQZDM3N2NaZ0tuRGtnNVVOd2FsRG1lZFBHZzBpZ3hWeGFOZUgr?=
 =?utf-8?B?M1A0b29FbnB0WDFjRngrMG9QTzVxelE1YW15djRSZDc2ZklMRnREZWhwcUZw?=
 =?utf-8?B?OUxWSCtBaVkwVjJ0RTF2eHBDR0xIOXNkRnQvSFVqSkp0SzY0OCtTalhoOVli?=
 =?utf-8?B?eUY1bW12aFhlZS9YUEdHY2VyWld6R2FCeDBBSGRPN2MzUS8zanA0WWYxSjRK?=
 =?utf-8?B?SVlGVmlHcGtRM09HVEF0dndMZDArSXUrVlZBTkg3S1hHUC8xRVlnOGkzeE02?=
 =?utf-8?B?OXVLN0toQW9RQjZEMzZUY3dud2x6M3FkUXFIZTl6TlVyUEcyNlU5UTFIb244?=
 =?utf-8?B?Qkd2dmdZS2VyR2tDR0p0Rk42R3FlSXZaaFNpNmRDKzdsMnppVlN3K0IrNDRW?=
 =?utf-8?B?Q2FVdnJScWdIaUFzWnFiUGl6eGVDV2w4c0JlUDVRSU1zYnVnU3NRellackM0?=
 =?utf-8?B?clhndlU1YXVVbkhkTHFrVHAvaEZ4RWlZUGdncGtKVEc2Q3dUSU5Uci9kR3dD?=
 =?utf-8?B?eHdzYzVCWjNhN1RqRlBNM3NkRzE2dXZuSUpLZWdaTm9oNjZMOGw5eTZCS0NS?=
 =?utf-8?B?SjZlRS93MHlQd3JMWTVQMEtPRjdqbjlPZkJMbDRWYkFKeXdaejBZUHp5NmhY?=
 =?utf-8?B?cnp1VDBuWWlta2IxRy9vSEx1RWU3NVQrcUw2aVhGMzhkOHFZT3VIc2xBTWMz?=
 =?utf-8?B?Z1NCdUVwU1Y4SDVQSzJmdUFjQzE1T1h1R2Y1b1BMenJ6L2o3aDR0d3E4bjdH?=
 =?utf-8?B?Sko0RGpSazF6QzN1dTRHdlF4NXlacFU2K243SUI0SEhNL1QyUlcvdXByRzh5?=
 =?utf-8?B?eUV4SkU4ZzVsOWx5TndEcUluVXhoQVZZUlprQ05qWEdkYkF2SU9mNGxLaDEy?=
 =?utf-8?B?SHUzYWREQnJ5YVcvTWVqRWN4dmdpYmdKanE2dDVScnJjb0syMkNxbHF1Ym9D?=
 =?utf-8?B?TEJrc3NKZm5rbS9Yb2xOclM0aGN3MnVwUHo3b05tZHk0NHlTUzZPOHZqbTBK?=
 =?utf-8?B?TmdCc3lpMFVaS0tSdG10RVVRcjVHNksxMHFkUkcyNlpWaTg1VjBHcEpKWGZi?=
 =?utf-8?B?UXZDMnlGb3dDbUc0dkZSRzU1eXdQTnIyd1lsUzBleGxTS21MOEFNdz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cc81e7c2-ef04-42d0-c4ea-08de9bd59486
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2026 16:31:15.5107
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J1lZOdF4hm4bZwFuapJ2kTnAavLoFG+eYv82rvsO6htFbk2wZ38V7zPujc7q2M1I51xgw8F+CaPYvPSRQtVRP2Dhz5Yz4e+/MXSENqvaczI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB14048
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[hugovil.com,gmail.com,linuxfoundation.org,kernel.org,bp.renesas.com,sang-engineering.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31333-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hugovil.com:email,linux-m68k.org:email,bootlin.com:url,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: E99D4411B99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDEzIEFwcmlsIDIwMjYgMTE6MjUNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MiAxLzJdIHNlcmlhbDogc2gtc2NpOiBBdm9pZCBkaXZpZGUtYnktemVybyBmYXVsdA0KPiAN
Cj4gSGkgQmlqdSwNCj4gDQo+IE9uIFdlZCwgOCBBcHIgMjAyNiBhdCAxOToyNSwgQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+IEZyb206IEh1Z28gVmls
bGVuZXV2ZSA8aHVnb0BodWdvdmlsLmNvbT4gT24gV2VkLCA4IEFwciAyMDI2IDE2OjM1OjQ0DQo+
ID4gPiArMDAwMCBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0K
PiA+ID4gPiA+IEZyb206IEh1Z28gVmlsbGVuZXV2ZSA8aHVnb0BodWdvdmlsLmNvbT4gQmlqdQ0K
PiA+ID4gPiA+IDxiaWp1LmRhcy5hdUBnbWFpbC5jb20+IHdyb3RlOg0KPiA+ID4gPiA+ID4gRnJv
bTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiA+ID4NCj4g
PiA+ID4gPiA+IHVhcnRfdXBkYXRlX3RpbWVvdXQoKSBjb21wdXRlcyBhIHRpbWVvdXQgdmFsdWUg
YnkgZGl2aWRpbmcgYnkNCj4gPiA+ID4gPiA+IHRoZSBiYXVkIHJhdGUuIElmIGJhdWQgaXMgemVy
byDigJQgd2hpY2ggY2FuIG9jY3VyIHdoZW4gdGhlDQo+ID4gPiA+ID4gPiBoYXJkd2FyZSByZXR1
cm5zIGFuIHVuc3VwcG9ydGVkIG9yIGludmFsaWQgcmF0ZSDigJQgdGhpcyByZXN1bHRzIGluIGEg
ZGl2aWRlLWJ5LXplcm8gZmF1bHQuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBiYXVkIGlzIHJldHVy
bmVkIGJ5IHVhcnRfZ2V0X2JhdWRfcmF0ZSgpLCBzbyB0aGlzIGlzIG5vdCByZXR1cm5lZCBieSB0
aGUgaGFyZHdhcmU/DQo+ID4gPiA+DQo+ID4gPiA+IFlvdSBhcmUgdGlnaHQsIFdpbGwgdXBkYXRl
IGNvbW1pdCBkZXNjcmlwdGlvbi4NCj4gPiA+DQo+ID4gPiBIb3cgY2FuIHVhcnRfZ2V0X2JhdWRf
cmF0ZSgpIHJldHVybiBhIHplcm8gdmFsdWU/IElmIEkgYW0gbm90DQo+ID4gPiBtaXN0YWtlbiBl
dmVuIGZvciB0aGUgQjAgY2FzZSwgaXQgd2lsbCByZXR1cm4gOTYwMD8NCj4gPg0KPiA+IEFzIHBl
ciB0aGUgY29tbWVudCBhbmQgY29kZSwgdGhpcyBBUEkgY2FuIHJldHVybiAwLg0KPiA+DQo+ID4g
KiBJZiB0aGUgbmV3IGJhdWQgcmF0ZSBpcyBpbnZhbGlkLCB0cnkgdGhlIEBvbGQgdGVybWlvcyBz
ZXR0aW5nLiBJZg0KPiA+IGl0J3Mgc3RpbGwNCj4gPiAqIGludmFsaWQsIHdlIHRyeSA5NjAwIGJh
dWQuIElmIHRoYXQgaXMgYWxzbyBpbnZhbGlkIDAgaXMgcmV0dXJuZWQuDQo+ID4NCj4gPiBJbiBk
cml2ZXMvdHR5IGN1cnJlbnRseSBvbmx5IDEgZHJpdmVyIGlzIGNoZWNraW5nIHRoZSByZXR1cm4g
dmFsdWUgYW5kDQo+ID4gaXQgY2FsbHMgcGFuaWMNCj4gPg0KPiA+IGh0dHBzOi8vZWxpeGlyLmJv
b3RsaW4uY29tL2xpbnV4L3Y3LjAtcmM3L3NvdXJjZS9kcml2ZXJzL3R0eS9zZXJpYWwvYXANCj4g
PiBidWFydC5jI0wyMTQNCj4gPg0KPiA+DQo+ID4gSSBiZWxpZXZlIHdlIHNob3VsZCBjYWxsIHBh
bmljLCBpZiBiYXVkID0wLCBpbnN0ZWFkIG9mIHByb2NlZWRpbmcuDQo+ID4NCj4gPiBHZWVydCwg
YW55IHRob3VnaHRzPz8NCj4gDQo+IElJUkMsIGJhdWQgPT0gMCBjYW4gKG9ubHk/KSBoYXBwZW4g
d2hlbiB1c2luZyBlYXJseXByaW50ayBvbiBhIG5vbi1EVCBzeXN0ZW0sIHdoZXJlIHRoZSBzZXJp
YWwgY29uc29sZQ0KPiBzaG91bGQganVzdCBrZWVwIG9uIHVzaW5nIHRoZSBzZXR0aW5ncyBwcm9n
cmFtbWVkIGJ5IHRoZSBmaXJtd2FyZS4gIFNvIGFueSBjb25maWcgcmVnaXN0ZXIgd3JpdGVzDQo+
IHNob3VsZCBiZSBza2lwcGVkLg0KPiANCj4gT24gRFQgc3lzdGVtcywgZXZlbiBlYXJseWNvbiB1
c2VzIHRoZSBiaXRyYXRlIGZyb20gY2hvc2VuL3N0ZG91dC1wYXRoLg0KDQpJbiB0aGF0IGNhc2Us
IEkgd2lsbCBkcm9wIHRoZSB6ZXJvIGJhdWQgY2hlY2suDQoNCkkgd2lsbCBhZGQgYSBuZXcgcGF0
Y2ggd2l0aCBiZWxvdyBjaGFuZ2Ugd2hpY2ggaXMgYWxnZWJyYWljYWxseSBlcXVpdmFsZW50DQpi
dXQgZWxpbWluYXRlcyB0aGUgaW50ZXJtZWRpYXRlIGRpdmlzaW9uLCBtYWtpbmcgYSB6ZXJvIGRp
dmlzb3IgaW1wb3NzaWJsZQ0KZm9yIGFueSB2YWxpZCBiYXVkIHJhdGUuDQoNCi0Jcy0+cnhfZnJh
bWUgPSAoMTAwMDAgKiBiaXRzKSAvIChiYXVkIC8gMTAwKTsNCisJcy0+cnhfZnJhbWUgPSAoMTAw
MDAgKiBiaXRzKSAqIDEwMCAvIGJhdWQ7DQoNCkNoZWVycywNCkJpanUNCg==

