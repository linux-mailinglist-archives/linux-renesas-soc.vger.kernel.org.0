Return-Path: <linux-renesas-soc+bounces-28546-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0E/KBte3oWm+vwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28546-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 16:27:19 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1F41B9C20
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 16:27:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 162513011045
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CB0642EEDF;
	Fri, 27 Feb 2026 15:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="q/8rbYR1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011051.outbound.protection.outlook.com [40.107.74.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7998542EEB0;
	Fri, 27 Feb 2026 15:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772205806; cv=fail; b=md5FrZJBsl70idqPiHzGjkwv/RqK4MZYXMmjtv32QmZc/nFXswK1HP30CUk8I3DFyOw97KOETyorQ/Q1ugP5rLwMzTikxz7p66nJIak+07PQoWUwmp34mEVqYnlQmzcp668zgpm8jNfTnWURzRSC+KNnKUY61pOTKDcr6VKMTp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772205806; c=relaxed/simple;
	bh=XTfuCfQJkK/28qgSv+HAbKWOv2PvNLPqgbQPBy+Hwxs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PskCV7KgfExqm6CJ2SSvjrHeIzY92QyxOiuZnNLXjy9RRXnq0y+DWcGA32nDqigdCtMPonCVDG4atVRrvZ3oTfGH3/nFZpRqsCGELp+JUGji8qhpc6tquiJJZmziL6w7nfLPoQ21ZxhRrusvm3pEVRJ10wUU2UjPAlNTmb7XTJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=q/8rbYR1; arc=fail smtp.client-ip=40.107.74.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SwrFvWqdhcdiQuQV095XbdfoMnB9DV8UBWNNcDb7z5WTXV5I4oM7d+F388cmqOsT3L8ShGXi/zLVFT6SB3gFoLsrDsuiHQ8WHvnm2ujmqJTpaVuUHQ3PeIHB4oP4ULabhbSYTqxvlmffHA9kDroRZaa6Ht5ldtLeLsOtvnNztD2m6GCGvclv2x5rBSY2WKRZ/H61BOU4qjOancbNcw3ntJHFcc8ZSNlEx9rdvTkz3L8U/HZ5qZ6eDD7/jdaHSm/FGYb1cCBZKfxRBEgghKTKtA11yMnjvk73Wly9YWEnbpkLNTj5VFXLHCJethgmovkkniEXwazVErdD4PIzwhLyWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTfuCfQJkK/28qgSv+HAbKWOv2PvNLPqgbQPBy+Hwxs=;
 b=Ev44K1spUQSjtcLHEZ24DRQcwUoD4XV4opijxVleM5htepm82nKTIFr6IUy4ueu5WcHvxDKsHhsQLqvgUK+iNclQYUOMFuSpd31IZD3esI7VbsP4glRAxrGrLWNezu6RFd8oyW3O55t1svhjovmcBbJT7Mw6au62eK69yl6YZIMiwGMiZfCvmNzF1n/I/xkgYDZNomktQOSnqAwNljXvT3tDf84c4/zsBIyPzuvjX7ZZKL86q8MP6QF4NUeDW6gsu8MURtEG0q0jDL4BkVLnppLqmHeCYboKpPN8ZVU4cXqRWMXBnoEN6/XEuJuZpu+OpcbWFOPg0MguAaLRwf7/AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTfuCfQJkK/28qgSv+HAbKWOv2PvNLPqgbQPBy+Hwxs=;
 b=q/8rbYR1N8tJNBjoQ6CDtEfqkjkX8d3T5r4PBUInBOkao1q6kXMMKhTAteBBvodyp0DZvuzyGzw4aVw+iN8xcYoPMlNr+TZE2kf+NWtvZs64VXOXjUgH45njureM59f+VjfP4xXVj+yWi4y3AiASWfKwRPi2xLUYkeWMiuq4RPA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB10029.jpnprd01.prod.outlook.com (2603:1096:400:1de::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Fri, 27 Feb
 2026 15:23:20 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 15:23:19 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, Brian Masney <bmasney@redhat.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 11/13] clk: renesas: rzg2l-cpg: drop determine_rate op and
 use CLK_ROUNDING_FW_MANAGED flag
