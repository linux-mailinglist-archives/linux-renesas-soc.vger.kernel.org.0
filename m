Return-Path: <linux-renesas-soc+bounces-32464-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHlXAeEAA2rdzQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32464-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 12:28:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAF251E8DA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 12:28:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 151BC307F0E5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 10:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9250395AD5;
	Tue, 12 May 2026 10:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="LA0ydyFZ";
	dkim=pass (1024-bit key) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="HIWhSxlm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90A7395AC5;
	Tue, 12 May 2026 10:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778581071; cv=fail; b=pzMGKfYuXtahSIS0+zTJ/7C+3PN16Ig3vRKc/S+g+CLPpRcoTpYOKC84jKPxKysfHpDNKZJ9SelktolH7078d7GAFsZZy/XIoiHLBQ363n2G5FTCysAUfB1sPeL+ZvBjFMU9GjBlK/YlovLlttwe7XsbTKuhI9Sw0aD1B2stFNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778581071; c=relaxed/simple;
	bh=CirHPeN28be7YjkPNunvHDvyJYWbp67ai7lWvgdGp+Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mDWN7WGBUYVQJJdkYbEo/JEi1KQIauXYsMDPVd/7M46Zx1cSGGWtqPSBSyir0pu5O3FzWBBrIoPDXzgHufn4NcE44kLPp3LijG0cgcVnx80kjsGW2Ptjt12xd7MfgkAo1LDnw2KKhZMEvTevOLQR7hSmjBEQEU71yZMYCDtVT6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=LA0ydyFZ; dkim=pass (1024-bit key) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b=HIWhSxlm; arc=fail smtp.client-ip=91.207.212.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C4YG1Z1908981;
	Tue, 12 May 2026 11:00:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=dk201812; bh=qkNi2aFvfhfmpvaBmjNjZgS7l
	yTv8m7OhxQOfU6ebBQ=; b=LA0ydyFZDMyYWjuvPVAGGT7WxLE2b0tEN9XwJrWrm
	WWpRR4BBe9lG4/N7r+YuHfeE6QsFkLG/LcG0X2o0lMPIHYuJ19lBD3PhyZbtS5iT
	gG66rvhu20tZgoXwE1Bf2yinKaR5GKJIVWowujpsGad6qTYusUqVQVaYJ4APHiIW
	o8FnL/xilBItdD7FcckOuLSmKAlW6kJkDZTtShdY4D/FeZfXLF0A2PcqeNj8Y97L
	1BcqkHGlmcM566R+RC/TE2HxftVKGswQ61aFmmZPua+uFMvNgRCs8xGRQzcIU1L+
	QJrXmPP3OXMcLtYgweO9LT8DCvryiyqQBk03/e/sCUD+Q==
Received: from cwxp265cu008.outbound.protection.outlook.com (mail-ukwestazon11020120.outbound.protection.outlook.com [52.101.195.120])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4e1u6pjaqk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 11:00:42 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQTHdHY4RmkfPJAaA73i2qejpD03f/dDwIm+1RTVzuPljh1nEMze/57Tcb/Nh0plOP7bEnzw3KZjfazkINvN1uHGCcPzgrfLkogzggd2ngRBVbb55/OLlbq7sDewSwPgydGE4M54tmPlKuAlLV8ETsaBVTqu35XA2P8Ji2+FmCzuAjmpkA/RcgqoRtHY7tcUYfjd6pNtyIR+2mELtEW+m2CSF7yj0eFiuq9cx9skBFqIRTdsVaG23lkzLriz5S7YyIv3enYxgm9V0P95/8txwinSNz9T1ibOX22M+4Zo0NZaFuB6U3q+Z9k/4x86HfSjhAJXgaOHQioXrcowAEzkoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qkNi2aFvfhfmpvaBmjNjZgS7lyTv8m7OhxQOfU6ebBQ=;
 b=Djz11gDVTjfkoHYBPBuAcG9ogmtXTHVqTFzhB48I4gADtcZctvybNKMBwP3fm5rUBYM5AXJ1WoPByCi3lnDoFdHNC3JAmIPfa4MbfDcJVFccz7KbulA5ItuB1AA2AfAiAMU/r2KB2DBOxJJRKiSN243Ql8lKT5j7bFUx2H4CqU/54Otp0S95121wx/bRSYQWEzt7tY7I8Q2Ebvw3AgwZD7SotagAhhcJQfQ+1o0pB4cbPVRAsEfyiVndADUckIFuV6OpLqoQRWYG6Nkk/B/IM/3zMMPRtBx5Z3qPi0vspfDJ+9XDrdqfA6sVFonIP4r0ZYFnLblPaw+wwBdky/UkgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkNi2aFvfhfmpvaBmjNjZgS7lyTv8m7OhxQOfU6ebBQ=;
 b=HIWhSxlmc340SswAaJIgSd7MtLba9BE4f/ejO+xZiSGKcn1wveTaSmMgmujIkR9wjv0aCrr0F2eKS+yl6Vn9TZes/TnfQsi/t0QdgU7SaA6/G7uReh+NeMGhePe/opzcYLdyfgaWCUaLupwdfMamq5CKN70HNboP06NbW3I7G0Q=
