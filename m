Return-Path: <linux-renesas-soc+bounces-32219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNT1MN5m/GmpPgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 12:18:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AF84E6A11
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 12:18:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F1983014C40
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 10:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BB483E6DCC;
	Thu,  7 May 2026 10:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="J4UOvNNo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011036.outbound.protection.outlook.com [52.101.125.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF8B3E6395;
	Thu,  7 May 2026 10:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778149072; cv=fail; b=SIFSR2oRvGbkwAng19RZTtL3bqJjEx6w3H1Va9raS+Hd2ARxXWQlfxO/JpRzffPLjKdlwdQncB+Z/J62gW8paPcBhhV/9c3iGsZgg5TTDFpgaY+BF6GVBFbdcX9DbrVLMjuRLO7vdI9m0+GR1rz7ybCRUFTnwy+lGkGgmygAY9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778149072; c=relaxed/simple;
	bh=Bla+8wKWp/we2eu10N33t7dqIk9uGGjcKW8ozFVoiyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=klgHHHhqe0QXjv06z2vMXGBu3s+9OQvgl7fXtYZ4TZw4NkrAMhnCsKIXlk1tYZida3mh9hfN26OGqdTNtVkFyXvtl2G9uV1AYp1ihqJnGVIZwCncYWj80fHdDZpZW2iMORfwDvuE7iwP3sq0tZdU9G6cHaNTbI+h9xj0bYoXHbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=J4UOvNNo; arc=fail smtp.client-ip=52.101.125.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ac5XoJkqaX/5GcrPILz24hlVQAgwKqpmk7lSDCuDgPiCUU2WA487X6ucARJH4O6+uruStpLra8Z3nrr7Tp9sUSYoPNckJNWrdvnRygFc6sxXVnE30ohUtDTOF3GgCd3K3Bfj4TaRw1m1FW/bY9HXbuCP8/vFqMTcNmVS/WZmVPV4BOH4bp9QohC3fK3lb15bUHPDxMmHFgnblDUCRU+FAbb9NQqWYP+E8TFd6kmGf6wUgMAaRqzAdeNq+N201+ueF5B9wK97eWNO+mnYO9bKFt9AzNqYN9jhhT0U8hwl0nWsqX0qwDkj16wik8ufDZ6oOnTPQ4UY0zQwoNRbSNZuHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPEJyI/G5QSyj+hAeEh63BjEyAC/vVzQrZ05510aifo=;
 b=fY2AMVb39Wh4gqfVveU0urnrxbNjSMvfIv6PhzYgQQ33wQAmS5DkmceETPETQjIqxDNXw1xXkMXvey/IIDBt1KHLqPfr31cljLX2tZXqCoomR//xt6dWPxhWN9E5zf8ML2mKBR5Z/HbnuW76g+XRyS1m3lhl7tAYIO6S78UyHCBl78Xcq7e8rI2JLYTjyxbkQNP0MamMbSEd7M2xnBNKSCkKeC0lXUK0Z35OH6eIjRBKNs3Hb6nEkHyfwnQmzCDlo4b2iBjvr2rr3+xSbgtfqwG09cxn8brxXfoJcH19YT/yS6J6TcTXfuyGyvQVzyQE8PyCYfPMdjYTPH0Chd2tlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPEJyI/G5QSyj+hAeEh63BjEyAC/vVzQrZ05510aifo=;
 b=J4UOvNNoNmIA+Y61f69Hq3uRF81cukMLrP7hf3XApSIOgSTY65V7mUtQD2Fqv8pBjB5gFAs2zWdFW2A8TcSK7jyWvnMu9d5GyWe/c+jPgWwL4gm47sDtclLVaGe3O6nlOliJHwiC8K8L2Vl2RQjgqq2xGrUKPddeTX0baVrB1n8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSRPR01MB11490.jpnprd01.prod.outlook.com (2603:1096:604:22d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 10:17:47 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 10:17:47 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	geert@linux-m68k.org,
	laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/4] dt-bindings: display: bridge: renesas,dsi: Add support for RZ/G3E SoC