Thread-Topic: [PATCH 11/13] clk: renesas: rzg2l-cpg: drop determine_rate op
 and use CLK_ROUNDING_FW_MANAGED flag
Thread-Index: AQHcp07a2hBuHvp1QU+n+sL4i/3plLWWNSeAgABwAgCAAAJagIAAAFuA
Date: Fri, 27 Feb 2026 15:23:19 +0000
Message-ID:
 <TY3PR01MB113460B83239C8251DD2FA39F8673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-11-4421dd2f6dc6@redhat.com>
 <CAMuHMdWPiy2OYEntYNEMjkxYPrQBED2segMfND+4VtzdeQE6+g@mail.gmail.com>
 <aaGxrm0SqwaJWCph@redhat.com>
 <CAMuHMdXR1T-VUnk87qpCmdkrYZr=UbjRJNznLw3YV98JAoN=hw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXR1T-VUnk87qpCmdkrYZr=UbjRJNznLw3YV98JAoN=hw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB10029:EE_
x-ms-office365-filtering-correlation-id: 8708f571-cdaf-4e83-b066-08de76142373
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 R6Yeo0dNKrnxIjDGv8PbGiY6/ZoCjWCAqd8DP/UhohSOIXTOvj/tS+G+q9riR6IouQN9AhF+rTSBTp7MT+/uJ/qlxvTJfPlbR3F14E+AHKW4YFEGz+j34SxoC5X1S0LiomwPXcU2oW1MKAzEgJoCjLstWcPUTFFcH3k1WGsssJKaKhDB18JAi5iFy+hwKSRGCXFpuZBfVP0YloDQu/Q6Dktmebq8aD8lfccwNjcRkOMkZjSnPP9WHDFDo8TPI04I44EWtRHZIqz/bP6h1Xrkz+Ga7DZFaLjlUTkQf7Va5Ob/5dhu5MeSn7TcBuIOhoKyfWqMHlTVkxGyPNcwuq5XX+UhZ53uoIBo0qLc2/RJm6YqzFuPWEYPkQOBNB74RwXidGiaVRMGW1WnvKESp+YxmYiIxZSoBRvETjOMw/cqk0ws7OFBbgAqT3gpK39Y70w8A7/NFQmhXJHBoBybo7pLt2bazrJdTuTEQNqWYl4DQFxysJ+fqiUpReLz3jngAdvVQ6iQrg74oLfMxm4S5egOwRM4p4QoI8hbYzgDrenYbAfsAGGyA6bYH9sIGSUq47A2HnNoQrey4jzOJKaWYHltkftkMDQJieM8HrW5Y6fzkw0LrjusHBvKUX40OuEymvjVau0uOts9OHkBSLv6MGFg5FN6CQToZb3FXuLnzSvI5HbBhvxZE0SkvMPqcE+qrAk3M27Yp/tx94UI0rcSMsr8N0jpyIjQgdj4NN3JAiu6nomtm4EZQ3nSAjUbTXuft/O/
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z0d3Z1RpU1BSekp4eHpadnRPZk5jUUhKWkdmVFVkUUFBV0l5WXc2d0NlRWNi?=
 =?utf-8?B?WkNBZVJMaE82MDljTGpESVA5NU55US9OclE1NEw0K0Y2bGwzYWR0Q2piSWZi?=
 =?utf-8?B?SUdoZUZEdDFKRFl3NGJjUDZlOVdjY0JLNzNDNm0xVWh3SEtXNHVkbCtFN1NK?=
 =?utf-8?B?dUFWRFhUN1M4RzdqNEJNY0lWQUI4ME5wRjFRMHljWUNyV3JIUGx0T0tTeHFw?=
 =?utf-8?B?S0xGdk93L1dGR0RCNnJiNEhhWVZWU255cjNnUlYyVlhuNkRYaG5EcXdqU3VE?=
 =?utf-8?B?UVJEb2d0R25nM21zZ0k2RU5WZDg2a1k4V2JwbG9SY1dnZk51VGJhKzdEV1VJ?=
 =?utf-8?B?RWRsdloxMEt4ZW1Oemw5OHUxUTE4WXQ2NkxHWGlJeVNCcVVOcUhKSnJuQi9G?=
 =?utf-8?B?cHJRUXVPNmRjY254d25uT1BuOUsySWg0Ry81UlhPdmNKU0UwS1hqemxxOG9s?=
 =?utf-8?B?cmNkWkxnMXdQbjAxcEZKblZCUUJieWgrWlJYZngzT0JadGcyVHp6UjFubVVC?=
 =?utf-8?B?M0c1NjJkK0hLQjdrbVBSaXFXUHhQRXJobU9lN3FPV2M4Si9NTHJ0bWQ0Wlov?=
 =?utf-8?B?MG9ncU8wb1V4Umt4M1ZYRG5PR0dkd1ZzLzJCUVQyNmV1NmJMamhSVWhXdEQr?=
 =?utf-8?B?RTRwRWpEK3hUOFRRSjUyNXlZZGxMTzd0d1BoS3VCa2g4Zzk1ZCtjQmVZSktt?=
 =?utf-8?B?akpkWnFxZmFCbjdVcnpsVUFCL1NhT2pwV3cveG1uRmtaQXlUNTlIOUdobEdK?=
 =?utf-8?B?V1gvd0pocHFmb1hLYWhjOVh1MlVuK1BhellIMmpOQ2IvZDVzaHJDdjJCTStO?=
 =?utf-8?B?K01LbmlqVUY1dVNpNkFXYis4TElqaVRPOCtsRmJUUHlVanRJdFRyb3NJS2pw?=
 =?utf-8?B?UnJpSkFiRUd5U0o5STJVSHowOXl2Q0VVcVV2TUtLOEhBT2R5S2hSM1AwL2kz?=
 =?utf-8?B?RnFMWWV2RXJxUXBXcFg5ajhNSCtXcWcxT0xsaTQ0TkJsaytUeGpRWjRKcit6?=
 =?utf-8?B?OW5aZWhZdjZLdGIwby9MS0gyWlE3alJTT2Z0RmRseVpqRWhCZnhUYkpoYkU1?=
 =?utf-8?B?VE45TjE5dk9KYlUrbFVqTnRINzdYVGlTYjNMT3dpZHM4b2x6U2NaZHE5eGE1?=
 =?utf-8?B?d3NaTWpnL1J3a0NpUzRGNmNqQnUrRlJIWFZkYmQ3VUtYako0Wm5tcFlNM2Js?=
 =?utf-8?B?WlVJVmx4ZHJWMytpSTNQRGxoVnV1LzJIQm9haHVmYzJmd0FDY1JYcVBnbk5m?=
 =?utf-8?B?cEhmN28wZWtSaFhhS1BjNFgwUWRxb1J6bjlETnRIU3FkTlludFRwUlR4aFls?=
 =?utf-8?B?alFNS3FPUmhDUHFHZVRYcFVUR0RjV0Y4WnlKU1BIYlhROWlQTVJWS0pRV0tn?=
 =?utf-8?B?bUdYZmU2L2gwZlE0SDBDcklkQ0NsV3dNM0oyQUlBK0FNa3Q5Z0xUNHFEMFMr?=
 =?utf-8?B?bVgxbmtySjhaOHgxaXpsWlZvTHVuR1lHWXMxVXlxTWRVOUdROXRoU2N2Mitx?=
 =?utf-8?B?c1VlMis5amE4bXpIbjhoL3U2Sms4MEJ4TFF0UlJ2bUY0bldkR3liaHpaSnly?=
 =?utf-8?B?RjZiUHNMOCtlcnl4V0dZV090UlpiK3pEV09KY0graUZJZytYT3R2UXJ4Nmtl?=
 =?utf-8?B?YitUM2Z6SDZ0cDdkTStFQXVSTytvRTB0a1RyYTZ2MlFXVkZLRndGWVN6M01E?=
 =?utf-8?B?VkFLUTloZVBGVHh4UmJpLzlsbnpFOG9rT055Qyt4eEhKeFVGYXVtZ3QyVjhY?=
 =?utf-8?B?R2hUanIzTUhDRWNSbzArK0IwVU16UTNQbFA2WFB0UDFqMUptV3hPWTNlcFQz?=
 =?utf-8?B?c1ZLNnUzdU00Wm96ZVQyc0tHRXBWL0dtalVQUEgvQ0VHSGxiUFFScEZXa3Fn?=
 =?utf-8?B?cVdReEpyUnhhdFgwM0k3MUw2NkxvTWtjajYrZy9jRzlTRkkxdVhNUmVXYi9q?=
 =?utf-8?B?ZzFGY2djY1hsQWNRTGtzNkUxTlpHTVFFbGs2Zk1jRXk2NFl3NmYvNE12bExa?=
 =?utf-8?B?bFVlNUxwWFJ0WU44WXRvUk9xZ3FwVFh5MEVrcVhWYWc4NXZOM1J1ODNrcVR4?=
 =?utf-8?B?RksrOWxwaEpDbkVyUHk4TGxVMXZlanRaclBxNUtHb1QyRkg0OEhLaFU0OGg0?=
 =?utf-8?B?VUVmWkNITzgwN3Z5b1FmcmYzWGtqN0ZTNXErSThiRHVyZi92dCtGSElrWWFi?=
 =?utf-8?B?YWgzWHRCSUFMVTljUGVyaWFtRjZiMFBWM1hTTXA0YkZWV1JiNDdpK2RISTY5?=
 =?utf-8?B?Vm52dGlFQ0ZtNktJVjlyUUlKUnVEdXZ0ejU0SUQyTmRIUGNmQUZuK3liclV0?=
 =?utf-8?B?REt6QjBONXZQaTZhaTJhRVJVRlFSNndoNDNGTVBaNHY5dlNZc1FTUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8708f571-cdaf-4e83-b066-08de76142373
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2026 15:23:19.8766
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6HmmM6BEwotWA4NvMZLvZsOImRBkh2FJf+g3ZtIMRSSW2Wrvxj1Y9dMWguNDZP/4tMXegF/glpW6MP8zAhUdzL2Q5nt3EMwuZKLl96VXQVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10029
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28546-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:dkim,init.name:url]
X-Rspamd-Queue-Id: ED1F41B9C20
X-Rspamd-Action: no action

