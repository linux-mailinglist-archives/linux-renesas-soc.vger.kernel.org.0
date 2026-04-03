Return-Path: <linux-renesas-soc+bounces-30868-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHs5N1Tvz2mt1wYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30868-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 18:48:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E69396952
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 18:48:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4AFCB3047422
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 16:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87BB3CCFBB;
	Fri,  3 Apr 2026 16:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hUVMVvp0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011010.outbound.protection.outlook.com [52.101.125.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BFE3CB2C1;
	Fri,  3 Apr 2026 16:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775234726; cv=fail; b=uiEJQ5/V44+liN1i/dBkC/urkA1bHd8Y5floxb3/+M73TMKKvyR32MQxWoWabxu4rRXYYZFTQuWfm+3djNz9Z90dyseZxlznv1oDeUpcE4R2tKhs3/Cx1FvtWUU6rjm4efBpr9S1sOf4QcfVdEURsgBns0yiSoGKBBYqbBz1uc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775234726; c=relaxed/simple;
	bh=17FInFN6VaU0jSsmLmeiJk5WW+7VRvgEHlutXS6orLg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XWw+csjtE/Ev3XWS5kRb0Gky1bjLwVaSScEFUbWAroWesU26KhSgLOdj975pICkzATQcSxcCZieHM02y7RrcOMKQRkeJvMhd5ANxvtcgRhPl37PmBC+Wu8ZUBVw5Kn/oxidDQhQlLaPWBemP2tI/J57rwZD/a1pj6GARuAquQYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=hUVMVvp0; arc=fail smtp.client-ip=52.101.125.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KUT92gIxXd887slFXk05RsAcn9RKEDe2efA3PSXI7yGfTi3hgDVSlqD6DgCmEO0GJZOKJB6skXljYjQIKZ9t6snOqkB98yXP5L5hKXoJQoMQT7c4/VahaKQh6Def957LJH/UZOSKZUQ+Xh9q+LN6pit4IzH8ar6NI1LOIDkQD3eduvQb9iQ5pCmaS04HiVKO85XT/JbSVu01Ewk0sHx8qAtRykS+CAr++dC/9kI73r/Ebksl11Mlw8fGw1oUmxVHTciiEpqPAShL+QDIpJItu6dtQVojnIN+iJjKakXaWVCe/LRsKC83e8VQh1JNhVdMHC0/7NzOBbYS73QXoYiITQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sf0hVozdBd5GxOqBe0Po9Ecwtd/RDpWIlcil/HVt7Kw=;
 b=RLRAwbj0XHwcxeuXPzTgmgjRwvkJrXnQARdEnhqwllyRF2bHwHiZiWKgrJqSGfccYlFy4+60YnkEYntPbPNk2k1yZf24rrGPMdZSDsFBKI15T2hs8MOpUgezPaCVD8fuT54lP6PqUcg44dvh/UV2DPJMznVBJrQPEBCrtB8w3Uao8HDAM46Nwt3jP0HbDXtyiwmW7LFcBuBuN8uOaY10T4pL1R2N87bMeBiMudoJBfGslV+bxJPYWYUOKtOTahvgmt/IFr6Ypoy8pUfaEHXPBLXNSUWYYvIPJzJRBbTPivsgkZ53UQHPU3rfsFGknW3vvow1rkmWEFqFdW0LLcN3+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sf0hVozdBd5GxOqBe0Po9Ecwtd/RDpWIlcil/HVt7Kw=;
 b=hUVMVvp0QrIjFjvqPTpRFThXOZAnLYhIUYOKyzvIlBuFDmUErxhP0xfLsgIB2a5n3odnekmbhh0MUQlJLuXakUCUN7JAIPCPQIZyfPScWXCk/tgYd3c+oMJJD7voxY4a2yALa/dDZswJI4ZwPAk6EIcSul7iNli/89nvycAObLs=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TY6PR01MB17409.jpnprd01.prod.outlook.com (2603:1096:405:362::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Fri, 3 Apr
 2026 16:45:21 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%4]) with mapi id 15.20.9769.016; Fri, 3 Apr 2026
 16:45:21 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Mark Brown <broonie@kernel.org>
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, magnus.damm <magnus.damm@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Biju Das
	<biju.das.jz@bp.renesas.com>, "john.madieu@gmail.com"
	<john.madieu@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCh v3 03/14] ASoC: rsnd: Add reset controller support to
 rsnd_mod
Thread-Topic: [PATCh v3 03/14] ASoC: rsnd: Add reset controller support to
 rsnd_mod