Date: Thu,  7 May 2026 12:17:02 +0200
Message-ID: <9e6eb100d9c89ea34a4bff5a0f66a63e1fcee27d.1778148715.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778148715.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1778148715.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSRPR01MB11490:EE_
X-MS-Office365-Filtering-Correlation-Id: ec665078-5be2-4805-43ee-08deac21e2e5
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014|3023799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 D1DflMFm+f6vv7FgVIFoawwiaapnQfsDw92LwmWH3aiUExOiebX3XlEvilTpFaYDU/LRO+J+SnYIJuAOmt8t4DBbR+LICt+tABG6b7ornotxJOOy8pSI1Qz/gBaRBqqvUKMTD7zjoaDyWnlBXU4aZ0kNz5FtjXkY4dW+gpaf/bKd9Z1CnlRXYrNC4THYvRxPXZ4O0WVveCSg6J561ie6nWsLxSIefO+j79rgjWKxPAnW0pxU9ChCza7nhh4oVIKT7crk/89juQjfRqGE1Ubu8lBHjIUOWSccJrT7PtYMVwy+TsRrBE6Ay/o4XqPCfLObJKU31SduDPbDmeQYnfTvY8ZGt94T0vJZde/56eVjJ7i38+ICFrUxaff0h/d/aJ2jCMbwmDmCzLxqybrNN2dbSyFr8NaJnLjeyTAmPtuoA0Z1XacISLArvHkIRzRVPcaW7m8jwaBkB5xxvzJhZ/dSunY8AhrLumUuSfTI7+GEIwiqyZKCSWXWzVoUI/n31lmjvgzNXep/F9FRkG5NOMJkQjE7HDKn04lvRRIMQFWhcwZkUk6NevMFZ4ri3YBL1IJKCKKCIOIojYpFJN+EjUfqi2UOKzLfTZ59UyN6v+UspCK1DbwKN+k+VsJGvSXYK2RASqFdLKfoLDHJo6MMF+jIjGptWnieJVBnT2c5xexsd1n/+5eWUGnXGK9z0vAYYp2k0e+ASedTjcH6joOCclUHEu8IBWQeVekkjZt3ICCREeVMNe3QJPjrUmW+DMmsOoOc
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014)(3023799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?GwRMGI5vS9MFhWWlQyVIZ2OfAmzOnnOfE17A08pZ7CyztTSCr971w5nwqv9t?=
 =?us-ascii?Q?hIIWe7V8BsF4nNZmXeesubbl1BcuyKgx/OoNVR8LbBPkJjzPkIhi2oizOUQv?=
 =?us-ascii?Q?j/dlE83/p1Qjeu/pIBGVfl674RrShb+UoGNf7E46aSRqTjNTTzz6EBeygIhJ?=
 =?us-ascii?Q?hWdI7YIBBg8dSd8zR2212dzhuAsZ3rRrrR7OmdXP/Ewt3CotBNifJ/2hHyXh?=
 =?us-ascii?Q?RBdcbeHPmUUwCwA65b6g6GQXfODYi/O4EIgdR7tXNkbIRmWHzghOSXrlWWUu?=
 =?us-ascii?Q?10XzHPad+JC8XRmw+ah3bZp83TCJoNBzYWah33O66jEcZWQR1R9fa0zVNP3o?=
 =?us-ascii?Q?wYkLG1N/feqJ2BH+BQqRaMKMVo6PQNhkSSkXyt+lQILLS8wVrVjT2lLSpSqR?=
 =?us-ascii?Q?JYSkWjIM2Hv7uPkMF8eWy60Ffu10tCnebuV4fAe306KAmpM9/0ECCW7ar81R?=
 =?us-ascii?Q?PJ4bguqWJfHY06VNncigITP03hRDVNnLtwo4LFC5jSprmnYNv65zL9MVADkx?=
 =?us-ascii?Q?ocr03wKQIoO+Syd2BuhOC15tITl3jfeoAVoLopwPGIy8Yc23T9Tq23pR05CG?=
 =?us-ascii?Q?PIPFub+2JI2JGdzvbQtWFpEg3BaBZm5gIKojgVpjvCZbTYgpzRcTrG4W2fJJ?=
 =?us-ascii?Q?RmoiY46cm0kdel6pltbCTQMIrBoQf4R2N2aa7KyajI9Cm2xlPPgGFgbHlwYw?=
 =?us-ascii?Q?XWZBv/78xVu5gHjevID9Z8iiJgYZxouu1iOdgg8wxs4wIekhin+2O3UbmQ/w?=
 =?us-ascii?Q?eP6pPRSlhe1GPies9ok0zAC3g4myQRyO5RqeGSuz/OhHaAc50Ay3fVOz1nMM?=
 =?us-ascii?Q?/4ghUE36UfNObK6cIIN+Lf0ORwLtHzHRHmH0ve+dni9PJWr1yMUFvvlSntqL?=
 =?us-ascii?Q?LCBrDP6d0pP/r4U2AA3fzxa5Fdfb3gVOHz0w3rUcK9xB01pM63NQ89Los0Kd?=
 =?us-ascii?Q?WoMZKmBSaNr/D4avXRD2Tvse8A+xBxdML5Fpv0pODy0I9sh9kKt07VfpQJWx?=
 =?us-ascii?Q?EAb6tLVVutCjGif8d7Reevc4SE5jlSmUrNJ6woutKZrqBK6WnAGG/YgJ8vCi?=
 =?us-ascii?Q?7FDkKPI3aGPBLJEzZmyT7zV5R9uewcEGXoRSalobmR3ALkGl4yajSfgAwNY+?=
 =?us-ascii?Q?JDjDT0sv+1jHCIColxN15cqmddzJCS/TqHtYNBmM3KKO2G/wvaohk0IEv88P?=
 =?us-ascii?Q?/4/BmzJhrx4V/jmEZirsa/oHG7AOnSkGW8atMDf1HEKn7wMYYIWS1mmbRWuE?=
 =?us-ascii?Q?1fPpKDBkAiVJ/3OyerqCpkwIJdIK9LInQxPx7nAKdZSP86egbSzY9smYRbXU?=
 =?us-ascii?Q?bTZ2vnp2pu0M3e6I8F5Ug59HshJ5YjNIaY/xr9VHiQIplFbidK6KFGH3Bq6V?=
 =?us-ascii?Q?6nXTlw4ekcvxkRhAV1DoXW2BirU+1FNPe5EEHCtrXDMU7c/bhhQGT2u+Vumj?=
 =?us-ascii?Q?528zIVzIoLfTsBdK2qrEWHXigxAT1G7sUiNku5WUnfDm2yUtYA5c42v0cfGp?=
 =?us-ascii?Q?BYlP04PhYVw3TwalEhS/rTjaTkJncElgrqSnEZixA5m6UZHZY1OdBcyPtLcC?=
 =?us-ascii?Q?8wgJX9xz/E7+/DazZgiSqklsN1hJH1nFVcTJ9vqkjnG0zH3JVasW6NmxBz6k?=
 =?us-ascii?Q?je4w9Vbal8FA8/pz662u7+Kdw7C7YeSLtPRU5PNPM8ttljiQe2a4Tp7T0nA8?=
 =?us-ascii?Q?NqgY6tOTYCzvVcbeF0zpxm5gqw5XO37InGd6DQ2F7OvfDqOBNNtKliLV7eoS?=
 =?us-ascii?Q?REGEJwFCyow0Xjo3FdGnBvlaN9EHp5f9Zya0iiZyOwPyMju2Fd8i?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec665078-5be2-4805-43ee-08deac21e2e5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 10:17:47.7194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2/sjTV+d2GaDaprjQj0fxKRtPA18fbZ9WG8Ba6Xkz1YIwgIayXAHfNY9mT6rz3S/0/QN03p8lfy015dWCpn9dpV9yhY90w+m+LgIoJgY/lpE0VKzw9d58qwGjZ1XDXAd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11490
X-Rspamd-Queue-Id: 43AF84E6A11
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [7.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[bp.renesas.com:s=selector1];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,bootlin.com,ffwll.ch,linux.intel.com,suse.de,glider.be,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-32219-lists,linux-renesas-soc=lfdr.de];
	GREYLIST(0.00)[pass,meta];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[renesas.com,none];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	R_SPF_ALLOW(0.00)[+ip4:172.105.105.114:c];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_SPAM(0.00)[0.986];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.1:email,renesas.com:email,bp.renesas.com:mid,bp.renesas.com:dkim]
