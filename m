Return-Path: <linux-renesas-soc+bounces-33659-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mOAiIK6tJmo4bAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33659-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 13:55:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7821A655E4D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 13:55:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=c0rJAX3c;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33659-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33659-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 65CF23004438
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2026 11:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A6D36D517;
	Mon,  8 Jun 2026 11:51:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010038.outbound.protection.outlook.com [52.101.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA2D36C59A;
	Mon,  8 Jun 2026 11:51:11 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780919472; cv=fail; b=LS2HBTEW/Ezd2Vi8w0/cjlqAW0DYL/1HrVvlJc3EnDAcPlGiH8KE+5Iuy1R8Vy275abTJ6wGftGzKZlfOOG0i9BebDaPHWwcIvMcgPaaEopD7JoiqgqniWBAsXg6PVVWePpMp5viKbaovgaBSSc6y2HT8g+YUOajLrnMAyO8mRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780919472; c=relaxed/simple;
	bh=f4BV78Axi33D0nhBAFvVyPYEfsMz+X84SXkMxR5RVkU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ARrPhVM+LqGqV9/BAabFaWSTFWaq2uVWweRoMQQHEKnRn4Wp2gc5ESvShe9O7aMzoQ8weForHoB31dlLuSaQAsczmS+dXj8+mLT+twNvZ8gIMpXPY/Y6r+a4mxkOJqaXV3Ylon3RLMEBhwzm5SeObzScLcXA8ds70iHyTJkS7Z8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=c0rJAX3c; arc=fail smtp.client-ip=52.101.228.38
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gL+smwUBM1K8u38VaPHvHh+rnWFAH4ft8lA6q9iNNGe6KtBrI6caC5oFO9I0yzXAp3ynt7KeAXS43hAdMlkAQ1693ymF5pAokKswMP0w0njVMYG8B0/vlkp+bQhdddUQa7seOf6cmKxS/6q/3JJ9W2JYf7hDHaG3jrUickKY9wHdkvKy3rm/IpnA2r2PuHqjnx8XAf1D8StZL+W7B1NVm8pu9V+PnAp2GnQuKwWHxI14cBB888sykOg85yNfwMlN5mX8zCds/fCQCNnBc0We+cANTkcJ7nbFCQ7X1PRXdbBB55rqkEpLRCHeGef6dj5ynQ6G7u3lM5ff+sSApH009w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f4BV78Axi33D0nhBAFvVyPYEfsMz+X84SXkMxR5RVkU=;
 b=M52Mtup5k3d1C+62eUUBHh81oiw050h0nbKfX0OkYlJDrOBLXdaQPVWiK+2eueG5jZ/ujjCQlr4g3VXk6KB+4MGi4BzpdEJF0Tf21DSAZgU96g3UjMK0w8uK+gfQzhsLIm+gZJylaui+ymOspadT2PsOY4an4poq2h91TCEWW14xcxcK6JFZ4p6QjnKigqtWiFKbXtnAQo23zeUkpFfRTiaXKE4lXpYfA1Pcd+hcBfJqOZ5/8R7OTe9LnKIw0X3QVWqpn2C4+Sv+70YNgO/MbA0nzr2xj3+sqgdZS5eQgovvJByStNH3y4LMVf/eCfwLuhidx3T3h2aqX+UgTJq2lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f4BV78Axi33D0nhBAFvVyPYEfsMz+X84SXkMxR5RVkU=;
 b=c0rJAX3cIrlP+gpzOeM83s6XvgzlyPjVEYzKUS5nUA4kf/TUsbzn58UQ6q32W97y6HLUCReUO+4hWGKsTVrpRG9E6aqoZWwluzAfwPW1LxGKasAw8sI68y5fyDB2QsusMh/G/WQY0onVk/aamEN0EWukmZLYCRawXB8AGn1fWU4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB12528.jpnprd01.prod.outlook.com (2603:1096:405:197::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 11:51:08 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 11:51:08 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] dt-bindings: mfd: syscon: Make ranges required for
 renesas,r9a08g046-lvds-cmn
Thread-Topic: [PATCH] dt-bindings: mfd: syscon: Make ranges required for
 renesas,r9a08g046-lvds-cmn
Thread-Index:
 AQHc8pGh26og7GjtHkeCuhYLGQ8HXrY0e8eAgAAAPoCAAABXAIAADYMAgAACtXCAAAczgIAAAFYQ
Date: Mon, 8 Jun 2026 11:51:07 +0000
Message-ID:
 <TY3PR01MB11346C66B7BD36CB89D19009F861C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260602131331.90756-1-biju.das.jz@bp.renesas.com>
 <20260608-alluring-remarkable-echidna-d107ea@quoll>
 <d8cf5925-9c4e-4417-8fee-1d24c4cd303d@kernel.org>
 <TY3PR01MB1134665BE4CE8FB734BCFAAAF861C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <f5e8719f-6d85-4edf-a645-5be9be7ec980@kernel.org>
 <TY3PR01MB113469E3AB101C3552E721E11861C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <6960d660-2851-44e3-af89-b334ab6cecc0@kernel.org>
In-Reply-To: <6960d660-2851-44e3-af89-b334ab6cecc0@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB12528:EE_
x-ms-office365-filtering-correlation-id: 638aba7e-ab1e-431e-23b9-08dec5543a4e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|11063799006|4143699003|3023799007|56012099006|6133799003|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info:
 wtG1usDV4vinKk1PHbJJ0qdTuPyukffbmIHOsV2q5NBloo9YBE5bbPNmYjAOqYQcQxWtLrmLsN2dmFTr7nKG3DSu6/fcb1f2JcuhQAOyRMM4rbIoQQXj/8JZwJPNhl1HBqiVOl/+OEd5Pxqa4qzEO1ra4xMEF3gMJWzfrx5hkU8zUJt0OG7DNoc7wh0Qce7KINgx6kzhRoRDkE/ctJO0vb1l3bPijQ64lbCd/ohZ+SerltvLN80fjEmFBX8N96cLD3TmralqRZ1JOnv2/eZypVvDWDbrF6moZwhX2Gq2IZLaYnCM+CjeHNuTbU7ZFa2OBFRUzRX+9H6YvCDjf7x+ttg+UqwOr2lvXwWxwIhw0geBU2cJgm0zEYLBZ80yJzPUnZQwrSviEV5hHq1TfycyOqDVR+TbYuyuCPxMR8C8BOLGaN5Ka/axeCOIT1c6HMSEWFk2We3XWEbSO2nJbP7md9hmwWgULIlUO6EXeJ0txJgfLKMipfW7B7Y5dh7+hI6Pq7qTl7wJE63XG65J/yM3t+olduJUkVQfmWQePvD4jB9rfs3PdG/bnbVX0VFaqW2KXLqRKfScBvQdy480OVzU8XXf1nbuqdkzxLLp6erwNK3nkzXHEvpF/ck2ZMzZg3pBVLTK08FrL/z+O49SoQqEwRZWVZyxc2iC+4vpR3BShpynHK1YrW+wJJoh5Tai7wrTqeSwvSbdvym45NWPM92jjalg33BcvHxDGy3jJ/shGp2pCGhT1SVU5Z65l+P8+xcF
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(11063799006)(4143699003)(3023799007)(56012099006)(6133799003)(38070700021)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T21DWkpqUmMxNDQvNVI4UHpLVjdaU1p3eEc0djhUaTljSC9EQ3liTnhObURY?=
 =?utf-8?B?MG1SVlFYUkx3RndjL2hqQ2xzQVFITnRqdXFsR1cvMzliZUg5VURXTkNFVWZC?=
 =?utf-8?B?YnhsdWx5cUdnd3B1RmVtZUF3TG9xZmNBVXVNUWFhOGEwT2ZVV3pzZmc1UC9p?=
 =?utf-8?B?c3RqU1FMNDl1WGNrYi9ramFQNVh2c3NJUTZsL2F5ZVhKeHMvUWNEUnNXWXlp?=
 =?utf-8?B?dDNrallzaFZZWTNyQ001QVRGUE14NGRJcFpiMzZGY09KK3JaVWxVRyt3d3l0?=
 =?utf-8?B?QUp6L0YwaUJibnl2bk1GSE1rdTIzQW0yMlRmTDhMbnZ2eDNPdFZJUGhqZklI?=
 =?utf-8?B?MDBEMHN6SDNERmRxUE1pVG12aTlvOENLYTR5VzBhNDRISkhUemc0YVI3WTZl?=
 =?utf-8?B?c1llQUpxL3FxTjFzTTJNZkE5Z1dySWZnWkVzOHhwK0d6VWhkTzREdFJydGZi?=
 =?utf-8?B?Q3dRSDVueEhrS2pUa1VETlFDT1N0dG40eTdTNGZXWlpuU2NkWmo4djR6TU5E?=
 =?utf-8?B?NkRhNG5Ec3lMSXFxRllnQ050Qkg0bnZTeENKb29ER2dZSlNnMmkxcXNLU1Zt?=
 =?utf-8?B?ekt1TFV2Z3JUd2FPN1Q3Tm5YVHNFUk1Cc0EyOCt5OFlWUXp0T09HWElZNisz?=
 =?utf-8?B?R3NnbEtzWFgvVk43cEVjS2FZdGkzRXZ0TExSUVJ6c2lxZEdPMEp5bmZsYlBQ?=
 =?utf-8?B?VlpnTVZDNGdCTkJzSm9jMjRBLzM4QjJWWGRLbUQ1bDVXL2VTcGJDSUxIa3gw?=
 =?utf-8?B?Q1pYVjFIaCtFV3BoOWpzeXJNcFJoNjJKemF2VGUxaHZ3KzFkS014eFdidzgw?=
 =?utf-8?B?Qk5rbEVvc3RBYWNSK2tleGRjVmt2NURjNHN0U25jSGZtWDNXeEpxSlEwcU1M?=
 =?utf-8?B?SVJRWG1ZcVRYN0g3RVVhUWttTHU3QndhTUttREFjK3E2WTJvMXR3ZzlCaUdG?=
 =?utf-8?B?NksrUk1kT1JvUWdPejBvMkl3eEJ4Q3psdEt0QmdYTEFWYjc3YmJhRUxSZ1Vo?=
 =?utf-8?B?VUU2VWJXekd2a2ZYRXBJbEswRnZZZXU0NEJTNGZiMU51TGpTVnNNL1ZjQUkx?=
 =?utf-8?B?UFRUN2FVT0VxVFhxL3lZVDU0MzVIUkcxc0s0NUJYVURIWTFUUU53SnZ6WmpR?=
 =?utf-8?B?WFlXbmk1NmZLbVhhVlFsK3V2aEVXU21QY0h2SFFCWmVZZjNjUXVobVJmaWJE?=
 =?utf-8?B?bGZtNnVleE5adzZvZWJhUXQ2cHQ2WTE3Qld5aitTa1VWcERCVXlvcjF4NlRk?=
 =?utf-8?B?dDIrVit1aG9ua3dkNlgzL0FSZkgzREZCTm82NFUvSnhaN2YvWG85VkQ0Yko4?=
 =?utf-8?B?Ky9NRTYyWWFMV0hRT3VuS2RqVmRRMkJwd24zOG5ydm9TMW4vb0xSbjljYjhH?=
 =?utf-8?B?VlRVQW1tcm9xVXNndkxVL01YcXE2SjVMREVHRnQvRk9tQmJjVVNVOG1ZZURH?=
 =?utf-8?B?YS80T1JvNWlrMTlSZ3dBenE1MTV5R2cvcy9zbGxiT2J5dmhDcFA5WitDREJu?=
 =?utf-8?B?Nm02aG5nS281ZS9HdkNEOXhNeTA0emFySVdlREJIMWZYQXAxZnJWcEk0clk5?=
 =?utf-8?B?Tk04ZURuQTNjV3RERWJqVHZTUWY0YWxYcHI0ZHlUSUExUG9iY0cxRnFLNTlo?=
 =?utf-8?B?ZmZQMnkvZzJkcXV2b0RyZ0FsZmh6Q1Z5R05BMUtRU0F0ZW1MVjhRMEV0cmFX?=
 =?utf-8?B?MlVYcnFwYlFDK08rZjExM29XQW9RcVRsMzhJSmQya3RMdHFLaHREb3Y3UFNW?=
 =?utf-8?B?Y01oMFdHYXpveUE0cmhla0o3L2V4dTJ1S3N6U081WE05ZUtrUVNZdm9OZ3cz?=
 =?utf-8?B?d3A1U2lFU3Z0am83NG1QQnA1QTYydC82dFhBMlV2bGlMZHJFYlNSdUVYenM2?=
 =?utf-8?B?Z0JJNkhIRXNob3BtWEFwSjlFNkN6VzNFbERXandJMDRlVmk3Nm4wQkJpc0JR?=
 =?utf-8?B?NU5mWEhNUDMycmRlbEpTU1E4bUlkZ1JjZDhIMVVBblV0RmtNNExVVXFUSkta?=
 =?utf-8?B?aFZ2YkpCYndtclF1NG9lVDRKTDVQMi8wMnArRm9uTzZwRTBmTGE5M1J0ZmtP?=
 =?utf-8?B?RDAvTW1FczNISmFYTENIWWx3ZkVQM2pyQnZUSDI5NmtUSlpYN09WOEZFL1dx?=
 =?utf-8?B?V20yN0d6QXd1TGc3WmxsWDcxMFVoOENtSEJGZjlLbUpWRVlWNGRtK0pkaXEz?=
 =?utf-8?B?RURzZUxQUzczN3RjblZrR3cxZUVlSXp6NGtPMVkzOEJKdHBSZmpubzRmcFBD?=
 =?utf-8?B?TEFvNlliczNCcUtmYlduQS9teTVrUEg3MGtXY2J2Y05VVUJNVDV1YzNhbmlx?=
 =?utf-8?B?K1VVb3lVayt5Uk0vNWMweWlhYUdyTWM4andZY1o4TjY1RDE5cWQ1UT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 638aba7e-ab1e-431e-23b9-08dec5543a4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2026 11:51:07.9279
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zf7A0NmUtNbg7Ih1TXCCrpoFR9yeRppL9LQgf+m9cxPvrC0tiZJD+jn58SCut/unYfp+fUdnqZgnfSdZ2EsEIBel+pnsRgQZUF7WWMXLD1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12528
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33659-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:biju.das.au@gmail.com,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,vger.kernel.org,bp.renesas.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:from_mime,bp.renesas.com:dkim,renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7821A655E4D

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDA4
IEp1bmUgMjAyNiAxMjo0Nw0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkdC1iaW5kaW5nczogbWZk
OiBzeXNjb246IE1ha2UgcmFuZ2VzIHJlcXVpcmVkIGZvciByZW5lc2FzLHI5YTA4ZzA0Ni1sdmRz
LWNtbg0KPiANCj4gT24gMDgvMDYvMjAyNiAxMzoyMiwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gSGkg
S3J6eXN6dG9mIEtvemxvd3NraSwNCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiA+PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+ID4+
IFNlbnQ6IDA4IEp1bmUgMjAyNiAxMjoxMQ0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIXSBkdC1i
aW5kaW5nczogbWZkOiBzeXNjb246IE1ha2UgcmFuZ2VzIHJlcXVpcmVkDQo+ID4+IGZvciByZW5l
c2FzLHI5YTA4ZzA0Ni1sdmRzLWNtbg0KPiA+Pg0KPiA+PiBPbiAwOC8wNi8yMDI2IDEyOjI2LCBC
aWp1IERhcyB3cm90ZToNCj4gPj4+IEhpIEtyenlzenRvZiBLb3psb3dza2ksDQo+ID4+Pg0KPiA+
Pj4gVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQo+ID4+Pg0KPiA+Pj4+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+ID4+Pj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJu
ZWwub3JnPg0KPiA+Pj4+IFNlbnQ6IDA4IEp1bmUgMjAyNiAxMToyMg0KPiA+Pj4+IFN1YmplY3Q6
IFJlOiBbUEFUQ0hdIGR0LWJpbmRpbmdzOiBtZmQ6IHN5c2NvbjogTWFrZSByYW5nZXMgcmVxdWly
ZWQNCj4gPj4+PiBmb3IgcmVuZXNhcyxyOWEwOGcwNDYtbHZkcy1jbW4NCj4gPj4+Pg0KPiA+Pj4+
IE9uIDA4LzA2LzIwMjYgMTI6MjAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+ID4+Pj4+
IE9uIFR1ZSwgSnVuIDAyLCAyMDI2IGF0IDAyOjEzOjI5UE0gKzAxMDAsIEJpanUgd3JvdGU6DQo+
ID4+Pj4+PiBGcm9tOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4+
Pj4+Pg0KPiA+Pj4+Pj4gQWRkIGEgY29uZGl0aW9uYWwgc2NoZW1hIHJ1bGUgdG8gdGhlIHN5c2Nv
biBiaW5kaW5ncyB0aGF0DQo+ID4+Pj4+PiByZXF1aXJlcyB0aGUgcmFuZ2VzIHByb3BlcnR5IHdo
ZW4gdGhlIGNvbXBhdGlibGUgc3RyaW5nIGNvbnRhaW5zDQo+ID4+Pj4+PiByZW5lc2FzLHI5YTA4
ZzA0Ni1sdmRzLWNtbi4gVGhpcyBlbnN1cmVzIHRoZSBMVkRTIGNvbW1vbiBjb250cm9sDQo+ID4+
Pj4+PiBibG9jayBvbiB0aGUgUlovRzNMIFNvQyBjb3JyZWN0bHkgZGVjbGFyZXMgaXRzIGFkZHJl
c3MNCj4gPj4+Pj4+IHRyYW5zbGF0aW9uLCBhcyB0aGUgZGV2aWNlIGhhcyBjaGlsZCBub2RlcyB0
aGF0IG5lZWQgYSB2YWxpZA0KPiA+Pj4+Pj4gcmFuZ2VzIG1hcHBpbmcgdG8gYmUgZGVzY3JpYmVk
IGluIHRoZSBkZXZpY2UgdHJlZS4NCj4gPj4+Pj4+DQo+ID4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBC
aWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4+Pj4+PiAtLS0NCj4gPj4+
Pj4+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3N5c2Nvbi55YW1sIHwg
MTQNCj4gPj4+Pj4+ICsrKysrKysrKysrKysrDQo+ID4+Pj4+PiAgMSBmaWxlIGNoYW5nZWQsIDE0
IGluc2VydGlvbnMoKykNCj4gPj4+Pj4+DQo+ID4+Pj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9zeXNjb24ueWFtbA0KPiA+Pj4+Pj4gYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3N5c2Nvbi55YW1sDQo+ID4+Pj4+PiBp
bmRleCA5YzgxMDEwZDVhNzQuLmNiZjgzYTA2YWUyNSAxMDA2NDQNCj4gPj4+Pj4+IC0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvc3lzY29uLnlhbWwNCj4gPj4+Pj4+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvc3lzY29uLnlhbWwN
Cj4gPj4+Pj4+IEBAIC0yNjksNiArMjY5LDggQEAgcHJvcGVydGllczoNCj4gPj4+Pj4+ICAgIHJl
c2V0czoNCj4gPj4+Pj4+ICAgICAgbWF4SXRlbXM6IDENCj4gPj4+Pj4+DQo+ID4+Pj4+PiArICBy
YW5nZXM6IHRydWUNCj4gPj4+Pj4NCj4gPj4+Pj4gVGhlcmUgYXJlIG5vIGNoaWxkcmVuIGFsbG93
ZWQsIHNvIHJhbmdlcyBwcm9wZXJ0eSBpcyB3cm9uZy4NCj4gPj4+Pj4NCj4gPj4+Pj4gWW91IGFy
ZSBjaGFuZ2luZyBiaW5kaW5nIHdoaWNoIERPRVMgTk9UIGFsbG93IHNpbXBsZS1tZmQgb3IgYW55
DQo+ID4+Pj4+IG90aGVyIGNoaWxkcmVuLiBSYW5nZXMgaXMgbm90IGEgcHJvYmxlbSBoZXJlLg0K
PiA+Pj4+DQo+ID4+Pj4NCj4gPj4+PiBBbmQgaWYgeW91IHRlc3RlZCBpdCBvbiB5b3VyIERUUywg
eW91IHdvdWxkIHNlZSB0aGlzIGRvZXMgbm90IHdvcmsuLi4NCj4gPj4+DQo+ID4+PiBJIGRvbid0
IHNlZSBhbnkgd2FybmluZ3Mgb3IgZXJyb3IuIEkgaGF2ZSBkb25lIHRoaXMgY2hhbmdlIGJhc2Vk
IG9uDQo+ID4+PiBSb2IncyBjb21tZW50IGJhc2VkIG9uIHNhc2hpa28gcmV2aWV3IFsxXS4NCj4g
Pj4+DQo+ID4+PiBJZiB5b3UgYWdyZWUsIEkgY2FuIGRyb3AgdGhpcyBwYXRjaC4NCj4gPj4+DQo+
ID4+PiBbMV0NCj4gPj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDYwMTAyMjYx
OS5HQTM5NjEzMjQtcm9iaEBrZXJuZWwub3JnDQo+ID4+PiAvDQo+ID4+DQo+ID4+IExvb2s6DQo+
ID4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDUyNDE5NDQ1Ny40Nzk2ODEtMi1i
aWp1LmRhcy5qekBicC5yZQ0KPiA+PiBuZXNhcy5jb20vDQo+ID4+IFdoYXQgY29tcGF0aWJsZXMg
YXJlIGhlcmU/DQo+ID4+DQo+ID4+IE5vdyBvcGVuIHRoZSBiaW5kaW5nIC0gd2hhdCBjb21wYXRp
YmxlcyBhcmUgYWxsb3dlZCBmb3IgcmVuZXNhcyxyOWEwOGcwNDYtbHZkcy1jbW4gPw0KPiA+DQo+
ID4gT0ssIEkgYW0gbWlzc2luZyB0aGUgZmFsbGJhY2tzICJzaW1wbGUtbWZkIiwgInN5c2NvbiI7
IGluIHRoZQ0KPiA+IGNvbXBhdGlibGVzIGFsbG93ZWQgZm9yIHJlbmVzYXMscjlhMDhnMDQ2LWx2
ZHMtY21uLg0KPiA+DQo+ID4gT0ssIEkgd2lsbCBhZGQgdGhvc2UuDQo+IA0KPiBObywgbWF5YmUs
IGR1bm5vLi4uIEhvdyBhbnl0aGluZyBoZXJlIGNvdWxkIGhhdmUgYmVlbiB0ZXN0ZWQ/IGR0YnNf
Y2hlY2sgY2xlYXJseSBwb2ludHMgZXJyb3JzIG9uIHlvdXINCj4gRFRTLg0KDQpJIHJhbiB0aGUg
YmVsb3cgY29tbWFuZHMgYW5kIG5vbmUgb2YgdGhlbiB0cmlnZ2VyZWQgdGhlIGVycm9yL3dhcm5p
bmcgeW91IGFyZSBzdXNwZWN0aW5nLg0KQW0gSSBtaXNzaW5nIGFueXRoaW5nIGhlcmU/DQoNCm1h
a2UgQVJDSD1hcm02NCBEVF9DSEVDS0VSX0ZMQUdTPS1tIERUX1NDSEVNQV9GSUxFUz0kezF9IENS
T1NTX0NPTVBJTEU9fi8ke1RPT0xfQ0hBSU59L2Jpbi9hYXJjaDY0LW5vbmUtbGludXgtZ251LSBk
dF9iaW5kaW5nX2NoZWNrIC1qMzINCm1ha2UgQVJDSD1hcm02NCAtcyBkdGJzX2NoZWNrIC1qMzIN
Cm1ha2UgQVJDSD1hcm02NCBEVF9TQ0hFTUFfRklMRVM9JHsxfSBDUk9TU19DT01QSUxFPX4vJHtU
T09MX0NIQUlOfS9iaW4vYWFyY2g2NC1ub25lLWxpbnV4LWdudS0gLXMgZHRic19jaGVjayAtajMy
DQptYWtlIEFSQ0g9YXJtNjQgQ1JPU1NfQ09NUElMRT1+LyR7VE9PTF9DSEFJTn0vYmluL2FhcmNo
NjQtbm9uZS1saW51eC1nbnUtIFc9MSBkdGJzIC1qMzIgMj4mMSB8IHRlZSAtYSBhcm02NC1kdGJz
LmxvZw0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9m
DQo=

