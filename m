Return-Path: <linux-renesas-soc+bounces-29909-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IpBGiYLvGkArgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29909-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 15:41:42 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 446C72CD09B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 15:41:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5FF8030288CC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 14:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 101E6374747;
	Thu, 19 Mar 2026 14:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="h3qAbZKI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010036.outbound.protection.outlook.com [52.101.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED5E374172;
	Thu, 19 Mar 2026 14:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773930567; cv=fail; b=PvjVXjLQQB1SivKMPSaa/2xTh75aXaOY280JAyQQ8obpaSftmz12hJcttyhG0qQkaws17Zw7MpmazrUE9/XjZdnGnC+r+5xWxBv4lEI8wwY2eNcwtBxMHy8a0i/8pUcfQAZnlFCOV1DAI4a+qoP+UOg5Ei8p7S7bLFTdd0MGvXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773930567; c=relaxed/simple;
	bh=0pshBAOiWz6/WFOoonh40jg6d0Hg/H7jFD5ZYadKtdE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IONmEKZvvspdNPupkt3w1S/+AtqMoSbwMw2g25yuVaFmygHzcKnfJrUc8Ml7yfP/58mjoi3EvkEOgc3O/4Nq36Gdb2xJZd3xcYLxY7qCmbNnxDTRjNUVWEGsTyznbzbpDo7RWIquCINf1+aGMnLjc1FfchiXXtEOWfk2rZNRvgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=h3qAbZKI; arc=fail smtp.client-ip=52.101.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oe5oEihhZDPn5fjpMqXitZYSsQAxdGzxPJu8fyA19rgHrdix230pzmi7MeO8+jo4dwDjgxG0e/zOVaD/qpQCAeOxx+1Q6STaQwXFXAMqrf5zw9Sn/UWaGWrBAjNWkDWbjotkUmadHWzX0uNid1YRq8NDntKfrZiVMeixOJXVLXCiyBMHRoAtOip1XeR6ByhkHRl/iis6jlTAur+QS5csXuwqnRTMoAiIM2VlCJpGX9mu9DT6T8qyYcfjm784SN2209DKcFolbB2Qp+CqAtYSd4qgP5r81owfMlJB41korf1E/O+6CwB4bhns7RJpQEhvTUjwMgDg2EPoa0c41JSMFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0pshBAOiWz6/WFOoonh40jg6d0Hg/H7jFD5ZYadKtdE=;
 b=XO+Pkwa8akV4BlalWaiCcbGyohfRPkOec8FcYF/OiSppXEPVffOlehu26Ap96uqM21c94CqDEytzW5OTMZFemP9a8cZg8s//oL0VXpFZ8b+DBeAoTryOqqTBxRhILh99/TSNd+aKqR0vdNKegDwBOeNK3V8OvhmbDW4yPAxUMDM7BFbcTdeFndGpT6mqCM0Cx/tuaS8Avi4a7oJ0yQMbTtqm1/t5FNrwfZD4V7jEG0SddOt8MAIB0cCpPKcNxDZBSpxtL+z+UWK0Sdu05uoksxB/ODOotSnqYps+EvVDmEWX97RZG990vi8Oz94lM+KJF0Z56xjgd4oBzmAInLgtMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0pshBAOiWz6/WFOoonh40jg6d0Hg/H7jFD5ZYadKtdE=;
 b=h3qAbZKI3ucBiImaAKdFLapGadiyT9yqL2tTH42KIeH8ILAcgfBCmyUKODB1GjhHCDzwDSWC62vwOpCcFfWTUGEQB6bwW85rRcijRuVGX91ElmSrM9LGs3sRAOXKx0CVXKfKVrTIaVCZr8j0jOPHl10XD71JPeiKwiWRf4Iin14=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB8462.jpnprd01.prod.outlook.com (2603:1096:400:175::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 19 Mar
 2026 14:29:15 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.019; Thu, 19 Mar 2026
 14:29:15 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Anitha Chrisanthus
	<anitha.chrisanthus@intel.com>, Linus Walleij <linusw@kernel.org>, Laurent
 Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Tomi Valkeinen
	<tomi.valkeinen+renesas@ideasonboard.com>, Kieran Bingham
	<kieran.bingham+renesas@ideasonboard.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	tomi.valkeinen <tomi.valkeinen@ideasonboard.com>
CC: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 1/4] drm: renesas: rz-du: rzg2l_du_encoder: convert to
 of_drm_find_and_get_bridge()
