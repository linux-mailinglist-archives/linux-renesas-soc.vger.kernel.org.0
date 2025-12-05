Return-Path: <linux-renesas-soc+bounces-25599-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC47CA7477
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Dec 2025 11:58:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 639F63072E16
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Dec 2025 10:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FC3E329C7B;
	Fri,  5 Dec 2025 10:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="myuEQQp7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011042.outbound.protection.outlook.com [40.107.74.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031C6317712;
	Fri,  5 Dec 2025 10:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764932249; cv=fail; b=kM39iC2fJB2D7jcMY4125EE4T1iI9MUcCKasgnPd136EhnuekMwa9eMefUYIShhfQy0zLS4qu80dlqThXe1XyBTvSgOAfTriR+VAsCaHeC0Hugb7qJRnfD+Ja9Rm9pRSErKi1bRtfvqqJeHdgqMszFWCIRm9P7mJcT+JWKu1Qfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764932249; c=relaxed/simple;
	bh=Tz/oh1SOcawaUj45SLeq4NI1uel5iJUGk89r4TvwGZ4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZiYfmtRHfYDIu6ZhjPwWpCIV30JLgHxU30OEY7EcJ/wZU+iPxenTrbERV1yPbB/9kbj0YBacpY2k0ODXby6TUf4t8tKSSp6VF/SCBUJNDe1ibEbTyFL5xEgk/U3+dcB3cRAUyA3Cqv5aKOtUSbjKL5nOFVrg6RXihujS7UZqyPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=myuEQQp7; arc=fail smtp.client-ip=40.107.74.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQZU3WDlta3TVGLF1NXu5HIPhzgrz8sLtPHNBQcDhFHnOUnFs8A9XUeX3s3YkS/VPtXPp3eyRslfbj+ta9AkQ3sjEWgBiMgkVCwak25/XMLMUzR3m/6n7qX+wEoCo4DYpt2vUZP67cIxRu9ylvgQGd+uym+WxgANOr6W1c5J7PAmSmLtx7A2mYTzDqEvdSTwK3KkGjrCNNTT701B9ztWg4x1wrr9Q2my6runKyBHrZuu8orT7GdFPdW7/mRn5WgyVSHSqSVYBbsLPn46RNrEmJAqD3NxWNa6o2H8/Z0+jWDJjqO48/rEN+03hzQa76s7dULxf81UQkLL9zLWf5fHsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tz/oh1SOcawaUj45SLeq4NI1uel5iJUGk89r4TvwGZ4=;
 b=RRGZOg4eXSS5bRh13PLMoYluO8/vj/LNWLd/9Z2vAos8rH0zXnsejpyUwOPEGnUS0wavkMi0PQcoP+T8zVgYEqUDaL0aiXkTFhAqZi0btYAc6XssTaCD47Ts3ffS1dMHbaPlQrb9N+h/FfdAw4z/HlZDUzusmtND8SlYuoNOCJLMHn6k+LR/3r8krvjgWS7G3u65VIxm78SEBletnRk2K5nFtWwQKEvn+7qCBH+9xnEK+W5pZ96/Fv+yPIwUGqYuV++NTXIUn40RXU9ovOZ83jG8GUZF4wheFuvUF1YPo6BO5c6suqXznkrzk6ozdKHQv8y4/Y+hFY3KbftzY8h5Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tz/oh1SOcawaUj45SLeq4NI1uel5iJUGk89r4TvwGZ4=;
 b=myuEQQp7XYzlLB++VygfIu7OFnAcmIIgC+sjvhi5oOTTyjV9bWk97h4ltbhNK9O4TcZUjqqu94AZ0DOQJ8eRPvUBjv+qSMGzyPVjEzUdyqPmlx1rlS/xguxlpmLtqJNr5rwJotBkSg8ht+Rhs45eoRP0+XkihZQrNAaUVYpWDIM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB11983.jpnprd01.prod.outlook.com (2603:1096:400:3fd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.3; Fri, 5 Dec
 2025 10:57:18 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 10:57:17 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v2 0/2] reset: rzg2l-usbphy-ctrl: Add suspend to RAM
 support
Thread-Topic: [PATCH v2 0/2] reset: rzg2l-usbphy-ctrl: Add suspend to RAM
 support
