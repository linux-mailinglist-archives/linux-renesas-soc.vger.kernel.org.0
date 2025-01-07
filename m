Return-Path: <linux-renesas-soc+bounces-11910-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AE5A03F73
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 13:38:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BCB51646CF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 12:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 220421DFE01;
	Tue,  7 Jan 2025 12:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ofqnAO7U"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010025.outbound.protection.outlook.com [52.101.228.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC63FC0E;
	Tue,  7 Jan 2025 12:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736253507; cv=fail; b=n3aQiN+UsA6Ji5nQzzcbIvOkhyqVBjdxvoXd/ce+bGE0MvolKxuNV52JfCYvLvwL92MducvOWTCWEwiStrruRnYKk5JJA/3ecRFmSk5s2XuJA35KyOMBNiNYAPrAPN5hl19kF4OZD0ZWZk6ITnc49UpEfXkD/eeOcZJaLCue22U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736253507; c=relaxed/simple;
	bh=uD3UYnFHp47F/z/3UTY5e1na/40MIigJ/e9Ph1gtnTw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VlKZ7BfacUloP26kK+Y97X+K5ZUhtRJmljYg6kX1UDtPSwjPjB2FyjZ9Ja9GddP3gI4lVx+U9VjbI3oSSU8/q8OI+jK3uzNRXB7sAy9aw7rpUUH57prVFs0gNgPV5Z8G/7dWy2PsrUR1SoCU2mFEvWkw1evY4NaD52h19Zs+6iE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ofqnAO7U; arc=fail smtp.client-ip=52.101.228.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tl1XAbsJo1RKj/0tO2WqE+z8J+cuawqaeFFFZWo69AAYyW1bA2MdJq1JoJy+AQk0DmYZHXKHcO7sMpN2rAWXDvGDsY52PH+oWaXIiKPwCglvPfWhY//7nnEQlbHAYg0SxufwrWa/Np3g03J2pD8lug2oh+OrJrWWKojYze2YGu1ptnO0hkSVTgyUh1DDiEOPEHT7FERwLwcHrGS5o+5PBVcioup9BPR2GwHf1wQggF9z8/YkJknov6p3Dg1KyRjAgL19PQeFhrJc1avt7/3uDRg8P/dDp0Izkq4IEd51E8D88IhQcCg++FkKsNS0WtSl9DlJ9hp7KpnllA6OEvAx2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uD3UYnFHp47F/z/3UTY5e1na/40MIigJ/e9Ph1gtnTw=;
 b=AJkRmA7+6+IrIcLli7wvzzo7Ud6dUKVe4Vjx2UhBL8DReFYrfk4q7e9AnodWpid76lqpUCsw6qsLHuNLoS4NPlAkmQQR81ZAiuOWTbpfwRhf1vIv4jbTQ1xmOzxlhjZXCFMiFIYi2ZwfSuUGq5mzCsO2mBgfGbgD3eX5EeDd/+8rviYGheBEwXuchBnHOCoa0co6RdRdO1/1hYxgDHrya26gp512aHNDbr67GMa1bu9uVjWhxNOdCOFO9dp5yAUwcDHygo+FFpIYlUSzkMRI5MYPIhOuCY2n1nKKdYmsR6gPE7Jlsz5BbGSj1FnG/wjGHqdps+jbp7VnYwE/CKI3eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uD3UYnFHp47F/z/3UTY5e1na/40MIigJ/e9Ph1gtnTw=;
 b=ofqnAO7UmGlLYtI0/qELkbyY2LL5ODblMc4Pyn5cLquVqPapWCIiwf77oyP7MdW3m65aDK7quOgO1XIwGmPjOCdMW3bppHU2LQSE8Y2IE2eyZKRWlGEq627gGb8jLUkfBiM65vbyuU9Osi4C28XRJEFs2pjhFMO1EzS4naGfghI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYAPR01MB6331.jpnprd01.prod.outlook.com (2603:1096:400:85::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Tue, 7 Jan
 2025 12:38:20 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8314.018; Tue, 7 Jan 2025
 12:38:20 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 4/6] clk: renesas: rzv2h: Switch MSTOP configuration to
 per-bit basis
Thread-Topic: [PATCH v3 4/6] clk: renesas: rzv2h: Switch MSTOP configuration
 to per-bit basis
