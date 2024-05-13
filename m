Return-Path: <linux-renesas-soc+bounces-5337-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 541EF8C3EA6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2024 12:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 097D5283000
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2024 10:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8224F149E08;
	Mon, 13 May 2024 10:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="Usr/0oZ2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF3014882C;
	Mon, 13 May 2024 10:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.148.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715595091; cv=fail; b=ejUNxjIz2l1FF2PoTWPpU93St+V0FrBCZ3Yrs/yzRp+74wFZgS5l973UhWpIWQJntnkcx49laxvx2EL1RtvC7fk4j6/juGBpF3LgVwGJm7BwgTHe1dJxkgxVrgOg/Ip/FJ0kYM8xb0Z0/IHSB/F/NbH2+OjBaEIhsBBcNIs9Jd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715595091; c=relaxed/simple;
	bh=/lwU3Q9TNX95ME7Wjmu7rWW70kWrhPt2/7/4h+mJt3s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Y9z2iCSsZ6ff4RWWECLHTRztGFzmeUfHi9kciRknryokZZKSHRT9ZjQDZrF2U5kfN5BeJRnZhnQsBfSuN+YRsKDOkrLZrqG5PIEVBeImsfqfHAHg9ERU46pHwo4DnfFEvCWtLUAjC4Jmue2dAT1oikfeoLvxHgCdMygC5DAntK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=Usr/0oZ2; arc=fail smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44D9g5qK015038;
	Mon, 13 May 2024 03:10:50 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3y3gf4g29f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 03:10:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FuKfjVdW6fGXzt+AGnYAdxfrUFyFLZLVVdeJexJzNUS1NljtnPsGe6yrjWsRn7a/LGiQOzVOBi8NdWjpdWFCdilduMVmLcHMCYFnS/MdQws2iTr6bB2oLPl+GI0rJnv8sMk/H6yWCxKPz7mLQPRu/laxEeRL+n8eJsAy2L/Zuq03Xz6m/3SUnwxhw4s4hHCnBtXfRPsRnXAha6pu7Ok3wE4X3s/kc0paGyHM9TghUhIyJYwToz2atXhRX8b+41hZY52V0wnuS8CFLg+Zh+34Rmo8Q/sT7C6WQHChpsSbZ6AvKNJ2sw3NYskQES7ansWLSw+oRd9sZTzOcOF7QSEryw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/lwU3Q9TNX95ME7Wjmu7rWW70kWrhPt2/7/4h+mJt3s=;
 b=jqGM6m3eaLVoQ6Oj4FnMWGsgwzW78eJb04Dl0b63P2Q5Cmj3c+BhttxK7ZyLPWKHmfcAEDaeQf8DvAVbwqSFpBvM9rH9XmL726SJaStX1BWORudy9Hn3FeXkKia0N6WkdAa2BY4b4GUogIWD/JblcSkzIJK89vRRuJ4KIvOJCrJL9rkww9LYMvHznnk9Hq6k7n5+YTDVKJG9HD/93+pwxv2HAjUX/9eLbIRw5MvYa6p6ZeHx43PPz39+xLwwN3TWM1SGZDUAIZfpVcePnKZoMEpYV51vmqhgOTTuLuQDyu+Cl375IGN29vAPvo90PqdUXvt+B8wDR/em/HdyxJvMpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lwU3Q9TNX95ME7Wjmu7rWW70kWrhPt2/7/4h+mJt3s=;
 b=Usr/0oZ2I1n38jyzrrk+BQ/3CX7EXOFjOukcitERXLr5qBj2xKmLLCVEC1E3qWZZW9FIilrMiWu6LgSm5CahrfOdZOOVRIwFd1S5qyKkUBIROuJH8M50ZnlJAsgmXPUguUhX7LHXyiakYMJfLcCOB+/2BpRXu2tmk8hoFCMhoQY=
