Return-Path: <linux-renesas-soc+bounces-32001-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OLWJp2I+WmF9gIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32001-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 08:05:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2BC4C715D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 08:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 15FC630080AA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 06:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81AD03C5553;
	Tue,  5 May 2026 06:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JYoHpDtf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011031.outbound.protection.outlook.com [40.107.130.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964623C4547;
	Tue,  5 May 2026 06:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777961114; cv=fail; b=Ezyq2/lDbmWMBpyssEuP7W3nCO/tcr5Dms2+NFjh5nTNAtysoOJJuobIr3W8D3gcj4ypE251Ro9n9ZKXRjUd5rYrg4bKea/w+EghtkGKkeUmUzYqQYlTCsAEAw9OncYMM4UXawJRLadMCDoJ+u0fWgO5M59XOCUt2g8xxRzGTiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777961114; c=relaxed/simple;
	bh=tHigRFcu5eZPs+EhGfKKs3JxLn1fpi/c8ju7A8irEJ0=;
	h=Content-Type:Subject:From:To:Cc:In-Reply-To:References:Date:
	 Message-Id:MIME-Version; b=hb0cNKzxQ3JbA8jxFfwg1nATkGcNsuxWQAHdslDat/sER6sKI6Oe4g3PlEPhIGyw/zfl92FbvleXd0JDCp0JaLY1MV6axn1Yeu0s7LVxwPrCb6W1FRA5G1xA/pZ8MN4gMZ9vLjt3ESK30+R5Mnesi2kftKlSatLkzMV+N9yL1+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JYoHpDtf; arc=fail smtp.client-ip=40.107.130.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CGomjHs2YbgJ9DsI4EFQqziv/YAeBgX34hDHfsWCY6ThW7Sjrd2QBodf6naAIsCl62RcQaODtZSIEBdJ9lRyUcTIvpmmJkFw74NF/ZoxCTp6e9aDCALYy5RXE5DPcl/go1fCZq4oIixwwJAyFGwTEtPvbxENGBqJPfB/zo58rKBSX6+uGQIrSeX0vImFUrTtPW50EUv0190mRx4d7vLVXx6uF9AUy9CMzVXnOU2DXRQ9uMSgQtW4okYaPsLW07THwvdPweQZa8Ez7vbTrIzwt5LP+MuoR3YKUnJYIXhOlZGe37GlKhaFBzPSnSHTngTmyDNydRA1ZJ/43r72AULppg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qpH+k8ozOSaP/YJnSeDy9Kvj1unA5rdQXCBuBQhhdHs=;
 b=PRC2bhx5apL81bJFUNfYHj02Q4vOK5bmgnr0w9riAbAyrrs0pgHiTy9Bty7oau8XVWCTy4OB8w0Nv8iNYlkGR7QTpDA4rQT1HyStfwSLOCbZkoNWmsyPksd34GHl6rbCVF2Ov4Z2o4gcxtsBaQdQqFzxA7V67NKpGydoe0MyLAC5uo7pno6haMoI45VntAwop7v8Gc92OwHl73OG6uaSShmdgnX0BGYz/U5cjFpvo8/iDkdRh9PoKCtEbRuNFLxe9mS+9QP7sq/E0Yiwx6+pvy/cMyCQQOt1LSAx4wt4oHvWhz5sQNnN6YcuqjvL/6YEebBx42ehNmogLmFG19t7cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qpH+k8ozOSaP/YJnSeDy9Kvj1unA5rdQXCBuBQhhdHs=;
 b=JYoHpDtfQU0cSpGD1fcGtIm02IXF06nzOYQ07sgfjphGmEJ6AtUDmj66VbHOd71qfti3I2dh5BxRiMBaYv8MFOjuzlVlNDQ5GqI+/Xe37QQUb86Gs9Mzr879HaMTN+R1K2tOX7TMR17rVJ7VXwORx/huGmv+ESHRUSTptdoFGrGLsb6efqdBNBPwiaydgOUOxvwCbxdMsOxBA9HF+2CmkMjKjeD4YoB6PDmO/UvHK7G71X5vyMW87y+PEF+jldj6YYbTo1zkZ1bwGcl9iI5E2OVnYKXr7nq9vXjyPf65l1S+wis1/hIQiilLF9dsxdigIO9EOW5Xu2qxB30//D6IVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::8)
 by AS8PR04MB8753.eurprd04.prod.outlook.com (2603:10a6:20b:42c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 06:05:08 +0000
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c]) by AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c%3]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 06:05:08 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4] drm/bridge: ite-it6263: Move chip initialization
 code from probe to atomic_enable
