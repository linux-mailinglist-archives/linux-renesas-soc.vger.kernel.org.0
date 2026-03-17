Return-Path: <linux-renesas-soc+bounces-29633-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HIXD9WMuWnkJwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29633-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 18:18:13 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D78E62AF481
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 18:18:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CDAEE304CA56
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 17:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6FE3F54A5;
	Tue, 17 Mar 2026 17:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="XgtjSRNX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011062.outbound.protection.outlook.com [52.101.125.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00892116F6;
	Tue, 17 Mar 2026 17:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773767652; cv=fail; b=K7RWR+2i+0lsdfjsu6/6WQloeoZxYXna8KmH+rDvzA91YuKB+xBFz91SwsyCJr+67cueSO+hDs4BUVysMlzzXwqIxpAzbl7WbwrowV9tmDmUL0EIbTfWc/wGyzoQvvHXOqK063PtEa02PnHcPjorj1VD6jhlofeuPlZuabxC4Ag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773767652; c=relaxed/simple;
	bh=sWFeDk5CauOcEu4kwf8ffJfZH3MVxfchRhnf5Nq00Zw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rXPJXG5RvJlfrf+rIftVpaTmCZXYLRB1AEVjyG24XXzIEJ+mnX2KpHacZHLrrLKefroL+U1zIU44Uepz/xzQmNliOnWcHQkka05vMsNGCcoyGa18o2N2apfL010TZSpeNaRIn9T51fglUUahc30uSkE3v+KiHP58++/LH7GOvcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=XgtjSRNX; arc=fail smtp.client-ip=52.101.125.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LfShkKMEGhjb2CjnZ18xVBl1vdKhtVR5mCuKcf89qejUTh34GVaghm0TAJWArUIbD8EBkN95J5bz1bfEXmC+OHJrjeK6ANT5tsHdmirN/QxrUWZLAb1IMsH6bDsAlV5ZCQdWbIfeXw2GHQ5KrQ8ct0fe6NVaj7P/XF4sjsFY5VEwbmcCq8FqWO1mIWW8kUT+vVEm4/+Fc4Nh9FtGwSzrWibWZ4IQuK7LgTp6amPC8vgwS0dMzyyAPPJva5ugO5qToJGn1vFn5T7UCHNDedZ3F7yvzEyS36M9zV0OkkHPxXV1PvEuWH2gKadydIt4sKRX/3Mci8OsBegIZ3VAjP7XFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sWFeDk5CauOcEu4kwf8ffJfZH3MVxfchRhnf5Nq00Zw=;
 b=uSNpYSfPeaoZ17L/MR/ypcy67SOXgzvPEFHk0fWRvSZawrErscsh+nyoYN+wCMeaZ21ah0poDXvgDJes8SumQdDNMVa6uyt5C3s3F2Pp1+aq8bFk+mNURUIzHBGYa21N/uECiwFTu8+ryOWJ8+ZftqANTWbKM9JqJ5mF57KBOiUhw4q0Ll6OA1DznTyGIp/u9pvNbwpuMey30FkSlpeFQSi8wi4N40qwgzdY7qWTA0sScd+fD5dGX9Lm3dJ8AEvu8PmbRnmewbfy/AMWf0bkHm9ykLPVG0iX7Rf12+a5L5PH76fKH8wBAmfDPNLXVkIsi6L6I7BUFm8tnK0mQ7TncA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWFeDk5CauOcEu4kwf8ffJfZH3MVxfchRhnf5Nq00Zw=;
 b=XgtjSRNXZz4wdt2eBDZDW23MCk8ITQFJAhpDstNpH+CJaL+1O6ySkcezKAFZhssp9t+fGQopQcU68v3sMcn+m3Lm8GpZQCyO/1/xvWCoEshMejsW8YSmCzMHZ/CFPArwnEY5pgZSJeMeYdMjQ5pO2bcEoTo745njy1Gfi+vGjJE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB9883.jpnprd01.prod.outlook.com (2603:1096:604:1ef::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Tue, 17 Mar
 2026 17:14:07 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 17:14:06 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Tommaso Merciai
	<tomm.merciai@gmail.com>, geert <geert@linux-m68k.org>, laurent.pinchart
	<laurent.pinchart@ideasonboard.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH v5 09/20] dt-bindings: display: renesas,rzg2l-du: Add
 support for RZ/G3E SoC
