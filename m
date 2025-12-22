Return-Path: <linux-renesas-soc+bounces-26005-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4BECD65E4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 15:30:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CDE73042485
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 14:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4511E2DD5EF;
	Mon, 22 Dec 2025 14:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Wfa49kKq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010057.outbound.protection.outlook.com [52.101.228.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44330185E4A;
	Mon, 22 Dec 2025 14:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766413828; cv=fail; b=NbGmoEwt75dC28WKRm78kcwnchWNxr0l6yEOZJKSmXW5PJ72iNYqiSp7WxmGxJME6o4J/o90CibcsbOfOSMhvEBF7V9dt6pcmx4PKn5zm/0rYHClDWi+xCNbxXxWTnGvoSusD6T5XeEJb+zDa7xnt8gmaVYD36o954HzqOxoXYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766413828; c=relaxed/simple;
	bh=cIpjfC6uNaX4wQW6FcxBBbs8yHKTWLwqzbGQ8hOn+mE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=P3VfLrjJUtNKsWLrBrG5nvrcwKD5LUuoDiRSnam2NQuA9/ygx7kE3GZt3+TaN1bAQOQELlu+HrQMoqfGcTsMqqFcYYN7zzAiFqaIwxzLoCd1daj9APQcVK9uxp1F0Eqb/0oMbGmW832EEdmX8i6rsFTLXlH3/MWuixqq5oF2RdY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Wfa49kKq; arc=fail smtp.client-ip=52.101.228.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QBd8l+uUjvjTOjncRuxHK/CcDb6c0oiti8b/pHxr7WK85zR9DsJxIfqx+09t0sA0z8ye2zFQP6/S4LKzWTXHD+ZLhn6DPYPNLS1K/uPsi/AN3pGTyUedTY196dvqXXh/WZGz65p8DyOgM2V5IYWbfxxS0E3RcnRaFsNpvzdC8J71fi/o/r8kI89Lec3nQ43ZQR+CN5/KTUYcOlVihMy9u5xKhqqz5Dl6LnM7zg5lwPxo/Qr+tXRNlUWvaVdt6pqgsSf+9q7/qMVMeWHU27xdAiGc44SRk9ihn3AWx16SodsIyi9Jgd4kUzTizavnOsWXdJEtfYBuGzI2hFeEMXBz8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cIpjfC6uNaX4wQW6FcxBBbs8yHKTWLwqzbGQ8hOn+mE=;
 b=zJJriloae1mxzvNoDVaBNG20TbxOZuBi6Kh2qQaKbUeZzG+8uvEyug6I9AKm58Z5Ouj3U4wHXwlGZPIdBYX/UNIphLtibIyE8f59gxrz6ULsuCO0rz7m2l29HLU+FalPd67z+9MaEFN76BO/nu7YrPTbNCHMcoGwB6YOiH9s6b8+riv9w4cNPPay9BvXQkPsVtUqYTC7rFqFgMk2OlumvK5+/JnMsezt8Oe9is+HlnRxwK5Obyq+uNLm70YgcgRGWIfBDAbFv1/1LFnje1Rt5mBTdo5rZk3SmFtk72sWxMk4K+Oz4x+T2C9yJ+mtK9gDq8aIYCFyr4RpM5S4pgnxbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cIpjfC6uNaX4wQW6FcxBBbs8yHKTWLwqzbGQ8hOn+mE=;
 b=Wfa49kKqeyH6N5hAojVh9+mxJl2yDzstJRKswNf/nmZslkuFktvbUMuzpKN15oyZEvO0rH5aWmvRCrPY5vauoepGfqNOZoQ2+MF4tRiec/0Fr0KtST2EmjzKGKPi86bak6w4lX08z9jav0xBqz21OrgCQfTtdVPtAK841nIfUnk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY7PR01MB14767.jpnprd01.prod.outlook.com (2603:1096:405:258::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.10; Mon, 22 Dec
 2025 14:30:19 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9456.008; Mon, 22 Dec 2025
 14:30:19 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, magnus.damm
	<magnus.damm@gmail.com>, wsa+renesas <wsa+renesas@sang-engineering.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v5 03/17] serial: rsci: Add set_rtrg() callback
Thread-Topic: [PATCH v5 03/17] serial: rsci: Add set_rtrg() callback
Thread-Index: AQHcYU9OAk7AqrEp4ESyGaVjgfoVf7Ut1WwAgAAGy3A=
Date: Mon, 22 Dec 2025 14:30:19 +0000
Message-ID:
 <TY3PR01MB11346B33DDA54ECE83CA8D2D086B4A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251129164325.209213-1-biju.das.jz@bp.renesas.com>
 <20251129164325.209213-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdWpsjQ=cL1z5vMX39TwnfWsfEhMOktBPL-zF0-QJug-Xw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWpsjQ=cL1z5vMX39TwnfWsfEhMOktBPL-zF0-QJug-Xw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY7PR01MB14767:EE_
x-ms-office365-filtering-correlation-id: ec4d01fa-e336-4828-1610-08de4166a23e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?VHhvNnQ4VTh4WGJGUVBkZU5ieXUyd01EUXdkYmQwTnVNVGlXSGVLVXFLQnhW?=
 =?utf-8?B?SU1CL2prVTFsM3pBYzRDNGhIeFV1b1pKaGlzbno4dVBvQmpvSWoybmZtTlo4?=
 =?utf-8?B?S0E1WXRIQWI4MHRYYVVNbnMzcUJGZE9QVWtiT2ZlaGo4bTZZaFROSlFqQ3l0?=
 =?utf-8?B?dWxrVlowR0JSQ1RtLzFHRmxJbXluVlErWnE5UG9tY0JucXFCUzBHcnliV2hn?=
 =?utf-8?B?YjJrc1FiRWdlVEFUUTVzTitsZTUyYnhsZ29NL21NOGM3VVg3VTcvSXp1REg4?=
 =?utf-8?B?b2tvWk9IWFZUTzJRcEUwZFhDODhSTGx2QWc1Z0dVR01LTG1KYjFVZTF1bXhu?=
 =?utf-8?B?ZnI5RGY2czNZZTlEcGVHcFhsQTN5TkdtTUZpVGNvNlZaelVHYmZ6M2Fnd1NL?=
 =?utf-8?B?OWhEemViSTdBd1BWeWdXUC9rUko4ZGxna29tQ1RXeVkxNlRvai9JTDZQWmR3?=
 =?utf-8?B?ZkZka0FtUFJrMDE5V1loWEVlYXZTQ3FjSVUzY1FDeEx4WjlURHdnZEtjc1F1?=
 =?utf-8?B?T050RS9yY1BRZU81aTVBWEdaamhNUUx2RHp5L09lRHBSMENpWDV1Y2hjaXgw?=
 =?utf-8?B?dmYyNnZkOUVxZElKWi9BbG95UjVzSklBc21KaEFTYTBBYVBMb3BsNTlzeFUz?=
 =?utf-8?B?dEdIdmxJSnE4NlpPdUtYa2lCbENWc2pmbUZ3dDVrN0pXY0tCZ3d5UzZpa1hr?=
 =?utf-8?B?OUx5cHZvQldudStXQ09lZzJFRnM0OUl5Ukx6QSt1Q3Mxd3lUK0NXLzZKRVMv?=
 =?utf-8?B?cFY2WW1Qbm5CSTJYZkVnSmhaRGdDOHJ0UWl5dmlPRTFZVS9hZ0pKRyswc2xP?=
 =?utf-8?B?cnhmT2xpSHA4VFdqb3RJRDUzMlZtdWlJd0NsOGxDVEpQdTdoZm1NOGpKR043?=
 =?utf-8?B?b2puODM3QXlZS2JWRllLenk1clN1TGtodVBXV0NGMlp0RjM3aHY3RjZGNVlw?=
 =?utf-8?B?ekRtTk9yaHI5MzVrRlphNUV3MEh1NFZPaVA4TUE3cFFBalJqbVR1Rk9RSHor?=
 =?utf-8?B?ckN3RUpUb09pZmtndDVhNmVEMFdSNElkZi9aejNvNFRneklwenI5bmRVNFZL?=
 =?utf-8?B?N0ZJRm44L3NCVlBZTWdtV3ltbkl6QkZHSWliYjR3K0RYeFVGLy90aFBUd0Vq?=
 =?utf-8?B?TkNrSFkxalRxaTd0MzZGRzBacTY4RENhZ2FmTDUvVUhSTTN2ZSt6UkJqUWhR?=
 =?utf-8?B?R2YrL09adS8yTTQyVWl1VEc3Ymg1anNXTjRJRW9KS3U5QWtuR1NpZkRvNDFD?=
 =?utf-8?B?UWxVR0JqUmEwMXFydFJKZi9pN2M4VkVSQmtLVE1QR1VmSFhQUGRjV21aS2I0?=
 =?utf-8?B?NHVkVjdOTG9obk9DaTdrUkt3M245ei8xSXRVRDVyK1JWcEJBUVFYRU56c01a?=
 =?utf-8?B?RFJqeUoyYWRyTUJZbktQekdXTWRyQitVWklxcWdyRDJwWWxiUnorVmpCb2hS?=
 =?utf-8?B?cDVnck9HYkxJVkVrTngwanJ3MlBlZjZRR295YndqTDlJODlJeDhjMTJyTGZr?=
 =?utf-8?B?Y0h2N2VXd3ZZaWViYmhiLzVBaHl0QkZRTFJEWjYyT1Bjb1NIVjBlVjBoSnl6?=
 =?utf-8?B?R3cxYytNTmYvcllKVWFrNGNPK2ZPV3pwTmNwMHQ5RUp4czFrbDhWcGxCR2JH?=
 =?utf-8?B?QW1PaVQvSC9jc1NSc2dDUGlmVm5OOGJnVGh3SE1ERzc1VGNrVTk0US9GZ3hp?=
 =?utf-8?B?cDYvYWwyOUhKbDVCdGFUU3JDNEpuZVppd2xGLzBLTXhWbTBQblN2cUdoNDNi?=
 =?utf-8?B?MlVEbnhNcklvMFd6RXJUb2d1UlpHOTluN2xtUytUVUJ4dWpJOHJ6bkJOaXlp?=
 =?utf-8?B?N1FBRDIwLzJMSGV2cXZZOGg1SVNkRTdlS1VGUkEvT1hDNkh1djdaTW1ZbVFM?=
 =?utf-8?B?UjcxeUlZZUY5Z0NGd2o3SEFxTUVjc3g2K1NYKzl4SlhmbmxFckEwd0F1a21T?=
 =?utf-8?B?ZHNWWHVrK1NxbGQ1dDhNS0tLcXhOQnltOWhHNHh0ZnpzTDhOUFJxRXJjaFZC?=
 =?utf-8?B?cWtHQ0dEV21udzU2WVE1aFZlNXkxMFZBRWJPL3dtLzRlVmErcVp0MnpGaG9C?=
 =?utf-8?Q?AFlPjO?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WmVjL3JuUkwrRWdFbFJQNzUwY0xYODNMbDAzNlFManl2ZzNTbUNmZVlUckRM?=
 =?utf-8?B?eXlGLysveDFkeDdsbzFYM0RyeWlnQmpUWGhMMkdRbXEwK25pcWVxRnJOTTh2?=
 =?utf-8?B?MGpFa2ZpV2tINkxWZmJ2ODhQdDV3U1pGcnRwb2xDelUvaE0wMHNoVXo2NkdG?=
 =?utf-8?B?QXZvcTZQRTJZeW0xV0YzVmpkZFpYLy8rM0E1czFlZVRJcXEyT0VKYVZWb2cy?=
 =?utf-8?B?b3ZLWmNMaUcrTzk4WEIvdXI3bDJ0OStGTTk3b3c2Y3llcU1xdlFDTlFOcFY4?=
 =?utf-8?B?ZVI3UnpXbENTVldjRFdqbElQMk1xdXk0bURnYis5eDBZMTRXckhicnJqMFJ3?=
 =?utf-8?B?ZGxyZkFtN3p5SW52S0d1QVBkM3Z5anhJbzliNVV2bW11eVpZNmc2U3JMQ2Jy?=
 =?utf-8?B?bGxYL1ZMS20xSGtnbXhvRWNEcWhjR0ZXZmFrZTk3WUdyeFcwNXV1Z2RCRTF1?=
 =?utf-8?B?T1ViMnBMOWhUTUd2aG9xR0ZpWXFyd2ZEV0R0YUdEWEdRdTh6YXRIalluZXRo?=
 =?utf-8?B?emhOS0czVHRiSURDRFVrZFJMNmdEWXFBdFowZ0xKdkNveDk1T1RMUGNWTWJI?=
 =?utf-8?B?bk1EMVNWU2JxbGdLWSs0YzlDY2cxT3QxdVNDYTc1WTlLWWpHRlB3bkZtQXJz?=
 =?utf-8?B?UUxzK0lGU25OK1IvZGR6alVXMzFGY0hDUUU2czBrbnhidzdCbEFtOVcvb2ta?=
 =?utf-8?B?N1FHejl6Mmw2QkJyYmNZakkrT1pqdjlUemtoZ2JzMVN1a3FLM2d5Z1lYMXpo?=
 =?utf-8?B?c1NrTm4rV3REaW5ENlc4V3lyVTc3Nm9EeWpPSEwrNUlOREZWL3gvYTFPdUcz?=
 =?utf-8?B?cVE5VDd2VG5HT1BtQVR3TTJocjRFaGw3NXBUTlhrdTJpby9jcE1sSyszb2tm?=
 =?utf-8?B?Yyt2YlZxNlhlUjY0aWxyVy9uODNIeU5tSFEzdTBpeHdaMnZHUVU2RGt1aXFS?=
 =?utf-8?B?dG82dndWcFBXdVpmdzVxUWl1d01vY2RPY3JhL1IyRGVQNElmSTE5WWZEbzNK?=
 =?utf-8?B?ZEtEa2dVTDJlcG1DWUtWMEJlTDhxVHFRTWJRdzFLRUxQQ0QwNWh6ZC9ONHVn?=
 =?utf-8?B?dytZOGluaFV4TFVaTjM3bkhKaTJRL083eTkyQmwrbFNIbjBxa3F1TVV6ZThS?=
 =?utf-8?B?MGhDR090R0hQZnJHdEczbGxzd3UvbEpjdVdnMFRUa01oSXFVUDJVMUxvcnpO?=
 =?utf-8?B?NEI0S0h0Y0NDckxHUm9SdEkxRmd6OTFHVkxVN0hrWll1ZFlSWXU3dlRXVE16?=
 =?utf-8?B?T2JYUTMyNksyazJwYWYrWTVOSjdYaEgvbTN5aER6b3FDUGpRSDI5Uk1ZeHAv?=
 =?utf-8?B?TUtkVGFoZVZXQWtUcWVXZlZTaFYrajI3MFk0dFVZZ0lueTR3R0ovUDE4cW05?=
 =?utf-8?B?eFJZYlgwbVJmTVN3b2FWaTlDTEVsWlhPTEpmdlRFd2lIUEhFcXdSRVlJWHVm?=
 =?utf-8?B?a0pSa0NXbUFueHltOE9oenR0b2pLM2tmQ3F6blZ0QkpCTXFSN3lEV3NDNnpk?=
 =?utf-8?B?WFd3R204ZHlFUkkzcHlCY2F5SlBIK1M3aVNVSUhBZURkTXMzM1Q0bXRRWDB2?=
 =?utf-8?B?aU56bHVoRFcrNnFsV0RIamlqdEFsTytrNjhFWDZoMHR2aTM4dzh1ajR5Wnpm?=
 =?utf-8?B?Q0N3bXZkKy9KN3BXc1BDTXg4YmhUN2o4cGU2bGVRVjNwR0lMdGwvaE4yOVFj?=
 =?utf-8?B?Tm5zQnVXSzZ3dlN3U0drZHRVcFdWTlpQc3dvbGhJSmZKYXB6U2dPYmhVdkJR?=
 =?utf-8?B?VFZjRWxSejkvQjJRazNxcE9zaFMxQVlmbm5JUUxDUHpZdkM5bXorT1JFYXpF?=
 =?utf-8?B?Z3VGa3IrbitrV084V09KaUhpWGlMcHQ1bEo2QXRQUEZ0dWVOK1lCR0xVMExq?=
 =?utf-8?B?b2lnc0tpdHloZjlRbndKSlpIVGhXbVV1OVdmcHhMNmN1ZzRycWNvRXhSQWJr?=
 =?utf-8?B?Qkk0V1AyL0J0eVZPaEl6YTU2QlArb1ZuckU5UUpUVVNkWjMxWVFBMWZOVUl1?=
 =?utf-8?B?OEthTmU3aHRja0FDRk9LWjV1c25nSEtDcmI2MEd3SkQ1eTRJZ0pCNnljNXVp?=
 =?utf-8?B?RHZvUURLV2xraFFwQk1IN3p3d3Vkd3RRMDZFQ21uMDBvOUlxVVN4MThnQ0c2?=
 =?utf-8?B?RXFZaUIvbXBWb1BwMWMyZGtTU0dCZkJiRERCOWVxalkyaGtZNU93QnRIZjU1?=
 =?utf-8?B?UGJYOCtPakE3OGZuaEpFaE9oenZzU2hCd0w5MnNHY0U3a2ZuaW1lQzQrelFn?=
 =?utf-8?B?SEZ5L0R6QXB2K25WU2tna1B5cE9ETlp0VmdGa0JWQm1mK2w5cmpnRnQwVEJZ?=
 =?utf-8?B?bjAvaWkvMDdPcS95cFpTeGJ3eVdRUFdiTjdPQm1aa2Nha2VtekhMUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ec4d01fa-e336-4828-1610-08de4166a23e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2025 14:30:19.7453
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j42oCsGcv51Yyf3/hI27FpBV/5wSPgu1B93FxhRIHmvTnTuBZHvvXqS+GoTfqotb84CO2BzJsxrn/thufRMZncx86v63FhtuZEhfIz1m8ro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14767

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMjIgRGVjZW1iZXIg
MjAyNSAxNDowNQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDAzLzE3XSBzZXJpYWw6IHJzY2k6
IEFkZCBzZXRfcnRyZygpIGNhbGxiYWNrDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gU2F0LCAy
OSBOb3YgMjAyNSBhdCAxNzo0MywgQmlqdSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPiB3cm90ZToN
Cj4gPiBGcm9tOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4g
PiBUaGUgcnRyZyB2YXJpYWJsZSBpcyBwb3B1bGF0ZWQgaW4gc2NpX2luaXRfc2luZ2xlKCkgZm9y
IFJaL1QySC4gQWRkDQo+ID4gc2V0X3J0cmcoKSBjYWxsYmFjayBmb3Igc2V0dGluZyB0aGUgcnRy
ZyB2YWx1ZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBi
cC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiB2NToNCj4gPiAgKiBOZXcgcGF0Y2guDQo+IA0K
PiBUaGFua3MgZm9yIHlvdXIgcGF0Y2gsIHdoaWNoIGlzIG5vdyBjb21taXQgYjM0NmU1ZDdkYmY2
Njk2MSAoInNlcmlhbDoNCj4gcnNjaTogQWRkIHNldF9ydHJnKCkgY2FsbGJhY2siKSBpbiB0dHkv
dHR5LW5leHQuDQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvdHR5L3NlcmlhbC9yc2NpLmMNCj4gPiAr
KysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvcnNjaS5jDQo+ID4gQEAgLTE1MSw2ICsxNTEsMjIgQEAg
c3RhdGljIHZvaWQgcnNjaV9zdGFydF9yeChzdHJ1Y3QgdWFydF9wb3J0ICpwb3J0KQ0KPiA+ICAg
ICAgICAgcnNjaV9zZXJpYWxfb3V0KHBvcnQsIENDUjAsIGN0cmwpOyAgfQ0KPiA+DQo+ID4gK3N0
YXRpYyBpbnQgcnNjaV9zY2lmX3NldF9ydHJnKHN0cnVjdCB1YXJ0X3BvcnQgKnBvcnQsIGludCBy
eF90cmlnKSB7DQo+ID4gKyAgICAgICB1MzIgZmNyID0gcnNjaV9zZXJpYWxfaW4ocG9ydCwgRkNS
KTsNCj4gPiArDQo+ID4gKyAgICAgICBpZiAocnhfdHJpZyA+PSBwb3J0LT5maWZvc2l6ZSkNCj4g
PiArICAgICAgICAgICAgICAgcnhfdHJpZyA9IHBvcnQtPmZpZm9zaXplIC0gMTsNCj4gPiArICAg
ICAgIGVsc2UgaWYgKHJ4X3RyaWcgPCAxKQ0KPiA+ICsgICAgICAgICAgICAgICByeF90cmlnID0g
MDsNCj4gPiArDQo+ID4gKyAgICAgICBmY3IgJj0gfkZDUl9SVFJHNF8wOw0KPiA+ICsgICAgICAg
ZmNyIHw9IGZpZWxkX3ByZXAoRkNSX1JUUkc0XzAsIHJ4X3RyaWcpOw0KPiANCj4gRklFTERfUFJF
UCgpLCBhcyBGQ1JfUlRSRzRfMCBpcyBhIGNvbnN0YW50Lg0KPiBIb3dldmVyLCB0aGlzIGNhbiBi
ZSBjb21iaW5lZCB3aXRoIHRoZSBwcmV2aW91cyBsaW5lLCB1c2luZyBGSUVMRF9NT0RJRlkoKS4N
Cj4gDQo+IEkgaGF2ZSBzZW50IGEgZm9sbG93LXVwIHBhdGNoOiAiW1BBVENIXSBzZXJpYWw6IHJz
Y2k6IENvbnZlcnQgdG8gRklFTERfTU9ESUZZKCkiLg0KPiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9hZGEzZmFmNDY5ODE1NWE2MThhZTYzNzFiMzVlYWIxMjFlYjhiMTljLjE3NjY0MTE5MjQuZ2l0
LmdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmINCj4gZQ0KDQpPSywgdGhhbmtzIGZvciBvcHRpbWl6aW5n
IGl0Lg0KDQpDaGVlcnMsDQpCaWp1DQo=

