Return-Path: <linux-renesas-soc+bounces-29592-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIpqLf4uuWkYuAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29592-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 11:37:50 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2776A2A809D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 11:37:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1A753224B71
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 10:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCACB3A63EB;
	Tue, 17 Mar 2026 10:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="N8UNvy1u"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011042.outbound.protection.outlook.com [40.107.74.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F21D3A5439;
	Tue, 17 Mar 2026 10:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773743275; cv=fail; b=X8uclGkiVc8854WMH+uebrPrBA2V+X9nL6VUgax5nfpaRjgFY99lrI9t9kZ4e47cHjFfDcasKWE32QjO70yO0j4pgF99FpA5N8dSRa+lkPZJRgbZBo9jK1vNwxE+8xUPsaJtaN32mY+Kew6hKRyPoDagbtV+kdu3WCmB/vtSSso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773743275; c=relaxed/simple;
	bh=C0aW1wtr1SopTJuGspsZwdBpc1vBbR2iq/fH1a3/9wQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L/Ll59Zfmc11zvuDFztEouh7JuzeSAbqVwZMXqeDdsOMTJ85QdSuTfs6UbxDuSwd/hz/GejsHHww5L3l9bCtOp+Lyux+0SXMllj8KdihqR2Lbm3L5QcblihEMgxKt+nLJ3FFlkAVs9vm2G7gvF3PgI44wuOtMXL30W9O9qVNjSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=N8UNvy1u; arc=fail smtp.client-ip=40.107.74.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=utwSG76ePHGb7RFNJb/OfqZUtVx9K4ZHX2IG7VgVWgy1a93HgbI2AgfC2B3pe2SK1xpw4wE1lSsDeW6FRQfiVbrBouYuMTyHPf2BfWJdN7YIWcs49FCpD2BESw7kHEiKSVPnfSgnQEPI0dTKPb9oR7GqHiHW5FIdVY9ty/33tIT0AEzLEiXNFvkB6Xf+yqiYXPrG+b1Ke+BGkQ7SS2wdFrWyM4wVTW7ux929ePE7kkKwXIt0IYn+rn5Dhb351DCOjEi8r297DmyLR/rRUJ4PDAJcTcgJsOlrc9x+LwDdNlNY/pt882Ah2iRGANzo47vjK+k/tpCZWXz3f1PtlPFhSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0dC8CUzzPyvN9qGyYnOpJ6JAJV4C3KvGdwFyLaSZIrs=;
 b=ZXlnNkmfGnHKtk7UZGQtHhuSSVA45A18BCH1Y1D82kLFM8NQ/Kj9tlmFLE+Hvz7wu7VABV4twXQ6S1qDUAXTpKXnPzN7j391Lfzre/YsMRslm7QP0M81iBDf1VLq3pWSd7aBBJMbYr2r3J78XTU2ggKarNbfusUtF+myHIObUi2qRl7i5bIg/cTgipTA/tnrv1rb9CgfYxXkYs1tGos6pHyf6bAd4grsVr/5g2ONk/uc+f7Xmcog074Io7CzLwZOYX3d70eH1k9zZScdo7bWP9d9GuZ56Jvp2IaXO1yaolzIvxnAsOmFDDUucF+cKwQeneWs6Pa1Qrh2mTqzlzyzEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0dC8CUzzPyvN9qGyYnOpJ6JAJV4C3KvGdwFyLaSZIrs=;
 b=N8UNvy1u47S8QuSCY9rDzLX/pLAx7i6bhBgVc86wCg12BgFMTDD9f04qS7mo4zpVVXBS7iwWWJ16dqeeyuh6/aGlz08A1A66h0wSAkO9oERubvg1gfHsmnq27GQa4Nx/N+gYZMCPaaqFqz1bx/lPOYuRzjfJsNoTMeKkdyDRfUI=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OSCPR01MB14965.jpnprd01.prod.outlook.com (2603:1096:604:3ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 10:27:30 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%4]) with mapi id 15.20.9700.022; Tue, 17 Mar 2026
 10:27:21 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Daniel
 Lezcano <daniel.lezcano@linaro.org>
