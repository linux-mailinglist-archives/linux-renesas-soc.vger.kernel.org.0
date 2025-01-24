Return-Path: <linux-renesas-soc+bounces-12483-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F17A1BC2F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 19:33:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1F2D7A4334
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 18:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9B521ADB0;
	Fri, 24 Jan 2025 18:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="khbB+pBc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010047.outbound.protection.outlook.com [52.101.228.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAC021A449;
	Fri, 24 Jan 2025 18:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737743510; cv=fail; b=m6rilxbPzlSbG1xloA9iZGSU+Dnf+Qz/sbZGC918QgRXpLYro2A+GgNsPXmNxTr2z/L/1LOZdHLsu/2PU+dwIKV/208ph/HqxpUCLsy3bXOa0cVgDGaegT48sLcfkib5kO6L/3DxbyZxygiPn7uTo43Hu2x7m+CepZYkWh26r/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737743510; c=relaxed/simple;
	bh=92Eu5wx+2Ww32q06JdcBDq2l9P8OvgYvCxf0oRHqwz0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WPCLmq3jDlqW9zr7Yq+n59lLxK26NpJuoDlTe7U0PZsO8N65GAbPXnlEWfNZOHfVqfArniwtJbeti81AOhmenvZG2hOhue+C/aiVcpetgMFZPpeZVRMvtoCoKrAOEx788uA4FI2dk7WxAwEo7OmI9x5itUzTMwVkD5Xfh4yXAyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=khbB+pBc; arc=fail smtp.client-ip=52.101.228.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iqk9YzKGCxs6OrdlfJmp4VIg652e/wlgr9+6jxZRQw/L8unhovOX7jDTHAm1M5L//Jrat3Amaa9v4/jXAa/2FtQbrqvLAMz941owSomjg3k8v6IU5VhJOClvqp3mlbnAC6+Hbo7B3BU2KgLyXGQOLPHtKNniyoqw2UZmp49QxHjnaZXxgyjJlLn7h8YMUgGV/y+qmIOsfJQvLZ/uOYpymAwG0iO6iMyC6XPmwiPVD924mQ8P/h4MLzO6Zbbqyl4ztfS7aL8vHutT/kMd+FI33YJKLXkgob6vEjeHApsr7lX6kEg1urh0mZI3bXCTUGId8Gg+dCIsTNj9ALL4SNrI3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=92Eu5wx+2Ww32q06JdcBDq2l9P8OvgYvCxf0oRHqwz0=;
 b=cFXBejk+AZTwe2LONBHVUay5t/VJmmigqWldPce0s1H9+Mr3Lp2w0MpDDa2NPTg9q1/Tlupjh30fvJ4TfaH98kSVnh5m3+xo8sVOAr2pXF8C97YEDl6RCnUkMEj4GadzqLzqrbv3tAgs9VWqfer0iWRCxAM49kFULVIacLcxQX8Xac5tFXa8mEoxJZjktAsN8BKlGOcQjypVNW6WkvJuo4MgYhp7zn7+S0Mh0ZmEqMomvQbYMVu9+AafGmzo7uR0dbQqIjEQ7r/806rwjMJmBs47pQ9JUyxZae3juaxWtk/UlT9lwvQ+4Xc113crjs6kpUt+Z+ATwM7WfNnkkkemtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92Eu5wx+2Ww32q06JdcBDq2l9P8OvgYvCxf0oRHqwz0=;
 b=khbB+pBcnXG5FlkV8Ef7t8lnQ4WBHNpxcHd8fmRjOES10AaEYmThrR0jt9LNZwooKwmHBdueoqLIE+n5jOrMLBtae4a+B5MOHw/lx5zI5j9a3hL4VS3570VMogJGTI86Qzw5b1HQip6i6ouYxToE/hB/6zkPWaZKRu1SHcxkfq4=