X-Rspamd-Action: add header
X-Spam: Yes

The MIPI DSI interface on the RZ/G3E SoC is nearly identical to that of
the RZ/V2H(P) SoC, except that this have 2 input port and can use vclk1
or vclk2 as DSI Video clock, depending on the selected port.

To accommodate these differences, a SoC-specific
`renesas,r9a09g047-mipi-dsi` compatible string has been added for the
RZ/G3E SoC.

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v6->v7:
 - No changes.

v5->v6:
 - No changes.

v4->v5:
 - Collected tag.

v3->v4:
 - No changes.

v2->v3:
 - No changes.

 .../bindings/display/bridge/renesas,dsi.yaml  | 144 +++++++++++++-----
 1 file changed, 109 insertions(+), 35 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
index c20625b8425e..00ef279129fd 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
@@ -28,6 +28,7 @@ properties:
           - const: renesas,r9a09g057-mipi-dsi
 
       - enum:
+          - renesas,r9a09g047-mipi-dsi # RZ/G3E
           - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
 
   reg:
@@ -54,20 +55,8 @@ properties:
       - const: debug
 
   clocks:
-    oneOf:
-      - items:
-          - description: DSI D-PHY PLL multiplied clock
-          - description: DSI D-PHY system clock
-          - description: DSI AXI bus clock
-          - description: DSI Register access clock
-          - description: DSI Video clock
-          - description: DSI D-PHY Escape mode transmit clock
-      - items:
-          - description: DSI D-PHY PLL reference clock
-          - description: DSI AXI bus clock
-          - description: DSI Register access clock
-          - description: DSI Video clock
-          - description: DSI D-PHY Escape mode transmit clock
+    minItems: 5
+    maxItems: 6
 
   clock-names:
     oneOf:
