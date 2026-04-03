Return-Path: <linux-renesas-soc+bounces-30877-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PY9ODoS0GlQ2wYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30877-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 21:17:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5A9397965
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 21:17:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 154EF3013497
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 19:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B42003D5652;
	Fri,  3 Apr 2026 19:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="PUmmt12g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010029.outbound.protection.outlook.com [52.101.228.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DD435E94F;
	Fri,  3 Apr 2026 19:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775243740; cv=fail; b=n9uTfUPw8T5zIKNO3X35nO62W46Hzw4oNrUmwUqhl4qwUWHwVUDoZ+W2EbU8sOTD5X+S0QOe/G9A9WdXvNqYKXmhu9VcQZgMFs3MwTKiIA1+EgWjkIM+JVRzhwahKy/BJ05gSMrdlxbQAAmcUWw+EOS80dS9o2lignj+TVrR3k0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775243740; c=relaxed/simple;
	bh=voVE8j7LdcLcqNkG6KSSUhCq7I5RlOEcfbDbEMRcd+4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=r5bL5x8XCxiODAn5pPKEvCM9GniBxzYgTeMXNvXiZRgtsnObCmOIdIc2kKD5OXJ9ADLwP2vl1VZgXPfGU1mB+OKxR9pRQZGXX1++rZ0uYC3hVcJSd/KNAatZd+vML8mllFsniiSu9wunTsVjnjG7qjdp/abSf0jF9z+xI44wkFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=PUmmt12g; arc=fail smtp.client-ip=52.101.228.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pM0I5JDxdZNepddAAdcda/8fpriubuprug/BJwfUunu6qSGD8Ca/LRj+A6vpvmc5+H/eyRIcNaWBHH+NXanvSjSR00eJnZlsgjvb/fntfTWwVwio7NrFIFaCLDeRx9MbX93jeVX+QedT++hvOCkC2eLY5KYf6GwTr5VVGRNCD3VEGBD9Kh4iPPseeMFflnR7Cbq4hY/TsRABV7ikxhrxq9FUdyhcffV15pKpYjEySL3PfidKRBppiFI7In/9hKUhTnn+7uH4rSZYfm/bbU5ZIf8g9YhsmjQ2BltgUO81Ezw0q35hQwc3MEs5+WqvdNeakMt74cT/g57cqd4ziTtpag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8WbJoo1pQJwASxaIo53vHc7+0HdRaV5B4+tYoNoyFSI=;
 b=M0dovJVzByf3Ugq2DaNyy/x1WQNct0c4P8ntQxDAJb4Leaq7N6kLSy2QZC9vWPSQyEDOwpsoC9JacwoVzyPDqmnHAfn8Ykwal/bkP0lJQOzkKsP75wxfy7jWls+6fat9t7u6Cf83l+WVHbHVG8WHKSWyaDyBJYCKSCgtifGi+kyJOmq0pIV22NNlBvT1eSHj0dTvWt4Fs5XPrQQnvHvp5vyCl7AikCZlRd+KO78ruINTATO4F4LLuIAM/ZAig8jBtArVafBX5sOTx/LoBXwsXrfMbUUBUgI3dPg4OFeOHG6ErNR1IvEuC4kAd0RwBSdIvOcx7jaKksmCmO0DB4Ddjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WbJoo1pQJwASxaIo53vHc7+0HdRaV5B4+tYoNoyFSI=;
 b=PUmmt12g0+/uBXZAMfgxISTzDIx6rF4CNviEZEhKblz4gi7nNJpYnFXi+lRQQSH78gt+KUcaJrbHgE+10rcJCPJJVW3l6ktpq/G6OsUSi9fo+pczt7lkNuYzfFPeYzVXO9dCsZHfMpPKKoAyQ7BnSnvGbRAlQWVrWzEFz210JMo=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYCPR01MB10309.jpnprd01.prod.outlook.com (2603:1096:400:1eb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Fri, 3 Apr
 2026 19:15:36 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%4]) with mapi id 15.20.9769.016; Fri, 3 Apr 2026
 19:15:36 +0000
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
Subject: RE: [PATCh v3 07/14] ASoC: rsnd: ssui: Add RZ/G3E SSIU BUSIF support
Thread-Topic: [PATCh v3 07/14] ASoC: rsnd: ssui: Add RZ/G3E SSIU BUSIF support
Thread-Index: AQHcwr1eAr8EQI72Uku1/g2x622zDrXMDeWAgAGoRQA=
Date: Fri, 3 Apr 2026 19:15:36 +0000
Message-ID:
 <TY6PR01MB17377B57F41250DFB53472B9FFF5EA@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
 <20260402162436.12059-8-john.madieu.xa@bp.renesas.com>
 <a457c427-95bf-43be-84db-02144fcc2bd6@sirena.org.uk>
