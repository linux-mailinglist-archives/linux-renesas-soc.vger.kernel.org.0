Return-Path: <linux-renesas-soc+bounces-30560-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFeCCVkwymkA6AUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30560-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 10:12:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2D3356EDA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 10:12:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48D64302FA8A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 08:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 956743A1E9E;
	Mon, 30 Mar 2026 08:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="lfSTxLHz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011045.outbound.protection.outlook.com [52.101.125.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7103A1A28;
	Mon, 30 Mar 2026 08:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774857958; cv=fail; b=JHcTYHgHWGhpOSzdA1XIFWHJcfMg4CfAtD6rrLLVD9Aryne4v31608bY/WPfgbo5/GYjCbyQ0F4fyPNrNFxv8RvSVbgVDwgIbJTy2yUeMc/syr7la1D1xXcmkMmqazkHnfEfadizptgTuogUVvXtZ5OcKY2D2vTkkTjvvXlj71s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774857958; c=relaxed/simple;
	bh=QeA799oDHUYmPVklNmncNtuSoCfRZ9z0x1KwNd0+8bc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RmzKVsxHjZyCKUBOMOFoiZtRbojVNMkozpeIUrvk04nvlHd3w5us/NgahWOBvJgAtd/xkflgdWj00uHO3HB5fjrWkpUf73hdQLnHcLFludYeyUGdJ+hNSoWHkFkSQK/CuQj4O7H/iUVP/uMLmgNBMFHin8Z5D8JcLAZWwM0SoYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=lfSTxLHz; arc=fail smtp.client-ip=52.101.125.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ppuGGR1UiPkfMfSAsCR2gjhBrLyJUu0W2zUt1Gg2l4Glh77siT6/Qoob0tyW61S91aOcRHamn+j+YX0onn0XKDiE7m5SIU7BSGRpa6itKAWi283i8qNoIWDxWuqTlxugXrOSpi5tfp2pEvNJ5XbChNSkA8UCK2uOw8ImJmL84qqoEro3c2zaiYjmIVA/ZRvvn0eWcjAhwfDx/yKBfi5B6lClrMsOEJ+G24xLrh1xBQfNGtpRsdJa4kKjkNNPiuHT/zvwAlNj862NMQ5sFMXYPL5jdVoRGpSyW8Ga/EttY3s8RvMWKo2w5XeHLuXYgrYpY6yfBSj5AqUyTFOeEpzT6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QeA799oDHUYmPVklNmncNtuSoCfRZ9z0x1KwNd0+8bc=;
 b=SCBQS6ykMT2YGJaT3p7zh4hbuayPxSV7d75NVIbF/a5fw6GXHIsF3SG3LCArrMGJU96882HjMFeZGhblP1aMW4bfcA6tRkwRhr5ftpeNuD8qkx2TAfP1xCiQXDEt2pS7AC1u5K8y+GcvR5oE6DThLvoQ1UZzRkboZf9DliBtVoneeI+5jDx86H6LuZA9Oq2qyayGPkUGNj8ObNbMVTHnWOwgIvykc2v2YQN/ykXh4yBSDtiWa+pztwuhrYVuTCRTSFZGKAB5RXuX+H+r2KqzuKJQyQR/P3sYktI5z4vLnXU9WeI1juYvJiggUh2hqDPZ55xUMfbPcVU53ZUQZoZxlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QeA799oDHUYmPVklNmncNtuSoCfRZ9z0x1KwNd0+8bc=;
 b=lfSTxLHzHkdssLx44oJHNCe0OMcArfJSXSoYBv2QwQfHlHP9g/YoyTosCrj9zxnsP1PtCAWrPqjNSM9dNCHO32jaFyEZRoNyyj92wzaAyubYiiq0ctgRylswCUJBpB/iB0dVeU0fJR6kBtc44Ctg4YKiMUb5PLfU8340NDcMkZA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB12163.jpnprd01.prod.outlook.com (2603:1096:405:fc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 08:05:53 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 08:05:53 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: laurent.pinchart <laurent.pinchart@ideasonboard.com>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>
CC: Tommaso Merciai <tomm.merciai@gmail.com>, geert <geert@linux-m68k.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm: rz-du: Ensure correct suspend/resume ordering with
 VSP
Thread-Topic: [PATCH] drm: rz-du: Ensure correct suspend/resume ordering with
 VSP
Thread-Index: AQHcu7jcHKDaFs9uD0+dQmIDdn0jG7W+EqeAgAitVeA=
Date: Mon, 30 Mar 2026 08:05:52 +0000
Message-ID:
 <TY3PR01MB11346B020B270F657727FE12C8652A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260324180512.2277875-1-tommaso.merciai.xr@bp.renesas.com>
 <20260324193311.GB2461076@killaraus.ideasonboard.com>
In-Reply-To: <20260324193311.GB2461076@killaraus.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB12163:EE_
x-ms-office365-filtering-correlation-id: 1bdeb016-9315-4dd7-08f3-08de8e3329df
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 Z2Mux6veeeM+vsFiZwZi+HaZDZnZzrZu9Mu2Jf23Wko+yopJuFtkU2XMZXUSyTN/U2v9P9mabHRlgMU/pD4SHhUIn65dl0GC5BFPYccTbp1+w2qJT8vWmIsLWvDz9Yh5hXwuBIxsUQ79T5Oo/i0tEjDKP7IgfmEdP98Cbx60VjmyQ9Kbgqcz7ltsAJFVePYYZ2I7THdr1b2sAlcabb3StSVbW7gL+uRdh5sFWY2rpAfnBmUybDt3qizXEtNUw0jJJw3BNM4VwM/0gKwVf8wrDkzO4YDzlOXBQzjzVzMU9bBMadX71deA2ruTnzvrzvrU5o1tI1GcM36MN97JMgC4j/sj4hFFprGGt5Dr+vGHGKnVPyAJzyaJCfMjKQigVOlAovPI+ZyMm6bgZyk0FNx8SYRTA3gO+PDfJqj2YO5ycz6pNRUMDvJebaEvoRePUwYum48HakWg3U/VvtZEqVZfuuRkS4dL3y3MV4BsZ8kS9LeXW3iIA24F5JVdu+xaOcNJQq+Audc559WWvX+UhDPRajv8tpdh026C0DSm4iUt9c+wyG8GfMPZbyW8W6G0QtXeIWQE99Sq1WwY1CVAKtCEmQZvkW7PtZA+MlYA4e7XyV5cLcT8pD236lh34nG0BzbrZ7BAmBhfJ2xHszYAKdjxuULArXQHwpmHLsDGHnMIWT5AKIqkWILtUYwOIHCuLphiPuMq4ksjQawNjHWiNY3GYi5DnMKemFMXr20QULkyG29r2u4uh2jCUSeYWfqVcjuZ1QVhL4LqIxpbcC6/ze8+7rcMGFjqbBr9SWiscWCLah0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Ukt6ZlVoSGFCYWY0UkRxcjBIdTZnMXUycVZWQ0gwcHM5QjBFVkE4Zi93cmtK?=
 =?utf-8?B?WExEUEJaQzNidlhKRlM3cHdLazU3cC9XUGR6Y3lYSWFuM3hBZE0ybkMwcmJs?=
 =?utf-8?B?S0F1YWxVYTQ5aE9IdHdXWlBsRmRXTnl5emlCMVRmTnpNc0VCek04UHRxTWVN?=
 =?utf-8?B?cElkUVFoMUQva0RpVE1ROFJycWtTUVZ3WGc0Wjc4dDZ4ajBYK3pUdkQxQXl5?=
 =?utf-8?B?NnFnRUR5RjRCd1pxVE9SMDYrZTRObTE3Q0hITng3TG5aMzVBaUhIY3kvMFVW?=
 =?utf-8?B?WGY2UVJJd2M1YW8vck0yN05VRzFRY0FXSU0wK3ZtRGV5VnIyakxpekxqaDVO?=
 =?utf-8?B?M3puc0lKZnRiTm5iSTBmQ3lIcXBiTXJqVElDa3N0M1VWWUQvYmZDcy9Mb2tz?=
 =?utf-8?B?ZlA4NnpLODRLYlhuRHZnL293ejdieEFGQmVmSDVSV04yL1pOM0RJYXpFMUJH?=
 =?utf-8?B?OXU0cWJ0clZFODBpb1ZScldMOTN4ZFdFSGJzcW8zQys3RFlreWhaZGdNZHh6?=
 =?utf-8?B?N2NIWXgwdmkwWndaaUdQYjhWRis4dnZDN1JsdVpPWmQxQU1aTm80WWxmalVR?=
 =?utf-8?B?OW1rZS9ydXF1SVlmNVdCenBQbWdWZ0ZuK3JEeXRFMnU0ZGVtQ2x4cGdURjBn?=
 =?utf-8?B?ZjMzSHFHUUJPSGNSb3owbHBxWno2RU9Hdk9GMEdRdjZiRUFTeVVHYXk4SjQx?=
 =?utf-8?B?NHZOdTl5QXRuOEZiWnFhM2RYT2IzRTU0NTZrK0Izc3JCa3FGRkNWblhoSHpT?=
 =?utf-8?B?a1Q0SmEwdWRjKzhRK0VtQldJenA3NXM2Y0JrY0xxMmlZdk15OThyVjdqRzRy?=
 =?utf-8?B?N0tkdTZmazdGOE1QK2x3VHlCZ2pFSW9nUFlOK0VLU1ZoVm1tQlhiVS81UTk4?=
 =?utf-8?B?RmpKWDh4bGtFbkJSejhqYlNRd0J2OEd6d3ZjRVJZT0Y0Y1NTdlFiOVZxakxL?=
 =?utf-8?B?MGFSaDVKa3hTVTY1Q0NOcC9VWTllc0IwU0V2aEkwQ1RBaE5POEdSSncrSTM3?=
 =?utf-8?B?U0xJQ3JZamRNL3RBNGNXdzd3MlI4czNHcHJHaWx4SkNNSm1XWGZycTlZcVor?=
 =?utf-8?B?aksyN1VXNkhBTnFoZkgxTXRCREhnYnZPWWVrWU9JYytpMmNpVk1pRjk4akJJ?=
 =?utf-8?B?RzhrV3pCa0hIT0c0S3hVYVRoQk9kaWl5S25qTzdNOEc2Nkc0cWlJbVR4YnFL?=
 =?utf-8?B?eWt5V1p4bWFGcDIyUFpmbGxLSWpFb2FXUWVuNm5SK0h4UEZBandITmhLVnJR?=
 =?utf-8?B?Z3NLa0c1ZGRIUUdveW80VUE2cjNNZ283QUVkQU1NdlJQZi9Yck1VangxT3Ni?=
 =?utf-8?B?ZG91S01tWHFyWUVmM04xTXdPei9icmdwaHlseWc4aWR5VllxcFhNa0JGMGIv?=
 =?utf-8?B?bzFCR1ZKdFIxOS9xeDhLU3BUUkV3Sm1Hcy8zTmZVekVmcnlTN293TmowNENN?=
 =?utf-8?B?S0lDM2NsM3FybFg3WnBSMlMzcGI5Unp4TXhRQnB4bDdpdTlSWU1mdVNnd3cw?=
 =?utf-8?B?bTY0ZWwyQ0hIOG0rM1h2WjlJdXYxekRXVzRodUxVVHhYTCtVUDR5R1JGdE1o?=
 =?utf-8?B?NE5CM1VuNk9uZ3VxTS8wVCtjTWJ2d3VCRVpIYmJ6OXNqYTVIdXo1cDhJa1lo?=
 =?utf-8?B?akdzOE14Z0txL2lHNGUyZVBTOEFPYUF2bGwvTHRPMmlheC80VFZKZmI5SjFj?=
 =?utf-8?B?ZzI1YmFWRTZOb0lBRzlIZ01XakRxckZ5eGgwM2dQaW1wdmNndGN6cDYvOGlG?=
 =?utf-8?B?SkNMQ0tQa1Awa0ozTGhnRGduS2xzcTE1dWFlb0Rjc0FYV2RWNENkQjRCUWx3?=
 =?utf-8?B?d2l4V0taQVdsY3MxbTlTUmwxUWhjNnVZKy83MGNFVHUzamVsaHJDcGhqaWFM?=
 =?utf-8?B?VXZGZ0JPeno1VHBhU0RTdXhnNUxZcFFjVGRjb3pVbjdMYU5ETG1oeFZGSGxB?=
 =?utf-8?B?WGxjeVd6N01ibzdRSzh5R0VVU1pscVNEVWFiZkx1SGNCdmcrTFM3amw2Nis0?=
 =?utf-8?B?a2wrMXc0S1BYbEk1T01TZEJKTXZQVFhjcFdyYmxxeTVtNXh0ZG1wUm5mMnM5?=
 =?utf-8?B?cVJhV1hhcmxaRjFtV1VtQnpNUkRGR1I1enM0TWNOOGhOWmpwZW96ZVJZYlpn?=
 =?utf-8?B?bHRkeFBUQ1hDd1RwTGwxK1FUVDU2NDhCK2h1d250YWJvUEVld2w0RGYxRHE5?=
 =?utf-8?B?N0RjUmZNNUxpbkRvY2NHWjJ6Vnl0cjJpMHVxTllObDk0R3VpYlJ2N1loWlN2?=
 =?utf-8?B?RzAzc05EWDhOQitVWlQrNTNUaVRGZjlhMXlyMm9vbExpb0JIZlR3WUtrODNp?=
 =?utf-8?B?MlJ5VndUbElkbjFpcjdrSnFGb3ByckFmcCtyMWFqN3RzZlBnaHViQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bdeb016-9315-4dd7-08f3-08de8e3329df
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2026 08:05:53.0055
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 33ON1u3O/xNtfd4BSr9iKIUSAz8V6LkqtDJc2YTxzhIjPGzriEgDH4e+eCMsXiGfdeR1Y2bDvFot4e+Y/EigIAt7d87jlZexCp0IhB+UmJc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12163
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30560-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[gmail.com,linux-m68k.org,vger.kernel.org,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.freedesktop.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:dkim,renesas.com:email,ideasonboard.com:email]
X-Rspamd-Queue-Id: 7A2D3356EDA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgVG9tbWFzbywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVy
ZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6
IDI0IE1hcmNoIDIwMjYgMTk6MzMNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtOiByei1kdTog
RW5zdXJlIGNvcnJlY3Qgc3VzcGVuZC9yZXN1bWUgb3JkZXJpbmcgd2l0aCBWU1ANCj4gDQo+IE9u
IFR1ZSwgTWFyIDI0LCAyMDI2IGF0IDA3OjA1OjA1UE0gKzAxMDAsIFRvbW1hc28gTWVyY2lhaSB3
cm90ZToNCj4gPiBUaGUgVlNQIHNlcnZlcyBhcyBhbiBpbnRlcmZhY2UgdG8gbWVtb3J5IGFuZCBh
IGNvbXBvc2l0b3IgdG8gdGhlIERVLg0KPiA+IEl0IHRoZXJlZm9yZSBuZWVkcyB0byBiZSBzdXNw
ZW5kZWQgYWZ0ZXIgYW5kIHJlc3VtZWQgYmVmb3JlIHRoZSBEVSwgdG8NCj4gPiBiZSBwcm9wZXJs
eSBzdG9wcGVkIGFuZCByZXN0YXJ0ZWQgaW4gYSBjb250cm9sbGVkIGZhc2hpb24gZHJpdmVuIGJ5
DQo+ID4gdGhlIERVIGRyaXZlci4gVGhpcyBjdXJyZW50bHkgd29ya3MgYnkgY2hhbmNlLiBBdm9p
ZCByZWx5aW5nIG9uIGx1Y2sNCj4gPiBieSBlbmZvcmNpbmcgdGhlIGNvcnJlY3Qgc3VzcGVuZC9y
ZXN1bWUgb3JkZXJpbmcgd2l0aCBkZXZpY2UgbGlua3MuDQo+ID4NCj4gPiBCYXNlZCBvbiBzaW1p
bGFyIHdvcmsgZG9uZSBieSBMYXVyZW50IFBpbmNoYXJ0IGZvciBSLUNhciBEVS4NCj4gDQo+IElm
IHRoZSBSLUNhciBEVSBwYXRjaCBnZXRzIG1lcmdlZCBiZWZvcmUgdGhpcyBvbmUsIHlvdSBjb3Vs
ZCBtZW50aW9uIHRoZSBjb21taXQgSUQgaGVyZS4NCg0KTm93IHRoZSBSLUNhciBwYXRjaCBoaXQg
b24gZHJtLW1pc2MtbmV4dC4gQ2FuIHlvdSBwbGVhc2UgcmVwb3N0IHRoaXMgcGF0Y2gNCndpdGgg
Y29tbWl0IElEPw0KDQpDaGVlcnMsDQpCaWp1DQoNCg0KDQo+IA0KPiA+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogVG9tbWFzbyBNZXJjaWFpIDx0b21tYXNvLm1lcmNpYWkueHJAYnAucmVuZXNhcy5jb20+
DQo+IA0KPiBSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydCty
ZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+DQo+IA0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9k
cm0vcmVuZXNhcy9yei1kdS9yemcybF9kdV92c3AuYyB8IDE2ICsrKysrKysrKysrKysrKysNCj4g
PiBkcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei1kdS9yemcybF9kdV92c3AuaCB8ICAyICsrDQo+
ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX2R1X3ZzcC5jDQo+ID4gYi9k
cml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei1kdS9yemcybF9kdV92c3AuYw0KPiA+IGluZGV4IGJk
NDg2Mzc3ZjAzNy4uZWI2MjZjM2NjNDIxIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9yZW5lc2FzL3J6LWR1L3J6ZzJsX2R1X3ZzcC5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3JlbmVzYXMvcnotZHUvcnpnMmxfZHVfdnNwLmMNCj4gPiBAQCAtMjAsNiArMjAsNyBAQA0KPiA+
ICAjaW5jbHVkZSA8ZHJtL2RybV92YmxhbmsuaD4NCj4gPg0KPiA+ICAjaW5jbHVkZSA8bGludXgv
Yml0b3BzLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4NCj4gPiAgI2luY2x1ZGUg
PGxpbnV4L2RtYS1tYXBwaW5nLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9vZl9wbGF0Zm9ybS5o
Pg0KPiA+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+DQo+ID4gQEAgLTI5Myw2
ICsyOTQsOSBAQCBzdGF0aWMgdm9pZCByemcybF9kdV92c3BfY2xlYW51cChzdHJ1Y3QgZHJtX2Rl
dmljZQ0KPiA+ICpkZXYsIHZvaWQgKnJlcykgIHsNCj4gPiAgCXN0cnVjdCByemcybF9kdV92c3Ag
KnZzcCA9IHJlczsNCj4gPg0KPiA+ICsJaWYgKHZzcC0+bGluaykNCj4gPiArCQlkZXZpY2VfbGlu
a19kZWwodnNwLT5saW5rKTsNCj4gPiArDQo+ID4gIAlwdXRfZGV2aWNlKHZzcC0+dnNwKTsNCj4g
PiAgfQ0KPiA+DQo+ID4gQEAgLTMxNyw2ICszMjEsMTggQEAgaW50IHJ6ZzJsX2R1X3ZzcF9pbml0
KHN0cnVjdCByemcybF9kdV92c3AgKnZzcCwgc3RydWN0IGRldmljZV9ub2RlICpucCwNCj4gPiAg
CWlmIChyZXQgPCAwKQ0KPiA+ICAJCXJldHVybiByZXQ7DQo+ID4NCj4gPiArCS8qDQo+ID4gKwkg
KiBFbmZvcmNlIHN1c3BlbmQvcmVzdW1lIG9yZGVyaW5nIGJldHdlZW4gdGhlIERVIChjb25zdW1l
cikgYW5kIHRoZQ0KPiA+ICsJICogVlNQIChzdXBwbGllcikuIFRoZSBEVSB3aWxsIGJlIHN1c3Bl
bmRlZCBiZWZvcmUgYW5kIHJlc3VtZSBhZnRlciB0aGUNCj4gPiArCSAqIFZTUC4NCj4gPiArCSAq
Lw0KPiA+ICsJdnNwLT5saW5rID0gZGV2aWNlX2xpbmtfYWRkKHJjZHUtPmRldiwgdnNwLT52c3As
IERMX0ZMQUdfU1RBVEVMRVNTKTsNCj4gPiArCWlmICghdnNwLT5saW5rKSB7DQo+ID4gKwkJZGV2
X2VycihyY2R1LT5kZXYsICJGYWlsZWQgdG8gY3JlYXRlIGRldmljZSBsaW5rIHRvIFZTUCAlc1xu
IiwNCj4gPiArCQkJZGV2X25hbWUodnNwLT52c3ApKTsNCj4gPiArCQlyZXR1cm4gLUVJTlZBTDsN
Cj4gPiArCX0NCj4gPiArDQo+ID4gIAlyZXQgPSB2c3AxX2R1X2luaXQodnNwLT52c3ApOw0KPiA+
ICAJaWYgKHJldCA8IDApDQo+ID4gIAkJcmV0dXJuIHJldDsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxfZHVfdnNwLmgNCj4gPiBiL2RyaXZlcnMv
Z3B1L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX2R1X3ZzcC5oDQo+ID4gaW5kZXggMzIyZWI4MGRj
YmFmLi5hMjJhYWYwODQzZWQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JlbmVz
YXMvcnotZHUvcnpnMmxfZHVfdnNwLmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmVuZXNh
cy9yei1kdS9yemcybF9kdV92c3AuaA0KPiA+IEBAIC0xNSw2ICsxNSw3IEBADQo+ID4gICNpbmNs
dWRlIDxsaW51eC9zY2F0dGVybGlzdC5oPg0KPiA+DQo+ID4gIHN0cnVjdCBkZXZpY2U7DQo+ID4g
K3N0cnVjdCBkZXZpY2VfbGluazsNCj4gPiAgc3RydWN0IGRybV9mcmFtZWJ1ZmZlcjsNCj4gPiAg
c3RydWN0IHJ6ZzJsX2R1X2RldmljZTsNCj4gPiAgc3RydWN0IHJ6ZzJsX2R1X2Zvcm1hdF9pbmZv
Ow0KPiA+IEBAIC0yOSw2ICszMCw3IEBAIHN0cnVjdCByemcybF9kdV92c3BfcGxhbmUgeyAgc3Ry
dWN0IHJ6ZzJsX2R1X3ZzcCB7DQo+ID4gIAl1bnNpZ25lZCBpbnQgaW5kZXg7DQo+ID4gIAlzdHJ1
Y3QgZGV2aWNlICp2c3A7DQo+ID4gKwlzdHJ1Y3QgZGV2aWNlX2xpbmsgKmxpbms7DQo+ID4gIAlz
dHJ1Y3QgcnpnMmxfZHVfZGV2aWNlICpkZXY7DQo+ID4gIH07DQo+ID4NCj4gDQo+IC0tDQo+IFJl
Z2FyZHMsDQo+IA0KPiBMYXVyZW50IFBpbmNoYXJ0DQo=