Thread-Index:
 AQHcUkXayA+E33hY1EmsX/GuWX+dybUR8j8AgADxDfCAABPzgIAAA2hggAAJoQCAAABcgA==
Date: Fri, 5 Dec 2025 10:57:17 +0000
Message-ID:
 <TY3PR01MB11346820489C604B63A315E8486A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251110132715.724084-1-claudiu.beznea.uj@bp.renesas.com>
 <19fda177-6c11-45d6-9dab-3f75edceda4e@tuxon.dev>
 <TY3PR01MB11346F5E49BF172AE78C55EAE86A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <50937606-46fd-4202-ad4b-9ede5bff76fc@tuxon.dev>
 <TY3PR01MB11346625CD598704CC36C63AE86A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <da64005a-e6fb-4bbb-a97c-e6c3ada8aff1@tuxon.dev>
In-Reply-To: <da64005a-e6fb-4bbb-a97c-e6c3ada8aff1@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB11983:EE_
x-ms-office365-filtering-correlation-id: 356cefea-9da5-4983-167e-08de33ed0e88
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?a1Jkd1JMaE5MQ0hJWkN4UWNzZkVpcnpJMTBuVnBxZ0RNd29aamh3eWVuQjlL?=
 =?utf-8?B?Q0dnTEw5ajBnRHZ0L3lLa3p5VEZsRllyYzJBNmNVL3I4Z1JldVhtZ3B3bjNR?=
 =?utf-8?B?VDZOclMwdHRhdkJMRy9ocGR6UUhhYm9uMURzTmZ5SXR5Q2ZjMWY0UnljQUdS?=
 =?utf-8?B?RnJUUEl4VWNqTVlnU3psRnorN2JDYkp2cDJlekdXM0E4VjZldkZ0Y1dHKy9M?=
 =?utf-8?B?bFc2b0FmOHQ5QkZkREVwNnV5eWNTTkZYRDdQMEE0N1RjWDVoeFBDdmNSVDIv?=
 =?utf-8?B?VzJBVVdnQUROZ0lTR3FtOG9jT3RUUHczWnBYOW04Y25lbHl3T1JMdkFZcCt1?=
 =?utf-8?B?R0JSVXJ2SC9QNnVaUzhzcFN5ODhGbjFDUjgybzB3K0VkUThPOHNsUEhqa1Zq?=
 =?utf-8?B?OHlzTFVaUms4ZFBnY0dEek5sSmZDRTQ5VE1xMkFSQ1dZMGJlODVlQ3piVW04?=
 =?utf-8?B?T1ZnNXZvNU85czBiR05mNnYyWGFGWEttL2xpNTVOeGdVN2N6eFB3SmtrdHJK?=
 =?utf-8?B?Z0UwYm9UZHNPUWRmOCsvRHlwYnc3dnByRWc1SU5LNHpVQUtrTDV3ckJXOUkx?=
 =?utf-8?B?dER5ZkFpYUgrWVN1YlJsb1dVa09vQ3RnakxzRTd3WVZ5T0d5RGRoekZyR2h4?=
 =?utf-8?B?d1lBdzcxK003eDZCT3k5YjFPOGZlTjNGUDVuRTkzYVJJN082YmkrUThhYjA4?=
 =?utf-8?B?dXBYRlpSNklwL1M1Um4yZk41eXllSTlUZzBzcXZaazRlSVIvelZ3R1NGL1JX?=
 =?utf-8?B?SDF3N1NWTXRiZXZYZTVHRkJmdFZjWkFwRGtqZDZJRzN3Qmdyc0JFcE5FKzJV?=
 =?utf-8?B?VG42Y1A3Mm15T1I1dGxEbXhucjMxb0ticTJSaTFaaEJwMHUxRHplaTVzZmQw?=
 =?utf-8?B?ZlNiOWdBRkZQOUVzRklLRnhYOXZ3cEpvL1MyRkU5UFl0OHUxclBHVjl5OUFP?=
 =?utf-8?B?K3RYcWZLWEJldGxnREtYcCt2MlUrVXFsaVcxeXNYKy9kaGdMSmFkYkUrazlW?=
 =?utf-8?B?VzFHUlJ3dXdkSjIwUlVkcmxkNmlQaUdBbnJuaHc3NHhoMmlwYnljdytIVmlj?=
 =?utf-8?B?TkdXTXBzVUtmTlFqWVdHSjU5SkY2Mm4yZjVIZXNUNExhZ0xxNnluUFpRRGtt?=
 =?utf-8?B?bG04OVd0UVBEa3pUUnhGbTJXTVoyVldESGo2bWZnQm5TRm02TVdaODN2V3NS?=
 =?utf-8?B?c0sySS8xSlo5R0lrMjA2NDRZd3A2QnhuWXppSnVpbGJXQWxXT05vV042eGU4?=
 =?utf-8?B?dHp4N0Era2d2VitYRFZRNmtXTnVYb1l6NS9NaVUzd0Z1MUtMZ2k5cWxlL3Jn?=
 =?utf-8?B?NmZHcDlCU09HeURGeVlBN0IvejgrdytSdVRnSWxneUNYM2gzVkhlVUpSR0NL?=
 =?utf-8?B?RjRTb3VRdkRHWlhNeUlMdGlzSlZORWk1REhqSU1BWFpubGlQNWtBSlNPdVAy?=
 =?utf-8?B?cDg0RmJIVzIzay9OVlRLWFlvU25ycVo5dXlqbnZtREh2eTVWZlcrMUJSazFO?=
 =?utf-8?B?WnNJemRBTEZJa21vVEhWZ1BoVysyYmpkVkVOME5wTllwd0wwWHhTTEpRWi80?=
 =?utf-8?B?S3ZURjdydjBybk5YTFBLblFuOS9weGhsakNyUUFEbG5jWS9WQmpFTVVxcEVL?=
 =?utf-8?B?anVmM1BtTy9pUU14amgxMWNaZkVSNDZLNURlbEVXSmpYQUZENmZ5YUVWc1VL?=
 =?utf-8?B?T0ZnMHFTaStpK1N3Nmc5dUxvT3hwR3FHSVY0SmFJMXBGRXREWSttYzFORWtJ?=
 =?utf-8?B?MHZQRkc1YWtDRmcxaDBsbUhQUGxFaVJVeVM3UWJqZ0ozVUd6V3JDbC9WcVpM?=
 =?utf-8?B?RURMelROc2NEZURxSXh0eUo4eHRYS0FsWXVjQkJINjMrNWs4WTRhRmlLWVRO?=
 =?utf-8?B?ZW9waFBHdzZOYkRWeVExUlIvc2MvS1laRDFUOVpCSUtacmVobDJLNzFLckVo?=
 =?utf-8?B?Wi9WdXlTL3BVaCtvSnU4WHpKb3RQTWR5TURqbUxHYXBpZElmQVZwS2NKSUNW?=
 =?utf-8?B?L015NEdVT3dtVFYrM1poMExzcXQ3YzVHdjRYUnV4Wk9jSnNJOUU2OVcxNWdT?=
 =?utf-8?Q?Fz+Xc4?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WDgrWmljcFdLWmdsTTB1NnlWR1VnblM3SmdtaHlLUVVNS1JaRzh2bVFDVE9h?=
 =?utf-8?B?MkpHN1ZKUU9nbTR2SVMxdXV4ZmNrY2UyQTROcWdwczVydXpGY1JxVDU0aWZK?=
 =?utf-8?B?Sk1tVytyRjF2Ump1R0lmbC92eGtpa1FjdHhWWm8wT0JyTG5KWGdkQU5MUnhr?=
 =?utf-8?B?WXBpK1dWSWRDajZRRGsvRnhINys3MUsvZGxFenNmREk4eWtjdnRTNkRRcisw?=
 =?utf-8?B?dERoQ2RRVnZkSGppRlE2cllpT0RoaFk3eEFnbFVQd3E1SFNyOW1PdnJvV3V1?=
 =?utf-8?B?UStCNThXRUVBczRXNnM3UHhLaHowRU5iVjhyNXZzM2Q5R1ZIblZEUmlUcFpU?=
 =?utf-8?B?VzFGOHArZ05MSmxybEFaRGdleVo3WUJTelh1OFQvaCtuZXZtSGxkT2ExeE52?=
 =?utf-8?B?VHJNcHFXcUZhOVRBd1VqVnFtV2NPSTlzZFYyUkt6K1VzUmZPV24xend1Z2pS?=
 =?utf-8?B?bUFrSVBwNGpZc0YwbFRSZGxibGs2Q2JlWCs0Vndua1lRU3cveldralIwZFV1?=
 =?utf-8?B?a2M1eDdMdFd5SVFCZkhMSGtxN2dZdXo5ZHlXRHY3SEpQL05aQUw5ZkorSUcv?=
 =?utf-8?B?VHZ6ZHJYZ0FuMDFXZFN2OUJyUnlKSkFyYkl1dGRyK09vdG1hcXFZY2hkNTJD?=
 =?utf-8?B?ZnhaSVdCK0VGQ05rcEFKVEhVSHpYZEFKdzJaSEVmbldHM2ZlVW42TjhMU1pr?=
 =?utf-8?B?QkRnMzF6QTI3Qlp1cVZsMThodFc5SnJrZmJldGxCci9LdksvLzU5L2VCZy84?=
 =?utf-8?B?RjUxbHBBN0V6VU5sbUROeXd4eGNBdTNBdHN5Mnp5NTFjQmdZYlZVOE0yNFZU?=
 =?utf-8?B?Q3RCc2V1ZFBPNUFQUWpURk5xRk9sKzBLWkN0YkJCSlAwLy8zM21SRlh5Slda?=
 =?utf-8?B?QVZoZ203OEQ4MldsOVpKRFJjUXB1cDl2ZTJxVDI2MmpLRlRySk5tQm5hMUtX?=
 =?utf-8?B?b0RVbzl2RXJLK0x0bks3cllWNTQ1Wnp2OUtHazFVWENvbGRJdTM4eCtQNFRv?=
 =?utf-8?B?VHV1cVJ6R0llYTBla0lIVnNvMHJsenphSmcvZVRidGd3eE9BejZYcThFbktN?=
 =?utf-8?B?VGtMRUNncS9FcHVQdDR0UjhObVNCSWlFMW94MGt6ZWVhMjNmeFlZOEtXbjBD?=
 =?utf-8?B?VmdwbFlaR05TZXhIb29aby81VnE5M2xHMDRnM3E1ZUNrV0IyOGhCV3N6WmRo?=
 =?utf-8?B?RGllU0RrNWk0K0NsN1ZHOWxRaFJjRUJIZzVoN2dwb2Z5Q1pLNmllSy96T1Nw?=
 =?utf-8?B?MDJhak0veGYzZ01BQmREQmRDVlZ2ZTZSVElIMXp4NkZtMUx6bk1FR2ZaUUly?=
 =?utf-8?B?em9KUzNZMzI3cWltM0lTMlZyRlFWMHBnV1g5MEJCbEVPREppbHJScFVXbGJS?=
 =?utf-8?B?R08yeXIvWVpCeXk1ZEJTTnMwblZhV0VlNGFBS051QXdOaFg2YThOYjc2OGNy?=
 =?utf-8?B?TnVPaHpGZm9PNmtUT2xuSjBZZDl5M09FQ1RaSmtELysyTHFpUkFlRU9xaENI?=
 =?utf-8?B?cjlvWnY1RnpnZFg4ZTRXSzdLSHFlU1lMRHdyZTRnRFZmQWdUYlJBRE1TbEhR?=
 =?utf-8?B?c25BbFNselUvVTJvbmFuTTlQUm1LVUpTQWYvRkNXdjRuZlFkdmgwd0gwa1hS?=
 =?utf-8?B?Ny8zZXZYSDhnZVdQc0dROUtaUVcxV1Z6ZWRxd2lSOHVDbUEwamNtdjg3WVBv?=
 =?utf-8?B?RFZ6RlN6Um9JRzJPL0tycDNyeFkrL3ozNktqTHFRSmRyc2k5dWk3RzZ1YlJF?=
 =?utf-8?B?NjZmeW9yUGpyT251cjAveWpqcDlSZXFQUXpxTy9wd0hXeEJ3aThLYWdaSmgx?=
 =?utf-8?B?SUNYTlRTL3pJeHBoN0VpMnZoNUkyc25JeE9qMmw1ZnlpWFBEVTFacFl4aXNB?=
 =?utf-8?B?NldoS3Q2UklCbTFndGl2S2ZWSE45OFBXYVdCMUtTRnZjRlcya2o3NW5ESS9o?=
 =?utf-8?B?MDk2ZG93dDVwaFZudTMwR3hlTU1vdVVXbGl6ZlRTK0JHNExURFJSWWR0T2xi?=
 =?utf-8?B?Uk9DMnQ1QklpMGNTYVJtNnpWMTljOHBsTVdBUFduZnZEVGpWL3pVK1ByM0JH?=
 =?utf-8?B?UGZxL09vdVRmd25uQ1Ewbm5xdXdnOUl2b25zVWRIOWtLWnh4QjR1c0RZNDNX?=
 =?utf-8?B?T1NkOHhvc0Q2VXBXM3dTdGFoVCswNU5FYTA0MDRCU3F5U0JKdWN3Y2dHNVQv?=
 =?utf-8?B?NEE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 356cefea-9da5-4983-167e-08de33ed0e88
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2025 10:57:17.7030
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QxKgvYLY9qbT5RbCOzVJxhd8GDiX/DXbXI7UGMYHnSJtG19T/tXouNUcVpVDUznfKb5lD31vInAYVEGLkxNYGyb+Z/bxEkLXNwlvhTfO6Q8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11983

