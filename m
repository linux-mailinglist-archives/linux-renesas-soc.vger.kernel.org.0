Return-Path: <linux-renesas-soc+bounces-32746-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IqTNhuFCmqv2AQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32746-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 05:18:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C11D565609
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 05:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BC3330177A9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 03:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF16B3803CB;
	Mon, 18 May 2026 03:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="pY5a7sid";
	dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="TKnaVVXH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com [208.84.65.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210C937E319;
	Mon, 18 May 2026 03:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=208.84.65.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779074310; cv=fail; b=bqI1irPLqGPwNDNMZBAIcAetnAVDvnKHCFXsHo+NJwK8gG4pjZqzL+JHBmhyb5cu0NVFoUQjJQJgUjrXf022NTednEpd+NrFcQ7HkaS4uBbeXrKwgLN7yICkhxG1T3Mwu03Qy5Eu2lwryNIvUdxB7GFH9FJnIU168O22pTsKkro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779074310; c=relaxed/simple;
	bh=cZ+gEMxLzADAJ3fhXE9LMUAfl7qj0JX3J9vSgnoKo54=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=l1+zFb6+z7v2dNpkFYTDgNrTySd6XDqaxpAaoGpv+hns1p7jHmHC0eQI8u18ECkuYMp9XC1VEM3+TUrrJ1jRs4ROnBYM3filf9yXvuyITtDwzW82gXa/4ULIX6aJlFoDRDbyGspz4VC0CcW3BNSj6pOb99upb+BPgm6CSuyVlGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cadence.com; spf=pass smtp.mailfrom=cadence.com; dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b=pY5a7sid; dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b=TKnaVVXH; arc=fail smtp.client-ip=208.84.65.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cadence.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cadence.com
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
	by mx0a-0014ca01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HMwTIc3059622;
	Sun, 17 May 2026 20:17:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=proofpoint;
	 bh=cZ+gEMxLzADAJ3fhXE9LMUAfl7qj0JX3J9vSgnoKo54=; b=pY5a7sidWymg
	ZS7f4FTrdzN3YBTl7e4m4MVKNPpN+ySLUi1mv3rICwXkhkpuFEbG4nkiVS7Gx0mo
	onACj8QHjdmKkH1xdANDpenkitzbHRFSDP8jVzTMvhpa7uydMHTf/5mzoSNUeVLc
	hTJbnPHc3S1zei8PCUnwOooc6MbH41NJ/zr2ptLuKsuV9xpkn+S60zHUZdmiSz48
	lgt31X19Pwr4bFcvMLgEMeP24SRPCQi6I6o5Sd/Ev/pn44duIUbEzwxd6U7UD8Qe
	n0nWnUJf/dzq36kMHVkOovElmZzgB8IwlJiWvuJ1o/8i8fqXhpVssdEItU2dhF7h
	x8UCk2b88g==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013029.outbound.protection.outlook.com [40.93.196.29])
	by mx0a-0014ca01.pphosted.com (PPS) with ESMTPS id 4e6n4scdgu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 17 May 2026 20:17:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KsJ1PgNVazT8MULG7AbrJoiV8RXqmYjdA/3qTLIhFhUWi4D7dc0Wr+zYpo05lfLm0eHkoEg0sZQjgwoG/ML9tpkbHUwLpaSfhrwffqpd6n0vwipADU3VDYN5dKWUu/cXsmwrNjpePZhV8YTmA+3rUWzU8jIOK5vxNWsf5aixI+2ObaH+8IQVnUPv9+h5guuw787mOTAPU4DLn7fP1yQRJgeDOKuiV4cHQbt/2yz/7YAx5yMz466BlJrslLd0sjt3Q+ZrdavVu2i6Ljl88uDbbZNvYTVRD4hVfKRpbgGltL0Cy43+xbgEjxdKAAtcjT9WV3D+9m+RK7xJzYLUBOgtUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZ+gEMxLzADAJ3fhXE9LMUAfl7qj0JX3J9vSgnoKo54=;
 b=S7PxBgTWaNcRkZqaoJ/IdscYyoXpV3mS2hdB809yNKircSb/ue1E/dVh/EOzDsV/KXuTl5QNqFXdwdtsHuW+NC+7UQ3776kfZYSEbFAxjjv+8x3kc0/jxzgQSAr46lAD8XjlvfGs81KU6Z04yLA9chuC4+2I6ykonjO0xk3sLccECdv5+Y/Z+ToIsqVl5J1PGb63U7Im45JjRb5H18ps6VgoMST6QLmLC1mt4YnXsbOo8ybgVFtK6CLkm7dmFKDnC8BiDN+PHsRctiG4a0yqv8BHIlWwxpeWbBi7ReYf8CUTw9MD5aORn+nUvpdwHXTaIjWU/994vatpwh1cF/jz5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZ+gEMxLzADAJ3fhXE9LMUAfl7qj0JX3J9vSgnoKo54=;
 b=TKnaVVXHwwzGSbt0usSz2YuDLwnlEHA86LZPVWsX6tS+SOi3Yc3CSDLs2we5F/qo57eZPA30YgPeGwZbfQKRsIzHEl71/k+A5r1FEk4GJvKCMrMUKzNhDH7yG8BNVeDc7QlGoBR9shCN4leoF7steKZDpaMBzJltkZlHiYqhLPdyP+Wo+H/Vn8ypgGXHDRx4pV6Pz7otWjS/futEhv+KeQeEroJ6jNB4kK/hy5L3SVwgGzBFVAQbgrHbNLUudalNq7U4oc0Ys9WzEvxxf/6fI6O6jPvU+/eBfUZ8K4eAiZNeJTbDBWh37o6V+Ldx9lFMATzTsOoe8+88Rrgg8R69sQ==