Received: from OSBPR01MB2775.jpnprd01.prod.outlook.com (2603:1096:604:13::17)
 by TY3PR01MB11873.jpnprd01.prod.outlook.com (2603:1096:400:404::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Fri, 24 Jan
 2025 18:31:43 +0000
Received: from OSBPR01MB2775.jpnprd01.prod.outlook.com
 ([fe80::54f7:9a51:ae47:185b]) by OSBPR01MB2775.jpnprd01.prod.outlook.com
 ([fe80::54f7:9a51:ae47:185b%5]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 18:31:43 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "john.madieu@gmail.com"
	<john.madieu@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "magnus.damm@gmail.com"
	<magnus.damm@gmail.com>
Subject: RE: [PATCH v4 5/9] soc: renesas: rz-sysc: Move RZ/V2H SoC detection
 to the SYS driver
Thread-Topic: [PATCH v4 5/9] soc: renesas: rz-sysc: Move RZ/V2H SoC detection
 to the SYS driver
Thread-Index: AQHbbbkUxKIE9M0d+kGZpaRgY3IdFLMl+wGAgAAsB1A=
Date: Fri, 24 Jan 2025 18:31:43 +0000
Message-ID:
 <OSBPR01MB2775A5EE446F4650B7A16997FFE32@OSBPR01MB2775.jpnprd01.prod.outlook.com>
References: <20250123170508.13578-1-john.madieu.xa@bp.renesas.com>
 <20250123170508.13578-6-john.madieu.xa@bp.renesas.com>
 <CAMuHMdW2tGHaxzyLU3CLHA61W2mg-L85Gx24TBRMZdUDLNpc-g@mail.gmail.com>
In-Reply-To:
 <CAMuHMdW2tGHaxzyLU3CLHA61W2mg-L85Gx24TBRMZdUDLNpc-g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSBPR01MB2775:EE_|TY3PR01MB11873:EE_
x-ms-office365-filtering-correlation-id: 588d2a11-2c72-41d6-667a-08dd3ca559d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ajdQVGNPckllVDYvRC81UzZtUUlha1FJRDRmT0ZWd2Zrb00yb1pjWGxnT2Ry?=
 =?utf-8?B?WG9HMlhhQWcrcmZRTGdtMWJmNGJMMUJOUlpxZWZ1ODJ3azVkQzBYRjFOVWx4?=
 =?utf-8?B?eEY4MmlGQjhVUXZobVdxdkxsWUczWlBEeXQ3dE9LYTBLMk5CQTdRRHErWnph?=
 =?utf-8?B?OGZYbDczN2Vub1A4ZndNazY5cHUrYm1IL2dHYUFOLzhpY2lCeEJjQzJXZWQ2?=
 =?utf-8?B?VmhVOVVta2F3S25QYlJuY2RJTDY5b3JLRjJ6REtsSVovMnpYT2JsclFScjl4?=
 =?utf-8?B?aTl2SDNQV0ZpVmhsdzV4ZUpyYURnTGpIRkdORklzVktQRHN1TENzbTloQ2NQ?=
 =?utf-8?B?cGRrQTg1cDdFd3FXK0o1cHNhOUhvcVJVL01lV1BmN3FzakJydHArZ3lnRUxz?=
 =?utf-8?B?WC9GNHhoZzRPaEtMUzY1OU5UZlF1Q3I0WW41bWVYdk9SbTkwcE5QN3UxbWMx?=
 =?utf-8?B?ZUs2MWpmRVk2c3RQYXVDc1UwNm9pcGdiWFcxSGoxZDVJS3UzbktEUmh1TUU3?=
 =?utf-8?B?TmxxVE56K3pJWmVhVmpPQUFyRGVCUTRKWUZEcDBCeHFhV3pMVVhYaWlaOHEr?=
 =?utf-8?B?N1VHK0YrOC9JRWdBZTAxVkpsWS92NUZlL3Y5TVZ5NXorSzc3K285OFFKdWhr?=
 =?utf-8?B?VEhlYWRSdUZZdHc5L1JpVmJXMG1vdHA1V2VmS21IWk4vSHFjQVU1a05uWGFu?=
 =?utf-8?B?MjlPOFF0a21BSTNjVzlVRzBVRkNnMVhhMGR4eTJrclRFNTBBc3F3dkt0TXdW?=
 =?utf-8?B?RGZLbk1tZVNyWWh0ZkRDcURWZGViL2FLMkdQZUswa3BuNzF6M21ucVdhNUJH?=
 =?utf-8?B?eHpwZStjc1ZiaW5TazlLRm1ndEVKTG9RaHU1Q3hGU2JFZXhtNk9JK1I4bzdZ?=
 =?utf-8?B?ZXd4c1RkaURoWVFtL0hsVXErcllUS2FxR2pkS21yOWpjV3AzS2Vob2sxeko0?=
 =?utf-8?B?NzRTZEZVNFpBbkdwTFYxMTArK1I0WC9pd2k1VnR4Y3NDSlVTZ0oyUERYTFdv?=
 =?utf-8?B?aGhkN0hlLzAzNVRBbWpINGpWRjhEMXV6R3pLZlMvUDE1VUxkQUdYVXphUStG?=
 =?utf-8?B?RVMzSVN5eWltODRZYVc2ZHh2bnBVcmlPaVgrT3REVGZ3WmtvKzB5Z3E5R3JB?=
 =?utf-8?B?WVlUWnkyNHBaN0tzeHdjNTVPK0pYWlprSWovV1ZFa2FjcjllSm1VaE5FeERG?=
 =?utf-8?B?aWJDK1JvWTFXN3F2TXY2SUNCU2ZVbFVHcEpqaTlFTUc4V3gwM3lpdUovcE80?=
 =?utf-8?B?TXlUaS9HZ1MvbXNMSWRPU254dDl0RENMTHFuQlJTeWppVDBkYXdMd250RW5D?=
 =?utf-8?B?VmJQaXRMVnp3Z1lTam1xZzZ5WkJiQ1BicVNhTXpIOXR5OXROT0l0WnZSVlpN?=
 =?utf-8?B?NTkxOGZVemN4OCtjVUN6Y0tJUjFYUUxCZlNHKzIxdGRwUHJFaUd3TnZYQ3ky?=
 =?utf-8?B?S3ZkajlvaVB3V2xXQkpEZDBDRzJvSHdFaC9HcndTMlhtVXI1bDh4Z1JaWFN4?=
 =?utf-8?B?WFNwcklJdm5NYmJiYk9GSHE5a0pLRGJNdjhESUFES0h4dkpWODRLa0RkbVZ1?=
 =?utf-8?B?Y1lqaTZOaXhKK1Jid21XVXJ1M3hnREs5VjJMN2xzalRONzFxMlYvRFpnM09V?=
 =?utf-8?B?NjU4ZjVQYzBMbGxTNU9KZ3JaejR0QVBDOFpISEgvYUg0QXNTWmRlRVBjMGNa?=
 =?utf-8?B?czN1L1h0SHUwcVRQbUViZG5UaGpBUy9QL1VqT1VmYTU3aldXRngvY2ZTODVi?=
 =?utf-8?B?OXJHLzRoUDFZQVVEd04xT3A3ZU8yMkxpL2RrM2tnSUYwTFJ6aFpJTGVja25Q?=
 =?utf-8?B?OFY2bStSOFprK2dKMlE3TG5pZHQ1cWtMMko4ZCtxV2N2L0Y0c3hhWEZMdGEr?=
 =?utf-8?B?OFAwbkY2ajU5dTZRbE5zWEptU091WTcwQU9Ec0Z5SUtYc0tJV2JaUE40WFN2?=
 =?utf-8?Q?PV6vRr0pHmtqb3kXRJilBss0fKNMIwhQ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB2775.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SENPL0hZMWxtWXdjSWtCZjFCdTVpNGRPcUdrejdaWGhiV0hnUXFGVU9reExU?=
 =?utf-8?B?N0N1aGhHT0NXY2MyVVo1UFVpVy9La040TDlCVG9Lb0hJMGZUYjlBS3BmU1dH?=
 =?utf-8?B?MjFpS29VQ01BaWppTTV3RldlaWlWaVNLNm8wVnlwQklocVd1dytLYlQ0bDk4?=
 =?utf-8?B?S25qNFdBZG16SFROYXZzV3cxNFNhcnVoS2NKYjNJWXI3RUJ2MHBrSGJCaENF?=
 =?utf-8?B?cXpwUi9KTUJCUkZJZHpZWmdEMnEyY251UXBZNHpLRXh3WGwzSTZaU2dXeVIz?=
 =?utf-8?B?bEIrSzZZTEdCeHd1cGVkNDVQNGdSNHJya2pjT2dIRmdra3NCMGtKRFpWK2Uy?=
 =?utf-8?B?eGpWU2c5a3dHSVlSa3hQWTkxTFlLaTdYSWlOd2U1TjZobGU0TVJDUXdZQlZL?=
 =?utf-8?B?TTZ0cjJ1elpRbGhpa1BqcmlvZk9yOWVWVGdSV3lrNlE1K2t4UFJkeGNIaGJT?=
 =?utf-8?B?WVZMS3lhUlJuNjltV09OaVVkdkRBcHQrcmw3TFhJeHFEdVN4eXdYU3dQMXhj?=
 =?utf-8?B?L29SZ1phSVJDSlRPcTFDRHhvN1RnZXh4bW1YMHFCTjdrZ0lwV3BaQ0xiT0dL?=
 =?utf-8?B?SkVIWnJTZ2RqaGQxaVRqRHhiM1dJUmt5TFF6K1VkSm9EMEw3NUNuTm5vckU5?=
 =?utf-8?B?NmpDZ08wckdmWG1keXpvUDZ0a25yQ1BRVnl0TUZKNmxIdnVhL0RqeHl4TjVa?=
 =?utf-8?B?WmVvSzZobFIySVBNSWd4MC90MWhCbFZqUXg0d2hZOXAxM0xvOWV5SEpFTS9n?=
 =?utf-8?B?WWUxTHJZc2hsSnJicGNaUVhEdWFRSWx4dElLdUgzaE9XS2lEa0tTclNuMWt6?=
 =?utf-8?B?eFludE5XeTZNbUdJSUdQWVpWVTJ1d1l1cENseU9NTE51ek1UeDlWbVowaDN4?=
 =?utf-8?B?dzB0OFVRMEE4OEVleEpLVGcyMzVKd2RuaGJ3enBkRW1zNEEzejdKbWlRQ0o5?=
 =?utf-8?B?UTBqM1B0MlBzRDJDZUY1c0YrOHFpNmpxdk91TmdqU0xPUTMvM1UreVZGZStT?=
 =?utf-8?B?RnBBSEJvMmI2NXJjUGUwdjhpcWo2SXg2TXVFM0phekJKZGl0OWVSbVBzdDho?=
 =?utf-8?B?NmV6VjJybTRQTWtuU29ib1NNOUtGS1crVjJBTUNERWNVZGwvSkR4b0pHR0F2?=
 =?utf-8?B?QUFHbnpBc0htcFd1bnhUdWVnZ2NjVW5BcFNKczhzTjJETklmaHVjNDNKeDQw?=
 =?utf-8?B?ajF6ZjdhcUNIclU5R2N1SnZkT3pTYktCbVY1OWozQnJvUm5DZ0R5YUE3blhC?=
 =?utf-8?B?cmVJMGxoVlhqTzVOMEpZN1hSTUV5U3Yyamc2SzcvdjV5UzNaRGJ0SVFLeHd5?=
 =?utf-8?B?RzNPdEFIYzRIc3dzTmlkRmZiZytvT1VEWTNlbzZidGR1UUxuVEJCYkpJL1Nw?=
 =?utf-8?B?VHRPTFNHSU5vcEd4ajhmVW15SHoyWXpidkV0dGg2MGkrcGFVWEI0OG9ieURj?=
 =?utf-8?B?ZmhHY3d1YUtycDVNdjFSVXM5cCt2OUpLNUZIenpFZlFKUC83UEhrK2MvSFVL?=
 =?utf-8?B?dmhoK0pqUHg3WGtMM1M0MzVJVEJJcTZ0Vk5sMXczaFkyTmNpYTJUUHZvempU?=
 =?utf-8?B?Yjd1V29hcWt3OFVyYmM0K3Z4QVBXMFNUVDJXcmJxQ1FTM09SZ1VPZmlMMFBz?=
 =?utf-8?B?ZUE0aThaalQ4M21UMStlOEZkOXl4azZNQXJ0NzM4Rnh5MVRJNGVxT3RwbWtO?=
 =?utf-8?B?WlAxdXVqVm5XYzZrQUNYWWtJRFdZMDg0UVpqSU9DNjN4R1R5UUNKWllFUUNL?=
 =?utf-8?B?bWFNcFVHZmVUUUtzNjFvTUUraWxPZGJOMWI0eHhIUXI5c3VpaXNPSXIwRm1m?=
 =?utf-8?B?Y3dGdXh3SjZBeTJQQXoyRFN0c2dSSU0wRVNzU2svRGhmWWhsb3V4eDErRnlD?=
 =?utf-8?B?ZHJaNzZRMGJzeWRVcW0rcnBrVXFqMnprUWdCWnJpSExiVFY2UTZ2WFVxdGxX?=
 =?utf-8?B?dHh1cUtVVnJIMTB3K1pYbXVjRVgvYkxpZTdySmQvVVJwRzJIVXhUNlZaVTBr?=
 =?utf-8?B?Q1FQZUdXVHEyb0RZS3dDOWJCR0tqUloza2NycjJNSW5vUllhTlgzWVZOWDVE?=
 =?utf-8?B?akFqbmNMMVNoNy9YRllhcWZiSm90UDFSOWY0Vm5MWlZpa2hBRzRDc1Z6SWRj?=
 =?utf-8?B?YXhvTWRvcEZoQjZXZlZoUWVGbEFOeXBNby9mMm55Q3hlS0h5d0kvUnJNU0d1?=
 =?utf-8?B?QlE9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB2775.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 588d2a11-2c72-41d6-667a-08dd3ca559d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2025 18:31:43.0795
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bzkOtW2TxpDF9n6arSgSfv6t5R0/BNYoBj7rZYBGbQUO8WT7xcCWBIAHo6MtiaAv0rqS7JX7BCSjaNQJeTjqErpJ+ZWxhAY6Q25MWvZWplI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11873

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogRnJpZGF5LCBKYW51YXJ5IDI0LCAy
MDI1IDM6MjEgUE0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCA1LzldIHNvYzogcmVuZXNhczog
cnotc3lzYzogTW92ZSBSWi9WMkggU29DDQo+IGRldGVjdGlvbiB0byB0aGUgU1lTIGRyaXZlcg0K
PiANCg0KSGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXcuDQoNCj4gSGkgSm9obiwN
Cj4gDQo+IE9uIFRodSwgSmFuIDIzLCAyMDI1IGF0IDY6MDXigK9QTSBKb2huIE1hZGlldQ0KPiA8
am9obi5tYWRpZXUueGFAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IEFzIHBlciB0aGUgb3Ro
ZXIgU29DIHZhcmlhbnQgb2YgdGhlIHNhbWUgZmFtaWx5LCB0aGUgc3lzdGVtIGNvbnRyb2xsZXIN
Cj4gPiBwcm92aWRlcyBTb0MgSUQgaW4gaXRzIG93biByZWdpc3RlcnMuDQo+ID4NCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBKb2huIE1hZGlldSA8am9obi5tYWRpZXUueGFAYnAucmVuZXNhcy5jb20+DQo+
IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvc29jL3Jl
bmVzYXMvS2NvbmZpZw0KPiA+ICsrKyBiL2RyaXZlcnMvc29jL3JlbmVzYXMvS2NvbmZpZw0KPiA+
IEBAIC0zNTUsNiArMzU1LDcgQEAgY29uZmlnIEFSQ0hfUjlBMDlHMDQ3ICBjb25maWcgQVJDSF9S
OUEwOUcwNTcNCj4gPiAgICAgICAgIGJvb2wgIkFSTTY0IFBsYXRmb3JtIHN1cHBvcnQgZm9yIFJa
L1YySChQKSINCj4gPiAgICAgICAgIHNlbGVjdCBSRU5FU0FTX1JaVjJIX0lDVQ0KPiA+ICsgICAg
ICAgc2VsZWN0IFNZU19SOUEwOUcwNTcNCj4gPiAgICAgICAgIGhlbHANCj4gPiAgICAgICAgICAg
VGhpcyBlbmFibGVzIHN1cHBvcnQgZm9yIHRoZSBSZW5lc2FzIFJaL1YySChQKSBTb0MgdmFyaWFu
dHMuDQo+ID4NCj4gPiBAQCAtMzk1LDQgKzM5Niw4IEBAIGNvbmZpZyBTWVNDX1I5QTA4RzA0NSAg
Y29uZmlnIFNZU19SOUEwOUcwNDcNCj4gPiAgICAgICAgIGJvb2wgIlJlbmVzYXMgUlovRzNFIFN5
c3RlbSBjb250cm9sbGVyIHN1cHBvcnQiIGlmIENPTVBJTEVfVEVTVA0KPiA+ICAgICAgICAgc2Vs
ZWN0IFNZU0NfUloNCj4gPiArDQo+ID4gK2NvbmZpZyBTWVNfUjlBMDlHMDU3DQo+ID4gKyAgICAg
ICBib29sICJSZW5lc2FzIFJaL1YySCBTeXN0ZW0gY29udHJvbGxlciBzdXBwb3J0IiBpZiBDT01Q
SUxFX1RFU1QNCj4gPiArICAgICAgIHNlbGVjdCBTWVNDX1JaDQo+IA0KPiBQbGVhc2UgYWRkIGEg
YmxhbmsgbGluZSBoZXJlLg0KPiANCg0KV2lsbCBkbyBpbiB2NS4NCg0KPiA+ICBlbmRpZiAjIFNP
Q19SRU5FU0FTDQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvc29jL3JlbmVzYXMvcjlhMDlnMDQ3LXN5
cy5jDQo+ID4gKysrIGIvZHJpdmVycy9zb2MvcmVuZXNhcy9yOWEwOWcwNDctc3lzLmMNCj4gPiBA
QCAtMTEsMjUgKzExLDExIEBADQo+ID4gICNpbmNsdWRlIDxsaW51eC9pby5oPg0KPiA+DQo+ID4g
ICNpbmNsdWRlICJyei1zeXNjLmgiDQo+ID4gKyNpbmNsdWRlICJyemczZS1zeXMuaCINCj4gPg0K
PiA+IC0vKiBSZWdpc3RlciBPZmZzZXRzICovDQo+ID4gLSNkZWZpbmUgU1lTX0xTSV9NT0RFICAg
ICAgICAgICAweDMwMA0KPiA+IC0vKg0KPiA+IC0gKiBCT09UUExMQ0FbMTowXQ0KPiA+IC0gKiAg
ICAgICAgIFswLDBdID0+IDEuMUdIWg0KPiA+IC0gKiAgICAgICAgIFswLDFdID0+IDEuNUdIWg0K
PiA+IC0gKiAgICAgICAgIFsxLDBdID0+IDEuNkdIWg0KPiA+IC0gKiAgICAgICAgIFsxLDFdID0+
IDEuN0dIWg0KPiA+IC0gKi8NCj4gPiAtI2RlZmluZSBTWVNfTFNJX01PREVfU1RBVF9CT09UUExM
Q0E1NSAgR0VOTUFTSygxMiwgMTEpDQo+ID4gLSNkZWZpbmUgU1lTX0xTSV9NT0RFX0NBNTVfMV83
R0haICAgICAgIDB4Mw0KPiA+IC0jZGVmaW5lIFNZU19MU0lfREVWSUQgICAgICAgICAgMHgzMDQN
Cj4gPiAtI2RlZmluZSBTWVNfTFNJX0RFVklEX1JFViAgICAgIEdFTk1BU0soMzEsIDI4KQ0KPiA+
IC0jZGVmaW5lIFNZU19MU0lfREVWSURfU1BFQ0lGSUMgR0VOTUFTSygyNywgMCkNCj4gPiAtI2Rl
ZmluZSBTWVNfTFNJX1BSUiAgICAgICAgICAgICAgICAgICAgMHgzMDgNCj4gPiAtI2RlZmluZSBT
WVNfTFNJX1BSUl9DQTU1X0RJUyAgICAgICAgICAgQklUKDgpDQo+ID4gLSNkZWZpbmUgU1lTX0xT
SV9QUlJfTlBVX0RJUyAgICAgICAgICAgIEJJVCgxKQ0KPiA+IC0NCj4gPiArLyogUlovRzNFLXNw
ZWNpZmljIGZlYXR1cmUgYml0cyAqLw0KPiA+ICsjZGVmaW5lIFNZU19MU0lfUFJSX0NBNTVfRElT
ICAgIEJJVCg4KQ0KPiA+ICsjZGVmaW5lIFNZU19MU0lfUFJSX05QVV9ESVMgICAgIEJJVCgxKQ0K
PiA+DQo+ID4gIHN0YXRpYyB2b2lkIHJ6ZzNlX3N5c19wcmludF9pZChzdHJ1Y3QgZGV2aWNlICpk
ZXYsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkIF9faW9tZW0gKnN5
c2NfYmFzZSwgZGlmZiAtLWdpdA0KPiA+IGEvZHJpdmVycy9zb2MvcmVuZXNhcy9yOWEwOWcwNTct
c3lzLmMNCj4gPiBiL2RyaXZlcnMvc29jL3JlbmVzYXMvcjlhMDlnMDU3LXN5cy5jDQo+ID4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmRjNzg4NWIzNDBjNA0K
PiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9kcml2ZXJzL3NvYy9yZW5lc2FzL3I5YTA5ZzA1
Ny1zeXMuYw0KPiA+IEBAIC0wLDAgKzEsMjYgQEANCj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjANCj4gPiArLyoNCj4gPiArICogUlovVjJIIFN5c3RlbSBjb250cm9sbGVy
IChTWVMpIGRyaXZlcg0KPiA+ICsgKg0KPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjUgUmVuZXNh
cyBFbGVjdHJvbmljcyBDb3JwLg0KPiA+ICsgKi8NCj4gPiArDQo+ID4gKyNpbmNsdWRlIDxsaW51
eC9iaXRzLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4NCj4gPiArI2luY2x1ZGUg
PGxpbnV4L2luaXQuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L2lvLmg+DQo+ID4gKw0KPiA+ICsj
aW5jbHVkZSAicnotc3lzYy5oIg0KPiA+ICsjaW5jbHVkZSAicnpnM2Utc3lzLmgiDQo+IA0KPiBV
c2luZyBkZWZpbml0aW9ucyBmb3IgUlovRzNFIGZvciBSWi9WMkggZmVlbHMgd3JvbmcgdG8gbWUs
IGFzIHRoZXkgYXJlDQo+IHJlYWxseSBTb0Mtc3BlY2lmaWMuDQo+IFNvIEkgdGhpbmsgeW91IGJl
dHRlciBrZWVwIHRoZW0gaW4gZHJpdmVycy9zb2MvcmVuZXNhcy9yOWEwOWcwNDctc3lzLmMNCj4g
YW5kIGRyaXZlcnMvc29jL3JlbmVzYXMvcjlhMDlnMDU3LXN5cy5jLCBldmVuIGlmIHRoYXQgbWVh
bnMgZHVwbGljYXRpb24uDQo+IFJaL0czUyBhbHNvIGhhcyB0aGVtIGluIGRyaXZlcnMvc29jL3Jl
bmVzYXMvcjlhMDhnMDQ1LXN5cy5jDQo+IA0KDQpJJ2xsIHRoZW4gcHV0IGJhY2sgdGhlc2UgZGVm
aW5pdGlvbnMgaW4gcmVzcGVjdGl2ZSBmaWxlcy4NCg0KPiA+ICsNCj4gPiArc3RhdGljIGNvbnN0
IHN0cnVjdCByel9zeXNjX3NvY19pZF9pbml0X2RhdGEgcnp2Mmhfc3lzX3NvY19pZF9pbml0X2Rh
dGENCj4gX19pbml0Y29uc3QgPSB7DQo+ID4gKyAgICAgICAuZmFtaWx5ID0gIlJaL1YySCIsDQo+
ID4gKyAgICAgICAuaWQgPSAweDg0N2E0NDcsDQo+ID4gKyAgICAgICAub2Zmc2V0ID0gU1lTX0xT
SV9ERVZJRCwNCj4gPiArICAgICAgIC5yZXZpc2lvbl9tYXNrID0gU1lTX0xTSV9ERVZJRF9SRVYs
DQo+ID4gKyAgICAgICAuc3BlY2lmaWNfaWRfbWFzayA9IFNZU19MU0lfREVWSURfU1BFQ0lGSUMs
DQo+IA0KPiBJIHdvdWxkbid0IG1pbmQganVzdCBwdXR0aW5nIHRoZSBoZXggY29uc3RhbnRzIGhl
cmUsIGFuZCBnZXR0aW5nIHJpZCBvZg0KPiB0aGUgU1lTX0xTSV9ERVZJRCogZGVmaW5pdGlvbnMs
IGFzIHRoZSBkZWZpbml0aW9ucyBhcmUgb25seSB1c2VkIGZvcg0KPiBwb3B1bGF0aW5nIHRoZXNl
IHN0cnVjdHVyZXMuDQo+IA0KDQpOb3RlZCwgSSdsbCBnbyBmb3IgaXQuDQoNCj4gPiArfTsNCj4g
PiArDQo+ID4gK2NvbnN0IHN0cnVjdCByel9zeXNjX2luaXRfZGF0YSByenYyaF9zeXNfaW5pdF9k
YXRhID0gew0KPiA+ICsgICAgICAgLnNvY19pZF9pbml0X2RhdGEgPSAmcnp2Mmhfc3lzX3NvY19p
ZF9pbml0X2RhdGEsIH07DQo+IA0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9kcml2ZXJz
L3NvYy9yZW5lc2FzL3J6ZzNlLXN5cy5oDQo+ID4gQEAgLTAsMCArMSwyOCBAQA0KPiA+ICsvKiBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLw0KPiA+ICsvKg0KPiA+ICsgKiBSZW5l
c2FzIFJaL0czRSAoU1lTKSBTeXN0ZW0gQ29udHJvbGxlcg0KPiA+ICsgKg0KPiA+ICsgKiBDb3B5
cmlnaHQgKEMpIDIwMjUgUmVuZXNhcyBFbGVjdHJvbmljcyBDb3JwLg0KPiA+ICsgKi8NCj4gPiAr
DQo+ID4gKyNpZm5kZWYgX19SWkczRV9TWVNfSF9fDQo+ID4gKyNkZWZpbmUgX19SWkczRV9TWVNf
SF9fDQo+ID4gKw0KPiA+ICsvKiBTWVMgQ29tbW9uIFJlZ2lzdGVyIE9mZnNldHMgKi8NCj4gPiAr
DQo+ID4gKyNkZWZpbmUgU1lTX0xTSV9NT0RFICAgMHgzMDANCj4gPiArLyoNCj4gPiArICogQk9P
VFBMTENBWzE6MF0NCj4gPiArICogICAgICAgICBbMCwwXSA9PiAxLjFHSFoNCj4gPiArICogICAg
ICAgICBbMCwxXSA9PiAxLjVHSFoNCj4gPiArICogICAgICAgICBbMSwwXSA9PiAxLjZHSFoNCj4g
PiArICogICAgICAgICBbMSwxXSA9PiAxLjdHSFoNCj4gPiArICovDQo+ID4gKyNkZWZpbmUgU1lT
X0xTSV9NT0RFX1NUQVRfQk9PVFBMTENBNTUgIEdFTk1BU0soMTIsIDExKQ0KPiA+ICsjZGVmaW5l
IFNZU19MU0lfTU9ERV9DQTU1XzFfN0dIWiAgICAgICAweDMNCj4gPiArI2RlZmluZSBTWVNfTFNJ
X0RFVklEICAweDMwNA0KPiA+ICsjZGVmaW5lIFNZU19MU0lfREVWSURfUkVWICAgICAgR0VOTUFT
SygzMSwgMjgpDQo+ID4gKyNkZWZpbmUgU1lTX0xTSV9ERVZJRF9TUEVDSUZJQyBHRU5NQVNLKDI3
LCAwKQ0KPiA+ICsjZGVmaW5lIFNZU19MU0lfUFJSICAgIDB4MzA4DQo+ID4gKw0KPiA+ICsjZW5k
aWYgLyogX19SWkczRV9TWVNDX0hfXyAqLw0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0K
PiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCg0KUmVnYXJkcywNCkpv
aG4NCg==