DQpIaSBDbGF1ZGl1LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IENs
YXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+DQo+IFNlbnQ6IDA1IERlY2Vt
YmVyIDIwMjUgMTA6NDcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAwLzJdIHJlc2V0OiByemcy
bC11c2JwaHktY3RybDogQWRkIHN1c3BlbmQgdG8gUkFNIHN1cHBvcnQNCj4gDQo+IA0KPiANCj4g
T24gMTIvNS8yNSAxMjoxNywgQmlqdSBEYXMgd3JvdGU6DQo+ID4NCj4gPg0KPiA+PiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5i
ZXpuZWFAdHV4b24uZGV2Pg0KPiA+PiBTZW50OiAwNSBEZWNlbWJlciAyMDI1IDEwOjAwDQo+ID4+
IFRvOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+OyBwLnphYmVsQHBlbmd1
dHJvbml4LmRlDQo+ID4+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC1y
ZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmc7DQo+ID4+IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1
LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT4NCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAw
LzJdIHJlc2V0OiByemcybC11c2JwaHktY3RybDogQWRkIHN1c3BlbmQgdG8NCj4gPj4gUkFNIHN1
cHBvcnQNCj4gPj4NCj4gPj4gSGksIEJpanUsDQo+ID4+DQo+ID4+IE9uIDEyLzUvMjUgMTA6NTMs
IEJpanUgRGFzIHdyb3RlOg0KPiA+Pj4NCj4gPj4+DQo+ID4+PiBIaSBDbGF1ZGl1LA0KPiA+Pj4N
Cj4gPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+IEZyb206IENsYXVkaXUg
QmV6bmVhIDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+DQo+ID4+Pj4gU2VudDogMDQgRGVjZW1i
ZXIgMjAyNSAxODoyNg0KPiA+Pj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMC8yXSByZXNldDog
cnpnMmwtdXNicGh5LWN0cmw6IEFkZCBzdXNwZW5kDQo+ID4+Pj4gdG8gUkFNIHN1cHBvcnQNCj4g
Pj4+Pg0KPiA+Pj4+IEhpLCBQaGlsaXBwLA0KPiA+Pj4+DQo+ID4+Pj4gQ291bGQgeW91IHBsZWFz
ZSBsZXQgbWUga25vdyBpZiB0aGVyZSdzIGFueXRoaW5nIEkgc2hvdWxkIGRvIGZvciB0aGlzIHNl
cmllcz8NCj4gPj4+DQo+ID4+PiBJZiByemcybF91c2JwaHlfY3RybF9zdXNwZW5kKCkgZmFpbHMs
IFdoYXQgaXMgdGhlIHByb2JhYmlsaXR5IHRoYXQNCj4gPj4+IGl0IHdpbGwgc3VzcGVuZCBhZ2Fp
biB3aXRob3V0IGFueSBpc3N1ZQ0KPiA+Pg0KPiA+PiBIb3cgY2FuIEkgbWVhc3VyZSB0aGlzPw0K
PiA+Pg0KPiA+PiBUaGUgaWRlYSB3aXRoIHRoaXMgY29kZSB3YXMgdGhlIGZvbGxvd2luZzogaWYg
YW55IGluc3RydWN0aW9uIG9mDQo+ID4+IHN1c3BlbmQgZmFpbHMsIHRoZSBzdXNwZW5kIGlzIGFi
b3J0ZWQsIHRodXMgY29kZSBpbg0KPiA+PiByemcybF91c2JwaHlfY3RybF9zdXNwZW5kKCkgaXMg
dHJ5aW5nIHRvIHJlc3RvcmUgdGhlIHJ1bnRpbWUgc3RhdGUgb2YgdGhlIEhXIHNvIHRoYXQgbm8g
cnVudGltZQ0KPiB1c2VycyBvZiBpdCB0byBiZSBhZmZlY3RlZC4gVGhpcyBpcyBhbHNvIGhvdyBj
b3JlIHN1c3BlbmQgY29kZSBpcyBkb2luZywgZS5nLg0KPiA+PiBzdXNwZW5kX2RldmljZXNfYW5k
X2VudGVyKCkuDQo+ID4NCj4gPiBUaGUgZW50aXJlIHN5c3RlbSBzdXNwZW5kIGlzIGFib3J0ZWQu
DQo+IA0KPiBJc24ndCB0aGlzIHRoZSBjdXJyZW50IGdlbmVyYWwgYXBwcm9hY2ggYWNyb3NzIGRp
ZmZlcmVudCBkcml2ZXJzPw0KDQpPSy4NCg0KPiANCj4gQWxzbywgdGFrZSBpbnRvIGFjY291bnQg
dGhhdCB0aGlzIGNvZGUgd2lsbCBzdGlsbCBiZSBleGVjdXRlZCBmb3Igc3VzcGVuZCB0byBpZGxl
LCB3aGVyZSBwb3dlciBpcyBub3QNCj4gbG9zdC4NCg0KT0suDQoNCj4gDQo+IEFsc28sIGZvciBn
ZW5lcmFsIGNhc2U6IGlmIHdlIGlnbm9yZSBhbnkgZmFpbHVyZSwganVzdCBiZWNhdXNlIHdlIG1h
eSByZXN1bWUgZnJvbSBhIHBvd2VyIGRvd24gc3RhdGUNCj4gKHdoZXJlIExpbnV4IHN0YXRlIGlz
IHByZXNlcnZlZCBpbiBSQU0gYW5kIG1vc3Qgb2YgdGhlIFNvQyBwYXJ0cyBhcmUgcG93ZXJlZCBv
ZmYpLCB0aGVyZSBhcmUgcmVzb3VyY2VzDQo+IHRoYXQgYXJlIHJlZmVyZW5jZSBjb3VudGVkIChl
LmcuLCBjbG9ja3MsIHNvbWUgcmVzZXRzKS4gSWdub3JpbmcgZmFpbHVyZXMgaW4gdGhvc2UgY2Fz
ZXMgd291bGRuJ3QNCj4gbmVjZXNzYXJ5IG1ha2UgdGhlbSB3b3JrIGFmdGVyIHJlc3VtZSBqdXN0
IGJlY2F1c2UgdGhlIHN5c3RlbSByZXN1bWVzIGZyb20gYSBwb3dlciBkb3duIHN0YXRlLiBUaGUN
Cj4gcmVmZXJlbmNlIGNvdW50ZXJzIG1heSBub3QgaGF2ZSB0aGUgcmlnaHQgdmFsdWVzIGZvciB0
aGUgcHJvcGVyIHJlZ2lzdGVycyB0byBiZSB1cGRhdGVkLg0KDQpPSy4NCg0KPiANCj4gPiBTZWUg
dGhlIGNhc2UgMiBpbiBsb2dzWzFdIGFuZCBzeXN0ZW0ga2VlcHMgZHJhaW5pbmcgdGhlIHBvd2Vy
Lg0KPiANCj4gQ2FzZSAyIGluIHRoZSBwb2ludGVkIGxvZ3Mgc2VlbXMgcmVsYXRlZCB0byByZXN1
bWUsIGFyZSB3ZSB0YWxrIGFib3V0IHN1c3BlbmQsIHJlc3VtZSBvciBib3RoPw0KPiANCj4gQWxz
bywgY2FzZSAyIHBvaW50cyB0byBhIHJlc3VtZSBmdW5jdGlvbiB0aGF0IHJldHVybnMgZXJyb3Ig
dy9vIHRha2luZyBpdCBpbnRvIGFjY291bnQuIFRoZSByZXN1bWUNCj4gY29kZSBwcm9wb3NlZCBo
ZXJlIHRha2VzIGludG8gYWNjb3VudCBhbnkgZXJyb3JzIG9uIHRoZSByZXN1bWUgcGF0aCBhbmQg
cHV0IHRoZSBIVyBpbiBhIHBvd2VyIHNhdmluZw0KPiBzdGF0ZSBhcyBvdGhlcndpc2UgaXQgY2Fu
J3QgYmUgcnVudGltZSByZWNvdmVyZWQuDQo+IA0KPiA+DQo+ID4gQWdhaW4sIGlmIHN5c3RlbSB0
cmllcyB0byBkbyBzaHV0IGRvd24NCj4gDQo+IEkgZ3Vlc3MsIGhlcmUgeW91IGFyZSB0YWxraW5n
IGFib3V0IHN1c3BlbmQgd2l0aCBwb3dlciBjdXQuDQoNCkl0IHdhcyBhIHR5cG8uIFN5c3RlbSB0
cmllcyB0byBzdXNwZW5kIGFnYWluLg0KDQo+IA0KPiA+IHRoZSBzYW1lIGRldmljZSB3aWxsIGZh
aWwgYWdhaW4gaW4gc2ltaWxhciB3YXkgYW5kIFRoZSBzeXN0ZW0gd2lsbA0KPiA+IG5ldmVyIGVu
dGVyIGludG8gc3VzcGVuZCBzdGF0ZS4NCj4gDQo+IEZyb20gbXkgcHJldmlvdXMgZXhwZXJpZW5j
ZSB3aXRoIHN1c3BlbmQvcmVzdW1lIGltcGxlbWVudGF0aW9ucywgSSBjYW4gc2F5IHJlc3Rvcmlu
ZyB0aGUgc3lzdGVtIGluDQo+IGZhaWx1cmUgY2FzZXMgaW4gc3VzcGVuZC9yZXN1bWUgb3Igbm90
LCBpcyB1cCB0byB0aGUgc3Vic3lzdGVtIG1haW50YWluZXIuIFNvLCBJJ2xsIGxldCBQaGlsaXBw
IHRvDQo+IGRlY2lkZSBob3cgaGUgd2FudHMgdG8gZ28gd2l0aCBpdCBpbiB0aGlzIGRyaXZlci4N
Cj4gDQoNCkFncmVlZC4NCg0KPiBUaGV5IGFyZSBzdGlsbCBzdXBwb3J0aW5nIHN1c3BlbmQgdG8g
aWRsZSwgd2hlcmUgcG93ZXIgaXMgbWFpbnRhaW5lZCwgcmlnaHQ/IFNob3VsZG4ndCB3ZSBjb3Zl
ciB0aGlzDQo+IGNhc2U/DQoNClllcywgSSBhZ3JlZS4gUHJvYmFibHkgYmVzdCB0aGluZyBpcyB6
ZXJvIGZhaWx1cmVzLCBpZiB0aGVyZSBpcyBhIGZhaWx1cmUgaW4gc3VzcGVuZA0KcGF0aCwgdGhl
IHNhbWUgZGV2aWNlIHdpbGwgZmFpbCBpbiBzaW1pbGFyIGZhc2hpb24sIGFuZCB0aGUgc3lzdGVt
IG5ldmVyIGVudGVycyBzdXNwZW5kIHN0YXRlLg0KDQpTbywgcmVwb3J0IHRoZSBmYWlsdXJlIGFu
ZCBkZWJ1ZyBhbmQgZml4IHRoZSBpc3N1ZS4NCg0KDQpDaGVlcnMsDQpCaWp1DQo=