CC: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] thermal: renesas: rzg3e: Drop unused kernel-doc comments
Thread-Topic: [PATCH] thermal: renesas: rzg3e: Drop unused kernel-doc comments
Thread-Index: AQHcmN1ZOPrrWkesik6DH+3msZCbhbWyvecAgAAAUYA=
Date: Tue, 17 Mar 2026 10:27:21 +0000
Message-ID:
 <TY6PR01MB173770F6E3F3920A17DE363FBFF41A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260208092848.5313-1-biju.das.jz@bp.renesas.com>
 <TYCPR01MB113323FD2F63C1E7DE9C0E07E8641A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TYCPR01MB113323FD2F63C1E7DE9C0E07E8641A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|OSCPR01MB14965:EE_
x-ms-office365-filtering-correlation-id: afca4475-bda3-4f31-741c-08de840fc5e2
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 wQm0Kk2V3ZrH5K8gSa+rCRvkDIk9p9Kjx7al0Gs/05SJpp0ZpEqGDAVT2SNajCKyUWRWl0AzLVNTkA737uxhueNu1JbGNzVdiBE0y8XA5IOaJ6k+5voMdeDHpGJLqsu9ALBhTLU6rZNiPSXo8XZO3CtGq5O3wAJg2O9M3yVtBdG8zxiWaRSMVxL1hxTbl+X+KXk7+zJm2+mxQBAvC5F5+nHzWB9W5OMgZ9WMH55nO63txpskC4qElAwB3we/MtqPo90Sf4evKflLhbXRjFhRkfaYoQ6nWcyf3sOBUgx6V3Vo37XxO9RVo8JnGHfOhOY4TGH/WIIeoSCHhGBfuxk7YxtZ4uE5qrYeDUC+PqwvNDNUJZNOi3BZMv1Jbc4WyUujB6UCLQkzXzMu4zqra5cWKIAOe1d6GiZrbL9w2ye5AiSpYhueLLMeH9RcGtxqJ4dqoYs/ti+M8QdYPHHGQFKU6CzbxxDpqV0pto1EwvRpEuTMT+kCZUTg4Y2SFIYc9MsFTLVjESWjECz/cdUe98Lmbv1tfJycEQPB7hii3r+qPL9qqwUBmkMTRo9ID6mX+4qSi5w/PlN9IKTYR7K9L+U0o7X5iyxHsz1b1VNnySq80a0znFR/VRhVJk7kEdOacT/JCsCgjjG4RjRPpHIZfa+434X9+Bk1wDhYJMYK2S6isIj7EbHErYSvLVw6p6I84t+9KMIRcTKRMRWBZLyRQXLr2A4HpfMrjGlEsQUx8Zup/akqU2mFudIF7XkkRcAHej/SHaa5Mrzk1Vx/K9YER+EC/Y3MkoCbvcBS/jqyg66l760=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?p97CKbHRdCS5vxlmTi0DXrxkrFaFoaClxKZR9Oa1GWskceAi57NxROQn7X8+?=
 =?us-ascii?Q?eyCbTTF2g6xXJ33tawTlQtlqxG2WWduuOH0Yz8kYZR9fCfx7RcdlTXqSSdQ2?=
 =?us-ascii?Q?gpM3AnbOnvRslPl4en+ZGCa4U9X2tpkG06HgeI4OdaMW0Y5FNRR0G6t0eoG2?=
 =?us-ascii?Q?fWC1Kk7HW+j/8zVKUPc2Ofi3xjNSlCBnkgUZef+IMMJzqKp6dp73HmeiuOxM?=
 =?us-ascii?Q?IV1GNnt6z5+2zrYNDeo4Tm1oy4i1Gc32+BnOTsuEaJ0ASsKbgQZMpjZPWHr5?=
 =?us-ascii?Q?oeCnYpEFq1xcjN1Jg8ZapZ4rH7S63Xi1lOr7H5Z+bKnFF2cF/KXNV6y+8Bui?=
 =?us-ascii?Q?CZN8RfijhsyFLvkOJmLJqm3Y9iFIUddnwm6RS/eTJ2hsGYBOvwvTsVnamtqs?=
 =?us-ascii?Q?Myetr4nUtQcbmfLEPUePmFQ5o0hRdiIc7dfcUgHi4pxEhGerxvTbS8EC354g?=
 =?us-ascii?Q?6BA97SDEshM+GwzD+kkV7JrBuh3XJYa/UQsa6GDr4N1DtcbQ26NCBujt+kG/?=
 =?us-ascii?Q?rblwWe3DMVad2F7PGBXa73N0pszcz7FnjCCcQIz7bY9OgF2zySfKaMeF+FqM?=
 =?us-ascii?Q?UrkwYqzeXCIH2ZMR3RFuXa/EUaRD7G7eZo9WQKiejKIncf8Vg11SOR7XY5zo?=
 =?us-ascii?Q?C9co6wSm1b38CHjhr9wSbNoJy7VaOkZ6ooYRTamJ2Plm+s84zB4/y9bVsytl?=
 =?us-ascii?Q?d0ipGoQyO5ZSXjfiWi3QbTQVPqGA2+OAeLGIEoGYqAXEquQ8aqB+9U8q0I/w?=
 =?us-ascii?Q?CRk3aY/x7vnB5swx5Sk1lHb76EbFZaHezDo2QHT8Vf80mIorpCU8/BaF5WJ7?=
 =?us-ascii?Q?rFGuZ4cm8X5krVgi/OVDRXqjl07c+Wq3wcWe0JAo8L08Ybdn156+Zj8pA3P9?=
 =?us-ascii?Q?iuXylDy0y+p8PAk/OUFh7NUUgeUwQtWBxnTrxJ7+mSPw2A6nYw9qv0JD4iQR?=
 =?us-ascii?Q?UVB2y9tml8j+Z9s9CML0trdSI16Ap25KYsWUNbib74363jqAmrFtMpdMNtmU?=
 =?us-ascii?Q?Sgk4B2vkSstMUR+WHib/TlEr28i53QRkbb3bthUDcRrYGXEX+PK+FWPOg7w8?=
 =?us-ascii?Q?DAdaPtcY92epGMHnF5Gl7JIa+tP71zJ+PupXRPT2uKaGYRqFeWgIhh4mYQUq?=
 =?us-ascii?Q?ybs2iXmKEvXyZDx4lYIYJUm0AqFldhtSF5uUBh2+3m4H5aSYTWVFJzMT78gf?=
 =?us-ascii?Q?DLOdABO8gVRv9OA3ngZy7PHHjRK79rEYGLyBw8Ujh8Afz4RMPOzoK4R/WD3H?=
 =?us-ascii?Q?RDuhgMaBr/AS/BDugEbdd3YZmnyVxpm4dlYIL1oJqxJ7qkq3QXVQhtXnH57l?=
 =?us-ascii?Q?ZMWt1GWikHly43XDwfTqbWDfOGjJkjPp5ARvCqx1HfoqTBSUo03SLTtekteH?=
 =?us-ascii?Q?DlcgHkJn1OU+EoHuhBVtF/vsRJGYSifHBxP5q/wx8j6iTruHdyvyUD56RYd+?=
 =?us-ascii?Q?I2oGUGe1q21e3bRrO1W2a3HvVHFqxs0H2+fFMCQ3R9YA+dNsd/FYCNw/aixY?=
 =?us-ascii?Q?IYP0BLPMeW9xeOVOI2u+kiKPvtDJOdVdNeNCfSgKwCCvwJ0YH7ANQKCec+7h?=
 =?us-ascii?Q?2Axr+zkKHaTlmv9CkQ3gi+9KdpKQ4pMrb78jqs0CquQKv6KnG2TEthk+Z1ix?=
 =?us-ascii?Q?57tl/rDMbW5unRRiQ+l8ANus5ZZcdCn3xogu+PAPEM21Y89syz4+68OleQKv?=
 =?us-ascii?Q?QyrbjFQaZ6+3lfGQK8Mxj8fYaa776nndiFBDwI2h4wM5LsxXfLhzN07wp/v6?=
 =?us-ascii?Q?SFNcppW3X0s6HZsMvaHmurw6DQBECSc=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: afca4475-bda3-4f31-741c-08de840fc5e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 10:27:21.2327
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BFi5XVjhQz13bgRrsDfJnfIpyIkg3RrChZaHUl7Lih/Ug5HNKcNZ/TAhT9JS8kVzTkPs057mprehsu3wysugdS+6Ifs24jdZoXIBn72Cmb8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14965
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29592-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,gmail.com,kernel.org,linaro.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,arm.com,vger.kernel.org,glider.be,bp.renesas.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,glider.be:email,bp.renesas.com:dkim,das.au:url]
X-Rspamd-Queue-Id: 2776A2A809D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