From: Liu Ying <victor.liu@nxp.com>
To: Biju <biju.das.au@gmail.com>
Cc: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 linux-renesas-soc@vger.kernel.org
In-Reply-To: <20260501061200.20129-1-biju.das.jz@bp.renesas.com>
References: <20260501061200.20129-1-biju.das.jz@bp.renesas.com>
Date: Tue, 05 May 2026 14:06:21 +0800
Message-Id: <177796118174.2938892.16022923788087522823.b4-review@b4>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI2P153CA0012.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::15) To AS1PR04MB9287.eurprd04.prod.outlook.com
 (2603:10a6:20b:4dd::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR04MB9287:EE_|AS8PR04MB8753:EE_
X-MS-Office365-Filtering-Correlation-Id: aa916ae6-779c-4672-8af0-08deaa6c4291
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 bsGM0puJ3+ocwxGLhDG05MRX8xQqLq556uAgA4FuLGQ81oH0/43F52cJYv2F7xUikLwtICelGxA5o5Pi9OMfw6f175OMuxuEwgy5LAMeZOi9TDKCdLXa4JpZAQMk65C8f1MUy83O8JsA5Oj821vv1Yxd4jsw85BsXbusW2HSwLKtdeGRsD8xaFiGBnP3gjNy/Ey4DITWnO0a/ynA5lF1U6s95N2pyUOAGi++Kx5dD2OYREgZxgk76AZImNa4PX/HQsJpYGE3XFHir/xl59m0UGM0hy5rDg/nzOlK0ebCdYUrKRsCeBpf72xPCconTe6DIuYRn/rqQAsM1B9sxbRUv4bFWwB/JzE3fNLZdDFxNobvViOBXYBE67D7MglsuGCeMKcVBxcArilGeCQ3fXLBc3LPViXGM1l+1bPxWOQE6Bz5Hp1ySSzhzNKL2Ne781144v80Aldfv+8U4TdzJmfrh5T/oZ2ZpU9d69MDSeFRocGI581FI4FNUOgk4+HK3sbwwhSg0IiBg6pAa2PQQEcO6UzezC4fV4nZ9vwlnR6D7v6n1s1JxyjOpYhPdGmln21vaN1FeaYfIK9CTH2PdOFLrueQhqHrZL3gSX1SLvYtXhaTrWfQwCbnOVpQwHKNL9pa7euj2I0MZK8KvL+eq2oUQy3lEm12k8XvYkJvLCyvRPqIQCD0k1pz/qpo8C1Rd7BGFhTh/p6qEczM7B7XhwO6j3J4XD/RRI7mj1mw1O62naERDnC3BbI5/3P5ZzJiufTo
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR04MB9287.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Y2YwenZiMEtYZGE1a2liVTY0MUVnaVBFYzNTVWF5c3BwVnNhYmZTcC9veS9p?=
 =?utf-8?B?bXJKdTZOdjhRZlZCN29GbjJFNkVCcnpTVER2Zkt3UmsyaU5vMmdxQkx1dnNK?=
 =?utf-8?B?RFJVRzl0ZWlyb05LbUpKaVZvWUdUT3RJalRHRXFDQSswRW94dkR4eHpITXFR?=
 =?utf-8?B?c2tpS2J3Qmg2MlRqdno4dkZWOGtId2tuUnlWdFZVWUhTR0J3NkNtSU5yYkkx?=
 =?utf-8?B?b3lLV3ZCNlJPYUVwMXRpM2VPT1RsWHloWGlPSGc2ckxZVlhENnJTTmtxdzBs?=
 =?utf-8?B?TTZiVDFRbnZabFFKdDMyYUVKKzJBY21WaGsvZUxJMWo0cUpxb1QvbTJtdnBU?=
 =?utf-8?B?YVlMMDM5SHJUY3NmTGhJUEdURnlPT3NMaFhvVXl6RGdNNmhBQTZwbFJ4Yk84?=
 =?utf-8?B?SHBvTXMvdW9QQkFWcUJMeXY0TEZmZEszV0pGZEpuY3NjN25WVVUxYStpMlA5?=
 =?utf-8?B?bGtEdnoxQjBxaEd1ZkNJL3VJS3ZoNWc4NUo1bWppdWtCVXZldVBTMndYa3B1?=
 =?utf-8?B?K3NOUlJ4aE8rS3JyenVreDV5WUZpdDhvQVkzNERNUy9XbXBKRjZUalpObzl1?=
 =?utf-8?B?eDhSTnAxckpKNk5SeXZJd1pEdXU0ekdXZDdnWHFHZW1sdFhBb3hpWVdublNk?=
 =?utf-8?B?bWRSb09QbmVxc2p2bU1sSm5rMVkwL0FUakRWTng3UTJIc3VqTlF5N084YndV?=
 =?utf-8?B?U2hxdXdvOU1HMDFBdnVPRXpxcTM2eFI5S0U2WVNBc3VJOUtGbEdFZzBxcGw0?=
 =?utf-8?B?bFhEdTZjNW5kQ0pYWkh3MWNadmhqa3g4Nm5KenVCeFFDZ1pnNGp2U1p4dXBj?=
 =?utf-8?B?USsrNlVDV05FSFNuNGVMTXpTTTlxaFJmYnZmb1h0SEJFeVptWTVHMisvV0tQ?=
 =?utf-8?B?MisyVlZhbmwxUTdjTENBUEwzVEZMME9KSGZkeVB4cTYvQWFESXVuS3pZZ1l1?=
 =?utf-8?B?b1pLVGZLRlAvUjlDUmcwcEViT2xFd1A5Y3pYRE85dXpLdk5qWGo5VjY5QTZQ?=
 =?utf-8?B?cm84T0hwMW81c1NIQ0h4ZXpkZ2xmd0U0NHRYL2ZuOGVMY1dERlZmNGxJTmtW?=
 =?utf-8?B?ZkZPME5WRVlzaklOWGVXK2llTGRra0ZOUWc2U2pMdnZqbjJiTmYyemo1VzNx?=
 =?utf-8?B?WlJudkhhelBkK25qZk5vL1MremJNbGJPWEFuQmJWTHZ6cW1UUE1WdVB1KzhY?=
 =?utf-8?B?RU8zUlJXUmhUTnhSdHNmcTZUQTBjdGdoYmcveVVkQ2tIdUtMeWxKUU5hZnhw?=
 =?utf-8?B?dmJkOEJzVkZDK25abGFnVkpTWWVXVWdEazh5N0tyWnVyZ2VNZ01QaHdpemUv?=
 =?utf-8?B?SHF6Tm16YUw4V3NBTThTSVlaeXJwRFhiMzFIRmtzUlVWZUJOYU1ERlhUcjl1?=
 =?utf-8?B?OTFybWZpcDZUYTRTSTB1UHJRRHFkdklIdFlDNFV4NGh4Mis5OVN4NmRycmR4?=
 =?utf-8?B?cFJWRzl1UjRydjFOd0dYdFd4YUk0b2NldkJqZnU4TkI2aDJXZDhoRDVscEt2?=
 =?utf-8?B?Q1lFa0tORUJrUlBmUHRjOE9wNmgwa2lwaDlTdWFmbzQrWXpHT2ZvVVpnemRw?=
 =?utf-8?B?UE9QQldZWkJPeDM3bldoVDJmZk5aMFJKOVEwUEhyVTJJMG9aWGx6SGNzS1Vx?=
 =?utf-8?B?YWVyMjhrOFV6L05JQkUzMkNEVlJsSjRkM0ZPZTVHY0V2dXZMYkRpODZzeVVB?=
 =?utf-8?B?Q0Q0OXY4N1ZiMkRTLzNQNXYvUHBKS21wSVh0SWpNenBseUJjTzNVbVBwSGxD?=
 =?utf-8?B?bVk1dk9UV0VhcktJb1NjMitxMUZhYTA2U2FOWXlMS1g3TmNHWG5UUGRxZXFs?=
 =?utf-8?B?ZlVML3RkaVd3dFNYK0RmUW5XdHlWYjFsQzIwRWFYalZBUHJjYi9HWXhrQVJz?=
 =?utf-8?B?YU1uY3lhaFJmK2l4bnVuL2twU0Y2d1kzZVlzdDdWM3ZPRkdCcjZyd0djL2JD?=
 =?utf-8?B?QXVrSGxRRUNNa3A3blBzaTBtSG1jSXpIL0hyVHFKTHZlMEFLSEc4ejBuWnU4?=
 =?utf-8?B?LzQyZDEzQzNLMVBkQnUyZEhNVVNEa1FIcXhKend6UWhjb1ZBWWJMcWhYRit2?=
 =?utf-8?B?WmIrSkxDZkF3ZlpWUGJUNDd3cHRGVVBQS0kyVGtYYlBQT3ZLeU1JMENSbFNu?=
 =?utf-8?B?dWw5bEwxNFRkcGsxckQ4cEhNN3Y1c09pWlRSenR2T29lVzk2dFhCL0UxTDBj?=
 =?utf-8?B?RUJabFhoVEpXZW5nbjNxaGpLQlViV0NmUjFhVkI0TFBVOHZiREpsQ2dlTC9n?=
 =?utf-8?B?UDFwS1FOZVVYZjRNSVpVR21USjBHZ1ZvT083elMzRmFWenQ3L2pHVUJjdXhT?=
 =?utf-8?B?aFFTZEVtQllYYTdnSzh5QVQrTGxXVmowYUZraWxNUUtWdmJ6M3JyUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa916ae6-779c-4672-8af0-08deaa6c4291
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 06:05:08.6719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UEWX+hUd6TmNLAC7ky7R6rkijIaxKwhdO0lk3SfufU6iiR7DHDkBKX50vygWvjZT13e3UllKwVYMeMUvy5qcPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8753
X-Rspamd-Queue-Id: 1F2BC4C715D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32001-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[victor.liu@nxp.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[nxp.com,intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,bp.renesas.com,ideasonboard.com,kwiboo.se,lists.freedesktop.org,vger.kernel.org,glider.be];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,nxp.com:dkim,nxp.com:email]

# Add your code comments below. There is no need to trim or delete
# any existing content -- just insert your comments under the relevant
# lines of code. Lines starting with "> " are quoted diff context and
# lines starting with "| " are comments from other reviewers.
# The final email will be reformatted automatically to include only
# the sections that have your comments.
#
> On the RZ/G3L SMARC EVK, suspend to RAM powers down the ITE IT6263 chip.
> The display controller driver's system PM callbacks invoke
> drm_mode_config_helper_{suspend,resume}, which in turn call the bridge's
> atomic_{disable,enable} callbacks to handle suspend/resume for the bridge
> without dedicated PM ops.
> 
> To support proper reinitialization after power loss, move reset_gpio into
> the it6263 struct so it is accessible beyond probe time. Relocate
> it6263_hw_reset(), it6263_lvds_set_i2c_addr(), it6263_lvds_config() and
> it6263_hdmi_config() from probe to atomic_enable, ensuring the chip is
> fully reset and reconfigured on every enable, including after a
> suspend/resume cycle.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
> index 2ea49245e700..4a8268d0eac2 100644
> --- a/drivers/gpu/drm/bridge/ite-it6263.c
> +++ b/drivers/gpu/drm/bridge/ite-it6263.c
> @@ -200,6 +200,7 @@ struct it6263 {
>  	struct regmap *lvds_regmap;
>  	struct drm_bridge bridge;
>  	struct drm_bridge *next_bridge;
> +	struct gpio_desc *reset_gpio;
>  	int lvds_data_mapping;
>  	bool lvds_dual_link;
>  	bool lvds_link12_swap;
> @@ -603,6 +604,15 @@ static void it6263_bridge_atomic_enable(struct drm_bridge *bridge,
>  	bool pclk_high;
>  	int i, ret;
>  
> +	it6263_hw_reset(it->reset_gpio);
> +
> +	ret = it6263_lvds_set_i2c_addr(it);
> +	if (ret)
> +		dev_err(it->dev, "failed to set I2C addr\n");
> +
> +	it6263_lvds_config(it);
> +	it6263_hdmi_config(it);
> +
>  	connector = drm_atomic_get_new_connector_for_encoder(state,
>  							     bridge->encoder);
>  	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
> @@ -838,7 +848,6 @@ static const struct drm_bridge_funcs it6263_bridge_funcs = {
>  static int it6263_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
> -	struct gpio_desc *reset_gpio;
>  	struct it6263 *it;
>  	int ret;
>  
> @@ -856,9 +865,9 @@ static int it6263_probe(struct i2c_client *client)
>  		return dev_err_probe(dev, PTR_ERR(it->hdmi_regmap),
>  				     "failed to init I2C regmap for HDMI\n");
>  
> -	reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> -	if (IS_ERR(reset_gpio))
> -		return dev_err_probe(dev, PTR_ERR(reset_gpio),
> +	it->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(it->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(it->reset_gpio),
>  				     "failed to get reset gpio\n");
>  
>  	ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(it6263_supplies),
> @@ -870,12 +879,6 @@ static int it6263_probe(struct i2c_client *client)
>  	if (ret)
>  		return ret;
>  
> -	it6263_hw_reset(reset_gpio);
> -
> -	ret = it6263_lvds_set_i2c_addr(it);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "failed to set I2C addr\n");
> -
>  	it->lvds_i2c = devm_i2c_new_dummy_device(dev, client->adapter,
>  						 LVDS_INPUT_CTRL_I2C_ADDR);
>  	if (IS_ERR(it->lvds_i2c))
> @@ -888,9 +891,6 @@ static int it6263_probe(struct i2c_client *client)
>  		return dev_err_probe(dev, PTR_ERR(it->lvds_regmap),
>  				     "failed to init I2C regmap for LVDS\n");
>  
> -	it6263_lvds_config(it);
> -	it6263_hdmi_config(it);
> -
>  	i2c_set_clientdata(client, it);
>  
>  	it->bridge.of_node = dev->of_node;

Reviewed-by: Liu Ying <victor.liu@nxp.com>

-- 
Regards,
Liu Ying


