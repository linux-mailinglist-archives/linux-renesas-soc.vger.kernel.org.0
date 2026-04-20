Return-Path: <linux-renesas-soc+bounces-31441-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cC2RA0Oj5mmfzAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31441-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 00:05:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2FF4347FE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 00:05:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AC57E300460A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 22:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71ECB26461F;
	Mon, 20 Apr 2026 22:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mYkpHh9K"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011042.outbound.protection.outlook.com [52.101.125.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08D738737D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 22:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776722751; cv=fail; b=sVQxdMpjLzZFYuT9HhNYKXBzbOy3Fk33yiv41pzV6fL1A20R6Qy58Yp9G9xiuzluobOkHeZf3ayloipPUfL8Lsh4y0KyOPaomwdc011LHf6pNhcGk2afe01ClRUvUz2lqnRqDd/auKkmRPoLNrie3SX2rC7ZHvi7b+qOFenqeHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776722751; c=relaxed/simple;
	bh=2A9ul4UdPKW4UnRdJfhgbbCETztL/EcvL6B5sPWXwBU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PNEqB7i65lpvjmrQRO3d5gwkpj6+Zb7EPRijYteDey33x60uWSI6k04Bpx1cnv4vPMKiwE8MXd9SSKpLX9qnnEO624C1iXPI6gIsK1pVBzDUXk2RI0MwPLJgtDwrVIxQN19psl7ksyGDkkYkmv6K9O1m24Bc/oSVl2PPPkWIn+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mYkpHh9K; arc=fail smtp.client-ip=52.101.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9eLXo5OMVi+e6Bfwyu8H++D2dGdONrCf3q0oHl4p30cBJYSfNVGHYYjUj/8p9DLzisD0JrqCWdJ/X7JmBlq4xrrcyyum8QodUc14ERyux38PVpzloo/mFKDG1/Hp/IsEyCKYUseNPbB+1I/m7Zzh4xT2LisXB98wm78RQZ2fT15vuK5Y70324pw4q/fwqtmmXuN8pJo5xpI+R/5xEe1sSmhDiP3RCKJ/CfFb/5hMj0/UP/fhiZmfiiqscGH8Q6/CNuwIVbhxUfogk2BiONRUliiQeNbdQeFVQIT5DDrw1fr33pXhZlqJPJ4s+BS3mMKIZ/5+uY5M3xz3fwHageKVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2A9ul4UdPKW4UnRdJfhgbbCETztL/EcvL6B5sPWXwBU=;
 b=Uu4HTrLOZJfNqGRpZ6eWNmaZqyEui5Cbfz0i5Qxf5lNpK5GZm6mAVc6q++kiHAgQN7eneYtnn8cUuDnN61ZTbDF5cHyJnOY+lyWM6vu55gS4rIM7yKogM1hbJQ1LDW67oPCzZOCK1idzKRkGc/qJ0XbRXCtTgtaQQRsRmPFptKMqgtaE/IHsfFYwRj+0uLvH6lzSSQpvOKXhXhK8FaY2u7ep2E/pfA0vfTZS0M+DjlBSOoGR7+royrpgVCm2adpU7j00mCXpIBJNT3Oh6/cn75ACXTPN8mGGA79aPoIhc+IrobpH+EwWv8lBwD4v6d4bANHT1oR8RK0hs0MMrC14mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2A9ul4UdPKW4UnRdJfhgbbCETztL/EcvL6B5sPWXwBU=;
 b=mYkpHh9K+RKti4J86Dg2ADs64sejrMgYiHQXGYd8/7yS50UFGpBxuxBM77LrA0NpZOYrsZz0hA3esf1WpivD06T7L3Iu1qTBCe4Gv34jmji+eGoLoG0jr1HZGVEqr8vLxwFK7+FAC1hsIALsV0K3G5Rg06POCkgnuTAj+BOD9EY=
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com (2603:1096:604:1a2::11)
 by OSCPR01MB12769.jpnprd01.prod.outlook.com (2603:1096:604:33c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 22:05:46 +0000
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983]) by OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983%4]) with mapi id 15.20.9818.033; Mon, 20 Apr 2026
 22:05:46 +0000