Received: from DM6PR07MB6716.namprd07.prod.outlook.com (2603:10b6:5:1c9::16)
 by BN0PR07MB8342.namprd07.prod.outlook.com (2603:10b6:408:12b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Mon, 18 May
 2026 03:17:41 +0000
Received: from DM6PR07MB6716.namprd07.prod.outlook.com
 ([fe80::2e20:ee0a:1b4:1175]) by DM6PR07MB6716.namprd07.prod.outlook.com
 ([fe80::2e20:ee0a:1b4:1175%3]) with mapi id 15.21.0025.012; Mon, 18 May 2026
 03:17:41 +0000
From: Manikandan Karunakaran Pillai <mpillai@cadence.com>
To: Hans Zhang <18255117159@163.com>,
        "bhelgaas@google.com"
	<bhelgaas@google.com>,
        "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
        "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
        "mani@kernel.org"
	<mani@kernel.org>,
        "vigneshr@ti.com" <vigneshr@ti.com>,
        "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
        "thomas.petazzoni@bootlin.com"
	<thomas.petazzoni@bootlin.com>,
        "ryder.lee@mediatek.com"
	<ryder.lee@mediatek.com>,
        "claudiu.beznea.uj@bp.renesas.com"
	<claudiu.beznea.uj@bp.renesas.com>
CC: "robh@kernel.org" <robh@kernel.org>,
        "s-vadapalli@ti.com"
	<s-vadapalli@ti.com>,
        "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "claudiu.beznea@tuxon.dev"
	<claudiu.beznea@tuxon.dev>,
        "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
        "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
        "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 2/7] PCI: cadence: Add post-link delay for LGA and
 j721e glue driver
Thread-Topic: [PATCH v4 2/7] PCI: cadence: Add post-link delay for LGA and
 j721e glue driver
Thread-Index: AQHc5l9RsT4zyZPLJEykoM7+XPboKrYTCZlggAAFGICAAAKogIAAB8wAgAADqIA=
Date: Mon, 18 May 2026 03:17:41 +0000
Message-ID:
 <DM6PR07MB67164FD00D9AF187FBE53FA7A2032@DM6PR07MB6716.namprd07.prod.outlook.com>
References: <20260518004246.1384532-1-18255117159@163.com>
 <20260518004246.1384532-3-18255117159@163.com>
 <DM6PR07MB67169B65E6B826E24A8E64AEA2032@DM6PR07MB6716.namprd07.prod.outlook.com>
 <c909a890-65cb-444f-9b4f-9482d2f71c6d@163.com>
 <DM6PR07MB6716CC48016E6D44EC5FCAB3A2032@DM6PR07MB6716.namprd07.prod.outlook.com>
 <e7143078-0c0a-4c15-a192-081f2a5a5ff8@163.com>
In-Reply-To: <e7143078-0c0a-4c15-a192-081f2a5a5ff8@163.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR07MB6716:EE_|BN0PR07MB8342:EE_
x-ms-office365-filtering-correlation-id: 52faafe8-4b1f-461c-2162-08deb48c0582
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|56012099003|11063799003|4143699003|4133799003|22082099003|18002099003|38070700021|921020;
x-microsoft-antispam-message-info:
 pzeAr5J0BLnISK3KKAqKEMv8736PnQXc0coLYMC+MmqgQzZ6VapwPNPXesdwWSpVQ9yaddBMl3VS3Sax0faFydJdPwiZ9gP09ffbFVwm89xGcF9U2qhskB1mYABMFoCFTPNdsC794J7Dv00gs4w/qJvjm0l1np3KjXkTkClonAZSwPfoQTmHoTvLEwbrm+kJ8qKxR4sOiaa68POHP+ZwIVcsBj3nWV3QYjz46n5kxtVtpCfDPxIGFG8E4UV0bZkwgO332o6tzWM56fpjYYCy1WJjBk71r3v1YyD9gkIwGLev0vVfUa4gOsruncRM9zXZ/lDGi1z+mKCR7XXudGJjlNTtR4E9YF8quQ/GiDlZmG1PuaJzaqWYuSFKE2i+bb0+chl4ltsnMucFr2s3zcru18NPXY6Z1ylQ7HPDkHX+tQtwuPLAoK00pK+VLCrZfXd83FtSWyZtF/edLxCqw0NW00GzY2AkUn1bBQDpUDJUdH+ARoBBj+ncW76ewZ/J2HV7U7P3us0vFGeuOQkOgSl+Uabhd8/mKkdDpGw9RAU/uC7MBDpXUZkLN12cQZn5bFkWNtXEeQJFLnP+9h3XcNZpmfHj2e9GT4M2zBTdaskwXq21aMFRdw89k7yCBvBrH8Yeb5BX7C5JK2+tHT56j1DjCjJux8hQAQ/QxlOM8SbUoOjo9bBCC6wZkf0sK5bDL2kl4Q0AxVIU0q57cVyFwLbKbA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR07MB6716.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(56012099003)(11063799003)(4143699003)(4133799003)(22082099003)(18002099003)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZmcvaWtNeERNWkduU2pHMGs5N2t2UGpSTzl6ZUhqNlI2UXZCa2tyNC93TXR1?=
 =?utf-8?B?RjlpYUxOS1ZpVU92bjgrSGpKU25VMit3Q2RLMFVqWlZtQXZnbGdBUEUrL3dm?=
 =?utf-8?B?WW5uSkc1bjVwOE1zRCtFU1VNYzgzeXE4clR2aFZlSEd3UWs4dnplbW45TjJ2?=
 =?utf-8?B?SkFPTnhkRlpIRWpSblphdHArS2V5emJvakhOb2x1NUluTy92ejdLUUpvQmlv?=
 =?utf-8?B?KzNnOWJLNmdkc3V2elVNTUpVbDUwQ0ZNMjh4cEVoVjNZSm5wc2xnTW9qTFNt?=
 =?utf-8?B?VzJyZ0IvdkFtcWRYSFkrL1N2di8zUTVUejlpYTZBZ1VUN0wvS3NuempDRVor?=
 =?utf-8?B?d2Evb1NrVlJoQkg0dGF4SFlrZHZFKzEvQUErcW1PcU55UEgvS0ZMWkNQWVFB?=
 =?utf-8?B?ZjVHZ0w4Z2NWU3U3dk1WTzM0U0J6cGdoMTlqd2x6cDhaZ1NOSkl0OGlzNmJ0?=
 =?utf-8?B?cmxKTnVMV1VzZ0xmUS9xb3RPMEVPQzZpWW1nN2RqckpYZUhXK2c5c1F1QU84?=
 =?utf-8?B?czRQZW15blNxK0xDaExCek9sV1V6dU1lSlVFenMxRVRueUtLa3RuN00wRTNN?=
 =?utf-8?B?VlNReEFaTFBzU21YSFljNnF4UFZzRElCL0pRUERoZko0Y0NXSkhjekt2c0tT?=
 =?utf-8?B?WTRxcWxwOVV0eDk2dWFjWDl3cmFOK3JiZ1NSNm1URWJMNDJ1d1prUit4azZw?=
 =?utf-8?B?UTdhZlkwOVREZUNvMFB2NTZHOWI4YUlaUTJEenhPemNNMm1YN3haY1plOTNP?=
 =?utf-8?B?djV1YXFLQ1lZejFzNkZxMjlWeXpVR2t2S2ptUkg2QzRyUXBTcUxocStuSHEz?=
 =?utf-8?B?NnRyMVZvNExaNnMvVlAwa0VERk1qUmRSbkJ6ajlBZkdRemxObEczTzhJNjMw?=
 =?utf-8?B?Q0dQL01KbWlMbVhSZXBDdGpIWVg4Q2x3NFFRcVFMYitSSmpMMVQ3enFINFNj?=
 =?utf-8?B?ak8yNmJWWkYrMWE4YnEzbUFlcGh2bmtNMzEwRy9qakMvYkhSM1ZBcmUrOVFE?=
 =?utf-8?B?MVh2cEpScFRTWlNITGIvRDk0bU5aSzVrY3EwWjZWWkJhUFZUUUVpc2hwYytt?=
 =?utf-8?B?NWRPUmIxcW1GRk1GVHZ0STFNdjJjSFVJZXhJeVNiLyt2cmRlTFcrVlRQSm5B?=
 =?utf-8?B?WW5GRnI4TkNaaUtkcDI1SEhIQ0IrUlRkYW40aU9VR0Q4aDYrWGwvSWtaNDVu?=
 =?utf-8?B?UE5SWHRKelhSMjM5Vm9JVTBwa3VYcUNUc0xZQWJBVWlVZ2pPZ0p2SFprN1hZ?=
 =?utf-8?B?dnBxMUZRdHlBZ3AxL1pZd25iNmtXNUx4THdpeDBJa0VQRnI4Y3FkQndzSzdP?=
 =?utf-8?B?bkRhK2RiZEFrbjY5L1ZFaSsyRzZiQ0lwVXRiaW9UUmtsMmVBM2ZTSEcwWjZp?=
 =?utf-8?B?SGExWi9Zb3BCYTNWN2I1NnpTQXc2K0RyVjhLdzMyZUEwVU1uU21LL1hENGMy?=
 =?utf-8?B?ZGRpZVZXSDRYb3YvL3dzNkxWZmo5QTlQOG9wYzJQL1AvZ0lVTUhDdHVhUFB3?=
 =?utf-8?B?cFZXcmNBVGR5dTd6Rk5GeXh0M0R1emRvRHlydGZYYlZZeE9oNkpUZmVjS0tH?=
 =?utf-8?B?a243RldZQ085eTVEbDczYW5GK29GSzZjT1dlMWlyQlNBcTdjQXdPb2hyS0ZV?=
 =?utf-8?B?TC9HbitYeE44VXQrQU9qemJnTUpsYUFmZ2kxejB2cVlmdlduZXlVL3NKdWpp?=
 =?utf-8?B?VVNadmpqdHpWWHNwSXlLWG5Ob1ZYeGo0bENVUVdHWGlVZ3AwWURZczFocXRv?=
 =?utf-8?B?UmJDNXhnejJaSlBXYWdrNGpaS3dOZUxhMTk3blpIbi9vS3JmWUFuSFJNYndu?=
 =?utf-8?B?RGdBdmsvQnN0SUlZRjNET25hT01Zam43LzVpaWZrWmtJUU13bWU5OEVhZTN1?=
 =?utf-8?B?THVtMWMvdVg0alpkV2NFNVIyalBsekdVSlBRRXlzU0JNK1B0dEpZK0NYUWlS?=
 =?utf-8?B?RzhJcWtZM0NYTXp1N0htTEROcDRQTCt1UVNwQUhpbXFWTGxIZHRJalNJUEc1?=
 =?utf-8?B?czdKUVBCeVFjY3V5WEx1RCt0RnZHdnFFMjh5anVvOUcxanFLaytQUG8vNlhC?=
 =?utf-8?B?eWNVMC9CeEdVSjRVQmFVMXZoWEl5MXJzb3hBWTB0OFBXdFA4NTlYSlhWb1Ex?=
 =?utf-8?B?dStZN3dqem9SU09UeWZsbEFuMkE2cG9SSTBwdE5FWGJ4c1J5dk5UbTE0MlBY?=
 =?utf-8?B?NXhncENCTTAvOUFGQmxIZTVpeFk2Tk9MK0tHbWpaOTY0ZU5zZGp5b2RVNFVU?=
 =?utf-8?B?Rnlra3E5eTZFUFEraWZ1c2k1TnMrN3BuVVU5dDRPYllKYkl6S3NCQkZBTklR?=
 =?utf-8?B?UzgralQzcnFaNkd6eXkvQ1R5dVFramxGaWZVMGFYSm1IWEIvUWU5dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	gxEpvVkBTro07Hm0iu3Qd93RAyZcFPdh3Bwg7kEcoiub5+mZnmVGLxY17/vG45nnAsvE5rADSHG09EsrV/6jTqVPyDFzXjkRKyJYW2IZzobimt8K6dGhcPgLhb62ETAQib7aovS+9JajNuJLD7X8WSdiQ1YZoBjerYmi06Hd8yzX9iwSeyT5nc16CQoXTdluUDWuTzCsynRSKSYlAY21tZGgRJZuqqksB/RQXtf38s/6/KE+B2/VXRx6mNwrxdv/vexiSx4KuqYL099z+lQZZm6ntZtdLJL5QPJWwgJJq0G7YNJdT+2YG+5eIED3jUyt2JWPMicMz1EbCiGqq64qtg==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR07MB6716.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52faafe8-4b1f-461c-2162-08deb48c0582
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2026 03:17:41.3747
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BtzrgQMufXKSNtv0bk4tD6u4l+mW+gCwQzcFRYnCWR63VY3eavdNiGBAPGtG+Od1p8nKhx7x5SN9YoMLQ2POVNWjqSNGBxKLl7MsMrTVprA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR07MB8342
X-Proofpoint-ORIG-GUID: KqX5hSppJS5_rxs5woJKnv4FVH2uE3cl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDAyOSBTYWx0ZWRfX28Fqo+BVmIro
 0lsBBwJuJDD/xiWCq2t1n01e1qaZKgA+ATahRYi1bEtfVVzXUQsZAeNUmHnIT/i+P+lhUprJ71f
 TdcUhqBjATKmzDfDWZN8EhSgQ/ibAwmhBUZjFyRl/FfBhHzcS88Qet3xdkFgC3ZvCv2bra3fC8N
 b1qWxN8LiVMvsGbqgJEGN6rODlr2M+U6lwxjIZ0Tln+Qu0rho7DpzwP1p8j03N8UzbvBhXrwsxN
 CVFu0qMANWB0f/kGppXbxVG9wAqk56ATdD8S0vP9bI+yavrDPeeMZrfe0UwfhjV0ZTdqVIbxa8g
 jzPk2GWoceO7KvZ7JBijRKhadQcehXFPJbJ0RbRmDsdlelgAvRMVHZaUc4JDlYGJOsBhtHvIp2k
 CMoXNqUWhZHxNDQoxfZcFSxx7vJfM/v1MGJoT7NaS0p768MVdf1z6M0alXfBp4ggK9aqeGMTpzB
 kmEf+4IG3MT2LyVoiSg==
X-Authority-Analysis: v=2.4 cv=caPiaHDM c=1 sm=1 tr=0 ts=6a0a84d7 cx=c_pps
 a=y599upwrfiZ3HV94zaFOUg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=Zpq2whiEiuAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=W8fx6O4W8wtO2w6lYej3:22 a=jPItpJ3sizTKmla2ehJN:22 a=uherdBYGAAAA:8
 a=9AdMxfjQAAAA:20 a=bht_0efDT3Bb7SAxeb4A:9 a=QEXdDO2ut3YA:10
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: KqX5hSppJS5_rxs5woJKnv4FVH2uE3cl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180029
X-Rspamd-Queue-Id: 4C11D565609
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[cadence.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[cadence.com:s=proofpoint,cadence.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32746-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[163.com,google.com,kernel.org,ti.com,gmail.com,bootlin.com,mediatek.com,bp.renesas.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,urldefense.com:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mpillai@cadence.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[cadence.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	REDIRECTOR_URL(0.00)[urldefense.com];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Pj4+Pj4NCj4+Pj4+ICNpbmNsdWRlICJwY2llLWNhZGVuY2UuaCINCj4+Pj4+ICNpbmNsdWRlICJw
Y2llLWNhZGVuY2UtaG9zdC1jb21tb24uaCINCj4+Pj4+ICsjaW5jbHVkZSAiLi4vcGNpLWhvc3Qt
Y29tbW9uLmgiDQo+Pj4+Pg0KPj4+Pj4gI2RlZmluZSBMSU5LX1JFVFJBSU5fVElNRU9VVCBIWg0K
Pj4+Pj4NCj4+Pj4+IEBAIC0xMTUsNiArMTE2LDkgQEAgaW50IGNkbnNfcGNpZV9ob3N0X3N0YXJ0
X2xpbmsoc3RydWN0IGNkbnNfcGNpZV9yYw0KPj4+ICpyYywNCj4+Pj4+IAlpZiAoIXJldCAmJiBy
Yy0+cXVpcmtfcmV0cmFpbl9mbGFnKQ0KPj4+Pj4gCQlyZXQgPSBjZG5zX3BjaWVfcmV0cmFpbihw
Y2llLCBwY2llX2xpbmtfdXApOw0KPj4+Pj4NCj4+Pj4+ICsJaWYgKCFyZXQpDQo+Pj4+PiArCQlw
Y2lfaG9zdF9jb21tb25fbGlua190cmFpbl9kZWxheShwY2llLT5tYXhfbGlua19zcGVlZCk7DQo+
Pj4+PiArDQo+Pj4+PiAJcmV0dXJuIHJldDsNCj4+Pj4+IH0NCj4+Pj4+IEVYUE9SVF9TWU1CT0xf
R1BMKGNkbnNfcGNpZV9ob3N0X3N0YXJ0X2xpbmspOw0KPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvcGNpL2NvbnRyb2xsZXIvY2FkZW5jZS9wY2llLWNhZGVuY2UtaG9zdC5jDQo+Pj4+PiBiL2Ry
aXZlcnMvcGNpL2NvbnRyb2xsZXIvY2FkZW5jZS9wY2llLWNhZGVuY2UtaG9zdC5jDQo+Pj4+PiBp
bmRleCAwYmM5ZTZlOTBlMGUuLjA1OGU0ZTYxOTY1NCAxMDA2NDQNCj4+Pj4+IC0tLSBhL2RyaXZl
cnMvcGNpL2NvbnRyb2xsZXIvY2FkZW5jZS9wY2llLWNhZGVuY2UtaG9zdC5jDQo+Pj4+PiArKysg
Yi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2NhZGVuY2UvcGNpZS1jYWRlbmNlLWhvc3QuYw0KPj4+
Pj4gQEAgLTEzLDYgKzEzLDcgQEANCj4+Pj4+DQo+Pj4+PiAjaW5jbHVkZSAicGNpZS1jYWRlbmNl
LmgiDQo+Pj4+PiAjaW5jbHVkZSAicGNpZS1jYWRlbmNlLWhvc3QtY29tbW9uLmgiDQo+Pj4+PiAr
I2luY2x1ZGUgIi4uLy4uL3BjaS5oIg0KPj4+Pj4NCj4+Pj4+IHN0YXRpYyB1OCBiYXJfYXBlcnR1
cmVfbWFza1tdID0gew0KPj4+Pj4gCVtSUF9CQVIwXSA9IDB4MUYsDQo+Pj4+PiBAQCAtMzk3LDYg
KzM5OCw5IEBAIGludCBjZG5zX3BjaWVfaG9zdF9zZXR1cChzdHJ1Y3QgY2Ruc19wY2llX3JjICpy
YykNCj4+Pj4+IAlyYy0+ZGV2aWNlX2lkID0gMHhmZmZmOw0KPj4+Pj4gCW9mX3Byb3BlcnR5X3Jl
YWRfdTMyKG5wLCAiZGV2aWNlLWlkIiwgJnJjLT5kZXZpY2VfaWQpOw0KPj4+Pj4NCj4+Pj4+ICsJ
aWYgKHBjaWUtPm1heF9saW5rX3NwZWVkIDwgMSkNCj4+Pj4+ICsJCXBjaWUtPm1heF9saW5rX3Nw
ZWVkID0gb2ZfcGNpX2dldF9tYXhfbGlua19zcGVlZChucCk7DQo+Pj4+PiArDQo+Pj4+IFdoeSBp
cyB0aGUgY29uZGl0aW9uYWwgaWYgcmVxdWlyZWQgaGVyZSBhcyBkdXJpbmcgY2Ruc19wY2llX2hv
c3Rfc2V0dXAoKSwNCj50aGUNCj4+PiB2YWx1ZSBvZg0KPj4+PiBtYXhfbGlua19zcGVlZCBpcyBl
eHBlY3RlZCB0byBiZSAnMCcsIHVubGVzcyBzcGVjaWZpY2FsbHkgaW5pdGlhbGl6ZWQgYnkgdGhl
DQo+Pj4gcGxhdGZvcm0gY29kZSBzZXBhcmF0ZWx5Lg0KPj4+Pg0KPj4+PiBXaGF0IGhhcHBlbnMg
aWYgdGhlIG1heF9saW5rX3NwZWVkIGlzIG5vdCBkZWZpbmVkIGluIHRoZSBjb3JyZXNwb25kaW5n
DQo+ZHRzDQo+Pj4gPyBXb3VsZCBub3QgdGhlIC1FSU5WQUwgcmV0dXJuZWQgZnJvbSB0aGUgZnVu
Y3Rpb24gY3JlYXRlIGlzc3VlcyA/DQo+Pj4NCj4+PiBIaSBNYW5pa2FuZGFuLA0KPj4+DQo+Pj4g
UGxlYXNlIHNlZToNCj4+Pg0KPj4+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczov
L2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi92Ny4xLQ0KPj4+IHJjNC9kcml2ZXJzL3Bj
aS9jb250cm9sbGVyL2R3Yy9wY2llLQ0KPj4+DQo+ZGVzaWdud2FyZS5jKkwxOTFfXztJdyEhRUhz
Y21TMXlnaVUxbEEhRURIVmFrRDNRTjBnR3phM1YxX19xekhnREc5DQo+Pj4gUlpscTdMekM1QUZz
WUxWMmk1RmNvdmVORnNqV09SUmdSZEhDQW1PSS1MaXpZNWNKdkdJV0JPRkpHJA0KPj4+DQo+Pj4N
Cj4+PiBCZXN0IHJlZ2FyZHMsDQo+Pj4gSGFucw0KPj4+DQo+PiBUaGF0IGlzIGhvdyBEZXNpZ253
YXJlIGhhcyBpbXBsZW1lbnRlZCBpdCBidXQgdGhhdCBkb2VzIG5vdCBhbnN3ZXIgbXkNCj5xdWVy
eS4gQmVjb3MgYm90aCB0aGVzZSBpbXBsZW1lbnRhdGlvbnMgZG8NCj4+IG5vdCB0YWtlIGNhcmUg
b2YgdGhlIGVycm9yIHJldHVybmVkLCBhbmQgaXQgY291bGQgd2VsbCBiZSB0aGUgY2FzZSBmb3Ig
bWFueSBvZg0KPnRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9ucy4NCj4NCj5IaSBNYW5pa2FuZGFu
LA0KPg0KPklmICJtYXgtbGluay1zcGVlZCIgaXMgbm90IGRlZmluZWQgaW4gdGhlIERULCB0aGVu
Og0KPg0KPm9mX3BjaV9nZXRfbWF4X2xpbmtfc3BlZWQNCj4gICBvZl9wcm9wZXJ0eV9yZWFkX3Uz
Mg0KPiAgICAgb2ZfcHJvcGVydHlfcmVhZF91MzJfYXJyYXkNCj4gICAgICAgb2ZfcHJvcGVydHlf
cmVhZF92YXJpYWJsZV91MzJfYXJyYXkNCj4gICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4NCj4N
Cj5Gb3IgcGF0Y2ggMDAwMSwgbm8gYWN0aW9ucyB3aWxsIGJlIGV4ZWN1dGVkLiBJIHdvbmRlciBp
ZiB0aGlzIGFuc3dlcnMNCj55b3VyIHF1ZXN0aW9uPw0KPg0KWWVzLCBnb3QgaXQuIFRoYW5rcyBI
YW5zLg0KDQo+QmVzdCByZWdhcmRzLA0KPkhhbnMNCj4NCj4NCj4+DQo+Pj4+DQo+Pj4+PiAJcGNp
ZS0+cmVnX2Jhc2UgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2VfYnluYW1lKHBkZXYs
DQo+Pj4+PiAicmVnIik7DQo+Pj4+PiAJaWYgKElTX0VSUihwY2llLT5yZWdfYmFzZSkpIHsNCj4+
Pj4+IAkJZGV2X2VycihkZXYsICJtaXNzaW5nIFwicmVnXCJcbiIpOw0KPj4+Pj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvY2FkZW5jZS9wY2llLWNhZGVuY2UuaA0KPj4+Pj4g
Yi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2NhZGVuY2UvcGNpZS1jYWRlbmNlLmgNCj4+Pj4+IGlu
ZGV4IDU3NGU5Y2Y0ZDAwMy4uMDQyYTRjNDliYjlhIDEwMDY0NA0KPj4+Pj4gLS0tIGEvZHJpdmVy
cy9wY2kvY29udHJvbGxlci9jYWRlbmNlL3BjaWUtY2FkZW5jZS5oDQo+Pj4+PiArKysgYi9kcml2
ZXJzL3BjaS9jb250cm9sbGVyL2NhZGVuY2UvcGNpZS1jYWRlbmNlLmgNCj4+Pj4+IEBAIC04Niw2
ICs4Niw3IEBAIHN0cnVjdCBjZG5zX3BsYXRfcGNpZV9vZl9kYXRhIHsNCj4+Pj4+ICAgICogQG9w
czogUGxhdGZvcm0tc3BlY2lmaWMgb3BzIHRvIGNvbnRyb2wgdmFyaW91cyBpbnB1dHMgZnJvbSBD
YWRlbmNlDQo+UENJZQ0KPj4+Pj4gICAgKiAgICAgICB3cmFwcGVyDQo+Pj4+PiAgICAqIEBjZG5z
X3BjaWVfcmVnX29mZnNldHM6IFJlZ2lzdGVyIGJhbmsgb2Zmc2V0cyBmb3IgZGlmZmVyZW50IFNv
Qw0KPj4+Pj4gKyAqIEBtYXhfbGlua19zcGVlZDogTWF4aW11bSBzdXBwb3J0ZWQgbGluayBzcGVl
ZA0KPj4+Pj4gICAgKi8NCj4+Pj4+IHN0cnVjdCBjZG5zX3BjaWUgew0KPj4+Pj4gCXZvaWQgX19p
b21lbQkJICAgICAgICAgICAgICpyZWdfYmFzZTsNCj4+Pj4+IEBAIC05OCw2ICs5OSw3IEBAIHN0
cnVjdCBjZG5zX3BjaWUgew0KPj4+Pj4gCXN0cnVjdCBkZXZpY2VfbGluawkgICAgICAgICAgICAg
KipsaW5rOw0KPj4+Pj4gCWNvbnN0ICBzdHJ1Y3QgY2Ruc19wY2llX29wcyAgICAgICAgICAqb3Bz
Ow0KPj4+Pj4gCWNvbnN0ICBzdHJ1Y3QgY2Ruc19wbGF0X3BjaWVfb2ZfZGF0YSAqY2Ruc19wY2ll
X3JlZ19vZmZzZXRzOw0KPj4+Pj4gKwlpbnQJCQkJICAgICBtYXhfbGlua19zcGVlZDsNCj4+Pj4+
IH07DQo+Pj4+Pg0KPj4+Pj4gLyoqDQo+Pj4+PiAtLQ0KPj4+Pj4gMi40My4wDQo+Pg0KDQo=