Received: from CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e2::14)
 by CWXP265MB1861.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:31::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 12 May
 2026 10:00:37 +0000
Received: from CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f32f:ed34:4f98:6cd6]) by CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f32f:ed34:4f98:6cd6%3]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 10:00:35 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Adam Ford <aford173@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>,
        Alessio
 Belle <Alessio.Belle@imgtec.com>,
        Brajesh Gupta <Brajesh.Gupta@imgtec.com>,
        Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
        Luigi Santivetti
	<Luigi.Santivetti@imgtec.com>,
        "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>,
        "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Revert "drm/imagination: Warn or error on unsupported
 hardware"
Thread-Topic: [PATCH] Revert "drm/imagination: Warn or error on unsupported
 hardware"
Thread-Index: AQHc4fYtZDQIa0Egp0GCGQgVjy6Ybg==
Date: Tue, 12 May 2026 10:00:35 +0000
Message-ID: <995d2751-188a-4062-884a-8e15d7a7a554@imgtec.com>
References:
 <caf5e011a5b3fbdbab8c50d064bc8342212d5cc1.1778505897.git.geert+renesas@glider.be>
 <f46eff18-4a5c-4c25-a0b7-71cdbd444014@imgtec.com>
 <CAMuHMdW_YbjCfhe=Uf+fPjCiwf6272aNHaOjd8B1HUrkeLJrvA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdW_YbjCfhe=Uf+fPjCiwf6272aNHaOjd8B1HUrkeLJrvA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB3393:EE_|CWXP265MB1861:EE_