From: Chris Brandt <Chris.Brandt@renesas.com>
To: geert <geert@linux-m68k.org>
CC: Biju Das <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Pavel Machek <pavel@nabladev.com>, Hugo
 Villeneuve <hugo@hugovil.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm: renesas: rz-du: mipi_dsi: Fix return path on error
Thread-Topic: [PATCH] drm: renesas: rz-du: mipi_dsi: Fix return path on error
Thread-Index: AQHcznLuB+8+YFONMkeG/G/+SBPB87XnlqUAgADe/aCAAAxIAA==
Date: Mon, 20 Apr 2026 22:05:46 +0000
Message-ID:
 <OS3PR01MB83193C199C2DF1F2153827458A2F2@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20260417140231.3972749-1-chris.brandt@renesas.com>
 <CAMuHMdUVCtzxumM6yniuGTKfqG_z6BuySHNcZYE9UHP5AuDoLw@mail.gmail.com>
 <OS3PR01MB83197FBDFCDECBA1220BF52B8A2F2@OS3PR01MB8319.jpnprd01.prod.outlook.com>
In-Reply-To:
 <OS3PR01MB83197FBDFCDECBA1220BF52B8A2F2@OS3PR01MB8319.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB8319:EE_|OSCPR01MB12769:EE_
x-ms-office365-filtering-correlation-id: 31c6af6a-ff7c-4110-cd87-08de9f28f944
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 kXO1nQnUEbFFFIY6nl5liHuv1+/QDcMKJv7/JeJCw2vU63zm+YVHYw+46EH6nXFmfLnIP2K5ITdw/M7pP3irlN8lhJwjvs3b8lWng1x2B7LCggxd82PQ3M6ZExESqFfkP+ghJH2JzFC8y916SxLuFRY2r3Z8ht7kzdtNANSXUKnXEorBm1tY+vOSxQpEiy/y2fbD2VB8NKPn9sTadixFtPZwQ4UzJIUl9aBPh6qxj029BJO/ZHXutkArSgq+g1+YMkpSyoXMC/EJiMV/I/77dUB6nz85YguiaA6f7T7qI1l+eDab4jOjJVehL/JpqNCJpg4rDf2vincmexGmWCo070fNIhVkMmLxPbUNYpvo+6tiA+y35+sn7EWAUPBgBdsOjYY89w3DzJiDL5kQ0c5mHMzo0ZFwFwMxsQZ5FfhJFfxDhStIhbJOZfACaYR1XUXv+VxQAhdym9Db5HRf5S0s8rDZOXuC8EIBkuDliRYgIrmWXUThFsJExNV0iVN97JjTLi3w8cyKJ3RuDXBW5iigvnuwntpki1rIVgXmBpOdFhz0qHgBr/ubqLLPZBQwU98VRr2XgyEnHzmc7huRj7iToi1NdQlFLviOJouBQJ2B/4GG5KL6x5HblAidhCLe/L5Sk5kkbO+NcgXAbsNMEgldxOf9Zukg9TwVmZaqTE7JszM46m337o7k3SgQ9DQySf854e4VVq1aRPcxEaehYin/R887oLc62b7ma1Ljh4rs+nqyQ2mqwxqlkL/ZzSQmWLhfo7V/77Kyc+d1NGjeK1GRb2PEdRveEwpU3zYWs63bLEk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8319.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OURJUThNeTFkSVpsRjFJK0RWRVFUamliK3F3ajJnSTZtSE83eFZCbThPMito?=
 =?utf-8?B?OU52bWFDWlNPdWJYOHNjeERSempFYU5EU20waFlSbjZkZW1UOUgrMXZUVklD?=
 =?utf-8?B?SDlJUjF1UmNWMFUycjBmNytxVFJlckZJalRvdVV6SldYY1h2ajB6Yml0YVRH?=
 =?utf-8?B?Mm1ScVc5QTVLdVBmWHJiUXFaMHpEQmF3WmIvUk5RdW5mZ3J5ekQwOVdpQkFT?=
 =?utf-8?B?L3k2OUNYVW9oVzNVdTZZVjZqRzBWRXlGLzV0c1hNUVhCV3BFd0tvbjI3K1hl?=
 =?utf-8?B?RTN4ckFiUTk3TXRjdXl3b05HZjdMVEVmTmtYdWJ6Vi9sWTRkSFptTlZuOWdp?=
 =?utf-8?B?ZXQxdmgzTDN1ZzJvWnV5bTVQcXdaUW84RW45WjVDTk9XMXIzQW5KOEJlbDd1?=
 =?utf-8?B?cGRHbGlrY0hlRk43Q2xaNFhGcGJMZVVPRHNseGV4OUE5eVpSSmVqNHU4dnpl?=
 =?utf-8?B?TG9hT0hGRlFVMmIwMkhOUHBVM25xODJzeXA4bUhldHlIa2RtazNjWFBBeUdS?=
 =?utf-8?B?ZU9DT1VtcHp4SkwyaEhMY0hSSlZIWnYvZGVwTDZPZm1HcnY3M21lZDhObzVZ?=
 =?utf-8?B?RDRMcW9SdlRnRFpJUUNDYkc4UnM4UUowbWpYNWNXQzB3V2toWXNjS1NGa3FG?=
 =?utf-8?B?UkVEc3g0czYxY0dRYXRKTWs2UDQvYnpJcGVlZGs5NklNYkxKWFJlbzMyRDFm?=
 =?utf-8?B?S3lNcC8xTHRYRzUyek9ZZFdBdmFCZzJjakJmV2dCd2VGWjdPOGJxcDhBb2Rl?=
 =?utf-8?B?MXZ2VWdua0hOYWpCUlZoY1FOdlN2NWIzTnI3TDlCaHFjQ3F5L0RWMDJkZDIv?=
 =?utf-8?B?Y2VSdWNOL2UvUldJRjlKSGVMNjFiOWdqSExVa25LeFpNOCtuM3ozYWx5Q29o?=
 =?utf-8?B?SGpwTXBPUHJLR0pSZUVGaWJBYVRKcVhWaUpxb3E5bzAyRFRpQ3JPYmVRbTVT?=
 =?utf-8?B?eUFYQ0k1Y2d3YTRrRFFqLzRYQXhKRVhULzQ0V01rOWJUeTlDTVF1c1l4NGcv?=
 =?utf-8?B?ZXlPY3ZQT3NTdldoUDFwNzFRS1J3ZTE0Y05XRFhwTGpDQWNsNFdHeDI2aCtB?=
 =?utf-8?B?Zzgxd0pnZnBBS0dGUjg4NHhMaVBkMnBpT1lna1crM2M2VEcwSkgvSDhaR1hj?=
 =?utf-8?B?V2ptZy82UzRUMGtNM2xFMlRmUU02ZU1jZlM4NVRzb3B4WGFFNVVzdm9hQ1g2?=
 =?utf-8?B?UFJ2OTU2TC9UUm1CS2RLdXVIMG1QL29zL2duRFFsVzg1Yk9qd25hVDhzRXps?=
 =?utf-8?B?dUlNU014ZU9QV21jTG1ZZ2JEei9hMDdWbEx5Z05hOEVxTVZoOGt3SmRjRWVk?=
 =?utf-8?B?dW9GOUxZdHp2VzBHZ0lNOEc2N2hDQnpUdVVQaUlkK0xxZ092RGVTeFNTMkZX?=
 =?utf-8?B?RjlYYnp5SEUzWjgyc09GTGRUYVdNa3k3Y2NIL0wrVW5QYlZhbTMxUEpwcHZZ?=
 =?utf-8?B?T2JrMHJpV3VNeUZIWk9WYWxyeG9UVnZzWTBORnZjb2RmVXgwUWo4UFRKQVpL?=
 =?utf-8?B?OUxhUzAzSGloY2gvUjZZRXN4WFBPczhPNUNPbU5KSE9xa3B5YXFHTnRaWkl2?=
 =?utf-8?B?TkhjVjBJdURhYlluc2pEVjZldzh6YjNYTjJuQ0lmTTU1a0hPMi9tekxSanNq?=
 =?utf-8?B?SytLQTVMOTNYZHdBUmw0TXZwOEs1ZXZkbGVvdGsrN2lUV2ZlUUI1NFA0ek1T?=
 =?utf-8?B?Q1IzMHNuZ1FLK3U3bDErcVphS3B0eThSSUpWVGQ5MlNZeHBpQ3l0UUtBN3Vs?=
 =?utf-8?B?OHNUbi9BR3Q5aXFVRFluREpuOEpiMk12M1FDVVloMllzdUwycm5TUFh6aktL?=
 =?utf-8?B?ZG5VY0NRNHYrZG4wOEEyRXpvNEcyZ3JUSVZ3WGZWNHh2VHBCRnBJSkdCMjdH?=
 =?utf-8?B?UEZHZFROUXZOVkZobHQrQmp3ejNrUnNXR3NGc0ZlVnFkWEIxTitoYkFxTVJW?=
 =?utf-8?B?TUVVeER0cVhvc2Q3SXhVRGFadVZyejBuN0dLT1VHSTVObFN5NUlRK1QzSzVj?=
 =?utf-8?B?Qm1rRWJuT0pJRWttaVZsL3VXUzVOU2ZVbjRtekwrOWcyV3NxTnZXOUxSRUww?=
 =?utf-8?B?SzE3Tld1UGRPNlJJa2xvWFFUME5GRVc0OWlTOUdod1lHUVZza3I4T1E3d1RF?=
 =?utf-8?B?R3dJRGhCVHh5Zm9hcW96RWZRMGwxakVMcGs4RWNUblB2ZFR3RkFhVGU5T3FQ?=
 =?utf-8?B?alNYN2hia0E5YVF0OVV6aEVKWWw5QnJVSU53b0ZORGdyd29IQ0daTk5Mc0ZJ?=
 =?utf-8?B?YjUvQUdYbWs2cnN2UzlGZmdhU1RIV1pNWHFSY2RwbHpORVlnR1QxbytCLzdY?=
 =?utf-8?B?YUJGdGdUaGUvWUVRcXpjaEVTTTNJODNBSkQyL2VMVVl1dzdGcW12QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8319.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31c6af6a-ff7c-4110-cd87-08de9f28f944
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2026 22:05:46.2573
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ySjzUJRcbM3h3dwIx2SD/E004GCtrtD3MtRZHgy01SBpxYpXE4pOcE479Ta+4+TkUajGQ58AhZa/CGIE8sBSHRfsYyihi8cn2Bw2MBOGwUM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12769
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31441-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,nabladev.com,hugovil.com,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Chris.Brandt@renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,OS3PR01MB8319.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 9F2FF4347FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNCk9uIE1vbiwgQXByIDIwLCAyMDI2IDU6MTQgUE0sIENocmlzIEJyYW5kdCB3
cm90ZToNCg0KPiBTaW5jZSBpdCBkb2Vzbid0IHJlYWxseSBtYXR0ZXIgLXdoZW4tIHRoYXQgbWVt
b3J5IGlzIGFsbG9jYXRlZCBpbiBwcm9iZSwgbWF5YmUgSSdsbCBqdXN0IGtlZXAgdGhlIG9yaWdp
bmFsIGxpbmVzLCBqdXN0DQo+IG1vdmUgdGhlbSBlYXJsaWVyIGluIHRoZSBmdW5jdGlvbiB3aGVu
IGFsbCB0aGUgb3RoZXIgcmVzb3VyY2VzIGFyZSBiZWluZyBhbGxvY2F0ZWQgdXNpbmcgZGV2bV94
eHguDQo+DQo+IFRoZW4gSSBkb24ndCBoYXZlIHRvIHdvcnJ5IGFib3V0IHRoZSBpdCBhbnltb3Jl
Lg0KDQoNCk9oIHdhaXQsIEkgZ3Vlc3MgSSBhbHNvIG5lZWQgdG8gY2hhbmdlIGZyb20gY2FsbGlu
ZyBkbWFfYWxsb2NfY29oZXJlbnQoKSB0byBkbWFtX2FsbG9jX2NvaGVyZW50KCkgc28gaXQgd2ls
bCBhdXRvbWF0aWNhbGx5IHVud2luZC4NCg0KQW5kIHRoZW4sIEkgY2FuIHJlbW92ZSB0aGUgY2Fs
bCB0byBkbWFfZnJlZV9jb2hlcmVudCgpIGluIHJ6ZzJsX21pcGlfZHNpX3JlbW92ZSgpIGFzIHdl
bGwuDQoNCg0KRG9lcyB0aGlzIHNvdW5kIGxpa2UgYSBiZXR0ZXIgaWRlYT8NCg0KDQpDaHJpcw0K

