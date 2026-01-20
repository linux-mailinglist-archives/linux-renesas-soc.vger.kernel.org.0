Return-Path: <linux-renesas-soc+bounces-27155-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABDAJcrzb2m+UQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27155-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 22:29:46 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B794C431
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 22:29:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9E16F86BAD9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 20:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D76B7439019;
	Tue, 20 Jan 2026 19:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="mRnfMzgr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010064.outbound.protection.outlook.com [52.101.228.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF73E3A1E78;
	Tue, 20 Jan 2026 19:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768939128; cv=fail; b=Nus3XXJmHWD27aWr7jfYr6P1XnMmRYiSZevfIGpEO8xv/1LnibE0D7qifOvuleNrjMBPA9pOIJLS0vH+9P6qVJ0jIvlf8O3o1L/LlXDca8DM2o7cEOwV6vBLOqiq2bMZhhm8g1sogmAMNYwjHaZCd95F4UFVSobpS3Qd5qb0LME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768939128; c=relaxed/simple;
	bh=XJuO/mDCYHt14e2cK8AbXdr1gNeEhrxsTSxE+qPgQD8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jEdr9UdzZMee6x/9QBSiLIXga2jcSmd+K45usz/QeoQdk30+1LWK1FU0i2ZWWbN5V/VLQf1oZDsZd/t8uHnLuYxjGK6CC27YKujuZkFyKzaRTAL84VjlBIBhGkBvMBMkgeqBShbejCI5xeyuo6YiFs2r6Q0kgN1vaHuWLxiDJII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=mRnfMzgr; arc=fail smtp.client-ip=52.101.228.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K74VGRwYz3T3oe31hkRt9vxuefaRHki57y4s3ZH0J4vlDJh5MbfdP3IqJ9xK2WGDw7pghiq6mhTjuzUHD3QNsvQXl3plPo3rzKn+qtPJrSpEtfatR/qp7ZP20KbhYdBDwee+M/MDPjAYa0mQmI03nksqFROjX62/ijV7nX6B0XlSUBXTPA+yZw3yu+5F0hwwkZWVKYykSi6CKZ+7lmG4vzRRuMtgNesB6IK6O3eeSwWgfY2vuvqFVr0hQ2XydlOoKd+Uh3yAnEn+ujORFl5KUESCuEr2KG97g6+Y5JchHM4nY3geYXNTdKJQON5t9SB6SABEuAcSfMe5ZQ2XS2GHUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJuO/mDCYHt14e2cK8AbXdr1gNeEhrxsTSxE+qPgQD8=;
 b=sPqnVZS8+61Esf6AjBPQIzuthfJQvSbLpseEmAMSy5qWe/RlbEPak+sIGtO2OTQwxPyKeBiUO10vsakA/dYTHq4cqocLK0Dx2JUjqcRDNI7USusA+M+ALuU/gtIhZpDkIlfAKufQ+8MZ72SYtiDOD5qzM39+HjRcNCO0RjNCga9Kfa8CybDNgXDNaYOwA5QjLEwXSHEzZ9mYM/CuP5zQ62FQxlTWNKwAHKAbEfHzIE4wXLFNujJdia2MuZAKwMoFVGsmFR1Ev6OqlG49mU6XmYtPRcA0eAymSbgIss5kgauxyPb+hx7i9PMYMtFY1zi70Y6DsEST1MEND2K6K2DBbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJuO/mDCYHt14e2cK8AbXdr1gNeEhrxsTSxE+qPgQD8=;
 b=mRnfMzgrFoerPR/lXkawmdxOj0ajeI86dRmieOfOP+OflVOyWe4IkQLfnyTVavXLnT+RWQ22aL34HyxR5uZ312DZB8rRKVgxOGXVHe5t5SgRDLVKw1HM+LuOiRFxRorttJ6++7+grpLj8PAcKDTZEaKpHw3ZUs93BLffrUtwqhQ=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TY7PR01MB16988.jpnprd01.prod.outlook.com (2603:1096:405:32a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 19:58:41 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::aa7e:1460:f303:3fd8]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::aa7e:1460:f303:3fd8%6]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 19:58:41 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>
Subject: RE: [PATCH 06/16] PCI: rzg3s-host: Make SYSC register offsets
 SoC-specific
Thread-Topic: [PATCH 06/16] PCI: rzg3s-host: Make SYSC register offsets
 SoC-specific
