Return-Path: <linux-renesas-soc+bounces-28902-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGiYKe+qqWlSBwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28902-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 17:10:23 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3142152AF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 17:10:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D35730053F2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 16:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 344213B8BC9;
	Thu,  5 Mar 2026 16:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="rAelbRJX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010067.outbound.protection.outlook.com [52.101.229.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB68C282F27;
	Thu,  5 Mar 2026 16:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772726988; cv=fail; b=Sx0ePzENu/XW2Ove8/xHWh6N71kUGh4rNjFVQhfOhFqyiQa3pTObL50aHz5ugMMrDlmDbwrFGu6v65DnHcn2UlLqO9mbSJPMTCT4u8rcU0IBaUlEWlExSvAWJGxnNRsioQzWIApnqcu2RfoKh+XlZq/DOB+Mzwz7BbHAoRtFg9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772726988; c=relaxed/simple;
	bh=VgMa7YtCcruZBFkcnwiLuVyJwxEYDvSQnQtfWA/CeVQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UIxnt7nXJv81bvmSEjCV+f5zOilGwWjUxwCY4UmzrgD+hrZvZgqLLVOTImRWnHOwl79g1YIjmKggnju6BRlhDYr6lKq+hQseGO1VcNA38qrKUGTZJox4vR1hnCNX6FA+Bk/Hjt3KbzxKrqIYmn5YK3oRfI46mAbkCocVG5JvpdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=rAelbRJX; arc=fail smtp.client-ip=52.101.229.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x+35je4wPXqA6PbiyOhgW+awJfZ3A51crTDBf+t1vp8AHtswoYmBzIiLnxLloAMgAmq8+HxB8grdJ1KxiYjdXl0iahBqHXgVe0fmoQWzG8pJL3dYYl0CvWtdVV8izc6xnkMyBZG03Tl2l/h6pd9MHc1d59oj8Wc54kQWa+bYItt2Athi/WVTF9V4T92OnM4vLmBopffrt5aaP3sDkTvHJFjck7ZOr4NPvBz10ZwTzjoyMb0WYvQRNiXfob6UQEoDqj5uvVSKgaV2PHfcekbPfIuLbivLquf5hFYaJZ5UdBVmzxEh0TUFjfzTAJxpL2qNynEfIc4K3uubeNiwZr/OmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgMa7YtCcruZBFkcnwiLuVyJwxEYDvSQnQtfWA/CeVQ=;
 b=to2v7AWKlaNTZWKwE/Fg4EPnolUvUixYc3Q2kbjSqjS0QLiVaqv8J1FVxa9Ga1fFjJcrA2xCQ9fFxDOBlOCvzHv4OlQlmdCdEHyeL31Gh5fK30z7MJ9yXFIOLJCy43sC7weXtqeB/mkonSx52eWuB9H74vFJG6st5MCqpzU/IKsY5yusFf33Sb/4Kx5iysG5lb+EszEeuemKJjC/KspsKVBNvIRHljtiHRSuFFK48UuWxrQQGeBkTJlO1af0CyUcUrFKWOUUcu5S/rJEn1Ejr7wV9CalKWeQ2gOvmS7ZiZzZCb/S73AWUsBdBCeBNOAx1NRLg6HVfuSZidcOkprpcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgMa7YtCcruZBFkcnwiLuVyJwxEYDvSQnQtfWA/CeVQ=;
 b=rAelbRJXpljvS+S663mBVau5o67CXUNO0m6MxJZ8DXfywTPd26rA63JNvXIJY5qQ/VY7mutxGUL9TMdmU6elI7oyw7ntCq6lyhEX6gD6ZXOMRePaal/EnmvLN13XH8BzyI0WNJ9DjJngh5bajLuiOV/t3Lj0Ku6rRxr3KGkkQTk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB12926.jpnprd01.prod.outlook.com (2603:1096:405:1e1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 16:09:43 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 16:09:43 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: magnus.damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 07/10] arm64: dts: renesas: Add initial DTSI for RZ/G3L
 SoC
Thread-Topic: [PATCH v3 07/10] arm64: dts: renesas: Add initial DTSI for
 RZ/G3L SoC
