Return-Path: <linux-renesas-soc+bounces-5340-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C9C8C3EC5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2024 12:21:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09F871F22243
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2024 10:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA09614A0A6;
	Mon, 13 May 2024 10:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="MNJSokqC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9EB14A098;
	Mon, 13 May 2024 10:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.156.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715595713; cv=fail; b=NMPmHdSIQEPPSld+kbQEx1QTwZ/F/NYrNGyppCA+FeEJBu0pjfu3AqwWfiek2FTaz3DgdI5t04BuGvJXpmb1WQp/26zhfTzkHwFIjBQWEw9Zf/BTTxO/WfykD/Z0tvY25CFw5yGovIy36axONyhbLsIPEBTJ6MoqMelK41LrYDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715595713; c=relaxed/simple;
	bh=QSX30FNasTlgWg0Lv2PWe3hfU6OipIDPQf5AQ9ZTsc4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IsKfczefuyStfKpd0xuQ8ZnlDY1gQHcNXgx9dIC6z3NN/Zhx/r9T42P+C/kavwKmbpI+IG1gxWz+j4MsObvh+hAff53l5e93iDr7+S9mL2RNYFHc1arOxcIcSkitnZ1aCT1iEFqrHD6Hj9WC0VhzgQOviB5ox359bxwwqy15LPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=MNJSokqC; arc=fail smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44D8X8E5002142;
	Mon, 13 May 2024 03:21:24 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3y286jbw42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 03:21:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mws9ctsYaX+GurpdiRXG4kE0zm8RbD4BiuspdN+orrETou9/ewdIulra3rLh9OHzPNOnrvZZx3zx0tR4bGaY7IIDLJDOWn7ITHQSQ3lhlcqQmEJcD90XZSXgwNv80rUz1R7ypog8KvLQDxYTqVVk4UUsjoPftFX2w9JVZdDE+7KVil1yBd7rdLBM4gMWOn0/EMRaPbqaXRv31Jwzl6yvX86WL2dOAjNc05iBgaE0FvLiuJopdwo+KzlptWOaRZcFwP4xRcpbNUp4w3rXcXOg2c1rhQNx3GYc6QtV1MAmvw0BxskO3jcCsi4qBWYNIlbC1myrbPHx57SomjNZWAdIoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSX30FNasTlgWg0Lv2PWe3hfU6OipIDPQf5AQ9ZTsc4=;
 b=CBJs+gLE53dbqVFP8WduJrbufCrMMAnU5pBCFaspa2ItdEkmCXGM4v7MQws6+eD8i2pMoYLy5gCXN/BcQzDOkxReSGwuDRSNmDr7ERJYPHPcsX91w7DaT6uJaOmYXt7vA3R2GqnLqayKDY7OBHaiCat+MXdCHN59G33Q4J4b3DZ/H9m2TWH2AMDgwRuOtfUSYXIb1e7GBO/lQ5cPwRVQRTsXtPa3ueAZYhPsj/PalLdvhZ5Xz4yAp/yYCO17FJJk22tY8ZNPKIpJZGWY1BiCHBsjbuK7ynkCPm+z/m0QM8RzX7z9Lw58sKvjsjs9IKHe4MucTsBATlUoE5jDiizzUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSX30FNasTlgWg0Lv2PWe3hfU6OipIDPQf5AQ9ZTsc4=;
 b=MNJSokqCvUWgme8J0RE233IMpInudzwHpUGN9RqR9rHQ14L0XvZjfEOS5IQsGKC071d57Lb80UMK9u5hLQCgF/MXsCA/S6V1O6NcpGO6BpxZLtlc7Bwwkm6A4/Io0x3hUFD3noXi1mxEMGCRZg36jbtl02KxIRpbqY1U6g4KGSo=
