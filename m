Return-Path: <linux-renesas-soc+bounces-32250-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HV3M3GQ/Gn3RQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32250-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 15:15:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6E04E90D1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 15:15:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D3379301AEE5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 13:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05AC437A48A;
	Thu,  7 May 2026 13:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ercZ8pDh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010016.outbound.protection.outlook.com [52.101.229.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C77199931;
	Thu,  7 May 2026 13:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159589; cv=fail; b=DevzUnhO2F/z4XxDQICVK5U76Nl71zcJhXG4R1w/9Bnuxqu4c0nl6KmFsMHUvR2wSPAu5LYCkLBLAps8ElocX1qBUWCrAL7+dIdBwXjatBtnPBDKz8jQ1gWs3lJB+WHlUjrqUVXlAi7JdeVKKf3kKhiAEflLFpUWjjs+M8CP/Ls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159589; c=relaxed/simple;
	bh=gau6xRggLNp9hvKYnmIAttd+02tlpeO+LZrc3CYsV6c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MyqEwsJqFR5Gh89YcNxD//H0i9NDJy5fyTz/9kUcHX0dyQow6OzJmwRauQp9okEnbJCWXFh8YIPgx3q38m7FPsOuH4ReICwcygs81kjQsqLbBPRwz5lcZvG3DUQMmhYJzuz1e68bXblA19FxG0Oja/biXz8IpSdLZePf13Ft5dw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ercZ8pDh; arc=fail smtp.client-ip=52.101.229.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rF7BPr37I66GBxIWHEi3d7eV36LOCi45gNuk+ZFN6jBvz04MTaIEhX/S1DExmdJxetB9kJNlytXKOgxvB8sKxUymAHg20qwQpNTHFd3j8mC1rmnsjkzaFe6lh4ShaKk6Pr1tk57gdZMc9qMRwXs5IDcjOkQJJGa8sqWnnC+/iag0pZUIEZUnzXu8zHt7DlrJwzHKqrwmkr6tqyRHo/Gen5XnYah48Bggx9gj5XZpUVCwUPesVmNwQpBn7IJNDNXKUl3jJzsJEa6VeWR1qPEt0DGHsPAxraxSAh3EqAWwt7eYeSKcbuDhyZ3AisGrG2qujHaPa/V6MKLM3zig5vA1JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gau6xRggLNp9hvKYnmIAttd+02tlpeO+LZrc3CYsV6c=;
 b=NsLdvevPjJ1eB8lc2JOV0FieVxNUYmAJfu/EKcghh6X16AmmOLEuwMxV1DmV7eSbElBOyIqaIqRJSY3akke+gg2JXWy2xmepNw/ceKb80n+XEGLGpIAhP/Wr22eNw6qIOe9fs7jDbmIGOSGqXRzLVfscuNAcjGvY5dr5/svejWMowAhbOQIFCIIDeG7BZEa89CuyyPmLgERNH/jbBNVQ7LGdncpco5X8/0NGcBdMLgnWFSTRADzcDBeNszYS0+jFL/zZegWcvT3tuTDgbsAYsyJDZRdD2QZszXZ1EXqyCJpBCux6QYOuWuzVhUsmXfrcnR2WvxvI5DLpQInOOFi+gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gau6xRggLNp9hvKYnmIAttd+02tlpeO+LZrc3CYsV6c=;
 b=ercZ8pDhgzhhIvHyc9OfxDmJia3vh5RONty3e18TYWIB2ZGS5a+URCIIL3BBZVo/19l+k3PZEZVzQvdmKluSvqx70K2inGRx3DMggJ/d9eU5bgm4WKqC0sSPGJIVoax0+ornGG+2Xxono336fv9BpbFUxR9McvnbDbC8Si9Iezs=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSRPR01MB11678.jpnprd01.prod.outlook.com (2603:1096:604:231::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 13:13:05 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 13:13:05 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 3/3] clk: renesas: r9a08g046: Add RSPI clock and reset
 support
Thread-Topic: [PATCH 3/3] clk: renesas: r9a08g046: Add RSPI clock and reset
 support
Thread-Index: AQHc3F8D48PUsy4+m0CJyvXZjDYwvbYChkMAgAAChGA=
Date: Thu, 7 May 2026 13:13:04 +0000
Message-ID:
 <TY3PR01MB1134648861A88ECE4F6E22638863C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260505071544.8965-1-biju.das.jz@bp.renesas.com>
 <20260505071544.8965-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdV6KBSzVWZ_zSu+_p9MCK7=ZCv9hbKTo90w7n9C4nJJdA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdV6KBSzVWZ_zSu+_p9MCK7=ZCv9hbKTo90w7n9C4nJJdA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSRPR01MB11678:EE_
x-ms-office365-filtering-correlation-id: a85f71c3-25be-4c94-1a58-08deac3a5fdc
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 ECLZNnjR0gXVaSzemU+9sZIWm4ovyYQU347uGoshjT+tAdX4x67As93tVfQo85ilQJArAUdgPJN3uYgB9Fe6T/wDYbNJWz6toR/GS4ZjvAol3aaoJ79jsy9hC5QgYLPBWT6R+kVGHfe0klQmYwMuJmvkYbhswU++a6kwiGYmF5KsVJwNOVp/zOLYZG7cdcCp1WSyzhBiffMM/PeRFbq4J6JIxM1/I3bKTULE5pOjJK/o+ngPwpEEKnIo2Ca2W5ik7rp+CUNQWaqVoPCoFr9AuFSRZ7aaTZTQ/yKadA/NZhAdvhF+XPbAqFEmmMHQjbKARoo43pAVAP1k2JXMdJdnpJEEwIdDccufyIXgem+nlT5YoiDZOhscDC2t9tCAn6qAsQp8HKE5D9vhLuyQDhXi9GMgGl3uf3cNDRC5zQ3k1TGp4Qz3ybOB7/NJT9hy+3A4bjUL1P9I/UP1PSlCOQ30vPOimh8n7szYXly9bGfDRFWTK3tu5bwszNvex045Jx4OHllhmf0+dVst+//uWxkdtY4xoUTr8RJmO7eBGQGfS2o+AT1E7za69RWjk+lLxn/JCjAFtQKKiYg4LVrOcigY4DQluEnLHHbKuGfUceju42z3rDl+q8nl6RFsWsPRxsvbAGhm8ZlyIDE09+g7p9VhYXAhzPbCWk7ZL3LCDwheCW/OvLnYfy0VUwJ7KXuF+XoAqorR6lycDkSA5YRAZNa7lLMWwJfFu04gYeD1JFYjkdx4SUfNByXlwGeSqqxe4Gse
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?elFvT3A4SzdPNkh1SDh1WnBWUGpGQjd4dzRGOUJCa0ZVbGRMdTJyNmNKaERV?=
 =?utf-8?B?WGxOTWRzdzUzcllFdlZlTDk1VTVVSE5nbTcvWncyMjlTcnRMRVhER1kycFds?=
 =?utf-8?B?MWNHaWoyeTBWZytJc09lZml0bmtZZEhFZEFVTmxudjFaSHNKNm1kMHBYQ0hN?=
 =?utf-8?B?R29Yc2NHQTVyZGswV0w0dy9nMGVCRzZHVFREc0RhRHBDaTNhaVJUSll4UlNn?=
 =?utf-8?B?Y1MydnZmWHVGS0pvcFc4a0hTQWwrclNpTDVUb3VMVFdnWGJyZmRCZDZ0WHJh?=
 =?utf-8?B?QThoVTlQUmxaMXhCTUhXUlE4aVhaU0JzTm1sVml4bHJReEQ3VnphemwvQnkx?=
 =?utf-8?B?Mmwxb2djbjV4TkJLMFJmNVRXVE0zUUU4QlZrcWFCK3Z3elh1elMxOStCM1ZF?=
 =?utf-8?B?NjN5Y3ZKQzJOaXVIQmdmZXBSL3NUd1ArQjUrS3lIbnMzOVVxeE9lUUEyNDA2?=
 =?utf-8?B?RjNySmxtZXlGaFBlaDZ2M1piUU5LZDl2OFN1bVlpMTk3Q0tOMEcyV3hQZW1h?=
 =?utf-8?B?ZW9XNHNuV0l6UGh3d081Y1QxVnlFNTNrZ21IcFhlUVFLQUNzZTE2R0VaZ3Bs?=
 =?utf-8?B?VUd6Zm9NZS81UFJ5d01DcTJTMENPUU95YmNZdUMxL05aZFFGcWRBSkxvTjFC?=
 =?utf-8?B?YnNVWk91SXJDNzhLS2w5TDAxZkdRNmRHSmNGVmtRd2phNmxpQ0R3VkE1UTJ0?=
 =?utf-8?B?cHN4U0Qzenh2bHFZbnphcTY2VGMrNVhoZmZVeWRGZitlQlVyTFdDeVBYYk5O?=
 =?utf-8?B?WkQ1TzduRnNySkp1ek4xOUtPQnF1Ynp0cGw0R2MvMG5KNWVJTkgva2o0TkZv?=
 =?utf-8?B?NzJFbEUzekJvbFp0TTFJanpyc0VVZndhSWg4Y01YTWZWRGtCVS9BOTVRS1kr?=
 =?utf-8?B?elY1amxITWlGUnV6d3lOdUFUbnVaa1UwYWkzdGp4ODNtY2NhMlR5ZGoweWM4?=
 =?utf-8?B?Q0JRclJKc1NPUmhQaGxrMmVZZjN3Mnhxd2ljUGswVStuc1ZGVE5Kc2ErdnNY?=
 =?utf-8?B?VDlSUWI0N2JwdVREZG40SXNPZExLbGYxWkxNaU1QRFFRTVpFK3VtbWpOdlRU?=
 =?utf-8?B?dnRqaFVsTFp6OHVWYVJLaklKVVF3eU1iNWoyQzYvVEM0b1c5UEN3bGVnekdX?=
 =?utf-8?B?TDFWZmc5Uzd1YW9vdUFyc2hhNjNtbklBeGU3ZkdnSWNGMzdNdmtGUi9XeUdW?=
 =?utf-8?B?eHl4Y2tBSThlRkM0cTlGRW81RXFjWDBQejh2QTlYS1N5MjVIdFVDaUc2VDRD?=
 =?utf-8?B?c29YRE5DZUlBejJUbno0UDVyM21GSEVPbi9IcnM0dDlMQVZjOTFHOWZ1Y2to?=
 =?utf-8?B?STJnZE5jekU0aWI2ZnMwYjk3N2xqVCtubml1Z3I5MDlZVUVic0lqdUJqVDVY?=
 =?utf-8?B?WkJnUnB5eWQ0QURiS2kwcUswMnFHc2w3WnZ5Z3UxRkxWOVQ1YWh4WDlmOHlw?=
 =?utf-8?B?QzM5WGhPaWNYcWNxWmcvdThqaEw4eUwrbVZiYnlWTkpKQnk0UlI0c004c2ZN?=
 =?utf-8?B?L1Q1L05CV2swY091emRXNjNqWk9SYkFKU3ZuNGhaNGJMSzhZblRoOEZiaDNN?=
 =?utf-8?B?VDZ3bU0vN0tsYUdYQUM3QXgyMDdERTdibEg2czY5SGtQUjArclptb0xoTEhy?=
 =?utf-8?B?REd2T3NPcG1aTFU2Tk1FL1ErQUJUNlg1S3kyNnU5U3F0RlpXRUtYZXB3SUsx?=
 =?utf-8?B?VzJTS3d5TURUaFJ3eldaRG8yTlVJSHRxRmtrUEtZNHNpUVNZc2tzWmJkVGlJ?=
 =?utf-8?B?L20vQXgrbGdMU3FKdUROVmFiTkxpeCt1SVFxNjJUU05DazJjVys4MEhKQ2NQ?=
 =?utf-8?B?Y0phYjNRL3l2ejA4NjRQdjFjbGpjSTV3YnBnZEg1RUt5dmVnRmNKMGlBOWdm?=
 =?utf-8?B?WFNBanU2bXZORENlY2U4VkRnZUNhS0JlSHBzcEw0RjB4dHZrTU5YcE9EZFpm?=
 =?utf-8?B?K0ZwODhwVXRKYTE3dTZsK0Y1MTZxL3pQUnhXd1RwTklqUnZ1R3ZOb0hRVkdi?=
 =?utf-8?B?SzhCcTRqWFJSejVjb2Z3eTdDaFFPand5YjVZL2dMbGFJUi9QYmdnalVsMGpF?=
 =?utf-8?B?UHU1UEJobXE4ZmkrMGN3S2hFZXZ0TVpYNldLdFUvMjhqSCswaFZldC85aXJU?=
 =?utf-8?B?eW5tVmdsQm5DWGgxVDU3VkFObmxGbVNmckVUTGw2Vk1lS3JLQ1ErTkpKZE04?=
 =?utf-8?B?OElhbHE2UnNKbldLYzlVZ05jY0ErV1pYbk1tMFpNT2ZaVzBlSjB5dXI1RWN3?=
 =?utf-8?B?TUtIMVhSdjRac0ZBb0dnWGlqV2o3aENmNjFQTEwzM0NNZWdtNzdHNHJQUGlV?=
 =?utf-8?B?NzNsUFNkOVVtd0xDeGdUQlliaUxpVC93bFExbU0wS25jVXJFVlc3dz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a85f71c3-25be-4c94-1a58-08deac3a5fdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 13:13:04.9321
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wCqE2tybwoDPp/SRBBR2I2tsRoHZnWGh8uUEJSaTWDE8aRvkxIV3nV8YPO5FQ0tWTrGcB4uPvwz3Lvt+DAPz+ncPxdur4YnfNNcQZFys4Oo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11678
X-Rspamd-Queue-Id: 6C6E04E90D1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-32250-lists,linux-renesas-soc=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux-m68k.org:email,glider.be:email,renesas.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Action: no action

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDA3IE1heSAyMDI2IDEzOjQ2DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
My8zXSBjbGs6IHJlbmVzYXM6IHI5YTA4ZzA0NjogQWRkIFJTUEkgY2xvY2sgYW5kIHJlc2V0IHN1
cHBvcnQNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUdWUsIDUgTWF5IDIwMjYgYXQgMDk6MTUs
IEJpanUgPGJpanUuZGFzLmF1QGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4gRnJvbTogQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+ID4gQWRkIGNsb2NrIGFuZCByZXNl
dCBkZWZpbml0aW9ucyBmb3IgdGhlIHRocmVlIFJTUEkgKFNlcmlhbCBQZXJpcGhlcmFsDQo+ID4g
SW50ZXJmYWNlKSBjaGFubmVscyBvbiB0aGUgUlovRzNMIChSOUEwOEcwNDYpIFNvQy4NCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4N
Cj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvZHJpdmVycy9jbGsv
cmVuZXNhcy9yOWEwOGcwNDYtY3BnLmMNCj4gPiArKysgYi9kcml2ZXJzL2Nsay9yZW5lc2FzL3I5
YTA4ZzA0Ni1jcGcuYw0KPiA+IEBAIC0xNjgsNiArMTkwLDcgQEAgc3RhdGljIGNvbnN0IGNoYXIg
KiBjb25zdCBzZWxfZXRoMV90eFtdID0gew0KPiA+ICIuZGl2X2V0aDFfdHIiLCAiZXRoMV90eGNf
dHhfY2xrIiB9OyAgc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdA0KPiA+IHNlbF9ldGgxX3J4W10g
PSB7ICIuZGl2X2V0aDFfdHIiLCAiZXRoMV9yeGNfcnhfY2xrIiB9OyAgc3RhdGljIGNvbnN0DQo+
ID4gY2hhciAqIGNvbnN0IHNlbF9ldGgxX3JtW10gPSB7ICIucGxsNl9kaXYxMCIsICJldGgxX3J4
Y19yeF9jbGsiIH07DQo+ID4gc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBzZWxfcnNjaVtdID0g
eyAiLnBsbDJfZGl2NSIsICIucGxsMl9kaXY2IiwNCj4gPiAiLnBsbDJfZGl2NyIsICIucGxsMl9k
aXYyXzQiIH07DQo+ID4gK3N0YXRpYyBjb25zdCBjaGFyICogY29uc3Qgc2VsX3JzcGlbXSA9IHsg
Ii5wbGwyX2RpdjUiLCAiLnBsbDJfZGl2NiIsDQo+ID4gKyIucGxsMl9kaXY3IiwgIi5wbGwyX2Rp
djJfNCIgfTsNCj4gDQo+IE9LIGlmIEkgZHJvcCB0aGlzIGxpbmUuLi4NCg0KQWdyZWVkLg0KDQo+
IA0KPiA+ICBzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IHNlbF9ldGgwX2Nsa190eF9pW10gPSB7
ICIuc2VsX2V0aDBfdHgiLA0KPiA+ICIuZGl2X2V0aDBfcm0iIH07ICBzdGF0aWMgY29uc3QgY2hh
ciAqIGNvbnN0IHNlbF9ldGgwX2Nsa19yeF9pW10gPSB7DQo+ID4gIi5zZWxfZXRoMF9yeCIsICIu
ZGl2X2V0aDBfcm0iIH07ICBzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0DQo+ID4gc2VsX2V0aDFf
Y2xrX3R4X2lbXSA9IHsgIi5zZWxfZXRoMV90eCIsICIuZGl2X2V0aDFfcm0iIH07IEBAIC0xOTks
NiArMjIyLDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdA0KPiBjcGdfY29yZV9jbGsgcjlhMDhnMDQ2
X2NvcmVfY2xrc1tdIF9faW5pdGNvbnN0ID0gew0KPiA+ICAgICAgICAgREVGX01VWCgiLnNlbF9y
c2NpMSIsIENMS19TRUxfUlNDSTEsIEczTF9TRUxfUlNDSTEsIHNlbF9yc2NpKSwNCj4gPiAgICAg
ICAgIERFRl9NVVgoIi5zZWxfcnNjaTIiLCBDTEtfU0VMX1JTQ0kyLCBHM0xfU0VMX1JTQ0kyLCBz
ZWxfcnNjaSksDQo+ID4gICAgICAgICBERUZfTVVYKCIuc2VsX3JzY2kzIiwgQ0xLX1NFTF9SU0NJ
MywgRzNMX1NFTF9SU0NJMywgc2VsX3JzY2kpLA0KPiA+ICsgICAgICAgREVGX01VWCgiLnNlbF9y
c3BpMCIsIENMS19TRUxfUlNQSTAsIEczTF9TRUxfUlNQSTAsIHNlbF9yc3BpKSwNCj4gPiArICAg
ICAgIERFRl9NVVgoIi5zZWxfcnNwaTEiLCBDTEtfU0VMX1JTUEkxLCBHM0xfU0VMX1JTUEkxLCBz
ZWxfcnNwaSksDQo+ID4gKyAgICAgICBERUZfTVVYKCIuc2VsX3JzcGkyIiwgQ0xLX1NFTF9SU1BJ
MiwgRzNMX1NFTF9SU1BJMiwgc2VsX3JzcGkpLA0KPiANCj4gLi4uIGFuZCBzL3NlbF9yc3BpL3Nl
bF9yc2NpX3JzcGkvIHdoaWxlIGFwcGx5aW5nPw0KDQpPSy4gDQoNClRoYW5rIHlvdSwNCkJpanUN
Cg0KPiANCj4gPiAgICAgICAgIERFRl9NVVgoIi5zZWxfZXRoMF90eCIsIENMS19TRUxfRVRIMF9U
WCwgRzNMX1NFTF9FVEgwX1RYLCBzZWxfZXRoMF90eCksDQo+ID4gICAgICAgICBERUZfTVVYKCIu
c2VsX2V0aDBfcngiLCBDTEtfU0VMX0VUSDBfUlgsIEczTF9TRUxfRVRIMF9SWCwgc2VsX2V0aDBf
cngpLA0KPiA+ICAgICAgICAgREVGX01VWCgiLnNlbF9ldGgwX3JtIiwgQ0xLX1NFTF9FVEgwX1JN
LCBHM0xfU0VMX0VUSDBfUk0sDQo+ID4gc2VsX2V0aDBfcm0pLA0KPiANCj4gUmV2aWV3ZWQtYnk6
IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+IGkuZS4gd2lsbCBx
dWV1ZSBpbiByZW5lc2FzLWNsayBmb3IgdjcuMi4NCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0K
PiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5
dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRA
bGludXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNo
bmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQgd2hlbiBJJ20gdGFsa2lu
ZyB0bw0KPiBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcg
bGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRv
cnZhbGRzDQo=

