Return-Path: <linux-renesas-soc+bounces-5335-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D388C3E9A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2024 12:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B5C21F21E09
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2024 10:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 794B4149C56;
	Mon, 13 May 2024 10:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="HKZegQXw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB66D148852;
	Mon, 13 May 2024 10:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.156.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715594931; cv=fail; b=hK2hwAmhroVQDot2ynzQIi395cAEHIWwWELwFrm2tw6dJCYyr7JKhBilRta0qZLbgZ0Z5vJccHIh+dOGbqYZdCfxXAc5qlJHrrLsUA1zITNtmgX1IpNC701oRTFt7BUb/Y0ntXdWttGhc6u8TuqU+zFQvC3wKjnXAfGN6+iy+tI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715594931; c=relaxed/simple;
	bh=k8aakhFD51mw+mESFMB33ttEbuEFYmLzfBDZlMmVQt4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=c7ziCsM7/kmM50Rygtazu2klRbNTyFwoeicoo2xd6UVfR5SjvtcBYU2thS5eW5PMUzOv1iWGL8AuZD3/8FfSlJKuOB7EpyCJIqiB29pxFQvT94m3NqwK+I9oaiNXGXdxcMn5KxAF3YOkmgYqNeEGLEsDbLvcdqn8AzxE4OdMuJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=HKZegQXw; arc=fail smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44D8Y06K003386;
	Mon, 13 May 2024 03:08:19 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3y286jbv4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 03:08:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nDYpoCpVrI12Af/4/N7g2iZsnxuakkQMf2hDQhbbYmYMnzRku2BdINDi9Nx4PK1nqLE/9nZ9n/hmSodhxC/bekmVWANM23lB3QUTuYCxCFK7V7f479Vso8WdOrw13q8Haz0vwL3OaHM+MNkXsOHhj961hgHPX4rbSg1tQrBQ8NY09hLigsLPVgzGXRWnMhHLJd4II3d7QIS7BCIaUOeGqcfvdHNCZ5AO43BqwAf6Bxjt3MVShID6ArBI9VM4hS8IVMxf1hc0F3K1TYljxmnPqcSXO/khmBGNKPiTm9i0R1ijA9+2ODRuDK0ZB3EPejAaK6qZdvqdmbq49+qhyJpx9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8aakhFD51mw+mESFMB33ttEbuEFYmLzfBDZlMmVQt4=;
 b=VD4oAXu27sfvIq5ULV8aArei14W+uGb5H6FzlnHC0yAemQ86dEIP5Uq/xhxnFfOt4TtTvpY7Xi1RQaI5/W01brMnVOnFqMJVZtZjdufQUQb08N5d2tR3GUQEwKmIOh+ObOd3KMgpduUhybR6rBKD+aRJ6cRO8lN3D+Mbb5XqwQgOthHRc0B+kpk1xNZN7x8LdYrH+QI7oyue7U4HVm0zE+T/tJDT+ZY0sQmTD8eUYflK2PUzLpjw0hqJCgHjCskrhNZTRpDyl7iiLIAm2c+UaWTvMiAcipJLl0DH5WKVp/6CFaRgr0urZ2WdYdNJPn1G2iPphOmeGT6wtM5RbC9Grw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8aakhFD51mw+mESFMB33ttEbuEFYmLzfBDZlMmVQt4=;
 b=HKZegQXw0OcTyGpWKZi9UksVsZuvbcWRJV8ToV/h2c1n1O8dV8MDWDJ5da02bVAHBU0Uw2Z9I9gPeZ3hVlEtVLnY+XFP7bhZMJsxw114C4grBVR1Bn2dP7hmM80053ujFwIcIHvXc5hk3+k5zSXzQSOnp8cBjUSTAGqH0c6sUXM=