SGkgQnJpYW4vR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
R2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMjcgRmVi
cnVhcnkgMjAyNiAxNTowOQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDExLzEzXSBjbGs6IHJlbmVz
YXM6IHJ6ZzJsLWNwZzogZHJvcCBkZXRlcm1pbmVfcmF0ZSBvcCBhbmQgdXNlDQo+IENMS19ST1VO
RElOR19GV19NQU5BR0VEIGZsYWcNCj4gDQo+IEhpIEJyaWFuLA0KPiANCj4gT24gRnJpLCAyNyBG
ZWIgMjAyNiBhdCAxNjowMSwgQnJpYW4gTWFzbmV5IDxibWFzbmV5QHJlZGhhdC5jb20+IHdyb3Rl
Og0KPiA+IE9uIEZyaSwgRmViIDI3LCAyMDI2IGF0IDA5OjIwOjA5QU0gKzAxMDAsIEdlZXJ0IFV5
dHRlcmhvZXZlbiB3cm90ZToNCj4gPiA+IE9uIFRodSwgMjYgRmViIDIwMjYgYXQgMTk6MTgsIEJy
aWFuIE1hc25leSA8Ym1hc25leUByZWRoYXQuY29tPiB3cm90ZToNCj4gPiA+ID4gVGhpcyBjbGsg
ZHJpdmVyIGhhcyBhIG5vb3AgZGV0ZXJtaW5lX3JhdGUgY2xrIG9wLiBEcm9wIHRoaXMgZW1wdHkN
Cj4gPiA+ID4gZnVuY3Rpb24sIGFuZCBlbmFibGUgdGhlIENMS19ST1VORElOR19GV19NQU5BR0VE
IGZsYWcuDQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8Ym1h
c25leUByZWRoYXQuY29tPg0KPiA+ID4NCj4gPiA+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4g
PiA+DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvY2xrL3JlbmVzYXMvcnpnMmwtY3BnLmMNCj4gPiA+
ID4gKysrIGIvZHJpdmVycy9jbGsvcmVuZXNhcy9yemcybC1jcGcuYw0KPiANCj4gPiA+ID4gQEAg
LTEwNDEsNyArMTAzNCw3IEBAIHJ6ZzJsX2NwZ19zaXBsbDVfcmVnaXN0ZXIoY29uc3Qgc3RydWN0
IGNwZ19jb3JlX2NsayAqY29yZSwNCj4gPiA+ID4gICAgICAgICBpbml0Lm5hbWUgPSBjb3JlLT5u
YW1lOw0KPiA+ID4gPiAgICAgICAgIHBhcmVudF9uYW1lID0gX19jbGtfZ2V0X25hbWUocGFyZW50
KTsNCj4gPiA+ID4gICAgICAgICBpbml0Lm9wcyA9ICZyemcybF9jcGdfc2lwbGw1X29wczsNCj4g
PiA+ID4gLSAgICAgICBpbml0LmZsYWdzID0gMDsNCj4gPiA+ID4gKyAgICAgICBpbml0LmZsYWdz
ID0gQ0xLX1JPVU5ESU5HX0ZXX01BTkFHRUQ7DQo+ID4gPg0KPiA+ID4gSWZmIHRoaXMgaXMgdGhl
IFJpZ2h0IFRoaW5nIFRvIERvIChUTSksIGl0IG5lZWRzIGEgY29tbWVudCwgYXMgdGhpcw0KPiA+
ID4gY2xvY2sgaXMgbm90IG1hbmFnZWQgYnkgZmlybXdhcmUuDQo+ID4NCj4gPiBCZWZvcmUgSSBz
dGFydCBhIGxhcmdlciBkaXNjdXNzaW9uIG9uIHBhdGNoIDEgd2l0aCBtb3JlIHBlb3BsZSBhYm91
dCBhDQo+ID4gbmFtZSBmb3IgdGhpcyBmbGFnLCBoZWxwIG1lIHVuZGVyc3RhbmQgd2h5IHRoaXMg
cHJvdmlkZXIgaGFzIGEgbm9vcA0KPiA+IGRldGVybWluZSByYXRlLiBJcyB0aGUgaGFyZHdhcmUg
ZXZlbnR1YWxseSBwcm9ncmFtbWVkIHdpdGggYSByYXRlDQo+ID4gdGhhdCdzIGNsb3NlIGVub3Vn
aCB0byB3aGF0IHdhcyBwYXNzZWQgaW4/IE9yIGl0IGRvZXNuJ3QgcmVhbGx5IG1hdHRlcg0KPiA+
IHdoYXQgdGhlIGNsb2NrIHJhdGUgaXMsIGp1c3QgYXMgbG9uZyBhcyBpdCBpcyBydW5uaW5nPyBP
ciBzaG91bGQgdGhlDQo+ID4gZGV0ZXJtaW5lX3JhdGUgZnVuY3Rpb24gYmUgZmlsbGVkIG91dCBp
biB0aGlzIHBhcnRpY3VsYXIgY2FzZT8NCj4gDQo+IEknZCBsaWtlIHRvIGRlZmVyIHRvIEJpanUs
IHdobyBhZGRlZCB0aGUgZW1wdHkgcm91bmReV2RldGVybWluZSByYXRlIGZ1bmN0aW9uLg0KDQpQ
TEwgaXMgY2FwYWJsZSBvZiBnZW5lcmF0aW5nIGFueSBmcmVxdWVuY3kuIHRoYXQgaXMgdGhlIHJl
YXNvbi4NCg0KQnV0IHdlIGNvdWxkLCBjYWxsIHJ6ZzJsX2NwZ19nZXRfZm91dHBvc3RkaXZfcmF0
ZSgpIGZyb20gZGV0ZXJtaW5lX3JhdGUoKQ0KYXMgbW9kaWZpZWQgcnpnMmxfY3BnX2dldF9mb3V0
cG9zdGRpdl9yYXRlKClbMV0gY2FuIHJldHVybiBlcnJvcnMNCg0KWzFdDQpodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0L2xpbnV4LW5leHQuZ2l0L3Ry
ZWUvZHJpdmVycy9jbGsvcmVuZXNhcy9yemcybC1jcGcuYz9oPW5leHQtMjAyNjAyMjcjbjU5MA0K
DQoNCkNoZWVycywNCkJpanUNCg==