Thanks for your patch.

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Tuesday, March 17, 2026 11:21 AM
> To: biju.das.au <biju.das.au@gmail.com>; John Madieu
> <john.madieu.xa@bp.renesas.com>; Rafael J. Wysocki <rafael@kernel.org>;
> Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Zhang Rui <rui.zhang@intel.com>; Lukasz Luba <lukasz.luba@arm.com>;
> linux-pm@vger.kernel.org; linux-kernel@vger.kernel.org; Geert Uytterhoeve=
n
> <geert+renesas@glider.be>; Prabhakar Mahadev Lad <prabhakar.mahadev-
> lad.rj@bp.renesas.com>; biju.das.au <biju.das.au@gmail.com>; linux-
> renesas-soc@vger.kernel.org
> Subject: RE: [PATCH] thermal: renesas: rzg3e: Drop unused kernel-doc
> comments
>=20
> Hi All,
>=20
> > -----Original Message-----
> > From: Biju <biju.das.au@gmail.com>
> > Sent: 08 February 2026 09:29
> > Subject: [PATCH] thermal: renesas: rzg3e: Drop unused kernel-doc
> comments
> >
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Drop unused kernel-doc comments from struct rzg3e_thermal_priv.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  drivers/thermal/renesas/rzg3e_thermal.c | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/thermal/renesas/rzg3e_thermal.c
> b/drivers/thermal/renesas/rzg3e_thermal.c
> > index dde021e283b7..086bd3da10e1 100644
> > --- a/drivers/thermal/renesas/rzg3e_thermal.c
> > +++ b/drivers/thermal/renesas/rzg3e_thermal.c
> > @@ -87,13 +87,11 @@ struct rzg3e_thermal_info {
> >   * struct rzg3e_thermal_priv - RZ/G3E TSU private data
> >   * @base: TSU register base
> >   * @dev: device pointer
> > - * @syscon: regmap for calibration values
> >   * @zone: thermal zone device
> >   * @rstc: reset control
> >   * @info: chip type specific information
> >   * @trmval0: calibration value 0 (b)
> >   * @trmval1: calibration value 1 (c)
> > - * @trim_offset: offset for trim registers in syscon
> >   * @lock: protects hardware access during conversions
> >   */
> >  struct rzg3e_thermal_priv {
> > --
> > 2.43.0
>=20
> Gentle ping.
>=20

Reviewed-by: John Madieu <john.madieu.xa@bp.renesas.com>

Regards,
John

> Cheers,
> Biju

