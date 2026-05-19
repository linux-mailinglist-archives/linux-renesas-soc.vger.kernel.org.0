Return-Path: <linux-renesas-soc+bounces-32805-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EJAMchcDGrMgAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32805-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 14:51:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4240657F03F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 14:51:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A306E308394B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 12:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32A1E4E3763;
	Tue, 19 May 2026 12:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="SbAqgK2P"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010046.outbound.protection.outlook.com [52.101.229.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BC94DC540;
	Tue, 19 May 2026 12:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779194789; cv=fail; b=uAWVV/3+ExWElI4FAn18oGJgYJZv79aU6LOpcS0WcDQAPcIilE/gUcWwZUSPB4BYTWCKWuBWUDP7AiMUJIVSy133n0qMzrstKmPOhxwT9NlHplaP13efnzqTjo6aNuoHlJEMmZD1DcU55Hfk1htTSJPRO1oKdFZgmVWaBATOkY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779194789; c=relaxed/simple;
	bh=EG/f+ej1tFdqEIKq4S/3xCNW+5rcR3hJyZU/8I9sigQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DfrCyP6awI499A335Kdtz/eFY53+vByvs9n2W4yR27YOTMinTZ23lhMvoJlGjbJKd/ZaPSM28bZghkemaOsbWz0Ro/AqzbO2ikuN17hwPXu9QXmBdMvnX6Rd/od5yB8+jIsP3FgJh+aKsrIesvECvRhWIScHvNX2h8XEw6dpID4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=SbAqgK2P; arc=fail smtp.client-ip=52.101.229.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YZrBON7tAqhzmDnDngQJOXwuwqs0PXAGl7lRD2qH043O5SwvF/M2y8eZbbtMkfMlhHOQo7hkI49x7vR35uO5mTHqjYlZkzKrehlFvbF0ilVGGmJTojFGy035KC7IR1mDNlA8+AVctFSijkhLiX6y2eeQX0EHp2MLQLNh671iOFIDCgdai7FQ7C9J/mr9T3XJloQ/sCN9LROCwerZvGSEHod+dXNvsHsiFA0gFaB10swq+flQzfP3i/6LYlJHvxUIEeL20jXWBJLvNrIni3fL6Fj/cDAH6kch0sGz56mHATeMRMJMQwJZm8FM/ZINXWNTRcZMfwRY5emDPgMdnYp5Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1/ZI5TdirXSVSkQ6N4dNytvlWno0afDEgUzhqxevPc=;
 b=LOKCVp705g0+CWQCEz6/YlAsHIMJTimp7wozGMLV4F/hnA+9dbaiEonwDngLM3PE6Tx3JSwGy2h6ZOQpQldIvvM/A9exwlpuKBeUW1Pp4p5XjQOK2lD9vCxQSWBcwdgETyStpBaQGdDBGWYm/0ZfvJAZBahfXuA/YFVDCYy2ZiifhTKxfqL5vKrMpr2ePtx8LiVPI+sIwb52TjOnyl1om0LKf6kREpu8AAJhbowIeB51na34jU7gYZVlejbfmfULaL8ypnKLkoCmcB/FG9fLiCztuR28WhzZEj6CZBMkPCgBjCSxv1cXJd4rCyshfGXklUOHSbQQeEX+1Mfg9tmKGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1/ZI5TdirXSVSkQ6N4dNytvlWno0afDEgUzhqxevPc=;
 b=SbAqgK2PR1siwDWDa89fTOj9488muPfVaWUp1NIDe6btB0S/nhoKrPwEZcwRa2+Wm3COri7nUMBBhreBSMG9i468PwH8eY+Fd3FIDNtxdIF7a/c1EVnGdd6k7kly6UNb1tPdTc67dvyz+N1RYNZdzXRp7mwXpYBI9Bj3U4IOohk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB10503.jpnprd01.prod.outlook.com (2603:1096:400:314::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 12:46:23 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 12:46:18 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
CC: Brian Masney <bmasney@redhat.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v2 0/3] clk: renesas: rzg2l: Unify SAM PLL configuration
 macros
Thread-Topic: [PATCH v2 0/3] clk: renesas: rzg2l: Unify SAM PLL configuration
 macros
Thread-Index: AQHc5qphcw57ZoK6/kGZK5TkHVVze7YVTMnA
Date: Tue, 19 May 2026 12:46:17 +0000
Message-ID:
 <TY3PR01MB113468F9A9F4483D6EC68D14886002@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260518094027.95700-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260518094027.95700-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB10503:EE_
x-ms-office365-filtering-correlation-id: 64aa926e-edf6-413f-634b-08deb5a49f01
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|11063799006|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 Xg8HIJloWUfga1dKQkAKPuHgIbJLWMpGdlcgQSsy0P+motV7sumxpORwJWCj+UXvDvkeal90z7xcSENI++BzY8+kmG2HYpeD3z65VpnpDgFF86fl46vF5O0CLjLovuehObOTdUnwSynL8I+ds4QTg82HDBVFS4+3k/UORy3FT02bRvllrIf6deJho1qDLKFw1eZ6Hrn5JxqYxTQ+CMfl0t0H8mo1Sn5RiRpCEwH5pz+nXDREjjrOuTa0vC+c2Od58+75n3PrHRnX9sBE/g9XEHpXWsKgdsqoBLuhw0sk+gtDM31TKlAxYd+jgrnyENtaRPoFKBDCUm3GlXxB1IqEFOwx7IrY22Bvv7VmORbUjg6uAlHZx7YQdQSkUyKeC0iGQgmPyMXg2Pr/lcxVrpm1CCy3yxb88P7XyqA3J/cmHKbKtcwA05YXyoXQRetmKL9LSACoddGAxGfpDvsS7Kc1OOlpyNl8Ah0pD0rgwqepVOup2kboTrrocGk0Py9EM+dV/ABkM9j+iJULcW9wh0F2qUEtzS5k9sxTEwEggY47i7iBSuqlodPHJXDMqzUZIgmcsv/9n1oM6cMQFGEQS8jyfvRCP3s0V8FzcD4jD7Px8I4jQn4TmlomtAdp4WY7MfiYNG3qGP330h6+d2gCxJGmgEjUrZGgRXOtFJ4p9/lBoCvf57WOgSmQTUHd+JReIdvukL9t7nZgdXcxmrzb/YHWaQFlcyjvqInnd6PYqsOrjK6bfK3Ro3843Nf5OlwJwhxb
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(11063799006)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?SSoB9fek55Danm6NHwopdi6aWA9Fr9R5SjvswEQtctqUfn3jV7EuNicOu5gZ?=
 =?us-ascii?Q?Aeg4tq639CG1eg5aR/ji1etp8EI8YWd/IRYo6Zho1m7t2JjT69GvQpxvlVEs?=
 =?us-ascii?Q?hw51P16WODtxViHdAJiqOqF9NadWL2lllTYSJKdCVzf0cLsEdrkFE0lOBJs0?=
 =?us-ascii?Q?bZJWohV71zh69of+ukH2JtykluVNIKRb2SekW+ABGlXgqVB+pMzD10rzXHyF?=
 =?us-ascii?Q?KTOmuLphlbfapphufE9JvriOtOp34wA37WxhykpSgVCEYJbmpcMpatt9+txC?=
 =?us-ascii?Q?TGELW9gJFLNo5DUsWL9LKgv8Ub1rcUUIpVrbznkSgY4F/tmvM9mZTA8PB24k?=
 =?us-ascii?Q?ZrY5DE6Y0Sw5JHOkBGA8NgFTwQfbdHIRFrnvCt2XDE02hPNbcaoWdLQi14+w?=
 =?us-ascii?Q?EvIXCxFSClx/ThfpjnLm6AXNa5nBC9Bf1GydAnzElyc/1DWE4BoMPR4OCJEm?=
 =?us-ascii?Q?HmHqm5xe1kixpk9mwyQVW3mqZAECwBX5hv3fIDBdVWf4LBrTv38r3H6waEOu?=
 =?us-ascii?Q?Azd0MiBIwBmHPRoBYTrxDTOcBMdpcrXzUzdi4eGJjZwtkcq4I10P/ckLiN9s?=
 =?us-ascii?Q?/u2UnJo95HxoST9a8kLthTLfvVpznHdCa/RYiV2Tv1fGLYQTGrQT3uVOccMh?=
 =?us-ascii?Q?WWhqgDuMvjfpBABlEtpUNixMlONsS9XJjAzluyajfid5zdNjvg5Iq0mHsFHZ?=
 =?us-ascii?Q?YlqYFxL/bOHvhKkcMjZpDbCtw80ArzX9e4DlnsBDB/thILAPzcqZ6RBHjkoW?=
 =?us-ascii?Q?ALZiCBSJHls5ysYixrTUAwsT8Yk6ZBEhtha65qcyuz/BdsdduFZa6NNaeOuz?=
 =?us-ascii?Q?jk6R3WlnwC9IiO5i5q4pgj419iLJeY93hLEP18EU2MyLf5zwsigeHlb/723Q?=
 =?us-ascii?Q?kENCVEhA5EOHupCTEmcOwsD0EwgXAJol9ORZMyG+SJn+2c5R/vzh/P2zdUW+?=
 =?us-ascii?Q?6ozP+Spqe5wKSW+phPiEo6giuuDPF6xN24wfrQg+QBHxAuEvZPcKl0xiMkH2?=
 =?us-ascii?Q?GI/x1uMoA3zSVLX1Pt+jyAFCr81GqvHbHklAwpW9E1bAvDX2eUwOfIij512+?=
 =?us-ascii?Q?yjIJ2XfgHGA8epkIz6JjXUy/c8KRRAWUCfDDO7ZSuthl80cEr1nCp/khwSEQ?=
 =?us-ascii?Q?l1slD1aBJ+4x9lgn92qGiRjj2lwBgIA/WtV/fvAds0oAERxLMt0WuBmaOMHW?=
 =?us-ascii?Q?SEf77oap4QMZkC5KCoBUmL0ERXNP5RRkuRkwJ3tlArRVkaIFTIw8+5oVA/xx?=
 =?us-ascii?Q?CboHN67lUm+8oXfVIwWfWJIZRGEg70wFom1VDcrjn1VobYdHZlRrcpvBU1pP?=
 =?us-ascii?Q?jqUMAun+wMUw9BlvNyF3kLTuqJfrDnNMXJu0d9Y1ofuD+BuZkCwBn5c1dxdF?=
 =?us-ascii?Q?u9TzG+RTJ06m7Rx78qYBFpgg8q630xIQejj+Am+qqqJz49EVd9TIas3b/i0U?=
 =?us-ascii?Q?/xiKN9q+3izOa8ZB4We91q8xZkLguJAfNXYCvxCTIv2FOuTguJgscKlkIsQ0?=
 =?us-ascii?Q?mA4McUSk2Z9iaDw3HKjkw5N+Gtu9fjlbGZ8Irvc+l2oHM943zAoHzf/b31jH?=
 =?us-ascii?Q?kxe/o9Mc/NHbH0SW35Tl+HhM0XcdHKVRC1//eRBaiy7DjusEPInvliKKVYD2?=
 =?us-ascii?Q?iYEqgTyeFpfSQIUp9zCNiSpB8t3QMFAcUhNvzxEGrP9gwQeBhfpHFGCYqwMZ?=
 =?us-ascii?Q?dggqgv7DvFo3zIlsB9Q40kDU73EeJvpogrReZnklQM1OscK3hxksesaUZ4H6?=
 =?us-ascii?Q?l1+8yN47ew=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64aa926e-edf6-413f-634b-08deb5a49f01
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 12:46:17.9691
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HvvN8suAq+nzS8ln4oKTbVKsrcwSVMHqbPCOHBXf2H0RTSXfbQH5hRgE7Xf/NIV9wV5vC3Pv8enFIJdAHX+t7T4DuchaIcbeICRxGQHrqPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10503
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-32805-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,glider.be,baylibre.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,vger.kernel.org,bp.renesas.com,gmail.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 4240657F03F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

I noticed that there is a patch conflict with renesas-clk/next for patch#2.
I will rebase and send v3. Sorry for the inconvenience.

Cheers,
Biju

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 18 May 2026 10:40
> Subject: [PATCH v2 0/3] clk: renesas: rzg2l: Unify SAM PLL configuration =
macros
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> This series cleans up and unifies the SAM PLL configuration macros across=
 the RZ/G2L, RZ/G3S, RZ/G3L,
> and RZ/V2M CPG drivers.
>=20
> Currently, each SoC family defines its own local macro for encoding PLL r=
egister offsets into a conf
> field (PLL146_CONF, G3S_PLL146_CONF, G3L_PLL1467_CONF, PLL4_CONF), and th=
e driver uses separate decode
> macros (GET_REG_SAMPLL_CLK1, GET_REG_SAMPLL_CLK2, GET_REG_SAMPLL_SETTING)=
 to retrieve register offsets
> at runtime. This leads to duplicated logic and implicit coupling between =
PLL index and register layout.
>=20
> The series introduces a pair of shared macros, CPG_SAM_PLL_CONF(stby) and=
 CPG_PLL_CONF(stby, setting),
> that encode only the standby offset and optional setting field. CLK1/CLK2=
 register offsets are then
> derived from the standby offset using fixed +0x4/+0x8 deltas via new CPG_=
PLL_*_OFFSET() helpers,
> removing the need for separate CLK1/CLK2 fields in the conf value.
>=20
> Finally, the RZG3L-prefixed STBY/MON macros are renamed to CPG-prefixed e=
quivalents to reflect their
> shared nature across SoC families.
>=20
> v1->v2:
>  * Dropped the dependency from the cover letter as the patch hits next.
>  * Collected the tag
>  * Updated commit description for patch#2.
>  * Fixed the macro RZG3L_PLL_STBY_OFFSET by using CPG_PLL_STBY_OFFSET.
>  * Moved CPG_PLL_STBY_{RESETB_WEN,RESETB} near to CPG_PLL_STBY_OFFSET.
>  * Reorderd the above macros
>  * Moved CPG_PLL_MON_{LOCK,RESETB} near to CPG_PLL_MON_OFFSET.
>  * Reorderd the above macros
>  * Dropped a blank line.
>=20
> Biju Das (3):
>   clk: renesas: rzg2l: Simplify SAM PLL configuration macro
>   clk: renesas: rzg3s/rzg3l: Simplify PLL configuration macro
>   clk: renesas: rzg2l: Rename RZG3L-prefixed PLL macros to CPG-prefixed
>     ones
>=20
>  drivers/clk/renesas/r9a07g043-cpg.c |  2 +-  drivers/clk/renesas/r9a07g0=
44-cpg.c |  2 +-
> drivers/clk/renesas/r9a08g045-cpg.c |  5 +---  drivers/clk/renesas/r9a08g=
046-cpg.c |  7 ++---
> drivers/clk/renesas/r9a09g011-cpg.c |  7 +----
>  drivers/clk/renesas/rzg2l-cpg.c     | 40 ++++++++++++++---------------
>  drivers/clk/renesas/rzg2l-cpg.h     |  7 ++---
>  7 files changed, 28 insertions(+), 42 deletions(-)
>=20
> --
> 2.43.0


