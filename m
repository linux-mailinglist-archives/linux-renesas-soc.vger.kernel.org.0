Return-Path: <linux-renesas-soc+bounces-28341-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOpiC7UrmGlqBwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28341-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 10:39:01 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ABB16651A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 10:39:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57193304EA8E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 09:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D1131B123;
	Fri, 20 Feb 2026 09:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="rqpzBcaR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011025.outbound.protection.outlook.com [40.107.74.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F82311957;
	Fri, 20 Feb 2026 09:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771580227; cv=fail; b=jM7GHzgrg/m5c3iW44r0wZLToSk+dUbtVHCxGysqOy+C4hBt3nfJY81HoF1l2k6264N+rzUCIuQ/z7Sdki2LUn1i1h9+Tw/HTowIatEJXRkURLVfEHERtMzVBVjdctL3iAECqZK4bT7COsu+FlamARKPF3pPT1d4zXvXFp+RoQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771580227; c=relaxed/simple;
	bh=G/2CEh4ZHj+SF/CZtjD5Ebpi9ovBohk3MP4j3WiUf2s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XpMySXwUeV4iouteOH+40HlJT8g7S8r3e5rPgEDfAi7iwffE35E2lFvYTTCoxDPITJrshMfTczsgkd6GuJxvNKo7U2sOzKz3wyDBAkK9rs05N+SksVgN2d1ZONRTHC7e7Jb3nujFisNVLoQyCAaJTXw4RXY8z0D1PpNain5wef4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=rqpzBcaR; arc=fail smtp.client-ip=40.107.74.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yiSFWznyFg2WhvjEGv2VFJu6Jon74xOsAvDRwlqwN/oxVjb0RxBz+ZtZyg2Uuc7zTidCn1FgQhx7tBk7P2Ku3HCGpeq+1b/g9R2bmeBkDK6CA2Xe941TlKBn0PBP4zFgTAVuyoN27S8sjQJm2LiEIx4T5VSfbLrqye5rIx+MECERGox1eeYHZpztas6nE7umQPnbSK+CJrhS+o9e5tGRlz/dqNTNQpRVDH75M+Qqli/ybuDF7GfaV57JVFwL9OQA9P6gvO4pw4ltfAV4Tau9eRs8JssZm7x+mNNiHp3ZhHz2ARD04whnWcoRgX1/xNK/FfSoWaeFPVeKv3IOuL8Q6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/2CEh4ZHj+SF/CZtjD5Ebpi9ovBohk3MP4j3WiUf2s=;
 b=U+r+KcBzCfqeqvGA22cty7Hh+3uAGQbmN7bvDTXMKqOAnyPQmKBUI/9gUiys5Ah0k+oRcqmzxzC8oJTJGicNZvetvGq7T/bD9+RjqnCuZWv0EwpuIT7LUaUx/iSQyvti8jy/5IiXYjhlLWZlYXEDD/WlZFTm8PTX5uZ0eO2ONnbGF/L4BzQYnSKLFWF4BWj0XelY0t8bpolnPELQMHe0kaeCNmghXDL4iTrr6TB7iE+RB4F5yCdtdisWuU2GMGZR9TO00VWi0lMnVV0qvMhEYkxx/q1Y2lGeoU8miA4GTQZss1zxtqR727TbEWklWPIbpKcxFFy5z6j+I8u9oouAOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/2CEh4ZHj+SF/CZtjD5Ebpi9ovBohk3MP4j3WiUf2s=;
 b=rqpzBcaR3FNi+DugnqGcb9Fn06NWdKQK9ojFUqBYnDaxN3467DIsQDl65nsFQO+Kqmvzb0X+aEXp6ewFqMIMjrBaKxKXNps4DvMMpXyCTDVuEZ/EyRpIpWCPTFmeTvGONoslSluzKU7dspmwGfTjVknCjDb+bOmmIjnOFCvjH/E=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS3PR01MB7142.jpnprd01.prod.outlook.com (2603:1096:604:129::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 09:37:02 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%4]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 09:37:01 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: RE: [PATCH v6 06/16] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Fix
 naming properties
Thread-Topic: [PATCH v6 06/16] dt-bindings: PCI: renesas,r9a08g045s33-pcie:
 Fix naming properties