Thread-Index: AQHcwr1R5VPrlEh4ikOWMufBbz7llbXMCboAgAGCgyA=
Date: Fri, 3 Apr 2026 16:45:21 +0000
Message-ID:
 <TY6PR01MB17377D2EC3745B2B06B3D353FFF5EA@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
 <20260402162436.12059-4-john.madieu.xa@bp.renesas.com>
 <9d1e09af-ca2a-462f-90e0-ce7557f361d0@sirena.org.uk>
In-Reply-To: <9d1e09af-ca2a-462f-90e0-ce7557f361d0@sirena.org.uk>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TY6PR01MB17409:EE_
x-ms-office365-filtering-correlation-id: 67cb6c50-dc64-4303-c0af-08de91a06532
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 +g3rPdijt7FZ9KyKPE3n3vK1sERW8MfB/4ND5uz/ERB/N/6ISVKSfqVeazH1xTWI/ip7eV00BP/sIpBbz3Jegi4FjpeSOBdBXxFHa+u3dnFtqsktzwhzXWYYSWPHaJwBetItxaLwTngKBZkOv2VsFPGQh4tDAaazMOsBx5ayTyvXmF6/HOjFfsTGDP74kUx2wbQhUaDVIl/VhcZpBmS4INvWL6TcHfATiLLNtA425BsSc+60yLAMkKJZ95Om6x0CCR8Gk6Q5zbdy1A0bVnd2eliYjpzo1x80rUjsmlkMfW/jSf2WypX2oU883d6yQCu+h0ssIH6XYeYIlREwkZBPPyrlPwnQmkHAjldZN8Ih5zbua0Q0LKL20YtSRJzo3Hx2gVJQRIHs3DQzFcdgjfyBp1g1Ey+Lv2jjJeAW4uQw1X0pJToJtYjT2Qm3ayJhRXPrvGLY3TAsg0K8OVif5XM+wlC1EMA4Go/wX8tb2WlIJiAbE25lGZ0gWFF7k0uy+T4tKCFuGoJFm++9dgFH7xqQf+vCGNbWF0eNbNHsYzXZ2Y9Wkk7xPEB/7b5L7RDIKwMFtIA+0L3z6v0ef/nZO+wVIM1OKrDARCqAp8cTtWURA7dj2pVBc3+3atX1RxeEJaW9ucYAGbIml/Jbm4QVdOP6/yoZaFS3guqNgSvMgZtaPk6AnHjPetTWWuspn4zAIAne3oDgeTYrLbJYc1DXGyj0TeJZyEHEXG6RAJ1r1FYWOCtX1PL24BLo8kKu+WJKFukhpeycy2+0llNbCz4x4zTw/nuXl0kOdaenfNxGN2ywats=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?u1ZyvyhYc50ly529IhkagPnGTo1OWH3vz0rip2pLDtjl8zVP+wc/lx1/K8/1?=
 =?us-ascii?Q?9lEePbZky2X4biICbiCFUt4x2Tq2ldUFRHTkK0X/ELpPgMTLhjmrFwo3oyQH?=
 =?us-ascii?Q?Wafmju4S5c1eZLSRwD7iseebtS7PHk/xIC6HcBjbqMZwqXAamCZCnsbVZWWd?=
 =?us-ascii?Q?NTBwmd5G/9M5pjJ/mX8Z2dXP3yCedB8Ya5XL2MfPAgiHrSahp0eSUj0smxij?=
 =?us-ascii?Q?dl1JiZR5nSrlDQYiWvjdy+W8p76zzLTAw6OBRbD4WFrGtOaoNCOmJVl06ZYD?=
 =?us-ascii?Q?zaTr1klj/A5bhQllcLsBO1bAa4h/UUScmH3KKWOkzDGx8kHL4ukuIOUAS0SK?=
 =?us-ascii?Q?BLD8R6YcnIKuTHoaivebTu0kuxOPVU2+3fpg4hbe/OAZwD+IzW1HnHtWU/rl?=
 =?us-ascii?Q?Scy+XhtWYyTxExsrtEVD9hVWS6YXcKXGeGW7P/I1iMZMu3axesxE+I1TQqs8?=
 =?us-ascii?Q?cuBOfnuqVPmV72LDJrjfe1iKhk9WX/1N/O5R4OuDTERQHLDTqofX22/CRC55?=
 =?us-ascii?Q?rRJAEncqHwlS2PdcY4K27Y/Kxd8RngFGZ0JPxAjyZZ5ObEZOyFVhv0bcrBzo?=
 =?us-ascii?Q?98YHYwwZCLG74cB3XkqSpXTHS5yskAQ171Bmoqe2ngnviJs3RLoRlGsFvkX1?=
 =?us-ascii?Q?XkBPO4bebSzTyHX9yt0z+1yuKrWn6RYDEIObY5Zdu15u2XvKgtIaWNl7UFSJ?=
 =?us-ascii?Q?rUGlNZh3p2azMCv3pYTmoODQo/Rd3T4HmEUL1zxArqkvtgjsebjNKBuZF5SC?=
 =?us-ascii?Q?CLGzQD7AnCba98Zvw1mufPOexDz97OuLwJCocxKYIt76Pbzn7mrU5gtPO/df?=
 =?us-ascii?Q?9cNqbHFfKmp+fCxuPJNXN7Ty3lIO5IaPs3E/F8SOatWlh1IgxMvtANrfZP4J?=
 =?us-ascii?Q?GTYOqZt6OP7ScjYpbT6use+jG/vosLzwUtJqPdFmxFJQn9ZRQKVxUDhfdoKw?=
 =?us-ascii?Q?8/y4Yb5Tfj7BO9QafbwNDHP75G6WeOrj/8r/V0QNv38V7iI779Sr6zlZp3AW?=
 =?us-ascii?Q?8IYCE7giy7Zb2sluRhw5hl2Cw9GpUxR4g/cjyiqI7YcsclEKSdbjhFBRz2l/?=
 =?us-ascii?Q?hBtV4GVVfkEoAhOzRmiChoggTUojEZUlKd3iUGaif4NwWzqdIvakq7NgRfaD?=
 =?us-ascii?Q?gVw+QlY4faTzsHVykTttIiwEZOcyjwKwxwtt+CDrqvkclSju4a9sAdBl5pTd?=
 =?us-ascii?Q?gEGLGCB9C0O1GHNuCcRUglq9HvVYZmgpH++XKcGkB7MocVbId6NXmykcFSWA?=
 =?us-ascii?Q?FaRqdRR7X0Lz9hManRe0RlS3UMRm1rdGRvfb2f60elFlcsWxLLHpopqrDQGH?=
 =?us-ascii?Q?o85vNlWNwaHFFyfNRVGmDYmdlMQ/VVNwWGg3lHnnLPh/K6dNQs0XMyNbY+55?=
 =?us-ascii?Q?5AGGZzl67Xp3UddtCUMYqNFR4awih6vrJSq5waQUTUNJCMTpv4Z+Q3Q0rdF/?=
 =?us-ascii?Q?WouMfN77UIaQmR0iQ1ggvFqJljT/KBA+Z30np64lG5Kuxw66q2TRTB2SaovK?=
 =?us-ascii?Q?owvu5slfoNFgVDnhn2wN4JBb88eZudF0pgdAqbcd3Q1k/zJWHYU/iXYIe1W+?=
 =?us-ascii?Q?BGFotNTRxzmYjtoj5fKX5dY4e6KYmKrrNRgEmgJwY3iAJihf7LidQ73ItYTY?=
 =?us-ascii?Q?tS2Jj3Xdbn8Okl2NtA21vAIS9hgLYxAtfP7TxlWDrBpje7HXwudm2DygnkRq?=
 =?us-ascii?Q?v7tjkVexg+XvdO5/8Jr4ZjkNi4x+jkZhX85UjO58cFdkUNlyDTRlVpWGXu1b?=
 =?us-ascii?Q?/AwAVuYqDo33itxZwaWKccIMH38mgQE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 67cb6c50-dc64-4303-c0af-08de91a06532
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2026 16:45:21.1411
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uUQzUdLgsE3W00eiDaTbwa73FC6noXk5IsLnowlJEuIU+WW+0DLgBhFeNFMantwnGHr5NW4RrLhsyIV+dVgu7L52eA6mX6BP+4grBNVrG8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY6PR01MB17409
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30868-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[renesas.com,gmail.com,glider.be,kernel.org,perex.cz,suse.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:dkim,renesas.com:email]
X-Rspamd-Queue-Id: 85E69396952
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mark,

Thanks for your review.

> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Thursday, April 2, 2026 7:39 PM
> To: John Madieu <john.madieu.xa@bp.renesas.com>
> Subject: Re: [PATCh v3 03/14] ASoC: rsnd: Add reset controller support to
> rsnd_mod
>=20
> On Thu, Apr 02, 2026 at 06:24:25PM +0200, John Madieu wrote:
>=20
> > @@ -196,18 +197,29 @@ int rsnd_mod_init(struct rsnd_priv *priv,
>=20
> > +	ret =3D reset_control_deassert(rstc);
> > +	if (ret) {
> > +		clk_disable_unprepare(clk);
> > +		return ret;
> > +	}
>=20
> I'm not seeing a call to reverse this anywhere, I'd expect one on remove
> for symmetry and safety.

You are right. I'll address that with reset_control_assert() in
rsnd_mod_quit() to mirror the deassert done in init.

Regards,
John



