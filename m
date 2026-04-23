Return-Path: <linux-renesas-soc+bounces-31562-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHRMHhr/6WkHrAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31562-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 13:14:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E521145127A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 13:14:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B4D430143C7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 11:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 995123E6DCB;
	Thu, 23 Apr 2026 11:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="DCpAckeM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010002.outbound.protection.outlook.com [52.101.229.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D15F3E63B6;
	Thu, 23 Apr 2026 11:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776942870; cv=fail; b=S1oihgHDm1wsz4Z5dlXHczcZyoqmUvwkJjAapJcMrF9aUqENMWRp6TWCdYVCAVlOZrfWfdV7kHK2K89Sqig0FTuq9N3l/9eSFIsUfbDg+aLAGpZL32836csr7lSK/kLSN1ByU/ZX94JrqJ96kezxn7gf2er8hE6gMb2qNSLMHCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776942870; c=relaxed/simple;
	bh=wJSyQOte6whMKSSNuu1wLFlf4+IIJwpZ2tvMsS6nuoM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=moNAGzN72JmAuqHwGwq5mSmVtnMyvT45L1LLVtheBBuic0zMBkB7gjXaqXqRgKNARFXEo4pK3WxAWMK6bDy5q4HWO7P+GPFvNo94Pu5qMQeO1CCGMMFf1eVep0JD4d0FzWYeqOJKcpzvFGARO8sngwAl6ZRhiz26MJ+w8hWtCM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=DCpAckeM; arc=fail smtp.client-ip=52.101.229.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xBwTsw2YBGYuKp3eUokUYx15HtVj7zR0rEN1F63LmAK+kvniKVIM0cN8d1UEoRH6pGn49oYtRytFIGaXnLR7J8MPOAscVEcydWbTJSghrtQl4P8ugFrkMHnWuWvgpts0sXazDxo+X4lKzZ8M2yMKtPLzvem6n8KQ/xi7PV6UHqWvfQQ2bEjMxDHGi/Ya0wwjwXW3w1cGwfoRjFQTfE+9Xbn39Ku+o2DS2aWYyc2lsE1UVESjPRRoSNCACY7YYclxBjnfi/evmzmfHFLrx2S04USvRRePK6bhsn/Zi7e7i+y+0l/ZcwOKVc6jaSQZ1vByI/aEsBNlYwl0JkWjncQOBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wJSyQOte6whMKSSNuu1wLFlf4+IIJwpZ2tvMsS6nuoM=;
 b=CYsVA9PPNoS8KD7gZ7TRHS+1nvPOrlUkRegpUh8iMsbADpri9lHK5WgLlMDOoTG+AUvs8CC/BjfvNgswvvUc21w3867hviUm6YQ1Fmd0Dp13QxItFKnv7TuwfUtBKVcqMlU4Xy8nlEvI1RhATyWGRRvMItVce4IQtZ9yr/eZefR81kItd9s0Al7P5iw7SWhHc5T3Nx4XWn2TctaZGZZIhn8j7v73cp2v1RqNEbkuqaZjc7MiQg8Jsm0NJVEfC0Gjc0Qotepa3YgPZNolR+C2N+s4MOnf94XwyCmGd5wxFVZtpSYzOoP1ine8N22ozVP2s0O5O5Q11oMwGW7buo6TkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJSyQOte6whMKSSNuu1wLFlf4+IIJwpZ2tvMsS6nuoM=;
 b=DCpAckeMLmVIVcSHFxmnCsXByU8CaDGCdoqJDtSRcgZaqtyN3KC7xg8TeStkMki47JAR8DjrrtHCA7JwgOgoyCQj8o/Qm113LuQe8Ui9TeEAR7byZc1wgXMg3CyEw1gwsSQM1p+XR9tf925DEI7HIrXmk64T6n1cqBx9ujhbGzs=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYWPR01MB9324.jpnprd01.prod.outlook.com (2603:1096:400:1a3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 11:14:24 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%5]) with mapi id 15.20.9846.019; Thu, 23 Apr 2026
 11:14:23 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v5 4/4] clk: renesas: r9a08g046: Add clock and reset
 signals for the GBETH IPs
Thread-Topic: [PATCH v5 4/4] clk: renesas: r9a08g046: Add clock and reset
 signals for the GBETH IPs