In-Reply-To: <a457c427-95bf-43be-84db-02144fcc2bd6@sirena.org.uk>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TYCPR01MB10309:EE_
x-ms-office365-filtering-correlation-id: 039b340e-8228-42ed-0fbb-08de91b56293
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 t4s2TYw3iZKq62ftt2JSFgP+TvY1ffU+rbM78bS1u93vX5h5oZYFnqpn+ihua0oJH++0xEK47kD5P5OIttW80FU8Yzvu1BU1dZtjc8rTwJZAx695oY/LWUfg2GkxWoRAp0E4hrpesxnFG9xFfD7PZySHXs2hfpHQxeFeA4dSpfBRK5ENkzyWYnXa1mUfVNSvlsNEs9RArgnmQ7PApjlLHkBmrwxDRkXPf0aJY4nylwH9gCoTH8UEh09vCimBVEWhHwx2u9Pk7cZ9YAtRwgqE0BZEi80K+M7g0XEN5eySNmLSrE8u5OhFSdFu8eysJrPtLwSNzXVHgU1KQgkGTJTcL9x1JRxfvgpm2Q8FexLGJSyMIcNbHgJs+YMOG3o1ekcUx0PlI6UtN5nL3R+msFSfRiz6C5YQZBA1aTZFYZe785jVegmOX/24MsKSWWDG8eaDdp9wem/E6QIf0bT/ildif+VoSmIX6eWzGf8ech2PWVhI0EMOJc2ui+gyhpls4cokXtIe+y532BdiVCGXw8NWjbyAGnWw8pAMIf+aRlNit7G6FTxs3qZorCLU2nX4OVWMoSB0IofE915ttPHsvcCXAVcBVqagG/7t49ZKoRj8AFOveoQoUOahPgg7fYIP82AA4At9eRM/EK+91Yn7J/nM0P5ATWix+0b2Dv1Vi99b3AxZe3CZwyBAxsB7BJSy8+KfQ71rKv2Q6ZQMqrwMlhs3vKmpfFFl/2qfDxLHtFactI7smzaIzRdqJqRxfPkVj+K1fPIwm98zD2JSCNDsSHZTaXi+n4wGGqFggYwvpTpdnG8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?dzWWkgNjOwTPYVMs2lBBxz4uP4GG6g2qEr0NbOi6jiZSkSXVX9eEG/um56ZE?=
 =?us-ascii?Q?+mozvi0Rb/r0ocVcZq4RtGUnGMJh+0Ma/nnyU55bHlR7z/9W484KeCqOJlr0?=
 =?us-ascii?Q?3JTBcrBHs4v8A7aije9yHVlTAR0AIeUwzrNjXtiYJWGwK1nkEuFwxhFq3uj3?=
 =?us-ascii?Q?BN1uYDxBjIxBT9iWEXhUZyi6jezCpcTYr0qgo9YsLjH46v46IIxxfuTHbJq8?=
 =?us-ascii?Q?JqRf5fZbaY7lrtRVquIdnZaMx/NR+skQYB/sBE04awvlAjT7QKd5jfFDHjcV?=
 =?us-ascii?Q?S3TfK4LrdS/Xjn5Y1GjL+lxtlGj7zjnd3TFg1g8q1qJ+HgAxBc5YDJ74N2JE?=
 =?us-ascii?Q?msYPMbThX1wU49raBmNL+2d9O3wRxun5/KSrXmiz0CtoB0ocUCP+LkeT2e1S?=
 =?us-ascii?Q?FWlS12DCAM12+T8ASLZJADgRaKyQ3TJTjSOQpBV2xzzukp+Kd60/DpPRcLXp?=
 =?us-ascii?Q?R8if7cACMM1wJSduXwKZ8GT3Q8GTWzGRJDdcGqQFto+qAoEWUXVXyLrtgEwU?=
 =?us-ascii?Q?oz/UI5AIfzF71B2OyrLv+aeF2om60oOxVbE83vywaaV6FON3Ali9dgNE+CHn?=
 =?us-ascii?Q?wLimjHv8E3OMEZiQzNxIUeb1iASSezMmQi1b1eb4/3FoTMjTNLQAKqq7nMpf?=
 =?us-ascii?Q?q0jxJMO1YA081TCwCtDnlps1r3A+/H1yNJuolu7qq9lT+wDbPYEq4HoPL3S3?=
 =?us-ascii?Q?UiHRMYPSc1KC6twNtckRkf41CjvGYfWQXs28xdd4Yo4voUhS9vS9Zlg5PlaV?=
 =?us-ascii?Q?/IuafAS+fuGhfF55aEQoNu0/O88rYHYzinkiFOYVSj1yBXBsonmnrxgVSY0t?=
 =?us-ascii?Q?M0hePOzm3UOyQr0vz/3P51FEPUmBgB4VubMBvYR7DFdg/7K33qw7KMBDsFsy?=
 =?us-ascii?Q?p6AWc/i4OWStTysrqDl8RdrgJVKLCZbKwNUSeGVulwocyWU7TmAQqgd+LrMV?=
 =?us-ascii?Q?MQ8nH2dgWLDf7ptbCy/dlJzfecW304ZT/gbEZyTQNZyGzD0Ku7g913Q/nquv?=
 =?us-ascii?Q?LFy7YaSwlTSRshCwi8jOfOXuHTYNI+7L8i+/N18RdW4oLdGWVJMTpHEKldEN?=
 =?us-ascii?Q?m/WlHsB3m/Cnga6w6l8dbtg6stGJSiWYv3EKpI9LTaOeDI7dbGJ4uydk8AWF?=
 =?us-ascii?Q?rQceVKGERu8iqgIbkaJiG8qiNQIjYMRABV70j1brPkN7xvt3T/py2WvAyyJc?=
 =?us-ascii?Q?zRsBpkDVzaEt8uZWVU0/MAakOhUZXNYekGe2lbIA1idkyTLPsxULjDeXTEBY?=
 =?us-ascii?Q?MEi4f4UQ6FlkofLxOFJFpJ8OrSxLTKwqZdK+PrpKGlcSjbuijn88i6n2t0ci?=
 =?us-ascii?Q?5N935MwHm8m7OSlOSHX9/Lj6Xu3RBri6X47tSMmB/x91dl0oo0CXPYyH3oEl?=
 =?us-ascii?Q?9tTopaTwLiWqF7KDoFQZ1U4NCEdFO3lENrziLZIIGmlbX1rCgJqJ0zLauvvs?=
 =?us-ascii?Q?03pJbv3936e3WM8b2fHuenzZlWFSwbGm1pZeiA9muAR5cNbRilcpUxUUGSx8?=
 =?us-ascii?Q?cOT1Xav98tjdJky5HNYd0z5UtJgZrXUzQQo64S7jkMwtQqHROemHeAiWSk0+?=
 =?us-ascii?Q?rQjwlzsx3g2S4fyk+QBkUug9qGRwqB+gahrbIPqfPUiB+7jlu5M7xG4nvMxv?=
 =?us-ascii?Q?vGjhpLRRmj8d+97T/wZ12CYBKNNKiRbX5WZ7DhgFjQKGtEkSIXMaYCu3YEh0?=
 =?us-ascii?Q?pr7sBwi1t6JMB7xM9BJJN9mOzd/4wXM743m4O9XLrt0EZkK73YvZWwpLz5R2?=
 =?us-ascii?Q?vSyUv5vWP1gZh4LzbEs+a9exrNkXsZQ=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 039b340e-8228-42ed-0fbb-08de91b56293
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2026 19:15:36.1715
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nMKbFfMmR/mVHmrH65QZlOtIMG4mwfL5OqdH9lNu4VjAQefqa1HNMNoRLdcX8I/FK1ALE4J56QuDZa5OR0pCtWnXZLK3NDJumkFlWM1+S4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10309
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30877-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,TY6PR01MB17377.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 3E5A9397965
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mark,

