Return-Path: <linux-renesas-soc+bounces-33915-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Oux7BArZK2pBGQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33915-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 12:01:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEFF6788D2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 12:01:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=vauVnDf9;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33915-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33915-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 14824300BE84
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 10:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C5933812F4;
	Fri, 12 Jun 2026 10:01:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010044.outbound.protection.outlook.com [52.101.229.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA52E35B653;
	Fri, 12 Jun 2026 10:01:25 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781258487; cv=fail; b=OxQRafg3AIn4/gKeY8F6Kfn4VgvtWR3hSzzEVdJpvx5vwoYOKd/Kq6G6KCrwyd7SEsQMVGTV23GY7YusN73ntSIP7X7toZKCoAx1VPghouSHJ8MrpdYLYNWQWvk9h1y2m40bZSVwegUsUxKkXieAyvjYoHE/i6nLBtGhLCFvLD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781258487; c=relaxed/simple;
	bh=tyPvAT9Fxunby9iPZmGR1B0uMIbQ//tI4lUv1J6GMUk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fkN+usIjx+FCfRYXQq+DO+V1evnXvsIAiXzBkEMLQkI/OcmKx+dHVSwJ9di+R+JZkC4/yNXW5JmaESlz6YsJR5BMSRDmDJhLg+gZithAX23jw4PoC0Jn7nYoi9Et9S7Khc71KIMuuMdzQIpxo4lk+4/A+WhYDZIlKmpEHa7FGyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vauVnDf9; arc=fail smtp.client-ip=52.101.229.44
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gd91b+MY209NSLSohL8C87EfkTAOrmNiaKfVTZkYNaAIHnMGgTwwZA1T5w/tdiwvRRHCDTQs+x70GDNEQ+ne5R+Pk4iBHz8arsKYAeqjWaQzy/kfQ2bnEkTrg2a0927cU4Jwv5pRKXFCCBkXDw+dMxnx6En13hMnPBP55smUmJSHkv7l2XOsB2LNKsDfaoL5sV9vQlNzeiN5STt6GQDZqwqmDvXUChGfyBuuXvajkeDxFarQ9sBfadlwNHLgPLfbooheGp6JmfvJPc4I1dCVjuD5j+gS2tRqq73PmrYzQSWikOlSLAwL2UmiAI366D+xO2d9D865S3zcfsLdYs7dkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBaVvFP2k8kUj+jvW6qwxMl94ShQSG8I/ubLRmP0/Iw=;
 b=orY6pSWFqLnhHCUWZyJBheicmI4Kh6gCgu50m2MAhaax+8YMFRgggYkLxsHntKrkY+E0tEvdF2L79dHvrtrAxZI4hHxmwyPwfInBKdjRawZxS9lp6Zk0UJ/XVGxaXhVgtBtN7P1PTn0UJLy5euveNy9SvLuein/YsfgRn25L8CRZKf9r5XYTCQUCFqtK7BJpwCZI1Q7I6Kh+mJYPpwM9OoNYHPWbd6Mh4hJ0hcic6i5t0TsRc+Pi8qQo7hOcGyJqRE14RSeGHBPGRpr4gM31qXzYYyRneQh5XEcZF4x1Mo37MBH4Qcb4hrzQ4oFVK/ylXjuExUrnB3+79DfbgsymGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBaVvFP2k8kUj+jvW6qwxMl94ShQSG8I/ubLRmP0/Iw=;
 b=vauVnDf91oH5oKs/MCRNbFChUNCS5tbx99m4fD04wd2zMA2WgywsxIWWF+SVDcHvrWpyggDfrie84TQHfb3Pwq/buiUOBuNDnF+juCq75DHKsPaJPK6RHOSL7KxI26V38U/DPtxswFGvvJzvhPWimkZfNFuOrt5qDfX066lFAZk=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TY7PR01MB16200.jpnprd01.prod.outlook.com (2603:1096:405:2a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 10:01:23 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0092.016; Fri, 12 Jun 2026
 10:01:23 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com"
	<tiwai@suse.com>, "geert+renesas@glider.be" <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "john.madieu@gmail.com"
	<john.madieu@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>
Subject: RE: [PATCH] ASoC: rsnd: adg: make rsnd_adg_clk_control() idempotent
Thread-Topic: [PATCH] ASoC: rsnd: adg: make rsnd_adg_clk_control() idempotent
Thread-Index: AQHc+PjrqkajRu0CfkuUK8HRbOHBfbY4ZYoAgAJMZtA=
Date: Fri, 12 Jun 2026 10:01:22 +0000
Message-ID:
 <TY6PR01MB173775D8E134C9A90BB069334FF182@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260610164704.2211321-1-john.madieu.xa@bp.renesas.com>
 <87ldcmovp0.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ldcmovp0.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TY7PR01MB16200:EE_
x-ms-office365-filtering-correlation-id: ecaeba1c-fadd-4714-f14a-08dec8698f1a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|38070700021|22082099003|18002099003|4143699003|56012099006|11063799006|5023799004|6133799003;
x-microsoft-antispam-message-info:
 yK9O9thWMwovVOMaFxpfCA3YXyCWG/NuZRpoJRUmxJKZmVosBQDv/oxBNEz6ZIklt7/o/8DohfgTlsHJ6Hbt2vSRkmdmWlc9jNmQSEE4hxeplHL9PymGMqOSXubASEQeXcchclLbWIR9+Oi/R4uj0lMYjvWOoXYgrbJJf+cqyQmIamYrBnlnxMZcLYIBVTBFh5QmG9CYkAuBpTTUMFiWVN+AnZ+m7By1DD4/ntzTzysKzYVNrytzTVFA+LEe1DthYXF+nZWCrQVxVhpbOL3a/EWvZ9tOjEHBc3Hu1sx56nYE1Hie/1EBh3VWpAzlu6SD2BUUfheNSqOUYYRf2JPf8116zjAgCYORqSCChY8Pxkj/Tk9QRzjOpqM3/Rb2cHjJqZv1bRJt624zccUmZzGW64am+WwmMMt7EHNIRRzspU3vllrnnYzP3sbf/gTSDUDrB8lANkkeeHtR3yvHmm9SzzF3eH6TfxRi5Dgw74W5oRiyfPv/Lni5emaXAewINhhDInqDojWzgmYxtWEeQO44Y/0x7ENPvkMV6bDWC4T4e/vTVKf1p6CTgEbahH8zpO8dIQCmV9YY4pRRzxfPYtc4QGuhvKlmk3cwM1/mp//HH8QPFJDbh5IOpx7VmlIsoPLPrQ3+3doJnfrFkIb5acuoOBRTq+g+aEFkgGOUeCMTlLYMtOvqxFAvWS6u0kBPdUzU2vsPkH0o1o1q4NgavE2zr1HqGV5gI2EJEf3YEsnCZs7CBPtqbf3O7bbtMrYssGCF
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(38070700021)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006)(5023799004)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?fYkMQ/WOAJV3lUEawfDiRosUuUesr7fclp4ErOtRKEIe8bdbiCT4qO8ig3vJ?=
 =?us-ascii?Q?hO0M49LpirJ0Spj1Bmf/4rObSQ18bIFO1QUvp1ONUEEQzfQflxSyX/PP7lDn?=
 =?us-ascii?Q?NaTBLYPDb/gvmZpmAMsIDPWZQQnqEyLgF9AF9bOWhA9aQEM7GuvFSy7v5nsB?=
 =?us-ascii?Q?5RG6QBAyB+0HdQgXglJA73EvV7Jcx4KetmLmAC4vBNMdU9gN0qw4ynGltmGq?=
 =?us-ascii?Q?FAiUOyd1lF+I+xyD9nnFVJdx5utu1biHyETy5mltcnz7tN5zZQqmMuRK8XyR?=
 =?us-ascii?Q?t1oT7sCyllIbL1TezsJjmQZRPwVS5Ffjc+A8PexEbBkTd8hrwOOVJurpJL+5?=
 =?us-ascii?Q?wOvDzoLDXWsyEUjckUGXsF9rxGOJBbtYHIlR78BobzWyv2A2eBf7KwhV0LR8?=
 =?us-ascii?Q?kI02moSFyaSItlQOFmo8YuwESr1GnpIn9n5WrUqI8PKDcDOqChrOQ76FELIm?=
 =?us-ascii?Q?Eese8eA10DGalNJxoMM9JdMzh7iJBAs7TuOEvhX5UDPHrVVb/uUn8o0YzFDI?=
 =?us-ascii?Q?tQZJb8q3jqKA8P1y5jSgY85YWoACbq0vmcy5Pofr1MIW7DngYddUoxhRvDFm?=
 =?us-ascii?Q?iRt8aYjRFf+YUNY/tLqhZZ7DgcaLvlwcJN+ARdTn0Izi0ZQAR+Dv2JH/KMjh?=
 =?us-ascii?Q?vmmGRh/n+Eu7oJJ6jHp/af2fho8oxSv2ZaitWh+MKPUNdGOxk+5pHezrH+19?=
 =?us-ascii?Q?WswXPSEoP/Kca7xVtur8bXEg5XSGmBl9Kk9iSJoCiefktsqYDh3jRMOuCbny?=
 =?us-ascii?Q?WQRK2QtMI23gxsHt/Aj03t1INXkCWlpWeVHYY9FSjpGltSZysyimO7I5a6Pl?=
 =?us-ascii?Q?5TX7uu7Hq2CFoD6RMeI076718oTD7jbu7qEB6Hme464BKYPKsdDjNZZ4xakG?=
 =?us-ascii?Q?I93TNJ/PvFcuSNTPkxm0K8S+LuztY3rhctlkxqbbenzOKRFj/mjBxJPfebRP?=
 =?us-ascii?Q?fSVJiv456Zdl8tuFp+Ws9M7anlPbNHKr3iopk5mJshGxEvWnvrnpursDSJAE?=
 =?us-ascii?Q?rhP0kTE1l/Ah/8UVmNNBwcjti0h4LGFXXfF+8wXvFI/0fv8p2iKMNWEU7Tc0?=
 =?us-ascii?Q?lCEUn3QvPCNOuLs0snO2zml9wmMueBiKekuUr4adrXsWKbDTSecVof0LPZTI?=
 =?us-ascii?Q?LMJYRfdwdDPZXCePcxcMnwhec1ItciRb84fVJKCfSuZENgiZcIcw+2zeCHsx?=
 =?us-ascii?Q?jfD4bS+2SmPO4CMSKaaBKVpTSxk2+O6F1u0Ty3GBFsrV8870fmWbBdm2ULgi?=
 =?us-ascii?Q?3MQGnSCGo5zEDpFp4NRZBwm8mW5HIDMzQgtdjqxQH6GRFcCTsubS5/kG9hPF?=
 =?us-ascii?Q?bqeo1GGq3ayp7yE3FXd/CRkOv5rH78LrKspi5sa5WO35BQgHRj1S/JJnv2Sd?=
 =?us-ascii?Q?H3UEjiwFtKLUAuZfggvQmZtCXm5eDvDtTvJFsdANcCq2kiGo00i2xP2oNhdQ?=
 =?us-ascii?Q?0qNAx+22FulD4XDbbKuWBNJUbnbK4tk5O5BaAHebidL5vhmcDeHSQZCCTC+f?=
 =?us-ascii?Q?hmnPYknPUK4ogxg0QX6bVvqp1pZgxSdpsSCuKrbOdeb0OgiP/NO48lxb9QEi?=
 =?us-ascii?Q?N4BYPr/rLYh0ayMIL7GYJr21ZNr/3CSZhT8v/bmSJwjeEAwjDx1Kdq+Rmm+C?=
 =?us-ascii?Q?1N/0GDLeA/zb9bOJPwNAedTxIqV8Ro3Ra3vSOGG/NkXg9dPghGrDI3UmV4jU?=
 =?us-ascii?Q?fRBEQJAB7Pml9qamrssQnXuJQG6QhrHaWz5ZPdmztD2ja9uM6Mu+1zdPE4vl?=
 =?us-ascii?Q?EzQ249s32A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecaeba1c-fadd-4714-f14a-08dec8698f1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 10:01:23.0451
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: edxjkWtX3X8W++ndQAhQGiyfDRR81bN9WXqbzWxd4kM5sBgyVHz33Wq4vWixA3V6r/9rjUu5/xudvIIfAMcIqIDF85A8VqWGDX0WDUsckhg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB16200
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33915-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kuninori.morimoto.gx@renesas.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:john.madieu@gmail.com,m:biju.das.jz@bp.renesas.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,glider.be,vger.kernel.org,bp.renesas.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,TY6PR01MB17377.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EAEFF6788D2

Hi Morimoto-san,

Thank you for the review!

> -----Original Message-----
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Sent: jeudi 11 juin 2026 00:52
> To: John Madieu <john.madieu.xa@bp.renesas.com>
> Subject: Re: [PATCH] ASoC: rsnd: adg: make rsnd_adg_clk_control()
> idempotent
>=20
>=20
> Hi John
>=20
> > rsnd_adg_clk_control() is asymmetric on the disable path: the clkin
> > clocks are guarded by clkin_rate[], but the "adg" clock is disabled
> > unconditionally. If an enable attempt fails (for example a clkin
> > failing to turn on during resume), the error path correctly rolls
> > everything back, but rsnd_resume() ignores the return value, so the
> > following system suspend calls rsnd_adg_clk_disable() again and
> > underflows the "adg" clock enable count:
> >
> >   adg_0_clks1 already disabled
> >   WARNING: drivers/clk/clk.c:1188 clk_core_disable+0xa4/0xac
> >   Call trace:
> >    clk_core_disable+0xa4/0xac (P)
> >    clk_disable+0x30/0x4c
> >    rsnd_adg_clk_control+0x9c/0x2cc
> >    rsnd_suspend+0x20/0x74
> >    device_suspend+0x140/0x3ec
> >    dpm_suspend+0x168/0x270
> >
> > Track the enable state explicitly and bail out of redundant
> > enable/disable calls, mirroring what is already done for the per-SSI
> > clock prepare state. A failed enable leaves the state as disabled, so
> > the next suspend becomes a no-op and the next resume retries cleanly.
> >
> > Fixes: 47899d53f86f ("ASoC: rsnd: adg: Add per-SSI ADG and SSIF supply
> > clock management")
> > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > ---
> >  sound/soc/renesas/rcar/adg.c | 29 ++++++++++++++++++++++++++++-
> >  1 file changed, 28 insertions(+), 1 deletion(-)
> >
> > diff --git a/sound/soc/renesas/rcar/adg.c
> > b/sound/soc/renesas/rcar/adg.c index 5479cefb6dbe..53efd1be5139 100644
> > --- a/sound/soc/renesas/rcar/adg.c
> > +++ b/sound/soc/renesas/rcar/adg.c
> > @@ -45,6 +45,7 @@ struct rsnd_adg {
> >  	struct rsnd_mod mod;
> >  	int clkin_rate[CLKINMAX];
> >  	bool ssi_clk_prepared;
> > +	bool clk_enabled;
>=20
> Can we use clk_is_enabled_when_prepared() instead ?

I don't think it can work here. clk_is_enabled_when_prepared() reports
a static property of the clock implementation (it returns true when
the clock has no .enable/.disable ops, i.e. clk_prepare() implicitly
enables it). It does not report the current enable state, and its
kernel-doc explicitly says:

 * Regardless of the value returned here, the caller must always invoke
 * clk_enable() or clk_prepare_enable()  and counterparts for usage counts
 * to be right.

which is precisely what gets violated in the bug this patch fixes: the
driver calls rsnd_adg_clk_disable() without a matching successful
enable, underflowing the "adg" clock usage count.

The CCF intentionally does not expose the enable state to clock
consumers (__clk_is_enabled() is provider-only), since enable_count is
shared between consumers and any snapshot of it would be racy. So a
driver-local flag, mirroring the existing ssi_clk_prepared, seems to
be the standard way to keep our own enable/disable calls balanced.

Best regards,
John