Thread-Index: AQHchWuHmGkbjEzBi0a6K+fTj9APN7VZ0/AAgAGvWgA=
Date: Tue, 20 Jan 2026 19:58:41 +0000
Message-ID:
 <TY6PR01MB17377E99A031C7DD07700B794FF89A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260114153337.46765-1-john.madieu.xa@bp.renesas.com>
 <20260114153337.46765-7-john.madieu.xa@bp.renesas.com>
 <34bd51e6-c93d-40fd-bf5a-8f476c4e1776@tuxon.dev>
In-Reply-To: <34bd51e6-c93d-40fd-bf5a-8f476c4e1776@tuxon.dev>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TY7PR01MB16988:EE_
x-ms-office365-filtering-correlation-id: dc1bedf7-6e00-44e7-3e9d-08de585e4f4c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?b0lhckhpVzR1V21wKzQzR25sSHlzQXEwb3Y0RGVwbHRhdXhwOGFSZUQ1dEp3?=
 =?utf-8?B?SWFJeDlCZThDMmhheE9nbFBvU1NBMXE4V1NNd08wV3c0Rm11d1BSenNIRmQ1?=
 =?utf-8?B?aVNKdFhHVzNNWVFxSmt1SU9xMndrN2pwUkl3SkgzMGFQS01GK1piNVJ6Y05S?=
 =?utf-8?B?OUNIRzZmNkc4bGpzNVltdFpCNFhkNStESnNGYkRIVWVpdnM1OFZjZ2ttNmcy?=
 =?utf-8?B?TGVCRGZ2UEVUMElPTCt0YnNPT2hyWjY0Tm1HU0V3QTgvbnRHQTVkL04zcUlp?=
 =?utf-8?B?c1ViSGdVeDhRYnNGcG95SFV0djNHdXY0QmFFRDR2SmorejdLZHBJaEovdzNX?=
 =?utf-8?B?NlFFM01HTENJVFoyQVpFRW9wTXJKYktock54cFpaWEJyTVNlT281WVBjUGx5?=
 =?utf-8?B?QzZYbTlwZFBCY2V4bnBrcGhTWW1ENTBBMUpab1dFcG1UNGhISVlDcW41Nm14?=
 =?utf-8?B?SzZJRG0vZFNiMEdvM3NyU2lwTldUSVlyUDQ2SmJVSHFwci9zcTF1dWxPNmQ4?=
 =?utf-8?B?SGc4K2EvRWNCQzdyODJ0c3JHYUsyMTIvU3ZWbCtsZ2c0WmtmTi9BS2EzN0dE?=
 =?utf-8?B?VzBLdmVOWExYT3U3Tnkza0V0R1g3STBJTjhFT0R3YXY5WXV2eDlhQWlQVmZF?=
 =?utf-8?B?QkZRSjE1RG5VYnB4Sk44UHIyV0JiQUYxaUgyUkZBaE5zRG1IVHdrTmJydkxj?=
 =?utf-8?B?S29OR1FBQlZNZXZwN3YxZXBiYWhXMnFleUNha0c1UmVXMkdVbWt3S0kyT294?=
 =?utf-8?B?M0lNOGR2Uk8rK1h3K1QwbDVBZzlaNVROQjdZcGlIWjhOejlKUDF5UUdmTE5Z?=
 =?utf-8?B?UE9nYk5aekdqQUozcWlTbUpTWEtQaktydDdVWmw3SXNkNmdaZDl4VUxtOTFs?=
 =?utf-8?B?N09UY3dCTzRleDFtUkIvVXFXd1VxVmczV3JhVHFVM3dldGF6M3MyWnJXOXUy?=
 =?utf-8?B?K2hUcVJXZVdtOHltVkpsN0lmUFBtN3pwVU85TVkyaUNzY2RyeWxkU3ZsZzI1?=
 =?utf-8?B?S0xxMmRCeXdZTjJXb2kzRks4NVBaczJhTGlqNDNpQXNMY2dndG9TY25FQkNQ?=
 =?utf-8?B?VFFNUEhTU3F2cjAxZ0s2U0RNMkQ0Y3AzTnV1c20wTENlY1FOVnRMd2dUa2NZ?=
 =?utf-8?B?cVVLZm5wS0lGZ2RHbUhSQ2F2T28wWkRsUmt4VHRPKzNaeFR1WWljanlHQ1Fk?=
 =?utf-8?B?ZFV4TjJTTnJoOFhFVmNCNysvQWd1a2RGMU1HRjdNWnMvSWNrYzA2dUNmZS9n?=
 =?utf-8?B?WVRKRkIxdVo5NUlKZ2VjU3ZGaXU4S0JubjUrVGJwMVlJRHFzZzdEejJxMGtj?=
 =?utf-8?B?b28xR2Z5ZlZLZmEzcGRNN0QxUkwwK2JNc2hFTm0ranpNZFF2bFJ5Z2poZ3Bq?=
 =?utf-8?B?V2lhVXgvMlZjSjJ2Mjc5a1VnT1BmN2ZZbUNlY1NVRGV4NTluTW5YbTFqMXNQ?=
 =?utf-8?B?dVVMQnZCemI3Tm96b1FoR2RtdWdhZ3UrNXpjQjhzdU9MS045V253Vi9PVG1q?=
 =?utf-8?B?RGZJTHNDVHBTOXM4R2QrUnZKMVpSU3k0LzJ6cmM2d21MT09SZDFUTmp2MjNZ?=
 =?utf-8?B?aVNWSDA3LytON21kTFkzZEltVXZ1R0RZSG5KdUc2cjMraDdJbytydGxsMVNL?=
 =?utf-8?B?MkU5QkFDdEI5R2daYklrUWlqakdLR0NaUmFDUGZHdFVnU29CbUViOUR2cGxk?=
 =?utf-8?B?Wnk5Z1o2UHduZjFZT3Zjb0FJRE5WZzFLK3gxUzNEYnRCQS9KSFVMcW53UWxr?=
 =?utf-8?B?ZjhqWjFoYmgxUlFuMWJZdzJmZWRGNEhvTWtmUzVwOTVrYVFxbTVmR1RDdk90?=
 =?utf-8?B?Y3pPN09FSGtDRlhvWHZ6cE4zcVJjQklidXNtaERoSUtBcEE2RmhNWDc2WndP?=
 =?utf-8?B?R3kzZ2ZYMHNKMDdEa2RORGhPSzVxWXplUzZFYTBSZVBlQThsUnVzaGhVM3lr?=
 =?utf-8?B?eGl1R2NpdVpsbzFERFRRQjU5Z0V6Sk1mckh5L0prOU5FRnNDMnNxaW12SGtq?=
 =?utf-8?B?dG11TDMyZ1BxWklQTVNoWkhlWm9pcmF6bmcyQ3JGSkN6Um9jUTV3blg4K0I0?=
 =?utf-8?B?by9iYm9lQll5L25uYVpUeUNMbCtFOHNBS3laUXd6VXJOeXVJOHJVSW03dlkz?=
 =?utf-8?B?aFBzNEx6eStxS1FwbGJKMlVxZGpYNFVpZHBldTJqYmR1RzdGQlgvaUVCRDNi?=
 =?utf-8?Q?uebNPGA1kNmgoGaBrxDIozk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?enMrdDhUb0dycEN3d0FQN3kzdFZ5bUdtVkFNc29wUE9QcWVJUVovRnZHQk5y?=
 =?utf-8?B?YlJDQjh3bFVRQjkxdE1sUUZOTDBEMGl6elhXd1ZhT1lxRUtobHZIelBudHBM?=
 =?utf-8?B?bG5OWVhiaEN6bEcvUnlxdFdYeGxtQjVFUS9icFdibDJUcXNtVzJyOGVsblpG?=
 =?utf-8?B?TUtCRk5NSnpHekRxWTFtYXNtSEtzL29yeG9ValFjelVRU3QxanJHcU9rTW9T?=
 =?utf-8?B?T0dBWFo1Zk9tbDcwR2IrVWFRbDUzclM4Mm9KQ25zcUpJTnd4T0FBcmZGbzFM?=
 =?utf-8?B?Y3hMZkhRYTBoOS9vSFA1Ti84R0FzN1Z5UXBBM1JVbjh6ZVgzdy94UnIzemxZ?=
 =?utf-8?B?SmxDMjU4TmVid3JabVZhR3hDbHVScU1ORlR1eWhQVmdYNGVjL3FtblRtRW14?=
 =?utf-8?B?aVI2RWtQOXpqNk5sK0Y1MFNNdWlLV3RuckVRR1EyZ28vcmMyVjZEdmFHSWxK?=
 =?utf-8?B?UGJmbXg1L2hBVlVrdWp0ZWtUSTJlWlVvYmdaM2hVSUFJK0xBRUhEbnFlOFR3?=
 =?utf-8?B?NHlESExrOUtDcXRObEZ6NmVLdXZQeFpHSTd0a0lDMEo4ajBuSGVTeUt4S2Vw?=
 =?utf-8?B?bmlMcnNlZkZOUkF3M3BPNHFmVWRnN1lNU01sM05lbjFnWWZScXhzMmJPZFV0?=
 =?utf-8?B?N2RQRGRDQUNOVWhUSnRRRStPUzRZallnN240cDJkamk0eTQrM0lzc0pHWVZO?=
 =?utf-8?B?WDVhZERQZGJTQ2U1QWw0MDNEeE1kMTB3dm1pVWVkYVFMSDlwZTF3TTVaWlh1?=
 =?utf-8?B?QnpPR1pHdE5aMkhGRXY0KytDLzE2ZnVKTm5WMEs5dnF5NDJ5TStaMmJjeSth?=
 =?utf-8?B?dG9vWHJtNWVZTzdrQUovek9XbVZyWnBmc1VnMEwydGQvVUt4cEU3UmR3Nmgr?=
 =?utf-8?B?N0wwczNHUXRWWE9TR0FtbnVnUkloa0w0dExJWC95bjNMVDQzckdlUGZDbjFX?=
 =?utf-8?B?ZzZiWnFZaWVGVG5sSFVVOFRBejdUTGZYT1ZXNDloUTR1S2JFYVNKTGF5NS9D?=
 =?utf-8?B?U01jdEl0b1VXWlVDeXpreG9EUjZ3amZYWTNJclFJcVVWRVJGMmdRZTBvbkRr?=
 =?utf-8?B?am1pckhHaHNOQnJXQWxkL2hXN1A4NUh2eGltVlo4THdkeVlPTm1lbWltaHVC?=
 =?utf-8?B?a3RibENVS2ZFRmU1K25IRVhPcjJ1aElqRHN6RlZCRmozdW9IOHdqY2hrbm4x?=
 =?utf-8?B?aHJhMGFyRkd2cFNhdUI3OVdEOTVROXFtSW1EYnFNSmVrR0tUL0Z3WUdJL1JG?=
 =?utf-8?B?a1VNMFZPRUpyOGIrblg4UFRxTXhSV0EzOWJUakYzTWhiUDFjR1JFblNtMUdq?=
 =?utf-8?B?d0NQR0dkYVRSY3dMaGJyMVlzSkI5ZFhqblVCTnFMOFVVTmNZb0hwTWR6cEo4?=
 =?utf-8?B?KzQxSnlBaUVGb0NpRGdMS2JybnBYY3NvRmp5bWd0UmNkQ2NvU0pmUUMyRlor?=
 =?utf-8?B?WE5IZWNSNWk2YTlsZHdaeldMaDIxVGFXUzZMWW5iMWNibUc4c2FzSi9ybGhV?=
 =?utf-8?B?dnlDRXdOazlNbFNMYjlaRm85empIbVNuMEtwZnNzZ2FWbTZ3QTcyWTR2bWQx?=
 =?utf-8?B?Qk5tbndoRVQ3a1ZHYkNITVVzQi8vQmJVRXBDNU0wQ0tBL1ZWK1JzNGZkMmg2?=
 =?utf-8?B?MitSaGpwcFlZdE4zanRqU1Z4Rno0K25aeFI3WktsTm1INEwrck1HbWtMa094?=
 =?utf-8?B?LzFjU3JsMkpadW5lMmU5Y1paUVZoRnpMb2pNMjgra3dYZW9FTEFrK2sxWGlm?=
 =?utf-8?B?QTJ3YUdWdnk3bDFFeEtCY1dRdWFvbXB2YkVKdjFrSXZxNFJKTXRmV3BIeU10?=
 =?utf-8?B?Mll6aGdRdDJ0R1MvdUtwRFpmS3pyc0l3STV4VVAwdEhPc1FHMDhUVDYyTUk4?=
 =?utf-8?B?ZlpzWTB5TWJ4eS8vYlRqQ2kwN011dFplR1pac0RFeGQ5VzFhYVdPMGczK3dW?=
 =?utf-8?B?N05Fd1JhZ3dVYjV2ZTZlYmNmVzlKa04yTXRUYVY3RU16OXo0TVh2TnlPWG4z?=
 =?utf-8?B?ZVdSMXBWSVpUR2QzUGxQWFdscVpxdnBKdW1nWHZjU1dxVmQ3aVFuWVJBUWJJ?=
 =?utf-8?B?djFRZnZETHdFZU81L0tDWTFJckE5eW5XSGlVWWpsUi9wblNITGlmc2kxblhH?=
 =?utf-8?B?bjllQWFIRHg1S1ZrYUFEeFJmK1IxR0wwS05YQTRoeS9FRmF5MCtyUllMdDFO?=
 =?utf-8?B?VktmeGttTzZCNXl1bENWS2NTUmRxbFBvTElFTE43SU42U3NxVjZmZDdvWE11?=
 =?utf-8?B?bk15UDkxcTNJUHpGbkl3djlCRElLQU9CN01qN2oyYmxWNU5jei8wQS9TVFh6?=
 =?utf-8?B?azFQQ1FXV0VncHlQZ1pnUW45a3ZTSkMyYS9wMjZPTG1aQlJaZ3d5YWplaXBM?=
 =?utf-8?Q?jbKBHuVl0QvfvRE0=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dc1bedf7-6e00-44e7-3e9d-08de585e4f4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 19:58:41.3490
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jS10Nit0k7K0V5ok1Ci7zm4I6IilbThaVfHhhQNvA3yYqqg05lzlvebzODKmzumdhAhjp/0XJH9kEfx4KvEld5bFYpFyWNzZ9WNyVT3u8t8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB16988
X-Spamd-Result: default: False [2.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27155-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[renesas.com,none];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tuxon.dev:email,TY6PR01MB17377.jpnprd01.prod.outlook.com:mid,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,glider.be:email,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 10B794C431
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgQ2xhdWRpdSwNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYUB0dXhv
bi5kZXY+DQo+IFNlbnQ6IE1vbmRheSwgSmFudWFyeSAxOSwgMjAyNiA3OjE0IFBNDQo+IFRvOiBK
b2huIE1hZGlldSA8am9obi5tYWRpZXUueGFAYnAucmVuZXNhcy5jb20+OyBDbGF1ZGl1IEJlem5l
YQ0KPiA8Y2xhdWRpdS5iZXpuZWEudWpAYnAucmVuZXNhcy5jb20+OyBscGllcmFsaXNpQGtlcm5l
bC5vcmc7DQo+IGt3aWxjenluc2tpQGtlcm5lbC5vcmc7IG1hbmlAa2VybmVsLm9yZzsgZ2VlcnQr
cmVuZXNhc0BnbGlkZXIuYmU7DQo+IGtyemsrZHRAa2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIDA2LzE2XSBQQ0k6IHJ6ZzNzLWhvc3Q6IE1ha2UgU1lTQyByZWdpc3RlciBvZmZzZXRz
DQo+IFNvQy1zcGVjaWZpYw0KPiANCj4gSGksIEpvaG4sDQo+IA0KPiBPbiAxLzE0LzI2IDE3OjMz
LCBKb2huIE1hZGlldSB3cm90ZToNCj4gPiBJbiBwcmVwYXJhdGlvbiBmb3IgYWRkaW5nIFJaL0cz
RSBzdXBwb3J0LCBtb3ZlIHRoZSBSU1RfUlNNX0IgcmVnaXN0ZXINCj4gPiBvZmZzZXQgYW5kIG1h
c2sgaW50byBhIFNvQy1zcGVjaWZpYyBkYXRhIHN0cnVjdHVyZS4gQ29tcGFyZWQgd2l0aA0KPiA+
IFJaL0czUywgdGhlIFJaL0czRSBTWVNDIGNvbnRyb2xzIGRpZmZlcmVudCBmdW5jdGlvbmFsaXRp
ZXMgZm9yIHRoZSBQQ0llDQo+IGNvbnRyb2xsZXIuDQo+ID4NCj4gPiBNYWtlIFNZU0Mgb3BlcmF0
aW9ucyBjb25kaXRpb25hbCBvbiB0aGUgcHJlc2VuY2Ugb2YgcmVnaXN0ZXIgb2Zmc2V0DQo+ID4g
aW5mb3JtYXRpb24sIGFsbG93aW5nIHRoZSBkcml2ZXIgdG8gaGFuZGxlIFNvQ3MgdGhhdCBkb24n
dCB1c2UgdGhlDQo+ID4gUlNUX1JTTV9CIHNpZ25hbC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IEpvaG4gTWFkaWV1IDxqb2huLm1hZGlldS54YUBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4g
PiAgIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1yemczcy1ob3N0LmMgfCA5MyArKysrKysr
KysrKysrKysrKy0tLS0tLS0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA2NyBpbnNlcnRpb25zKCsp
LCAyNiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250
cm9sbGVyL3BjaWUtcnpnM3MtaG9zdC5jDQo+ID4gYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3Bj
aWUtcnpnM3MtaG9zdC5jDQo+ID4gaW5kZXggMjA1YjYwNDIxYmUxLi40NDcyODc3MWFmYTMgMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLXJ6ZzNzLWhvc3QuYw0K
PiA+ICsrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1yemczcy1ob3N0LmMNCj4gPiBA
QCAtMTU5LDEwICsxNTksNiBAQA0KPiA+DQo+ID4gICAjZGVmaW5lIFJaRzNTX1BDSV9DRkdfUENJ
RUMJCQkweDYwDQo+ID4NCj4gPiAtLyogU3lzdGVtIGNvbnRyb2xsZXIgcmVnaXN0ZXJzICovDQo+
ID4gLSNkZWZpbmUgUlpHM1NfU1lTX1BDSUVfUlNUX1JTTV9CCQkweGQ3NA0KPiA+IC0jZGVmaW5l
IFJaRzNTX1NZU19QQ0lFX1JTVF9SU01fQl9NQVNLCQlCSVQoMCkNCj4gPiAtDQo+ID4gICAvKiBN
YXhpbXVtIG51bWJlciBvZiB3aW5kb3dzICovDQo+ID4gICAjZGVmaW5lIFJaRzNTX01BWF9XSU5E
T1dTCQkJOA0KPiA+DQo+ID4gQEAgLTE3NCw2ICsxNzAsMzQgQEANCj4gPiAgIC8qIFRpbWVvdXRz
IGV4cGVyaW1lbnRhbGx5IGRldGVybWluZWQgKi8NCj4gPiAgICNkZWZpbmUgUlpHM1NfUkVRX0lT
U1VFX1RJTUVPVVRfVVMJCTI1MDANCj4gPg0KPiA+ICsvKioNCj4gPiArICogc3RydWN0IHJ6ZzNz
X3N5c2NfZnVuY3Rpb24gLSBTeXN0ZW0gQ29udHJvbGxlciByZWdpc3RlciBmdW5jdGlvbg0KPiA+
ICtkZXNjcmlwdG9yDQo+ID4gKyAqIEBvZmZzZXQ6IFJlZ2lzdGVyIG9mZnNldCBmcm9tIHRoZSBT
eXN0ZW0gQ29udHJvbGxlciBiYXNlIGFkZHJlc3MNCj4gPiArICogQG1hc2s6IEJpdCBtYXNrIGZv
ciB0aGUgZnVuY3Rpb24gd2l0aGluIHRoZSByZWdpc3RlciAgKi8gc3RydWN0DQo+ID4gK3J6ZzNz
X3N5c2NfZnVuY3Rpb24gew0KPiA+ICsJdTMyIG9mZnNldDsNCj4gPiArCXUzMiBtYXNrOw0KPiA+
ICt9Ow0KPiA+ICsNCj4gPiArLyoqDQo+ID4gKyAqIHN0cnVjdCByemczc19zeXNjX2luZm8gLSBS
Wi9HM1MgU3lzdGVtIENvbnRyb2xsZXIgZnVuY3Rpb24gaW5mbw0KPiA+ICsgKiBAcnN0X3JzbV9i
OiBSZXNldCBSU01fQiBmdW5jdGlvbiBkZXNjcmlwdG9yICAqLyBzdHJ1Y3QNCj4gPiArcnpnM3Nf
c3lzY19pbmZvIHsNCj4gPiArCXN0cnVjdCByemczc19zeXNjX2Z1bmN0aW9uIHJzdF9yc21fYjsg
fTsNCj4gPiArDQo+ID4gKy8qKg0KPiA+ICsgKiBzdHJ1Y3QgcnpnM3Nfc3lzYyAtIFJaL0czUyBT
eXN0ZW0gQ29udHJvbGxlciBkZXNjcmlwdG9yDQo+ID4gKyAqIEByZWdtYXA6IFN5c3RlbSBjb250
cm9sbGVyIHJlZ21hcA0KPiA+ICsgKiBAaW5mbzogU3lzdGVtIGNvbnRyb2xsZXIgaW5mbw0KPiA+
ICsgKi8NCj4gPiArc3RydWN0IHJ6ZzNzX3N5c2Mgew0KPiA+ICsJc3RydWN0IHJlZ21hcCAqcmVn
bWFwOw0KPiA+ICsJY29uc3Qgc3RydWN0IHJ6ZzNzX3N5c2NfaW5mbyAqaW5mbzsNCj4gPiArfTsN
Cj4gPiArDQo+ID4gICAvKioNCj4gPiAgICAqIHN0cnVjdCByemczc19wY2llX21zaSAtIFJaL0cz
UyBQQ0llIE1TSSBkYXRhIHN0cnVjdHVyZQ0KPiA+ICAgICogQGRvbWFpbjogSVJRIGRvbWFpbg0K
PiA+IEBAIC0yMDMsNiArMjI3LDcgQEAgc3RydWN0IHJ6ZzNzX3BjaWVfaG9zdDsNCj4gPiAgICAq
ICAgICAgICAgICAgICAgIHBvd2VyLW9uDQo+ID4gICAgKiBAY2ZnX3Jlc2V0czogYXJyYXkgd2l0
aCB0aGUgcmVzZXRzIHRoYXQgbmVlZCB0byBiZSBkZS1hc3NlcnRlZA0KPiBhZnRlcg0KPiA+ICAg
ICogICAgICAgICAgICAgIGNvbmZpZ3VyYXRpb24NCj4gPiArICogQHN5c2NfaW5mbzogU1lTQyBm
dW5jdGlvbmFsaXRpZXMNCj4gPiAgICAqIEBudW1fcG93ZXJfcmVzZXRzOiBudW1iZXIgb2YgcG93
ZXIgcmVzZXRzDQo+ID4gICAgKiBAbnVtX2NmZ19yZXNldHM6IG51bWJlciBvZiBjb25maWd1cmF0
aW9uIHJlc2V0cw0KPiA+ICAgICovDQo+ID4gQEAgLTIxMCw2ICsyMzUsNyBAQCBzdHJ1Y3Qgcnpn
M3NfcGNpZV9zb2NfZGF0YSB7DQo+ID4gICAJaW50ICgqaW5pdF9waHkpKHN0cnVjdCByemczc19w
Y2llX2hvc3QgKmhvc3QpOw0KPiA+ICAgCWNvbnN0IGNoYXIgKiBjb25zdCAqcG93ZXJfcmVzZXRz
Ow0KPiA+ICAgCWNvbnN0IGNoYXIgKiBjb25zdCAqY2ZnX3Jlc2V0czsNCj4gPiArCXN0cnVjdCBy
emczc19zeXNjX2luZm8gc3lzY19pbmZvOw0KPiA+ICAgCXU4IG51bV9wb3dlcl9yZXNldHM7DQo+
ID4gICAJdTggbnVtX2NmZ19yZXNldHM7DQo+ID4gICB9Ow0KPiA+IEBAIC0yMzMsNyArMjU5LDcg
QEAgc3RydWN0IHJ6ZzNzX3BjaWVfcG9ydCB7DQo+ID4gICAgKiBAZGV2OiBzdHJ1Y3QgZGV2aWNl
DQo+ID4gICAgKiBAcG93ZXJfcmVzZXRzOiByZXNldCBjb250cm9sIHNpZ25hbHMgdGhhdCBzaG91
bGQgYmUgc2V0IGFmdGVyIHBvd2VyDQo+IHVwDQo+ID4gICAgKiBAY2ZnX3Jlc2V0czogcmVzZXQg
Y29udHJvbCBzaWduYWxzIHRoYXQgc2hvdWxkIGJlIHNldCBhZnRlcg0KPiA+IGNvbmZpZ3VyYXRp
b24NCj4gPiAtICogQHN5c2M6IFNZU0MgcmVnbWFwDQo+ID4gKyAqIEBzeXNjOiBTWVNDIGRlc2Ny
aXB0b3INCj4gPiAgICAqIEBpbnR4X2RvbWFpbjogSU5UeCBJUlEgZG9tYWluDQo+ID4gICAgKiBA
ZGF0YTogU29DIHNwZWNpZmljIGRhdGENCj4gPiAgICAqIEBtc2k6IE1TSSBkYXRhIHN0cnVjdHVy
ZQ0KPiA+IEBAIC0yNDgsNyArMjc0LDcgQEAgc3RydWN0IHJ6ZzNzX3BjaWVfaG9zdCB7DQo+ID4g
ICAJc3RydWN0IGRldmljZSAqZGV2Ow0KPiA+ICAgCXN0cnVjdCByZXNldF9jb250cm9sX2J1bGtf
ZGF0YSAqcG93ZXJfcmVzZXRzOw0KPiA+ICAgCXN0cnVjdCByZXNldF9jb250cm9sX2J1bGtfZGF0
YSAqY2ZnX3Jlc2V0czsNCj4gPiAtCXN0cnVjdCByZWdtYXAgKnN5c2M7DQo+ID4gKwlzdHJ1Y3Qg
cnpnM3Nfc3lzYyAqc3lzYzsNCj4gPiAgIAlzdHJ1Y3QgaXJxX2RvbWFpbiAqaW50eF9kb21haW47
DQo+ID4gICAJY29uc3Qgc3RydWN0IHJ6ZzNzX3BjaWVfc29jX2RhdGEgKmRhdGE7DQo+ID4gICAJ
c3RydWN0IHJ6ZzNzX3BjaWVfbXNpIG1zaTsNCj4gPiBAQCAtMTUxNiw2ICsxNTQyLDcgQEAgc3Rh
dGljIGludCByemczc19wY2llX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gKnBkZXYp
DQo+ID4gICAJc3RydWN0IGRldmljZV9ub2RlICpzeXNjX25wIF9fZnJlZShkZXZpY2Vfbm9kZSkg
PQ0KPiA+ICAgCQlvZl9wYXJzZV9waGFuZGxlKG5wLCAicmVuZXNhcyxzeXNjIiwgMCk7DQo+ID4g
ICAJc3RydWN0IHJ6ZzNzX3BjaWVfaG9zdCAqaG9zdDsNCj4gPiArCXN0cnVjdCByemczc19zeXNj
ICpzeXNjOw0KPiA+ICAgCWludCByZXQ7DQo+ID4NCj4gPiAgIAlicmlkZ2UgPSBkZXZtX3BjaV9h
bGxvY19ob3N0X2JyaWRnZShkZXYsIHNpemVvZigqaG9zdCkpOyBAQCAtMTUyNyw2DQo+ID4gKzE1
NTQsMTMgQEAgc3RhdGljIGludCByemczc19wY2llX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpDQo+ID4gICAJaG9zdC0+ZGF0YSA9IGRldmljZV9nZXRfbWF0Y2hfZGF0YShkZXYp
Ow0KPiA+ICAgCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIGhvc3QpOw0KPiA+DQo+ID4gKwlo
b3N0LT5zeXNjID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCpob3N0LT5zeXNjKSwgR0ZQX0tF
Uk5FTCk7DQo+ID4gKwlpZiAoIWhvc3QtPnN5c2MpDQo+ID4gKwkJcmV0dXJuIC1FTk9NRU07DQo+
ID4gKw0KPiA+ICsJc3lzYyA9IGhvc3QtPnN5c2M7DQo+ID4gKwlzeXNjLT5pbmZvID0gJmhvc3Qt
PmRhdGEtPnN5c2NfaW5mbzsNCj4gPiArDQo+ID4gICAJaG9zdC0+YXhpID0gZGV2bV9wbGF0Zm9y
bV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDApOw0KPiA+ICAgCWlmIChJU19FUlIoaG9zdC0+YXhp
KSkNCj4gPiAgIAkJcmV0dXJuIFBUUl9FUlIoaG9zdC0+YXhpKTsNCj4gPiBAQCAtMTU0MCwxNSAr
MTU3NCwxNiBAQCBzdGF0aWMgaW50IHJ6ZzNzX3BjaWVfcHJvYmUoc3RydWN0DQo+IHBsYXRmb3Jt
X2RldmljZSAqcGRldikNCj4gPiAgIAlpZiAocmV0KQ0KPiA+ICAgCQlyZXR1cm4gcmV0Ow0KPiA+
DQo+ID4gLQlob3N0LT5zeXNjID0gc3lzY29uX25vZGVfdG9fcmVnbWFwKHN5c2NfbnApOw0KPiA+
IC0JaWYgKElTX0VSUihob3N0LT5zeXNjKSkgew0KPiA+IC0JCXJldCA9IFBUUl9FUlIoaG9zdC0+
c3lzYyk7DQo+ID4gKwlzeXNjLT5yZWdtYXAgPSBzeXNjb25fbm9kZV90b19yZWdtYXAoc3lzY19u
cCk7DQo+ID4gKwlpZiAoSVNfRVJSKHN5c2MtPnJlZ21hcCkpIHsNCj4gPiArCQlyZXQgPSBQVFJf
RVJSKHN5c2MtPnJlZ21hcCk7DQo+ID4gICAJCWdvdG8gcG9ydF9yZWZjbGtfcHV0Ow0KPiA+ICAg
CX0NCj4gPg0KPiA+IC0JcmV0ID0gcmVnbWFwX3VwZGF0ZV9iaXRzKGhvc3QtPnN5c2MsIFJaRzNT
X1NZU19QQ0lFX1JTVF9SU01fQiwNCj4gPiAtCQkJCSBSWkczU19TWVNfUENJRV9SU1RfUlNNX0Jf
TUFTSywNCj4gPiAtCQkJCSBGSUVMRF9QUkVQKFJaRzNTX1NZU19QQ0lFX1JTVF9SU01fQl9NQVNL
LCAxKSk7DQo+ID4gKwlyZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMoc3lzYy0+cmVnbWFwLA0KPiA+
ICsJCQkJIHN5c2MtPmluZm8tPnJzdF9yc21fYi5vZmZzZXQsDQo+IA0KPiBUaGlzIGNhbiBzdGF5
IG9uIHRoZSBwcmV2aW91cyBsaW5lIHRvIHNwYXJlIG9uZSBleHRyYSBsaW5lIG9mIGNvZGUuDQoN
CkluZGVlZC4gTm90ZWQgZm9yIFYyLg0KDQpSZWdhcmRzLA0KSm9obg0KDQo+IA0KPiBUaGUgcmVz
dCBMR1RNLg0KPiANCj4gVGhhbmsgeW91LA0KPiBDbGF1ZGl1DQo=