Thread-Index: AQHcofA2RwJ2DnQPP06Hp8GbgsnErbWLMO+AgAAjnFA=
Date: Fri, 20 Feb 2026 09:37:01 +0000
Message-ID:
 <TY6PR01MB173779A9B2C971F3CB3E6EA2EFF68A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260219223542.6364-1-john.madieu.xa@bp.renesas.com>
 <20260219223542.6364-7-john.madieu.xa@bp.renesas.com>
 <20260220-proud-octopus-of-assurance-0fd60a@quoll>
In-Reply-To: <20260220-proud-octopus-of-assurance-0fd60a@quoll>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|OS3PR01MB7142:EE_
x-ms-office365-filtering-correlation-id: 3f1fb656-969a-409a-acac-08de706399d7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?RStXUzB1OU1kdjZjSk5tWU9Cb2Q3SjlONHRMeGUyemR2QmRneDBkckRINC9y?=
 =?utf-8?B?Wmp5cmdPTTJlc0diTWRBTy9Na0w0WTFXOVZCOW5DMFBCaWhLTE45YlNjajE4?=
 =?utf-8?B?cVgrOUt0M1RhZDRmaW9wSEgxbEViM1g4Wjd3M3luL3NNN05tS013OTVCTity?=
 =?utf-8?B?bE0yT2NqZWFwK2x4MVNMS1NtQ3JWb3J5QmhSVFA0TDA5SjMvTWx0VGVLTzBI?=
 =?utf-8?B?VHM0S0NHL3NYbElwSlJIOG9lM2txRFE5NEhqTUdDMjN2czBGc281c2s5R0sx?=
 =?utf-8?B?Zi9Ra2tOaFRqMC9Ed3VNb04wYTBpeEFlci82SWVoVFk5dHJUVm83THlub2ln?=
 =?utf-8?B?dThyUlBQY2g2VWEvOCtKYTFJWG93T1gwZ0JJbHVQTnpVRitKcmloN3pMTFZn?=
 =?utf-8?B?VmF0KytlOVlOd3BEcGxNd0Z6bWEya2Z4bnFrdlVnZkxGTWJZclYraElhSDNW?=
 =?utf-8?B?dmRtUC9PWStlR1JSWnJ3bS9WZkY0a3ZkcTF0bjdGRFFsdER6UGNCemx3enhy?=
 =?utf-8?B?U3o1TzAzeEYwTy8vbFJhRURDdzJHbE5ocjdNL3NNSE5jcGxQNE1JeTRXeVN2?=
 =?utf-8?B?RDlFQnRJRjF6WUlqNk1KNTJ1VG1GYlZzQjMwY3IxMDBsNWt2UjUzRjNqMGhi?=
 =?utf-8?B?RjJxSFYzWjBnQzNDcGlBYWZFZFVTaXNVZ2FZalg3UUcyUUZCcUxpK3pkM0ZE?=
 =?utf-8?B?NVZpWUJSQjNrcWlLV3ozUmNnWThpWk5Wak1UL3NrUm03VDk1ekF0bmsvQUQv?=
 =?utf-8?B?K0ZDODE4WGlDOHNYdXFpaEtoK0dwMks3d0w1RGdac0lOUFF5bFZwdXFsMGxq?=
 =?utf-8?B?TjFITnJ5c0U4cjlNTHRUV21seEVTOEJRcjJHeDNMTkdWRml1V2s5M2tJMjh4?=
 =?utf-8?B?WDRrRTVGdEVDKzloeVF3NTlWalhneTRLVkRPRU9zcWkxbmI2YWxTejVzU3Bj?=
 =?utf-8?B?NzBOSStDWjI3bEZKWSs4UVRzaHBaUUs2VG00eDcxZVVQOVZMb1BXSTFvbjNH?=
 =?utf-8?B?UysvNEhjaXdwSDFXdEJjK25hS3l4SFhZbysrZzRWV2JONWVwbEt4TGFRRXE1?=
 =?utf-8?B?OVAvS3paazh6czVhSnlYLyt1NEw0Q1BlYklpa3RQUUtKMkw0bjhiYXBHbS9o?=
 =?utf-8?B?ajdYcGtzMG5XcElFM1ZQRXFmUGladmJ4WVRNTVNreXJHUVRXYWRjYTM3OXVy?=
 =?utf-8?B?RkNHbkhNQmV2eGwyeElWSXNPK1NsVEZBd0NEWFRpQnBDR0tpK0NMS2xENk5m?=
 =?utf-8?B?NUJzZzZFblphd3BuM09kVEdqcktoR3IrN3NyRVVzdzN0dUx1QncyaVdwbmZJ?=
 =?utf-8?B?WXdvKzE3elAzVUlKRlBZTDBoNDQ2dmM1bFd3VWdpazRHLzlTOWxRUjFMZkhv?=
 =?utf-8?B?OGIzbk5mQU9BUDV4QkQrYzNRWFlUZUQ3NHZzLzNSeXZtV1JCMG44cmt5WmhH?=
 =?utf-8?B?NTV6ajJJSUtzbi9Jb1drVjZ0cTJFcWZZSFlCUUFmSHJadXNaUjllUXh2K1pz?=
 =?utf-8?B?RW5KSlpBSXBRYTdVV3pPdng2cHo5ME9sZmExMG4rUWhNdUJJNjFJaVpZeHhn?=
 =?utf-8?B?ZzM3SlJka2lCNi9KY3RGVVJjN3Q2N0FSNVNlVGpHNUFEbVlVb0hSQzdMNkdv?=
 =?utf-8?B?UkhCK3FnRkJUUno0YTNYck54R2VqOHVFbDVnN2hNempCSmhLeERlMkdpWlFq?=
 =?utf-8?B?MVEzdTE2V1JkVjZqNWxuSDdrcEJEeEJndkxyVkR0blBPdjd6UXZucitwVjR1?=
 =?utf-8?B?UE12Y0ZjYXMvSlM4WkNnbkdTT3M5L0hMdkhtT2FsZnVPczkyb0diMmdkOWN0?=
 =?utf-8?B?OHo5QWNaUEZPZFRBQk4wd3dwOEZoNE1VZFJTbEpvMWsxajNrRlRFNU05Wmtq?=
 =?utf-8?B?NUpEeU5zeHVCdHRIMStUcjFlNC9wdzhrK1Erbk1WM1R0NUo0OGlYbHhTN2xQ?=
 =?utf-8?B?d1NoYkZ6YUJvQkJmcFFoVEIzWEgrWHhYOG40SWpvWk9nWkFsbFNObzZMVlJi?=
 =?utf-8?B?bHdmaDZycWxuNGJ1UHZWSWpCL0hTK2R2UWlPY3BENG1CS3ZWVWdNaEhtbWdq?=
 =?utf-8?B?anR0SFlXdzIzVCtLd2xuNkdYenpYY1M0ZzVvQjdtTEczbEtOUkxacWx2K3VG?=
 =?utf-8?B?UHRMTkM0c0dkcDdzbW9acUFxNWR1VkNXd3BYenc3R05za28xb284SXhIT0FO?=
 =?utf-8?Q?HwXdjrLeRXXigHjnkTBxWrY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TUtOTU5xWnNGUEZoZmhFYVQ0RG1JZ3kyYXQvMm5FN2xzT2JpbFVSY2tSMXBO?=
 =?utf-8?B?Q2JFdy9oWmpNaDFINGEwNnVYbmZqaHVPbzFxOGZ4L3hpd0NyMDFwWmFoOWh4?=
 =?utf-8?B?bTh2bmNWQnJ6eTFVdGdlTWEzZjUxM1R6K3YrWllkSWdGY1BQWFZvK0gxZldn?=
 =?utf-8?B?eW9GRXhxNnJiRk9hOGorTk9uZUUwZGVMcmozRVp6WUFlNWcvY0tMRUlzcEpM?=
 =?utf-8?B?czdub2hTVXRmY2VvbVI3WWdGYjJ6NHk4Zi9Lb0xPMTB3UTA5SjU4QnRJbnZM?=
 =?utf-8?B?aWc0S0d0R3N3a0dJWUFaZjRwUDc3dlF0Z0poVkxabGN3VHZXeFQ1NnExMXBD?=
 =?utf-8?B?T1p0YVZzbWhCMUdjUjJ1WXVKSjFHdTl3bzM1YWVHOVhMUG1JdnpRUlIxQm9o?=
 =?utf-8?B?MS9QNDJGRlpBb1ZNZGJBVTBtOU0xMXA1QXpxWDJ4NFE0bkFtWmcvdk1HVlYr?=
 =?utf-8?B?K1JIaUltQ3ZSb1dmWTRtS2hNcDIvWDFwdno1QVdTbmt3dXV6bit5VmU0WnZ2?=
 =?utf-8?B?WjVuZTlOWURoZWtDTWlJckxqMUJmdXZDbTlXc0xqc0FlcGgrYkk2RUJtMzlv?=
 =?utf-8?B?MVV6VG5BcTkwcm9hVXVMa25ibm8xTUUyc2pUOE9BNEh3NEZFZlorUGxSK0pB?=
 =?utf-8?B?c1ZLd29hSUNrRlV5Zys1SStPQ29oYStuS1ZzenVQb3RqZDZpeldtWWtpVFEr?=
 =?utf-8?B?TytjeFIxdUd4aVYyN2hpT2t3ZjQ3L0JCc2dmL0lvY3lMUzZoRkpqT1hlUm1u?=
 =?utf-8?B?b0xQcUhaODdWcWhnQy9BQnJqdVdDUmVRcTRBczl4ZCs3VFpnUjUwVzFXQVJO?=
 =?utf-8?B?SUFOTHFDTHg1QWxHMEhEUUlXSWxNZmI3OXdDN29ZTmhSVGljK05nazgxd1FS?=
 =?utf-8?B?d2F3NUxYblpoMmIrc0E5VGdNZ1dzaE1MYVhpbGpoUkNZdW55Sm9Na2JTQ1BF?=
 =?utf-8?B?cEhUUlFXSFVPdmFzZmRaa3lRSmFlQlcrNWFFMldiSWdNRFBUTUY1Y3pyN2hx?=
 =?utf-8?B?elU5SmRScXp3bG1lV2g2RGVVTHVNUEkzSmZWK1VGQnE2T0J5VHhxR3N2TzhR?=
 =?utf-8?B?U0QrQWxyTStEb0o0VERycUk2VFhRTGxWYXZpVStuM2dPbStOOTlEUkozNGV2?=
 =?utf-8?B?dkdxd3VNVTFvRTJVQmEyVkI3SDM0eXJ3UkxONXMrT1FHbWJDdHYwUkZXQjRp?=
 =?utf-8?B?bTlTTFZsOWhWYms0SlgzRzk4cEV5VjV1QWUzdUxpemUxbzV3dGgzbzJhMmRO?=
 =?utf-8?B?eEh4ekYrVnpFeVZaa1BsWHRJMEpwWWtlWTBxOXdUZFZoaHFNaGE4K2NLRkd2?=
 =?utf-8?B?czlIUFovZHI0NTY4ZWdabXl4ZDlURjdQM1FvK3BrcTRSUlBHWmZmWDB3TE52?=
 =?utf-8?B?NWtWUHZ3MUtNMkJMdlBuNXp3SEJMZGRTbHZDQlNkWDl2L2lyUWlHL3NnRWxj?=
 =?utf-8?B?WkMxNUVqUnhZMU80TjhaVGZ6UkZTU3JWbUhVNXNSWU52d0VpS2RNaVFTb0xN?=
 =?utf-8?B?cUVSZE5yTWY5Tk9ZYXVYeHJ5MzgyVGEvVXVDT25iL0RuSUI1Y1ZncVhoNGVm?=
 =?utf-8?B?dEpVZWhOM1FORUFDMWlBOXVodWE0RlltOUwxTDhraWpVbGd0RWIzV256UWpO?=
 =?utf-8?B?K1RxRXNBeDB1OWh2SFRPMDRFV1F0aTIyK2tvWlQ3SldGUmY2OXVqcE5oOXVa?=
 =?utf-8?B?Tk5WaU5aV1IzSFE2bkdUcEtzUXkrbWpPdWU4Z1RQOHExNzEwbEZFY3E1NDBh?=
 =?utf-8?B?WSsxS3I1a0hkdWtuMGpPbm9qSVlxb05mOFo4K1lUZUhSVCtEdnpVMm4xNFNo?=
 =?utf-8?B?RDlNNXdBUnlYbXV2SnFhQnoyZXRNQmlYYlMxY0hMRWVMTkN4N1dWMDlSMHZL?=
 =?utf-8?B?aTRxRHZzOXRKOXBxdDhUbWlEb05tdTErYXA1a1d4aXQ4TUx4bVFlZVZWbVpZ?=
 =?utf-8?B?OWVtWElaUVdycC9qZVNXZVFVbXBmc2EvSUE0VjdNQ3laZFhWRkVIUE9ETEFh?=
 =?utf-8?B?dFVqMDQxYmxvU3lIWk5VMFAxSmo2Wno2L0lJc1UwY3N5YVplWnQ4SFNWa1dQ?=
 =?utf-8?B?NHhxWURpU3hsSFhGT2JlbWJmMmdrVEVmNVVGWEJWSE9Wd2VUaHdtOHBxSldX?=
 =?utf-8?B?UTZKQ29GQXkxN3VGWWQ1NjdYTlpwTGo3NVM2alNRa2prTVRNVGN2dHNXeFFZ?=
 =?utf-8?B?YzhyVy9XN1V4aTBUT2xNRG9sYUFrUWdOeHIxUDNQdUVEdVZqTWg0Yzk1RFpM?=
 =?utf-8?B?elpNU2kySHp0K09adVQvMlM4OXZNUkJkTksrb1M2dzJtUXBrUXh4QW5pQlps?=
 =?utf-8?B?Q1cwRWl3ZHppTlNtcDd4Q2ZjMWJyRDZRLzREZm9rUWQ2YUhYWHpYUGNWWGor?=
 =?utf-8?Q?VQbvLnkigvQFb2Z8=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f1fb656-969a-409a-acac-08de706399d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2026 09:37:01.7812
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GW4/siDbRrdscYqYYkGEv1S2UxYtJTBJDScbFms3w/yr1AsZtUsbt0B06YIq/262BFI4ZVkyuWEIYs4u9OtDSUBXAJwzYpIS4NuHRrRu5Zk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7142
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28341-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,glider.be,google.com,gmail.com,vger.kernel.org,microchip.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.999];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: C8ABB16651A
X-Rspamd-Action: no action

