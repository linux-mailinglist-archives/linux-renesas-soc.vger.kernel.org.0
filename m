Return-Path: <linux-renesas-soc+bounces-1750-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A85F483A425
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 09:31:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3485A1F21AAB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 08:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD0E17552;
	Wed, 24 Jan 2024 08:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="wgQ9es+a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2106.outbound.protection.outlook.com [40.107.114.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CA6171C9;
	Wed, 24 Jan 2024 08:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706085074; cv=fail; b=K+Rg+9yZuhdGFH4tJgrqkPxInlsGyPuybAXyHRXcyi8lxuMDOiWN0zeWBpAyPS7NDjTJukDTmEmN2EvW/zJUdpaLmGgbw1br2hYreZRG4rVFiHPqUhUCypCzTNqNJ1o2FJrcfyzoi1YUR7DeIt0AtHveLXGhHVQjRtPYy3iEjm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706085074; c=relaxed/simple;
	bh=26UcZDUFcSwRbIJMA+rKGmjLe1X0ANtNxMFhnGzou3w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HIdcCxQv/kChhwd935Qm9jKh3ftTUHYaFIL1GnFlJvaNqS7egspE3D9ZKVN/o5QxJpov09tTqqwTTfauqfEs8GJChMCV3F9xJVvYtPwmVHnhyMf1o/Y3WxCwI74Wt6OBj/Dn+5Ghku2QLLiWl79cP45kDe6HEUhGxZfjS9LB6g8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=wgQ9es+a; arc=fail smtp.client-ip=40.107.114.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dR18b+55i6wkP9YRqkH9QSbn5JkEGfOsnFlu764tZPfdYXvYb/jtZ4sa4NWK/eun0BkDFJGu3+xsAUMTB75rRhzdBYCxY0qJRz52Lmf4LmHMUhzlexjh8kaQEHsurNzvZNWwgeyegwiN65E3TMoHGivr0jAb8O35mifdrPZxKVbrlWdLxG15Dy8Odynwxh9Rtch22Z8dz8mavuizqmzEZ9E6jNyKvD2Z8ozotrTYsdzcY6ncHGxUUbpZxbDKoX0cOrleORWZQSTF7riAK2YSFYtFhqugiNtmO3y8SVFpxc749/8h5QU/UTcskq0PquONLuMKlD/3xNmTMzDcgxb4/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XR2w+Nn6+zHixCXCs78S/OfFQalNyfkJ5VEdkMojgBk=;
 b=KUnfTxrnS0+52nNwtwlBFumCM+wzpv03GnCerqfHgkzhNe3M4PKgp4XqFMtR5h8ReZouj/weZjPxtlaXuMiS5oXlJyoCgkLmKW2hwkGZxfM4HCIn4OypAUMo/5q2Hr8T/Z7AYloI4xbwanOgfyUTaNujY+bZUIlHQNY1M3ZWK3wGwdIFjFn1ulNBOhZsKZqNCvfcncU8QwnUqkP4whGGsKZbfrkBQm/HVgbvYKh/p0WIFw2MnESEfCEYFOTEQXR6o3SqOMWS9f6yFGdab+HTHQ5QB1+kFuxjhGHgECfjLgrLqQv12gwt5uY88CZ6lyita/0EnI0BaEnr/+7sf20TWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XR2w+Nn6+zHixCXCs78S/OfFQalNyfkJ5VEdkMojgBk=;
 b=wgQ9es+a0iwrhwGHZmwmjWrEtIguo+m3Bze6GcNAcktSiS29nfW7t0H8fs598tgLa25X0idZOXX+thjL0XFeK9J0gmP0/eC0SW5Lq7q/0G9NmjoPe2jJE6CMVLCfU7tZUJXEzc3K92BONpp66BkAKokROgXeydLVGkzxXdVaCgs=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYVPR01MB10895.jpnprd01.prod.outlook.com
 (2603:1096:400:299::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.16; Wed, 24 Jan
 2024 08:31:06 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78%5]) with mapi id 15.20.7228.022; Wed, 24 Jan 2024
 08:31:06 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Sergey Shtylyov
	<s.shtylyov@omp.ru>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, nikita.yoush
	<nikita.yoush@cogentembedded.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH net-next 1/2] ravb: Add Rx checksum offload support
Thread-Topic: [PATCH net-next 1/2] ravb: Add Rx checksum offload support
Thread-Index: AQHaTg+VEjiH3LyFqkWrw8nn5AoY4rDoJ82AgAB63UA=
Date: Wed, 24 Jan 2024 08:31:06 +0000
Message-ID:
 <TYCPR01MB11269BEF48F2C2C111C91858A867B2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240123151924.373917-1-biju.das.jz@bp.renesas.com>
	<20240123151924.373917-2-biju.das.jz@bp.renesas.com>
 <20240123170921.51089d41@kernel.org>