Thread-Index: AQHbXULKeQyg6OXyX0+NSgiIE5q337MLMU7ggAAHlgCAAAnwoIAAAssAgAAA56A=
Date: Tue, 7 Jan 2025 12:38:20 +0000
Message-ID:
 <TY3PR01MB11346E9B6CD4CDB6EF93B99C986112@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250102181839.352599-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250102181839.352599-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346C123E18F61A009F6F0F586112@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8tO-d35+aPLYoCmC4xKW4cMoNyzM_Vmyw6CzOJjyjj=_g@mail.gmail.com>
 <TY3PR01MB11346C6E247A83F6835F0C7A686112@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8v3wdwEk9zu26MeQVmOnWKm=RdHJzdH6tLKrvRLeoQ2DA@mail.gmail.com>
In-Reply-To:
 <CA+V-a8v3wdwEk9zu26MeQVmOnWKm=RdHJzdH6tLKrvRLeoQ2DA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYAPR01MB6331:EE_
x-ms-office365-filtering-correlation-id: e060bdda-b042-4149-32f6-08dd2f182b50
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bm1wK0hHVVJZeGRJMlZkeCtpVVZvMzhmWVdreGJvampQZ1B0S1ZSVWp1a3E4?=
 =?utf-8?B?Vk1BbXBwenZ5a2hiN240U0hQMVllaTB2UHFaaWdwd3JtWTJreEJHbkprWTh6?=
 =?utf-8?B?Z05NN1RRaWNocUdGdDRsbThXN2FpRG04anlyZ0RrYTVGdk9DRjhMZlVmUFgw?=
 =?utf-8?B?ZmRKMmlLNDJPOVVSSUsrUUJwRFdRajlFcktSaG8yeTNKUmtvRHBrN0V0NnFm?=
 =?utf-8?B?Qld5RGxvY1VoSG4yTnBBUk1NRDZrV2lOOVVMMTlvMFpnL3ZkRmZnQS9kNFd3?=
 =?utf-8?B?Q1UwQk1iR0ljb0pSNGIvdi9MYVV3T0NTWWxGdVgzZ0NIdkJTM0U3Nndzc3Jl?=
 =?utf-8?B?Q054OEJwVDN3U0VwZlBVcG5vMFZCOHd6L3ZuWUVxbmdYQmRaNzhxODVSOTU5?=
 =?utf-8?B?a2VTRWxVdTF6QzFQRW9uaEhqdXU4eDlRNjdVYjYvalNPQWdiMHBhbnVuUU5N?=
 =?utf-8?B?OE9ZeXNBUDJGbkJLblZnUmR6Qit0bVFvc3B3SDlaODMrTFNhWVdob2I5dzVU?=
 =?utf-8?B?bVQyY09vREVONWxzV0QwdGFPQU8xTGIwODVEakZYUStXRy9DYTVuSk9pb2J4?=
 =?utf-8?B?RENkdHlVZ2FLWndOMjlqNDdnT1Q3NVljQ0Z5eWhkNmhKRDlDVElsUmIxNE0r?=
 =?utf-8?B?QTNXSk5KR3FTZFRkVTNJajE3cHFIUzEybXNPOXMvdnp6dVhGbXg3N2JNVTNv?=
 =?utf-8?B?NDRONXdldnpHbGxrWlBCUWsyc09nUitQV3ZJaVdHQXU0ZFhpaS9Va1U4ZWE2?=
 =?utf-8?B?N2R4RDVYbmY2SmZEenZ1TUMwdFFSc0pLODFMNGxHZTZXVm5sTXhLbktTaXli?=
 =?utf-8?B?bk0wWmw3aTdxdHQzMTVzaFhOQXRFSStjdmFSYVhSNGJtcVRVY3Y0WVUvTnM2?=
 =?utf-8?B?UlJGalo5bElVSFk3ZE1RNTN1NmJlRTNBRllybTVjM3pOMHN6WGlITW5BZlo0?=
 =?utf-8?B?aVA4Znd1RC9aMnoza0dRZ2d0bVBma2k4Y203dFkzekkxZ3VBNmMwK1VFcDVZ?=
 =?utf-8?B?S2tONUtiS1R5d0FlTy9qc1NGZitkblFaREt5cUJwU3p4cWE3eTBFVm4xam5R?=
 =?utf-8?B?VzdQV2RyVXRlNDlDdTZOeUp4bEUrRFJPcld0bFVTL0YxcWc0VWlxdC9UR3ln?=
 =?utf-8?B?U1hMQUFjK1J3UzFHYmxsM2lHNjBLUE4vdEJIQzhFdUhOdTgxRjJtWVk5emgz?=
 =?utf-8?B?S3B0dzRLUzVPM1RvenNHL3h2NzFWdjRKWk5nTW4vaUlTN25mK2pmUllTdEZS?=
 =?utf-8?B?VGVicXJRVXM0SkcrcFFxUUROVFBKYkkxVnhFMUNzMnYrUWZ0MlZoTTRyWC9U?=
 =?utf-8?B?NXVzYUU3RDd2MDNya3RnaXRJV0Vkc3AyMW02ZWd1STQvaVZ1RE95VmMxazMx?=
 =?utf-8?B?K3ZPNVFLQVF1YXdPVzVZcW1sR3FFQ241YTh1MXVKTFBCdjVocXo5Z3pZVTVu?=
 =?utf-8?B?aDJEOWdRUDR5WWpscnFWdXVMUm9MUlVMaE1TRE84aHc1bzVKWVI4dTBFenNK?=
 =?utf-8?B?blljUkFodTVvQUV3K0FqODB2QTRoSDhXaW1hNS81VzBuM21Pc1lpaTNKdHMy?=
 =?utf-8?B?VDMrR1NlV01NaC92N2syMXNHbjRRSDNTWG40ekFzMXhVZGxYYVNkWWRHWkFJ?=
 =?utf-8?B?N1lDVHJkbzlmcWZVSWxJT1IwZDl3V2doYVgxSmdxM2l3NVUvbXg4NlBiQ20v?=
 =?utf-8?B?VnRvK2tSOHVYUEhwZ2N3Y3IrYTNramlPSlFsV1gvUllLU1Y4MHMrdTlRdmZl?=
 =?utf-8?B?MFJlN1BibDMyYWFNRFpaOXZTdkY5dDZsRGhpZ0xQem9wU2srazFZMXQrY0Rn?=
 =?utf-8?B?dndYaXpXMEplblF4RzNmNXlWTE5weXJxUTJjcGNsSm9YcHdWejNrWFd4N01z?=
 =?utf-8?B?VTNMMTZXRHpMbDlGT3Y0amlWNk9ZOGtWK3JLMDRCdldkNmZuQmNLZUVCcEow?=
 =?utf-8?Q?KA+Kjr6NuzuQTJfaEM67NG3cOkPzk8cR?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z2QvQUROZVBCcXJBVVRJUFRtUTZBR0RtVUNkdlFCc0lHMHBwVzFiQURSNlRh?=
 =?utf-8?B?VEd2cGxLR1lNUEFQeWY4elFVVjFKL1RLeU0wenBpd0c1VmFsRzRpMGp2Ti9q?=
 =?utf-8?B?WG5SMnBoMzlrbjRSd2VKcE10OWh2dnhFbEQ5QnlhcStsbENQRkVlb2Q3TWUw?=
 =?utf-8?B?b0R6a29oTEp4M29lZVllVjNYaUsxMTZEK0VhN0kySzhRREt0QWJEbXVObUNO?=
 =?utf-8?B?RFF3cTNWOHRUUlZ0THpGc3ZydTlNS09GOXJaY09VRVg1TjRPQTg0ZjJISHFJ?=
 =?utf-8?B?Y1dtRmNQa3hrcFZxK2tKdnliRmVROU1QcDBVM0kzTVVSbGdVNzhDZ1BiZ0pT?=
 =?utf-8?B?WkFoQ29HdFhxWUlERmxJTUxGUW41RFZkN0lWMnJ4VUZqd2RPcTJNazZTTVVo?=
 =?utf-8?B?S3JDUzluZDJiUG1lc1h3YSszbzJaMGd1TWNFd2F2UC9WVnh0S3h0aHlnUnFr?=
 =?utf-8?B?ODNSNzNrWUJ3ZWpXNDd0MFBSSzh2WWtxT1lEN2x6SU9XbDQxN2RwMEpzN3NU?=
 =?utf-8?B?TGdTcnNoemlob3I4M08yNEQzMzNMZGszNHZMbWtGNnA5cE1QR3VYOXFmbzVm?=
 =?utf-8?B?dUZGY3dEWVI4L2tGN3RYNS9rRXVtcEszMUU5K0N5eEpXbTI2emVqTmd6V2pG?=
 =?utf-8?B?OUVrTWNnTjczS3Nhd1dmT1pqeEN5U2h2eUN4c01rUVRyTm84U1NyUDNBK0hC?=
 =?utf-8?B?OXlDQUxEZnhvVXNwUkZBLzBCQ0d1N3FJcHRwQVlnK29BdkRzcmVISm1CVGVz?=
 =?utf-8?B?MjdOQ2ZVNVVUNUsxS1JXWEdnSXkzZTFyUkRPRWJHZWlHbVg3RnZqZjNMYjlP?=
 =?utf-8?B?T1ZxTXNWamZTVjJ1WTFrcnRPc0wwdWlJSmM4LzJrYUc4VVcrdGgyaDh5aVMy?=
 =?utf-8?B?c3hreW5lOFkzVlFKNEhBM3p1akRhdEVkemdPZzRDTUorREFlVkRMVTFEYmgy?=
 =?utf-8?B?ODVZOEYzb3ViZC9kU3k4bmxPNGJVaEFiVjhkdG5yQUhXbmxNd3AyNU0yeG1X?=
 =?utf-8?B?WUpqN2hkWmVZSzNkY2d6b2grdFpURGtoK1J5ZW00amZBTVNsbnpRZjJrb2JP?=
 =?utf-8?B?eElFTHcwRldKZWdza0c5VW9iYjF3M0J4SU9qYzF6UEVlT0RzTHVwbzhWbWFa?=
 =?utf-8?B?TnRrdDJwM2JoUU9yTXhNSnAxZm00U21rbDZSaFB3Z3JaWWZ1aEVHUk1mRC9m?=
 =?utf-8?B?VWFQWE1MRWhYTDVEbVM3VW9mc2ZnVHpqMkNVRFR5NW9BODlwNFcwT1NVd3pM?=
 =?utf-8?B?c1RPMTMzeDhvMnFOc0NUeExmZngxV2QraDk2VnFtVUVhR1NsVFZINjQwYjl1?=
 =?utf-8?B?N1c3UTh5aVVPZS9HeVBqN2xHc0NCd0NSYUEwZE1zcnFBVXlSV3NrdDFFVWNZ?=
 =?utf-8?B?bVEzVzFyald4SVY0dzlXM2RpclptbkVvUlVQcEN5S25VcVlQQjhoZ1g5Slpx?=
 =?utf-8?B?NHZET3FJS2htNDlmQ1MyMVQzRzVOT2xITzNOQzFoRlhrbXBua3FmRG8xckR5?=
 =?utf-8?B?VFFjODVBTW4xdDZycnNpMVQ0OUN3SmlCZURJWU9lMGZjVUI0Tmthd1hPVHg4?=
 =?utf-8?B?UTlkQVlscm1pQXgwN2d6NmFzVnE5dzk5cjUxZ0w3MUQzM1M5SnVabTVmbS9K?=
 =?utf-8?B?QXdtejN1ZlMrbXM4ZE9zUkhpRmgzNHpIbVJQZW9nU1FIYlpWZ1RNU3JGWFJp?=
 =?utf-8?B?Vm9uVlhObVI3aEVJTHRDY3U5VitRMEpFYnN2MnpMOFdGQ29HbmduRVY1a3lU?=
 =?utf-8?B?Z25nektCa1JDWTBhaFBieThjcU5mZjg3bGZoS0lEb3JmSW9BUDZFaUt3Z0xG?=
 =?utf-8?B?RVZhUXpzWFludU8vdlMwUlpGZS9EYzJYUExFVGYza25RMTdVT3RjMEhQa3d4?=
 =?utf-8?B?LzZpbEpWUjFCRDFmT0lMcW9MbWhNL2hEM0pLSUNBVEt3SWs2TDh5TGw3RG54?=
 =?utf-8?B?Z05Za3ViZnV0UTQ5NEhYV3J6TmVFM2F0RDdGbFpTN1hISjRsa1A3MGJwTkc0?=
 =?utf-8?B?aTBZQmpONXBsYnZSWmZOUVNSdWU1MTNjcTlSaFZ2WWpNbFVmRDluNTg5R0xh?=
 =?utf-8?B?c29mTVBrRVkrQ3pJc1h5TFVZMUl4UDRmdThZakR0RzVZQ2tvR2loWUt2cnhI?=
 =?utf-8?B?Sng2VGVxMTFpNUQxQStoWG45bWNVNis0cGQrMWtRSmJXUVFIYjl6eDZIVFJH?=
 =?utf-8?B?OEE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e060bdda-b042-4149-32f6-08dd2f182b50
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2025 12:38:20.8656
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5MpP6uVtnFzdPQ1tBA3Q5hY84Ok0IjqNy0RP33fyYPvJOF+SPCx+xj/7qwavLwZAJrxA+OcauyJifEdjhdgU0J8Tb8pEqq9LnBv3Wnd9bpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6331