Thread-Index: AQHcvRCsLffu7uqAf0KGQAXivH+B0rXskAIAgAAZx/A=
Date: Thu, 23 Apr 2026 11:14:23 +0000
Message-ID:
 <TYCPR01MB1133200E7FF04200635988BF7862A2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260326110648.29389-1-biju.das.jz@bp.renesas.com>
 <20260326110648.29389-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdU4wqFCNobN7mkMNCArP41cGmnbEi5cmuc576EdUL6+bQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdU4wqFCNobN7mkMNCArP41cGmnbEi5cmuc576EdUL6+bQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYWPR01MB9324:EE_
x-ms-office365-filtering-correlation-id: 5e511fc1-bcd0-4f9d-21e8-08dea1297995
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 npsk376fonS/jjITzVbEsyJPLt+eZ2S6jbKF2sSkkVGjhleUeO76b7uzViKJVFWeFLQ/C6/yfZe7NHo6dVkL6ONaoEz6pNQoVTFQxxzpF422e5qFRKKh3ABMBxyxtQuX4NnFxH8bAuZfOYiGNXc7i6b7xqMYZ3GdcnNMMGGV4ChbHSMVi5Roslc8r0sJ0MFeEFCgXSy5OXnJX1CM9wdt6m809MJLJ1/K3B98aWW0d1BCcGnM9WQIM9yEt6Cs/MzeAXZyHuaafYztcMSLJbDRzQ80694n2LjlF1TL92ybjEJcSGf/PgVOzGRktomePZSFXS0XjD3o7B8xmuVh/2OCkYjnvyzjPQubY9PTyv1GeuN2w6TmSaLKe9iB94SaO8D75N/1XpF6Jojw3PoCtx+ntqr3i3E3fqvPSJOW3aA1AbHn03n7VqX0XoyQAr5d9pdbPxOH4oGL3to/q3i40VNgpAgg2DroQQSJo6sdz+Y8jN91onuyRv7Ay32XQjqUOTkVwWAIMkl9EFuFJvy6XnvsNfgOX7+WVK/wmxnJCD3PNkBmDj/yRRiE8L774xTOGx0zRHeLfHVkr7V6lFsE67tbxsFd02MA7eUN50CEuXLZvErAywGSZI3MRrWomiB9BZtXzU0SqshFzZIevzvxbsVv5q0IGfEAMJsEDJdCVIpSyeUZp5lNf+e8OnlaIBmsB0Ib+uAViiU8fc2nObQz+DqtgbTbgsBsxNtG5hD9j2KKTJ2rFWFLpU8r1lc8E9NZYNiTEKHyg9ToGk05mMUmn132ugWztW+TIsg4wgeBjewlObE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R094eTVHY2ROTUxvWkp1eVdYd09ObG5mYkJ0dzBXRmY1OEo5cFFtK2k1cEtS?=
 =?utf-8?B?Zk1WdjZZSUt0V2RtUlRneC9LN1Ezdzg3cWtNalhFZXk4cEkzbUdqaVJYWVls?=
 =?utf-8?B?d0hBaTJCb3dQNWNBQWVKS2t2dVg3QzlBQnR1TUI0Yzk2NzlNUEtzT1lITDVo?=
 =?utf-8?B?aW1OcWhzRlpuMkRSdnhPcm5qYmlsT25MVjdjSjRmWjV5ZWV0TWVFTmx3NS9K?=
 =?utf-8?B?dTdNeGhFS1hHaEpwREUzVUVlWU5IUm9EZmNnRnNXOWJ5OXFTRjdyRmNoVzYx?=
 =?utf-8?B?RXJEQlA3VDk1VVg0cSszcVZ4L2cwMW9pWFhRMzBFZlRxZm9EdHR0OFd6Z3c2?=
 =?utf-8?B?NDZibTcxUDludEFCWEduRzRGQzYraXJaY0N1R0g5ejNNSEU0R2FJaFpobEcy?=
 =?utf-8?B?ZE5JaGl0b3JacVE3RG9tbzVYRmR3SFkva3BOQzJrN1ppNHFxNnlURlk1dUpk?=
 =?utf-8?B?M1o0WHEzNEQvdGFRdFJqTEVJdmZFUktSS0trWDRKY0VKU2NQVVRLWWtlS1pa?=
 =?utf-8?B?SWpNV1pYaFZNZUFwVlY3QWdycGYzbkJ0R0tIaFBZS3orZ1VlcTJvVTdKZFdl?=
 =?utf-8?B?b1NiRzY0QXFqTk5SWjB3UFozMTFLdHROQysrekpSblJLdDhibmIwZ09CalJk?=
 =?utf-8?B?NkQ0V1JVcTQ4L0VFUjZNRFJqWjFnN3RCK1JnSVdlMEVVOTdjNnZEam52VERG?=
 =?utf-8?B?K1pSQy95V3ZsOTZtb2NnMmpNS2NEc2l0S1JCWjl1Y29ya2N2ZFhFZ3EzVnZo?=
 =?utf-8?B?d1JTb1cyZkZLNTNHd1lJRnZzMjlSYWZnWklvVks1dm1SRDQyS0x0OUZTOW93?=
 =?utf-8?B?WnNlU2swSU5Ha3FLa3U4dDNZd2xUS0o2SWxFVnBZUEJUVmsyTFN4c2RXZDJF?=
 =?utf-8?B?dFcweHRTaDczWXZheFpYRVhNQ1NwUEZYSTJsY2VWOHJsK2ZCSmM3dkU5ek15?=
 =?utf-8?B?K2RTVFl4ZG13SnJqVGFJU3pwUVFIT1dqdE0yMGZtNkZLaGNCTThKcWZwb0JI?=
 =?utf-8?B?YllRNGRFWXNGUXhYaVdlT0ZNK094K1FWS1FZRXF5U0NUL1RLUzVTdHZIWXNB?=
 =?utf-8?B?TDdscFowRTZxd0VOYjE4VFFrcnduZTNvb3ljNWJlc1ZHL1hjTVNuZktkdWJs?=
 =?utf-8?B?VEc3TVVkTEJaTkhtWEpudk9naHlQejdkK3E4aFJRcC9qNjBFcEtzdEVsK3dD?=
 =?utf-8?B?M3BwdkpzZk5HbE81NjlSNDI1QUt6Y2lZdDA2M3ZyZm80ZDNQdGZNeXhVcUgv?=
 =?utf-8?B?TTBWTTFBKzhjbWNkV2VETnRFTE9sUFRGcmlRNy9nTkFhUUs2Ti9VbkdhZEVJ?=
 =?utf-8?B?T1hMSitvSWdsWU9CWU5DaXpReTVIR0UwVWQ5NFBiVEVlZjNBVXQ4U0x5TDla?=
 =?utf-8?B?UlU1N2xhSGRXdlhpeFdVMkZqMlZZb214RFhOZ21BZGY4MUhXN0daSytnSk5B?=
 =?utf-8?B?TmhKaVowYmpsbmFZaUUvZDk4T0Jna1Y0aVdVT3ZIKzEyQkx3U0l5eWZnRkpl?=
 =?utf-8?B?UGZkNlV4TnRnQURQRWUxN0ozYWJEby8zbVRlVWVmK0dNTTNCZDdXYlpIenBk?=
 =?utf-8?B?VWR0NWpVSnFmWmxGVWdIbDZNeFovZEdMM0cwZDMvbzI2eExhc3JxdUtHdGRt?=
 =?utf-8?B?eG9Ed2V1ZGlQbUZKdmYxRUpLcTQ3b2FScVA3d3VtRHhCUURsMThnV3duWEg5?=
 =?utf-8?B?WkQzcHhaTG5mOTZxQ25VOGx6eTAzM2FtVTBPQ0szN3c0TnVoaUJuNmRBOWNp?=
 =?utf-8?B?ZXFTM2pFTFp6eGJYcEtlOVEvdkYxRnk5b3ExektQMERMYVora2xjSmUvbEtP?=
 =?utf-8?B?N1RtaldPOEZHWERzc3hHYXlKaUtvMzZ4MlF3c3BrdlJHZEh5QXFqYUh3ZkY5?=
 =?utf-8?B?a05hci9ZdXRBT3I5aW1IemRUQ0tTZ3MxTWRONTlveFNWajRlZ1hITDNSS1pv?=
 =?utf-8?B?bVJHOStFdyt0VGt5UE1KWXlnRXFWUlBuUWowWFd0WTZxZWViM2pUWHhzWFNX?=
 =?utf-8?B?VXhRRjVoTFpPcWRMdzBwMjcrSmNsM2pXdTFid1FoWC9hMVg4RnBxVEU3aStn?=
 =?utf-8?B?UHVneW1TcjVMNmdTLzNaelUzU09kaUQ2Ump4V21CTkZUS3ZnZTlSMW9vUm0v?=
 =?utf-8?B?ZWJ6U3Q2Wm40WkNScUxlWjJINVMyampNQktINXRoTVZoeW4xWVR3V3Y4NWh4?=
 =?utf-8?B?cFp0RC90Mm5peXZrRnJHdXQ3djlJMHNTQXY3V25KSHRadnFuVVhEdjg2amto?=
 =?utf-8?B?SGtKTVV1Tkk5K2ZuK3lnTWYzdWRENHNuSVJ3Q1RvZGVpdEV6Yml3UVVrakRy?=
 =?utf-8?B?dTg4Z1F0T2x3ZmlyalhITmlDaVVMVXY0aiswc1pHUS9CWGdNR0orZz09?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e511fc1-bcd0-4f9d-21e8-08dea1297995
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2026 11:14:23.8284
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tCREM89il81xQ4LE+JaWQpYC65KeeYrBGUoNLqMXfkJUes1IeSaMbohBO/+inG8BOh3NEw8RPzTkWSsBBz5UmukyJSPdj8ihH5UoT77/HJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9324
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-31562-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E521145127A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDIzIEFwcmlsIDIwMjYgMTA6MzkNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2NSA0LzRdIGNsazogcmVuZXNhczogcjlhMDhnMDQ2OiBBZGQgY2xvY2sgYW5kIHJlc2V0IHNp
Z25hbHMgZm9yIHRoZSBHQkVUSCBJUHMNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUaHUsIDI2
IE1hciAyMDI2IGF0IDEyOjA2LCBCaWp1IDxiaWp1LmRhcy5hdUBnbWFpbC5jb20+IHdyb3RlOg0K
PiA+IEZyb206IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+
IEFkZCBjbG9jayBhbmQgcmVzZXQgZW50cmllcyBmb3IgdGhlIEdpZ2FiaXQgRXRoZXJuZXQgSW50
ZXJmYWNlcyAoR0JFVEgNCj4gPiAwLTEpIElQcyBmb3VuZCBvbiB0aGUgUlovRzNMIFNvQy4gVGhp
cyBpbmNsdWRlcyB2YXJpb3VzIGRpdmlkZXJzIGFuZA0KPiA+IG11eCBjbG9ja3MgbmVlZGVkIGJ5
IHRoZXNlIHR3byBHQkVUSCBJUHMuIEFsc28gYWRkIHR4LCB0eC0xODAsIHJ4LA0KPiA+IHJ4LTE4
MCwgcm1paSwgcm1paS10eCBhbmQgcm1paS1yeCBjbG9ja3MgdG8gcjlhMDhnMDQ2X25vX3BtX21v
ZF9jbGsNCj4gPiB0YWJsZSB0byBhdm9pZCBlbmFibGluZyBib3RoIG5vcm1hbCBhbmQgcm1paSBj
bG9ja3MgYnkgdGhlIFBNIGZyYW1ld29yay4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBw
YXRjaCENCj4gDQo+ID4gLS0tIGEvZHJpdmVycy9jbGsvcmVuZXNhcy9yOWEwOGcwNDYtY3BnLmMN
Cj4gPiArKysgYi9kcml2ZXJzL2Nsay9yZW5lc2FzL3I5YTA4ZzA0Ni1jcGcuYw0KPiANCj4gPiBA
QCAtODYsNiArMTQwLDE3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgY3BnX2NvcmVfY2xrIHI5YTA4
ZzA0Nl9jb3JlX2Nsa3NbXSBfX2luaXRjb25zdCA9IHsNCj4gPiAgICAgICAgICAgICAgICAgICAg
IDUwMDAwMDAwMFVMKSwNCj4gPiAgICAgICAgIERFRl9GSVhFRCgiLnBsbDJfZGl2MiIsIENMS19Q
TEwyX0RJVjIsIENMS19QTEwyLCAxLCAyKSwNCj4gPiAgICAgICAgIERFRl9GSVhFRCgiLnBsbDNf
ZGl2MiIsIENMS19QTEwzX0RJVjIsIENMS19QTEwzLCAxLCAyKSwNCj4gPiArICAgICAgIERFRl9G
SVhFRCgiLnBsbDZfZGl2MTAiLCBDTEtfUExMNl9ESVYxMCwgQ0xLX1BMTDYsIDEsIDEwKSwNCj4g
PiArICAgICAgIERFRl9NVVgoIi5zZWxfZXRoMF90eCIsIENMS19TRUxfRVRIMF9UWCwgRzNMX1NF
TF9FVEgwX1RYLCBzZWxfZXRoMF90eCksDQo+ID4gKyAgICAgICBERUZfTVVYKCIuc2VsX2V0aDBf
cngiLCBDTEtfU0VMX0VUSDBfUlgsIEczTF9TRUxfRVRIMF9SWCwgc2VsX2V0aDBfcngpLA0KPiA+
ICsgICAgICAgREVGX01VWCgiLnNlbF9ldGgwX3JtIiwgQ0xLX1NFTF9FVEgwX1JNLCBHM0xfU0VM
X0VUSDBfUk0sIHNlbF9ldGgwX3JtKSwNCj4gPiArICAgICAgIERFRl9NVVgoIi5zZWxfZXRoMV90
eCIsIENMS19TRUxfRVRIMV9UWCwgRzNMX1NFTF9FVEgxX1RYLCBzZWxfZXRoMV90eCksDQo+ID4g
KyAgICAgICBERUZfTVVYKCIuc2VsX2V0aDFfcngiLCBDTEtfU0VMX0VUSDFfUlgsIEczTF9TRUxf
RVRIMV9SWCwgc2VsX2V0aDFfcngpLA0KPiA+ICsgICAgICAgREVGX01VWCgiLnNlbF9ldGgxX3Jt
IiwgQ0xLX1NFTF9FVEgxX1JNLCBHM0xfU0VMX0VUSDFfUk0sIHNlbF9ldGgxX3JtKSwNCj4gPiAr
ICAgICAgIERFRl9ESVYoIi5kaXZfZXRoMF90ciIsIENMS19FVEgwX1RSLCBDTEtfUExMNiwgRzNM
X1NESVZfRVRIX0EsIGR0YWJsZV80XzIwMCksDQo+ID4gKyAgICAgICBERUZfRElWKCIuZGl2X2V0
aDFfdHIiLCBDTEtfRVRIMV9UUiwgQ0xLX1BMTDYsIEczTF9TRElWX0VUSF9DLCBkdGFibGVfNF8y
MDApLA0KPiA+ICsgICAgICAgREVGX0RJVigiLmRpdl9ldGgwX3JtIiwgQ0xLX0VUSDBfUk0sIENM
S19TRUxfRVRIMF9STSwgRzNMX1NESVZfRVRIX0IsIGR0YWJsZV8yXzIwKSwNCj4gPiArICAgICAg
IERFRl9ESVYoIi5kaXZfZXRoMV9ybSIsIENMS19FVEgxX1JNLCBDTEtfU0VMX0VUSDFfUk0sDQo+
ID4gKyBHM0xfU0RJVl9FVEhfRCwgZHRhYmxlXzJfMjApLA0KPiA+DQo+ID4gICAgICAgICAvKiBD
b3JlIG91dHB1dCBjbGsgKi8NCj4gPiAgICAgICAgIERFRl9HM1NfRElWKCJQMCIsIFI5QTA4RzA0
Nl9DTEtfUDAsIENMS19QTEwyX0RJVjIsDQo+ID4gRzNMX0RJVlBMMkIsIEczTF9ESVZQTDJCX1NU
UywgQEAgLTk0LDYgKzE1OSwyMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGNwZ19jb3JlX2Nsaw0K
PiByOWEwOGcwNDZfY29yZV9jbGtzW10gX19pbml0Y29uc3QgPSB7DQo+ID4gICAgICAgICAgICAg
ICAgICAgICBkdGFibGVfNF8xMjgsIDAsIDAsIDAsIE5VTEwpLA0KPiA+ICAgICAgICAgREVGX0cz
U19ESVYoIlAzIiwgUjlBMDhHMDQ2X0NMS19QMywgQ0xLX1BMTDJfRElWMiwgRzNMX0RJVlBMMkEs
IEczTF9ESVZQTDJBX1NUUywNCj4gPiAgICAgICAgICAgICAgICAgICAgIGR0YWJsZV80XzEyOCwg
MCwgMCwgMCwgTlVMTCksDQo+ID4gKyAgICAgICBERUZfRklYRUQoIkhQIiwgUjlBMDhHMDQ2X0NM
S19IUCwgQ0xLX1BMTDZfRElWMTAsIDEsIDEpLA0KPiA+ICsgICAgICAgREVGX01VWF9GTEFHUygi
RVRIVFgwMSIsIFI5QTA4RzA0Nl9DTEtfRVRIVFgwMSwgRzNMX1NFTF9FVEgwX0NMS19UWF9JLCBz
ZWxfZXRoMF9jbGtfdHhfaSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgQ0xLX1NFVF9SQVRF
X1BBUkVOVCksDQo+ID4gKyAgICAgICBERUZfTVVYX0ZMQUdTKCJFVEhSWDAxIiwgUjlBMDhHMDQ2
X0NMS19FVEhSWDAxLCBHM0xfU0VMX0VUSDBfQ0xLX1JYX0ksIHNlbF9ldGgwX2Nsa19yeF9pLA0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICBDTEtfU0VUX1JBVEVfUEFSRU5UKSwNCj4gPiArICAg
ICAgIERFRl9NVVhfRkxBR1MoIkVUSFRYMTEiLCBSOUEwOEcwNDZfQ0xLX0VUSFRYMTEsIEczTF9T
RUxfRVRIMV9DTEtfVFhfSSwgc2VsX2V0aDFfY2xrX3R4X2ksDQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgIENMS19TRVRfUkFURV9QQVJFTlQpLA0KPiA+ICsgICAgICAgREVGX01VWF9GTEFHUygi
RVRIUlgxMSIsIFI5QTA4RzA0Nl9DTEtfRVRIUlgxMSwgRzNMX1NFTF9FVEgxX0NMS19SWF9JLCBz
ZWxfZXRoMV9jbGtfcnhfaSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgQ0xLX1NFVF9SQVRF
X1BBUkVOVCksDQo+ID4gKyAgICAgICBERUZfRklYRUQoIkVUSFJNMCIsIFI5QTA4RzA0Nl9DTEtf
RVRIUk0wLCBDTEtfRVRIMF9STSwgMSwgMSksDQo+IA0KPiBTaG91bGRuJ3QgdGhlIHBhcmVudCBi
ZSBDTEtfU0VMX0VUSDBfUk0gKGkuZS4gYmVmb3JlIHRoZSAxLzIgb3IgMS8yMCBkaXZpZGVyKT8N
Cg0KT29wcywgSSBtaXNzZWQgdGhpcy4gWW91IGFyZSBjb3JyZWN0Lg0KDQo+IA0KPiA+ICsgICAg
ICAgREVGX0ZJWEVEKCJFVEhUWDAyIiwgUjlBMDhHMDQ2X0NMS19FVEhUWDAyLCBDTEtfU0VMX0VU
SDBfVFgsIDEsIDEpLA0KPiA+ICsgICAgICAgREVGX0ZJWEVEKCJFVEhSWDAyIiwgUjlBMDhHMDQ2
X0NMS19FVEhSWDAyLCBDTEtfU0VMX0VUSDBfUlgsIDEsIDEpLA0KPiA+ICsgICAgICAgREVGX0ZJ
WEVEKCJFVEhSTTEiLCBSOUEwOEcwNDZfQ0xLX0VUSFJNMSwgQ0xLX0VUSDFfUk0sIDEsIDEpLA0K
PiANCj4gTGlrZXdpc2UsIENMS19TRUxfRVRIMV9STT8NCj4gDQo+IElmIHlvdSBhZ3JlZSwgSSBj
YW4gZml4IHRoaXMgdXAgd2hpbGUgYXBwbHlpbmcuDQoNCkkgQWdyZWUuDQoNCj4gDQo+ID4gKyAg
ICAgICBERUZfRklYRUQoIkVUSFRYMTIiLCBSOUEwOEcwNDZfQ0xLX0VUSFRYMTIsIENMS19TRUxf
RVRIMV9UWCwgMSwgMSksDQo+ID4gKyAgICAgICBERUZfRklYRUQoIkVUSFJYMTIiLCBSOUEwOEcw
NDZfQ0xLX0VUSFJYMTIsIENMS19TRUxfRVRIMV9SWCwNCj4gPiArIDEsIDEpLA0KPiA+ICB9Ow0K
PiA+DQo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcnpnMmxfbW9kX2NsayByOWEwOGcwNDZfbW9k
X2Nsa3NbXSA9IHsgQEAgLTEwNyw2DQo+ID4gKzE4Nyw1MCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IHJ6ZzJsX21vZF9jbGsgcjlhMDhnMDQ2X21vZF9jbGtzW10gPSB7DQo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1TVE9QKEJVU19SRUcxLCBCSVQoMikpKSwNCj4g
PiAgICAgICAgIERFRl9NT0QoImRtYWNfcGNsayIsICAgICAgICAgICAgUjlBMDhHMDQ2X0RNQUNf
UENMSywgUjlBMDhHMDQ2X0NMS19QMywgMHg1MmMsIDEsDQo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIE1TVE9QKEJVU19SRUcxLCBCSVQoMykpKSwNCj4gPiArICAg
ICAgIERFRl9NT0QoImV0aDBfY2xrX2F4aSIsICAgICAgICAgUjlBMDhHMDQ2X0VUSDBfQ0xLX0FY
SSwgUjlBMDhHMDQ2X0NMS19QMSwgMHg1N2MsIDAsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIE1TVE9QKEJVU19QRVJJX0NPTSwgQklUKDIpKSksDQo+ID4gKyAg
ICAgICBERUZfTU9EKCJldGgxX2Nsa19heGkiLCAgICAgICAgIFI5QTA4RzA0Nl9FVEgxX0NMS19B
WEksIFI5QTA4RzA0Nl9DTEtfUDEsIDB4NTdjLCAxLA0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBNU1RPUChCVVNfUEVSSV9DT00sIEJJVCgzKSkpLA0KPiA+ICsg
ICAgICAgREVGX01PRCgiZXRoMF9jbGtfY2hpIiwgICAgICAgICBSOUEwOEcwNDZfRVRIMF9DTEtf
Q0hJLCBSOUEwOEcwNDZfQ0xLX1AxLCAweDU3YywgMiwNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgTVNUT1AoQlVTX1BFUklfQ09NLCBCSVQoMikpKSwNCj4gPiAr
ICAgICAgIERFRl9NT0QoImV0aDFfY2xrX2NoaSIsICAgICAgICAgUjlBMDhHMDQ2X0VUSDFfQ0xL
X0NISSwgUjlBMDhHMDQ2X0NMS19QMSwgMHg1N2MsIDMsDQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIE1TVE9QKEJVU19QRVJJX0NPTSwgQklUKDMpKSksDQo+ID4g
KyAgICAgICBERUZfQ09VUExFRCgiZXRoMF90eF9pIiwgICAgICAgIFI5QTA4RzA0Nl9FVEgwX0NM
S19UWF9JLCBSOUEwOEcwNDZfQ0xLX0VUSFRYMDEsIDB4NTdjLCA0LA0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNU1RPUChCVVNfUEVSSV9DT00sIEJJVCgyKSkp
LA0KPiA+ICsgICAgICAgREVGX0NPVVBMRUQoImV0aDBfdHhfMTgwX2kiLCBSOUEwOEcwNDZfRVRI
MF9DTEtfVFhfMTgwX0ksIFI5QTA4RzA0Nl9DTEtfRVRIVFgwMiwgMHg1N2MsIDQsDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1TVE9QKEJVU19QRVJJX0NPTSwg
QklUKDIpKSksDQo+ID4gKyAgICAgICBERUZfQ09VUExFRCgiZXRoMV90eF9pIiwgICAgICAgIFI5
QTA4RzA0Nl9FVEgxX0NMS19UWF9JLCBSOUEwOEcwNDZfQ0xLX0VUSFRYMTEsIDB4NTdjLCA1LA0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNU1RPUChCVVNfUEVS
SV9DT00sIEJJVCgzKSkpLA0KPiA+ICsgICAgICAgREVGX0NPVVBMRUQoImV0aDFfdHhfMTgwX2ki
LCBSOUEwOEcwNDZfRVRIMV9DTEtfVFhfMTgwX0ksDQo+ID4gKyBSOUEwOEcwNDZfQ0xLX0VUSFRY
MTIsIDB4NTdjLCA1LA0KPiANCj4gSW5jb25zaXN0ZW50IGFsaWdubWVudCAobW9yZSBiZWxvdyku
DQoNCkkgdHJpZWQgdG8gc3F1ZWV6ZSBpdCBpbnRvIDEwMCBjb2x1bW5zLiBNYXliZSBJIHNob3Vs
ZCBoYXZlIHNwbGl0IHRoaXMgaW50byAzIGxpbmVzPz8NCg0KQ2hlZXJzLA0KQmlqdQ0K