x-ms-office365-filtering-correlation-id: 7cdacc9b-1f17-48f1-9eeb-08deb00d5018
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|6049299003|376014|366016|7416014|38070700021|4053099003|22082099003|56012099003|3023799003|18002099003;
x-microsoft-antispam-message-info:
 YthtiPxqQYYomR18Iw9SDCW6XVs47nmoyJc1l4dQ6ZIWnapeq5Ok/Zh3rOCrF3Y4bOH09CnkCstaueIYqpZxrdzdulLmCX0Dp3IhBr48V5h3OLKjl+PvI7pxvZ6TLx0+t8XQ9Doj1kUKjwJHpQ9gl9IiS6LdDIPFfT7vwcmZ7/f5DTmA7WEa/jjDnGCe7lRTmM/Y9YVlq7bPIXzIeVA5MeA4ryjIodPGJJqaYxo8iKOeTlfCAUOyNPiFP5eep14LOwJhu3I6uZVoyzjnTgu7B6Q243heIEAnS6NBd7mZMv1rie2dzS4lzDD0QbKD2WRt1t7dgRcMFm31dtM9Hg4B/5xATD5d775skF0HcHK17k03BbJxFDOMl4GozIjitr0KBWNquxF8Ny+iR/lr70xod1SxtppeWTHP1fENRdorQAy+o0qWL+tW1mPRyBSzmT4SThCYl6rIr6pKyCJro4GUVyM71Rk9s9jz/n8qMqmT75Pq6B9YvHx+ALfMtx/2cXuvu2JYwnYKxwcfaTw08FnTNiOp/n5qB9hmmmjkdIup1dp3636+rSRNzuoV2rBTmw+H8dkwlW6LDfQiLyBTUyzG/s8xUmnyhTJzpEb79KQD956Lg2sxnE7P77SpEbQTLN/kcWq0wjx+uvAn0OhtfOdSXj3Zc7seB5eCtbRbM6R9Buw0g2m+V199BcrJlF7T6I616m7b8FKI1125jOglXa/6Mw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(6049299003)(376014)(366016)(7416014)(38070700021)(4053099003)(22082099003)(56012099003)(3023799003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZE9ZSlpCSDIvQ095ZjUrSkRBNHBoOVdNLzh2WGpRNGd1Zng4eVA3NkhVaG5G?=
 =?utf-8?B?S0RMejVaa2xYRE5tdVFTRFFSOEMrc3JzbnpYM1dPdlh5T1lBczFzRTdETkR2?=
 =?utf-8?B?RXZjSHVmUU1pblpldTIyV2VmYjY2UlJVQzVtb1FYcHE4QkVOK0NWdmQ2VTNF?=
 =?utf-8?B?QzdqZkl6QWIxWDROQVVOa3B5cVhnS3lmR0YrUVpwbHJndStrMFRSVjhTbVU1?=
 =?utf-8?B?ZjRWZXB4bWhKdmt0ZDVrSHdCcTBiQkRGMXJaRUZ6eXBTSTljSG9FRUREK0Nj?=
 =?utf-8?B?NjVINXRmeXJVMTI4cVpJOVY3dHQrU1laZ2FvY3hkU0FBVXNiYjFic1g1elhZ?=
 =?utf-8?B?dnZ6U2tqcmd5NGUyTVZoVnp6UUl1QVdOMGVBcHVzL2Q0TXBXK1dvTG4rMklr?=
 =?utf-8?B?MU5OMUl3Z254YmlZUTFKdWl3eEsrUmJISXl2WnpWVEhHZndMQjZJeEN4Y3hQ?=
 =?utf-8?B?RXdwWU8xU3JYSHBrcFRwM1BlZ0dlcStleXEyVGxlQkN1NXlyaWpVbnBpMWpY?=
 =?utf-8?B?N242ZnExdHFzT2dBYS9Icm9VaUlzTis0L1FkTkZROFlEamg4WWIwMXRoYlIx?=
 =?utf-8?B?dWR3Y3R2eDZnbHJqdXdXa1lFckhjK3VILzA2ZjRrOTNFSkF5T3RwMEkzMGdi?=
 =?utf-8?B?N1V6Vk5sS08zTmJSb1h2UURaNjF2MjF0VUpaNDJxYnVUVjJFYk94emFIQ3lF?=
 =?utf-8?B?VGlQaHE2cU1NZVdMNFQydjBiN1dNYmR3QnpRSXdGZGh5TmtSV0JkdFdJeG92?=
 =?utf-8?B?YkJmYXBmSWY0SHdRTWh4MDM5VXN3MkRwZWFQeHRjbnZWanM1MUhRNjE2V1JQ?=
 =?utf-8?B?dk83UWs2VXZleG9MYWdEdEJuME1IdHNkRDhMMzlhUGs1VDBUUGtRQnVGOXlj?=
 =?utf-8?B?OVVZYzl4cE9SQlJPRXl4TEd1MWc3L3FZMHArU1ppY1JqNWxUVTBlQ29tOVpV?=
 =?utf-8?B?UWhjNmswMEhIR1J6QSt4UlFzZEVFOEFTMWl3dmxweWt3MWlJd0prYm5La0FF?=
 =?utf-8?B?aDBZaXNBTkZjYVBhK01MSnNQc3YxczNPMmxuYnJ2c3VzclZ3N1NRRjl4TDFR?=
 =?utf-8?B?bk5GQUNHMTlsUFdmMWVzS2xlVnZkTFpQVm92ai9sY3dZQ3FqM01kdzBpZHZL?=
 =?utf-8?B?MHplQkNya0tnWXowN2ttTGc0eFIycnlSL3JrRVZkVDBndEhwSHFHRGx0L1JW?=
 =?utf-8?B?cVMzMFFwdjlVUndnSnFabENpYzhUSTRLMDhPdUFnSW9zUXpoZU9WcnJjQmNU?=
 =?utf-8?B?a0dvWG5iYklLTnRqZjZPaitiUzJlQWoxZkEvQUZGTXpHNU5pdWM3dHdQVmhD?=
 =?utf-8?B?czZNbzg3a3VUcnFiWHFRbkJqWi96YkZ4V2pSMzJrT2EwaVRUNFl3VVdtYTRx?=
 =?utf-8?B?Nm1Cd1p3RnBXaGw4RTQraHg2VlAvMUJTeVVyRTFXL0VnR09YbVZYekJ6Zjdj?=
 =?utf-8?B?T2tMNmE1NjU1VnE0aEhhblM5Y3hwcGk4aWJQYmkwV0ZYNTZZeEJaSVQ0SkdO?=
 =?utf-8?B?WGNDUFlMcEcvVGZJdGZJM3djTVBHZ3MydEM3M2ozWVg4Y0w5VFdrQThGSGJt?=
 =?utf-8?B?dWt5K0ZTMENxbnNSUkhTNm1FRnUxQXhJWU9McGpvbFMvTzcrODcyeGxsNW5q?=
 =?utf-8?B?ZTJtb0pIUUZuWlQwVnJhc2VPVFRUWi9WZWJWc3NCemRiNXozL3hPYzdSNWMw?=
 =?utf-8?B?L2k4Njh2ck9wbm1FM1E5N0hnbURaaW5FWk1RU0E4dXNLVkJUK2VoVFZubmpC?=
 =?utf-8?B?QUVUSFYzeWFjMXhDTUhPWVpCcEhXT1B5dndmMDlINWFtdDdwMFBaWDJLNzRP?=
 =?utf-8?B?Qy9LUExZVUtwWXhqQytmNDRORVZIYVpXcEo5bE5iazJBVTN0d0hQOEJlNWpO?=
 =?utf-8?B?N1BmQWR6OXl1SE1VRFB2TEd3UWloT21SZ2hBK2I4VGtaRXdrNUorQVNuRE91?=
 =?utf-8?B?ajRIcCt3RVRla0Q5Q01jcWhEbXI1ZmNaNFBOYW9sUnFMMWZqbGI3OWNvL3Q5?=
 =?utf-8?B?RlpBaFlhMGd3S0ZSdGw0UkhFK3lPZzVNcXczR25yTG5RbklGQ0I5RHhjeitj?=
 =?utf-8?B?anF1R3FIQmd4elJpT3h2c2pBcG1QTklQVC9BSTIvd1pWR1ZmSXVqUFdOM2JZ?=
 =?utf-8?B?M2lKQzZGUFVXOXNDT1hpWTdXWEFWandXSGU2dXJGdG81SUhKU3QrbTVLUWta?=
 =?utf-8?B?N1FMak1haUpnZHF0QU1mZFdxNmd1TU0vb1lBaDhDY0Z5aEU2N0VvTndjZGRh?=
 =?utf-8?B?V1lTTThSN1ZBVlRKODhicWk1ZnVkZFlraFBqWXVHem9wZ0JPL0xROWxVNjNU?=
 =?utf-8?B?ZkxDM2RZNTFwb1M5S0h0czUwVmRpSXlmdzhXVUF4WVdYNi9LQitxejZpY2xF?=
 =?utf-8?Q?kU82ddadCkzXxkRs=3D?=
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------3BkDSVFLCeHqlG6WvQRtP17o"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	MugwTpfC3fDL4zCivQmBU+JWcd6G83njk9GKFPyxEpes1d4DL89IUvk5xQZsLD3uuNPKgVyN6stQnPuIP8Yj0bJYevd9FwoRUq+Yj31/f9dw0QjBD/6RzpSK/arOQSkd28S3zd/k/7XojGf5n8pJCp50vvO8+aN1yzR5rUh1ZPWjNLMLQdyjUQVCkOMpDYhC5D1IJF481Kq4VfjN1ROktDWdeNNaFMnlmvnLmGCVppP8mcu/z937Q3c5xfcQHNnq6l3dLSncrgtvuU20rACCle1r1APVNi/IUQj6iTnA7kUlqG5bxadwMhW/MUkiEGB4w65pJaMvZExD2IyhtbCsIw==
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cdacc9b-1f17-48f1-9eeb-08deb00d5018
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2026 10:00:35.7512
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q9ezndobZF9RyYGMWvho1mxwjjQUMUUfRHbRONjKu1hI8IUsnCHffpURRPXdSaVsfCHtO4V3PKBhAwYStbT9Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB1861
X-Proofpoint-GUID: FVuvsSq-TVEKQ_27O7QvQ7ut7jwZNTDc
X-Proofpoint-ORIG-GUID: FVuvsSq-TVEKQ_27O7QvQ7ut7jwZNTDc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwMiBTYWx0ZWRfX6XcKphDstTGA
 efeTn/qbPw5zqpws6pHRsPpIvKx58FG1XzxrqwB/wqNk2Y7RP7mT4cZOmGHjPVt4/u85HSXxNMN
 6Rv0TsxbHZrAnUunBUdM1aL8tlmQYKLlZ3/PrOIdZDO8L6LEVfHf5bTB5NxRkyWsH+kX5hbFc64
 tZFiAAz/+yBMOT5NhmMXuHCQTw12f+tfkIAcMvYS3PbvvxO2IgFGnfg9l4CIUnJuZJN5WxhZ/Hl
 NyQ8+tpbOmwoK9xFImxw6u9LM496OB+FflonRBngyr1acgG1mMeiXv8LQEGfnt+BXfptHDGB14G
 hJJTMusboSr1ybeIj6/JGwn9ZGkKjzc9jlQ4V3DyUmsQGVIwRxMi+K+PC2aJJZ6X9Yzw0V7ESC1
 +HkphWAxTq2ISv8aI5wssjuF5KCiwhMXtw0ZniBFj8PeKd49Mc2u6tyWjlogxJTjL0jcaSi2Q4L
 f9Kwj0NkN1ZBwFSrXNA==
X-Authority-Analysis: v=2.4 cv=dIeWXuZb c=1 sm=1 tr=0 ts=6a02fa4a cx=c_pps
 a=r6flpba3aIlT3cEwwQ+y1Q==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22
 a=qZQ2PDNLMSdLoqI-hfl9:22 a=e5mUnYsNAAAA:8 a=r_1tXGB3AAAA:8
 a=I7656cauk4a6DTasDMkA:9 a=QEXdDO2ut3YA:10 a=x_ykFVemBLUaY-Zrh2EA:9
 a=FfaGCDsud1wA:10 a=Vxmtnl_E_bksehYqCbjh:22 a=t8nPyN_e6usw4ciXM-Pk:22
X-Rspamd-Queue-Id: EFAF251E8DA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[imgtec.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[imgtec.com:s=dk201812,IMGTecCRM.onmicrosoft.com:s=selector2-IMGTecCRM-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32464-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,gitlab.freedesktop.org:url,IMGTecCRM.onmicrosoft.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,mailbox.org,imgtec.com,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[imgtec.com:+,IMGTecCRM.onmicrosoft.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Matt.Coster@imgtec.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

--------------3BkDSVFLCeHqlG6WvQRtP17o
Content-Type: multipart/mixed; boundary="------------SK00SpnVewtQaWnM5sL8g0aS";
 protected-headers="v1"; hp="clear"
Message-ID: <995d2751-188a-4062-884a-8e15d7a7a554@imgtec.com>
Date: Tue, 12 May 2026 11:00:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Matt Coster <matt.coster@imgtec.com>
Subject: Re: [PATCH] Revert "drm/imagination: Warn or error on unsupported
 hardware"
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Adam Ford
 <aford173@gmail.com>, Frank Binns <frank.binns@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <caf5e011a5b3fbdbab8c50d064bc8342212d5cc1.1778505897.git.geert+renesas@glider.be>
 <f46eff18-4a5c-4c25-a0b7-71cdbd444014@imgtec.com>
 <CAMuHMdW_YbjCfhe=Uf+fPjCiwf6272aNHaOjd8B1HUrkeLJrvA@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CAMuHMdW_YbjCfhe=Uf+fPjCiwf6272aNHaOjd8B1HUrkeLJrvA@mail.gmail.com>
Autocrypt: addr=matt.coster@imgtec.com; keydata=
 xjMEYl2lchYJKwYBBAHaRw8BAQdAOYlooFfHTXzAQ9aGoSnT9JS9wq8xprG+KVLbkxJDF5DN
 JE1hdHQgQ29zdGVyIDxtYXR0LmNvc3RlckBpbWd0ZWMuY29tPsKWBBMWCAA+AhsDBQsJCAcC
 BhUKCQgLAgQWAgMBAh4BAheAFiEEBaQM/OcmnWHZcQChdH8KkDb5DfoFAmgHpowFCQlsaBoA
 CgkQdH8KkDb5DfqxDgEA81pbVLJDmpFyFZLRhAGig9rgoDY6l774yhTzRVm/SvkBAJLzpSlm
 wyQaQuB668TKOX9XvRLKFGjSq5kkdQcxqjkCzjgEYl2lchIKKwYBBAGXVQEFAQEHQCaVC8X5
 7NOv2jNbeXqjP9ekY7rzy7auiEZ5PxaDWUQVAwEIB8J+BBgWCAAmAhsMFiEEBaQM/OcmnWHZ
 cQChdH8KkDb5DfoFAmgHpowFCQlsaBoACgkQdH8KkDb5DfoK+AD/Q4aN/zUvP72RRE4cNWpM
 MXeRXg+LTN+OJ24U10LltxIA/2w3kDqMC/0t1oqO8TM+c2LMWO/x2IBkG7oRZ/hVw1QI

--------------SK00SpnVewtQaWnM5sL8g0aS
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On 11/05/2026 15:43, Geert Uytterhoeven wrote:
> On Mon, 11 May 2026 at 16:06, Matt Coster <Matt.Coster@imgtec.com> wrot=
e:
>> On 11/05/2026 14:28, Geert Uytterhoeven wrote:
>>> Revert commit 1c21f240fbc1e47b94e68abfa2da2c01ed29a74d, as it stopped=

>>> the driver from working on various Renesas R-Car SoCs.
>>>
>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>> ---
>>> DT binding documentation updates were reviewed by the drm/imagination=

>>> maintainers[1][2][3], DTS additions were reviewed and/or acked by the=

>>> drm/imagination maintainers[4][5][6], and firmware is available[7].
>>> Note that the GPU nodes were not enabled in board DTS files before, a=
s
>>> not having suitable firmware installed under /lib/firmware could trig=
ger
>>> a crash, not directly related to drm/imagination driver support.  Thi=
s
>>> was fixed only recently in v7.1-rc3[8], so board enablement[9] is now=

>>> unblocked.
>>
>> We will freely acknowledge that the sequencing was not ideal here. Thi=
s
>> patch should probably have been sent before we started accepting DTS
>> changes for those Renesas platforms. However, the purpose of this patc=
h
>> still stands.
>>
>> We're not saying we never want to list all these platforms as
>> "supported", but we don't want to mislead anyone into thinking the GPU=

>> on these platforms will function in any meaningful way just because th=
ey
>> now have DTS nodes. We were originally convinved to allow these DTS
>> nodes to be added since it would facilitate active development on thes=
e
>> platforms, but this does not mean that we as a team have the bandwidth=

>> to do that work ourselves at this time.
>>
>> Our main concern is around the UAPI: we don't know for sure that suppo=
rt
>> for these platforms (which are significantly older than anything we
>> currently support) can be correctly implemented without UAPI changes. =
To
>> that end, we don't want to back ourselves into a corner where the UAPI=

>> cannot be updated at a later date.
>=20
> Automotive life cycles are long...

Which is why those cores (that are substantially older than anything
we've been targetting so far) are still relevant. But due to that age,
they're going to have quirks (and often just different hardware blocks)
that we haven't considered yet.

>=20
>> There's a similar mechanism in place in userspace: the user must set a=
n
>> environment variable (PVR_I_WANT_A_BROKEN_VULKAN_DRIVER) to use
>> platforms for which we don't promise API conformance, but just like in=

>> the kernel, this is not a compile time option and any user and/or
>> developer can enable it if they know what they're doing.
>>
>> As for "it stopped the driver from working", no it didn't. The driver
>> never really worked on those platforms, at least not in any useful way=
,
>> and certainly not sufficiently for any non-developer user to benefit i=
n
>> any way from it. The only change is that the user must now acknowledge=

>> that this is the case to clarify that they shouldn't expect much (if
>> anything) to work. Just to be explicit, "firmware boots" is a loooooon=
g
>> way from "ooh pretty triangles".
>=20
> AFAIK, it's working better than just "pretty triangles", e.g. glxgears.=

> And people are working on support for more SoCs (both newer and older),=

> for which patches (both Linux kernel and MESA) have been posted...
>=20
> https://gitlab.freedesktop.org/imagination/linux-firmware/-/work_items/=
13

This is great! But the patches that have been posted are almost
exclusively just surface level enablement (adding feature tables,
providing firmware blobs, allow-listing compatible strings, etc.), much
like the DTS changes made on the kernel side.

>=20
>> Would you prefer a different approach to providing this information to=

>> users, perhaps a purely docs-based solution? I'm not convinced that
>> would be as effective at preserving our ability to mutate the UAPI for=

>> these as-yet-unsupported platforms.
>=20
> One can wonder if it's the kernel's job to block the use of this
> hardware by default?

Our logic was this:

 1. The kernel requires absolute stability in the UAPI
 2. These cores have yet to be tested sufficiently to be confident that
    the current UAPI can accomodate them
 3. Don't allow these cores to be used by default so the UAPI remains
    somewhat malleable on platforms without this confidence.

When we were first looking to send the powervr driver upstream, we were
given a watershed of ~70% Vulkan 1.0 conformance passing to ensure the
UAPI was _probably_ solid enough to be frozen as-is. These cores are
currently nowhere near that mark.

If we can remove these restrictions now and come back later to update
the UAPI _in a way that "breaks" these cores_ (but not really because
they don't work fully yet), then I could go for that; my understanding
is that this is not an option.

We absolutely agree that it's in everyone's interest to have
experimental support in the upstream driver rather than rotting in
downstream forks, but we need to ensure that this is done in a way that
does not lock down the UAPI in a shape that may not actually be useful
for the cores with only experimental support.

Cheers,
Matt

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------SK00SpnVewtQaWnM5sL8g0aS--

--------------3BkDSVFLCeHqlG6WvQRtP17o
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCagL6QwUDAAAAAAAKCRB5vBnz2d5qsJBB
AQDobX9fFigOAc3Smma9d2+pF3w5WOlK4GihohAR5a5msQD9FlcAR2u71CllNqdVzotIiXMOs+Jm
JjAuYz+CdcIswAQ=
=Geyo
-----END PGP SIGNATURE-----

--------------3BkDSVFLCeHqlG6WvQRtP17o--