Thread-Topic: [PATCH v3 1/4] drm: renesas: rz-du: rzg2l_du_encoder: convert to
 of_drm_find_and_get_bridge()
Thread-Index: AQHctrtX0XLGirkclU+u9oPCbIs747W16xwA
Date: Thu, 19 Mar 2026 14:29:15 +0000
Message-ID:
 <TY3PR01MB113461503F797D8EBE58D2CE5864FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References:
 <20260318-drm-bridge-alloc-getput-drm_of_find_bridge-4-v3-0-10f502520357@bootlin.com>
 <20260318-drm-bridge-alloc-getput-drm_of_find_bridge-4-v3-1-10f502520357@bootlin.com>
In-Reply-To:
 <20260318-drm-bridge-alloc-getput-drm_of_find_bridge-4-v3-1-10f502520357@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB8462:EE_
x-ms-office365-filtering-correlation-id: dd957fd3-f566-4984-3d3c-08de85c3e5cc
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 8UByie2kZJ+MegpC2sxXRzNpCZYHRAqY73gZkDye/N7dDXEr8smNWeYxNx2s/CfZgUuqOL1PTfIRxdIuQrl+XsmroogdmUzx5xkX6udo9wPubiGPyhKFcOptS4FAeod+X32ib+FDwO5QGRwr51YblPRjQ9ezth9cY7zVaMHmFAk0d5vtnzMd7uUqpYzQ+LBrKOQ3Jpxp8EAX+nk+q0oEE8YPXtwd4Lqx53TMBgF0aZD+0EY5xZlPcYVZjMsaqWwtLmFnvBVX3/dQhSWvNyktfUlvE+16DuJKf/h013qD7nLditcNkCUgjRfpOTYw9aA/w61X4le3lzKLuDjFTyiNl8QuBNmRhvz3OTTi6jLsLmhdmyTle2fv4Flv8Zxs6/tT+sxh55rANdUM5Uq3cdf27PQbE/cRpmxq1y5M25Q+0Xs6vopsxKCd5H38eDmq/Z3CMBqdrZYuY4FlbVrRxqhR/nfitjP2AyfEna9iT87Fm6zLsCkfSQaVyJsF6M1B9hEUHoGudhmAN8TfpLA/gE9WAL3SWNfpFJafxldeq25cztveE2dvpoPIeoo+kjnGR+99m6AbBVMna84pcF8mI4OL4VFTg73PmShds7UbLPTsxm7JKfH/BE1f9t3j27uMTK1dFDLxtN2zhGM49GLydklJCeiCGzwbRasKpG4gDCE+jxdXR8S2tI9TIc8E+53488dVlgjeBQ6BX69tuxSBayWbpaDQEkmbO73fJdNtGHU/hciw/BvfkVgq7nRL9n5uBC8KA0T5VpDhIzzfsfZJcTn+2riEdPcFQSEZ+nCADERiZ6Zr1nkT/DvFZx0UjKjlUJjt
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bmlIYmExVmhYRFdnMFRISUpUWitaTDlMcDBKa2U3eFdXTWtnVXFPYTZlenhv?=
 =?utf-8?B?M2dKUUZzUVc3Um0wTFhEMVdPQzVqQjBaMmx5RkwxampXaUYra2xsQk5teVJP?=
 =?utf-8?B?SVNDVGZBdzA1TjZtNUZ0MHFYalpTLzhnbEN0V05SZFZldHpVSXBPV3Vzb2tW?=
 =?utf-8?B?aGZLcFRyMThSZG5lM0JRWjRPYnFsN3YvRkM5cUl1c090S2plTGJoT1FoYklj?=
 =?utf-8?B?Z1ZkVXB1YlBFa1lpWjJNMEZ3TEFiVlN5anhGeTJpQ3pRd2I4KzNBY1RSazRX?=
 =?utf-8?B?VHNLbGNhUzBRTXp5YUsvM3daSlcrT3hNbzRLWkVNZk92MmRqNWw5Rk9BWFBR?=
 =?utf-8?B?dC9HUlJPSFBTOUd1Mm1lNENKd1ZEdE54TTQwUE5KdG82aXVVT1FZRStxb09H?=
 =?utf-8?B?K2tJT25xV1B0VkRlZmY1UGF1WTRLQ2xUOUNkL1RaRVFUUGcvVFliczI3SGlh?=
 =?utf-8?B?UnBoQ2VlUGY3TjAvdDlzZVR3czNWZnNqN0xBdy9FaENmR0RaOTVLb1V2cGN6?=
 =?utf-8?B?a1pFeSsvWnBhaHMybVgxTlFqajJCbVJxMjNFSVZiNWVRcG5HM2Q4RmExY1Z6?=
 =?utf-8?B?YUtoMGdJOFNMR3ptMzBDS1k0M0xiTGVuSldubHVqMEVFU2RDa0ZlUEdQSk8v?=
 =?utf-8?B?TExmM01qK1ZydGErZkZqZndBVHFnMVhPN1hTSWsvUWpZMzRTNWY0UGUzVGl6?=
 =?utf-8?B?UmNwTDc1cWJVWHFYWHNwc2szUlBsN0tWWnFZQ0JhVlMyWGhoN3hHVktXNmIw?=
 =?utf-8?B?dDRZY2Mxak9nWWdwT3Mxa2g2OUc2a3pMQ2tLVXRWaGZVV3hsWFpFMFBVQ2Nw?=
 =?utf-8?B?Qk05ZVBSQ05qNGpxUjdFREVEc3pqeWtkMzMwOHVhV3FFQ0hCOXJFbEZQY2gv?=
 =?utf-8?B?VDhmWjFtRVpyTWYwTmRrdDVPTmhtRmVjZnBZOVlUNjJHbVNJMzZlTy90TXFE?=
 =?utf-8?B?aVJqcjBDeUp2bGR1OFRtWHBvZHBGOUJ1L1BPVFo1d3A2NWN1cThmOWVwRUlM?=
 =?utf-8?B?YndpU3h1MnMyOEk0NFdsOWlncWNzUHNMWGhuNUlUa09OOWIvYWR5RHJRcTd4?=
 =?utf-8?B?SjJGSHNPTjhPR1FxZ3MrVmtiWXZJSlpWTWk4Z28xdDFERTYva1E2TDJteC93?=
 =?utf-8?B?dDNIclI5aUlBTHBCNURWSzlHNms0bFluZ2RHRUFSUzN4cnBoelkvd0dTZ04w?=
 =?utf-8?B?b0lCcnkvWEV3T0tkUkVxZ2RXS2dWUm8rU09oNjBYTU10T3AzV05mYlZCakJw?=
 =?utf-8?B?bVVaelBsQzNnajljNElTbWtRYlVGemsrVGZ5OUhmY1hPNEV1WDByaFVwaU9O?=
 =?utf-8?B?OEhxbTFXOW9BNkZ4ODZzbVFWNHVjc05qR1dpSFN3bmY4WG9pd2F4d2JmUFFr?=
 =?utf-8?B?aVVQa1FXQVJEUkVNWkJSTDRCSmhHaWhtVzBoZ2cybkMyUG9neTROSnNRSEsy?=
 =?utf-8?B?Yzh3ZjJBR2JyZGkxdytlRDlSdHZiRUNHcTVSQUI2NFJOMGF1MDllQWl0d204?=
 =?utf-8?B?c3lGK0VLaGh6SXI5ZnFIK0haMk52YXhTQVllL0FOT2JJTG9QNGxsYXd2RnlP?=
 =?utf-8?B?ak9MWUZscG1BNDdtS2V0VnJSTjZyZFcreWFPQWY0VGZHcUNLRy9QRTFCM0tz?=
 =?utf-8?B?dExvRSt6TThzMTJTZzRwMlVGYlh4NFlsTEhYczlUMVdLMEdHeklnRFBYS3pF?=
 =?utf-8?B?dEc1cGVNdEhVRzBQTGZwY3M1dVRsd0RwTFZxTTMraWw3M0g3SXZ3Sm4wL21a?=
 =?utf-8?B?Q2tVdEdLMytNU0VDNHRkaU5wT0d3cytrQ3MxNTBhbjFwNWN6WHlvVHQrMDh1?=
 =?utf-8?B?L0xJT2pCVzNUVDVNMGRnUktnRkVpVzhsUFZIQXcxbXdnQjlOYjVkME16VTN5?=
 =?utf-8?B?TjAybXNlZGFra3ZZcEg0aG0zRVdMTmp4YnBLNjdDMXJ4ZjR5Z2loNEpEbDdB?=
 =?utf-8?B?TkpuVzZJc3ArbDlVQi9VTWVyY09vM0RjVXFJL2E2TkgxUFRKNUk1dHNlS285?=
 =?utf-8?B?NUphWU92a1NOVkhEL3NLMWxLd1ZETGpiTVNhQzlPTGVQVzdOR2hLeFVkYyti?=
 =?utf-8?B?M2lJTGNmZmpKSDMyQjVlY2podFZ0WTdpQVBySXZySFpIL2tTTlh6bllBaG5p?=
 =?utf-8?B?OTZ4WDVxZzVCMmJqTTVKL2dnTzdSM3dJR3ZhZE5OS2E2R1dZbXMxUFNLSEdS?=
 =?utf-8?B?Y2d4ZHlCMk56a0FZbWNxMlZmUitkdDFDa0ZUUzdHNEJ5MnhuSkdVTm44OUQ2?=
 =?utf-8?B?MkczdnZYbEdCaDlsYzgrcHE2S3Y2QTVVQVJtNUFJNkZPdU0xdXRadksrWmxu?=
 =?utf-8?B?SUhlU2YxOVlpZERvRVlUQVBpTi9aYXdrOGt0S0FHS01lTUJQejdKdz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dd957fd3-f566-4984-3d3c-08de85c3e5cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2026 14:29:15.3076
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ESuIM193Hox2RsSi6D2tJ7NDIwTjrMwATSJKu9zVGbj3s1gZddavsg72ikieg1N2XGEc/ds3h6CkI5aG5HvJHRI8AFfvuv9FkZH2RehGrRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8462
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-29909-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[bootlin.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ideasonboard.com,glider.be];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.980];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bootlin.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 446C72CD09B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgTHVjYSBDZXJlc29saSwNCg0KVGhhbmtzIGZvciB0aGUgcGF0Y2guDQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTHVjYSBDZXJlc29saSA8bHVjYS5jZXJlc29saUBi
b290bGluLmNvbT4NCj4gU2VudDogMTggTWFyY2ggMjAyNiAwOTo0MA0KPiBTdWJqZWN0OiBbUEFU
Q0ggdjMgMS80XSBkcm06IHJlbmVzYXM6IHJ6LWR1OiByemcybF9kdV9lbmNvZGVyOiBjb252ZXJ0
IHRvIG9mX2RybV9maW5kX2FuZF9nZXRfYnJpZGdlKCkNCj4gDQo+IG9mX2RybV9maW5kX2JyaWRn
ZSgpIGlzIGRlcHJlY2F0ZWQuIE1vdmUgdG8gaXRzIHJlcGxhY2VtZW50DQo+IG9mX2RybV9maW5k
X2FuZF9nZXRfYnJpZGdlKCkgd2hpY2ggZ2V0cyBhIGJyaWRnZSByZWZlcmVuY2UsIGFuZCBlbnN1
cmUgaXQgaXMgcHV0IHdoZW4gZG9uZS4NCj4gDQo+IFRoaXMgaXMgbWFkZSBzb21ld2hhdCBzaW1w
bGVyIGJ5IHRoZSBmYWN0IHRoYXQgJ2JyaWRnZScgaXMgYSBsb2NhbCB2YXJpYWJsZS4NCj4gDQo+
IEhvd2V2ZXIgd2UgbmVlZCB0byBoYW5kbGUgYm90aCBicmFuY2hlcyBvZiB0aGUgbWFpbiBpZigp
Lg0KPiANCj4gSW4gdGhlICdlbHNlJyBjYXNlLCBqdXN0IHN3aXRjaCB0byBvZl9kcm1fZmluZF9h
bmRfZ2V0X2JyaWRnZSgpIHRvIGVuc3VyZSB0aGUgYnJpZGdlIGlzIG5vdCBmcmVlZA0KPiB3aGls
ZSBpbiB1c2UgaW4gdGhlIGZ1bmN0aW9uIHRhaWwNCj4gKGRybV9icmlkZ2VfYXR0YWNoKCkgbWFp
bmx5KS4NCj4gDQo+IEluIHRoZSAndGhlbicgY2FzZSwgZGV2bV9kcm1fcGFuZWxfYnJpZGdlX2Fk
ZF90eXBlZCgpIGFscmVhZHkgaW5jcmVtZW50cyB0aGUgcmVmY291bnQgdXNpbmcgZGV2cmVzDQo+
IHdoaWNoIHRpZXMgdGhlIGJyaWRnZSBhbGxvY2F0aW9uIGxpZmV0aW1lIHRvIHRoZSBkZXZpY2Ug
bGlmZXRpbWUsIHNvIHdlIHdvdWxkIG5vdCBuZWVkIHRvIGRvIGFueXRoaW5nLg0KPiBIb3dldmVy
IHRvIGhhdmUgdGhlIHNhbWUgYmVoYXZpb3VyIGluIGJvdGggYnJhbmNoZXMgdGFrZSBhbiBhZGRp
dGlvbmFsIHJlZmVyZW5jZSBoZXJlLCBzbyB0aGF0IHRoZQ0KPiBicmlkZ2UgbmVlZHMgdG8gYmUg
cHV0IHdoaWNoZXZlciBicmFuY2ggaXMgdGFrZW4gd2l0aG91dCBtb3JlIGNvbXBsaWNhdGVkIGxv
Z2ljLiBFbnN1cmUgdG8gY2xlYXIgdGhlDQo+IGJyaWRnZSBwb2ludGVyIGhvd2V2ZXIsIHRvIGF2
b2lkIGNhbGxpbmcgZHJtX2JyaWRnZV9wdXQoKSBvbiBhbiBFUlJfUFRSLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogTHVjYSBDZXJlc29saSA8bHVjYS5jZXJlc29saUBib290bGluLmNvbT4NCg0KUmV2
aWV3ZWQtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCg0KVGVzdGVk
IG9uIFJlbmVzYXMgUlovVjJMIFNNQVJDIEVWSw0KDQpTbywNCg0KVGVzdGVkLWJ5OiBCaWp1IERh
cyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQoNCkNoZWVycywNCkJpanUNCg0KDQoNCj4g
LS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei1kdS9yemcybF9kdV9lbmNvZGVyLmMg
fCAxNCArKysrKysrKysrLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JlbmVz
YXMvcnotZHUvcnpnMmxfZHVfZW5jb2Rlci5jIGIvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnot
DQo+IGR1L3J6ZzJsX2R1X2VuY29kZXIuYw0KPiBpbmRleCA1ZTZkZDE2NzA1ZTYuLjliNjViY2Vm
ZGI4NiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxf
ZHVfZW5jb2Rlci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJs
X2R1X2VuY29kZXIuYw0KPiBAQCAtNjcsNyArNjcsNyBAQCBpbnQgcnpnMmxfZHVfZW5jb2Rlcl9p
bml0KHN0cnVjdCByemcybF9kdV9kZXZpY2UgICpyY2R1LCAgew0KPiAgCXN0cnVjdCByemcybF9k
dV9lbmNvZGVyICpyZW5jOw0KPiAgCXN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3I7DQo+
IC0Jc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZTsNCj4gKwlzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJp
ZGdlIF9fZnJlZShkcm1fYnJpZGdlX3B1dCkgPSBOVUxMOw0KPiAgCWludCByZXQ7DQo+IA0KPiAg
CS8qDQo+IEBAIC04MywxMCArODMsMTYgQEAgaW50IHJ6ZzJsX2R1X2VuY29kZXJfaW5pdChzdHJ1
Y3QgcnpnMmxfZHVfZGV2aWNlICAqcmNkdSwNCj4gDQo+ICAJCWJyaWRnZSA9IGRldm1fZHJtX3Bh
bmVsX2JyaWRnZV9hZGRfdHlwZWQocmNkdS0+ZGV2LCBwYW5lbCwNCj4gIAkJCQkJCQkgRFJNX01P
REVfQ09OTkVDVE9SX0RQSSk7DQo+IC0JCWlmIChJU19FUlIoYnJpZGdlKSkNCj4gLQkJCXJldHVy
biBQVFJfRVJSKGJyaWRnZSk7DQo+ICsJCWlmIChJU19FUlIoYnJpZGdlKSkgew0KPiArCQkJLy8g
SW5oaWJpdCB0aGUgY2xlYW51cCBhY3Rpb24gb24gYW4gRVJSX1BUUg0KPiArCQkJcmV0ID0gUFRS
X0VSUihicmlkZ2UpOw0KPiArCQkJYnJpZGdlID0gTlVMTDsNCj4gKwkJCXJldHVybiByZXQ7DQo+
ICsJCX0NCj4gKw0KPiArCQlkcm1fYnJpZGdlX2dldChicmlkZ2UpOw0KPiAgCX0gZWxzZSB7DQo+
IC0JCWJyaWRnZSA9IG9mX2RybV9maW5kX2JyaWRnZShlbmNfbm9kZSk7DQo+ICsJCWJyaWRnZSA9
IG9mX2RybV9maW5kX2FuZF9nZXRfYnJpZGdlKGVuY19ub2RlKTsNCj4gIAkJaWYgKCFicmlkZ2Up
DQo+ICAJCQlyZXR1cm4gLUVQUk9CRV9ERUZFUjsNCj4gIAl9DQo+IA0KPiAtLQ0KPiAyLjUzLjAN
Cg0K