In-Reply-To: <20240123170921.51089d41@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYVPR01MB10895:EE_
x-ms-office365-filtering-correlation-id: 4f1558c1-7f8c-40e7-0db9-08dc1cb6cf4b
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Tn/u89ObryloL7SGvU8IylcDgVj0lZQD1NXMSqpj8Q2Ogfrwkb0sih57lUgB18/O5sG30y99SW5VQCu1OL6NmzXBhHsY4vggCjWdjVq0B/bIPp6tgx3ccR89QIcUNP+91toTdNot7CegSWE9X2uPT6T8UNlW9Ej/LmHbT/hDf60K3vfTwEhrdRxnFm+LOmSzoBL1Tq0jJO9DSq2LR9kxzBBArlCJD+IhpWT7qRwcJDJ4DVJdtQFdHBX2ra2CrPN37Atin7iAOWOYf4CMBwU4IERLlg5b77g4AscFuLwAEHLWHfVVb/IOGZz/EZrNvUvmh9AvmONei4+n0zGSsjMFVHKokKWTpRWJtWSEvVvvshhetTpKkDhVrvpPwxG5e5OVokK0nUvk3pDDrsmTc3n5guwSbes+0cNniYEvSfGre1l9ovkcqYqG6Hy0KTxSMnZTPZpTHYt0H3VoqfOd07xpgpI0A6aK65gIYJUTkxYRi1mXmVwoBVEzVkKzX/NzWsAPtUCaE9HLUdACdFkCy/fScoEssCn8SAWM7AhW01kTw85yNCbZ/OcJZXVg4tC4bC+tLKxk4r88Aj8KHcPDaEQ+20snVcVmV4ZXbcAk720bM9SWp19LmSQGPQNzB0NVRFAMaBQ3lnhW1WDYwKN6/qcr3Hr3x+CDHNAkynEO2BbKPus=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(376002)(136003)(366004)(346002)(230922051799003)(230173577357003)(230273577357003)(64100799003)(1800799012)(186009)(451199024)(38070700009)(55016003)(41300700001)(83380400001)(33656002)(86362001)(122000001)(9686003)(8936002)(26005)(8676002)(53546011)(6916009)(52536014)(6506007)(66556008)(5660300002)(478600001)(76116006)(316002)(66946007)(66476007)(54906003)(2906002)(64756008)(66446008)(71200400001)(7696005)(7416002)(38100700002)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?3vpB7CtLdjwrQd5wB0tQ2TX815DISLiE4Qn+q1V8lN8tAxJYy69MH4AAFHIY?=
 =?us-ascii?Q?TjfN0GfsLkw1BUHRih3buMHKhIMFHxCCAlpbxzq4SNl0t6pe4XJMl/LnYJ67?=
 =?us-ascii?Q?BPk6u9qtubSmHxuJgnfmTAzZKb9UnOkJTN7jf1OvQjUMqHLGbY0CIG4XziXU?=
 =?us-ascii?Q?pyW/Jn34Ndr9UQ67dtNfPpvpYClGzzl6q24LVhHVY8F8ky+c/7O0vgodF5a7?=
 =?us-ascii?Q?WwzMefh40eN+knhAHWIPXwohutR58TDwGb7OuS4REWtnWralethLbbOyUlLi?=
 =?us-ascii?Q?W2DRVQD5N0x7snFH6lin69Ch39T0yWb5o3A4qQqmtCWQaOEI1hSm6ynHe/Yb?=
 =?us-ascii?Q?dItswzsPha2zYgh7yWa4GtDwDtgmzsmvEcW1mS5p7YhP0UwZBs+hRk3v9mih?=
 =?us-ascii?Q?DVUg4bjhb7pjwhX8auw5kz8JBuo4mvxryQBAo9xgQbunqlDccwvRIaMZFFdH?=
 =?us-ascii?Q?QEYl1TWyk/IeUYV3755rcxjK1Q2zBwGZJkVz4yhkvOVJkxVC9Gi2u7Yl4QsL?=
 =?us-ascii?Q?/ZXy8UjiWVgKLgsXdnx1UASFPxHm0moGMqpnvZySytGf/MN+GTV2VqR/pF21?=
 =?us-ascii?Q?8gKMB/PWlP3Og60OP8vCUNnVfzzABA/7L017CxnM/AfmK+qwIwItmWCHUHGe?=
 =?us-ascii?Q?N7X2pjpfLf9eWNvE8J/xUc32INLHWnApfK4q0RorUOE/KR2j+/v2hULwm/7A?=
 =?us-ascii?Q?09fvFak5rZWEA2kqToskfVV4KYOtqQSSJ+6vcnlphVeDZgiPKqinjWWUR+2J?=
 =?us-ascii?Q?uCIvDGkwPSTq5fXeIpoaZ+IZZbuyLU1HkSaAZqtPvWNJWTxWfEry12Udume6?=
 =?us-ascii?Q?qwXCU6K26xaM0uTG36yzKLOFB9VM9lAGOhnnNlYMo69f3I5LegQmiTm98Rc+?=
 =?us-ascii?Q?m9XIkvcvrpypmPTg76gJYg8v3STi96gAPG17Wbvs1cHjejgJ40JqPDO24CjF?=
 =?us-ascii?Q?jax0cwkPUUWri5doqDszdWEtIkRnAeGZNd/eGG9jSU3Yy2+379TA/6q2eMW6?=
 =?us-ascii?Q?q+tEa/SYPbJ+mTyHg450qJxkY+axdJlWV/jtnDZmgwGDuF+c6tvZ0QvSMrmU?=
 =?us-ascii?Q?gy3bTvo0EtfNCtF73xHVo+hdgjwMFCQLlrBOa6EWydPBRrAcuGKW43xFN3F/?=
 =?us-ascii?Q?5PAL1clWQ50zvk3Ze5IhbIbvgEbPOaQs1PZrCZ1UWlIRlblqpahpY8shh+D+?=
 =?us-ascii?Q?eIGEnJuMGaH4vK9k/U60Ezvb/yjHaXaaGUAQb4qXZel/Mr2LOxEZf49gf4K/?=
 =?us-ascii?Q?9xAZXyOkaTRqp2Vggf19ksfyxp3ZrtCS1m2JHhavlstvuwOiwv7GycR4QMld?=
 =?us-ascii?Q?swxaOmq3aWIP/CaspH8Un0thmjkFXvqhc//wSHW0TJ9QIhU/geA96b65x8YV?=
 =?us-ascii?Q?Yn4URqDokPrxfuU2A+D0DbmLg0n76gjlxjnDRYm5kBtnQ040xuhBqnAzVK89?=
 =?us-ascii?Q?Op1p1BPh5RwEplqrf4PTU3NjM4ZFUqGwnLS+qwTYfGGSjVCfdUj53+vFxA7U?=
 =?us-ascii?Q?ihO2sHgKEVQPi4B/5VWlkFN405rOCh36rOA0hMoXxeZor3zERAF7oytLCSsF?=
 =?us-ascii?Q?FoEIFS/utMDwQOOMt3T3ONlKAnWrE0ALm35HU+5TlstWDIgyoJ5kdGSWDeaV?=
 =?us-ascii?Q?0Q=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f1558c1-7f8c-40e7-0db9-08dc1cb6cf4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2024 08:31:06.6963
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TJUKBvU6m8l2fLxPhZVpY661pvaZlNsNFNLpnq6iqI7p8c1b+9ASa60KwtLoaZ5IJKccD3ByEpHDAEBMKXgvaG2YwjiNdlKIqtc3NJH/jG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10895