Thread-Index: AQHclPgnKnK+tkYa1Ua6JHvG2H9MT7WgNeCAgAAA6wCAABPnUA==
Date: Thu, 5 Mar 2026 16:09:43 +0000
Message-ID:
 <TY3PR01MB1134640428462A79D1E446719867DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260203103031.247435-1-biju.das.jz@bp.renesas.com>
 <20260203103031.247435-8-biju.das.jz@bp.renesas.com>
 <CAMuHMdW20h=D9Tk5T=6rxNanEiON1ZL35CJ6cqzrX12UeDcdPg@mail.gmail.com>
 <CAMuHMdVsv-T-Vjd4yNK2k_pP_YQfw82UvFvYf9ynxMaQJQYxQQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVsv-T-Vjd4yNK2k_pP_YQfw82UvFvYf9ynxMaQJQYxQQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB12926:EE_
x-ms-office365-filtering-correlation-id: 2c86443d-9916-4e49-8853-08de7ad19cdb
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 aewk8dx63Kf59Etwgn+ckWgdY+2P6AGOT1T/qKq9RdJaSB0EQBJORvJzWnsaqw+Jb0IPPcaR5U+lBF+o9dWj0zo4K2yEG/AqVt6QxcHaNAPxbVVecy7guDZoS6xBANPJ9YwWDnZPvqUs1y0MFXBzCkrLf82pUrBYBmeisFNNZeTgKbrMiKe6C4oSPVqQyQoV/kaiffIygd6NnDawI67bgNZvv15iIp02jJIQzximdbwOR2+SzNts+dY50Pl/HSyeDBZmzKrUH0au4EhrDkbUgO8mebWDlUr7gpEtr68/vxUgZpV1fphCNfZryebBk3L+Qq+976H66EVsAH0aAhBfFRRbU3sWdErUVOsmlCxedQ2ZQKF+wicZoXipZ6wLkxM45Hu+UlE/73o6gfenksBaK4ZBV36vt++qETQHRbtt1ptdrBLJ9NFMVljoYkpVeM7p6M6wzlf4Nl2lhexFQ8tRNXDLwYG0o7Nibz2C6IPyms5BB1PvVcpS2S91j6VqxrDWzNsJLufjywHnjyL1qyG3NLgHBMbZxaoxI35+SH1mxZoIe/5/qQ5KzOApNUCgJNCABkho8CUxfsvNZ4DRxntlDYNuq84+nfaQLZwDvPgn80uBfvMVHsUoFSOR6IsG6pFPF7dSgQ6B7hKcuBqsAByKLo8iQxfwLCmHu+JJPPc7G0AP0iYxEaYfl4/8SoGHmbNhN+Lh97c2BnSw3RR67hxY8r/niG14agnrEA/iYH+AOkutxicCy+FMXoCa0A4tjIZVCBT2Iw/iR2rLr0elQ646+2RBbOFUhfEZZ/hhD0xVtPU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TUdrTE5oaHBod0RxbFAvM2VzUzAydnRKMEF6M0luVVBCQ05EaXM4OHhobm8z?=
 =?utf-8?B?WXpYT1lKajVnRWc5ajlTWU1pckxkZGs2ejFyVjdrTDhJZ0dHRCtRZGFQREJK?=
 =?utf-8?B?Wnk2ZUN3RktoTEYvcXpvU3F3Y1hRaTNSSURKRzRqbGZyRGdxOUEvTXJ2aTBF?=
 =?utf-8?B?MEtzMUh2M1Vxb1dRc2s0Wm1OZkxPVFpta2pWMmI3b09sdzl4c1BCYllTaGFS?=
 =?utf-8?B?WkV4NXg1amRyZHRFenp6VEZLWUVLSWtqMDYrWXkxNHVVZFBEWjFKaVdCL1Vs?=
 =?utf-8?B?TGpvSFhwQjBpbmlQWHhRQnJPNGhWSURka0xVaW56c2wya21VdXFVcW9XQWty?=
 =?utf-8?B?YURBN05YNEF2YWpLb0JQOXpBeHlqUk5iZFlScVVnelErbGNraEtPOEVOeDd5?=
 =?utf-8?B?YmdoZzFWSUpaaU5pclowZkNyc2dsdzB2UHJmQ0N6MzIzVjZtdmxSdkVEbVh0?=
 =?utf-8?B?N0Y3VUZzMjNyWjZmWGdKeDVIUzEzQjJtcEY3T05FczI1WmI2VWZ5SUlGR2VD?=
 =?utf-8?B?MVFheFExRXlDeXdLd1ZQREo1aE1GWC85anhpY3YwU3ZrMVdiSGhWRlFSMHVO?=
 =?utf-8?B?cERCTzhWNnRGMmo2Z3lNbEZGd2lpdXlsYStLamo5OUV1dDVSM1pNSFFxSGtr?=
 =?utf-8?B?TUFhNnRpQ0pGa3FaRktGb1FwdndvMjQyTU55Z0tqc1RXUEg5QVcwVStSajRY?=
 =?utf-8?B?QXgwdlFkOHlJMXgwbE5RRWQxQ2o0WjhNVUxZeGRFeEhHSDQ1d2FVMCt2ay9Z?=
 =?utf-8?B?d1dxL29jc1UvUGMxR0RDNXgvWlprZldsM3Z1YkxIY2dHVFpCanI4L3JMT1Rm?=
 =?utf-8?B?TXEzTzdHS1hZUjNmd1dSWkJCVGlhL0x0aUFob2dxT2M3a25UY29ZSUdIbWpX?=
 =?utf-8?B?c3M2cDQ3YWU4b1RNMVlMaG01QnR1Y1BDSnVEZnY5SjI5SkUxTWUwNU14eExn?=
 =?utf-8?B?WGxNYUhFTlVaZnVjRUNSNGFuZUtKeWk2THp2TkUvMG93cFEwM0xMVWFzaXNK?=
 =?utf-8?B?NXJyRTFERUNuZVQxMWhwQ2R5U0MrMFd1VWZyQUFEZ2k2R3Z3ZDdGUDRWVCsw?=
 =?utf-8?B?ekZmV1ZROFBwdk5SNjJyVmNjaUJXVFVGTFhZU29GVkJLWVJYZHpXQlptYnQ0?=
 =?utf-8?B?dEVDZTI2Mjl1T25sQnhKdjk1aDRIZzBXbWlBY1lOWHU4cUdSYWNmMjM0Tkhi?=
 =?utf-8?B?ZmFUZmowVlRvWThOcXRDVXBvMUNXUkQzY25SUjlpSWdTM1pvQTRzQ2lqVnpO?=
 =?utf-8?B?TkVNV25MVUFlUEJCVjFqcDJ6VVppWHJqaUlWVjJMRmd6Q0hYUjFWMFFkTy9y?=
 =?utf-8?B?TU9lb1NkUXVsQXZhaDZjcXpJdGVCanh0SjVtSFcxV3ppOWg3NmxjS1ltajUw?=
 =?utf-8?B?aDUyb08zdVczU01pcm5SRWdKWlVBZHpyVE1Jai9XKytBaVF1U09RblpuTEdN?=
 =?utf-8?B?dTlPMXFyOVAyeHdnRmx1K2IyOGgwaWcvU3pOUGZENzc5c28wb2RKWU42ajla?=
 =?utf-8?B?ckRjM1FSaTlFcktkeTEwSEFLYjdLR0Yzd28zdnhUWDRWUVpyWmxVVDhBRzg0?=
 =?utf-8?B?OFYrNm1KMEhQZTZPS09NdDR4Y0ZlbWpvRGJITHBLRFNxd0I2eUpoRCtELzFQ?=
 =?utf-8?B?T0hORVhSUHZmZW1MeFd6Qm9qVTV1OHVPRTZnalVaMG1hS05uZXdieGVuNzRn?=
 =?utf-8?B?OWwwTGdWdDFyRXpjWXVqK1FwN0xEeXZQNUt1elVVU1ozS2NoY2dJUGxoQkd6?=
 =?utf-8?B?MUtsQTUwSWl3SDMxdnRNSFZSTDdVQ1dGWjROV3dENVM5OStWVkdja1FvbkhB?=
 =?utf-8?B?bERXOU5raE1QdWdvanJpY1J0QUNvWmFCYjJvdXFqcEJMSXM2Z0xuK2ZwNHpq?=
 =?utf-8?B?ZDhWMlNGK090REpLUzcxYm9oT29RSFhBNm1PUFM5cUdqQ1BsZ0VGdjlza1hu?=
 =?utf-8?B?SUtXNksrblpsVThydjhLMnVmS1hEMWd4bmc2Rjg5QmJaanZyY3RuRjdPa3p4?=
 =?utf-8?B?RDFHYUQ0MXJWQ1NyZVRWVnJYZ1pqVEExd1d5TUdrRVp0c2Mzdmt4TytHdzFH?=
 =?utf-8?B?ZGJJSUl3YklxYktUeE00RFNpTlZVUGtNaC9BYUNhVHRMdHQ5OVJxcTJkT1ZF?=
 =?utf-8?B?Q2dhTS9yeE8wbmNobW5DRXJHcXdONGt2aWVxaEVkTTNzaUlqOHMrdHpyajM0?=
 =?utf-8?B?NUFJVnBKK3cxQzRXMmhjUlFlS3ZNbUg0YzFMYkFSTXAyZi9pdzc1bG5IUlIy?=
 =?utf-8?B?VVppWWsyUTh0dUQ4QWkyVllEbERrZDJIMk82STFFSmpwcmtMNlJ5NWphSzYw?=
 =?utf-8?B?elZqcExRTlVhMWwrMnJpVWwvakhqb2JZeTRMcG5hVFNqejNQK2t3QT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c86443d-9916-4e49-8853-08de7ad19cdb
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2026 16:09:43.1473
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lio/SBlXUMBFB7RCPaGRvQyhNvCcajSBV3+QNK33VDI+hSQsUyjrnj6IYhxshA6+zYsRxoOKBrzZra1u5oD1li2hDQq1wqqs0tnto/0AED4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12926
X-Rspamd-Queue-Id: 8C3142152AF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-28902-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux-m68k.org:email]
X-Rspamd-Action: no action

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDA1IE1hcmNoIDIwMjYgMTQ6NTcNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MyAwNy8xMF0gYXJtNjQ6IGR0czogcmVuZXNhczogQWRkIGluaXRpYWwgRFRTSSBmb3IgUlov
RzNMIFNvQw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFRodSwgNSBNYXIgMjAyNiBhdCAxNTo1
NCwgR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6DQo+ID4g
T24gVHVlLCAzIEZlYiAyMDI2IGF0IDExOjMwLCBCaWp1IDxiaWp1LmRhcy5hdUBnbWFpbC5jb20+
IHdyb3RlOg0KPiA+ID4gRnJvbTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29t
Pg0KPiA+ID4NCj4gPiA+IEFkZCB0aGUgaW5pdGlhbCBEVFNJIGZvciB0aGUgUlovRzNMIFNvQy4N
Cj4gPiA+IFRoZSBmaWxlcyBpbiB0aGlzIGNvbW1pdCBoYXZlIHRoZSBmb2xsb3dpbmcgbWVhbmlu
ZzoNCj4gPiA+ICAgLSByOWEwOGcwNDYuZHRzaTogICAgUlovRzNMIGZhbWlseSBTb0MgY29tbW9u
IHBhcnRzDQo+ID4gPiAgIC0gcjlhMDhnMDQ2bDQ4LmR0c2k6IFJaL0czTCBSMEEwOEcwNDZMezQ2
LDQ4fSBTb0Mgc3BlY2lmaWMgcGFydHMNCj4gDQo+IHI5YTA4ZzA0Nmw0OC5kdHNpIGRvZXMgbm90
IGFwcGx5IHRvIFIwQTA4RzA0Nkw0NiwgYXMgaXQgdXNlcyB0aGUgd3JvbmcgY29tcGF0aWJsZSB2
YWx1ZT8NCg0KT0ssIEkgd2lsbCB1cGRhdGUgY29tbWl0IGRlc2NyaXB0aW9uIGRyb3BwaW5nIFIw
QTA4RzA0Nkw0Ng0KDQpDaGVlcnMsDQpCaWp1DQo=