@@ -78,12 +67,14 @@ properties:
           - const: pclk
           - const: vclk
           - const: lpclk
-      - items:
+      - minItems: 5
+        items:
           - const: pllrefclk
           - const: aclk
           - const: pclk
           - const: vclk
           - const: lpclk
+          - const: vclk2
 
   resets:
     oneOf:
@@ -136,13 +127,6 @@ properties:
                   - const: 3
                   - const: 4
 
-            required:
-              - data-lanes
-
-    required:
-      - port@0
-      - port@1
-
 required:
   - compatible
   - reg
@@ -164,33 +148,123 @@ allOf:
       properties:
         compatible:
           contains:
-            const: renesas,r9a09g057-mipi-dsi
+            const: renesas,r9a09g047-mipi-dsi
     then:
       properties:
-        clocks:
-          maxItems: 5
+        ports:
+          properties:
+            port@0:
+              description: DSI input port 0
+            port@1:
+              description: DSI input port 1
+              properties:
+                endpoint:
+                  properties:
+                    data-lanes: false
+            port@2:
+              description: DSI output port
+              properties:
+                endpoint:
+                  $ref: /schemas/media/video-interfaces.yaml#
+                  unevaluatedProperties: false
+
+                  properties:
+                    data-lanes:
+                      description: array of physical DSI data lane indexes.
+                      minItems: 1
+                      items:
+                        - const: 1
+                        - const: 2
+                        - const: 3
+                        - const: 4
+                  required:
+                    - data-lanes
+
+          required:
+            - port@0
+            - port@1
+            - port@2
+    else:
+      properties:
+        ports:
+          properties:
+            port@0: true
+            port@1:
+              properties:
+                endpoint:
+                  properties:
+                    data-lanes: true
+                  required:
+                    - data-lanes
+
+          required:
+            - port@0
+            - port@1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,rzg2l-mipi-dsi
+    then:
+      properties:
+        clocks:
+          items:
+            - description: DSI D-PHY PLL multiplied clock
+            - description: DSI D-PHY system clock
+            - description: DSI AXI bus clock
+            - description: DSI Register access clock
+            - description: DSI Video clock
+            - description: DSI D-PHY Escape mode transmit clock
         clock-names:
-          maxItems: 5
+          minItems: 6
+        resets:
+          minItems: 3
+        reset-names:
+          minItems: 3
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g047-mipi-dsi
+    then:
+      properties:
+        clocks:
+          items:
+            - description: DSI D-PHY PLL reference clock
+            - description: DSI AXI bus clock
+            - description: DSI Register access clock
+            - description: DSI Video clock
+            - description: DSI D-PHY Escape mode transmit clock
+            - description: DSI Video clock (2nd input clock)
+        clock-names:
+          minItems: 6
         resets:
           maxItems: 2
-
         reset-names:
           maxItems: 2
-    else:
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g057-mipi-dsi
+    then:
       properties:
         clocks:
-          minItems: 6
-
+          items:
+            - description: DSI D-PHY PLL reference clock
+            - description: DSI AXI bus clock
+            - description: DSI Register access clock
+            - description: DSI Video clock
+            - description: DSI D-PHY Escape mode transmit clock
         clock-names:
-          minItems: 6
-
+          maxItems: 5
         resets:
-          minItems: 3
-
+          maxItems: 2
         reset-names:
-          minItems: 3
+          maxItems: 2
 
 examples:
   - |
-- 
2.54.0