Hi Jakub Kicinski,

Thanks for the feedback.

> -----Original Message-----
> From: Jakub Kicinski <kuba@kernel.org>
> Sent: Wednesday, January 24, 2024 1:09 AM
> Subject: Re: [PATCH net-next 1/2] ravb: Add Rx checksum offload support
>=20
> On Tue, 23 Jan 2024 15:19:23 +0000 Biju Das wrote:
> > +static void ravb_rx_csum_gbeth(struct sk_buff *skb) {
> > +	__sum16 csum_ip_hdr, csum_proto;
> > +	u8 *hw_csum;
> > +
> > +	/* The hardware checksum status is contained in sizeof(__sum16) * 2
> =3D 4
> > +	 * bytes appended to packet data. First 2 bytes is ip header csum
> and
> > +	 * last 2 bytes is protocol csum.
> > +	 */
> > +	if (unlikely(skb->len < sizeof(__sum16) * 2))
> > +		return;
> > +
> > +	hw_csum =3D skb_tail_pointer(skb) - sizeof(__sum16);
> > +	csum_proto =3D csum_unfold((__force
> > +__sum16)get_unaligned_le16(hw_csum));
> > +
> > +	hw_csum -=3D sizeof(__sum16);
> > +	csum_ip_hdr =3D csum_unfold((__force
> __sum16)get_unaligned_le16(hw_csum));
> > +	skb_trim(skb, skb->len - 2 * sizeof(__sum16));
> > +
> > +	/* TODO: IPV6 Rx csum */
> > +	if (skb->protocol =3D=3D htons(ETH_P_IP) && csum_ip_hdr =3D=3D
> TOE_RX_CSUM_OK &&
> > +	    csum_proto =3D=3D TOE_RX_CSUM_OK)
> > +		/* Hardware validated our checksum */
> > +		skb->ip_summed =3D CHECKSUM_UNNECESSARY; }
>=20
> sparse does not seem to be onboard:
>=20
> drivers/net/ethernet/renesas/ravb_main.c:771:20: warning: incorrect type
> in assignment (different base types)
> drivers/net/ethernet/renesas/ravb_main.c:771:20:    expected restricted
> __sum16 [usertype] csum_proto
> drivers/net/ethernet/renesas/ravb_main.c:771:20:    got restricted __wsum
> drivers/net/ethernet/renesas/ravb_main.c:774:21: warning: incorrect type
> in assignment (different base types)
> drivers/net/ethernet/renesas/ravb_main.c:774:21:    expected restricted
> __sum16 [usertype] csum_ip_hdr
> drivers/net/ethernet/renesas/ravb_main.c:774:21:    got restricted __wsum

I have reproduced this issue and the warning is fixed by replacing
__sum16->__wsum.

I will send v2 with this fix.

Cheers,
Biju