Thread-Topic: [PATCH v5 09/20] dt-bindings: display: renesas,rzg2l-du: Add
 support for RZ/G3E SoC
Thread-Index: AQHcnQXxMzM3EUraMkKoWbnYkqyBArWzJ9afgAAAQSA=
Date: Tue, 17 Mar 2026 17:14:06 +0000
Message-ID:
 <TY3PR01MB113464E571376C7B67CB52AF68641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
 <ca022fdbba5236c36e0cb3095db4c31e8e0cb1b8.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
 <TY3PR01MB113460BED5F6F944C0FD4DDB8866FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <474c1eff-96ea-41b8-81fe-970caf796e6e@bp.renesas.com>
In-Reply-To: <474c1eff-96ea-41b8-81fe-970caf796e6e@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB9883:EE_
x-ms-office365-filtering-correlation-id: 4b37a4ff-3a0c-4852-976a-08de844898c4
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 rVH1iVPLRUpFcmqSqEpF0gjdlLRjA9femrRUY8INS91zgqpNbB9Ky5WvvIZ+Rfkg4gAnMaLyC0YlRpBuMxYnd9WDAF+ZvY/aFvwXkPZXam7lenTvjjfHCr1UcQZ8rGKlVDECATxTbr2pQTDAGxQknYqVcIkqxFMtCo1l1fIElOWYj5NaFfT7lQFCCTfM4iBVItCKI5TYAgGmz9390MNkzlwmPCMPolTnBhwRYEQ8hgBdz/lQjMpCAS/Qvu7QsN+K4emJxpG1vEjxclK1sR88wK0yZJaGkxnl3Vq6D/AgaehCMI4oWkwBs4zjVTXAl/uVOzLyMCDXw6px8yaYIObVv+REV6fjj4BBN/cHeBbsJRfo87t3AHWuDSPrHaFEkcCVkdF6hkMj/DI0bYIZto11WEA6fHBup0bjlvfco/KLZCwy7GOMsdc7zSLrCou3JoW0h4yrCAXjud4yKIQVGVvCLc3Hnp8+x0T2O2TpjBMOa/1YRKtEXfxZfkxZ9Z0dyt4WQ49DU1auNwA5cEFVA3DTfFJoTm7xhkZrp2t7e3WmblpK6NAgoqclMFO+LurLkN9FwaaDOrpf35YhGVDkBacLgQSC+iLnW04d2uZLpO/OgG+zv6JE+XHTSzYhQhlvLGEIIDKbkMZll//ijVT1FP84ulkBsUAu/FW0FM3xoguyeEzheJrb9EYjLfQtl9ERQCBJKqNfxh6hT9BLP5Hg8Ma/mdLJjbD+HVJ/I4Ckc4eRSPN5NrvRDnUqn8fYFLI8d+QdmZefdy2BgbRrsE4sG9JhVg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dHRUWXZqTzBVZU9NY2FweXh6U2FJR1lTTjFUZjdPTmh1S3JKUkRkQzVXQlA1?=
 =?utf-8?B?aUhqQXlzaFdvZVZ3ZWUxWU5aVlBsQk1ySjlTblNMTWlxWGhyTnExOFRYNkdZ?=
 =?utf-8?B?MkVOSDJhQTh1WUJNTDBTaTFjOG5QL1ZVdXpJNEw1M3A0ZjBpOXVuSjZrc3pp?=
 =?utf-8?B?bFZSZnFYeEpYUmFIQWwrS29Oak5EbWhGelI4bWlEeFBMWUZaL3diNDdFWUtO?=
 =?utf-8?B?MUFxTDhVNnE1aHR3NnlQbDc5bGlzWWZFUGpXWldvMlpZb0lqR3ZqRW5JM2tV?=
 =?utf-8?B?UEFqTFZxZ2dnNHhvOUpyL043ODZYNkVnQ1JmU1NDRGovdktNZU1DNmN4NmpL?=
 =?utf-8?B?MWtjakYxbllMRytNMUtKNENMQjl0Z2NvblNqcXYwS3ZSV3MzTnl0VEl4MWJr?=
 =?utf-8?B?RE1TRjhqdC9ZNTBIWGw2aHp6ZUxIZDgxQ2lSeVpqOUZ2djkxWkdCVnFxR0VP?=
 =?utf-8?B?WnpmUGZ0dnp1KzJSdk9uUnVIUTlEVlhlOFloNjVBWEpyVVBWc3laWlFhbk91?=
 =?utf-8?B?alduNUYvbVVSMjI2NFhva0JTUElLczFsdTNPa21DVFNVODV2dEFRKzg2b1Fy?=
 =?utf-8?B?VEJNY1VqbEhubUEvcDd5blUwRldCMHZxemEreGUyNXpTMGE0YTJnbkV3d2ZD?=
 =?utf-8?B?NTcwQndrb1E5dDlOaTVpY0pFVnpyRFhvOTUvVWxDdXRlWkxwZnRsQ2NLTzhr?=
 =?utf-8?B?MlV3TCt3d1ZMZ3lrWjR5b2pLOUovSDhRMVFpYWNOaXJNKzJyeWVGUlgwb0pB?=
 =?utf-8?B?UzZvM0ZXa2JUZmxydHJka05aVE5PVTR6UnZVMExKemJPeFJ1aUs3WnVic3Z2?=
 =?utf-8?B?RDcrL2xCdDB1eTJsQ3JjTWRQS1FiL1FxckVxcVJwT2tiNmliM1U5dXBTRkVt?=
 =?utf-8?B?cUcvN3RFcjlSNHo2dUVSZ0lzcnA5encxcU00ZVJ2Z1B4RFlMSVljYWZKUi95?=
 =?utf-8?B?VnJHRnIwREszTXFWMllSSUtsc1R0Sk5FWUpYTzhyd01rQ3VZMkc4cGJBMDJB?=
 =?utf-8?B?VG5BWWVMK1QxZTh4aE9GTEhlZVhhcjcyOU5jSVJhT3g5TUFqNndJWHBxSVdk?=
 =?utf-8?B?RXJyZHF5TjZ0dVlObUJYelg4VnBra3NHRGZ2NG5rc0pORTk0QTlLMEZjRFpO?=
 =?utf-8?B?WUZpVFMvSk1qdDNmV0NWOWFEd0EySXVMaUtVaW9MTFJ5NmxJL3FWNUNMaHFv?=
 =?utf-8?B?NWNKaFNpTmFjS3dDcCs4aWJvQWpsRE5nYmhvSjFVbzkxbGVKVy80N1BZbkFk?=
 =?utf-8?B?cWZCRnVsMXViWnd4TmRwUGk5eDN5TkZXUzhnL3dwYm5uY0JFUnM3Tm1PRWdy?=
 =?utf-8?B?M0lKa1IrUStEZmM4dkFselJGN1pOaFQyNFhCcG9DdUhYaUpTay9oenVXUUkz?=
 =?utf-8?B?eTJma0s0ckgzUFBmd0h0Uno2YS9WVm9MYm14KzFIdUoxYklwcStJZXVsZFJt?=
 =?utf-8?B?TUprQUhxY1NFNHdmdDU5ckJkMDhqeU1Tc01BYmF3am5lb2NmZVk0UU9vbWRh?=
 =?utf-8?B?VFlWRXluNDNRdXVsUHdqSmIwcEppR0pUMng3VVZXZmRGM1N5bHdBWVlGaHNl?=
 =?utf-8?B?bGl2R05TeGNBb3pDYXV5dVpiTWNRL1BrbGdZeTQ2cnZES1llZW1JSCtsa0ph?=
 =?utf-8?B?TFpGZ2VnVVpNUDJGTituRjVvR2EyUVR4Vi91TEJ6clcvTE1sdWY5cnFRMHVZ?=
 =?utf-8?B?Vm9ZVmhTVldwcVdDdUE2UGI4ZmJDK2ZCT0QwZW1xbHNIMmNlaS9MbXlxeS9G?=
 =?utf-8?B?NUhLcm1IaEpUc0RzS2dodVZGSUtLaEtiZzZqVWQyckxZWTZFUmhUU04yZGdr?=
 =?utf-8?B?YlB3RVFEWEhOeDdDT3Z0OURqRlZGcC9SbzM4MXJYWjV6T25sN200Zm4xVSs4?=
 =?utf-8?B?SkhtZG9ISnl2VXltVmFSekRkTmN5STBlU3JISlRwcHRQdXExNHZxU1NMVU9X?=
 =?utf-8?B?dkFzOU02V3hqMk8yYmFtQjViRFhJdkUySVM5bjB5Y3I4WnZLMnV3M0dlY3RF?=
 =?utf-8?B?WWFVa0YrUkxGUFpLV2FUUzN1Qk9rVWU3WFo3MGtYSnFOM2dnQWxZSHByWnVT?=
 =?utf-8?B?biswREhNcG1VeGRVeDBwL2tKOHBSYml5bmE4NVRsZTZuV25aQ0pXWnYzUU9H?=
 =?utf-8?B?b3BOQWhRK2FzSE1NbFFVZ0U0SXNOSG9ZUWRLS240TmR1clJYaHdBcE1PQVli?=
 =?utf-8?B?ZDRYcVQ5NUpXR3RFRzlWTW9LdlBZTTBmMXF1Q2QrVTk1ZGVlRTFIcnJlUkVC?=
 =?utf-8?B?OCtNMnlEWFMwMnE3OUl5a1RMcnNjTGpEYzh1dVdWZFlqYlJNcFVFQk55QVo0?=
 =?utf-8?B?cEhFY0RnS2VwK3hDMFl1c3RkaWtLelcwYWZzcFVmWnlTcForRFhRdz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b37a4ff-3a0c-4852-976a-08de844898c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 17:14:06.8485
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U0DYf44sO7M8HCvu9bu2VfLGvaceRoJbbAsl4qoPkESPCeVMx4sc4ZGC6LXYFXrtu0PLG7Ep+KhhwFfutTpgBNkDQ4HNCsg+OiVygK9oK4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9883
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-29633-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,gmail.com,linux-m68k.org,ideasonboard.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,0.0.0.0:email,renesas.com:email,0.0.0.2:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.3:email,0.0.0.1:email,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: D78E62AF481
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgVG9tbWFzbyBNZXJjaSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBUb21tYXNvIE1lcmNpYWkgPHRvbW1hc28ubWVyY2lhaS54ckBicC5yZW5lc2FzLmNvbT4NCj4g
U2VudDogMTcgTWFyY2ggMjAyNiAxNzoxMA0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDA5LzIw
XSBkdC1iaW5kaW5nczogZGlzcGxheTogcmVuZXNhcyxyemcybC1kdTogQWRkIHN1cHBvcnQgZm9y
IFJaL0czRSBTb0MNCj4gDQo+IEhpIEJpanUsDQo+IFRoYW5rcyBmb3IgeW91ciByZXZpZXcuDQo+
IA0KPiBPbiAyLzE1LzI2IDA5OjExLCBCaWp1IERhcyB3cm90ZToNCj4gPiBIaSBUb21tYXNvLA0K
PiA+DQo+ID4gVGhhbmtzIGZvciB0aGUgcGF0Y2guDQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogVG9tbWFzbyBNZXJjaWFpIDx0b21tYXNvLm1lcmNpYWku
eHJAYnAucmVuZXNhcy5jb20+DQo+ID4+IFNlbnQ6IDEzIEZlYnJ1YXJ5IDIwMjYgMTY6MjgNCj4g
Pj4gU3ViamVjdDogW1BBVENIIHY1IDA5LzIwXSBkdC1iaW5kaW5nczogZGlzcGxheTogcmVuZXNh
cyxyemcybC1kdTogQWRkDQo+ID4+IHN1cHBvcnQgZm9yIFJaL0czRSBTb0MNCj4gPj4NCj4gPj4g
VGhlIFJaL0czRSBTb2MgaGFzIDIgTENEIGNvbnRyb2xsZXIgKExDREMpLCBjb250YWluIGEgRnJh
bWUNCj4gPj4gQ29tcHJlc3Npb24gUHJvY2Vzc29yIChGQ1BWRCksIGEgVmlkZW8gU2lnbmFsIFBy
b2Nlc3NvciAoVlNQRCksIFZpZGVvIFNpZ25hbCBQcm9jZXNzb3IgKFZTUEQpLCBhbmQNCj4gRGlz
cGxheSBVbml0IChEVSkuDQo+ID4+DQo+ID4+ICAgLSBMQ0RDMCBzdXBwb3J0cyBEU0kgYW5kIExW
RFMgKHNpbmdsZSBvciBkdWFsLWNoYW5uZWwpIG91dHB1dHMuDQo+ID4+ICAgLSBMQ0RDMSBzdXBw
b3J0cyBEU0ksIExWRFMgKHNpbmdsZS1jaGFubmVsKSwgYW5kIFJHQiBvdXRwdXRzLg0KPiA+Pg0K
PiA+PiBBZGQgbmV3IFNvQy1zcGVjaWZpYyBjb21wYXRpYmxlIHN0cmluZyAncmVuZXNhcyxyOWEw
OWcwNDctZHUnLg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBUb21tYXNvIE1lcmNpYWkgPHRv
bW1hc28ubWVyY2lhaS54ckBicC5yZW5lc2FzLmNvbT4NCj4gPj4gLS0tDQo+ID4+IHY0LT52NToN
Cj4gPj4gICAtIERyb3BwZWQgcmVuZXNhcyxpZCBwcm9wZXJ0eSBhbmQgdXBkYXRlZCBiaW5kaW5n
cw0KPiA+PiAgICAgYWNjb3JkaW5nbHkuDQo+ID4+DQo+ID4+IHYyLT52MzoNCj4gPj4gICAtIE5v
IGNoYW5nZXMuDQo+ID4+DQo+ID4+IHYyLT52MzoNCj4gPj4gICAtIE5vIGNoYW5nZXMuDQo+ID4+
DQo+ID4+IHYxLT52MjoNCj4gPj4gICAtIFVzZSBzaW5nbGUgY29tcGF0aWJsZSBzdHJpbmcgaW5z
dGVhZCBvZiBtdWx0aXBsZSBjb21wYXRpYmxlIHN0cmluZ3MNCj4gPj4gICAgIGZvciB0aGUgdHdv
IERVIGluc3RhbmNlcywgbGV2ZXJhZ2luZyBhICdyZW5lc2FzLGlkJyBwcm9wZXJ0eSB0bw0KPiA+
PiAgICAgZGlmZmVyZW50aWF0ZSBiZXR3ZWVuIERVMCBhbmQgRFUxLg0KPiA+PiAgIC0gVXBkYXRl
ZCBjb21taXQgbWVzc2FnZSBhY2NvcmRpbmdseS4NCj4gPj4NCj4gPj4gICAuLi4vYmluZGluZ3Mv
ZGlzcGxheS9yZW5lc2FzLHJ6ZzJsLWR1LnlhbWwgICAgfCAyMiArKysrKysrKysrKysrKysrKysr
DQo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykNCj4gPj4NCj4gPj4gZGlm
ZiAtLWdpdA0KPiA+PiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L3JlbmVzYXMscnpnMmwtZHUueWFtbA0KPiA+PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMscnpnMmwtZHUueWFtbA0KPiA+PiBpbmRleCAyY2M2NmRj
ZWY4NzAuLmJlNTBiMTUzZDY1MSAxMDA2NDQNCj4gPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxyemcybC1kdS55YW1sDQo+ID4+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMscnpnMmwt
ZHUueWFtbA0KPiA+PiBAQCAtMjAsNiArMjAsNyBAQCBwcm9wZXJ0aWVzOg0KPiA+PiAgICAgICAg
IC0gZW51bToNCj4gPj4gICAgICAgICAgICAgLSByZW5lc2FzLHI5YTA3ZzA0M3UtZHUgIyBSWi9H
MlVMDQo+ID4+ICAgICAgICAgICAgIC0gcmVuZXNhcyxyOWEwN2cwNDQtZHUgIyBSWi9HMntMLExD
fQ0KPiA+PiArICAgICAgICAgIC0gcmVuZXNhcyxyOWEwOWcwNDctZHUgIyBSWi9HM0UNCj4gPj4g
ICAgICAgICAgICAgLSByZW5lc2FzLHI5YTA5ZzA1Ny1kdSAjIFJaL1YySChQKQ0KPiA+PiAgICAg
ICAgIC0gaXRlbXM6DQo+ID4+ICAgICAgICAgICAgIC0gZW51bToNCj4gPj4gQEAgLTEzNyw2ICsx
MzgsMjcgQEAgYWxsT2Y6DQo+ID4+DQo+ID4+ICAgICAgICAgICAgIHJlcXVpcmVkOg0KPiA+PiAg
ICAgICAgICAgICAgIC0gcG9ydEAwDQo+ID4+ICsgIC0gaWY6DQo+ID4+ICsgICAgICBwcm9wZXJ0
aWVzOg0KPiA+PiArICAgICAgICBjb21wYXRpYmxlOg0KPiA+PiArICAgICAgICAgIGNvbnRhaW5z
Og0KPiA+PiArICAgICAgICAgICAgY29uc3Q6IHJlbmVzYXMscjlhMDlnMDQ3LWR1DQo+ID4+ICsg
ICAgdGhlbjoNCj4gPj4gKyAgICAgIHByb3BlcnRpZXM6DQo+ID4+ICsgICAgICAgIHBvcnRzOg0K
PiA+PiArICAgICAgICAgIHByb3BlcnRpZXM6DQo+ID4+ICsgICAgICAgICAgICBwb3J0QDA6DQo+
ID4+ICsgICAgICAgICAgICAgIGRlc2NyaXB0aW9uOiBEU0kNCj4gPj4gKyAgICAgICAgICAgIHBv
cnRAMToNCj4gPj4gKyAgICAgICAgICAgICAgZGVzY3JpcHRpb246IExWRFMgQ2hhbm5lbCAwDQo+
ID4+ICsgICAgICAgICAgICBwb3J0QDI6DQo+ID4+ICsgICAgICAgICAgICAgIGRlc2NyaXB0aW9u
OiBMVkRTIENoYW5uZWwgMQ0KPiA+PiArICAgICAgICAgICAgcG9ydEAzOg0KPiA+PiArICAgICAg
ICAgICAgICBkZXNjcmlwdGlvbjogRFBBRA0KPiA+PiArDQo+ID4+ICsgICAgICAgICAgcmVxdWly
ZWQ6DQo+ID4+ICsgICAgICAgICAgICAtIHBvcnRAMA0KPiA+PiArICAgICAgICAgICAgLSBwb3J0
QDENCj4gPg0KPiA+DQo+ID4gTENEQzAgaGFzIHBvcnRAMCwgcG9ydEAxIGFuZCBwb3J0QDINCj4g
PiBMQ0RDMSBoYXMgcG9ydEAwLCBwb3J0QDEgYW5kIHBvcnRAMw0KPiA+DQo+ID4gTG9va3MgbGlr
ZSBmcm9tIHRoZSBhYm92ZSBwb3J0QDIgYW5kIHBvcnRAMyBhcmUgb3B0aW9uYWw/Pw0KPiANCj4g
QXMgd2UgYXJlIHVzaW5nIHRoZSB0aGUgc2FtZSBjb21wYXRpYmxlIGZvciBib3RoIERVcyB0aGUg
b25seSB3YXkgSSBmb3VuZCB0byBkaWZmZXJlbnRpYXRlIGJldHdlZWVuDQo+IERVMCBhbmQgRFUx
IGlzIHRoZSBpbnRyb2R1Y3Rpb24gb2YNCj4gDQo+IAlyZW5lc2FzLGlkID0gPDA+IC0+IERVMA0K
PiAJcmVuZXNhcyxpZCA9IDwxPiAtPiBEVTENCj4gDQo+IExpa2UgcHJvcG9zZWQgaW4gdjQgWzBd
Lg0KPiBXaGF0IGRvIHlvdSB0aGluaz8gU3VnZ2VzdGlvbnM/DQoNClJvYiBpcyBvayB3aXRob3V0
IHRoZSByZW5lc2FzLGlkLiBTbyBwbGVhc2UgZ28gd2l0aCB0aGF0IG9wdGlvbi4NCg0KPiANCj4g
DQo+ID4gQWxzbyBub3Qgc3VyZSB0byBtYWtlIHBvcnRAMSBmb3IgRFBBRCBmb3IgY29uc2lzdGVu
Y3kgd2l0aCBSWi9HMkw/Pw0KPiA+IERvIHlvdSBzZWUgYW55IGFkdmFudGFnZSBieSBtYWtpbmcg
cG9ydEAxIGZvciBMVkRTMD8NCj4gDQo+IEknbSBwbGFubmluZyB0byByZXdvcmsgdjYgd2l0aCB0
aGUgZm9sbG93aW5nOg0KPiANCj4gICAgLSBpZjoNCj4gICAgICAgIHByb3BlcnRpZXM6DQo+ICAg
ICAgICAgIGNvbXBhdGlibGU6DQo+ICAgICAgICAgICAgY29udGFpbnM6DQo+ICAgICAgICAgICAg
ICBjb25zdDogcmVuZXNhcyxyOWEwOWcwNDctZHUNCj4gICAgICB0aGVuOg0KPiAgICAgICAgcHJv
cGVydGllczoNCj4gICAgICAgICAgcG9ydHM6DQo+ICAgICAgICAgICAgcHJvcGVydGllczoNCj4g
ICAgICAgICAgICAgIHBvcnRAMDoNCj4gICAgICAgICAgICAgICAgZGVzY3JpcHRpb246IERTSQ0K
PiAgICAgICAgICAgICAgcG9ydEAxOg0KPiAgICAgICAgICAgICAgICBkZXNjcmlwdGlvbjogRFBB
RA0KPiAgICAgICAgICAgICAgcG9ydEAyOg0KPiAgICAgICAgICAgICAgICBkZXNjcmlwdGlvbjog
TFZEUywgQ2hhbm5lbCAwDQo+ICAgICAgICAgICAgICBwb3J0QDM6DQo+ICAgICAgICAgICAgICAg
IGRlc2NyaXB0aW9uOiBMVkRTLCBDaGFubmVsIDENCj4gDQo+ICAgICAgICAgICAgcmVxdWlyZWQ6
DQo+ICAgICAgICAgICAgICAtIHBvcnRAMA0KPiAgICAgICAgICAgICAgLSBwb3J0QDMNCg0KT0ss
IGFzIHBvcnRAMCBhbmQgcG9ydEAzIGFyZSB0aGUgY29tbW9uIHBvcnQgYmV0d2VlbiAyIExDREMn
cw0KDQpUaGFua3MsDQpCaWp1DQo=