SGkgS3J6eXN6dG9mLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwu
b3JnPg0KPiBTZW50OiBGcmlkYXksIEZlYnJ1YXJ5IDIwLCAyMDI2IDg6MjggQU0NCj4gVG86IEpv
aG4gTWFkaWV1IDxqb2huLm1hZGlldS54YUBicC5yZW5lc2FzLmNvbT4NCj4gU3ViamVjdDogUmU6
IFtQQVRDSCB2NiAwNi8xNl0gZHQtYmluZGluZ3M6IFBDSTogcmVuZXNhcyxyOWEwOGcwNDVzMzMt
cGNpZToNCj4gRml4IG5hbWluZyBwcm9wZXJ0aWVzDQo+IA0KPiBPbiBUaHUsIEZlYiAxOSwgMjAy
NiBhdCAxMTozNTozMlBNICswMTAwLCBKb2huIE1hZGlldSB3cm90ZToNCj4gPiBGaXggYSB0eXBv
IGluIGludGVycnVwdC1uYW1lczogInNlcl9jb3IiIHNob3VsZCBiZSAic2Vycl9jb3IiIChTeXN0
ZW0NCj4gPiBFcnJvciBDb3JyZWN0YWJsZSkuDQo+ID4NCj4gPiBBbHNvIGNvbnZlcnQgaW50ZXJy
dXB0LW5hbWVzLCBjbG9jay1uYW1lcywgYW5kIHJlc2V0LW5hbWVzIHByb3BlcnRpZXMNCj4gPiBm
cm9tICJkZXNjcmlwdGlvbiIgdG8gImNvbnN0IiB0byBlbmFibGUgcHJvcGVyIHZhbGlkYXRpb24g
d2l0aA0KPiA+IGR0YnNfY2hlY2suDQo+ID4NCj4gPiBGaXhlczogZTc1MzRlNzkwNTU3ICgiZHQt
YmluZGluZ3M6IFBDSTogcmVuZXNhcyxyOWEwOGcwNDVzMzMtcGNpZToNCj4gPiBEb2N1bWVudCBS
Wi9HM0UgU29DIikNCj4gDQo+IFlvdSBoYXZlIGNoZWNrcGF0Y2ggd2FybmluZyBmb3IgdGhlIHRh
Zy4NCg0KSW5kZWVkLiBJJ2xsIGZpeCBpdCB3aGVuIHNlbmRpbmcgdjcuDQoNClJlZ2FyZHMsDQpK
b2huDQoNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNCg==