Received: from PH0PR18MB4474.namprd18.prod.outlook.com (2603:10b6:510:ea::22)
 by IA3PR18MB6186.namprd18.prod.outlook.com (2603:10b6:208:51c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 10:08:16 +0000
Received: from PH0PR18MB4474.namprd18.prod.outlook.com
 ([fe80::eeed:4f:2561:f916]) by PH0PR18MB4474.namprd18.prod.outlook.com
 ([fe80::eeed:4f:2561:f916%5]) with mapi id 15.20.7452.049; Mon, 13 May 2024
 10:08:16 +0000
From: Hariprasad Kelam <hkelam@marvell.com>
To: Romain Gantois <romain.gantois@bootlin.com>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Russell King
	<linux@armlinux.org.uk>,
        =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
	<clement.leger@bootlin.com>,
        Serge Semin <fancer.lancer@gmail.com>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "Russell King (Oracle)"
	<rmk+kernel@armlinux.org.uk>
Subject: [PATCH net-next v7 6/7] net: stmmac: add support for RZ/N1 GMAC
Thread-Topic: [PATCH net-next v7 6/7] net: stmmac: add support for RZ/N1 GMAC
Thread-Index: AQHapR14o7wZj8cZKUqQkU6f0ZJv9g==
Date: Mon, 13 May 2024 10:08:16 +0000
Message-ID: 
 <PH0PR18MB447431B3837256010EFEBD1FDEE22@PH0PR18MB4474.namprd18.prod.outlook.com>
References: <20240513-rzn1-gmac1-v7-0-6acf58b5440d@bootlin.com>
 <20240513-rzn1-gmac1-v7-6-6acf58b5440d@bootlin.com>
In-Reply-To: <20240513-rzn1-gmac1-v7-6-6acf58b5440d@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR18MB4474:EE_|IA3PR18MB6186:EE_
x-ms-office365-filtering-correlation-id: fea392e7-e37d-44c8-18f7-08dc73349b78
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230031|376005|1800799015|7416005|366007|921011|38070700009;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Q0ZEMk0xUkIzYXpWWWhqaWVwTzFWSGJwT1JyOWZiMmRBbWxGKzRyWGhhZWNi?=
 =?utf-8?B?bjJoczQzTUtjNjhnL1p1eW1vVDJGelZxZjZHU1J1SGFuOEx4QW9rVEQyNnVn?=
 =?utf-8?B?eUhKdC9ZUUdjNHdPSmFBVjQrQlJkQW1sWGpoRC9RYklBQTJoL3VlNlpvVXll?=
 =?utf-8?B?ZjhFV2g1cGpsQU1FVTJBS3dXU2xicFcxbzkvUU91cEtqSkRSUHhnVGpscHpB?=
 =?utf-8?B?Qk8vQk5NTGk1VDl3bjdsQk5wTmRSSXZmTy9OSHNrczJ3Q0VyTUx2UnpPMTRh?=
 =?utf-8?B?ZmJmR0JaQlV3S2Uzb21uZ3l0MC9FcXluSXhGUlA3ZmZBVVV0MHIzWVFwS3ZI?=
 =?utf-8?B?VW4zVnh1a1pwbVk3aC9RYzBNQVJmOEY3RGlwQnlWMk1TcmYzZGQ2enFXVGhD?=
 =?utf-8?B?bEhhUHloa2swaDcxQitMWU5tbkxHQUdabmZkOHlYeVo3NEZ4eGZCTnRHcDlh?=
 =?utf-8?B?VFQvZDdlWFNLbU5DSlB1dlFjQ3VFREl5eTBlcUVqOWpUNncyZFFZTVJ1VnB6?=
 =?utf-8?B?OVBjS2lJaFk1RDZCRG1Mb1VzWlZlVEdvUUk3cWdUajdvL0RRbW4xcjhiaTU4?=
 =?utf-8?B?VkxiMFRyU0J1VWJLK3g1cWk0NFdpcVY4ZXhPaFA1TFZoNlRqZUl4Mm5xd21M?=
 =?utf-8?B?d0cxOS9ZRmNCVUxKMFFLV0g5cGVpWW92VVpTVUM3OUViTFUyUU5aNzc4dDBa?=
 =?utf-8?B?MXkybkFoZTQ4SFdCSVFTQVVoejcyQkJKTnM0UjVxQkdiR0tZdCtlaG80QU9i?=
 =?utf-8?B?U3RXQVBzNmpRdVFPMkNXNlhaZHNOcmVWc1lHZXVqZVh6bkhWc1BxRHl5QWtZ?=
 =?utf-8?B?TTZVZ2xLNHNuNjVWN2VLN3NXbEl3b0tWNktPWHZuTFVEdGZMQUd3Mm1rSWx1?=
 =?utf-8?B?dzR5MVBiVElrRWhBcVdHcFZMVHlBZy95YS9MMUxIMFpqQ2t6ZHRSeVc1T044?=
 =?utf-8?B?WlUyZGhvMmNtampLS0N3dXdxcWt2Yzk3VzkvZGhmSW5sVjBjUU5SaXAzNXg2?=
 =?utf-8?B?N0cvRStVRmNDdjIwQTZjZHJqdHJBSHkyQ2dReDZpUStUUW5XZ09aL3oxZlR5?=
 =?utf-8?B?MnpwSVE0V3NyVVhlVGlZVnlaVytsQjBGS1NlNmtTeHN2azd0Q052UVR6RHZn?=
 =?utf-8?B?ZGsrVGtvRk91NUFxWHlSUTkzV2JlaHNWM1NCWmExRjJrSUNFYTQ5Yk9iTlRw?=
 =?utf-8?B?clB1eU14RzVxREVzQi90MEFLN3grc1NPMkJkWVZZeUJjZ0lDS2lZQlNPMVlM?=
 =?utf-8?B?dGFyK1NYUnFBSCtQQU8vOHhOWUt5d25paVIxQlBYTE80TTd5YjJUczlOd1hs?=
 =?utf-8?B?Z3d3emhReFBLcFBTSEZqeE1PcStvd2Qvc1BJNHJBaFFOTnN0WXB0NnZaYmVT?=
 =?utf-8?B?ZUsxZFRZVFB6TzhFR3dtNG9jeHdvQTFKd2ZUQmdVeFVZdW84TzI2QjNmckUx?=
 =?utf-8?B?eThOQXRPZzQ3QjVoUHY3d2M5Mld4S1FXYlhUa3FULzJSOFJ5aFZRSnByZVBp?=
 =?utf-8?B?eWR3UUZlcE1mbnJlNEFhcW9jTG9RYVVPWElkSTE4UmxsbFppcG5SWG9XbEE1?=
 =?utf-8?B?b1d6bVVuMWZncCtwMDhmOXNLcjlEM0pYQUJ5UHJpNnBLK3JWRWMyUThNeE5O?=
 =?utf-8?B?SGtncGJqWnVubXdpSFFGaTBvUkltVVdKT01ZMTN4SnkrVk9aNHIzWTB2YkNC?=
 =?utf-8?B?SC9BMG5uVmEvWlQ4ZzFRWjZaOTA0Tjg2d21VQWZ0L0dVZlFWSmo1K1I5cUJB?=
 =?utf-8?B?UzNzZUE1RjBTODR2Q2IwTklRTFBscnZMOGdNSG9Cb0R6cUdMa2Y0aE1qQ3pz?=
 =?utf-8?Q?hROv/vM5kweuZW8kRJPF4ws8XhS0u68x42X3w=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB4474.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(7416005)(366007)(921011)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?V0ZJblh4YklWb2dheDV6WlB5bU9WcjJnekpXWHRWc3k5dnVibno5clRuSHRo?=
 =?utf-8?B?K1VUQ1pMQVBuOUZTWXRrM3VQR0llbUo2SitkVXZEejd1VHdxeERvdVR4dXN2?=
 =?utf-8?B?T1JWNDZEcE95clhidk9JZjlTSDM1S3AveUJrcEZWMUdrTDdHZ2RpRDFJdmRH?=
 =?utf-8?B?UnFFTXEzQzBQV2lES1J4dUJpZng5M2RKTjdVMlJ3ZjRlRm1RZ2xlVmNobnFE?=
 =?utf-8?B?ejFlR3ZnRm1WaGc0cUpKZTJOOXNhcnkxRzRYaUdQQ3pzbDlldHdtR01ZT0xH?=
 =?utf-8?B?Z2w5U210U2dFNm1FNWNMUktrOHdXWFRQK1BGSXBBajF0YlIzbms1blhqR0tV?=
 =?utf-8?B?SWtRd09sQnZuNlVqMzAwdDJvTUkzR21qYVAzVk41bThqQ3JSNzNyT1ZWOGM4?=
 =?utf-8?B?RjFWdjliSytxYlcxOWErSlVUVTJ5TjBQbW9Qd3RuUUgwZHpsb3RKcFBqN0Zu?=
 =?utf-8?B?NDlOakJyN1NMbGVTeVUxTnMvN0ZHd3VIZ1NJQTNXbGRpcEtRN0J4RjFKdU1P?=
 =?utf-8?B?OW1vZndpaVZvSjVtaEdZZFFUbHgvWmN3YUYvc1pKb3NqM0FjNmE0alhaSXdy?=
 =?utf-8?B?V29VQ1BMWXR3U3BkbkFlbUFQM3dWcEI2OXEycUdydU9zWElTclNoZFhETGYr?=
 =?utf-8?B?SmZYSWFVSDZId1JJNCtKRkpuOWRYSjNZMEMwT0R1SHdDSlFNOGU2a2NVbVhG?=
 =?utf-8?B?ejgvMlB0cTZMeEJrRXRyL3UvanBDaXFGK1Rhc1lleDVLL0NOZjJBU1B5c2cx?=
 =?utf-8?B?WnFmcm1iUVpNdlZRNkpFWkFaQjVkeW5qV0l5Qll0U0dwWm5yM2FYd1ZOL3B6?=
 =?utf-8?B?dkdyK3VDQ29iSk51Q3FrbnMvOG84OXF0cVhOdi9JZk5zVjk1M09pcENleTM3?=
 =?utf-8?B?M05uZHRzdEFxS0FLN1JWa0Z3cGpuYjh0QVJrVzlqRUtsZSs3eGdwVGU5T01Z?=
 =?utf-8?B?MXFrOFNJVlEydlNnQ1h6ZWcwcnE1NGtrbHNCV0F0U0ZYTloyc0F1RTZack1l?=
 =?utf-8?B?QXM4QzZvVVFuUnNtT0ZPR0FYZExOeXRQNG44bk53VWJYRUtZbU1VNjFEa2Z5?=
 =?utf-8?B?Y3d0MHBWdnBwMEJiR05WSUh4YjVCQzdSUTdlL1lMakVnMFlzUjVHWlJ6akVh?=
 =?utf-8?B?SlNiV2ZHZDUrb2pvaGdFdnNtZkY2cG10VlQ2REU1ZmdNbitpUDZsWG8wbFNn?=
 =?utf-8?B?SG5TSzh3eXh0c29CcUo1Vk00NkdTQnZEUStyYzU2cHJNcWNtblNHcTZvWUM5?=
 =?utf-8?B?TlU0d0kzVHczTTBlZDNUYlFFSmtXQnZIWWcxSWZzc2R4UVY1Lzl2L1REQzU2?=
 =?utf-8?B?WmtqTVF5U1RzSlVXWHdCUnZ3MW9VeGpLUWphemJocnh4bXMrNm5Vd2lKUTdp?=
 =?utf-8?B?L2sySms4RnBLdDlXNC9JZ1lpMVF2SkloWUlJRkc0SGNKcUZiUzIyQ3NlNktF?=
 =?utf-8?B?Q0VNRExzTnhoNFRLTjUwTUhwNGwvN01PcmRGZGFadUNCUFd4L3kwK0pnZmVV?=
 =?utf-8?B?U2xSWFgycmtXS2xyZmlNMThyRjlLa0RTL0t2SzRPcGVyRXFIUXA4UUZMZXh4?=
 =?utf-8?B?ajhoYTFaczZnNDRMdVJXWHVKQytyV2lrMkN3UWk5TElWK2ZJaXNJMnNMTnVu?=
 =?utf-8?B?eFJhNy9URXJCWE5NZVRVSzRpODE3UVMwVHJaU3lacFhDcExHV2hKVGs0U2Iv?=
 =?utf-8?B?c0ljTnBaVm9wdGtoeGlMSEY5ZXNjRFQwUzlpeEZraWxLVDVEYTcvY1ZUZU5y?=
 =?utf-8?B?aHBBaVRwbkVEaUg2QXRUMmNFWno4OWJGd1R2VlY2RXN5MDgveGdFR0hTK2p0?=
 =?utf-8?B?eXRYNTFSelcwZTJUZkYrRkNvbDVReTZ3eEVMbWZuRUJ2cUZWb0hLajlvTHNE?=
 =?utf-8?B?NmcwRGt5LzhMMEY0ayttRjVXVUdpZlVuRnF4MjBRN2tTTXBQOFRRZWs0aUpC?=
 =?utf-8?B?N3VCeWJlM0tiMDBzOGdoMU0rYjFhN1VCWEg2SStNbkp0T3dUdHA4N2NUSnlD?=
 =?utf-8?B?UERuNHNqUWkyTzZKbDRlY3hJSjY0LzErdXdyTTBSYXFEbys5ci9hZlZnbzNU?=
 =?utf-8?B?a3JnRlVaajRhRGZWMHhOZXlMbDR5dFBSalpMYUJqTHRiQ2R2aXNXYUJpMUxp?=
 =?utf-8?Q?c6PM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB4474.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fea392e7-e37d-44c8-18f7-08dc73349b78
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2024 10:08:16.3219
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lINg+c0CLLknYy3VpuDSTqeQH5kzrzyUNZdI07nVqJkr2XqbEq4/K6/vDUkVZrjFytzoXUk8oS07CtFLAi1pWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR18MB6186
X-Proofpoint-GUID: 6epfAT4hiP3t84LCrK96pJJT1xKeFI4x
X-Proofpoint-ORIG-GUID: 6epfAT4hiP3t84LCrK96pJJT1xKeFI4x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_06,2024-05-10_02,2023-05-22_02

DQoNCj4gU3ViamVjdDogW0VYVEVSTkFMXSBbUEFUQ0ggbmV0LW5leHQgdjcgNi83XSBuZXQ6IHN0
bW1hYzogYWRkIHN1cHBvcnQgZm9yDQo+IFJaL04xIEdNQUMNCj4gDQo+IFByaW9yaXRpemUgc2Vj
dXJpdHkgZm9yIGV4dGVybmFsIGVtYWlsczogQ29uZmlybSBzZW5kZXIgYW5kIGNvbnRlbnQgc2Fm
ZXR5DQo+IGJlZm9yZSBjbGlja2luZyBsaW5rcyBvciBvcGVuaW5nIGF0dGFjaG1lbnRzDQo+IA0K
PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tDQo+IEZyb206IENsw6ltZW50IEzDqWdlciA8Y2xlbWVudC5sZWdlckBi
b290bGluLmNvbT4NCj4gDQo+IEFkZCBzdXBwb3J0IGZvciB0aGUgUmVuZXNhcyBSWi9OMSBHTUFD
LiBUaGlzIHN1cHBvcnQgY2FuIG1ha2UgdXNlIG9mIGENCj4gY3VzdG9tIFJaL04xIFBDUyB3aGlj
aCBpcyBmZXRjaGVkIGJ5IHBhcnNpbmcgdGhlIHBjcy1oYW5kbGUgZGV2aWNlIHRyZWUNCj4gcHJv
cGVydHkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZW1lbnQubGVn
ZXJAYm9vdGxpbi5jb20+DQo+IENvLWRldmVsb3BlZC1ieTogUm9tYWluIEdhbnRvaXMgPHJvbWFp
bi5nYW50b2lzQGJvb3RsaW4uY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBSb21haW4gR2FudG9pcyA8
cm9tYWluLmdhbnRvaXNAYm9vdGxpbi5jb20+DQo+IFJldmlld2VkLWJ5OiBSdXNzZWxsIEtpbmcg
KE9yYWNsZSkgPHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPg0KPiAtLS0NCj4gIE1BSU5UQUlO
RVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA2ICsrDQo+ICBkcml2
ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9LY29uZmlnICAgICAgfCAxMiArKysrDQo+
ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9NYWtlZmlsZSAgICAgfCAgMSAr
DQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yem4xLmMgfCA4
Ng0KPiArKysrKysrKysrKysrKysrKysrKysrKysNCj4gIDQgZmlsZXMgY2hhbmdlZCwgMTA1IGlu
c2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJT
DQo+IGluZGV4IGI4MWIyYmU2MGI3NzQuLjk1YmIwOWFhY2YxODEgMTAwNjQ0DQo+IC0tLSBhL01B
SU5UQUlORVJTDQo+ICsrKyBiL01BSU5UQUlORVJTDQo+IEBAIC0xODg2OCw2ICsxODg2OCwxMiBA
QCBGOglpbmNsdWRlL2R0LWJpbmRpbmdzL25ldC9wY3MtcnpuMS0NCj4gbWlpYy5oDQo+ICBGOglp
bmNsdWRlL2xpbnV4L3Bjcy1yem4xLW1paWMuaA0KPiAgRjoJbmV0L2RzYS90YWdfcnpuMV9hNXBz
dy5jDQo+IA0KPiArUkVORVNBUyBSWi9OMSBEV01BQyBHTFVFIExBWUVSDQo+ICtNOglSb21haW4g
R2FudG9pcyA8cm9tYWluLmdhbnRvaXNAYm9vdGxpbi5jb20+DQo+ICtTOglNYWludGFpbmVkDQo+
ICtGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3JlbmVzYXMscnpuMS1n
bWFjLnlhbWwNCj4gK0Y6CWRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFj
LXJ6bjEuYw0KPiArDQo+ICBSRU5FU0FTIFJaL04xIFJUQyBDT05UUk9MTEVSIERSSVZFUg0KPiAg
TToJTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4NCj4gIEw6CWxpbnV4
LXJ0Y0B2Z2VyLmtlcm5lbC5vcmcNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0
L3N0bWljcm8vc3RtbWFjL0tjb25maWcNCj4gYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3Jv
L3N0bW1hYy9LY29uZmlnDQo+IGluZGV4IDRlYzYxZjFlZTcxYTIuLjA1Y2MwN2I4ZjQ4YzAgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL0tjb25maWcN
Cj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvS2NvbmZpZw0KPiBA
QCAtMTQyLDYgKzE0MiwxOCBAQCBjb25maWcgRFdNQUNfUk9DS0NISVANCj4gIAkgIFRoaXMgc2Vs
ZWN0cyB0aGUgUm9ja2NoaXAgUkszMjg4IFNvQyBnbHVlIGxheWVyIHN1cHBvcnQgZm9yDQo+ICAJ
ICB0aGUgc3RtbWFjIGRldmljZSBkcml2ZXIuDQo+IA0KPiArY29uZmlnIERXTUFDX1JaTjENCj4g
Kwl0cmlzdGF0ZSAiUmVuZXNhcyBSWi9OMSBkd21hYyBzdXBwb3J0Ig0KPiArCWRlZmF1bHQgQVJD
SF9SWk4xDQo+ICsJZGVwZW5kcyBvbiBPRiAmJiAoQVJDSF9SWk4xIHx8IENPTVBJTEVfVEVTVCkN
Cj4gKwlzZWxlY3QgUENTX1JaTjFfTUlJQw0KPiArCWhlbHANCj4gKwkgIFN1cHBvcnQgZm9yIEV0
aGVybmV0IGNvbnRyb2xsZXIgb24gUmVuZXNhcyBSWi9OMSBTb0MgZmFtaWx5Lg0KPiArDQo+ICsJ
ICBUaGlzIHNlbGVjdHMgdGhlIFJlbmVzYXMgUlovTjEgU29DIGdsdWUgbGF5ZXIgc3VwcG9ydCBm
b3INCj4gKwkgIHRoZSBzdG1tYWMgZGV2aWNlIGRyaXZlci4gVGhpcyBzdXBwb3J0IGNhbiBtYWtl
IHVzZSBvZiBhIGN1c3RvbQ0KPiBNSUkNCj4gKwkgIGNvbnZlcnRlciBQQ1MgZGV2aWNlLg0KPiAr
DQo+ICBjb25maWcgRFdNQUNfU09DRlBHQQ0KPiAgCXRyaXN0YXRlICJTT0NGUEdBIGR3bWFjIHN1
cHBvcnQiDQo+ICAJZGVmYXVsdCBBUkNIX0lOVEVMX1NPQ0ZQR0ENCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL01ha2VmaWxlDQo+IGIvZHJpdmVycy9u
ZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvTWFrZWZpbGUNCj4gaW5kZXggMjZjYWQ0MzQ0NzAx
ZS4uYzJmMGU5MWY2YmY4MyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3Rt
aWNyby9zdG1tYWMvTWFrZWZpbGUNCj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNy
by9zdG1tYWMvTWFrZWZpbGUNCj4gQEAgLTIxLDYgKzIxLDcgQEAgb2JqLSQoQ09ORklHX0RXTUFD
X01FRElBVEVLKQkrPSBkd21hYy0NCj4gbWVkaWF0ZWsubw0KPiAgb2JqLSQoQ09ORklHX0RXTUFD
X01FU09OKQkrPSBkd21hYy1tZXNvbi5vIGR3bWFjLQ0KPiBtZXNvbjhiLm8NCj4gIG9iai0kKENP
TkZJR19EV01BQ19RQ09NX0VUSFFPUykJKz0gZHdtYWMtcWNvbS1ldGhxb3Mubw0KPiAgb2JqLSQo
Q09ORklHX0RXTUFDX1JPQ0tDSElQKQkrPSBkd21hYy1yay5vDQo+ICtvYmotJChDT05GSUdfRFdN
QUNfUlpOMSkJKz0gZHdtYWMtcnpuMS5vDQo+ICBvYmotJChDT05GSUdfRFdNQUNfU09DRlBHQSkJ
Kz0gZHdtYWMtYWx0ci1zb2NmcGdhLm8NCj4gIG9iai0kKENPTkZJR19EV01BQ19TVEFSRklWRSkJ
Kz0gZHdtYWMtc3RhcmZpdmUubw0KPiAgb2JqLSQoQ09ORklHX0RXTUFDX1NUSSkJCSs9IGR3bWFj
LXN0aS5vDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1h
Yy9kd21hYy1yem4xLmMNCj4gYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9k
d21hYy1yem4xLmMNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAw
MC4uODQ4Y2YzYzAxZjRhYg0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL2RyaXZlcnMvbmV0L2V0
aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXJ6bjEuYw0KPiBAQCAtMCwwICsxLDg2IEBADQo+
ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcg0KPiArLyoNCj4g
KyAqIENvcHlyaWdodCAoQykgMjAyNCBTY2huZWlkZXItRWxlY3RyaWMNCj4gKyAqDQo+ICsgKiBD
bMOpbWVudCBMw6lnZXIgPGNsZW1lbnQubGVnZXJAYm9vdGxpbi5jb20+ICAqLw0KPiArDQo+ICsj
aW5jbHVkZSA8bGludXgvb2YuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9wY3MtcnpuMS1taWljLmg+
DQo+ICsjaW5jbHVkZSA8bGludXgvcGh5bGluay5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L3BsYXRm
b3JtX2RldmljZS5oPg0KPiArDQo+ICsjaW5jbHVkZSAic3RtbWFjX3BsYXRmb3JtLmgiDQo+ICsj
aW5jbHVkZSAic3RtbWFjLmgiDQo+ICsNCj4gK3N0YXRpYyBpbnQgcnpuMV9kd21hY19wY3NfaW5p
dChzdHJ1Y3Qgc3RtbWFjX3ByaXYgKnByaXYpIHsNCj4gKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5w
ID0gcHJpdi0+ZGV2aWNlLT5vZl9ub2RlOw0KPiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqcGNzX25v
ZGU7DQo+ICsJc3RydWN0IHBoeWxpbmtfcGNzICpwY3M7DQo+ICsNCj4gKwlwY3Nfbm9kZSA9IG9m
X3BhcnNlX3BoYW5kbGUobnAsICJwY3MtaGFuZGxlIiwgMCk7DQo+ICsNCj4gKwlpZiAocGNzX25v
ZGUpIHsNCj4gKwkJcGNzID0gbWlpY19jcmVhdGUocHJpdi0+ZGV2aWNlLCBwY3Nfbm9kZSk7DQo+
ICsJCW9mX25vZGVfcHV0KHBjc19ub2RlKTsNCj4gKwkJaWYgKElTX0VSUihwY3MpKQ0KPiArCQkJ
cmV0dXJuIFBUUl9FUlIocGNzKTsNCj4gKw0KPiArCQlwcml2LT5ody0+cGh5bGlua19wY3MgPSBw
Y3M7DQo+ICsJfQ0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyB2b2lk
IHJ6bjFfZHdtYWNfcGNzX2V4aXQoc3RydWN0IHN0bW1hY19wcml2ICpwcml2KSB7DQo+ICsJaWYg
KHByaXYtPmh3LT5waHlsaW5rX3BjcykNCj4gKwkJbWlpY19kZXN0cm95KHByaXYtPmh3LT5waHls
aW5rX3Bjcyk7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBpbnQgcnpuMV9kd21hY19wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KSB7DQo+ICsJc3RydWN0IHBsYXRfc3RtbWFjZW5ldF9k
YXRhICpwbGF0X2RhdDsNCj4gKwlzdHJ1Y3Qgc3RtbWFjX3Jlc291cmNlcyBzdG1tYWNfcmVzOw0K
PiArCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7DQo+ICsJaW50IHJldDsNCj4gKw0K
PiArCXJldCA9IHN0bW1hY19nZXRfcGxhdGZvcm1fcmVzb3VyY2VzKHBkZXYsICZzdG1tYWNfcmVz
KTsNCj4gKwlpZiAocmV0KQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiArDQo+ICsJcGxhdF9kYXQgPSBk
ZXZtX3N0bW1hY19wcm9iZV9jb25maWdfZHQocGRldiwgc3RtbWFjX3Jlcy5tYWMpOw0KPiArCWlm
IChJU19FUlIocGxhdF9kYXQpKQ0KPiArCQlyZXR1cm4gUFRSX0VSUihwbGF0X2RhdCk7DQo+ICsN
Cj4gKwlwbGF0X2RhdC0+YnNwX3ByaXYgPSBwbGF0X2RhdDsNCj4gKwlwbGF0X2RhdC0+cGNzX2lu
aXQgPSByem4xX2R3bWFjX3Bjc19pbml0Ow0KPiArCXBsYXRfZGF0LT5wY3NfZXhpdCA9IHJ6bjFf
ZHdtYWNfcGNzX2V4aXQ7DQo+ICsNCj4gKwlyZXQgPSBzdG1tYWNfZHZyX3Byb2JlKGRldiwgcGxh
dF9kYXQsICZzdG1tYWNfcmVzKTsNCj4gKwlpZiAocmV0KQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiAr
DQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2
aWNlX2lkIHJ6bjFfZHdtYWNfbWF0Y2hbXSA9IHsNCj4gKwl7IC5jb21wYXRpYmxlID0gInJlbmVz
YXMscnpuMS1nbWFjIiB9LA0KPiArCXsgfQ0KPiArfTsNCj4gK01PRFVMRV9ERVZJQ0VfVEFCTEUo
b2YsIHJ6bjFfZHdtYWNfbWF0Y2gpOw0KPiArDQo+ICtzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2Ry
aXZlciByem4xX2R3bWFjX2RyaXZlciA9IHsNCj4gKwkucHJvYmUgID0gcnpuMV9kd21hY19wcm9i
ZSwNCj4gKwkucmVtb3ZlX25ldyA9IHN0bW1hY19wbHRmcl9yZW1vdmUsDQo+ICsJLmRyaXZlciA9
IHsNCj4gKwkJLm5hbWUgICAgICAgICAgID0gInJ6bjEtZHdtYWMiLA0KPiArCQkub2ZfbWF0Y2hf
dGFibGUgPSByem4xX2R3bWFjX21hdGNoLA0KPiArCX0sDQo+ICt9Ow0KPiArbW9kdWxlX3BsYXRm
b3JtX2RyaXZlcihyem4xX2R3bWFjX2RyaXZlcik7DQo+ICsNCj4gK01PRFVMRV9BVVRIT1IoIkNs
w6ltZW50IEzDqWdlciA8Y2xlbWVudC5sZWdlckBib290bGluLmNvbT4iKTsNCj4gK01PRFVMRV9E
RVNDUklQVElPTigiUmVuZXNhcyBSWk4xIERXTUFDIHNwZWNpZmljIGdsdWUgbGF5ZXIiKTsNCj4g
K01PRFVMRV9MSUNFTlNFKCJHUEwiKTsNCj4gDQo+IC0tDQo+IDIuNDQuMA0KPiANClJldmlld2Vk
LWJ5OiBIYXJpcHJhc2FkIEtlbGFtIDxoa2VsYW1AbWFydmVsbC5jb20+DQoNCg==