SGkgUHJhYmhha2FyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExh
ZCwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4gU2VudDogMDcgSmFu
dWFyeSAyMDI1IDEyOjMxDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgNC82XSBjbGs6IHJlbmVz
YXM6IHJ6djJoOiBTd2l0Y2ggTVNUT1AgY29uZmlndXJhdGlvbiB0byBwZXItYml0IGJhc2lzDQo+
IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVHVlLCBKYW4gNywgMjAyNSBhdCAxMjoyNeKAr1BNIEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBIaSBQ
cmFiaGFrYXIsDQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBG
cm9tOiBMYWQsIFByYWJoYWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+DQo+ID4gPiBT
ZW50OiAwNyBKYW51YXJ5IDIwMjUgMTE6NDYNCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMg
NC82XSBjbGs6IHJlbmVzYXM6IHJ6djJoOiBTd2l0Y2ggTVNUT1ANCj4gPiA+IGNvbmZpZ3VyYXRp
b24gdG8gcGVyLWJpdCBiYXNpcw0KPiA+ID4NCj4gPiA+IEhpIEJpanUsDQo+ID4gPg0KPiA+ID4g
T24gVHVlLCBKYW4gNywgMjAyNSBhdCAxMToyNOKAr0FNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBi
cC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+IEhpIFByYWJoYWthciwNCj4g
PiA+ID4NCj4gPiA+ID4gVGhhbmtzIGZvciB0aGUgcGF0Y2guDQo+ID4gPiA+DQo+ID4gPiA+ID4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+ID4gPiBGcm9tOiBQcmFiaGFrYXIgPHBy
YWJoYWthci5jc2VuZ2dAZ21haWwuY29tPg0KPiA+ID4gPiA+IFNlbnQ6IDAyIEphbnVhcnkgMjAy
NSAxODoxOQ0KPiA+ID4gPiA+IFN1YmplY3Q6IFtQQVRDSCB2MyA0LzZdIGNsazogcmVuZXNhczog
cnp2Mmg6IFN3aXRjaCBNU1RPUA0KPiA+ID4gPiA+IGNvbmZpZ3VyYXRpb24gdG8gcGVyLWJpdCBi
YXNpcw0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gRnJvbTogTGFkIFByYWJoYWthciA8cHJhYmhha2Fy
Lm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gU3dp
dGNoIE1TVE9QIGhhbmRsaW5nIGZyb20gZ3JvdXAtYmFzZWQgdG8gcGVyLWJpdCBjb25maWd1cmF0
aW9uDQo+ID4gPiA+ID4gdG8gYWRkcmVzcyBpc3N1ZXMgd2l0aCBzaGFyZWQgZGVwZW5kZW5jaWVz
IGJldHdlZW4gbW9kdWxlDQo+ID4gPiA+ID4gY2xvY2tzLiBJbiB0aGUgY3VycmVudCBncm91cC1i
YXNlZCBjb25maWd1cmF0aW9uLCBtdWx0aXBsZQ0KPiA+ID4gPiA+IG1vZHVsZSBjbG9ja3MgbWF5
IHJlbHkgb24gYSBzaW5nbGUgTVNUT1AgYml0LiBXaGVuIGJvdGggY2xvY2tzDQo+ID4gPiA+ID4g
YXJlIHR1cm5lZCBPTiBhbmQgb25lIGlzIHN1YnNlcXVlbnRseSB0dXJuZWQgT0ZGLCB0aGUgc2hh
cmVkDQo+ID4gPiA+ID4gTVNUT1AgYml0IHdpbGwgc3RpbGwgYmUgc2V0LCB3aGljaCBpcyBpbmNv
cnJlY3Qgc2luY2UgdGhlDQo+ID4gPiBvdGhlciBkZXBlbmRlbnQgbW9kdWxlIGNsb2NrIHJlbWFp
bnMgT04uDQo+ID4gPiA+DQo+ID4gPiA+IEkgZ3Vlc3MgdGhpcyBzdGF0ZW1lbnQgaXMgaW5jb3Jy
ZWN0LiBTdGlsbCBpbiBncm91cC1iYXNlZCwgbXN0b3ANCj4gPiA+ID4gYml0IGlzIGNvbnRyb2xs
ZWQgYnkgdXNhZ2UNCj4gPiA+IGNvdW50KHJlZl9jbnQpLg0KPiA+ID4gPg0KPiA+ID4gSXQgaXMg
dmFsaWQsIGNvbnNpZGVyIGFuIGV4YW1wbGUgc2F5IElQLUEgcmV1aXFyZXMgTVNUT1AgYml0cyA4
IHwgOQ0KPiA+ID4gfA0KPiA+ID4gMTAgYW5kIGNvbnNpZGVyIElQLUIgcmVxdWlyZXMgTVNUT1Ag
Yml0cyAxMCB8IDExIHwgMTIgKG9mIHRoZSBzYW1lDQo+ID4gPiBNU1RPUCByZWdpc3RlciBzYXkg
TVNUT1AxKS4gTm93IHRoaXMgd2lsbCBiZSBzZXBlcmF0ZSBncm91cHMgaGF2aW5nDQo+ID4gPiBz
ZXBhcmF0ZSBjb3VudChyZWZfY250KS4gU2F5IHlvdSB0dXJuIE9OIElQLUEgbW9kdWxlIGNsb2Nr
IGFuZA0KPiA+ID4gY29ycmVzcG9uZGluZ2x5IGNsZWFyIHRoZSBNU1RPUCBiaXRzIGFuZCBzaW1p
bGFybHkgbm93IGxldHMgdHVybiBPTg0KPiA+ID4gbW9kdWxlIGNsb2NrcyBmb3IgSVAtQiBhbmQg
Y2xlYXIgdGhlIE1TVE9QIGJpdHMuIE5vdyBsZXQncyBzYXkgeW91DQo+ID4gPiB3YW50IHRvIHR1
cm4gT0ZGIElQLUEgc28geW91IHR1cm4gT0ZGIG1vZHVsZSBjbG9jayBhbmQgc2V0IHRoZSBNU1RP
UCBiaXRzIDggfCA5IHwgMTAuIEluIHRoaXMgY2FzZQ0KPiB5b3Ugd2lsbCBub3cgc2VlIGlzc3Vl
cyB3aXRoIElQLUIgYXMgTVNUT1AgQklUKDEwKSBoYXMgYmVlbiBzZXQgd2hlbiB3ZSB0dXJuZWQg
T0ZGIElQLUEgYmxvY2suICBUaGlzDQo+IGNhc2UgaXMgaGFuZGxlZCBieSBzd2l0Y2hpbmcgcmVm
Y291bnQgb24gcGVyIG1zdG9wIGJpdCBieSB0aGlzIHBhdGNoLg0KPiA+DQo+ID4gSSBhZ3JlZSwg
RG8gd2UgaGF2ZSBzdWNoIHVzZSBjYXNlPw0KPiA+DQo+IFllcywgZm9yIFVTQjIuMCBvbiBSWi9W
MkguDQoNCk9LLCB0aGVuIGl0IG1ha2Ugc2Vuc2UgZm9yIHBlci1iaXQgY29uZmlndXJhdGlvbi4N
Cg0KPiANCj4gPiBDb25zaWRlciBhbm90aGVyIHVzZSBjYXNlLCBpbmRleCAwLCBiaXQgOHwgaW5k
ZXggMCwgYml0OXwgaW5kZXgwLCBiaXQxMCBhbmQgaW5kZXggMCwgYml0OCB8IGluZGV4MSwNCj4g
Yml0IDAgfCBpbmRleDEgMTAgaXMgYWRkcmVzc2VkIGluIGN1cnJlbnQgcGF0Y2ggc2VyaWVzPw0K
PiA+DQo+IENhbiB5b3UgcGxlYXNlIGVsYWJvcmF0ZSwgdGhlIGFib3ZlIGlzbid0IGNsZWFyIHRv
IG1lLg0KDQoNCkkganVzdCBwcm92aWRlIGEgcmFuZG9tIGV4YW1wbGUgZm9yIGEgZnV0dXJlIElQ
LCB3aGVyZQ0KDQpJUF9BIHJlcXVpcmVzIG1zdG9wMSB7OCw5LDEwfQ0KQW5kDQpJUF9CIHJlcXVp
cmVzIG1zdG9wMSB7OH0gYW5kIG1zdG9wMiB7OSwgMTB9DQoNCk5vdGU6IEkgaGF2ZW4ndCBzZWVu
IHRoaXMgc2NlbmFyaW8gaW4gaGFyZHdhcmUgbWFudWFsLg0KDQoNCkNoZWVycywNCkJpanUNCg0K
DQo=