Thanks for your review.

> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Thursday, April 2, 2026 7:54 PM
> To: John Madieu <john.madieu.xa@bp.renesas.com>
> Subject: Re: [PATCh v3 07/14] ASoC: rsnd: ssui: Add RZ/G3E SSIU BUSIF
> support
>=20
> On Thu, Apr 02, 2026 at 06:24:29PM +0200, John Madieu wrote:
>=20
> > Rather than scattering SoC-specific checks across functional code,
> > introduce an extra capability flags in the match data:
>=20
> >  bool rsnd_ssiu_busif_err_status_clear(struct rsnd_mod *mod)  {
> > +	struct rsnd_priv *priv =3D rsnd_mod_to_priv(mod);
>=20
> There's a priv already in the if (status) check in the loop in this
> function.

Right. I'll remove it in v4.

>=20
> > @@ -160,7 +161,8 @@ static int rsnd_ssiu_init(struct rsnd_mod *mod,
> >  	/*
> >  	 * SSI_MODE0
> >  	 */
> > -	rsnd_mod_bset(mod, SSI_MODE0, (1 << id), !use_busif << id);
> > +	if (!rsnd_is_rzg3e(priv))
> > +		rsnd_mod_bset(mod, SSI_MODE0, (1 << id), !use_busif << id);
>=20
> Perhaps should be a capability flag like the changelog said?

I'll update the changelog to accurately describe things.

>=20
> > +	/* Acquire shared reset once for all SSIU modules */
> > +	rstc =3D devm_reset_control_get_optional_shared(dev, "ssi-all");
> > +	if (IS_ERR(rstc))
> > +		rstc =3D NULL;
>=20
> This just ignores actual errors, including -EPROBE_DEFER.  I would expect
> us to report all errors as normal, the reset API will already return NULL
> for genuinely absent resets.

Indeed. I'll properly propagate the error via dev_err_probe() instead.

Regards,
John