Received: from PH0PR18MB4474.namprd18.prod.outlook.com (2603:10b6:510:ea::22)
 by LV3PR18MB6219.namprd18.prod.outlook.com (2603:10b6:408:272::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 10:10:47 +0000
Received: from PH0PR18MB4474.namprd18.prod.outlook.com
 ([fe80::eeed:4f:2561:f916]) by PH0PR18MB4474.namprd18.prod.outlook.com
 ([fe80::eeed:4f:2561:f916%5]) with mapi id 15.20.7452.049; Mon, 13 May 2024
 10:10:47 +0000
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
Subject: [PATCH net-next v7 5/7] net: stmmac: dwmac-socfpga: use
 pcs_init/pcs_exit
Thread-Topic: [PATCH net-next v7 5/7] net: stmmac: dwmac-socfpga: use
 pcs_init/pcs_exit
Thread-Index: AQHapR3SDYCXOY+HUkuDYtV14kKYeA==
Date: Mon, 13 May 2024 10:10:47 +0000
Message-ID: 
 <PH0PR18MB44748E7BC1D2C669E3CE0D1BDEE22@PH0PR18MB4474.namprd18.prod.outlook.com>
References: <20240513-rzn1-gmac1-v7-0-6acf58b5440d@bootlin.com>
 <20240513-rzn1-gmac1-v7-5-6acf58b5440d@bootlin.com>
In-Reply-To: <20240513-rzn1-gmac1-v7-5-6acf58b5440d@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR18MB4474:EE_|LV3PR18MB6219:EE_
x-ms-office365-filtering-correlation-id: 5ebad349-b2c0-47b4-65b6-08dc7334f570
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230031|376005|366007|7416005|1800799015|38070700009|921011;
x-microsoft-antispam-message-info: 
 =?utf-8?B?ZUQrWkJSRXBQMThXUE9tZ0NsZHR6d2MvdXBZNTcxdVNPdUtMZ0FRdW51bjds?=
 =?utf-8?B?T0hJdUNvYjVQazl0SDM4ajdncXFIUVVDK0FDVlhwNlcwdGVQSHM5VHZQL0hi?=
 =?utf-8?B?TVpnam9FZXdCS2xCNEt2d0J4c056RDBURFo3NG5TelNrNFhrMUF6cXdvbnIv?=
 =?utf-8?B?cHNGekRjcDVmOG44V1ljK1AyRUxjNFA5Y2JNTUhRRnc0TEZIT1JEUXZlcWZZ?=
 =?utf-8?B?VUd5MVVnT0lMRjM0ODZJNUNybWpPQkQ3WWZiMFJkL1p0Z0Fzb3Zzdno3NDNX?=
 =?utf-8?B?SFlCL2FjRmtENm42NUdncmdjVXd1cUUzanlRMGlUQUFhcjVabG5aRFdVZHdB?=
 =?utf-8?B?NTBrVEYvNVBscit1R2xvYUY5MnlhKzR5R3ZqaEtqTjJKTTg4dEtOZ0ZVaitw?=
 =?utf-8?B?M2lhQktsUFg2Z3Bmejd3aGxpc0NqczhTZ280VHZtSnhvZm9lWFprSHJPOWhy?=
 =?utf-8?B?TUxHZ3pMcUwxRXRVMkVyKytMTEtydWFEb2UyRkF5TEhvbExIcysrdUNieVYv?=
 =?utf-8?B?NWw2YlZhSVZiankwWnMyRC9FK1dGU2VqMlVJZWVmNUVWRWZIRUwxUXd2Wm5F?=
 =?utf-8?B?NEprSDQwZDNoKytiN045VGlWeFNvQVFjVTY0SW80UlVYQzNqb3oyQkNHVFFL?=
 =?utf-8?B?NGFSNWFsM1QybDZacVprelIxQ2tLbUF0RUxONnNQWjMyMG1sQnhmT1NjL1ZG?=
 =?utf-8?B?QUtiTkZyY0NtSWdWR0FRL0tqNlhyeDZYNXdKbWZCajJ1ZHE5U2h0dWhjMmNz?=
 =?utf-8?B?SkFFZ0tlaXd1TzdqU05ZUFM5V2o3RVhpTUNxaW9PYktiYys0YzArbjNIYlRR?=
 =?utf-8?B?SVZyRE9RcUNjVXIzeFkyLy9TUVhRVzVCVnloazdsNVc0VnlZYi8wcVB2WHBp?=
 =?utf-8?B?dWppaUN0R0RQTU9GM2t3QVQzMWcyNDZEZXBYUmtldy90cGZ1d2Y0Y0NTRVFT?=
 =?utf-8?B?R2JHRHVLc2VKaW1wUkpKdXlXQ0xSbUlZTmZ3RkdpcXdzTXY4VDFhSjVtOHVj?=
 =?utf-8?B?OE5jaXg2ZGtRczdmcnB5ZkJnbHZpM2dkc2p1RmVIUnppVk9ySkw1Z2theTJs?=
 =?utf-8?B?SndsSlQ2d01LTXViZUVsZFRUaDRaRmFnclh6MmNmU3ZiQ1lRZ1VsSThNQkQr?=
 =?utf-8?B?aFNyZW11TlFDdjFqOHB0bGdLRDNVMnQ4UnFYaTBnKzJHVkpaTHMveVpZT292?=
 =?utf-8?B?Y0dMeVhXZFYrNmZSWHhtaDZJREhQaEswbm9MbzNuT25jMkF0ajBPM2p6VHkx?=
 =?utf-8?B?eTM4ZWphVVY2RUd1TS83SHc4UEZwWTRTQ2NTc1N1NWIrU0laSkZsQmxGemRE?=
 =?utf-8?B?RnIzNWRta0QyMVQvb2oxdVVVb3Z0R25Fc2hycEVtekxRQS9SQS9PSDlGS1oz?=
 =?utf-8?B?TWxMMzEzcHlRWFZ1NGFERnRDQTBvUjJ4SGs5d2RHR0d4RG44MGRGMVhBNnJj?=
 =?utf-8?B?a2JFV2RPb3hBc1pnbGN3M0pQazZtYzBCdXFDRXJSRVRBWVA5TFk0QThSTDNE?=
 =?utf-8?B?VHNCUHUzUmk4QTBxeTE4dVBJbjhKNnNYVU1iR1RQbzRmanBQZkVpTDNURmVa?=
 =?utf-8?B?dm5IUStMbnZTNHRMS0tRdUFYdVJxZ25OL2Z4SXRQK04yeENIMW1JTThYRzVN?=
 =?utf-8?B?dEoxM3h3WVZCN1Rtd2VCekR4UjAxbWNVWG1heUVveDBUdWNqQlpDUGJJUFVO?=
 =?utf-8?B?T29UenNwc2J4bFpHZ0xDVnZUV1dNYytFd0ltU0JXUWpwZmQ4NjhrVTY0Ykhj?=
 =?utf-8?B?NUJUMk85SXBUZVBtdGJtZFg4MEdDVEx3eE9Vc1hpTmxlMWdUeEVoem9tQUhR?=
 =?utf-8?Q?VafORoylx0MXYJ8MyJ0ozM5mvwvLc91ZuxLtc=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB4474.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(7416005)(1800799015)(38070700009)(921011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?U1V3WmVaQkZXb1hVWFNHbXRWYnRGdG1ZRGNFV3F0b09QQUV5MUQyVDVWSVJj?=
 =?utf-8?B?SC82dkxBY1pBUmJNTGJ4RGxhbXZvL0pDRmsyRXNmbjFjUmxvQ0tIOVFQcXps?=
 =?utf-8?B?QXdjeUZya3E1SXRHay8rdGE4VTZaV21lL2dhMkxjS0x4c2RXLzYwenVYK2VT?=
 =?utf-8?B?bVNINy9yY0pvVmU2VjBDVEZ3bkxMbldUZ3VKZHM4YnJtelNtQmdaWkpkVVRS?=
 =?utf-8?B?OEtoelFLbnV3Zm40MXZiRmJhVGR5KzhkeWVXTkNiV3NZQytGY1BGcGJkOW8r?=
 =?utf-8?B?ZisyQ0hTYlk3Yi9ocmphdUw0TC9KSXVZOGJOUUtBQk9rUnNMYmM2NzlmYkE4?=
 =?utf-8?B?MVlMTjIxckJ2aFRjQVUxMHVKK28zRU01cEVZSElIc2I0YlB6UXY3SWwwM0R0?=
 =?utf-8?B?c2hqNVI5VzN5RTVuRE9SR2RhWHZ3NTNKb3RueGlMaWpqUHlDa1piMTQ4UkhI?=
 =?utf-8?B?TnBNbDd2bndNVndWS3JieXRHWnZJWmZjdW5FNDV3eFZvQnRvMXBZcUVSajcy?=
 =?utf-8?B?NnJELzVFc3FNVTlDVmRLMzF6dzF5SVI5ZklMcWJiSGN3NlNUdzlOWXFqR0pH?=
 =?utf-8?B?MTJTNTVaeVlnbDdrenMyd09sbkdmVWtFU3BQbllERVgrWHFqQXFqa2R4L1B3?=
 =?utf-8?B?ZUFiYmMxd214cGJ1bWdlTHRtcVJSdSt1RUxKTjZCVFlOV21GSlNTWDNqVU9n?=
 =?utf-8?B?ZEgxcUk2VnNYQ01BM2tkWDlJNnpoWDFNY2hZNnpvSEpGeDhHVzdqUkZzamNH?=
 =?utf-8?B?dVBEZytOdEtodFZSUlk3dmExUDFmeE96UE9CUE5OVWhpWjRoMS85blY4aVpz?=
 =?utf-8?B?bFlyVlYyc043Nm85Tjc2L2tGeThNUlF6THpvOTh2anJYUUJNOGVibGRneGlz?=
 =?utf-8?B?QXFrRzVuaXRoZ2x0dndhclMzVEFLYXJhTldXMnIwZ2ZwM1BQM0MwbmUrUDk3?=
 =?utf-8?B?aGk3K1RJZGlGaDBkSDkwZ01QR0tnSWcrT2wwV2pXMG9udTVUZ2QxcUphKzdq?=
 =?utf-8?B?NFdWVS9hd0ZoNDJUNnB0ZHdjc2hGM3hXUE1sZ1J3UzBJdVdIeEU1WU1hM1lh?=
 =?utf-8?B?bWtDa2UwL1JtWUlWdWFib1NldnIxTzVTWnZWdi9vdmpvRTNxMHV4cXFsVVlt?=
 =?utf-8?B?Ymx6d1pqOHkwdlljeDlVZytUWTVwVmM5TDhxY2ZZbHZYcjZLTGE4aWNmRXNY?=
 =?utf-8?B?YUJlY05Jc1o1Q3gvdGFzT3FxTTZDRnNiR0tjcVFoUCt2Q3gxL1gzR1NackNy?=
 =?utf-8?B?NEtkNlBRelcvZUI4UWlGTVo0ZWZZeWVMbDlwN3cxbldpUVRiK3o0ajkxRWZK?=
 =?utf-8?B?dUJVYmJvUVBmMzk5SVk2MlV5QStyQzlmMlIzRlAreklhWXRHV3Z2MnhsdDRS?=
 =?utf-8?B?Uit4NmpPUGVRY1BYdEtyS00zUklobG81bzVENVZndUZmdS9McS9vbEFUcGg1?=
 =?utf-8?B?VzNqNHg4Q0owOUF0cHlqbytlNFBTdDhNeE1LaEVLcXV2TlVGcUlrbGhIeFdn?=
 =?utf-8?B?d3o1eFJKT0FEbEhGUTRjQlFwMlV1MVV4NDlibDdCM2p3dUNkNWRzUk9SMlNu?=
 =?utf-8?B?dG5HR2RHT3R0UjJCVHJjYjVLbXRLRkhEUlVnSWZtTGdwcDlLUDR4T3NybXVW?=
 =?utf-8?B?RTN0c0YzVjRLZVhrRmt5RUVRb08xblhoblJUTXZEa3hhWU1EVXZLTmRyY1B4?=
 =?utf-8?B?aFZyZUtYOXRVV0pjcVJERnYveW8wUWZIL0Z2NWtwWlhnTm5IMGhaanp0L0lW?=
 =?utf-8?B?S0I2RFVTUGs3aEkvMmdBV3pkUHJnaFpJRis2cXJpcW4yNWpuVG5VNjhzSkZD?=
 =?utf-8?B?MHBZUGNRWHhSK1l0WWZ1dHZreUJzbXdwdEdBWENFeHJhN3psOUJrc04wUTNJ?=
 =?utf-8?B?Nkh1VzYvNnhKWDlyOCswUkJWREM3TG9YLzlnZitMSjRHTzNZSE5Kais1M3dC?=
 =?utf-8?B?ZW8wakRCYzRkUk5tZGJncDA4TjlxYXVhTmJ3TTgwNzkyYndBZHRXYVRsNmRP?=
 =?utf-8?B?M0tnOEFLSWRQZkV5SnczbTlDUmtPbWs0Y09jbGF1RUsxSnE3aERSNXNSYWZN?=
 =?utf-8?B?bDBLSHBJK2g3VlVFMDUrUVFaSHBZZDFGNDFWM0lMbVp5N1NYMEs5YmZ0WXRY?=
 =?utf-8?Q?DRB8=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ebad349-b2c0-47b4-65b6-08dc7334f570
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2024 10:10:47.2476
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: scFI2i0TmzoA9rYFbfKG+GT3FI+9Etvd+Xjessx6l3UhLBAyHCRE3i/PKuo+m6mB69bIJHgElsFOPb1PdttFQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR18MB6219
X-Proofpoint-ORIG-GUID: 46xreV2P9pxYnAgE1bdDjuJ9lLOa8BWi
X-Proofpoint-GUID: 46xreV2P9pxYnAgE1bdDjuJ9lLOa8BWi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_06,2024-05-10_02,2023-05-22_02

DQoNCj4gRnJvbTogIlJ1c3NlbGwgS2luZyAoT3JhY2xlKSIgPHJtaytrZXJuZWxAYXJtbGludXgu
b3JnLnVrPg0KPiANCj4gVXNlIHRoZSBuZXdseSBpbnRyb2R1Y2VkIHBjc19pbml0KCkgYW5kIHBj
c19leGl0KCkgb3BlcmF0aW9ucyB0byBjcmVhdGUgYW5kDQo+IGRlc3Ryb3kgdGhlIFBDUyBpbnN0
YW5jZSBhdCBhIG1vcmUgYXBwcm9wcmlhdGUgbW9tZW50IGR1cmluZyB0aGUgZHJpdmVyDQo+IGxp
ZmVjeWNsZSwgdGhlcmVieSBhdm9pZGluZyBwdWJsaXNoaW5nIGEgbmV0d29yayBkZXZpY2UgdG8g
dXNlcnNwYWNlIHRoYXQgaGFzDQo+IG5vdCB5ZXQgZmluaXNoZWQgaXRzIFBDUyBpbml0aWFsaXNh
dGlvbi4NCj4gDQo+IFRoZXJlIGFyZSBvdGhlciBzaW1pbGFyIGlzc3VlcyB3aXRoIHRoaXMgZHJp
dmVyIHdoaWNoIHJlbWFpbiB1bmFkZHJlc3NlZCwgYnV0DQo+IHRoZXNlIGFyZSBvdXQgb2Ygc2Nv
cGUgZm9yIHRoaXMgcGF0Y2guDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSdXNzZWxsIEtpbmcgKE9y
YWNsZSkgPHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPg0KPiBSZXZpZXdlZC1ieTogTWF4aW1l
IENoZXZhbGxpZXIgPG1heGltZS5jaGV2YWxsaWVyQGJvb3RsaW4uY29tPg0KPiBbcmdhbnRvaXM6
IHJlbW92ZWQgc2Vjb25kIHBhcmFtZXRlcnMgb2YgbmV3IGNhbGxiYWNrc10NCj4gU2lnbmVkLW9m
Zi1ieTogUm9tYWluIEdhbnRvaXMgPHJvbWFpbi5nYW50b2lzQGJvb3RsaW4uY29tPg0KPiAtLS0N
Cj4gIC4uLi9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc29jZnBnYS5jICAgIHwg
MTA3ICsrKysrKysrKystLS0tLS0tDQo+IC0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA1MyBpbnNl
cnRpb25zKCspLCA1NCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25l
dC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zb2NmcGdhLmMNCj4gYi9kcml2ZXJzL25l
dC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zb2NmcGdhLmMNCj4gaW5kZXggMTJiNGE4
MGVhM2FhMS4uYjNkNDVmOWRmYjU1NiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJu
ZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc29jZnBnYS5jDQo+ICsrKyBiL2RyaXZlcnMvbmV0L2V0
aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXNvY2ZwZ2EuYw0KPiBAQCAtMzc5LDYgKzM3OSw1
NiBAQCBzdGF0aWMgaW50IHNvY2ZwZ2FfZ2VuMTBfc2V0X3BoeV9tb2RlKHN0cnVjdA0KPiBzb2Nm
cGdhX2R3bWFjICpkd21hYykNCj4gIAlyZXR1cm4gMDsNCj4gIH0NCj4gDQo+ICtzdGF0aWMgaW50
IHNvY2ZwZ2FfZHdtYWNfcGNzX2luaXQoc3RydWN0IHN0bW1hY19wcml2ICpwcml2KSB7DQo+ICsJ
c3RydWN0IHNvY2ZwZ2FfZHdtYWMgKmR3bWFjID0gcHJpdi0+cGxhdC0+YnNwX3ByaXY7DQo+ICsJ
c3RydWN0IHJlZ21hcF9jb25maWcgcGNzX3JlZ21hcF9jZmcgPSB7DQo+ICsJCS5yZWdfYml0cyA9
IDE2LA0KPiArCQkudmFsX2JpdHMgPSAxNiwNCj4gKwkJLnJlZ19zaGlmdCA9IFJFR01BUF9VUFNI
SUZUKDEpLA0KPiArCX07DQo+ICsJc3RydWN0IG1kaW9fcmVnbWFwX2NvbmZpZyBtcmM7DQo+ICsJ
c3RydWN0IHJlZ21hcCAqcGNzX3JlZ21hcDsNCj4gKwlzdHJ1Y3QgcGh5bGlua19wY3MgKnBjczsN
Cj4gKwlzdHJ1Y3QgbWlpX2J1cyAqcGNzX2J1czsNCj4gKw0KPiArCWlmICghZHdtYWMtPnRzZV9w
Y3NfYmFzZSkNCj4gKwkJcmV0dXJuIDA7DQo+ICsNCj4gKwlwY3NfcmVnbWFwID0gZGV2bV9yZWdt
YXBfaW5pdF9tbWlvKHByaXYtPmRldmljZSwgZHdtYWMtDQo+ID50c2VfcGNzX2Jhc2UsDQo+ICsJ
CQkJCSAgICZwY3NfcmVnbWFwX2NmZyk7DQo+ICsJaWYgKElTX0VSUihwY3NfcmVnbWFwKSkNCj4g
KwkJcmV0dXJuIFBUUl9FUlIocGNzX3JlZ21hcCk7DQo+ICsNCj4gKwltZW1zZXQoJm1yYywgMCwg
c2l6ZW9mKG1yYykpOw0KPiArCW1yYy5yZWdtYXAgPSBwY3NfcmVnbWFwOw0KPiArCW1yYy5wYXJl
bnQgPSBwcml2LT5kZXZpY2U7DQo+ICsJbXJjLnZhbGlkX2FkZHIgPSAweDA7DQo+ICsJbXJjLmF1
dG9zY2FuID0gZmFsc2U7DQo+ICsNCj4gKwkvKiBDYW4ndCB1c2UgbmRldi0+bmFtZSBoZXJlIGJl
Y2F1c2UgaXQgd2lsbCBub3QgaGF2ZSBiZWVuDQo+IGluaXRpYWxpc2VkLA0KPiArCSAqIGFuZCBp
biBhbnkgY2FzZSwgdGhlIHVzZXIgY2FuIHJlbmFtZSBuZXR3b3JrIGludGVyZmFjZXMgYXQNCj4g
cnVudGltZS4NCj4gKwkgKi8NCj4gKwlzbnByaW50ZihtcmMubmFtZSwgTUlJX0JVU19JRF9TSVpF
LCAiJXMtcGNzLW1paSIsDQo+ICsJCSBkZXZfbmFtZShwcml2LT5kZXZpY2UpKTsNCj4gKwlwY3Nf
YnVzID0gZGV2bV9tZGlvX3JlZ21hcF9yZWdpc3Rlcihwcml2LT5kZXZpY2UsICZtcmMpOw0KPiAr
CWlmIChJU19FUlIocGNzX2J1cykpDQo+ICsJCXJldHVybiBQVFJfRVJSKHBjc19idXMpOw0KPiAr
DQo+ICsJcGNzID0gbHlueF9wY3NfY3JlYXRlX21kaW9kZXYocGNzX2J1cywgMCk7DQo+ICsJaWYg
KElTX0VSUihwY3MpKQ0KPiArCQlyZXR1cm4gUFRSX0VSUihwY3MpOw0KPiArDQo+ICsJcHJpdi0+
aHctPnBoeWxpbmtfcGNzID0gcGNzOw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArDQo+ICtzdGF0
aWMgdm9pZCBzb2NmcGdhX2R3bWFjX3Bjc19leGl0KHN0cnVjdCBzdG1tYWNfcHJpdiAqcHJpdikg
ew0KPiArCWlmIChwcml2LT5ody0+cGh5bGlua19wY3MpDQo+ICsJCWx5bnhfcGNzX2Rlc3Ryb3ko
cHJpdi0+aHctPnBoeWxpbmtfcGNzKTsNCj4gK30NCj4gKw0KPiAgc3RhdGljIGludCBzb2NmcGdh
X2R3bWFjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpICB7DQo+ICAJc3RydWN0
IHBsYXRfc3RtbWFjZW5ldF9kYXRhICpwbGF0X2RhdDsgQEAgLTQyNiw2ICs0NzYsOCBAQCBzdGF0
aWMNCj4gaW50IHNvY2ZwZ2FfZHdtYWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikNCj4gIAlkd21hYy0+b3BzID0gb3BzOw0KPiAgCXBsYXRfZGF0LT5ic3BfcHJpdiA9IGR3bWFj
Ow0KPiAgCXBsYXRfZGF0LT5maXhfbWFjX3NwZWVkID0gc29jZnBnYV9kd21hY19maXhfbWFjX3Nw
ZWVkOw0KPiArCXBsYXRfZGF0LT5wY3NfaW5pdCA9IHNvY2ZwZ2FfZHdtYWNfcGNzX2luaXQ7DQo+
ICsJcGxhdF9kYXQtPnBjc19leGl0ID0gc29jZnBnYV9kd21hY19wY3NfZXhpdDsNCj4gDQo+ICAJ
cmV0ID0gc3RtbWFjX2R2cl9wcm9iZSgmcGRldi0+ZGV2LCBwbGF0X2RhdCwgJnN0bW1hY19yZXMp
Ow0KPiAgCWlmIChyZXQpDQo+IEBAIC00NDQsNDggKzQ5Niw2IEBAIHN0YXRpYyBpbnQgc29jZnBn
YV9kd21hY19wcm9iZShzdHJ1Y3QNCj4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCWlmIChy
ZXQpDQo+ICAJCWdvdG8gZXJyX2R2cl9yZW1vdmU7DQo+IA0KPiAtCS8qIENyZWF0ZSBhIHJlZ21h
cCBmb3IgdGhlIFBDUyBzbyB0aGF0IGl0IGNhbiBiZSB1c2VkIGJ5IHRoZSBQQ1MNCj4gZHJpdmVy
LA0KPiAtCSAqIGlmIHdlIGhhdmUgc3VjaCBhIFBDUw0KPiAtCSAqLw0KPiAtCWlmIChkd21hYy0+
dHNlX3Bjc19iYXNlKSB7DQo+IC0JCXN0cnVjdCByZWdtYXBfY29uZmlnIHBjc19yZWdtYXBfY2Zn
Ow0KPiAtCQlzdHJ1Y3QgbWRpb19yZWdtYXBfY29uZmlnIG1yYzsNCj4gLQkJc3RydWN0IHJlZ21h
cCAqcGNzX3JlZ21hcDsNCj4gLQkJc3RydWN0IG1paV9idXMgKnBjc19idXM7DQo+IC0NCj4gLQkJ
bWVtc2V0KCZwY3NfcmVnbWFwX2NmZywgMCwgc2l6ZW9mKHBjc19yZWdtYXBfY2ZnKSk7DQo+IC0J
CW1lbXNldCgmbXJjLCAwLCBzaXplb2YobXJjKSk7DQo+IC0NCj4gLQkJcGNzX3JlZ21hcF9jZmcu
cmVnX2JpdHMgPSAxNjsNCj4gLQkJcGNzX3JlZ21hcF9jZmcudmFsX2JpdHMgPSAxNjsNCj4gLQkJ
cGNzX3JlZ21hcF9jZmcucmVnX3NoaWZ0ID0gUkVHTUFQX1VQU0hJRlQoMSk7DQo+IC0NCj4gLQkJ
cGNzX3JlZ21hcCA9IGRldm1fcmVnbWFwX2luaXRfbW1pbygmcGRldi0+ZGV2LA0KPiBkd21hYy0+
dHNlX3Bjc19iYXNlLA0KPiAtCQkJCQkJICAgJnBjc19yZWdtYXBfY2ZnKTsNCj4gLQkJaWYgKElT
X0VSUihwY3NfcmVnbWFwKSkgew0KPiAtCQkJcmV0ID0gUFRSX0VSUihwY3NfcmVnbWFwKTsNCj4g
LQkJCWdvdG8gZXJyX2R2cl9yZW1vdmU7DQo+IC0JCX0NCj4gLQ0KPiAtCQltcmMucmVnbWFwID0g
cGNzX3JlZ21hcDsNCj4gLQkJbXJjLnBhcmVudCA9ICZwZGV2LT5kZXY7DQo+IC0JCW1yYy52YWxp
ZF9hZGRyID0gMHgwOw0KPiAtCQltcmMuYXV0b3NjYW4gPSBmYWxzZTsNCj4gLQ0KPiAtCQlzbnBy
aW50ZihtcmMubmFtZSwgTUlJX0JVU19JRF9TSVpFLCAiJXMtcGNzLW1paSIsIG5kZXYtDQo+ID5u
YW1lKTsNCj4gLQkJcGNzX2J1cyA9IGRldm1fbWRpb19yZWdtYXBfcmVnaXN0ZXIoJnBkZXYtPmRl
diwgJm1yYyk7DQo+IC0JCWlmIChJU19FUlIocGNzX2J1cykpIHsNCj4gLQkJCXJldCA9IFBUUl9F
UlIocGNzX2J1cyk7DQo+IC0JCQlnb3RvIGVycl9kdnJfcmVtb3ZlOw0KPiAtCQl9DQo+IC0NCj4g
LQkJc3Rwcml2LT5ody0+cGh5bGlua19wY3MgPSBseW54X3Bjc19jcmVhdGVfbWRpb2RldihwY3Nf
YnVzLA0KPiAwKTsNCj4gLQkJaWYgKElTX0VSUihzdHByaXYtPmh3LT5waHlsaW5rX3BjcykpIHsN
Cj4gLQkJCXJldCA9IFBUUl9FUlIoc3Rwcml2LT5ody0+cGh5bGlua19wY3MpOw0KPiAtCQkJZ290
byBlcnJfZHZyX3JlbW92ZTsNCj4gLQkJfQ0KPiAtCX0NCj4gLQ0KPiAgCXJldHVybiAwOw0KPiAN
Cj4gIGVycl9kdnJfcmVtb3ZlOg0KPiBAQCAtNDk0LDE3ICs1MDQsNiBAQCBzdGF0aWMgaW50IHNv
Y2ZwZ2FfZHdtYWNfcHJvYmUoc3RydWN0DQo+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAly
ZXR1cm4gcmV0Ow0KPiAgfQ0KPiANCj4gLXN0YXRpYyB2b2lkIHNvY2ZwZ2FfZHdtYWNfcmVtb3Zl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpIC17DQo+IC0Jc3RydWN0IG5ldF9kZXZpY2Ug
Km5kZXYgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsNCj4gLQlzdHJ1Y3Qgc3RtbWFjX3By
aXYgKnByaXYgPSBuZXRkZXZfcHJpdihuZGV2KTsNCj4gLQlzdHJ1Y3QgcGh5bGlua19wY3MgKnBj
cyA9IHByaXYtPmh3LT5waHlsaW5rX3BjczsNCj4gLQ0KPiAtCXN0bW1hY19wbHRmcl9yZW1vdmUo
cGRldik7DQo+IC0NCj4gLQlseW54X3Bjc19kZXN0cm95KHBjcyk7DQo+IC19DQo+IC0NCj4gICNp
ZmRlZiBDT05GSUdfUE1fU0xFRVANCj4gIHN0YXRpYyBpbnQgc29jZnBnYV9kd21hY19yZXN1bWUo
c3RydWN0IGRldmljZSAqZGV2KSAgeyBAQCAtNTc2LDcgKzU3NSw3DQo+IEBAIE1PRFVMRV9ERVZJ
Q0VfVEFCTEUob2YsIHNvY2ZwZ2FfZHdtYWNfbWF0Y2gpOw0KPiANCj4gIHN0YXRpYyBzdHJ1Y3Qg
cGxhdGZvcm1fZHJpdmVyIHNvY2ZwZ2FfZHdtYWNfZHJpdmVyID0gew0KPiAgCS5wcm9iZSAgPSBz
b2NmcGdhX2R3bWFjX3Byb2JlLA0KPiAtCS5yZW1vdmVfbmV3ID0gc29jZnBnYV9kd21hY19yZW1v
dmUsDQo+ICsJLnJlbW92ZV9uZXcgPSBzdG1tYWNfcGx0ZnJfcmVtb3ZlLA0KPiAgCS5kcml2ZXIg
PSB7DQo+ICAJCS5uYW1lICAgICAgICAgICA9ICJzb2NmcGdhLWR3bWFjIiwNCj4gIAkJLnBtCQk9
ICZzb2NmcGdhX2R3bWFjX3BtX29wcywNCj4gDQo+IC0tDQo+IDIuNDQuMA0KPiANClJldmlld2Vk
LWJ5OiBIYXJpcHJhc2FkIEtlbGFtIDxoa2VsYW1AbWFydmVsbC5jb20+DQoNCg==