Received: from PH0PR18MB4474.namprd18.prod.outlook.com (2603:10b6:510:ea::22)
 by MW5PR18MB5043.namprd18.prod.outlook.com (2603:10b6:303:1ce::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 10:21:21 +0000
Received: from PH0PR18MB4474.namprd18.prod.outlook.com
 ([fe80::eeed:4f:2561:f916]) by PH0PR18MB4474.namprd18.prod.outlook.com
 ([fe80::eeed:4f:2561:f916%5]) with mapi id 15.20.7452.049; Mon, 13 May 2024
 10:21:21 +0000
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
	<rmk+kernel@armlinux.org.uk>,
        Maxime Chevallier
	<maxime.chevallier@bootlin.com>
Subject: [PATCH net-next v7 4/7] net: stmmac: introduce pcs_init/pcs_exit
 stmmac operations
Thread-Topic: [PATCH net-next v7 4/7] net: stmmac: introduce pcs_init/pcs_exit
 stmmac operations
Thread-Index: AQHapR9M2cl0MlcglkmuPXZDhMyxrQ==
Date: Mon, 13 May 2024 10:21:21 +0000
Message-ID: 
 <PH0PR18MB4474CF9D605C4F1EAF5978A0DEE22@PH0PR18MB4474.namprd18.prod.outlook.com>
References: <20240513-rzn1-gmac1-v7-0-6acf58b5440d@bootlin.com>
 <20240513-rzn1-gmac1-v7-4-6acf58b5440d@bootlin.com>
In-Reply-To: <20240513-rzn1-gmac1-v7-4-6acf58b5440d@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR18MB4474:EE_|MW5PR18MB5043:EE_
x-ms-office365-filtering-correlation-id: cfb7c1a0-1838-46a5-3b27-08dc73366f7d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230031|1800799015|366007|376005|7416005|921011|38070700009;
x-microsoft-antispam-message-info: 
 =?utf-8?B?cVRGUUpqWklLVEppVDVOS2hLYzRZMU5iKy9VZW96QmY3djRPTlBidTVWZ0tM?=
 =?utf-8?B?cnVidmFXZ2h6Wnk1WGtwMkVBcDJqRWNOY254R2NYRENMaE5tQkJoVDBraHl2?=
 =?utf-8?B?UGs3Y3NnNUpFazkybUxLRXNMVmZrOG5VWUYrV1FObHlRNHdOcGNpaUtROEI1?=
 =?utf-8?B?ZEt4b0puQ2I0c05CSFRGQXYyR05ENnhURzNwV1NocmNvVWJ1Sjh2emRaa3M4?=
 =?utf-8?B?SlRrc01XSWRFRWNySGxiMGo2UDE2ei9aem8vTkJmd0VGTHNnMzFHOU9jcVFB?=
 =?utf-8?B?d3ZwM010dnRoT21qU3JuZGMyVjdHdUtiUXdjV3llVkxsektrbUEwWEx1QXl5?=
 =?utf-8?B?UVdENS95NUNxaWNEcDIreHFZRTk3MXhvajI1VHpzS1BYcFE0YTd5TC9Samp5?=
 =?utf-8?B?aVFMUUVZY1dxZ0xFZTZSY1NGTVBQRUJFQjEvNlFXRGFSbVNrZ3hocElYK0dD?=
 =?utf-8?B?R045N3lDTkRHemQ2RVFCUFovMWhZY1JZL2FWVjJjbXd0c3FqcERmdDhjVklH?=
 =?utf-8?B?TDMxbE5HUSt3dHQyaFo1T3M4Y1JoK1ZTVHh0MzJyM3ByUXE0d0RKZXAvZmN3?=
 =?utf-8?B?bkp0bDNqY29MR2pJUlZaczJJSFBQRVdCQ0dvbWpOUVduSjNQZjdnUWVxdGNP?=
 =?utf-8?B?akF0SUE4OHk1RllpaUdXejdXd0hzRWFwRncxQVRwRHQxaUdSN2p4NE00TWFD?=
 =?utf-8?B?bjN3UlZyNW9hWXZEVm45R2xMcnorZ21YbVd4NytiaWc4bmdWaFB2K0VQcm5r?=
 =?utf-8?B?U0M2cHFpS2UvUmUxeHVsWU5wNnR4YjhqcXRyZEpLOVFIaTJkcVcwN08zU3Fn?=
 =?utf-8?B?VDA2cGRZZlBJTGU1R1hzd3lsQ21iZEwxdU82SjJSaHRuSWMweG1IdjMvbUxK?=
 =?utf-8?B?V0xyZVlKNlJKSzY5NE1GTDd4cGxHcjNSUHNvd2tQeUZqd1ZxZE9tVVRvNTFH?=
 =?utf-8?B?ZVpKSXdJcFlmVW1JQmNndG0rT0tLbWJrL3RiR3RDUitjb0EvbDEzSWNNSVhz?=
 =?utf-8?B?NWFsdEtlaWZrK3V5dHA1ZHAraEpTNjROa050MEUvT2k2cVpPR09JM2RBbXhu?=
 =?utf-8?B?bUsybU81dTBTQU5OK3VzSmJScDBEYzAwQnlDSDNzVzBzdUtoa1JERUdFb1Vk?=
 =?utf-8?B?R2dSc0k3K09Rd3EzTHJaWnJtKzJDeERFQmo1NWYwcUFKS2cxanU0Z0J1NTND?=
 =?utf-8?B?dm43dmpoOVhZRjJuNzNqTHZtQWFGcm0zKysrckF4alhKRCs4NGRRTUlEQkxU?=
 =?utf-8?B?aXpJcmwvMG84aTByTVhVRHBPbGp0Tk9ob0RIVTNncXJJSDZEZjdsMUFjb3dz?=
 =?utf-8?B?V2VPK0N2R3FJQmhiWVh5bVc3N3R6UmlEK3d1YWRHWmxRZGxGemRlMzRpQXdZ?=
 =?utf-8?B?WXE3YTZjQTZaaHc5OUY1U1EwdnZDTG5PalM0VkVjWG9LWlF2eTZJN0x2UFdQ?=
 =?utf-8?B?ZzJBTGxGOXFCaDMzQUo1Ump4TVlWazViMTcwcGdZbjREYjg0NWNEWDZOVlNI?=
 =?utf-8?B?ZmpqR0NiMjN4RGYxa2lFRWVqUloySDFYOVhLQVByeXVVMDdjOGxYazA0alVO?=
 =?utf-8?B?UGIxWHNiQlRIMm5BclpQa25MS2tGTUJOMjdaTEZxSU1Bcml1UkhqUEQwbjJR?=
 =?utf-8?B?YTk1b2pwVTZ1clpvSUE5aVZpY3ZLek4vOEM5dE1sdEYwTDVFc1o3NWgrVGJq?=
 =?utf-8?B?KzlzYjNQRlNWVS90WVNtUDRxbXNLNU83R05FYS9DMElUMUdhemZoWXFMc1NF?=
 =?utf-8?B?VVU5MXAxVjc0eG5FbWVQdnlzNFRrSUs3WWI1OFFZVWZlWDhsQmFkcWxsckdO?=
 =?utf-8?Q?Gp1HnlgfPoDfOLWnEqcu3HHHjYhpQMX+6m1QE=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB4474.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(7416005)(921011)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?d2N6UFg4TkpDaHNMUkwvM1lVbjFQdW01QXc4c3gzRGIyUitpaldyZm1CVDZ6?=
 =?utf-8?B?ajZTZnAxaEJaRnZxQTJ5UkxJKzRILzFNRGNidkRRU0VjdXlMai81Qk54azVE?=
 =?utf-8?B?cElNVGdKeWIvbVhEVW5zeVEwc1I3L1Z1RHkveGE0ZWlSQkZKTWFHWXZaTTJi?=
 =?utf-8?B?MjlXOW5uWGhTUWlHaHVTR29FaGJyck9uTG5uLy9NK0JqSVlCa3RaRnlZRDl6?=
 =?utf-8?B?bTNndFJBWmRhUnU0YjhpY241eFRuaFUwV2lxa1NhMXJzbXlObUsvQTZVSmRN?=
 =?utf-8?B?aUdTa3hHZndid3QrVjIvSGl6V3c1L0FNZFFMcCtYWFB4YVJWZUlHTmJCSnFi?=
 =?utf-8?B?R09wZkR2UjNsOVBUdXpxZk1pemRMZTdGMXFIWUg1ckJUSENWNER2OTlaVDVD?=
 =?utf-8?B?dlgwcDhFaXQ4bUdZWmNZWXFIOWEzLzVVV1lqdnFQeHNHTFlJTVlDMDd3eVY4?=
 =?utf-8?B?eGVDbnRkRGVaR2REaUtrSzYva2NwVzBwRFFkVi9MVnplcEN0NnhhMWFwbWlZ?=
 =?utf-8?B?eUp5ZVAwcFRCOFdNNXpTRENkUWk1ZGN1R0QvTHQ2SHpWRzY4M2tqQmwyZURP?=
 =?utf-8?B?bGlLNVBiNHR0UlNnVmE1NGJVUENMaTVnbVRVOW5YdFRWcXFKSEd1ZWROejZL?=
 =?utf-8?B?dGdOZmFEQlcrT3BVbmJtL2YvVlA2VTdWcEpDWUlCckRweTY0U282ZVFwMThs?=
 =?utf-8?B?QWh6aUp3RklVajBuRmg3aU5MamxPNkZ3dGFYYnNQUFRpNmdsdm9XUmJIV1Nk?=
 =?utf-8?B?Yys2ajFXMk1zTlRxTFdtVE5GMmROSlgrY3kvYlk4RjVwWjlvd2lYRnFmOU5r?=
 =?utf-8?B?NEh3T2dGOUo3YStuczZKaFFDdDIvbDVPQnYzUEVXSGFLNXJXdHBENXhRNUJF?=
 =?utf-8?B?YjkrVnV0cTQ5a0RNRzV2ZVBadmNCa2F0eUtFMG1lTXM1LzZJbk0xTGdIdGdC?=
 =?utf-8?B?UVEzYTZSK2xkYTFFL0U2VWxSYVJPeVZ5Tk5pS2wyajZ4WnJkakxiWDFwVGx0?=
 =?utf-8?B?WXpiSFRvdjdPbUtZVUFMelhKUURkdUV2SHYzOW1CbG13dnNkWG5oWTRNcUps?=
 =?utf-8?B?NWJtRWI2SUxwZzJYUGdpRGtxaUtCRlZ2UkpLMldDcUR2VmJwa3g2VnBJYXF5?=
 =?utf-8?B?L0RFejhBamdrdGNLYitmL2hHREVIUEtnWUwrOTBoTjdEd1Z1TzJLTkliVzNJ?=
 =?utf-8?B?b0VoOVRNWXlGa05OUEY0dUJBOGo5dHpZUTMxSGZXYWVYQ2RiSHJ6cXY5ZHVm?=
 =?utf-8?B?MiszTitFYXFISmR2OTBTaUtyUjlEbERYeHoxbmF6a2dUSXlXYXppWllrZXg3?=
 =?utf-8?B?bU4zOWZCNlhhWGhTbDYyN1hRWUlWMjJMK093OHYrM0tieUlHK3ArMlphMmhz?=
 =?utf-8?B?MFFEcHNzWFVvc1hwcVdUSE1PQUljMWRHY1hnbTV1TkJkbmhJbHFDV3JONjcw?=
 =?utf-8?B?WEp0b083VkxrdnRENmJFVU8yYzZtemFEYlNwdXZaMUZpQ0dpbnY5cTBiVnRU?=
 =?utf-8?B?ZnU2K3E2U1d6RlkwUXYrR3VGVDM4OENjZzhpaWp4SkdIZHQza0ZVMytxNkg3?=
 =?utf-8?B?dVVLNmh1UitzMVVFTCtyUkZhamRVUFR6bVJKR01MRzRMZnh5cnlCQk9IWldq?=
 =?utf-8?B?Z0ZaZGpnS09hR2JtN1NsQWkwUktJalVEMDlWTVJXb3J0YmtFV3ZzajdqN1A1?=
 =?utf-8?B?ajlPdzBDUHJ4VWh6bjg3TzVSVXVDNzAyZE56UnpVdGlnalE1MDFjZ0NVUVZj?=
 =?utf-8?B?RHo1V0JqenBta3RJQ0ZRakN0NUJiNnRUS3FuR1d4L092WkhSVWF4dTJla3JX?=
 =?utf-8?B?dUhGb3FVVDBkS0E2SlM4VHNMbXZ0Y1NWL2MycjFsS3F3SGFZNE42cmJ1N0R2?=
 =?utf-8?B?R0hKN1hFRzFaL3hIU25iYUlHQUMyck03ZkNWQkEraWl3bUdNa2F5bGZBZWwy?=
 =?utf-8?B?MXJxaHVqVVRjYThiZ3NoR3VIY1liNXhxS1k3OFpYK0hVcFJyMzN2b2U5ellR?=
 =?utf-8?B?TFpzejB0ek1mWTl2a0xKdVI1QkhoVjJaQkFSZnQ1TEZjZGxZS2EzR244bEw4?=
 =?utf-8?B?eURTREFQYStNbGkvQTUxdmNQNGlHYXZwTjlvSUJkaWNJODJ3dmxYQlNySzA3?=
 =?utf-8?Q?vG6s=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb7c1a0-1838-46a5-3b27-08dc73366f7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2024 10:21:21.5332
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xZtV4d0BGpUYKT1YpYNQ/AMOxD2gTLSPDQLFfMX1BN35DxOK0muwSDp0ujdyRqa+jWLbS+AvSHU/DtA2xM7JMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR18MB5043
X-Proofpoint-GUID: o66hQPHCVkQq6q6oe9lQktqLvjJOGjy9
X-Proofpoint-ORIG-GUID: o66hQPHCVkQq6q6oe9lQktqLvjJOGjy9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_06,2024-05-10_02,2023-05-22_02

DQoNCj4gRnJvbTogIlJ1c3NlbGwgS2luZyAoT3JhY2xlKSIgPHJtaytrZXJuZWxAYXJtbGludXgu
b3JnLnVrPg0KPiANCj4gSW50cm9kdWNlIGEgbWVjaGFuaXNtIHdoZXJlYnkgcGxhdGZvcm1zIGNh
biBjcmVhdGUgdGhlaXIgUENTIGluc3RhbmNlcw0KPiBwcmlvciB0byB0aGUgbmV0d29yayBkZXZp
Y2UgYmVpbmcgcHVibGlzaGVkIHRvIHVzZXJzcGFjZSwgYnV0IGFmdGVyIHNvbWUgb2YNCj4gdGhl
IGNvcmUgc3RtbWFjIGluaXRpYWxpc2F0aW9uIGhhcyBiZWVuIGNvbXBsZXRlZC4gVGhpcyBtZWFu
cyB0aGF0IHRoZSBkYXRhDQo+IHN0cnVjdHVyZXMgdGhhdCBwbGF0Zm9ybXMgbmVlZCB3aWxsIGJl
IGF2YWlsYWJsZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJ1c3NlbGwgS2luZyAoT3JhY2xlKSA8
cm1rK2tlcm5lbEBhcm1saW51eC5vcmcudWs+DQo+IFJldmlld2VkLWJ5OiBNYXhpbWUgQ2hldmFs
bGllciA8bWF4aW1lLmNoZXZhbGxpZXJAYm9vdGxpbi5jb20+DQo+IFJldmlld2VkLWJ5OiBTZXJn
ZSBTZW1pbiA8ZmFuY2VyLmxhbmNlckBnbWFpbC5jb20+DQo+IENvLWRldmVsb3BlZC1ieTogUm9t
YWluIEdhbnRvaXMgPHJvbWFpbi5nYW50b2lzQGJvb3RsaW4uY29tPg0KPiBTaWduZWQtb2ZmLWJ5
OiBSb21haW4gR2FudG9pcyA8cm9tYWluLmdhbnRvaXNAYm9vdGxpbi5jb20+DQo+IC0tLQ0KPiAg
ZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21kaW8uYyB8IDggKysr
KysrKy0NCj4gIGluY2x1ZGUvbGludXgvc3RtbWFjLmggICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAyICsrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3Rt
bWFjL3N0bW1hY19tZGlvLmMNCj4gYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1h
Yy9zdG1tYWNfbWRpby5jDQo+IGluZGV4IDU0NzA4NDQwZTI3YjguLmFhNDMxMTcxMzRkMzggMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19t
ZGlvLmMNCj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFj
X21kaW8uYw0KPiBAQCAtNTA1LDcgKzUwNSwxMCBAQCBpbnQgc3RtbWFjX3Bjc19zZXR1cChzdHJ1
Y3QgbmV0X2RldmljZSAqbmRldikNCj4gIAlwcml2ID0gbmV0ZGV2X3ByaXYobmRldik7DQo+ICAJ
bW9kZSA9IHByaXYtPnBsYXQtPnBoeV9pbnRlcmZhY2U7DQo+IA0KPiAtCWlmIChwcml2LT5wbGF0
LT5tZGlvX2J1c19kYXRhICYmIHByaXYtPnBsYXQtPm1kaW9fYnVzX2RhdGEtDQo+ID5oYXNfeHBj
cykgew0KPiArCWlmIChwcml2LT5wbGF0LT5wY3NfaW5pdCkgew0KPiArCQlyZXQgPSBwcml2LT5w
bGF0LT5wY3NfaW5pdChwcml2KTsNCj4gKwl9IGVsc2UgaWYgKHByaXYtPnBsYXQtPm1kaW9fYnVz
X2RhdGEgJiYNCj4gKwkJICAgcHJpdi0+cGxhdC0+bWRpb19idXNfZGF0YS0+aGFzX3hwY3MpIHsN
Cj4gIAkJLyogVHJ5IHRvIHByb2JlIHRoZSBYUENTIGJ5IHNjYW5uaW5nIGFsbCBhZGRyZXNzZXMg
Ki8NCj4gIAkJZm9yIChhZGRyID0gMDsgYWRkciA8IFBIWV9NQVhfQUREUjsgYWRkcisrKSB7DQo+
ICAJCQl4cGNzID0geHBjc19jcmVhdGVfbWRpb2Rldihwcml2LT5taWksIGFkZHIsIG1vZGUpOw0K
PiBAQCAtNTMzLDYgKzUzNiw5IEBAIHZvaWQgc3RtbWFjX3Bjc19jbGVhbihzdHJ1Y3QgbmV0X2Rl
dmljZSAqbmRldikgIHsNCj4gIAlzdHJ1Y3Qgc3RtbWFjX3ByaXYgKnByaXYgPSBuZXRkZXZfcHJp
dihuZGV2KTsNCj4gDQo+ICsJaWYgKHByaXYtPnBsYXQtPnBjc19leGl0KQ0KPiArCQlwcml2LT5w
bGF0LT5wY3NfZXhpdChwcml2KTsNCj4gKw0KPiAgCWlmICghcHJpdi0+aHctPnhwY3MpDQo+ICAJ
CXJldHVybjsNCj4gDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3N0bW1hYy5oIGIvaW5j
bHVkZS9saW51eC9zdG1tYWMuaCBpbmRleA0KPiBkZmExODI4Y2Q3NTZhLi40YTI0YTI0NmM2MTdk
IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3N0bW1hYy5oDQo+ICsrKyBiL2luY2x1ZGUv
bGludXgvc3RtbWFjLmgNCj4gQEAgLTI4NSw2ICsyODUsOCBAQCBzdHJ1Y3QgcGxhdF9zdG1tYWNl
bmV0X2RhdGEgew0KPiAgCWludCAoKmNyb3NzdHN0YW1wKShrdGltZV90ICpkZXZpY2UsIHN0cnVj
dCBzeXN0ZW1fY291bnRlcnZhbF90DQo+ICpzeXN0ZW0sDQo+ICAJCQkgICB2b2lkICpjdHgpOw0K
PiAgCXZvaWQgKCpkdW1wX2RlYnVnX3JlZ3MpKHZvaWQgKnByaXYpOw0KPiArCWludCAoKnBjc19p
bml0KShzdHJ1Y3Qgc3RtbWFjX3ByaXYgKnByaXYpOw0KPiArCXZvaWQgKCpwY3NfZXhpdCkoc3Ry
dWN0IHN0bW1hY19wcml2ICpwcml2KTsNCj4gIAl2b2lkICpic3BfcHJpdjsNCj4gIAlzdHJ1Y3Qg
Y2xrICpzdG1tYWNfY2xrOw0KPiAgCXN0cnVjdCBjbGsgKnBjbGs7DQo+IA0KPiAtLQ0KPiAyLjQ0
LjANCj4gDQpSZXZpZXdlZC1ieTogSGFyaXByYXNhZCBLZWxhbSA8aGtlbGFtQG1hcnZlbGwuY29t
Pg0KDQo=

