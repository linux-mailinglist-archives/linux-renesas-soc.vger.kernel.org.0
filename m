Return-Path: <linux-renesas-soc+bounces-30693-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLSvHFI9zWn5awYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30693-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 17:44:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7532F37D5F3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 17:44:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8154B31393B9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Apr 2026 15:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D9D3CFF41;
	Wed,  1 Apr 2026 15:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Vz8QAg1g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010021.outbound.protection.outlook.com [52.101.228.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B35337BB8;
	Wed,  1 Apr 2026 15:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775056604; cv=fail; b=Pt4fhMJcAafNjkZosvWDdOVjovr6eRYjjrEO3J/Rsp1ZJIfD6jSMTVv8eHvwAV97llyWG+T0rviEovi/IWNGDTYsqErn+ICmGNyQNnqp3XfQoUzjm/uahKTzHP3Ei9jKC9z0o/zH7CBbWTR535NheqYD2jvARqYLqRT3nmgHNsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775056604; c=relaxed/simple;
	bh=2YOJoh0mRz0fvfWRqeFNv2wXyn10eYilzf53TipMxvY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=W1RP95XIFswiAG5DZEBjWC0cqU8AgdVFQEZSvV2l/VLXMaZj4esFe+pCUdKhFEpqfu9vbFkezgTGsQIRM4YOQfIrjl5VaMuZelQ6ic0AHgk7zlC9sOgRXzwQt0pfTxrtUiXjKyz7YqwtO83W0zVq758wdLHitHSESMejqEjl5mM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Vz8QAg1g; arc=fail smtp.client-ip=52.101.228.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P8WIdgzTzBLV5WFy3+KnB75bD2lukYcQD63ws8T+a/b7SfpH+6BLOuZDu5SNjLYgQyV29GdD+e7ncUcwzCwka/vWr1kOjmI/S0TE8Y86NlXx0LKxCj5MO8/fGFP4aFK+PE2AE39DtpdRyv0fqcHrRJ4Ag+h+cQwzPbXHYHwdCEno/k/fYJ07x6YFnriCG0zwRDe4RJRQ3SDdr0QMrqEKh54xrREQL8mhc79vZY+kUVMr6PgLvxz/nTbUT5I2VSJLnpWlv1ZXn+1HBN9H2LndeQABkCpsfGL4NkM9WnOXkU0Hh5/IVd9qmkIncGxbAFBr2iSyktTKxEXfmuzwkqsPmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R33ntgoOFctunGjoaZw8JJ0W2j3alizhHvhW56C1600=;
 b=TH09snftguHZxp8cEGg/knlVVjQBWLE5T6kkrGfkDulNXQcqSo6sD0PXJ8G2OMOj06uvrad1xLs0IxeJ2rwp5Y6hK2NfQTKEkBYl3RSVYfArX9xqSDCM4Iey6xpUEatpc/XkRltkw9QnPfKYqWzWCKsmRql5nZ6iLBBt5Rr2PQd6a+FlVvDJ1TgtkcpoYGEwovdeh2WdAFL2hFekHEjG4AxotJVL1bjT65WoF4y58WuIHT/35mbB9ULGbUeCa46Yv40A9KBQQp+LHE1o6nzMej3GKkdzzGK75w4tKjlvcDS2E019kK5s1Tze1G0N4qPx4sZNXoHLAN8OSvupAENURA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R33ntgoOFctunGjoaZw8JJ0W2j3alizhHvhW56C1600=;
 b=Vz8QAg1glFYK//LthX4yF7svuIogiT1wYB7lp8OERjmPi0h81hzFPzHXEa8zur0d/4aQEesu7wTGYDszJnv0bAP+pqULj2mFI5+XG+hhNnvOtvPCz/XfihjMkX2IdReVk9BH4es7g0ieV8RcR8GJutnxG4pAsbahaSrKZjEymwQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS3PR01MB9993.jpnprd01.prod.outlook.com (2603:1096:604:1de::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 15:16:38 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 15:16:38 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	peda@axentia.se,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Josua Mayer <josua@solid-run.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 0/5] Add USB2.0 VBUS mux driver and extend rzv2h-usb2phy reset for RZ/G3E support
Date: Wed,  1 Apr 2026 17:16:06 +0200
Message-ID: <cover.1775047175.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0186.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::13) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS3PR01MB9993:EE_
X-MS-Office365-Filtering-Correlation-Id: 348c8f0a-dbc5-4e1a-f20b-08de9001ab6a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|52116014|376014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Cu70Dv9MBqnA/VBMg5T3Bia+8Y9XTkjeKW+jT0XqT9BO6iikhcSZ3XDrl09RPnof4oZzFqPzpoAYFvYUs1UJZnEw+1b5+h4mAjptrlInbQr8YhgCM7r43sGLKv12y7+VBM5KUAw3jhXFupR1MMSBZpl4CG7krrntruJ78ahkrzoYXyRjZ2WjDVx2ZdmoFkS+z4y7Sk+Ww+vFp3zUiDPHkhlGN2kUQQbPNy23a81PaqPx4I4mI5KQwEPQqGt84jg8BkWAVRzWVRt8mMdOW/g/i6UuaktLvJvjx4+hV4xhCQ7Kq1dUxbAlxB0WaFxKu8WA739+6QH7GGfuoVf0c7Qn/blmM8LJcAPALA4PAMfrcuDbMRGy5P6SlVwLd50DjbwSkhuDfeO5butGrp5PWSQQudxsGuoo9yLTSD4CSv1CKV6h5i8VZ8cy3fuSPIMlFQUhq8xKRAuQaC8w/QVh9RkYX8q3Cegu82gkUXVDprFEv+YDx6JHNorFugWBfY9Fwk/NGoachjyqJzSE2syNxOV0Ap3Jj3c5pL5OTIveSUkscLoA3t8IgHhDXuP1bs72IcXBikqEV111oyIZgrGoxBw34rlPRV6fzMsroxaj2N1UPN5+E5k92ZxedC8vSwG+isYq/JMHtm5U5wPHJ937PG9nFBIa6/JbQAW9+Z1AWp3u6jr2U+1CVI/JAxOneQ5DabYqSIFpb6vSWcr2MYX5iXto2dmFhZo1xSiNZxBlCe0wqlAK6z7nT+NKdr4EZVDmd27xemUfmt9WTJNelxYCbTVDA4+lGN+bxlS7w4vBq9CfvYw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(52116014)(376014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1NWcHFWQ1ZyQ0ZxMUFNZldyMDhkeVRQVDBwUE5DNGN6VGlMWUR0eS9pZzh6?=
 =?utf-8?B?VHZpeDJ5bml0L2EreEg4V3FBREpsbFRmZXZnakRIcFJ2UHlSV1BHN3h2SmhE?=
 =?utf-8?B?WkQrYzYvbXFWc0VUUnNocXBlbURBR2pZVktmT0hYMUZ4RTQ5UTN6QXROZk1N?=
 =?utf-8?B?cWlhUG9MRzR2VUVwZ2lUb1ZFbzlRZ29xM2ZxbFYzMnVaQW55bDZCcFB6czJP?=
 =?utf-8?B?bGY0NW55VzJheXN5RjVNWnIxSkovamlHNVJFT1FYK1NJRFJGS0hrNW1jN3Z2?=
 =?utf-8?B?N1JiU3JJQlFrNWNTalhkYzRWdUtaanIzME02TGhEeGdaRzVFUThMSXEwc09Q?=
 =?utf-8?B?akFoNzJaSlZlbHAxdXZ4QTRKY2NyL3JxZ0N0alorRDhqTlhMaGF4SlNjUWNx?=
 =?utf-8?B?bDlRdTlIM1dwakNzeERnWCsvYXhkSjAxcHQ2WkJlRGdwUXl1cnpxTTVteGFw?=
 =?utf-8?B?UXRCSWJmSkU0d0lTdjVWdHdLc2pzTFpyb3phSC90bVFKQnQ2aVIwT1FOM0E0?=
 =?utf-8?B?TGY4M3pKL3pMWkowcFdyODh4dEZiWlhBeW9BZFFYUDVNbHhnaVRReWMvL2NU?=
 =?utf-8?B?Z0VlZXowL1BsQkFGa1BKRmh2NmFlcTA5ZDVhdmJkajJMTW85eE9sOHNBd3R4?=
 =?utf-8?B?Y3IwWlYxN3prczgxR3FKbk9tNkQvcGtQbUtWQUJ6bktERGNhdTBHYlNQd2t3?=
 =?utf-8?B?ZllJbXJNLzl5emk1OFZPczJhZmNWRU1vWG8xZXp0RUF4WmZ3QjdwYjNoUjM2?=
 =?utf-8?B?M1BET05mMkx6Tno0Y05sWXJNbzFPWXZNOHYzYmdmY2lOL1dRN3h2MWpXenZK?=
 =?utf-8?B?dXkzdXVKS1AwQ2pNTmROQWI2TDF4REw4UTFUbDZIMEZvalBTSUIyWGp3VlpI?=
 =?utf-8?B?K2R0a0NlUEpYcklIbUkydktvY25IOGhMNGk2RFRibTV6a1gyOUFRMWxqV3ZI?=
 =?utf-8?B?MkZFZFFWRzZBRW9wREJYS2dEL2g0L2w1SFRyOHR1Zkl3R2xTRnM1NVZuam1J?=
 =?utf-8?B?alhDQXFVYjdaNzlwMFJZMitJdkppbFdsMHl0anB2VEZKY00vNVBmWGJiUEhH?=
 =?utf-8?B?bXJMZFpxaHJSNlRlNEhnZ3EzMUR1NGNIY0JtejhjQy94TnJ0YUN1Y2M0clVn?=
 =?utf-8?B?dlFHbm1WZG5MUjA3THNVb0pnYitGMUMzME9OcG5pRnJEOVNnYzhMRUhGbmww?=
 =?utf-8?B?MWpRNW1IMVh4SXN1ZHFLTzlBOEdhZjg2THZhaGlEcEhJZGlJOHRKZHJ6M1Bh?=
 =?utf-8?B?K0FpdVhzMThzMHJrMlB1a1MvWUFzQ0VSZTd5R2RyUjdXTUJYaEc4YWNqK2g0?=
 =?utf-8?B?QTJUMFRnVi90K0JxY1dwWmp3b3p6ZzB3NnBNZUp3eDdwUy9UdkRPdzFIa2FW?=
 =?utf-8?B?SWpPWXhqK2RHRGNBUHZFN2Z4dVBoVHprdFQrUVhLa1pzdndodUNyL1pYTXVT?=
 =?utf-8?B?ZURPTk8wakh0WVpkd21PNm1nbTV1WXdqRWhNYXl1TzhDa3BVL2wzcE9WbUxo?=
 =?utf-8?B?TjE0UkpkcEFTZkl5dFU3cWZJRzNZTm92VEZRZ3o1cG8yaVFwc0NUNjJrMnFC?=
 =?utf-8?B?ZFhvU3ppWUVuUEcwekhDUGpRREc5Ri96N0FEQmE0Um5VQWFVcUUzUHpKSE5h?=
 =?utf-8?B?RjRzbFR4R2FLQjA3QmsxdHR5dDBsQmhkNDEzQjFCMjlyVUlzK3k2V2UyMUgy?=
 =?utf-8?B?YXF5djYvdHVpS1dYc2JaS252VzdtZEx6NEs4ZlNIYUs3ODhiSGFJbGxIWlFO?=
 =?utf-8?B?dmpTZkJRSFZBbzVoS252bE1tdHhScTl6RHFkVHJycEZTbTl2azFWTUpxK1JO?=
 =?utf-8?B?bjVxU1UrVnU1M3l6T2FldEVlc2I1aDZyZGljWkR3ek9wbU9PL0xLZVFBQlhx?=
 =?utf-8?B?U3JUOUt2ZUdLNXdIYWI4MzJvZHp6bzl4b2hDdWd3L25PUW5YRTBUQjNOdTls?=
 =?utf-8?B?UE0xbjVZejZvaXFTL1orSFcyK29NR1QwWWEyUlRibTV1WFV6cFVCRUZseWUy?=
 =?utf-8?B?dncwS1ZSV0hvVTRxYlZiMlVydlp3UGo2a3k3c0RDSjFHaWpBZmZzVDZtUllQ?=
 =?utf-8?B?RUliVmFQaXAzZXJrVnA3V0d5c1VsYTRQWklnS21EL0VLbE40TlNndHZGY2pL?=
 =?utf-8?B?MDJtUi9FYTZ3akFDaGxNcHZSaUl5dmZ1b3FqTDJJVnEzMkhkS2RkMkFZSDM3?=
 =?utf-8?B?aGJ6MmFEQm5uOVhDT2x4WXFmcndLSHJ6enhvcjE3b1A2RFRkQjVuL3ZQMndP?=
 =?utf-8?B?bmtwbXpIODdHZjhXMlZWeVU2UG13U1RPVEdSU0pwbFVMdkFrY1FmandzaTlB?=
 =?utf-8?B?di9rcDhJYW9FaDVldk9rYkNEYjNIK1pTV0l4YXZWMXZQcUQzRjFWeldZdEZ0?=
 =?utf-8?Q?Ud3XKifsFkn/Ai3naANNDs50XI2uqCzUFaSpI?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 348c8f0a-dbc5-4e1a-f20b-08de9001ab6a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 15:16:38.2081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vo13dMH5nFK8KX1qSInabmX96A7yv7oS6USkL9eC5URgBdqABJqX2H5mgf7YH6e4PQL/NwpeBXml0MQTociC2OHztCWl4dMDfF8939cha3yC/v8AhXvlx46FC1ME0OT3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9993
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30693-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,axentia.se,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,glider.be,gmail.com,arndb.de,linaro.org,solid-run.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 7532F37D5F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dear All,

The series adds:
 - A new mux driver for RZ/V2H USB VBENCTL VBUS_SEL
 - Updates to the rzv2h-usb2phy reset driver/bindings to support RZ/G3E.

Merge strategy, if any:

- patches 1/5 can go through the MUX tree
- patches 2-5/5 can go through the Reset tree

Thanks & Regards,
Tommaso

v9->v10:
 - Rebased on top of next-20260331
 - PATCH 4/5: Use struct reg_sequence and regmap_multi_reg_write()
   to handle initialization, assert and deassert sequences and drop
   custom struct rzv2h_usb2phy_regval.

v8->v9
 - Rebased on top of next-20260326
 - PATCH 1/6: Fixed driver comment year (2025 -> 2026)
     - Switch from devm_regmap_init_mmio() to dev_get_regmap().
     - Drop unnecessasry include bitops.h, of.h, property.h and
       drivers/reset/reset-rzv2h-usb2phy.h headers, driver is now based on
       regmap.
     - Collected PZabel tag.
 - PATCH 4/6: Collected PZabel tag.
 - PATCH 5/6: New patch.
 - PATCH 6/6: Drop linux/reset/reset_rzv2h_usb2phy.h dependecy as the
              driver is now based on regmap and does not need the
              reset driver's private header, update driver accordingly.
     - Collected PZabel tag.
 - Update cover letter.

v7->v8:
 - Rebased on top of next-20260311
 - Updated series cover letter as part of the series was already merged.

v6->v7:
  - Rebased on top of next-20260128
  - Split series into per subsystem series, no changes.

v5->v6:
 - Rebased on top of next-20251219
 - Re-arranged series order per subsystem patches.
 - Patch: 3/14: Collected tag.
 - Patch: 4/14: Fixed commit message.
 - Split from dts patches will send separate series.
 - Added merge strategy in cover letter.

v4->v5:
 - Rebased on top of next-20251127
 - Patch 01/22: Added Reviewed-by tag from Conor Dooley.
 - Patch 06/22: Changed file name to rzv2h-usb-vbenctl.c and Fixed
   Makefile, Kconfig, function names accordingly.
   Changed driver .name to "vbenctl" and fix auxiliary_device_id name.
   Updated commit msg.
 - Patch 07/22: Update mux_name to "vbenctl" to match the driver name.
   Updated commit message.
 - Patch 11/22: Fixed if statement for mux_state error check.

v3->v4:
 - Rebased on top of next-20251121
 - Added patch 01/22 to remove nodename pattern from mux-controller schema.
 - Switch back to v2 implementation for mux controller in patches
   5/22, 15/22, 16/22, 21/22.
 - Improved commit bodies for patches 5/22, 15/22, 16/22, 21/22.
 - Removed mux_chip->dev.of_node not needed in patch 06/22.
 - Collected CDooley tag in patch 09/22.
 - Added missing select MULTIPLEXER into Kconfig in patch 11/22.

v2->v3:
 - Rebased on top of next-20251110 + [1] + [2]
 - Add missing Cc: stable@vger.kernel.org in patch 03/21
 - Patch 03/21: Added missing Cc: stable@vger.kernel.org.
   Improved commit body describing the removal of rzv2h_usbphy_assert_helper()
   from rzv2h_usb2phy_reset_probe().
 - Patch 04/21: Manipulate mux-controller as an internal node.
   Improved commit body.
 - Patch 05/21: The main driver is using now __devm_auxiliary_device_create()
   then update the aux driver accordingly.
 - Patch 06/21: Use __devm_auxiliary_device_create() to create the aux device.
 - Patch 08/21: Improved commit body and mux-states description.
 - Patch 14/21: Manipulate the mux controller as an internal node,
   and update commit body accordingly.
 - Patch 15/21: Manipulate the mux controller as an internal node,
   and update commit body accordingly.
 - Patch 20/21: Manipulate the mux controller as an internal node.

v1->v2:
 - Rebased on top of next-20251103 + [1] + [2]
 - Reworked series to use mux-state for controlling VBUS_SEL
   as suggested by PZabel added also mux bindings documentation
   on phy and rst side.
 - Collected Conor Dooley tags
 - Dropped unnecessary rzv2h_usbphy_assert_helper() function from
   rzv2h_usb2phy_reset_probe()

Tommaso Merciai (5):
  mux: Add driver for Renesas RZ/V2H USB VBENCTL VBUS_SEL mux
  dt-bindings: reset: renesas,rzv2h-usb2phy: Add '#mux-state-cells'
    property
  dt-bindings: reset: renesas,rzv2h-usb2phy: Document RZ/G3E USB2PHY
    reset
  reset: rzv2h-usb2phy: Convert to regmap API
  reset: rzv2h-usb2phy: Add support for VBUS mux controller registration

 .../reset/renesas,rzv2h-usb2phy-reset.yaml    |   9 +-
 drivers/mux/Kconfig                           |  11 ++
 drivers/mux/Makefile                          |   2 +
 drivers/mux/rzv2h-usb-vbenctl.c               |  85 +++++++++++
 drivers/reset/Kconfig                         |   2 +
 drivers/reset/reset-rzv2h-usb2phy.c           | 141 +++++++++++-------
 6 files changed, 196 insertions(+), 54 deletions(-)
 create mode 100644 drivers/mux/rzv2h-usb-vbenctl.c

-- 
2.43.0


